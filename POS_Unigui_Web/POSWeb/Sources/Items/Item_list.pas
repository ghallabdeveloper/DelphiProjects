unit Item_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, dxGDIPlusClasses, uniImage, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TItemsList = class(TUniForm)
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

function ItemsList: TItemsList;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function ItemsList: TItemsList;
begin
  Result := TItemsList(UniMainModule.GetFormInstance(TItemsList));
end;

end.
