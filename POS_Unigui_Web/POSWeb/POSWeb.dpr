{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  POSWeb;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Vcl.Themes,
  Vcl.Styles,
  Sec_Log in 'Sources\Security\Sec_Log.pas' {SecLogin: TUniForm},
  Database_connection in 'Sources\Database\Database_connection.pas' {DataBaseConnectionGet: TUniForm},
  Item_list in 'Sources\Items\Item_list.pas' {ItemsList: TUniForm},
  Pos_Invoice in 'Sources\Operation\Pos_Invoice.pas' {POSInvoice: TUniForm},
  Items_Search in 'Sources\Items\Items_Search.pas' {ItemsSearch: TUniForm},
  Export_Rep in 'Sources\Fastreport\Export_Rep.pas' {ExportRep: TUniForm};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Title := 'POS Web Ssystem';
  TStyleManager.TrySetStyle('Amakrits');
  Application.Run;
{$endif}
end.
