object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'FNC Maps: Event logger'
  ClientHeight = 729
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Map: TTMSFNCMaps
    Left = 0
    Top = 0
    Width = 852
    Height = 408
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnMapInitialized = MapMapInitialized
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Service = msOpenLayers
  end
  object Log: TMemo
    Left = 0
    Top = 408
    Width = 852
    Height = 321
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    Lines.Strings = (
      'Log')
    ParentFont = False
    TabOrder = 1
  end
end
