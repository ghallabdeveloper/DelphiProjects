object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 536
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 296
    ExplicitTop = 8
    ExplicitWidth = 185
    object SpeedButton1: TSpeedButton
      Left = 592
      Top = 1
      Width = 63
      Height = 39
      Align = alRight
      Caption = 'exit'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 504
      Top = 1
      Width = 88
      Height = 39
      Align = alRight
      Caption = 'OpenDB'
      OnClick = SpeedButton2Click
      ExplicitTop = -3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 656
    Height = 152
    Align = alTop
    Caption = 'l'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 88
      Width = 49
      Height = 13
      Caption = 'County ID'
    end
    object Label2: TLabel
      Left = 336
      Top = 88
      Width = 69
      Height = 13
      Caption = 'Country Name'
    end
    object DBGrCountry: TDBGrid
      Left = 1
      Top = 120
      Width = 654
      Height = 31
      Align = alBottom
      DataSource = dsCountry
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 654
      Height = 41
      Align = alTop
      Caption = 'Counrty'
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 9
    end
    object Panel7: TPanel
      Left = 1
      Top = 42
      Width = 654
      Height = 41
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 50
      object DBNavigator3: TDBNavigator
        Left = 1
        Top = 1
        Width = 448
        Height = 39
        DataSource = dsCountry
        Align = alLeft
        TabOrder = 0
      end
    end
    object DBEdit1: TDBEdit
      Left = 96
      Top = 88
      Width = 161
      Height = 21
      DataField = 'County_ID'
      DataSource = dsCountry
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 440
      Top = 89
      Width = 193
      Height = 21
      DataField = 'County_Name'
      DataSource = dsCountry
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 193
    Width = 656
    Height = 343
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    ExplicitLeft = 304
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label3: TLabel
      Left = 32
      Top = 96
      Width = 33
      Height = 13
      Caption = 'City ID'
    end
    object Label4: TLabel
      Left = 344
      Top = 96
      Width = 49
      Height = 13
      Caption = 'City Name'
    end
    object Label5: TLabel
      Left = 24
      Top = 131
      Width = 69
      Height = 13
      Caption = 'Country Name'
    end
    object DBGCirty: TDBGrid
      Left = 1
      Top = 160
      Width = 654
      Height = 182
      Align = alBottom
      DataSource = DsCity
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 654
      Height = 41
      Align = alTop
      Caption = 'City'
      TabOrder = 1
      ExplicitLeft = 240
      ExplicitTop = 120
      ExplicitWidth = 185
    end
    object Panel6: TPanel
      Left = 1
      Top = 42
      Width = 654
      Height = 41
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 50
      object DBNavigator2: TDBNavigator
        Left = 1
        Top = 1
        Width = 448
        Height = 39
        DataSource = DsCity
        Align = alLeft
        TabOrder = 0
      end
    end
    object DBEdit3: TDBEdit
      Left = 104
      Top = 96
      Width = 161
      Height = 21
      DataField = 'City_ID'
      DataSource = DsCity
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 448
      Top = 97
      Width = 193
      Height = 21
      DataField = 'City_Name'
      DataSource = DsCity
      TabOrder = 4
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 320
    Width = 161
    Height = 21
    DataField = 'CountyID'
    DataSource = DsCity
    KeyField = 'County_ID'
    ListField = 'County_Name'
    ListSource = DsQCounty
    TabOrder = 3
  end
  object Conn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=TestDB;Data Source=WINCTRL-VS' +
      '9CSJK\SQLSERVER2014;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 576
    Top = 32
  end
  object dbCountry: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 'select * from Country'
    Parameters = <>
    Left = 96
    Top = 32
  end
  object dbCity: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 'select * from City'
    DataSource = dsCountry
    IndexFieldNames = 'CountyID'
    MasterFields = 'County_ID'
    Parameters = <>
    Left = 152
    Top = 424
    object dbCityCity_ID: TIntegerField
      FieldName = 'City_ID'
    end
    object dbCityCity_Name: TWideStringField
      FieldName = 'City_Name'
      FixedChar = True
      Size = 10
    end
    object dbCityCountyID: TIntegerField
      FieldName = 'CountyID'
    end
    object dbCityCountyName: TStringField
      FieldKind = fkLookup
      FieldName = 'CountyName'
      LookupDataSet = QCounty
      LookupKeyFields = 'County_ID'
      LookupResultField = 'County_Name'
      KeyFields = 'CountyID'
      Lookup = True
    end
  end
  object dsCountry: TDataSource
    DataSet = dbCountry
    Left = 208
    Top = 32
  end
  object DsCity: TDataSource
    DataSet = dbCity
    Left = 240
    Top = 440
  end
  object QCounty: TADOQuery
    Active = True
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Country')
    Left = 480
    Top = 369
    object QCountyCounty_ID: TIntegerField
      FieldName = 'County_ID'
    end
    object QCountyCounty_Name: TWideStringField
      FieldName = 'County_Name'
      FixedChar = True
      Size = 10
    end
  end
  object DsQCounty: TDataSource
    DataSet = QCounty
    Left = 488
    Top = 433
  end
end
