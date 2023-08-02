object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  Height = 346
  Width = 551
  object DBConn: TFDConnection
    Params.Strings = (
      'Database=POS'
      'Server=WINCTRL-VS9CSJK\SQLSERVER2014'
      'User_Name=sa'
      'Password=123'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 136
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = DBConn
    Left = 352
    Top = 144
  end
end
