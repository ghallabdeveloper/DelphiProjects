unit Pos_Invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, dxGDIPlusClasses, uniImage, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniDBEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, siComp;

type
  TPOSInvoice = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniImage1: TUniImage;
    UniPanel5: TUniPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniDBGrid1: TUniDBGrid;
    UniLabel6: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    FDQInvoice: TFDQuery;
    FDQInvoice_Details: TFDQuery;
    dsInvoise: TDataSource;
    dsInvoice_Details: TDataSource;
    UniPanel6: TUniPanel;
    btnSave2: TUniSpeedButton;
    btnCancel2: TUniSpeedButton;
    btnAdd2: TUniSpeedButton;
    btnDel2: TUniSpeedButton;
    Toolbar2: TUniPanel;
    btnLast: TUniSpeedButton;
    btnPrior: TUniSpeedButton;
    btnNext: TUniSpeedButton;
    btnFirst: TUniSpeedButton;
    btnPrint: TUniSpeedButton;
    btnReject: TUniSpeedButton;
    btnCancel: TUniSpeedButton;
    btnAdd: TUniSpeedButton;
    btnDel: TUniSpeedButton;
    btnSave: TUniSpeedButton;
    siLang1: TsiLang;
    btnRefresh: TUniSpeedButton;
    btnGoto: TUniSpeedButton;
    btnClose: TUniSpeedButton;
    procedure btnButtonClick(Sender: TObject);
    procedure btnButton2Click(Sender: TObject);
    procedure FDQInvoiceAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure FDQInvoiceAfterInsert(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterInsert(DataSet: TDataSet);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnGotoClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FDQInvoiceAfterCancel(DataSet: TDataSet);
    procedure FDQInvoiceAfterClose(DataSet: TDataSet);
    procedure FDQInvoiceAfterDelete(DataSet: TDataSet);
    procedure FDQInvoiceAfterEdit(DataSet: TDataSet);
    procedure FDQInvoiceAfterPost(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterCancel(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterClose(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterDelete(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterEdit(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterPost(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterScroll(DataSet: TDataSet);
  private
    procedure RefreshDBButton;
    { Private declarations }
  public
    { Public declarations }
  end;
   procedure POSInvoiceView();
function POSInvoice: TPOSInvoice;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Items_Search;

function POSInvoice: TPOSInvoice;
begin
  Result := TPOSInvoice(UniMainModule.GetFormInstance(TPOSInvoice));
end;
 procedure POSInvoiceView();
begin
  with TPOSInvoice(UniMainModule.GetFormInstance(TPOSInvoice)) do
  begin
    
    Show();

  end;
end;
procedure TPOSInvoice.btnButtonClick(Sender: TObject);
begin

if FDQInvoice.Active =false then
 Exit;
  if Sender = btnSave then
  begin
  FDQInvoice.Post;
  end
  else if Sender = btnCancel then
  begin
    FDQInvoice.Cancel;
  end
  else if Sender = btnAdd then
  begin
    FDQInvoice.Insert;
  end
  else if Sender = btnDel then
  begin
    FDQInvoice.Delete;
  end
  else if Sender = btnFirst then
  begin
    FDQInvoice.First;
  end
  else if Sender = btnNext then
  begin
  FDQInvoice.Next;
  end
  else if Sender = btnPrior then
  begin
  FDQInvoice.Prior;
  end
  else if Sender = btnLast then
  begin
FDQInvoice.Last;
  end;
      FDQInvoice.EnableControls;
    RefreshDBButton;//
end;

procedure TPOSInvoice.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TPOSInvoice.btnGotoClick(Sender: TObject);
begin
UniMainModule.Settable('select * from Inoivce', FDQInvoice);
          FDQInvoice.First;    FDQInvoice.EnableControls;
       RefreshDBButton;
end;

procedure TPOSInvoice.btnRefreshClick(Sender: TObject);
begin
UniMainModule.Settable('select * from Inoivce', FDQInvoice);
       RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterCancel(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterClose(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterDelete(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterEdit(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterInsert(DataSet: TDataSet);
begin
 FDQInvoice.FieldByName('invoiceId').Value:=  UniMainModule. GetNextId('Inoivce','invoiceId','');
end;

procedure TPOSInvoice.FDQInvoiceAfterPost(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoiceAfterScroll(DataSet: TDataSet);
begin
try
FDQInvoice_Details.Close;
UniMainModule.Settable('select * from Invoice_Detials', FDQInvoice_Details);
       RefreshDBButton;
except

end;

end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterCancel(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterClose(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterDelete(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterEdit(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterInsert(DataSet: TDataSet);
begin
      FDQInvoice_Details.FieldByName('invoiceId').Value:=    FDQInvoice.FieldByName('invoiceId').Value;
      FDQInvoice_Details.FieldByName('row_Id').Value:=
      UniMainModule. GetNextId('Invoice_Detials','row_Id','invoiceId='+ FDQInvoice.FieldByName('invoiceId').AsString);

      ItemsSearchView(procedure(Sender: TComponent; AResult: Integer)
      begin
        if AResult = mrOk then
        begin
          FDQInvoice_Details.FieldByName('ItemId').Value:=    (Sender as TItemsSearch) .FDQSearch.fieldByName('item_Id').value;
    FDQInvoice_Details.FieldByName('Name').Value:=            (Sender as TItemsSearch) .FDQSearch.fieldByName('Name').value;
    FDQInvoice_Details.FieldByName('Qty').Value:=1;
    FDQInvoice_Details.FieldByName('price').Value:=            (Sender as TItemsSearch) .FDQSearch.fieldByName('price').value;


        end;
      end );     RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterPost(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterScroll(DataSet: TDataSet);
begin
RefreshDBButton;
end;

procedure TPOSInvoice.btnButton2Click(Sender: TObject);
begin

if FDQInvoice_Details.Active =false then
 Exit;
  if Sender = btnSave2 then
  begin
  FDQInvoice_Details.Post;
  end
  else if Sender = btnCancel2 then
  begin
    FDQInvoice_Details.Cancel;
  end
  else if Sender = btnAdd2 then
  begin
    FDQInvoice_Details.Insert;
  end
  else if Sender = btnDel2 then
  begin
    FDQInvoice_Details.Delete;
  end
;


    RefreshDBButton;//
end;
 procedure TPOSInvoice.RefreshDBButton;
begin
    btnSave2.Enabled := False;
  btnCancel2.Enabled := False;
  btnAdd2.Enabled := False;
  btnDel2.Enabled := False;
  btnSave.Enabled := False;
  btnCancel.Enabled := False;
  btnAdd.Enabled := False;
  btnDel.Enabled := False;
  btnFirst.Enabled := False;
  btnNext.Enabled := False;
  btnPrior.Enabled := False;
  btnLast.Enabled := False;
  if FDQInvoice.Active then
  Begin
    if FDQInvoice.State in [dsEdit, dsInsert] then
    begin
      btnSave.Enabled := true;
      btnCancel.Enabled := true;
    end
    else
    begin
      btnAdd.Enabled := true;
      btnDel.Enabled := true;
      btnFirst.Enabled := true;
      btnNext.Enabled := true;
      btnPrior.Enabled := true;
      btnLast.Enabled := true;
    end;
  End;
   if FDQInvoice_Details.Active then
  Begin
    if FDQInvoice_Details.State in [dsEdit, dsInsert] then
    begin
      btnSave2.Enabled := true;
      btnCancel2.Enabled := true;
    end
    else
    begin
      btnAdd2.Enabled := true;
      btnDel2.Enabled := true;

    end;
  End;
end;

procedure TPOSInvoice.UniFormCreate(Sender: TObject);
begin
    Self.RTL := UniMainModule.RTL;
    UniMainModule.Settable('select * from Inoivce', FDQInvoice);
           FDQInvoice.Insert;
           FDQInvoice.Cancel;

       RefreshDBButton;
end;

end.
