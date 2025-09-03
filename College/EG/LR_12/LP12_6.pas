var
   filetext1,filetext2: text;
   s:string;
begin
assign(filetext1,'C:\Users\raydi\OneDrive\Desktop\lr12\text6.txt');
assign(filetext2,'C:\Users\raydi\OneDrive\Desktop\lr12\text66.txt');
reset(filetext1);
rewrite(filetext2);
while not eof(filetext1) do
  begin
    readln(filetext1,s);
    if s='' then 
      continue;
    writeln(filetext2,s);
   end;
   close(filetext1);
   close(filetext2);
  end.