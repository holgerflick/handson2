object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = Map
  Caption = 'FNC Maps: Draw GPX from a file'
  ClientHeight = 418
  ClientWidth = 759
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Droid Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 18
  object Map: TTMSFNCMaps
    Left = 0
    Top = 114
    Width = 759
    Height = 304
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
    Service = msAzureMaps
  end
  object Panel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4474440
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.5.10.3'
    UIStyle = tsOffice2019White
    BorderColor = clNone
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clNone
    Caption.Font.Height = -15
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 0
    Caption.ShadeLight = 255
    Caption.Text = 'ABC'
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 4473924
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = clWhite
    StatusBar.GradientDirection = gdVertical
    Text = ''
    DesignSize = (
      759
      65)
    FullHeight = 72
    object btnOpen: TAdvGlowButton
      Left = 20
      Top = 3
      Width = 133
      Height = 56
      Caption = 'API Keys...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      Images = imgButtons
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Rounded = False
      TabOrder = 0
      OnClick = btnOpenClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clWhite
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
      UIStyle = tsOffice2019White
    end
    object cbServices: TAdvComboBox
      Left = 376
      Top = 33
      Width = 360
      Height = 26
      Color = clWhite
      Version = '1.9.7.5'
      Visible = True
      Anchors = [akLeft, akTop, akRight]
      ButtonWidth = 17
      Style = csDropDownList
      FlatLineColor = 11250603
      EmptyTextStyle = []
      FocusFontColor = 4474440
      DropWidth = 0
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4474440
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = -1
      LabelCaption = 'Services:'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = 4474440
      LabelFont.Height = -16
      LabelFont.Name = 'Droid Sans Mono'
      LabelFont.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cbServicesClick
      UIStyle = tsOffice2019White
    end
    object btnShow: TAdvGlowButton
      Left = 159
      Top = 3
      Width = 178
      Height = 56
      Caption = 'Open GPX file...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      Images = imgButtons
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Rounded = False
      TabOrder = 2
      OnClick = btnShowClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clWhite
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
      UIStyle = tsOffice2019White
    end
  end
  object AdvDockPanel1: TAdvDockPanel
    Left = 0
    Top = 65
    Width = 759
    Height = 49
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    UseRunTimeHeight = False
    Version = '6.7.1.4'
    object AdvToolBar1: TAdvToolBar
      Left = 3
      Top = 1
      Width = 97
      Height = 34
      UIStyle = tsOffice2019White
      AllowFloating = True
      Caption = 'Route'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowRightHandle = False
      ShowClose = False
      ShowOptionIndicator = False
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ParentOptionPicture = False
      ToolBarIndex = -1
      object btnColorSelector: TAdvOfficeColorSelector
        Left = 9
        Top = 2
        Width = 42
        Height = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Rounded = False
        Version = '1.6.3.1'
        TabOrder = 1
        AllowFloating = False
        CloseOnSelect = False
        CaptionAppearance.BorderColor = clNone
        CaptionAppearance.Color = clWhite
        CaptionAppearance.ColorTo = clNone
        CaptionAppearance.Direction = gdHorizontal
        CaptionAppearance.TextColor = 4474440
        CaptionAppearance.TextColorHot = clBlack
        CaptionAppearance.TextColorDown = clBlack
        CaptionAppearance.ButtonAppearance.ColorChecked = 16111818
        CaptionAppearance.ButtonAppearance.ColorCheckedTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorDisabled = 15921906
        CaptionAppearance.ButtonAppearance.ColorDisabledTo = 15921906
        CaptionAppearance.ButtonAppearance.ColorDown = 16111818
        CaptionAppearance.ButtonAppearance.ColorDownTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorHot = 16117985
        CaptionAppearance.ButtonAppearance.ColorHotTo = 16372402
        CaptionAppearance.ButtonAppearance.ColorMirror = clSilver
        CaptionAppearance.ButtonAppearance.ColorMirrorTo = clWhite
        CaptionAppearance.ButtonAppearance.ColorMirrorHot = 16107693
        CaptionAppearance.ButtonAppearance.ColorMirrorHotTo = 16775412
        CaptionAppearance.ButtonAppearance.ColorMirrorDown = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorDownTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorChecked = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorCheckedTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabled = 11974326
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabledTo = 15921906
        DragGripAppearance.BorderColor = clGray
        DragGripAppearance.Color = clWhite
        DragGripAppearance.ColorTo = clWhite
        DragGripAppearance.ColorMirror = clWhite
        DragGripAppearance.ColorMirrorTo = clWhite
        DragGripAppearance.Gradient = ggVertical
        DragGripAppearance.GradientMirror = ggVertical
        DragGripAppearance.BorderColorHot = 14925219
        DragGripAppearance.ColorHot = clWhite
        DragGripAppearance.ColorHotTo = clWhite
        DragGripAppearance.ColorMirrorHot = clWhite
        DragGripAppearance.ColorMirrorHotTo = clWhite
        DragGripAppearance.GradientHot = ggRadial
        DragGripAppearance.GradientMirrorHot = ggRadial
        DragGripPosition = gpTop
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
        SelectedColor = clNone
        ShowRGBHint = True
        BorderDropDownColor = 12895944
        ColorDropDown = 16251129
        ColorDropDownFloating = 16374724
        SelectionAppearance.BorderColorHot = 15917525
        SelectionAppearance.BorderColorDown = 14925219
        SelectionAppearance.BorderColorChecked = 14925219
        SelectionAppearance.ColorChecked = 15917525
        SelectionAppearance.ColorCheckedTo = 15917525
        SelectionAppearance.ColorDisabled = 15921906
        SelectionAppearance.ColorDisabledTo = 15921906
        SelectionAppearance.ColorDown = 14925219
        SelectionAppearance.ColorDownTo = 14925219
        SelectionAppearance.ColorHot = 15917525
        SelectionAppearance.ColorHotTo = 15917525
        SelectionAppearance.ColorMirror = clWhite
        SelectionAppearance.ColorMirrorTo = clWhite
        SelectionAppearance.ColorMirrorHot = 15917525
        SelectionAppearance.ColorMirrorHotTo = 15917525
        SelectionAppearance.ColorMirrorDown = 14925219
        SelectionAppearance.ColorMirrorDownTo = 14925219
        SelectionAppearance.ColorMirrorChecked = 15917525
        SelectionAppearance.ColorMirrorCheckedTo = 15917525
        SelectionAppearance.ColorMirrorDisabled = 11974326
        SelectionAppearance.ColorMirrorDisabledTo = 15921906
        SelectionAppearance.GradientHot = ggVertical
        SelectionAppearance.GradientMirrorHot = ggVertical
        SelectionAppearance.GradientDown = ggVertical
        SelectionAppearance.GradientMirrorDown = ggVertical
        SelectionAppearance.GradientChecked = ggVertical
        SelectionAppearance.TextColorChecked = 4474440
        SelectionAppearance.TextColorDown = 4474440
        SelectionAppearance.TextColorHot = 4474440
        SelectionAppearance.TextColorDisabled = clGray
        SelectionAppearance.TextColor = clBlack
        SelectionAppearance.Rounded = False
        Tools = <
          item
            BackGroundColor = clBlack
            Caption = 'Automatic'
            CaptionAlignment = taCenter
            Enable = True
            Hint = 'Automatic'
            ImageIndex = -1
            ItemType = itFullWidthButton
          end
          item
            BackGroundColor = clBlack
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13209
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13107
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13056
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6697728
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clNavy
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 3486515
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 3355443
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clMaroon
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 26367
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clOlive
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clGreen
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clTeal
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clBlue
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10053222
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clGray
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clRed
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 39423
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 52377
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6723891
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13421619
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16737843
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clPurple
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10066329
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clFuchsia
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 52479
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clYellow
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clLime
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clAqua
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16763904
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6697881
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clSilver
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13408767
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10079487
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10092543
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13434828
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16777164
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16764057
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16751052
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clWhite
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = -2
            Caption = 'More Colors...'
            CaptionAlignment = taCenter
            Enable = True
            Hint = 'More Colors'
            ImageIndex = -1
            ItemType = itFullWidthButton
          end>
        OnSelectColor = btnColorSelectorSelectColor
      end
      object btnPenWidthSelector: TAdvOfficePenWidthSelector
        Left = 51
        Top = 2
        Width = 42
        Height = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Rounded = False
        Version = '1.6.3.1'
        TabOrder = 0
        AllowFloating = False
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
        BorderDropDownColor = 12895944
        CaptionAppearance.BorderColor = clNone
        CaptionAppearance.Color = clWhite
        CaptionAppearance.ColorTo = clNone
        CaptionAppearance.Direction = gdHorizontal
        CaptionAppearance.TextColor = 4474440
        CaptionAppearance.TextColorHot = clBlack
        CaptionAppearance.TextColorDown = clBlack
        CaptionAppearance.ButtonAppearance.ColorChecked = 16111818
        CaptionAppearance.ButtonAppearance.ColorCheckedTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorDisabled = 15921906
        CaptionAppearance.ButtonAppearance.ColorDisabledTo = 15921906
        CaptionAppearance.ButtonAppearance.ColorDown = 16111818
        CaptionAppearance.ButtonAppearance.ColorDownTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorHot = 16117985
        CaptionAppearance.ButtonAppearance.ColorHotTo = 16372402
        CaptionAppearance.ButtonAppearance.ColorMirror = clSilver
        CaptionAppearance.ButtonAppearance.ColorMirrorTo = clWhite
        CaptionAppearance.ButtonAppearance.ColorMirrorHot = 16107693
        CaptionAppearance.ButtonAppearance.ColorMirrorHotTo = 16775412
        CaptionAppearance.ButtonAppearance.ColorMirrorDown = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorDownTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorChecked = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorCheckedTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabled = 11974326
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabledTo = 15921906
        DragGripAppearance.BorderColor = clGray
        DragGripAppearance.Color = clWhite
        DragGripAppearance.ColorTo = clWhite
        DragGripAppearance.ColorMirror = clWhite
        DragGripAppearance.ColorMirrorTo = clWhite
        DragGripAppearance.Gradient = ggVertical
        DragGripAppearance.GradientMirror = ggVertical
        DragGripAppearance.BorderColorHot = 14925219
        DragGripAppearance.ColorHot = clWhite
        DragGripAppearance.ColorHotTo = clWhite
        DragGripAppearance.ColorMirrorHot = clWhite
        DragGripAppearance.ColorMirrorHotTo = clWhite
        DragGripAppearance.GradientHot = ggRadial
        DragGripAppearance.GradientMirrorHot = ggRadial
        CloseOnSelect = False
        ColorDropDown = 16251129
        ColorDropDownFloating = 16374724
        DragGripPosition = gpTop
        SelectedIndex = -1
        SelectionAppearance.BorderColorHot = 15917525
        SelectionAppearance.BorderColorDown = 14925219
        SelectionAppearance.BorderColorChecked = 14925219
        SelectionAppearance.ColorChecked = 15917525
        SelectionAppearance.ColorCheckedTo = 15917525
        SelectionAppearance.ColorDisabled = 15921906
        SelectionAppearance.ColorDisabledTo = 15921906
        SelectionAppearance.ColorDown = 14925219
        SelectionAppearance.ColorDownTo = 14925219
        SelectionAppearance.ColorHot = 15917525
        SelectionAppearance.ColorHotTo = 15917525
        SelectionAppearance.ColorMirror = clWhite
        SelectionAppearance.ColorMirrorTo = clWhite
        SelectionAppearance.ColorMirrorHot = 15917525
        SelectionAppearance.ColorMirrorHotTo = 15917525
        SelectionAppearance.ColorMirrorDown = 14925219
        SelectionAppearance.ColorMirrorDownTo = 14925219
        SelectionAppearance.ColorMirrorChecked = 15917525
        SelectionAppearance.ColorMirrorCheckedTo = 15917525
        SelectionAppearance.ColorMirrorDisabled = 11974326
        SelectionAppearance.ColorMirrorDisabledTo = 15921906
        SelectionAppearance.GradientHot = ggVertical
        SelectionAppearance.GradientMirrorHot = ggVertical
        SelectionAppearance.GradientDown = ggVertical
        SelectionAppearance.GradientMirrorDown = ggVertical
        SelectionAppearance.GradientChecked = ggVertical
        SelectionAppearance.TextColorChecked = 4474440
        SelectionAppearance.TextColorDown = 4474440
        SelectionAppearance.TextColorHot = 4474440
        SelectionAppearance.TextColorDisabled = clGray
        SelectionAppearance.TextColor = clBlack
        SelectionAppearance.Rounded = False
        Tools = <
          item
            Caption = '1/4 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 0
          end
          item
            Caption = '1/2 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 1
          end
          item
            Caption = '3/4 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 2
          end
          item
            Caption = '1 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 3
          end
          item
            Caption = '1 1/2 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 4
          end
          item
            Caption = '2 1/4 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 5
          end
          item
            Caption = '3 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 6
          end
          item
            Caption = '4 1/2 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 7
          end
          item
            Caption = '6 pt'
            CaptionAlignment = taLeftJustify
            Enable = True
            ImageIndex = 8
          end>
        OnSelect = btnPenWidthSelectorSelect
      end
    end
  end
  object imgButtons: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 1
        CollectionName = 'open'
        Disabled = False
        Name = 'open'
      end
      item
        CollectionIndex = 7
        Disabled = False
        Name = 'route'
      end>
    ImageCollection = Resources.CollectionImages
    Width = 48
    Height = 48
    Left = 88
    Top = 144
  end
  object dlgOpen: TFileOpenDialog
    DefaultExtension = '.config'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'API Keys'
        FileMask = '*.config'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Title = 'Open configuration file'
    Left = 184
    Top = 144
  end
  object FormStyler: TAdvFormStyler
    AppColor = 14851584
    Style = tsOffice2019White
    AppStyle = Resources.AppStyler
    Left = 312
    Top = 144
  end
  object dlgOpenGPX: TFileOpenDialog
    DefaultExtension = '.gpx'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Routes'
        FileMask = '*.gpx'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Title = 'Open configuration file'
    Left = 184
    Top = 224
  end
end
