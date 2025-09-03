var
  f: file of char;
  i,x:integer;
  s:string;
  k:char;
begin
  assign(f,'C:\Users\raydi\OneDrive\Desktop\lr13\text1.txt');
  reset(f);
  while not eof(f) do
  begin
    read(f,k);
    s+=k;
  end;
  for i:=1 to (length(s)) do
  begin
    if s[i]=' ' then
      x:=i;     
  end;
  delete(s,x,(length(s)-x+1));
  rewrite(f);
  reset(f);
  for i:=1 to (length(s)) do 
    begin
    k:=s[i];
    write(f,k);
    end;
  close(f);
end.