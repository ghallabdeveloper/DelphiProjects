object ExportRep: TExportRep
  Left = 0
  Top = 0
  ClientHeight = 294
  ClientWidth = 549
  Caption = 'ExportRep'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 0
    Width = 549
    Height = 294
    Hint = ''
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    ExplicitLeft = -141
    ExplicitWidth = 690
    ExplicitHeight = 276
    object UniButton1: TUniButton
      Left = 0
      Top = 269
      Width = 549
      Height = 25
      Hint = ''
      Caption = 'Close'
      Align = alBottom
      TabOrder = 1
      OnClick = UniButton1Click
      ExplicitTop = 251
      ExplicitWidth = 690
    end
  end
  object frxReport1: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43010.943467418980000000
    ReportOptions.LastChange = 43010.943467418980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 181
    Top = 176
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbeddedFonts = True
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = True
    PDFStandard = psPDFA_3a
    PDFVersion = pv17
    Left = 277
    Top = 182
  end
  object siLang_MainForm: TsiLang
    Version = '7.6.0.1'
    StringsTypes.Strings = (
      'TIB_STRINGLIST'
      'TSTRINGLIST')
    NumOfLanguages = 3
    LangDispatcher = UniMainModule.siLangDispatcher1
    LangDelim = 1
    LangNames.Strings = (
      'English'
      'Arabic'
      '')
    Language = 'English'
    ExcludedProperties.Strings = (
      'Category'
      'SecondaryShortCuts'
      'HelpKeyword'
      'InitialDir'
      'HelpKeyword'
      'ActivePage'
      'ImeName'
      'DefaultExt'
      'FileName'
      'FieldName'
      'PickList'
      'DisplayFormat'
      'EditMask'
      'KeyList'
      'LookupDisplayFields'
      'DropDownSpecRow'
      'TableName'
      'DatabaseName'
      'IndexName'
      'MasterFields'
      'SQL'
      'DeleteSQL'
      'UpdateSQL'
      'ModifySQL'
      'KeyFields'
      'LookupKeyFields'
      'LookupResultField'
      'DataField'
      'KeyField'
      'ListField')
    Left = 244
    Top = 60
    TranslationData = {
      73007400430061007000740069006F006E0073005F0055006E00690063006F00
      640065000D000A0073007400480069006E00740073005F0055006E0069006300
      6F00640065000D000A007300740044006900730070006C00610079004C006100
      620065006C0073005F0055006E00690063006F00640065000D000A0073007400
      46006F006E00740073005F0055006E00690063006F00640065000D000A007300
      74004D0075006C00740069004C0069006E00650073005F0055006E0069006300
      6F00640065000D000A006600720078005200650070006F007200740031002E00
      530063007200690070007400540065007800740001002C006200650067006900
      6E002C002C0065006E0064002E00010001000D000A007300740044006C006700
      7300430061007000740069006F006E0073005F0055006E00690063006F006400
      65000D000A005700610072006E0069006E00670001005700610072006E006900
      6E00670001002A062D0630064A063106010001000D000A004500720072006F00
      720001004500720072006F00720001002E0637062306010001000D000A004900
      6E0066006F0072006D006100740069006F006E00010049006E0066006F007200
      6D006100740069006F006E000100450639064406480645062906010001000D00
      0A0043006F006E006600690072006D00010043006F006E006600690072006D00
      01002A06230643064A062F06010001000D000A00590065007300010026005900
      6500730001004606390645062000010001000D000A004E006F00010026004E00
      6F00010044062706010001000D000A004F004B0001004F004B00010045064806
      270641064206010001000D000A00430061006E00630065006C00010043006100
      6E00630065006C000100270644063A0627062106010001000D000A0041006200
      6F007200740001002600410062006F007200740001002E06310648062C060100
      01000D000A005200650074007200790001002600520065007400720079000100
      2706390627062F06290620002706440645062D06270648064406290601000100
      0D000A00490067006E006F007200650001002600490067006E006F0072006500
      01002A062C06270647064406010001000D000A0041006C006C00010026004100
      6C006C0001002706440643064406010001000D000A004E006F00200054006F00
      200041006C006C0001004E0026006F00200074006F00200041006C006C000100
      44064A06330620002706440643064406010001000D000A005900650073002000
      54006F00200041006C006C000100590065007300200074006F00200026004100
      6C006C000100460639064506200027064406430644062000010001000D000A00
      480065006C00700001002600480065006C007000010045063306270639062F06
      2906010001000D000A007300740053007400720069006E00670073005F005500
      6E00690063006F00640065000D000A00730074004F0074006800650072005300
      7400720069006E00670073005F0055006E00690063006F00640065000D000A00
      540046006100730074005200650070006F0072007400530068006F0077002E00
      4C00610079006F007500740001006100620073006F006C007500740065000100
      01000D000A006600720078005200650070006F007200740031002E0049006E00
      6900460069006C00650001005C0053006F006600740077006100720065005C00
      460061007300740020005200650070006F00720074007300010001000D000A00
      6600720078005200650070006F007200740031002E0053006300720069007000
      74004C0061006E00670075006100670065000100500061007300630061006C00
      530063007200690070007400010001000D000A00660072007800520065007000
      6F007200740031002E00560065007200730069006F006E00010035002E003400
      2E003600010001000D000A006600720078005000440046004500780070006F00
      7200740031002E0041007500740068006F007200010046006100730074005200
      650070006F0072007400010001000D000A006600720078005000440046004500
      780070006F007200740031002E005300750062006A0065006300740001004600
      6100730074005200650070006F00720074002000500044004600200065007800
      70006F0072007400010001000D000A00730074004C006F00630061006C006500
      73005F0055006E00690063006F00640065000D000A007300740043006F006C00
      6C0065006300740069006F006E0073005F0055006E00690063006F0064006500
      0D000A0073007400430068006100720053006500740073005F0055006E006900
      63006F00640065000D000A00}
  end
end