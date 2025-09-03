uses GRAPHabc;
function f(x: Real): Real;
begin
    f := 2*x**3+(0)*x**2+(3)*x+(4);
end;
function simps(a, b: Real; n: Integer): Real;
var
    h, int: Real;
    i: Integer;
begin
    if n mod 2 <> 0 then
        n := n + 1;   // Если n нечетное, увеличиваем на 1 
    h := (b - a) / n;
    int := f(a) + f(b);
    for i := 1 to n - 1 do
    begin
        if i mod 2 = 1 then
            int := int + 4 * f(a + i * h) // сумма членов с нечетными индексами
        else
            int := int + 2 * f(a + i * h); // сумма членов с чётными индексами
    end;
    int := int * h / 3;
    simps := int;
end;
function errest(a, b: Real; n: Integer): Real;
var
    sdmax, x, error: Real;
    i: Integer;
begin
    for i := 0 to n do
    begin
        x := a + i * (b - a) / n;
        if (6 * x + 4) > sdmax then // первообразная 2-ого порядка от начальной функции
            sdmax := 6 * x + 4;
    end;
    error := (b - a)*5/(180 *n**4)*sdmax; // Формула для вычисления погрешности
    errest := error;
end;
var
x1,y1,a,b,k,Sh:real;
    W,H,x,y,x0,y0,n,y2,x2:integer;
    choice: Char;
    area, error: Real;
begin
    W:=800;
    H:=600;
    SetWindowSize(W,H);
    repeat
      writeln('Меню:');
        writeln('1. Вычислить площадь фигуры');
        writeln('2. Визуализация');
        writeln('3. Выход');
        readln(choice);
        case choice of '1':
            begin          
         writeln('Введите нижний предел интегрирования (a): ');
          readln(a);
         writeln('Введите верхний предел интегрирования (b): ');
          readln(b);
         writeln('Введите количество подынтервалов: ');
          readln(n);
          area := simps(a, b, n);
       error := errest(a, b, n);
         writeln(' Площадь фигуры: ', area:0:6);
         writeln(' Оценка погрешности: ', error:0:6);                
            end;
            '2':
                begin              
         writeln('Введите нижний предел интегрирования (a).');
          readln(a);
         writeln('Введите верхний предел интегрирования (b).');
          readln(b);
         writeln('Введите количество подынтервалов.');
          readln(n);
         writeln('Введите масштабирование ');
          readln(k);
                area := simps(a, b, n);
                error := errest(a, b, n);
                clearwindow;
                x0:=W div 2;
                y0:=H div 2;
                line(x0,10,x0,H-10);
                line(10,y0,W-10,y0);
                textout(405,5,'Y');
                textout(780,300,'X');
                textout(2,10,'Визуализировать график функции f=2*x^3+(-1)*x^2+(-1)*x+16');
                x1:=a;
                while x1 <= b do
                begin
                 y1:=f(x1);
                 x:=x0+round(x1*k);
                 y:=y0-round(y1*k);
                 setpixel(x,y,clred);
                 x1+=0.0001;
                end;
                sh:=(b-a)/n;
                x1:=a;k := 7;
                while x1 <= b do
                begin
                y1:=f(x1);
             x:=x0+round(x1*k);
             y:=y0-round(y1*k);
             line(x,y,x,y0);
             x2:=x0+round((x1+Sh)*k);
             y2:=y0-round(f(x1+Sh)*k);
             line(x,y,x2,y2);
             x1+=Sh;
                end;
                end;
             '3':
                begin
                writeln('Вы завершили работу.'); 
                sleep(1000);
                closewindow;
                end
                   
            else
                writeln('Неверный выбор. Попробуйте снова.');
        end;

    until (choice = '3') or (choice = '2');
end.