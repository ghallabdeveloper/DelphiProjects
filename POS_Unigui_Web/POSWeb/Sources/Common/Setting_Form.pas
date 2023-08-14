unit Setting_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniSpeedButton, uniLabel,
  uniGUIBaseClasses, uniPanel, siComp, uniImage, uniEdit, uniGUIServerForm,
  uniFileUpload;

type
  TSettingForm = class(TUniForm)
    UniPanel4: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel2: TUniPanel;
    btn_Cancel: TUniSpeedButton;
    btn_OK: TUniSpeedButton;
    UniPanel1: TUniPanel;
    L01: TUniLabel;
    FirmName: TUniEdit;
    L02: TUniLabel;
    Address: TUniEdit;
    L03: TUniLabel;
    Phone: TUniEdit;
    x60Label5: TUniLabel;
    FooterText: TUniEdit;
    L04: TUniLabel;
    Fax: TUniEdit;
    Img: TUniImage;
    btnAdd: TUniSpeedButton;
    btnDel: TUniSpeedButton;
    UniFileUpload1: TUniFileUpload;
    siLang_MainForm: TsiLang;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure btnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SettingForm: TSettingForm;
procedure SettingFormView();
implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Common_Classes, ServerModule;

function SettingForm: TSettingForm;
begin
  Result := TSettingForm(UniMainModule.GetFormInstance(TSettingForm));
end;

procedure SettingFormView();
begin
  with TSettingForm(UniMainModule.GetFormInstance(TSettingForm)) do
  begin

    ShowModal();

  end;
end;
procedure TSettingForm.btnAddClick(Sender: TObject);
begin
UniFileUpload1.Execute;
end;

procedure TSettingForm.btnDelClick(Sender: TObject);
begin
 Img.Picture := nil;
  UniMainModule.SetupData.LogoPath := '';
end;

procedure TSettingForm.btn_CancelClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TSettingForm.btn_OKClick(Sender: TObject);
begin
ModalResult := mrOk;
  with UniMainModule do
  begin
     SetupData.FirmInfo_Name := FirmName.Text;
    SetupData.FirmInfo_Address := Address.Text;
    SetupData.FirmInfo_Phone := Phone.Text;
    SetupData.FirmInfo_Fax := Fax.Text;
    SetupData.FirmInfo_Name := FirmName.Text;
 SetupData.FooterText:=       FooterText.Text ;
  end;
  //Save setupdata

end;

procedure TSettingForm.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);

var
  DestName: string;
  DestFolder, Ext, LogoPath: string;
  IsImage: Boolean;
begin
  IsImage := True;
  DestFolder := UniServerModule.StartPath + 'files\';
  try
    if not DirectoryExists(DestFolder) then
      CreateDir(DestFolder);
  Except

  end;
  Ext := ExtractFileExt(UniFileUpload1.Filename);

  DestFolder := UniServerModule.StartPath + 'files\';
  DestName := DestFolder + ExtractFileName( UniFileUpload1.Filename);
  // ExtractFileName(UniFileUpload1.FileName);
  // UniLabel4.Caption:='File Name: '+UniFileUpload1.FileName;
  CopyFile(PChar(AStream.Filename), PChar(DestName), False);
  // ShowMessage('File: '+UniFileUpload1.FileName+' Uploaded to folder: '+DestFolder);
  Img.Picture.LoadFromFile(AStream.Filename);
  DestName := ExtractFileName(DestName);
  UniMainModule.SetupData.LogoPath := DestName;
  // Ext := ExtractFileExt(UniFileUpload1.Filename);
  // LogoPath := imgL.Upload_Non_Table_Image(pb1, Img, OD.Filename, '',  'Photo', False);
  // imgL.LoadImagesNonTable(Img, 'Photo', LogoPath);
end;

procedure TSettingForm.UniFormCreate(Sender: TObject);
begin
 Self.RTL := UniMainModule.RTL;

  // ReadSetup Data
 with UniMainModule do
 Begin
  FirmName.Text := SetupData.FirmInfo_Name;
  Address.Text := SetupData.FirmInfo_Address;
  Phone.Text := SetupData.FirmInfo_Phone;
  Fax.Text := SetupData.FirmInfo_Fax;
   if SetupData.LogoPath <> '' then
    Img.Picture.LoadFromFile(UniServerModule.StartPath + 'files\' +
      SetupData.LogoPath);

  FirmName.Text := SetupData.FirmInfo_Name;
  FooterText.Text := SetupData.FooterText;
 End;
end;

end.
