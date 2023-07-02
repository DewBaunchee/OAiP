program Goal1;
uses
   SysUtils;
Const
   MAX_LENGTH = 21;
   MAX_SIZE = 100000001;
   MIN_SIZE = -100000001;
var
   A : array [0..MAX_LENGTH-1] of double;
   Sum : double;
   i, N, PositiveCount : integer;
   Valid : boolean;
begin
   PositiveCount := 0;
   Sum := 0;
   N := 0;
   Valid := false;
   WriteLn('This program calculates arithmetic mean of all positive elements.');
   WriteLn;
   repeat
      try
         WriteLn('Enter number of elements  (<', MAX_LENGTH,'):');
         ReadLn(N);
         if (N > 0) and (N < MAX_LENGTH) then
            Valid := true
         else
            WriteLn('Error! Value is not valid.');
      except
          WriteLn('INPUT ERROR!');
      end;
   until Valid;
   Valid := false;
   N := N - 1;
   for i := 0 to N do
   begin
      repeat
         try
            WriteLn('Enter element A[', i + 1,'] (absolute value less than ', MAX_SIZE,'):');
            ReadLn(A[i]);
            if (A[i] < MAX_SIZE) and (A[i] > MIN_SIZE) then
               Valid := true
            else
               WriteLn('Error! Value is not valid.');
         except
             WriteLn('INPUT ERROR!');
         end;
      until Valid;
   end;

   for i := 0 to N do
      if (A[i] > -1) then
      begin
         Sum := Sum + A[i];
         inc(PositiveCount);
      end;
   Sum := Sum/PositiveCount;
   WriteLn(Sum:13:3 , ' - ANSWER.');
   Readln;
end.

