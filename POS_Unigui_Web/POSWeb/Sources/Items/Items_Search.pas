unit Items_Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm,uniGUIDialogs, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton, uniLabel,
  uniEdit, siComp, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TItemsSearch = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    btn_Cancel: TUniSpeedButton;
    btn_OK: TUniSpeedButton;
    UniPanel4: TUniPanel;
    UniLabel1: TUniLabel;
    edtSerearch: TUniEdit;
    siLang1: TsiLang;
    FDQSearch: TFDQuery;
    DataSource1: TDataSource;
    btnGoto: TUniSpeedButton;
    FDQSearchName: TStringField;
    FDQSearchPrice: TCurrencyField;
    FDQSearchType: TStringField;
    FDQSearchitem_Id: TSmallintField;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnGotoClick(Sender: TObject);
    procedure edtSerearchChange(Sender: TObject);
  private
    procedure SearchItemstext;
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ItemsSearchView(CallBack: TUniDialogCallBackAnonProc);
function ItemsSearch: TItemsSearch;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function ItemsSearch: TItemsSearch;
begin
  Result := TItemsSearch(UniMainModule.GetFormInstance(TItemsSearch));
end;
 procedure ItemsSearchView(CallBack: TUniDialogCallBackAnonProc);
begin
  with TItemsSearch(UniMainModule.GetFormInstance(TItemsSearch)) do
  begin
    //UniMainModule.Settable('select * from Inoivce', FDQInvoice);
      SearchItemstext();
    ShowModal(CallBack);

  end;
end;
procedure TItemsSearch.btn_CancelClick(Sender: TObject);
begin
ModalResult :=   mrCancel;
end;

procedure TItemsSearch.btn_OKClick(Sender: TObject);
begin
ModalResult :=   mrOk;
end;

procedure TItemsSearch.edtSerearchChange(Sender: TObject);
begin
SearchItemstext();
end;

procedure TItemsSearch.UniFormCreate(Sender: TObject);
begin
 Self.RTL := UniMainModule.RTL;
end;
  procedure TItemsSearch.SearchItemstext();
  var
    cri :string;
  begin
    if  Trim(edtSerearch.Text) ='' then
        cri := ''
    else
    cri := ' Where Name like ''' + '%' + trim( edtSerearch.Text) +'%'  + ''' ';
   UniMainModule.Settable('select * from item_list ' +cri, FDQSearch);
//   UniMainModule.  setCurrencyFields('price',FDQSearch);
  end;
procedure TItemsSearch.btnGotoClick(Sender: TObject);
begin
  SearchItemstext();
end;

end.
