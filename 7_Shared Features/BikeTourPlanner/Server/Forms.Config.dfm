object FrmConfig: TFrmConfig
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Configuration'
  ClientHeight = 191
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    591
    191)
  PixelsPerInch = 96
  TextHeight = 19
  object btCancel: TAdvGlowButton
    Left = 445
    Top = 142
    Width = 138
    Height = 41
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    Rounded = True
    TabOrder = 0
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
  end
  object btOK: TAdvGlowButton
    Left = 285
    Top = 142
    Width = 138
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    Rounded = True
    TabOrder = 1
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
  end
  object txtFolderName: TAdvDirectoryEdit
    Left = 8
    Top = 32
    Width = 575
    Height = 27
    BorderColor = 11250603
    EditorEnabled = False
    EmptyText = 'Please select data directory.'
    EmptyTextStyle = [fsItalic]
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Data Directory'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans'
    LabelFont.Style = [fsBold]
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
    Font.Name = 'Droid Sans'
    Font.Style = []
    ParentFont = False
    ShortCut = 0
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '1.6.2.0'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Flat = False
    Etched = False
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDB7B76F67676767676767676767B7FDFD6FFDBFBFBFBF
      BFBFBFBFBFB7FD6FFDFD6FFDBFBFBFBFBF7F7F7F7777FD6FFDFD6FFDBFBFBFBF
      BFBFBFBF7F7FFD6FFDFD6FFDFDFDBFBFBFBFBFBFBF7FFD6FFDFD6FFDFDFDFDFD
      BFBFBFBFBFBFFD6FFDFD6FFDB76F6FAFFDFDFDFDFDFDFD6FFDFD6FFDBFBFBFB7
      6F6F6F6F6F6F6F6F525277FDBFBFBFBFFD9BF79B52F75AA49B4977FDFDFDFDFD
      FD9BF5A35B6D9BF5A35177B7B7B7B7B7779BF5F7A4089BEDF75AFDFDFDFDFDFD
      FD9B9B5252A452525249FDFDFDFDFDFDFDF75AED9BA39AF75AA4FDFDFDFDFDFD
      FDFD9BA352A452A452FDFDFDFDFDFDFDFDFDFDA39B089B9BFDFD}
    ButtonCaption = 'Select'
    ReadOnly = False
    ButtonColor = clWhite
    ButtonColorHot = 15917525
    ButtonColorDown = 14925219
    ButtonTextColor = 4474440
    ButtonTextColorHot = 2303013
    ButtonTextColorDown = 2303013
    AllowShares = True
    BrowseDialogText = 'Select Directory'
  end
  object txtURI: TAdvEdit
    Left = 8
    Top = 96
    Width = 575
    Height = 27
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Server Root URI'
    LabelPosition = lpTopLeft
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Droid Sans'
    LabelFont.Style = [fsBold]
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
    Font.Name = 'Droid Sans'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'http://+:80/'
    Visible = True
    Version = '3.5.4.3'
  end
end
