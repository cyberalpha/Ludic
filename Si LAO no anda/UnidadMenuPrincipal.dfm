object formMenuPrincipal: TformMenuPrincipal
  Left = 185
  Top = 162
  AutoScroll = False
  Caption = 'AjpdSoft Registro OCX y DLL v. 2.2.4.35'
  ClientHeight = 316
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LWEB: TLabel
    Left = 0
    Top = 298
    Width = 459
    Height = 18
    Cursor = crHandPoint
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'M'#225's programas y nuevas versiones en http://www.ajpdsoft.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = LWEBClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 459
    Height = 298
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Registro'
      DesignSize = (
        451
        270)
      object Label1: TLabel
        Left = 15
        Top = 6
        Width = 92
        Height = 13
        Caption = 'Ficheros a registrar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object txtFichero: TMemo
        Left = 15
        Top = 21
        Width = 407
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object bSel: TButton
        Left = 424
        Top = 20
        Width = 26
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelClick
      end
      object bRegistrar: TButton
        Left = 16
        Top = 242
        Width = 66
        Height = 24
        Hint = 'Registra los ficheros seleccionados'
        Anchors = [akLeft, akBottom]
        Caption = '&Registrar'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bRegistrarClick
      end
      object bp: TProgressBar
        Left = 85
        Top = 247
        Width = 337
        Height = 15
        Anchors = [akLeft, akRight, akBottom]
        Min = 0
        Max = 100
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      object txtResultado: TMemo
        Left = 0
        Top = 0
        Width = 451
        Height = 288
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object dlAbrir: TOpenDialog
    Filter = 'OCX (*.ocx)|*.ocx|DLL (*.dll)|*.dll|Todos los archivos (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Seleccione los ficheros a registrar'
    Left = 416
    Top = 72
  end
end
