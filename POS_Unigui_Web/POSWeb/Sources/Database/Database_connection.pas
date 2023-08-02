unit Database_connection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, dxGDIPlusClasses, uniImage, uniEdit, uniButton,
  uniBitBtn, uniSpeedButton, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TDataBaseConnectionGet = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel2: TUniPanel;
    btn_OK: TUniSpeedButton;
    btn_Cancel: TUniSpeedButton;
    UniPanel3: TUniPanel;
    UniLabel3: TUniLabel;
    edtUserPass: TUniEdit;
    UniLabel2: TUniLabel;
    edtUserName: TUniEdit;
    UniImage1: TUniImage;
    edtServerName: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edtDBName: TUniEdit;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DataBaseConnectionGet: TDataBaseConnectionGet;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function DataBaseConnectionGet: TDataBaseConnectionGet;
begin
  Result := TDataBaseConnectionGet(UniMainModule.GetFormInstance(TDataBaseConnectionGet));
end;

procedure TDataBaseConnectionGet.btn_CancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TDataBaseConnectionGet.btn_OKClick(Sender: TObject);
begin
  UniMainModule.mdbdatabaseName := edtDBName.Text;
  UniMainModule.mdbserverName := edtServerName.Text;
  UniMainModule.mdbUserName := edtUserName.Text;
  UniMainModule.mdbPassword := edtUserPass.Text;


   UniMainModule.SaveDBSetting();
   ModalResult := mrOk;

end;




end.
