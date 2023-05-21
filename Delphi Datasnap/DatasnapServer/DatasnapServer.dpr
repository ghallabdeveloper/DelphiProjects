program DatasnapServer;

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Main_Form in 'Main_Form.pas' {MainForm},
  Method_Admin in 'Method_Admin.pas' {MethodAdmin: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

