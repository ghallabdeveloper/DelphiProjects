unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,inifiles;

type
  TUniMainModule = class(TUniGUIMainModule)
    DBConn: TFDConnection;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
   pserverPath:string;
    mdbdatabaseName:string;
    mdberverName,mdbUserName,mdbPassword:string;
    { Public declarations }
   function  CheckDBconnection():Boolean;
   procedure SaveDBSetting();
   procedure readDBSetting();
   function getfirdacconectionString():string;
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
   readDBSetting();
   try
    DBConn.ConnectionString := getfirdacconectionString();
DBConn.Connected := True;
   except
       Result := False;
       Exit;
   end;

   if DBConn.Connected then
   Begin
     result := True;
     Exit;
   End;


end;

function TUniMainModule.getfirdacconectionString: string;
var
 ConnectionString:string;
begin
  ConnectionString :='DriverID=MSSQL;Server='+mdberverName+';Database='+mdbdatabaseName+';User_name='+mdbUserName+ ';Password='+mdbPassword;

end;

procedure TUniMainModule.readDBSetting;
var
 IniFile:TIniFile;
begin
   try
   IniFile := TIniFile.Create(pserverPath+'\POSWeb.ini');
mdbdatabaseName :=    IniFile.ReadString('Connection','dbname','');
   mdberverName :=    IniFile.ReadString('Connection','servername','');
mdbUserName :=       IniFile.ReadString('Connection','username','');
mdbPassword :=       IniFile.ReadString('Connection','password','');
   except

end;
end;

procedure TUniMainModule.SaveDBSetting;
var
 IniFile:TIniFile;
begin
try
   IniFile := TIniFile.Create(pserverPath+'\POSWeb.ini');
   IniFile.WriteString('Connection','dbname',mdbdatabaseName);
   IniFile.WriteString('Connection','servername',mdberverName);
   IniFile.WriteString('Connection','username',mdbUserName);
   IniFile.WriteString('Connection','password',mdbPassword);
   except

end;
//   aWorkTime := IniFile.ReadString('Filename', 'Work Time', '<none>');
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  pserverPath := ExtractFilePath(UniServerModule.StartPath);
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
