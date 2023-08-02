unit Pos_Invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, dxGDIPlusClasses, uniImage, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TPOSInvoice = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel2: TUniPanel;
    btn_OK: TUniSpeedButton;
    btn_Cancel: TUniSpeedButton;
    UniPanel3: TUniPanel;
    UniImage1: TUniImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function POSInvoice: TPOSInvoice;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function POSInvoice: TPOSInvoice;
begin
  Result := TPOSInvoice(UniMainModule.GetFormInstance(TPOSInvoice));
end;

end.
