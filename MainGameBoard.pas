unit MainGameBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdDice, StdCtrls, YazRules, Scoreboard;

type
  TfrmMainGameBoard = class(TForm)
    Dice1: TStandardDice;
    Dice2: TStandardDice;
    Dice3: TStandardDice;
    Dice4: TStandardDice;
    Dice5: TStandardDice;
    btnRollDice: TButton;
    btnStopDice: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    lblUpperTotal: TLabel;
    lblLowerTotal: TLabel;
    lblGrandTotal: TLabel;
    btnOnes: TButton;
    lbltot1: TLabel;
    lbltot6: TLabel;
    lbltot5: TLabel;
    lbltot4: TLabel;
    lbltot3: TLabel;
    lbltot2: TLabel;
    lblUpperTotalCalc: TLabel;
    lblThreeOfKindTot: TLabel;
    lblFourOfKindTot: TLabel;
    lblSmallStraightTot: TLabel;
    lblLargeStraightTot: TLabel;
    lblYazTot: TLabel;
    lblChanceTot: TLabel;
    lblLowerTot: TLabel;
    lblGrandTot: TLabel;
    btnTwos: TButton;
    btnThrees: TButton;
    btnFours: TButton;
    btnFives: TButton;
    btnSixes: TButton;
    btnThreeOfKind: TButton;
    btnFourOfKind: TButton;
    btnSmallStraight: TButton;
    btnLargeStraight: TButton;
    btnYaz: TButton;
    btnChance: TButton;
    btnRestartGame: TButton;
    lblFullHouse: TLabel;
    btnFullHouse: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRollDiceClick(Sender: TObject);
    procedure btnStopDiceClick(Sender: TObject);
    procedure Dice1Click(Sender: TObject);
    procedure Dice1DblClick(Sender: TObject);
    procedure Dice2Click(Sender: TObject);
    procedure Dice2DblClick(Sender: TObject);
    procedure Dice3Click(Sender: TObject);
    procedure Dice3DblClick(Sender: TObject);
    procedure Dice4Click(Sender: TObject);
    procedure Dice4DblClick(Sender: TObject);
    procedure Dice5Click(Sender: TObject);
    procedure Dice5DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnRestartGameClick(Sender: TObject);
    procedure btnOnesClick(Sender: TObject);
    procedure btnTwosClick(Sender: TObject);
    procedure btnThreesClick(Sender: TObject);
    procedure btnFoursClick(Sender: TObject);
    procedure btnFivesClick(Sender: TObject);
    procedure btnSixesClick(Sender: TObject);
    procedure btnThreeOfKindClick(Sender: TObject);
    procedure btnFourOfKindClick(Sender: TObject);
    procedure btnFullHouseClick(Sender: TObject);
    procedure btnSmallStraightClick(Sender: TObject);
    procedure btnLargeStraightClick(Sender: TObject);
    procedure btnYazClick(Sender: TObject);
    procedure btnChanceClick(Sender: TObject);
  private
    FDiceSet: TDiceSet;
    FScoreBoard: TScoreboard;
    procedure SetDiceSet(const Value: TDiceSet);
    procedure SetScoreboard(const Value: TScoreboard);
    { Private declarations }
  public
    property DiceSet: TDiceSet read FDiceSet write SetDiceSet;
    property Scoreboard: TScoreboard read FScoreBoard write SetScoreboard;
    procedure ResetScoreboard;
    procedure UpdateScoreboard;
    { Public declarations }
  end;

var
  frmMainGameBoard: TfrmMainGameBoard;

implementation

{$R *.dfm}

procedure TfrmMainGameBoard.FormDestroy(Sender: TObject);
begin
  if Assigned(DiceSet)then DiceSet.Free();
  if Assigned(Scoreboard) then Scoreboard.Free();

end;

procedure TfrmMainGameBoard.ResetScoreboard;
begin
  // Reset scoreboard
  btnOnes.Enabled := True;
  btnTwos.Enabled := True;
  btnThrees.Enabled := True;
  btnFours.Enabled := True;
  btnFives.Enabled := True;
  btnSixes.Enabled := True;
  btnThreeOfKind.Enabled := True;
  btnFourOfKind.Enabled := True;
  btnSmallStraight.Enabled := True;
  btnLargeStraight.Enabled := True;
  btnFullHouse.Enabled := True;
  btnYaz.Enabled := True;
  btnChance.Enabled := True;

  lbltot1.Caption := '0';
  lbltot2.Caption := '0';
  lbltot3.Caption := '0';
  lbltot4.Caption := '0';
  lbltot5.Caption := '0';
  lbltot6.Caption := '0';
  lblThreeOfKindTot.Caption := '0';
  lblFourOfKindTot.Caption := '0';
  lblFullHouse.Caption := '0';
  lblYazTot.Caption := '0';
  lblSmallStraightTot.Caption := '0';
  lblLargeStraightTot.Caption := '0';
  lblChanceTot.Caption := '0';
  lblUpperTotalCalc.Caption := '0';
  lblLowerTot.Caption := '0';
  lblGrandTot.Caption := '0';
end;

procedure TfrmMainGameBoard.FormCreate(Sender: TObject);
begin
  DiceSet := TDiceSet.Create();
  Scoreboard := TScoreboard.Create();
end;

procedure TfrmMainGameBoard.btnChanceClick(Sender: TObject);
begin
  Scoreboard.setScore(stChance, DiceSet);
end;

