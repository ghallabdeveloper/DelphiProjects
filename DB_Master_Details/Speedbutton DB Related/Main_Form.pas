unit Main_Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    Conn: TADOConnection;
    dbCountry: TADODataSet;
    dbCity: TADODataSet;
    dsCountry: TDataSource;
    DsCity: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrCountry: TDBGrid;
    DBGCirty: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBNavigator2: TDBNavigator;
    Panel7: TPanel;
    dbCityCity_ID: TIntegerField;
    dbCityCity_Name: TWideStringField;
    dbCityCountyID: TIntegerField;
    QCounty: TADOQuery;
    DsQCounty: TDataSource;
    QCountyCounty_ID: TIntegerField;
    QCountyCounty_Name: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dbCityCountyName: TStringField;
    btnDelete: TSpeedButton;
    btnAdd: TSpeedButton;
    btnCancel: TSpeedButton;
    btnSave: TSpeedButton;
    Bevel1: TBevel;
    btnLast: TSpeedButton;
    btnPrior: TSpeedButton;
    btnNext: TSpeedButton;
    btnFirst: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure QCountyAfterCancel(DataSet: TDataSet);
    procedure QCountyAfterDelete(DataSet: TDataSet);
    procedure QCountyAfterClose(DataSet: TDataSet);
    procedure QCountyAfterEdit(DataSet: TDataSet);
    procedure QCountyAfterInsert(DataSet: TDataSet);
    procedure QCountyAfterOpen(DataSet: TDataSet);
    procedure QCountyAfterPost(DataSet: TDataSet);
    procedure QCountyAfterScroll(DataSet: TDataSet);
    procedure QCountyNewRecord(DataSet: TDataSet);
  private
      procedure RefreshButton();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnFirstClick(Sender: TObject);
begin
  dbCountry.First
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Close
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
   Conn.Connected := True;
   QCounty.Active           := True;
   dbCountry.Active := True;
   dbCity.Active := True;

end;

procedure TForm1.btnAddClick(Sender: TObject);
begin
 try
  dbCountry.Insert;
 except

 end;
 RefreshButton;
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  dbCountry.Delete;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  dbCountry.Cancel;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
begin

  try
  dbCountry.Post;
 except

 end;
 RefreshButton;
end;

procedure TForm1.QCountyAfterCancel(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterClose(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterDelete(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterEdit(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterInsert(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterOpen(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterPost(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyAfterScroll(DataSet: TDataSet);
begin
RefreshButton;
end;

procedure TForm1.QCountyNewRecord(DataSet: TDataSet);
begin
  RefreshButton;
end;

procedure TForm1.RefreshButton;
begin
  btnSave.Enabled := False;
  btnCancel.Enabled := False;
  btnDelete.Enabled := False;
  btnAdd.Enabled := False;
  btnFirst.Enabled := False;
  btnPrior.Enabled := False;
  btnNext.Enabled := False;
  btnLast.Enabled := False;
  if  not dbCountry.Active  then
    Exit;
    btnFirst.Enabled := true;
  btnPrior.Enabled := true;
  btnNext.Enabled := true;
  btnLast.Enabled := true;
  if dbCountry.State in [dsEdit,dsInsert] then
  begin
          btnSave.Enabled := true;
  btnCancel.Enabled := true;
  btnDelete.Enabled := False;
  btnAdd.Enabled := False;
  end
  else
  begin
          btnSave.Enabled := False;
  btnCancel.Enabled := False;
  btnDelete.Enabled := true;
  btnAdd.Enabled := true;
  end;

end;

procedure TForm1.btnLastClick(Sender: TObject);
begin
  dbCountry.Last;
end;

procedure TForm1.btnPriorClick(Sender: TObject);
begin
  dbCountry.Prior
end;

procedure TForm1.btnNextClick(Sender: TObject);
begin
  dbCountry.Next
end;


end.
