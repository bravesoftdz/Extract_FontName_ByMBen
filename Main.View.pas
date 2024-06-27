unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainView = class(TForm)
    Btn_ExtractFontName: TButton;
    FileOpenDlg_Font: TFileOpenDialog;
    Lbl_FName: TLabel;
    procedure Btn_ExtractFontNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

const
  FR_PRIVATE = $10;
  GFRI_DESCRIPTION = 1;
  GFRI_LOGFONTS = 2;
  GFRI_NUMFACES = 3;

function GetFontResourceInfoW(lpszFilename: PWideChar; var cbBuffer: DWORD; lpBuffer: Pointer; dwQueryType: DWORD): BOOL; stdcall; external gdi32 name 'GetFontResourceInfoW';


function GetFontNameFromFile(const aFontFileName: string): string;
var
  L_FontPath  : PChar;
  L_Buffer    : array[0..255] of Char;
  L_BufferSize: DWORD;
  L_FontCount : Integer;
begin
  Result := '';

  L_FontPath := PChar(aFontFileName);

  // Add font resource to System Session in Private Mode without Install it in Windows Public Folder
  L_FontCount := AddFontResourceEx(L_FontPath, FR_PRIVATE, nil);
  if L_FontCount = 0 then
    raise Exception.Create('Failed to add font resource !!');

  try
    L_BufferSize := SizeOf(L_Buffer);
    if GetFontResourceInfoW(L_FontPath, L_BufferSize, @L_Buffer, GFRI_DESCRIPTION) then
    begin
      SetString(Result, L_Buffer, L_BufferSize div SizeOf(Char));
    end
    else
      raise Exception.Create('Failed to get font resource info');
  finally
    // Remove font resource
    RemoveFontResourceEx(L_FontPath, FR_PRIVATE, nil);
  end;

end;

procedure TMainView.Btn_ExtractFontNameClick(Sender: TObject);
var
  L_FontName: string;
begin
  FileOpenDlg_Font.DefaultFolder := ExtractFilePath(ParamStr(0));

  if FileOpenDlg_Font.Execute then begin
    L_FontName := GetFontNameFromFile(FileOpenDlg_Font.FileName);
    Lbl_FName.Caption := 'Font Name: ' + L_FontName;
  end;

end;

end.
