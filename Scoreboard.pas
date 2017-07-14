unit Scoreboard;

interface

uses Windows, Messages, SysUtils, Variants, Classes;

type

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
    HasUpperBonus: Boolean;

    function GetUpperTotal: Integer;
    function GetLowerTotal: Integer;
    function GetGrandTotal: Integer;

  end;

  const
    UpperBonus: Integer = 35;

implementation

{ TScoreboard }

function TScoreboard.GetGrandTotal: Integer;
begin

end;

function TScoreboard.GetLowerTotal: Integer;
begin

end;

function TScoreboard.GetUpperTotal: Integer;
begin

end;

end.
