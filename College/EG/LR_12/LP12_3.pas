var
   filetext: text;
   s:string;
begin
assign(filetext,'C:\Users\raydi\OneDrive\Desktop\lr12\text3.txt');
append(filetext);
s:='позитив';
writeln(filetext,s);
close(filetext)
end.