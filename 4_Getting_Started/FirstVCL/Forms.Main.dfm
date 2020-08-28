object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'Getting Started'
  ClientHeight = 323
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    569
    323)
  PixelsPerInch = 96
  TextHeight = 13
  object Map: TTMSFNCMaps
    Left = 8
    Top = 40
    Width = 553
    Height = 275
    ParentDoubleBuffered = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = True
    TabOrder = 0
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Service = msTomTom
  end
  object btnGoogle: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Google'
    TabOrder = 1
    OnClick = btnGoogleClick
  end
  object btnTomTom: TButton
    Left = 127
    Top = 9
    Width = 113
    Height = 25
    Caption = 'TomTom'
    TabOrder = 2
    OnClick = btnTomTomClick
  end
end
