procedure row(n:integer);//parametrizatsia
begin
     if n >=1 then begin // baza
        write (n, ' ');
        row(n-2)// dekompozitcsia
     end;
end;
begin
    row(25);
end.