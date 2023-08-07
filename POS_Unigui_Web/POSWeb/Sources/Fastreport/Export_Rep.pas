unit Export_Rep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxExportXLSX, frxClass, frxExportBaseDialog,
  frxExportPDF, frxChBox, frxDBSet, uniButton, uniGUIBaseClasses, uniURLFrame,
  siComp,ServerModule;

type
  TExportRep = class(TUniForm)
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    siLang_MainForm: TsiLang;
    UniURLFrame1: TUniURLFrame;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ExportReports(Report: TfrxReport);
   procedure PrepareAndShowfn(fn:string);

  end;

function ExportRep: TExportRep;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function ExportRep: TExportRep;
begin
  Result := TExportRep(UniMainModule.GetFormInstance(TExportRep));
end;
procedure TExportRep.PrepareAndShowfn(fn:string);
 var
  fn2:string;
begin
  //UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True)

  fn2 := ExtractFileName(fn);// + ExtractFileExt(fn);
  UniURLFrame1.URL :=  uniServerModule.LocalCacheURL +fn2;
end;

procedure TExportRep.ExportReports(Report: TfrxReport);
var
  AUrl : string;
begin
 Report.PrintOptions.ShowDialog := False;
  Report.ShowProgress := false;

  Report.EngineOptions.SilentMode := True;
  Report.EngineOptions.EnableThreadSafe := True;
  Report.EngineOptions.DestroyForms := False;
  Report.EngineOptions.UseGlobalDataSetList := False;

  frxPDFExport1.Background := True;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True);
  frxPDFExport1.DefaultPath := '';

  Report.PreviewOptions.AllowEdit := False;
  //Report.PrepareReport;
  Report.Export(frxPDFExport1);

  UniURLFrame1.URL := AUrl;
end;

procedure TExportRep.UniButton1Click(Sender: TObject);
begin
  Close;
end;

end.
