var
   filetext1,filetext2: text;
   k,i:integer;
   s:string;
begin
assign(filetext1,'C:\Users\raydi\OneDrive\Desktop\lr12\text4.txt');
assign(filetext2,'C:\Users\raydi\OneDrive\Desktop\lr12\text44.txt');
k:=3;
reset(filetext1);
rewrite(filetext2);
i:=0;
while not eof(filetext1) do
  begin
    readln(filetext1,s);
    inc(i);
    if i=k then 
      writeln(filetext2);
      writeln(filetext2,s);
   end;
   close(filetext1);
   close(filetext2);
  end.