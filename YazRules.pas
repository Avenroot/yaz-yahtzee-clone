unit YazRules;

interface

uses Classes;

type

  TDiceResults = class(TObject)
  private
    FTrueFlase: Boolean;
    FValue1: Integer;
    FValue2: Integer;
    procedure SetTrueFlase(const Value: Boolean);
    procedure SetValue1(const Value: Integer);
    procedure SetValue2(const Value: Integer);
  public
    property TrueFlase: Boolean read FTrueFlase write SetTrueFlase default False;
    property Value1: Integer read FValue1 write SetValue1 default 0;
    property Value2: Integer read FValue2 write SetValue2 default 0;
  end;

  TDiceSet = class(TObject)

  private
    FValue1: Integer;
    FValue2: Integer;
    FValue3: Integer;
    FValue4: Integer;
    FValue5: Integer;
    FValue6: Integer;
    procedure SetValue1(const Value: Integer);
    procedure SetValue2(const Value: Integer);
    procedure SetValue3(const Value: Integer);
    procedure SetValue4(const Value: Integer);
    procedure SetValue5(const Value: Integer);
    procedure SetValue6(const Value: Integer);

  public
    property Value1: Integer read FValue1 write SetValue1;
    property Value2: Integer read FValue2 write SetValue2;
    property Value3: Integer read FValue3 write SetValue3;
    property Value4: Integer read FValue4 write SetValue4;
    property Value5: Integer read FValue5 write SetValue5;
    property Value6: Integer read FValue6 write SetValue6;
  end;

  TRules = class(TObject)

  private
    function calcAllValues(DiceSet: TDiceSet): Integer;

  public
    function IsOnes(DiceSet: TDiceSet): Boolean;
    function IsTwos(DiceSet: TDiceSet): Boolean;
    function IsThrees(DiceSet: TDiceSet): Boolean;
    function IsFours(DiceSet: TDiceSet): Boolean;
    function IsFives(DiceSet: TDiceSet): Boolean;
    function IsSixes(DiceSet: TDiceSet): Boolean;
    function IsFourOfKind(DiceSet: TDiceSet): Boolean;
    function IsFullHouse(DiceSet: TDiceSet): Boolean;
    function IsLargeStraight(DiceSet: TDiceSet): Boolean;
    function IsSmallStraight(DiceSet: TDiceSet): Boolean;
    function IsThreeOfKind(DiceSet: TDiceSet): Boolean;
    function IsYaz(DiceSet: TDiceSet): Boolean;
    function IsChance(DiceSet: TDiceSet): Boolean;

    function calcOnes(DiceSet: TDiceSet): Integer;
    function calcTwos(DiceSet: TDiceSet): Integer;
    function calcThrees(DiceSet: TDiceSet): Integer;
    function calcFours(DiceSet: TDiceSet): Integer;
    function calcFives(DiceSet: TDiceSet): Integer;
    function calcSixes(DiceSet: TDiceSet): Integer;
    function calcThreeOfKind(DiceSet: TDiceSet): Integer;
    function calcFourOfKind(DiceSet: TDiceSet): Integer;
    function calcSmallStraight(DiceSet: TDiceSet): Integer;
    function calcLargeStraight(DiceSet: TDiceSet): Integer;
    function calcFullHouse(DiceSet: TDiceSet): Integer;
    function calcYaz(DiceSet: TDiceSet): Integer;
    function calcChance(DiceSet: TDiceSet): Integer;
  end;

function HowManyOnes(DiceSet: TDiceSet): Integer;
function HowManyTwos(DiceSet: TDiceSet): Integer;
function HowManyThrees(DiceSet: TDiceSet): Integer;
function HowManyFours(DiceSet: TDiceSet): Integer;
function HowManyFives(DiceSet: TDiceSet): Integer;
function HowManySixes(DiceSet: TDiceSet): Integer;

function IsTwoOfSameKind(DiceSet: TDiceSet): TDiceResults;
function IsThreeOfSameKind(DiceSet: TDiceSet): TDiceResults;

const
  FullHouseValue     = 25;
  SmallStraightValue = 30;
  LargeStraightValue = 40;
  YazValue           = 50;
  UpperBonus         = 35;

