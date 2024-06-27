program FontName_Extractor;

uses
  Vcl.Forms,
  Main.View in 'Main.View.pas' {MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
