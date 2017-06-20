unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMainMenu = class(TForm)
    btnPlayYaz: TButton;
    btnExit: TButton;
    procedure btnPlayYazClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

uses MainGameBoard;

{$R *.dfm}

procedure TfrmMainMenu.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainMenu.btnPlayYazClick(Sender: TObject);
begin
  frmMainGameBoard.Show;
end;

end.
