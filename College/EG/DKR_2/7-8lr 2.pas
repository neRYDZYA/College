var
s:string;
a,b,i:integer;
begin
  a:=0;
  b:=0;
  write('Введите строку');
  readln(s);
  for i:=1 to length(s) do begin
    if( s[i] ='+') or ( s[i] = '-') then
    begin
      a:=a+1;
      if ( i< length(s)) and (s [i+1] = '0') then
        b:=b+1;
    end;
  end;
WriteLn('Общее количество символов + и -: ', a);
WriteLn('Количество символов +/-, после которых следует 0: ',b);
end.

