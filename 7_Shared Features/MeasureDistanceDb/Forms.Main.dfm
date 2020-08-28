object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'FNC Maps: Distance calculation and visualization'
  ClientHeight = 461
  ClientWidth = 753
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object panTop: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 137
    Align = alTop
    TabOrder = 0
    DesignSize = (
      753
      137)
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 160
      Height = 19
      Caption = '1: Select a club'
    end
    object Label2: TLabel
      Left = 16
      Top = 71
      Width = 170
      Height = 19
      Caption = '2: Select a racer'
    end
    object cbClubs: TDBLookupComboBox
      Left = 16
      Top = 33
      Width = 726
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsClubs
      TabOrder = 0
      OnClick = cbClubsClick
    end
    object cbRacers: TDBLookupComboBox
      Left = 16
      Top = 96
      Width = 726
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'Id'
      ListField = 'Name'
      ListSource = dsRacers
      TabOrder = 1
      OnClick = cbRacersClick
    end
  end
  object panBottom: TPanel
    Left = 0
    Top = 137
    Width = 753
    Height = 324
    Align = alClient
    TabOrder = 1
    object AdvSplitter1: TAdvSplitter
      Left = 401
      Top = 1
      Height = 322
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = 12895944
      Appearance.ColorTo = 12895944
      Appearance.ColorHot = 15917525
      Appearance.ColorHotTo = 15917525
      GripStyle = sgDots
      ExplicitLeft = 504
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Map: TTMSFNCMaps
      AlignWithMargins = True
      Left = 414
      Top = 11
      Width = 328
      Height = 302
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
      Options.ShowZoomControl = False
      Options.ShowMapTypeControl = False
    end
    object Grid: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 400
      Height = 322
      Cursor = crDefault
      Align = alLeft
      ColCount = 4
      DefaultRowHeight = 25
      DrawingStyle = gdsClassic
      FixedColor = clWhite
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      ScrollBars = ssBoth
      TabOrder = 1
      OnDblClick = GridDblClick
      GridLineColor = 13948116
      GridFixedLineColor = 11250603
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = 4474440
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 11565130
      ActiveCellColorTo = 11565130
      BorderColor = 11250603
      ControlLook.FixedGradientFrom = clWhite
      ControlLook.FixedGradientTo = clWhite
      ControlLook.FixedGradientMirrorFrom = clWhite
      ControlLook.FixedGradientMirrorTo = clWhite
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientHoverMirrorFrom = clWhite
      ControlLook.FixedGradientHoverMirrorTo = clWhite
      ControlLook.FixedGradientHoverBorder = 11645361
      ControlLook.FixedGradientDownFrom = clWhite
      ControlLook.FixedGradientDownTo = clWhite
      ControlLook.FixedGradientDownMirrorFrom = clWhite
      ControlLook.FixedGradientDownMirrorTo = clWhite
      ControlLook.FixedGradientDownBorder = 11250603
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Larger than'
        'Smaller than'
        'Clear')
      FixedRowHeight = 25
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = 3881787
      FixedFont.Height = -16
      FixedFont.Name = 'Droid Sans Mono'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
      HTMLSettings.ImageFolder = 'images'
      HTMLSettings.ImageBaseName = 'img'
      Look = glCustom
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.ColorTo = clWhite
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SearchFooter.ResultFormat = '(%d of %d)'
      SelectionColor = 13744549
      SortSettings.DefaultFormat = ssAutomatic
      SortSettings.HeaderColor = clWhite
      SortSettings.HeaderColorTo = clWhite
      SortSettings.HeaderMirrorColor = clWhite
      SortSettings.HeaderMirrorColorTo = clWhite
      Version = '8.5.4.2'
    end
  end
  object dsClubs: TDataSource
    DataSet = DBController.Clubs
    Left = 680
    Top = 32
  end
  object dsRacers: TDataSource
    DataSet = DBController.Racers
    Left = 680
    Top = 88
  end
end
