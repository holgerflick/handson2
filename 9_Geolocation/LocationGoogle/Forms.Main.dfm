object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Google Location Example'
  ClientHeight = 403
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
    403)
  PixelsPerInch = 96
  TextHeight = 19
  object Location: TTMSFNCLocation
    Left = 213
    Top = 8
    Width = 26
    Height = 26
    Visible = True
    Logging = True
    Connection = lcHTTP
    OnGetLocation = LocationGetLocation
    APIKey = ''
    LocationRequests = <>
  end
  object btnLookup: TButton
    Left = 258
    Top = 370
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Lookup'
    TabOrder = 1
    OnClick = btnLookupClick
  end
  object Map: TTMSFNCMaps
    Left = 8
    Top = 129
    Width = 379
    Height = 235
    ParentDoubleBuffered = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = True
    TabOrder = 2
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
    Left = 8
    Top = 40
    Width = 379
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
  object txtLongitude: TAdvEdit
    Left = 8
    Top = 96
    Width = 379
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
end
