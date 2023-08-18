unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, inifiles, FireDAC.Phys.MSSQL,
  System.Variants,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, siComp;

const
  App_ver = '1.0.0';

Type
  TAppSetting = record
    FirmInfo_Name: string; // »Ì«‰«  «·„‰‘√… «· Ì  ŸÂ— ›Ì «· ﬁ«—Ì—
    FirmInfo_Address: string;
    FirmInfo_Phone, FirmInfo_Fax: string;
    PhotosPath: string;
    LogoPath: string;
    FooterText: string; // ‰’  –ÌÌ· «·’›Õ…

  end;

type
  TUniMainModule = class(TUniGUIMainModule)
    DBConn: TFDConnection;
    FDQuery1: TFDQuery;
    siLangDispatcher1: TsiLangDispatcher;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    function GetRTLStr(RemoteAddress, BrowserType, BrowserVersion,
      OSType: string): string;
    function CheckTableExist(tblename: string): boolean;

    { Private declarations }
  public

    SetupData: TAppSetting;
    mUserName: string;
    pserverPath: string;
    mdbdatabaseName: string;
    mdbserverName, mdbUserName, mdbPassword: string;
    pRemoteAddress: string;
    pBrowserType: string;
    pBrowserVersion: string;
    pOSType: string;
    { Public declarations }
    function CheckDBconnection(): boolean;
    procedure SaveDBSetting();
    procedure readDBSetting();
    function getfirdacconectionString(): string;
    function OpenRecordSer(SQL: string; Readonly: boolean): TFDQuery;
    procedure Settable(SQL: string; var fquery: TFDQuery);
    function Dlookup(tablename: string; Fieldname: string; cri: string)
      : Variant;
    procedure SetRTLMain(RemoteAddress, BrowserType, BrowserVersion,
      OSType: string);
    procedure SaveRTL(const Value: boolean);
    function GetNextId(tablename, Fieldname, cri: string): Variant;
    procedure setCurrencyFields(Fieldname: string; var fquery: TFDQuery);
    procedure UpgradeDB();
    Procedure saveSetupdta();
    Procedure ReadSetupdta();

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

function TUniMainModule.CheckDBconnection: boolean;
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
    UpgradeDB;
    ReadSetupdta;
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
var
  IniFile: TIniFile;
begin
  mUserName := '0';
  pserverPath := ExtractFilePath(UniServerModule.StartPath);

  SetRTLMain(RemoteAddress, '0', '0', '0');

end;

function TUniMainModule.GetRTLStr(RemoteAddress, BrowserType, BrowserVersion,
  OSType: string): string;

var

  str: string;
begin
  str := 'RTL_' + RemoteAddress;

  str := str + '_' + BrowserType;
  str := str + '_' + BrowserVersion;
  str := str + '_' + OSType;
  pRemoteAddress := RemoteAddress;
  pBrowserType := BrowserType;
  pBrowserVersion := BrowserVersion;
  pOSType := OSType;
  Result := str;
end;

procedure TUniMainModule.SetRTLMain(RemoteAddress, BrowserType, BrowserVersion,
  OSType: string);
var
  Ini: TIniFile;
  str: string;

begin

  str := GetRTLStr(RemoteAddress, BrowserType, BrowserVersion, OSType);
  Ini := TIniFile.Create(pserverPath + '\POSWeb.ini');;
  try
    // Self.RTL := Ini.ReadBool('Lang', 'RTL', False);
    Self.RTL := Ini.ReadBool('Lang', str, false);
  finally
    Ini.Free;
  end;
  if Self.RTL then
  Begin
    Self.siLangDispatcher1.Language := Self.siLangDispatcher1.LangNames[1];
  End
  else
  Begin
    Self.siLangDispatcher1.Language := Self.siLangDispatcher1.LangNames[0];
  End;
end;

procedure TUniMainModule.SaveRTL(const Value: boolean);
var
  Ini: TIniFile;
  str: string;
begin
  Ini := TIniFile.Create(pserverPath + '\POSWeb.ini');;
  try
    str := GetRTLStr(pRemoteAddress, pBrowserType, pBrowserVersion, pOSType);
    Ini.WriteBool('Lang', str, Value);
  finally
    Ini.Free;
  end;

  (UniApplication as TUniGUIApplication).Restart;
end;
{$REGION 'db Operation '}

function TUniMainModule.OpenRecordSer(SQL: string; Readonly: boolean): TFDQuery;
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
     if fquery = nil then
        fquery := TFDQuery.Create(DBConn);

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

function TUniMainModule.GetNextId(tablename: string; Fieldname: string;
  cri: string): Variant;
var
  vrx: Variant;
begin
  vrx := Dlookup(tablename, Fieldname, cri);
  if (VarType(vrx) = varInteger) or (VarType(vrx) = varSmallint) or
    (VarType(vrx) = varSingle) Or (vrx = varCurrency) or (VarType(vrx) = 17)
  then
  begin
    vrx := vrx + 1;
  end
  else
  begin
    vrx := vrx + '1';
  end;
  Result := vrx;

