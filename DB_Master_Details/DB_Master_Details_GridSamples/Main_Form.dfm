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
    Height = 224
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrCountry: TDBGrid
      Left = 1
      Top = 83
      Width = 654
      Height = 140
      Align = alClient
      DataSource = dsCountry
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 265
    Width = 656
    Height = 271
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    ExplicitLeft = 304
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGCirty: TDBGrid
      Left = 1
      Top = 83
      Width = 654
      Height = 187
      Align = alClient
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
    Left = 104
    Top = 352
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
    Left = 168
    Top = 320
  end
  object QCounty: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Country')
    Left = 408
    Top = 385
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
    Left = 488
    Top = 393
  end
end
