var
  fInp, fOut: TextFile;
  n, min, max: Integer;
begin
  assignfile(fInp, 'C:\Users\raydi\OneDrive\Desktop\lr12\text55.txt');
  reset(fInp);  
  readLn(fInp, n);
  min := n;
  max := n;
  while not eof(fInp) do
  begin
    readln(fInp, n);
      if n < min then
        min := n;
      if n > max then
        max := n;
  end;
  closefile(fInp);
  assignfile(fOut, 'C:\Users\raydi\OneDrive\Desktop\lr12\text56.txt');
  rewrite(fOut);
  writeln(fOut, 'Минимальное число: ', min);
  writeln(fOut, 'Максимальное число: ', max);
  closefile(fOut);
end.