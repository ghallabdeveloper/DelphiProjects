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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, siComp, frxClass, frxDBSet;

const
  vatPercent = 15;

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
    FDQInvoiceinvoiceId: TCurrencyField;
    FDQInvoiceTotal_Price: TCurrencyField;
    FDQInvoiceVat: TCurrencyField;
    FDQInvoiceDiscount: TCurrencyField;
    FDQInvoiceNetCost: TCurrencyField;
    FDQInvoiceamount: TCurrencyField;
    FDQInvoiceRemainder: TCurrencyField;
    FDQInvoice_DetailsinvoiceId: TCurrencyField;
    FDQInvoice_Detailsrow_Id: TSmallintField;
    FDQInvoice_DetailsName: TStringField;
    FDQInvoice_DetailsQty: TCurrencyField;
    FDQInvoice_Detailsprice: TCurrencyField;
    FDQInvoice_DetailsItemId: TSmallintField;
    rep: TfrxReport;
    frxDB1: TfrxDBDataset;
    frxDB2: TfrxDBDataset;
    procedure btnButtonClick(Sender: TObject);
    procedure btnButton2Click(Sender: TObject);
    procedure FDQInvoiceAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
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
    procedure FDQInvoiceNewRecord(DataSet: TDataSet);
    procedure FDQInvoice_DetailsNewRecord(DataSet: TDataSet);
    procedure FDQInvoice_DetailsBeforeEdit(DataSet: TDataSet);
    procedure FDQInvoice_DetailsAfterInsert(DataSet: TDataSet);
    procedure FDQInvoiceBeforePost(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
  private
      oldprice :Currency;
   oldqty :Currency;
    procedure RefreshDBButton;
    procedure caltotals;

    procedure openInvoices;

    { Private declarations }
  public
    { Public declarations }
  end;

procedure POSInvoiceView();
function POSInvoice: TPOSInvoice;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Items_Search, Export_Rep;

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

  if FDQInvoice.Active = false then
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
  RefreshDBButton; //
end;

procedure TPOSInvoice.btnCloseClick(Sender: TObject);
begin
  close;
end;


procedure TPOSInvoice.btnGotoClick(Sender: TObject);
begin
  UniMainModule.Settable('select * from Inoivce', FDQInvoice);
  FDQInvoice.First;
  FDQInvoice.EnableControls;
  RefreshDBButton;
end;

procedure TPOSInvoice.btnPrintClick(Sender: TObject);
begin
   //
   if Self.RTL  then
    rep.LoadFromFile(UniMainModule.pserverPath + 'files\reports\invoice_AR.fr3' )
    else
        rep.LoadFromFile(UniMainModule.pserverPath + 'files\reports\invoice.fr3' );
  with    rep.Variables do
  begin
    Variables['_AppName'] :='''' +'POS'+'''' ;
  end;
   if Rep.PrepareReport then
      ExportRep.ExportReports(rep);
end;

procedure TPOSInvoice.btnRefreshClick(Sender: TObject);
begin
  openInvoices();
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

procedure TPOSInvoice.FDQInvoiceAfterPost(DataSet: TDataSet);
begin
  RefreshDBButton;

end;

procedure TPOSInvoice.FDQInvoiceAfterScroll(DataSet: TDataSet);
begin
  try
    FDQInvoice_Details.close;
    UniMainModule.Settable('select * from Invoice_Detials where invoiceId = '+
FDQInvoice.FieldByName('invoiceId').AsString
    , FDQInvoice_Details);
    RefreshDBButton;
//     UniMainModule.  setCurrencyFields('price',FDQInvoice_Details);
//      UniMainModule.  setCurrencyFields('Qty',FDQInvoice_Details);

  except

  end;

end;

procedure TPOSInvoice.FDQInvoiceBeforePost(DataSet: TDataSet);
begin
  FDQInvoice.FieldByName('vat').Value :=
    ((FDQInvoice.FieldByName('Total_Price').Value - FDQInvoice.FieldByName
    ('discount').Value) * vatPercent) / 100;

  FDQInvoice.FieldByName('NetCost').Value :=
    (FDQInvoice.FieldByName('Total_Price').Value - FDQInvoice.FieldByName
    ('discount').Value) + FDQInvoice.FieldByName('vat').Value;
end;

procedure TPOSInvoice.FDQInvoiceNewRecord(DataSet: TDataSet);
begin
  FDQInvoice.FieldByName('invoiceId').Value :=
    UniMainModule.GetNextId('Inoivce', 'invoiceId', '');
  FDQInvoice.FieldByName('Total_Price').Value := 0;
  FDQInvoice.FieldByName('vat').Value := 0;
  FDQInvoice.FieldByName('Discount').Value := 0;
  FDQInvoice.FieldByName('NetCost').Value := 0;
  FDQInvoice.FieldByName('amount').Value := 0;
  FDQInvoice.FieldByName('Remainder').Value := 0;

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
  caltotals();
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterEdit(DataSet: TDataSet);
begin
  RefreshDBButton;
end;
procedure TPOSInvoice.FDQInvoice_DetailsAfterInsert(DataSet: TDataSet);
begin
    oldprice :=  0;
   oldqty :=   0;
end;

procedure TPOSInvoice.caltotals();
 var
  totalPrince :Currency;
Begin
     FDQInvoice.edit;
     totalPrince := UniMainModule.Dlookup('Invoice_Detials' ,'sum(Qty*price)' ,' invoiceId = '+
FDQInvoice.FieldByName('invoiceId').AsString );
  FDQInvoice.FieldByName('Total_Price').Value :=totalPrince;

  FDQInvoice.FieldByName('vat').Value :=
    ((FDQInvoice.FieldByName('Total_Price').Value - FDQInvoice.FieldByName
    ('discount').Value) * vatPercent) / 100;

  FDQInvoice.FieldByName('NetCost').Value :=
    (FDQInvoice.FieldByName('Total_Price').Value - FDQInvoice.FieldByName
    ('discount').Value) + FDQInvoice.FieldByName('vat').Value;
  FDQInvoice.Post;
//  oldprice:= 0;
//  oldqty := 0;
End;
procedure TPOSInvoice.FDQInvoice_DetailsAfterPost(DataSet: TDataSet);
begin
  RefreshDBButton;

   caltotals();
end;

procedure TPOSInvoice.FDQInvoice_DetailsAfterScroll(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TPOSInvoice.FDQInvoice_DetailsBeforeEdit(DataSet: TDataSet);
begin
   //
   oldprice :=   FDQInvoice_Details.FieldByName('price').Value;
   oldqty :=   FDQInvoice_Details.FieldByName('qty').Value;
end;

procedure TPOSInvoice.FDQInvoice_DetailsNewRecord(DataSet: TDataSet);
begin
  FDQInvoice_Details.FieldByName('invoiceId').Value :=
    FDQInvoice.FieldByName('invoiceId').Value;
  FDQInvoice_Details.FieldByName('row_Id').Value :=
    UniMainModule.GetNextId('Invoice_Detials', 'row_Id',
    'invoiceId=' + FDQInvoice.FieldByName('invoiceId').AsString);

  ItemsSearchView(
    procedure(Sender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
      begin
        FDQInvoice_Details.FieldByName('ItemId').Value :=
          (Sender as TItemsSearch).FDQSearch.FieldByName('item_Id').Value;
        FDQInvoice_Details.FieldByName('Name').Value := (Sender as TItemsSearch)
          .FDQSearch.FieldByName('Name').Value;
        FDQInvoice_Details.FieldByName('Qty').Value := 1;
        FDQInvoice_Details.FieldByName('price').Value :=
          (Sender as TItemsSearch).FDQSearch.FieldByName('price').Value;

      end;
    end);
  RefreshDBButton;
end;

procedure TPOSInvoice.btnButton2Click(Sender: TObject);
begin

  if FDQInvoice_Details.Active = false then
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
  end;

  RefreshDBButton; //
end;

procedure TPOSInvoice.RefreshDBButton;
begin
  btnSave2.Enabled := false;
  btnCancel2.Enabled := false;
  btnAdd2.Enabled := false;
  btnDel2.Enabled := false;
  btnSave.Enabled := false;
  btnCancel.Enabled := false;
  btnAdd.Enabled := false;
  btnDel.Enabled := false;
  btnFirst.Enabled := false;
  btnNext.Enabled := false;
  btnPrior.Enabled := false;
  btnLast.Enabled := false;
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

procedure TPOSInvoice.openInvoices();
Begin
  UniMainModule.Settable('select * from Inoivce', FDQInvoice);
    FDQInvoice.Insert;
  FDQInvoice.Cancel;
    RefreshDBButton;
//  UniMainModule.  setCurrencyFields('Total_Price',FDQInvoice);
//        UniMainModule. setCurrencyFields('Vat',FDQInvoice);
//         UniMainModule.    setCurrencyFields('Discount',FDQInvoice);
//             UniMainModule.    setCurrencyFields('NetCost',FDQInvoice);
//                UniMainModule.     setCurrencyFields('amount',FDQInvoice);
//                UniMainModule.                         setCurrencyFields('Remainder',FDQInvoice);

End;
procedure TPOSInvoice.UniFormCreate(Sender: TObject);
begin
  Self.RTL := UniMainModule.RTL;

    openInvoices();


end;


end.
