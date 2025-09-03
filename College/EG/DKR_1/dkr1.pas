var x,y:real;
begin
  x:=-10;
  while x<=8 do
  begin
  if x<-8 then
    y:=(e**x) 
  else if (x>=-8) and (x<-1) then
  y:=(tan(x)*16+cos(x)/cos(2*x))
  else if (x>=-1) and (x<6) then
    y:=ln(abs(x))/67-tan(x)/-x
  else if x>=6 then
    y:=(x**(1/3)*-x-log(x));
  writeln('x=',x:2:1,'  y= ',y:6:3);
  x+=0.1;
  end;
end.