unit MainGameBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdDice, StdCtrls, YazRules;

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
    lblOnes: TLabel;
    lblTwos: TLabel;
    lblThrees: TLabel;
    lblFours: TLabel;
    lblFives: TLabel;
    lblSixes: TLabel;
    lblThreeOfKind: TLabel;
    lblFourOfKind: TLabel;
    lblSmallStraight: TLabel;
    lblLargeStraight: TLabel;
    lblYaz: TLabel;
    Label6: TLabel;
    lblUpperTotal: TLabel;
    lblLowerTotal: TLabel;
    lblGrandTotal: TLabel;
    lstTest: TListBox;
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
  private
    FDiceSet: TDiceSet;
    procedure SetDiceSet(const Value: TDiceSet);
    { Private declarations }
  public
    property DiceSet: TDiceSet read FDiceSet write SetDiceSet;
    { Public declarations }
  end;

var
  frmMainGameBoard: TfrmMainGameBoard;

implementation

{$R *.dfm}

procedure TfrmMainGameBoard.FormDestroy(Sender: TObject);
begin
  if Assigned(DiceSet) then
    DiceSet.Free();
end;

procedure TfrmMainGameBoard.FormCreate(Sender: TObject);
begin
  DiceSet := TDiceSet.Create();
end;

procedure TfrmMainGameBoard.btnRollDiceClick(Sender: TObject);
begin
  Dice1.Rotate := True;
  Dice2.Rotate := True;
  Dice3.Rotate := True;
  Dice4.Rotate := True;
  Dice5.Rotate := True;
end;

procedure TfrmMainGameBoard.btnStopDiceClick(Sender: TObject);
begin
  Dice1.Rotate := False;
  Dice2.Rotate := False;
  Dice3.Rotate := False;
  Dice4.Rotate := False;
  Dice5.Rotate := False;
end;

procedure TfrmMainGameBoard.Button1Click(Sender: TObject);
begin
  if Dice1.Locked then
    Dice1.Locked := False
  else
    Dice1.Locked := True;
end;

procedure TfrmMainGameBoard.Button2Click(Sender: TObject);
begin
  if Dice2.Locked then
    Dice2.Locked := False
  else
    Dice2.Locked := True;
end;

procedure TfrmMainGameBoard.Button3Click(Sender: TObject);
begin
  if Dice3.Locked then
    Dice3.Locked := False
  else
    Dice3.Locked := True;
end;

procedure TfrmMainGameBoard.Button4Click(Sender: TObject);
begin
    if Dice4.Locked then
    Dice4.Locked := False
  else
    Dice4.Locked := True;
end;

procedure TfrmMainGameBoard.Button5Click(Sender: TObject);
begin
  if Dice5.Locked then
    Dice5.Locked := False
  else
    Dice5.Locked := True;
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

end.
