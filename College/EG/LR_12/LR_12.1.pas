var
   filetext: text;
   a: string;
   i: integer;
begin
   assign(filetext, 'C:\Users\raydi\OneDrive\Desktop\lr12\text.txt');
     rewrite(filetext);
   for i := 1 to 10 do
   begin
       writeln(filetext, i);  
   end;
   close(filetext); 

   reset(filetext);
   for i := 1 to 10 do
   begin
       readln(filetext, a);  
       writeln(a); 
   end;
   close(filetext);  
end.