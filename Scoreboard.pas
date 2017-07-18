unit Scoreboard;

interface

uses Classes, YazRules;

type
  TScoreType = (stOnes, stTwos, stThrees, stFours, stFives, stSixes, stThreeOfKind,
                stFourOfKind, stFullHouse, stYaz, stSmallStraight, stLargeStraight,
                stChance);

  TScoreboard = class(TObject)
    Ones: Integer;
    Twos: Integer;
    Threes: Integer;
    Fours: Integer;
    Fives: Integer;
    Sixes: Integer;
    ThreeOfKind: Integer;
    FourOfKind: Integer;
    FullHouse: Integer;
    SmallStraight: Integer;
    LargeStraight: Integer;
    Yaz: Integer;
    Chance: Integer;
    UpperTotal: Integer;
    LowerTotal: Integer;
    GrandTotal: Integer;
    Bonus: Boolean;

    function GetUpperTotal: Integer;
    function GetLowerTotal: Integer;
    function GetGrandTotal: Integer;
    procedure setScore(Kind: TScoreType; DiceResults: TDiceSet);
    procedure Reset;
  end;

implementation

{ TScoreboard }

function TScoreboard.GetGrandTotal: Integer;
begin
  result := GetUpperTotal + GetLowerTotal;
end;


function TScoreboard.GetUpperTotal: Integer;
var
  r: Integer;
begin
  r := Ones + Twos + Threes + Fours + Fives + Sixes;

  if Bonus then
    r := r + UpperBonus;

  result := r;
end;

procedure TScoreboard.Reset;
begin
  Ones := 0;
  Twos := 0;
  Threes := 0;
  Fours := 0;
  Fives := 0;
  Sixes := 0;
  ThreeOfKind := 0;
  FourOfKind := 0;
  FullHouse := 0;
  SmallStraight := 0;
  LargeStraight := 0;
  Yaz := 0;
  Chance := 0;
  UpperTotal := 0;
  LowerTotal := 0;
  GrandTotal := 0;
  Bonus := False;
end;

procedure TScoreboard.setScore(Kind: TScoreType; DiceResults: TDiceSet);
var
  rules: TRules;
begin

  rules := TRules.Create();

  try

    case Kind of
      stOnes: Ones := rules.calcOnes(DiceResults);
      stTwos: Twos := rules.calcTwos(DiceResults);
      stThrees: Threes := rules.calcThrees(DiceResults);
      stFours: Fours := rules.calcFours(DiceResults);
      stFives: Fives := rules.calcFives(DiceResults);
      stSixes: Sixes := rules.calcSixes(DiceResults);
      stThreeOfKind: ThreeOfKind := rules.calcThreeOfKind(DiceResults);
      stFourOfKind: FourOfKind := rules.calcFourOfKind(DiceResults);
      stFullHouse: FullHouse := rules.calcFullHouse(DiceResults);
      stYaz: Yaz := rules.calcYaz(DiceResults);
      stSmallStraight: SmallStraight := rules.calcSmallStraight(DiceResults);
      stLargeStraight: LargeStraight := rules.calcLargeStraight(DiceResults);
      stChance: Chance := rules.calcChance(DiceResults);
    end;

  finally
    rules.Free;
  end;
end;

function TScoreboard.GetLowerTotal: Integer;
begin
  result := ThreeOfKind + FourOfKind + FullHouse + SmallStraight + LargeStraight + Yaz + Chance;
end;

end.
