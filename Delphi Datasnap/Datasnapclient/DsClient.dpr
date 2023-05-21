program DsClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  main_form in 'main_form.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
