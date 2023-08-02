unit Sec_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, Vcl.Buttons, uniLabel,
  uniButton, uniBitBtn, uniSpeedButton, uniEdit, dxGDIPlusClasses, uniImage,
  uniGUIDialogs;

type
  TSecLogin = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniLabel1: TUniLabel;
    btn_OK: TUniSpeedButton;
    btn_Cancel: TUniSpeedButton;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edtUserName: TUniEdit;
    edtUserPass: TUniEdit;
    UniImage1: TUniImage;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SecLogin: TSecLogin;
procedure AppLog(CallBack: TUniDialogCallBackAnonProc);

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SecLogin: TSecLogin;
begin
  Result := TSecLogin(UniMainModule.GetFormInstance(TSecLogin));
end;

procedure TSecLogin.btn_CancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TSecLogin.btn_OKClick(Sender: TObject);
var
  str : string;

begin
    if (trim (edtUserName.Text )<> '' ) and ((trim (edtUserPass.Text )<> '')) then
    begin
     str :=UniMainModule.Dlookup('userlist','User_Password',
      'User_Name='''+edtUserName.Text+ ''' ') ;
      if edtUserPass.Text = str then
      begin


    ModalResult := mrOk;
      end
      else
       self.MessageDlg('Erorr wrong username or password ', mtError, [mbOK], nil);

    end
    else
    Begin
       self.MessageDlg('Erorr wrong username or password ', mtError, [mbOK], nil);

    End;
end;

procedure AppLog(CallBack: TUniDialogCallBackAnonProc);
begin
     with TSecLogin(UniMainModule.GetFormInstance(TSecLogin))do
     begin
       ShowModal(CallBack);

     end;
end;


end.
