unit Main_Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls;

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
    DBNavigator3: TDBNavigator;
    dbCityCity_ID: TIntegerField;
    dbCityCity_Name: TWideStringField;
    dbCityCountyID: TIntegerField;
    QCounty: TADOQuery;
    DsQCounty: TDataSource;
    QCountyCounty_ID: TIntegerField;
    QCountyCounty_Name: TWideStringField;
    dbCityCountyName: TStringField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

end.
