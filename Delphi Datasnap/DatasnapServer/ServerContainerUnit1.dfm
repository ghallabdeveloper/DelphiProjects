object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object Server: TDSServer
    AutoStart = False
    Left = 96
    Top = 11
  end
  object TCP: TDSTCPServerTransport
    Port = 2013
    Server = Server
    Filters = <>
    Left = 96
    Top = 73
  end
  object Http: TDSHTTPService
    HttpPort = 8090
    Server = Server
    Filters = <>
    Left = 96
    Top = 135
  end
  object MethodAdmin: TDSServerClass
    OnGetClass = MethodAdminGetClass
    Server = Server
    Left = 200
    Top = 43
  end
end
