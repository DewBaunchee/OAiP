program Goal1;
uses
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

var
   x1, x2, y1, y2, r1, r2 : double;
   valid : boolean;
   answer : char;
begin
   valid := false;
   Writeln('Do points lie on the same circle?');
   repeat
      try
         Writeln('x1, y1, x2, y2:');
         Readln(x1, y1, x2, y2);
         valid := true;
      except
         Writeln('INPUT ERROR');
      end;
   until valid = true;

   r1 := sqrt(x1*x1 + y1*y1);
   r2 := sqrt(x2*x2 + y2*y2);

   if ( abs(r1 - r2) < 0.001) then
   begin
      answer := 'Y';
   end
   else
   begin
      answer := 'N';
   end;
   Writeln(answer);
   Readln;
end.

