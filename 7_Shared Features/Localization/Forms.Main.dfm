object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'FNC Maps: Localization'
  ClientHeight = 268
  ClientWidth = 539
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
    Top = 57
    Width = 519
    Height = 201
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    OnMapInitialized = MapMapInitialized
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    ExplicitTop = 176
    ExplicitWidth = 832
    ExplicitHeight = 225
  end
  object cbLanguages: TComboBox
    AlignWithMargins = True
    Left = 30
    Top = 10
    Width = 479
    Height = 27
    Margins.Left = 30
    Margins.Top = 10
    Margins.Right = 30
    Margins.Bottom = 10
    Align = alTop
    Style = csDropDownList
    TabOrder = 1
    OnChange = cbLanguagesChange
    ExplicitWidth = 792
  end
end