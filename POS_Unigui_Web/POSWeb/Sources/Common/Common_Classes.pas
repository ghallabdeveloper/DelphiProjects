unit Common_Classes;

interface
    uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,inifiles, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase;
  Type
    TAppSetting = record
        FirmInfo_Name: string; // »Ì«‰«  «·„‰‘√… «· Ì  ŸÂ— ›Ì «· ﬁ«—Ì—
    FirmInfo_Address: string;
    FirmInfo_Phone, FirmInfo_Fax: string;
    PhotosPath: string;
    LogoPath: string;
    FooterText: string; // ‰’  –ÌÌ· «·’›Õ…


    end;

implementation

end.
