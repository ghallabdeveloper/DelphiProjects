unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniMultiItem, uniComboBox, uniLabel, uniButton, uniBitBtn, uniSpeedButton,uniStrUtils,
  dxGDIPlusClasses, uniImage;

type
  TMainForm = class(TUniForm)
    UniPanel1: TUniPanel;
    btnLogin: TUniSpeedButton;
    UniPanel2: TUniPanel;
    UniLabel1: TUniLabel;
    ThemeComboBox: TUniComboBox;
    UniImage1: TUniImage;
    btnLanguage: TUniSpeedButton;
    btnMainMenu: TUniSpeedButton;
    pnlMenu: TUniPanel;
    btnPOSInvoice: TUniSpeedButton;
    btnItemsList: TUniSpeedButton;
    procedure UniFormCreate(Sender: TObject);
    procedure ThemeComboBoxChange(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnMainMenuClick(Sender: TObject);
    procedure btnItemsListClick(Sender: TObject);
    procedure btnPOSInvoiceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule, Sec_Log, Database_connection, Item_list, Pos_Invoice;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ThemeComboBoxChange(Sender: TObject);
begin
  UniMainModule.Theme := ThemeComboBox.Text;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
var
  S : TUniStringArray;
  I : Integer;
begin
  S := UniServerModule.ThemeManager.AllThemes;

  ThemeComboBox.Items.Clear;
  for I := Low(S) to High(S) do
    ThemeComboBox.Items.Add(S[I]);

end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  if not UniMainModule.CheckDBconnection() then
    DataBaseConnectionGet.Show()
  



end;

procedure TMainForm.btnMainMenuClick(Sender: TObject);
begin
  pnlMenu.Visible := not    pnlMenu.Visible;
end;

procedure TMainForm.btnItemsListClick(Sender: TObject);
begin
   ItemsList.show();
end;

procedure TMainForm.btnLoginClick(Sender: TObject);
begin

  if not UniMainModule.CheckDBconnection() then
    DataBaseConnectionGet.Show()
  else if UniMainModule.mUserName ='0' then
  Begin
        AppLog( procedure(Sender: TComponent; AResult: Integer)
      begin
        if AResult = mrOk then
        begin
           btnMainMenu.Visible := True;

        end;
      end );

  End;
end;

procedure TMainForm.btnPOSInvoiceClick(Sender: TObject);
begin
POSInvoice.show();
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
