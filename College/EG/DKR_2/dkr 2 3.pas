var
  inputStr, subStr: array[1..100] of char;
  lenStr, lenSub, firstPos, lastPos, i, j: integer;
  found: boolean;
begin
  writeln('Введите строку:');
  lenStr := 0;
  repeat
    lenStr := lenStr + 1;
    read(inputStr[lenStr]);
  until eoln;
  readln;
  writeln('Введите подстроку:');
  lenSub := 0;
  repeat
    lenSub := lenSub + 1;
    read(subStr[lenSub]);
  until eoln;
  readln;
  firstPos := -1;
  i := 1;
  while (i <= lenStr - lenSub + 1) and (firstPos = -1) do
  begin
    found := true;
    for j := 1 to lenSub do
      if inputStr[i + j - 1] <> subStr[j] then
        found := false;
    if found then
      firstPos := i;
    i := i + 1;
  end;
  lastPos := -1;
  i := lenStr - lenSub + 1;
  while (i >= 1) and (lastPos = -1) do
  begin
    found := true;
    for j := 1 to lenSub do
      if inputStr[i + j - 1] <> subStr[j] then
        found := false;
    if found then
      lastPos := i;
    i := i - 1;
  end;
  if firstPos <> -1 then
  begin
    for i := firstPos to lenStr - lenSub do
      inputStr[i] := inputStr[i + lenSub];
    lenStr := lenStr - lenSub;
  end;
  if (lastPos <> -1) and (lastPos <> firstPos) then
  begin
    for i := lastPos to lenStr - lenSub do
      inputStr[i] := inputStr[i + lenSub];
    lenStr := lenStr - lenSub;
  end;
  writeln('Итоговая строка: ');
  for i := 1 to lenStr do
    write(inputStr[i]);
  writeln;
end.