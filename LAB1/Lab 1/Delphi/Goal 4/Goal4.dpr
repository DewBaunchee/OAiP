program Goal4;
uses
   SysUtils;
var
   N, I, Sign : integer;
   A : array [0..9] of integer;
   Valid, arrayValid : boolean;
begin
   Valid := false;
   arrayValid := false;
   Sign := -1;
   I := 0;
   WriteLn('Calculation: A[1] - A[2] + A[3] - ... + (-1)^(n-1)A[n]');
   repeat
      try
         Write('Number of elements(<11): ');
         ReadLn(N);
         if N > 10 then
            begin
               N := 10;
               WriteLn('The entered number is too big. Maximum set(10).');
            end;
         while I < N do
         repeat
            try
               Write('A[', (I + 1), ']: ');
               ReadLn(A[I]);
               arrayValid := true;
               I := I + 1;
            except
               WriteLn('Invalid element');
            end;
         until arrayValid;
         Valid := true;
      except
         WriteLn('INPUT ERROR');
      end;
   until Valid;
   for I := 1 to N - 1 do
   begin
      A[0] := A[0] + Sign*A[I];
      Sign := -Sign;
   End;
   WriteLn(A[0], ' - answer');
   ReadLn;
end.

