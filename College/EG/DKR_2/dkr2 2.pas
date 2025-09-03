procedure vvod(var s:string;s1:string);
begin
writeln(s1);
readln(s);
end;
function del(s,ps:string):string;
var i,p:integer;
begin
if pos(ps,s)>0 then delete(s,pos(ps,s),length(ps));
i:=length(s)-length(ps)+1;
p:=0;
while (i>0)and(p=0) do
if copy(s,i,length(ps))=ps then p:=i
else dec(i);
if p>0 then delete(s,p,length(ps));
del:=s;
end;
procedure vyvod(s,s1,ps:string);
begin
writeln(s1,ps);
writeln(s);
end;
var s,ps:string;
begin
vvod(s,'Введите строку');
vvod(ps,'Введите подстроку');
s:=del(s,ps);
vyvod(s,'Удаление первой и последней подстроки ',ps);
readln
end.