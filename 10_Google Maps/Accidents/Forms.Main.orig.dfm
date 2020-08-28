object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 
    'Browse accidents in the US since 2/8/2016  (https://www.kaggle.c' +
    'om/sobhanmoosavi/us-accidents)'
  ClientHeight = 631
  ClientWidth = 899
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 899
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cbStates: TDBLookupComboBox
      Left = 16
      Top = 16
      Width = 297
      Height = 27
      KeyField = 'Code'
      ListField = 'State'
      ListSource = dsStates
      TabOrder = 0
    end
    object btnShowIncidents: TAdvGlowButton
      Left = 511
      Top = 16
      Width = 153
      Height = 27
      Caption = 'Show incidents'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Rounded = True
      TabOrder = 1
      OnClick = btnShowIncidentsClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirror = clSilver
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object dpDate: TAdvDateTimePicker
      Left = 319
      Top = 16
      Width = 186
      Height = 27
      Date = 44034.000000000000000000
      Format = ''
      Time = 0.678240740737237500
      DoubleBuffered = True
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 2
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44034.678240740740000000
      Version = '1.3.5.4'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
    end
  end
  object Map: TTMSFNCGoogleMaps
    Left = 0
    Top = 57
    Width = 899
    Height = 574
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    APIKey = ''
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    KMLLayers = <>
    Clusters = <>
  end
  object dsStates: TDataSource
    DataSet = DBController.QuStates
    Left = 280
    Top = 40
  end
end
