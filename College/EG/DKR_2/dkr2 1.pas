var
  arr: array[1..20] of integer;
  n, i: integer;
  M: boolean;
  B: boolean;
  D: boolean;
begin 
  writeln('Введите количество элементов массива ');
  readln(n);
  writeln('Введите элементы массива:');
  for i := 1 to n do
  begin
    read(arr[i]);
  end;
  B := true;
  D := true;
  for i := 2 to n do
  begin
    if i mod 2 = 0 then
    begin
      if (i < n) and (arr[i] < arr[i + 2]) then
        D := false; 
      if (i < n) and (arr[i] > arr[i + 2]) then
        B := false; 
    end;
  end;
  M := B or D;
  if M then
    writeln('Подпоследовательность элементов на четных позициях является монотонной.')
  else
    writeln('Подпоследовательность элементов на четных позициях не является монотонной.');
  readln;
end.