uses crt;
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
a, b: Real;
n: Integer;
choice: Char;
area, error: Real;
begin
    repeat
        TextColor(15);
        writeln('Меню:');
        TextBackground(2);
        writeln('1. Вычислить площадь фигуры');
        TextBackground(4); 
        writeln('2. Выход');
        TextBackground(0);
        write('Выберите опцию: ');
        readln(choice);
        case choice of '1':
            begin
               
                ClrScr;
                write('Введите нижний предел интегрирования (a): ');
                readln(a);
                write('Введите верхний предел интегрирования (b): ');
                readln(b);
                write('Введите количество подынтервалов: ');
                readln(n);
                area := simps(a, b, n);
                error := errest(a, b, n);
                writeln('Площадь фигуры: ', area:0:6);
                writeln('Оценка погрешности: ', error:0:6);
            end;
            '2':
                writeln('Выход из программы.');
            else
                writeln('Неверный выбор. Попробуйте снова.');
        end;
    until choice = '2';
end.