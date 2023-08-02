unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, inifiles, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TUniMainModule = class(TUniGUIMainModule)
    DBConn: TFDConnection;
    FDQuery1: TFDQuery;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    mUserName: string;
    pserverPath: string;
    mdbdatabaseName: string;
    mdbserverName, mdbUserName, mdbPassword: string;
    { Public declarations }
    function CheckDBconnection(): Boolean;
    procedure SaveDBSetting();
    procedure readDBSetting();
    function getfirdacconectionString(): string;
    function OpenRecordSer(SQL: string; Readonly: Boolean): TFDQuery;
    procedure Settable(SQL: string; var fquery: TFDQuery);
    function Dlookup(tablename: string; Fieldname: string; cri: string)
      : Variant;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

function TUniMainModule.CheckDBconnection: Boolean;
begin
  Result := false;
  if DBConn.Connected then
  Begin
    Result := True;
    Exit;
  End;

  readDBSetting();
  try
    // DBConn.ConnectionString := getfirdacconectionString();
    // DBConn.Params.Clear;
    with DBConn.Params do
    Begin
      AddPair('DriverID', 'MSSQL');
      AddPair('Server', mdbserverName);
      AddPair('User_Name', mdbUserName);
      AddPair('Password=', mdbPassword);
      AddPair('Database=', mdbdatabaseName);
      AddPair('MetaDefSchema', 'dbo');
      AddPair('MetaDefCatalog', mdbdatabaseName);
      Add('OSAuthent=No');

    End;
    // DBConn.Connected := True;
    DBConn.LoginPrompt := false;
    DBConn.Open;
  except
    on E: Exception do
    Begin

      Result := false;
      Exit;
    End;
  end;

  if DBConn.Connected then
  Begin
    Result := True;
    Exit;
  End;

end;

function TUniMainModule.getfirdacconectionString: string;
var
  ConnectionString: string;
begin
  ConnectionString := 'DriverID=MSSQL;Server=' + mdbserverName + ';Database=' +
    mdbdatabaseName + ';User_name=' + mdbUserName + ';Password=' + mdbPassword;
end;

procedure TUniMainModule.readDBSetting;
var
  IniFile: TIniFile;
begin
  try
    IniFile := TIniFile.Create(pserverPath + '\POSWeb.ini');
    mdbdatabaseName := IniFile.ReadString('Connection', 'dbname', '');
    mdbserverName := IniFile.ReadString('Connection', 'servername', '');
    mdbUserName := IniFile.ReadString('Connection', 'username', '');
    mdbPassword := IniFile.ReadString('Connection', 'password', '');
  except

  end;
end;

procedure TUniMainModule.SaveDBSetting;
var
  IniFile: TIniFile;
begin
  try
    IniFile := TIniFile.Create(pserverPath + '\POSWeb.ini');
    IniFile.WriteString('Connection', 'dbname', mdbdatabaseName);
    IniFile.WriteString('Connection', 'servername', mdbserverName);
    IniFile.WriteString('Connection', 'username', mdbUserName);
    IniFile.WriteString('Connection', 'password', mdbPassword);
  except

  end;
  // aWorkTime := IniFile.ReadString('Filename', 'Work Time', '<none>');
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  mUserName := '0';
  pserverPath := ExtractFilePath(UniServerModule.StartPath);
end;

{$REGION 'db Operation '}

function TUniMainModule.OpenRecordSer(SQL: string; Readonly: Boolean): TFDQuery;
var
  fquery: TFDQuery;
begin
  try
    fquery := TFDQuery.Create(DBConn);
    fquery.Connection := DBConn;
    if fquery.Active then
      fquery.Active := false;

    fquery.SQL.Text := SQL;
    fquery.Open();
    If ReadOnly Then
      fquery.UpdateOptions.LockMode := lmPessimistic
    Else
      fquery.UpdateOptions.LockMode := lmOptimistic;

  except
    on E: Exception do
    Begin

      Result := nil;
      Exit;
    End;
  end;

end;

function TUniMainModule.Dlookup(tablename, Fieldname, cri: string): Variant;

var
  fquery: TFDQuery;
  SQL: string;
begin
  Result := 0;
  try
    fquery := TFDQuery.Create(DBConn);
    fquery.Connection := DBConn;
    if fquery.Active then
      fquery.Active := false;
    SQL := 'select ' + Fieldname + ' from ' + tablename;
    if cri <> '' then
      SQL := SQL + ' where ' + cri;

    fquery.SQL.Text := SQL;
    fquery.Open();
    if not fquery.IsEmpty then
    begin
      if not fquery.Fields[0].IsNull then
        Result := fquery.Fields[0].Value;
    end;
    fquery.Close;
    FreeAndNil(fquery);

  except
    on E: Exception do
    Begin

      Result := false;
      Exit;
    End;
  end;

end;

procedure TUniMainModule.Settable(SQL: string; var fquery: TFDQuery);
begin
  try

    fquery.Connection := DBConn;
    if fquery.Active then
      fquery.Active := false;

    fquery.SQL.Text := SQL;
    fquery.Open();
    // If ReadOnly Then
    // fquery.UpdateOptions.LockMode := lmPessimistic
    // Else
    // fquery.UpdateOptions.LockMode := lmOptimistic;

  except
    on E: Exception do
    Begin

      Exit;
    End;
  end;
end;
{$ENDREGION}

initialization

RegisterMainModuleClass(TUniMainModule);

end.
