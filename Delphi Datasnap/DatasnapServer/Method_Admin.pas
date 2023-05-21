unit Method_Admin;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.Win.ADODB,
  Datasnap.Provider, Data.FMTBcd, Data.SqlExpr, Data.DBXMSSQL;

type
  TMethodAdmin = class(TDSServerModule)
    Conn: TADOConnection;
    dsAgr: TADODataSet;
    ProviderAgr: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    SQLConnection1: TSQLConnection;
    dsAgrList_id: TSmallintField;
    dsAgrItem_id: TSmallintField;
    dsAgrName_a: TStringField;
    dsAgrName_e: TStringField;
    dsAgrCan_Del: TBooleanField;
    dsAgrCan_Edit: TBooleanField;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

procedure TMethodAdmin.DSServerModuleCreate(Sender: TObject);
begin
Conn.Connected  := True;
dsAgr.Active := True;


end;

function TMethodAdmin.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TMethodAdmin.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

