program Yaz;

uses
  Forms,
  MainMenu in 'MainMenu.pas' {frmMainMenu},
  MainGameBoard in 'MainGameBoard.pas' {frmMainGameBoard},
  YazRules in 'YazRules.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Yaz Game';
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmMainGameBoard, frmMainGameBoard);
  Application.Run;
end.
