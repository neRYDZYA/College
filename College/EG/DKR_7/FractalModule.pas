unit FractalModule;

interface

uses
  GraphABC;

procedure DrawHarterHeighway(x, y: integer; scale: real; depth: integer);

implementation

procedure DrawHarterHeighway(x, y: integer; scale: real; depth: integer);
var
  angle: real;

  procedure Dragon(x1, y1, x2, y2: integer; depth: integer);
  var
    xn, yn: integer;
  begin
    if depth = 0 then
    begin
      Line(x1, y1, x2, y2);
    end
    else
    begin
      xn := Round((x1 + x2) / 2 + (y2 - y1) / 2 * angle);
      yn := Round((y1 + y2) / 2 - (x2 - x1) / 2 * angle);
      Dragon(x1, y1, xn, yn, depth - 1);
      Dragon(x2, y2, xn, yn, depth - 1);
    end;
  end;

begin
  angle := sin(pi / 4);
  Dragon(Round(x - 100 * scale), Round(y - 50 * scale), Round(x + 100 * scale), Round(y - 50 * scale), depth);
end;

end.