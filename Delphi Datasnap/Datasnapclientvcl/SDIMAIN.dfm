object SDIAppForm: TSDIAppForm
  Left = 197
  Top = 111
  Caption = 'SDI Application'
  ClientHeight = 408
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 4
      Height = 16
    end
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 4
      Height = 16
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 4
      Height = 16
    end
    object Label4: TLabel
      Left = 288
      Top = 24
      Width = 68
      Height = 16
      Caption = 'HostName'
    end
    object rbHttp: TRadioButton
      Left = 146
      Top = 33
      Width = 113
      Height = 17
      Caption = 'Http'
      TabOrder = 2
    end
    object txtHostName: TEdit
      Left = 288
      Top = 56
      Width = 121
      Height = 24
      TabOrder = 4
      Text = 'LocalHost'
    end
    object rbTCP: TRadioButton
      Left = 0
      Top = 33
      Width = 113
      Height = 17
      Caption = 'TCP'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object EditTcpPort: TEdit
      Left = 0
      Top = 56
      Width = 121
      Height = 24
      TabOrder = 1
      Text = '2011'
    end
    object EdithttpPort: TEdit
      Left = 146
      Top = 56
      Width = 121
      Height = 24
      TabOrder = 5
      Text = '8080'
    end
    object Button1: TButton
      Left = 448
      Top = 21
      Width = 121
      Height = 25
      Caption = 'Connect Server'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 448
      Top = 52
      Width = 121
      Height = 25
      Caption = 'Open Db'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 144
    Width = 590
    Height = 233
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'System'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 111
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button3: TButton
    Left = 352
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Conn: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=localhost'
      'Port=8080'
      'Filters={}'
      'CommunicationProtocol=http')
    Connected = True
    Left = 144
    Top = 136
    UniqueId = '{665768E6-786F-45A2-B9F7-F0D746DAD6B3}'
  end
  object MethodAdmin: TDSProviderConnection
    ServerClassName = 'TMethodAdmin'
    Connected = True
    SQLConnection = Conn
    Left = 256
    Top = 128
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'ProviderAgr'
    RemoteServer = MethodAdmin
    Left = 400
    Top = 128
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet1
    Left = 480
    Top = 128
  end
end