end;

procedure TUniMainModule.setCurrencyFields(Fieldname: string;
  var fquery: TFDQuery);
Begin

  (fquery.FieldByName(Fieldname) as TCurrencyField).currency := false

End;

function TUniMainModule.CheckTableExist(tblename: string): boolean;
var
  fquery: TFDQuery;
begin

  fquery := OpenRecordSer('Select * from ' + tblename + ' where 1=2', false);
  if fquery = nil then
    Result := false
  else
    Result := True;
  FreeAndNil(fquery);

end;

procedure TUniMainModule.UpgradeDB;
var
  SQL: string;
  App_verdb: string;
begin
  if not CheckTableExist('Setting') then
  begin
    SQL := 'Create table setting (' + 'setting_Id integer , ' +
      'setting_name varchar(100) , ' + 'setting_value varchar(500) , ' +
      'primary key (setting_Id)' + ' );';
    DBConn.ExecSQL(SQL);
    SQL := 'insert into setting (setting_Id,setting_name,setting_value)' +
      ' values (1,''' + 'app_ver' + ''' , ''' + App_ver + ''' );';
    DBConn.ExecSQL(SQL);

  end;

  App_verdb := Dlookup('setting', 'setting_value', 'setting_Id=1');
  if not(App_verdb = App_ver) then
  begin

  end;

end;

procedure TUniMainModule.saveSetupdta;
var
  fquery: TFDQuery;

  procedure SaveSetupSetting(setting_Id: Integer;
    setting_name, setting_value: string);
  Begin
    if fquery.locate('setting_Id', setting_Id, []) then
      fquery.edit
    else
      fquery.insert;
    fquery.FieldByName('setting_Id').Value := setting_Id;
    fquery.FieldByName('setting_value').Value := setting_value;
    fquery.FieldByName('setting_name').Value := setting_name;
    fquery.post;
  End;

begin
  try
  fquery := nil;
    Settable('Select * from setting ',fquery);
    SaveSetupSetting(2, 'FirmInfo_Name', SetupData.FirmInfo_Name);
    SaveSetupSetting(3, 'FirmInfo_Address', SetupData.FirmInfo_Address);
    SaveSetupSetting(4, 'FirmInfo_Phone', SetupData.FirmInfo_Phone);
    SaveSetupSetting(5, 'FirmInfo_Fax', SetupData.FirmInfo_Fax);
    SaveSetupSetting(6, 'PhotosPath', SetupData.PhotosPath);
    SaveSetupSetting(7, 'LogoPath', SetupData.LogoPath);
    SaveSetupSetting(8, 'FooterText', SetupData.FooterText);

  except
    on E: Exception do
    Begin

      Exit;
    End;
  end;
end;

procedure TUniMainModule.ReadSetupdta;
var
  fquery: TFDQuery;

  procedure SaveSetupSetting(setting_Id: Integer;
    setting_name, setting_value: string);
  Begin
    if fquery.locate('setting_Id', setting_Id, []) then
      fquery.edit
    else
      fquery.insert;
    fquery.FieldByName('setting_Id').Value := setting_Id;
    fquery.FieldByName('setting_value').Value := setting_value;
    fquery.FieldByName('setting_name').Value := setting_name;
    fquery.post;
  End;
  function readSetupSetting(setting_Id: Integer; setting_name: string;
    Defaltval: string):string;
  Begin
      if fquery.IsEmpty then
      Begin
              Result := Defaltval;
      SaveSetupSetting(setting_Id, setting_name, Defaltval);
      exit;
      End;

    if fquery.locate('setting_Id', setting_Id, []) then
    Begin

      Result := fquery.FieldByName('setting_value').Value;

    End
    else
    begin
      Result := Defaltval;
      SaveSetupSetting(setting_Id, setting_name, Defaltval);
    end;
  End;

begin
  try
  Settable('Select * from setting ',fquery);


    SetupData.FirmInfo_Name := readSetupSetting(2, 'FirmInfo_Name',
      'FirmInfo_Name');
    SetupData.FirmInfo_Address := readSetupSetting(3, 'FirmInfo_Address',
      'FirmInfo_Address');
    SetupData.FirmInfo_Phone := readSetupSetting(4, 'FirmInfo_Phone',
      'FirmInfo_Phone');
    SetupData.FirmInfo_Fax := readSetupSetting(5, 'FirmInfo_Fax',
      'FirmInfo_Fax');
    SetupData.PhotosPath := readSetupSetting(6, 'PhotosPath', '');
    SetupData.LogoPath := readSetupSetting(7, 'LogoPath', '');
    SetupData.FooterText := readSetupSetting(8, 'FooterText', 'FooterText');
      FreeAndNil(fquery);
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
