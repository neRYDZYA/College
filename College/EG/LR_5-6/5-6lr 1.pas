var
q,i,z,k,d,s1,s2:integer;
a:array [0..10] of integer;
b:array [0..10] of integer;
begin
  for i:=1 to 10 do
  begin
    writeln('Введите ',i,' элемент массива а');
    readln(q);
    a[i]:=q;
  end;
  s1:=0;
  for i:=1 to 10 do
    s1:=s1+a[i];
  for k:= 1 to 10 do
  begin
      writeln('Введите ',k,' элемент массива b');
    readln(z);
    b[k]:=z;
  end;
  begin
   s2:=0;
  for i:=1 to 10 do
    s2:=s2+b[k];
  end;
  if s2>s1 then
    for i:=1 to 10 do
    write(b[i]*10,'  ')
  else
    for i:=1 to 10 do
    write(a[i]*10,'   ')
  
  
  
end.