procedure TfrmMainGameBoard.btnFivesClick(Sender: TObject);
begin
  Scoreboard.setScore(stFives, DiceSet);
end;

procedure TfrmMainGameBoard.btnFourOfKindClick(Sender: TObject);
begin
  Scoreboard.setScore(stFourOfKind, DiceSet);
end;

procedure TfrmMainGameBoard.btnFoursClick(Sender: TObject);
begin
  Scoreboard.setScore(stFours, DiceSet);
end;

procedure TfrmMainGameBoard.btnFullHouseClick(Sender: TObject);
begin
  Scoreboard.setScore(stFullHouse, DiceSet);
end;

procedure TfrmMainGameBoard.btnLargeStraightClick(Sender: TObject);
begin
  Scoreboard.setScore(stLargeStraight, DiceSet);
end;

procedure TfrmMainGameBoard.btnOnesClick(Sender: TObject);
begin
  Scoreboard.setScore(stOnes, DiceSet);
end;

procedure TfrmMainGameBoard.btnRestartGameClick(Sender: TObject);
begin
  ResetScoreBoard;
end;

procedure TfrmMainGameBoard.btnRollDiceClick(Sender: TObject);
begin
  Dice1.Rotate := True;
  Dice2.Rotate := True;
  Dice3.Rotate := True;
  Dice4.Rotate := True;
  Dice5.Rotate := True;
end;

procedure TfrmMainGameBoard.btnSixesClick(Sender: TObject);
begin
  Scoreboard.setScore(stSixes, DiceSet);
end;

procedure TfrmMainGameBoard.btnSmallStraightClick(Sender: TObject);
begin
  Scoreboard.setScore(stSmallStraight, DiceSet);
end;

procedure TfrmMainGameBoard.btnStopDiceClick(Sender: TObject);
begin
  Dice1.Rotate := False;
  Dice2.Rotate := False;
  Dice3.Rotate := False;
  Dice4.Rotate := False;
  Dice5.Rotate := False;
end;

procedure TfrmMainGameBoard.btnThreeOfKindClick(Sender: TObject);
begin
  Scoreboard.setScore(stThreeOfKind, DiceSet);
end;

procedure TfrmMainGameBoard.btnThreesClick(Sender: TObject);
begin
  Scoreboard.setScore(stThrees, DiceSet);
end;

procedure TfrmMainGameBoard.btnTwosClick(Sender: TObject);
begin
  Scoreboard.setScore(stTwos, DiceSet);
end;

procedure TfrmMainGameBoard.btnYazClick(Sender: TObject);
begin
  Scoreboard.setScore(stYaz, DiceSet);
end;

procedure TfrmMainGameBoard.Button1Click(Sender: TObject);
begin
  if Dice1.Locked then
    Dice1.Locked := False
  else
    Dice1.Locked := True;

  DiceSet.Value1 := Dice1.Value;
end;

procedure TfrmMainGameBoard.Button2Click(Sender: TObject);
begin
  if Dice2.Locked then
    Dice2.Locked := False
  else
    Dice2.Locked := True;

  DiceSet.Value2 := Dice2.Value;
end;

procedure TfrmMainGameBoard.Button3Click(Sender: TObject);
begin
  if Dice3.Locked then
    Dice3.Locked := False
  else
    Dice3.Locked := True;

  DiceSet.Value3 := Dice3.Value;
end;

procedure TfrmMainGameBoard.Button4Click(Sender: TObject);
begin
    if Dice4.Locked then
    Dice4.Locked := False
  else
    Dice4.Locked := True;

  DiceSet.Value4 := Dice4.Value;
end;

procedure TfrmMainGameBoard.Button5Click(Sender: TObject);
begin
  if Dice5.Locked then
    Dice5.Locked := False
  else
    Dice5.Locked := True;

  DiceSet.Value5 := Dice5.Value;
end;

procedure TfrmMainGameBoard.Dice1Click(Sender: TObject);
begin
  Dice1.Locked := True;
end;

procedure TfrmMainGameBoard.Dice1DblClick(Sender: TObject);
begin
  Dice1.Locked := False;
end;

procedure TfrmMainGameBoard.Dice2Click(Sender: TObject);
begin
  Dice2.Locked := True;
end;

procedure TfrmMainGameBoard.Dice2DblClick(Sender: TObject);
begin
  Dice2.Locked := False;
end;

procedure TfrmMainGameBoard.Dice3Click(Sender: TObject);
begin
  Dice3.Locked := True;
end;

procedure TfrmMainGameBoard.Dice3DblClick(Sender: TObject);
begin
  Dice3.Locked := False;
end;

procedure TfrmMainGameBoard.Dice4Click(Sender: TObject);
begin
  Dice4.Locked := True;
end;

procedure TfrmMainGameBoard.Dice4DblClick(Sender: TObject);
begin
  Dice4.Locked := False;
end;

procedure TfrmMainGameBoard.Dice5Click(Sender: TObject);
begin
  Dice5.Locked := True;
end;

procedure TfrmMainGameBoard.Dice5DblClick(Sender: TObject);
begin
  Dice5.Locked := False;
end;

procedure TfrmMainGameBoard.SetDiceSet(const Value: TDiceSet);
begin
  FDiceSet := Value;
end;

procedure TfrmMainGameBoard.SetScoreboard(const Value: TScoreboard);
begin
  FScoreBoard := Value;
end;

procedure TfrmMainGameBoard.UpdateScoreboard;
begin

end;

end.
