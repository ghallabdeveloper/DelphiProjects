unit Item_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, dxGDIPlusClasses, uniImage, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniPanel, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniEdit, uniDBEdit, uniBasicGrid, uniDBGrid,
  unimDBListGrid, unimDBGrid, siComp;

type
  TItemsList = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel3: TUniPanel;
    UniImage1: TUniImage;
    fddb1: TFDQuery;
    dsdb1: TDataSource;
    btnClose: TUniSpeedButton;
    UniPanel4: TUniPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    Toolbar2: TUniPanel;
    btnLast: TUniSpeedButton;
    btnNext: TUniSpeedButton;
    btnPrior: TUniSpeedButton;
    btnFirst: TUniSpeedButton;
    btnPrint: TUniSpeedButton;
    btnGoto: TUniSpeedButton;
    btnRefresh: TUniSpeedButton;
    btnCancel: TUniSpeedButton;
    btnAdd: TUniSpeedButton;
    btnDel: TUniSpeedButton;
    btnSave: TUniSpeedButton;
    UniDBGrid1: TUniDBGrid;
    siLang1: TsiLang;
    procedure btn_OKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnbuttonclick(Sender: TObject);
    procedure fddb1AfterCancel(DataSet: TDataSet);
    procedure fddb1AfterClose(DataSet: TDataSet);
    procedure fddb1AfterDelete(DataSet: TDataSet);
    procedure fddb1AfterEdit(DataSet: TDataSet);
    procedure fddb1AfterInsert(DataSet: TDataSet);
    procedure fddb1AfterOpen(DataSet: TDataSet);
    procedure fddb1AfterPost(DataSet: TDataSet);
    procedure fddb1AfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure RefreshDBButton;
    { Private declarations }
  public
    { Public declarations }
  end;

function ItemsList: TItemsList;

procedure ItemsListView();
implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function ItemsList: TItemsList;
begin
  Result := TItemsList(UniMainModule.GetFormInstance(TItemsList));
end;

procedure ItemsListView();
begin
  with TItemsList(UniMainModule.GetFormInstance(TItemsList)) do
  begin
    UniMainModule.Settable('select * from item_list', fddb1);
       RefreshDBButton;
    Show();

  end;
end;

procedure TItemsList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TItemsList.btn_OKClick(Sender: TObject);
begin
  Close
end;

procedure TItemsList.fddb1AfterCancel(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterClose(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterDelete(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterEdit(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterInsert(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterOpen(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterPost(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.fddb1AfterScroll(DataSet: TDataSet);
begin
  RefreshDBButton;
end;

procedure TItemsList.btnbuttonclick(Sender: TObject);
begin

if fddb1.Active =false then
 Exit;
  if Sender = btnSave then
  begin
  fddb1.Post;
  end
  else if Sender = btnCancel then
  begin
    fddb1.Cancel;
  end
  else if Sender = btnAdd then
  begin
    fddb1.Insert;
  end
  else if Sender = btnDel then
  begin
    fddb1.Delete;
  end
  else if Sender = btnFirst then
  begin
    fddb1.First;
  end
  else if Sender = btnNext then
  begin
  fddb1.Next;
  end
  else if Sender = btnPrior then
  begin
  fddb1.Prior;
  end
  else if Sender = btnLast then
  begin
fddb1.Last;
  end;

    RefreshDBButton;
end;

procedure TItemsList.RefreshDBButton;
begin

  btnSave.Enabled := False;
  btnCancel.Enabled := False;
  btnAdd.Enabled := False;
  btnDel.Enabled := False;
  btnFirst.Enabled := False;
  btnNext.Enabled := False;
  btnPrior.Enabled := False;
  btnLast.Enabled := False;
  if fddb1.Active then
  Begin
    if fddb1.State in [dsEdit, dsInsert] then
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
end;

procedure TItemsList.UniFormCreate(Sender: TObject);
begin
Self.RTL := UniMainModule.RTL;
end;

end.
