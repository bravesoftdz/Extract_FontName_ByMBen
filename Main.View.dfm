object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'MainView'
  ClientHeight = 157
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Bahnschrift SemiLight SemiConde'
  Font.Style = []
  Font.Quality = fqClearTypeNatural
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 23
  object Lbl_FName: TLabel
    Left = 8
    Top = 96
    Width = 114
    Height = 23
    Caption = 'Font Name: %%'
  end
  object Btn_ExtractFontName: TButton
    Left = 8
    Top = 8
    Width = 169
    Height = 57
    Cursor = crHandPoint
    Caption = 'Extract Font Name'
    TabOrder = 0
    OnClick = Btn_ExtractFontNameClick
  end
  object FileOpenDlg_Font: TFileOpenDialog
    DefaultFolder = '.\'
    FavoriteLinks = <>
    FileNameLabel = 'Font Path'
    FileTypes = <
      item
        DisplayName = 'True Type Font'
        FileMask = '*.ttf'
      end
      item
        DisplayName = 'Open Type Font'
        FileMask = '*.otf'
      end
      item
        DisplayName = 'All'
        FileMask = '*.ttf;*.otf'
      end>
    FileTypeIndex = 3
    Options = []
    Left = 240
    Top = 8
  end
end
