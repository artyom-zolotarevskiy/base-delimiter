object homeForm: ThomeForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Base delimiter by Artem Zolotarevskiy'
  ClientHeight = 177
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object labelLoadCount: TsLabel
    Left = 281
    Top = 39
    Width = 6
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = '0'
    ParentBiDiMode = False
  end
  object sLabel2: TsLabel
    Left = 8
    Top = 39
    Width = 87
    Height = 13
    Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1086' '#1089#1090#1088#1086#1082
  end
  object sLabel1: TsLabel
    Left = 8
    Top = 58
    Width = 182
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1074' '#1082#1072#1078#1076#1086#1084' '#1092#1072#1081#1083#1077':'
  end
  object sLabel3: TsLabel
    Left = 8
    Top = 77
    Width = 99
    Height = 13
    Caption = #1055#1086#1083#1091#1095#1080#1090#1089#1103' '#1092#1072#1081#1083#1086#1074':'
  end
  object EndCountFilesLabel: TsLabel
    Left = 281
    Top = 77
    Width = 6
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = '0'
    ParentBiDiMode = False
  end
  object sGauge1: TsGauge
    Left = 0
    Top = 157
    Width = 314
    Height = 20
    Align = alBottom
    ForeColor = clBlack
    Progress = 0
    Suffix = '%'
    ExplicitTop = 103
    ExplicitWidth = 487
  end
  object CopyrightPanel: TsPanel
    Left = 8
    Top = 127
    Width = 300
    Height = 25
    Cursor = crHandPoint
    BevelOuter = bvSpace
    Caption = 'Soft for ScripTop Company by Artem Zolotarevskiy'
    TabOrder = 0
    OnClick = CopyrightPanelClick
  end
  object LoadBtn: TsButton
    Left = 8
    Top = 8
    Width = 300
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 1
    OnClick = LoadBtnClick
  end
  object Unload: TsButton
    Left = 8
    Top = 96
    Width = 300
    Height = 25
    Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100
    TabOrder = 2
    OnClick = UnloadClick
  end
  object CountLinesInOneFileEdit: TsSpinEdit
    Left = 208
    Top = 55
    Width = 100
    Height = 21
    BiDiMode = bdRightToLeft
    Color = 3682598
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16772838
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    TextHint = '0'
    OnChange = CountLinesInOneFileEditChange
    MaxValue = 0
    MinValue = 0
    Value = 0
  end
  object sSkinManager1: TsSkinManager
    InternalSkins = <>
    SkinDirectory = 'Skins'
    SkinName = 'default'
    SkinInfo = '11'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 456
    Top = 72
  end
  object dlgLoad: TsOpenDialog
    Left = 496
    Top = 80
  end
end