implementation

function HowManyOnes(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 1 then
    Result := Result + 1;
  if DiceSet.Value2 = 1 then
    Result := Result + 1;
  if DiceSet.Value3 = 1 then
    Result := Result + 1;
  if DiceSet.Value4 = 1 then
    Result := Result + 1;
  if DiceSet.Value5 = 1 then
    Result := Result + 1;
  if DiceSet.Value6 = 1 then
    Result := Result + 1;
end;

function HowManyTwos(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 2 then
    Result := Result + 1;
  if DiceSet.Value2 = 2 then
    Result := Result + 1;
  if DiceSet.Value3 = 2 then
    Result := Result + 1;
  if DiceSet.Value4 = 2 then
    Result := Result + 1;
  if DiceSet.Value5 = 2 then
    Result := Result + 1;
  if DiceSet.Value6 = 2 then
    Result := Result + 1;
end;

function HowManyThrees(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 3 then
    Result := Result + 1;
  if DiceSet.Value2 = 3 then
    Result := Result + 1;
  if DiceSet.Value3 = 3 then
    Result := Result + 1;
  if DiceSet.Value4 = 3 then
    Result := Result + 1;
  if DiceSet.Value5 = 3 then
    Result := Result + 1;
  if DiceSet.Value6 = 3 then
    Result := Result + 1;
end;

function HowManyFours(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 4 then
    Result := Result + 1;
  if DiceSet.Value2 = 4 then
    Result := Result + 1;
  if DiceSet.Value3 = 4 then
    Result := Result + 1;
  if DiceSet.Value4 = 4 then
    Result := Result + 1;
  if DiceSet.Value5 = 4 then
    Result := Result + 1;
  if DiceSet.Value6 = 4 then
    Result := Result + 1;
end;

function HowManyFives(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 5 then
    Result := Result + 1;
  if DiceSet.Value2 = 5 then
    Result := Result + 1;
  if DiceSet.Value3 = 5 then
    Result := Result + 1;
  if DiceSet.Value4 = 5 then
    Result := Result + 1;
  if DiceSet.Value5 = 5 then
    Result := Result + 1;
  if DiceSet.Value6 = 5 then
    Result := Result + 1;
end;

function HowManySixes(DiceSet: TDiceSet): Integer;
begin
  Result := 0;

  if DiceSet.Value1 = 6 then
    Result := Result + 1;
  if DiceSet.Value2 = 6 then
    Result := Result + 1;
  if DiceSet.Value3 = 6 then
    Result := Result + 1;
  if DiceSet.Value4 = 6 then
    Result := Result + 1;
  if DiceSet.Value5 = 6 then
    Result := Result + 1;
  if DiceSet.Value6 = 6 then
    Result := Result + 1;
end;

function IsTwoOfSameKind(DiceSet: TDiceSet): TDiceResults;
begin

  Result.TrueFlase := False;

  if HowManyOnes(DiceSet) = 2 then
    Result.Value1 := 1;

  if HowManyTwos(DiceSet) = 2 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 2
    else
      Result.Value1 := 2;

  if HowManyThrees(DiceSet) = 2 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 3
    else
      Result.Value1 := 3;

  if HowManyFours(DiceSet) = 2 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 4
    else
      Result.Value1 := 4;

  if HowManyFives(DiceSet) = 2 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 5
    else
      Result.Value1 := 5;

  if HowManySixes(DiceSet) = 2 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 6
    else
      Result.Value1 := 6;

end;

function IsThreeOfSameKind(DiceSet: TDiceSet): TDiceResults;
begin
  Result.TrueFlase := False;

  if HowManyOnes(DiceSet) = 3 then
    begin
      Result.TrueFlase := True;
      Result.Value1 := 1;
    end;

  if HowManyTwos(DiceSet) = 3 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 2
    else
      Result.Value1 := 2;

  if HowManyThrees(DiceSet) = 3 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 3
    else
      Result.Value1 := 3;

  if HowManyFours(DiceSet) = 3 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 4
    else
      Result.Value1 := 4;

  if HowManyFives(DiceSet) = 3 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 5
    else
      Result.Value1 := 5;

  if HowManySixes(DiceSet) = 3 then
    Result.TrueFlase := True;
    if Result.Value1 > 0 then
      Result.Value2 := 6
    else
      Result.Value1 := 6;
end;


procedure TDiceSet.SetValue1(const Value: Integer);
begin
  FValue1 := Value;
end;

procedure TDiceSet.SetValue2(const Value: Integer);
begin
  FValue2 := Value;
end;

procedure TDiceSet.SetValue3(const Value: Integer);
begin
  FValue3 := Value;
end;

procedure TDiceSet.SetValue4(const Value: Integer);
begin
  FValue4 := Value;
end;

procedure TDiceSet.SetValue5(const Value: Integer);
begin
  FValue5 := Value;
end;

procedure TDiceSet.SetValue6(const Value: Integer);
begin
  FValue6 := Value;
end;

function TRules.calcAllValues(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := DiceSet.Value1 + DiceSet.Value2 + DiceSet.Value3 + DiceSet.Value4 + DiceSet.Value5 + DiceSet.Value6;

  Result := r;
end;

function TRules.calcChance(DiceSet: TDiceSet): Integer;
begin
  Result := calcAllValues(DiceSet);
end;

function TRules.calcFives(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 5 then r := r + 5;
  if DiceSet.Value2 = 5 then r := r + 5;
  if DiceSet.Value3 = 5 then r := r + 5;
  if DiceSet.Value4 = 5 then r := r + 5;
  if DiceSet.Value5 = 5 then r := r + 5;
  if DiceSet.Value6 = 5 then r := r + 5;

  Result := r;
end;

function TRules.calcFourOfKind(DiceSet: TDiceSet): Integer;
begin
  Result := calcAllValues(DiceSet);
end;

function TRules.calcFours(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 4 then r := r + 4;
  if DiceSet.Value2 = 4 then r := r + 4;
  if DiceSet.Value3 = 4 then r := r + 4;
  if DiceSet.Value4 = 4 then r := r + 4;
  if DiceSet.Value5 = 4 then r := r + 4;
  if DiceSet.Value6 = 4 then r := r + 4;

  Result := r;
end;

function TRules.calcFullHouse(DiceSet: TDiceSet): Integer;
begin
  Result := FullHouseValue;
end;

function TRules.calcLargeStraight(DiceSet: TDiceSet): Integer;
begin
  Result := LargeStraightValue;
end;

function TRules.calcOnes(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 1 then r := r + 1;
  if DiceSet.Value2 = 1 then r := r + 1;
  if DiceSet.Value3 = 1 then r := r + 1;
  if DiceSet.Value4 = 1 then r := r + 1;
  if DiceSet.Value5 = 1 then r := r + 1;
  if DiceSet.Value6 = 1 then r := r + 1;

  Result := r;
end;

function TRules.calcSixes(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 6 then r := r + 6;
  if DiceSet.Value2 = 6 then r := r + 6;
  if DiceSet.Value3 = 6 then r := r + 6;
  if DiceSet.Value4 = 6 then r := r + 6;
  if DiceSet.Value5 = 6 then r := r + 6;
  if DiceSet.Value6 = 6 then r := r + 6;

  Result := r;
end;

function TRules.calcSmallStraight(DiceSet: TDiceSet): Integer;
begin
  Result := SmallStraightValue;
end;

function TRules.calcThreeOfKind(DiceSet: TDiceSet): Integer;
begin
  Result := calcAllValues(DiceSet);
end;

function TRules.calcThrees(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 3 then r := r + 3;
  if DiceSet.Value2 = 3 then r := r + 3;
  if DiceSet.Value3 = 3 then r := r + 3;
  if DiceSet.Value4 = 3 then r := r + 3;
  if DiceSet.Value5 = 3 then r := r + 3;
  if DiceSet.Value6 = 3 then r := r + 3;

  Result := r;
end;

function TRules.calcTwos(DiceSet: TDiceSet): Integer;
var
  r: Integer;
begin
  r := 0;

  if DiceSet.Value1 = 2 then r := r + 2;
  if DiceSet.Value2 = 2 then r := r + 2;
  if DiceSet.Value3 = 2 then r := r + 2;
  if DiceSet.Value4 = 2 then r := r + 2;
  if DiceSet.Value5 = 2 then r := r + 2;
  if DiceSet.Value6 = 2 then r := r + 2;

  Result := r;
end;

function TRules.calcYaz(DiceSet: TDiceSet): Integer;
begin
  Result := YazValue;
end;

function TRules.IsChance(DiceSet: TDiceSet): Boolean;
begin
  Result := True;
end;

function TRules.IsFives(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyFives(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsFourOfKind(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyOnes(DiceSet) >= 4 then
    Result := True;
  if HowManyTwos(DiceSet) >= 4 then
    Result := True;
  if HowManyThrees(DiceSet) >= 4 then
    Result := True;
  if HowManyFours(DiceSet) >= 4 then
    Result := True;
  if HowManyFives(DiceSet) >= 4 then
    Result := True;
  if HowManySixes(DiceSet) >= 4 then
    Result := True;

end;

function TRules.IsFours(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyFours(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsFullHouse(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if (IsTwoOfSameKind(DiceSet).TrueFlase = True) and (IsThreeOfSameKind(DiceSet).TrueFlase = True) then
    Result := True;

end;

function TRules.IsLargeStraight(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  // Dice 1 - 5
  if (HowManyOnes(DiceSet) = 1) and (HowManyTwos(DiceSet) = 1) and
    (HowManyThrees(DiceSet) = 1) and (HowManyFours(DiceSet) = 1) and
    (HowManyFives(DiceSet) = 1)
  then
    Result := True;

  // Dice 2 - 6
  if (HowManyTwos(DiceSet) = 1) and (HowManyThrees(DiceSet) = 1) and
     (HowManyFours(DiceSet) = 1) and (HowManyFives(DiceSet) = 1) and
     (HowManySixes(DiceSet) = 1)
  then
    Result := True;
end;

function TRules.IsOnes(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyOnes(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsSixes(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManySixes(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsSmallStraight(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  // Dice 1 - 4
  if (HowManyOnes(DiceSet) = 1) and (HowManyTwos(DiceSet) = 1) and
    (HowManyThrees(DiceSet) = 1) and (HowManyFours(DiceSet) = 1)
  then
    Result := True;

  // Dice 2 - 5
  if (HowManyTwos(DiceSet) = 1) and (HowManyThrees(DiceSet) = 1) and
     (HowManyFours(DiceSet) = 1) and (HowManyFives(DiceSet) = 1)
  then
    Result := True;

 // Dice 3 - 6
  if (HowManyThrees(DiceSet) = 1) and (HowManyFours(DiceSet) = 1) and
     (HowManyFives(DiceSet) = 1) and (HowManySixes(DiceSet) = 1)
  then
    Result := True;

end;

function TRules.IsThreeOfKind(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyOnes(DiceSet) >= 3 then
    Result := True;
  if HowManyTwos(DiceSet) >= 3 then
    Result := True;
  if HowManyThrees(DiceSet) >= 3 then
    Result := True;
  if HowManyFours(DiceSet) >= 3 then
    Result := True;
  if HowManyFives(DiceSet) >= 3 then
    Result := True;
  if HowManySixes(DiceSet) >= 3 then
    Result := True;
end;

function TRules.IsThrees(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyThrees(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsTwos(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyTwos(DiceSet) > 0 then
    Result := True;
end;

function TRules.IsYaz(DiceSet: TDiceSet): Boolean;
begin
  Result := False;

  if HowManyOnes(DiceSet) = 5 then
    Result := True;
  if HowManyTwos(DiceSet) = 5 then
    Result := True;
  if HowManyThrees(DiceSet) = 5 then
    Result := True;
  if HowManyFours(DiceSet) = 5 then
    Result := True;
  if HowManyFives(DiceSet) = 5 then
    Result := True;
  if HowManySixes(DiceSet) = 5 then
    Result := True;
end;

procedure TDiceResults.SetTrueFlase(const Value: Boolean);
begin
  FTrueFlase := Value;
end;

procedure TDiceResults.SetValue1(const Value: Integer);
begin
  FValue1 := Value;
end;

procedure TDiceResults.SetValue2(const Value: Integer);
begin
  FValue2 := Value;
end;

end.
