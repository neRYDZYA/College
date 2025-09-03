var 
m, n, i, s, j, sum,k: integer;
filetext1,filetext2: text;
st:string;
begin
  assign(filetext1,'C:\Users\raydi\OneDrive\Desktop\lr12\z3in.txt');
  reset(filetext1);
  readLn(filetext1, st);
  val(st,n,k);
  m:=1;
  sum:=0;
  for j:=1 to n do
    begin
      s:=0;
      for i := 2 to m div 2 do
        if m mod i = 0 then
          begin
          s+=1
          end;
      m := m + 1;
      if s+2=5 then
        sum:=sum+(m-1);
    end;
    assign(filetext2,'C:\Users\raydi\OneDrive\Desktop\lr12\z3out.txt');
    rewrite(filetext2);
    writeln(filetext2,sum);
    close(filetext1);
    close(filetext2);
end.