var
  filetxt: text;
  N,K,i:integer;
  a:string;
begin
  assign(filetxt,'C:\Users\raydi\OneDrive\Desktop\lr12\text2.txt');
  rewrite(filetxt);
  N:= 5;
  K:= 5;
  for i:=1 to N do
    a+='* ';
  for i:=1 to K do
    writeln(filetxt, a);
    close(filetxt)
end.