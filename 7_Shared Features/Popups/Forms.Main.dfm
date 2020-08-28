object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'FNC Maps: Popup display'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Map: TTMSFNCMaps
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 832
    Height = 350
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    ExplicitHeight = 303
  end
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 852
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 376
    ExplicitWidth = 185
    object btnCloseBridge: TButton
      Left = 10
      Top = 3
      Width = 215
      Height = 30
      Caption = 'Close Bridge Popup'
      TabOrder = 0
      OnClick = btnCloseBridgeClick
    end
    object btnCloseAll: TButton
      Left = 231
      Top = 3
      Width = 215
      Height = 30
      Caption = 'Close all popups'
      TabOrder = 1
      OnClick = btnCloseAllClick
    end
    object btnAdd: TButton
      Left = 452
      Top = 3
      Width = 215
      Height = 30
      Caption = 'Add popups'
      TabOrder = 2
      OnClick = btnAddClick
    end
  end
end
