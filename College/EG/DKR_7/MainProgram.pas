program HarterHeighwayDragon;

uses
  GraphABC, FractalModule;

var
  scale: real := 1.0;
  depth: integer := 10;
  offsetX: integer := 0;
  offsetY: integer := 0;

procedure DrawFractal;
begin
  ClearWindow ;
  FractalModule.DrawHarterHeighway(WindowWidth div 2 + offsetX, WindowHeight div 2 + offsetY, scale, depth);
end;

procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Add: // Увеличение масштаба
      begin
        scale := scale * 1.1;
        DrawFractal;
      end;
    VK_Subtract: // Уменьшение масштаба
      begin
        scale := scale / 1.1;
        DrawFractal;
      end;
    VK_Up: // Перемещение вверх
      begin
        offsetY := offsetY - 10;
        DrawFractal;
      end;
    VK_Down: // Перемещение вниз
      begin
        offsetY := offsetY + 10;
        DrawFractal;
      end;
    VK_Left: // Перемещение влево
      begin
        offsetX := offsetX - 10;
        DrawFractal;
      end;
    VK_Right: // Перемещение вправо
      begin
        offsetX := offsetX + 10;
        DrawFractal;
      end;
    VK_Space: // Увеличение глубины прорисовки
      begin
        depth := depth + 1;
        DrawFractal;
      end;
    VK_Back: // Уменьшение глубины прорисовки
      begin
        if depth > 0 then
          depth := depth - 1;
        DrawFractal;
      end;
  end;
end;

begin
  SetWindowSize(800, 600);
  SetWindowCaption('Кривая Хартера-Хетуэя');
  OnKeyDown := KeyDown;
  DrawFractal;
end.