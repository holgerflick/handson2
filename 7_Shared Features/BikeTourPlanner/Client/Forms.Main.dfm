object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Width = 662
  Height = 313
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans'
  Font.Style = []
  TabOrder = 1
  OnShow = WebFormShow
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 49
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsNone
    Color = clWhite
    object cbLevel: TWebComboBox
      Left = 3
      Top = 16
      Width = 246
      Height = 22
      OnChange = cbLevelChange
      ItemIndex = -1
    end
    object cbTour: TWebComboBox
      Left = 264
      Top = 16
      Width = 177
      Height = 22
      ItemIndex = -1
    end
    object btnDisplay: TWebButton
      Left = 447
      Top = 3
      Width = 186
      Height = 40
      Caption = 'Display'
      ChildOrder = 2
      OnClick = btnDisplayClick
    end
  end
  object Map: TTMSFNCMaps
    Left = 0
    Top = 49
    Width = 662
    Height = 264
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
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost:80'
    OnConnect = ConnectionConnect
    Left = 112
    Top = 128
  end
  object Client: TXDataWebClient
    Connection = Connection
    OnLoad = ClientLoad
    Left = 192
    Top = 136
  end
end
