object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'IPStack Location Example'
  ClientHeight = 554
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    395
    554)
  PixelsPerInch = 96
  TextHeight = 19
  object Location: TTMSFNCLocation
    Left = 309
    Top = 472
    Width = 26
    Height = 26
    Visible = True
    Logging = True
    Connection = lcHTTP
    OnGetLocation = LocationGetLocation
    APIKey = ''
    LocationRequests = <>
    Service = lsIPStack
  end
  object btnLookup: TButton
    Left = 258
    Top = 521
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Lookup'
    TabOrder = 1
    OnClick = btnLookupClick
  end
  object txtContinent: TAdvEdit
    Left = 8
    Top = 32
    Width = 379
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Continent'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtCountry: TAdvEdit
    Left = 8
    Top = 88
    Width = 379
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Country'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtRegion: TAdvEdit
    Left = 8
    Top = 144
    Width = 379
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Region'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtPostalCode: TAdvEdit
    Left = 8
    Top = 200
    Width = 113
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Postal Code'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtIP: TAdvEdit
    Left = 8
    Top = 256
    Width = 379
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'IP'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtIPType: TAdvEdit
    Left = 8
    Top = 312
    Width = 379
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'IP Type'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object Map: TTMSFNCMaps
    Left = 8
    Top = 345
    Width = 244
    Height = 201
    ParentDoubleBuffered = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = True
    TabOrder = 8
    APIKey = ''
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.ShowZoomControl = False
    Options.ShowMapTypeControl = False
    Options.ZoomOnDblClick = False
  end
  object txtLatitude: TAdvEdit
    Left = 268
    Top = 368
    Width = 119
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Latitude'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtLongitude: TAdvEdit
    Left = 268
    Top = 424
    Width = 119
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Longitude'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
  object txtCity: TAdvEdit
    Left = 136
    Top = 200
    Width = 251
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'City'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans Mono'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Anchors = [akLeft, akTop, akRight]
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Droid Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Text = ''
    Visible = True
    Version = '3.5.4.4'
  end
end
