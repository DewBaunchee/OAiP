program Goal3;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    ArrayOfInteger = array of Integer;

function PrintArray(MyArray: ArrayOfInteger): String;
var
    I, HighMinusOne: Integer;
    Printer: String;
begin
    HighMinusOne := High(MyArray) - 1;
    Printer := '{ ';
    for I := 0 to HighMinusOne do
        Printer := Printer + IntToStr(MyArray[I]) + ', ';
    Printer := Printer + IntToStr(MyArray[High(MyArray)]) + ' }';
    PrintArray := Printer;
end;

procedure InputData(var MyArray: ArrayOfInteger);
var
    I, N: Integer;
    Valid: Boolean;
begin
    WriteLn('Enter number of elements ( 0 < N < 21 ): ');
    Valid := false;
    repeat
        try
            ReadLn(N);
            if (N > 20) or (N < 1) then
                WriteLn('Invalid number of elements.')
            else
                Valid := true;
        except
            WriteLn('INPUT ERROR');
        end;
    until Valid;
    Valid := false;
    SetLength(MyArray, N);
    WriteLn('Enter elements (not bigger than 100 000 000): ');
    for I := 0 to High(MyArray) do
    begin
        repeat
            try
                Write('MyArray[', I + 1, ']: ');
                ReadLn(MyArray[I]);
                if MyArray[I] > 100000000 then
                    WriteLn('Element is too big')
                else
                    Valid := true;
            except
                WriteLn('INPUT ERROR');
            end;
        until Valid;
        Valid := false;
    end;
end;

function InputDataFromFile(var MyArray: ArrayOfInteger): Boolean;
var
    InF: TextFile;
    I, N: Integer;
    Valid: Boolean;
    Reader: String;
begin
    Result := true;
    WriteLn('Enter path to input file');
    Valid := false;
    repeat
        try
            ReadLn(Reader);
            AssignFile(InF, Reader);
            Reset(InF);
            Valid := true;
        except
            WriteLn('File not found');
        end;
    until Valid;
    try
        ReadLn(InF, N);
        if (N > 20) or (N < 1) then
        begin
            WriteLn('Too many of elements');
            Result := false;
        end
        else
            SetLength(MyArray, N);
    except
        WriteLn('INPUT ERROR');
    end;
    if Result then
        try
            for I := 0 to High(MyArray) do
            begin
                Read(InF, MyArray[I]);
                if MyArray[I] > 100000000 then
                begin
                    WriteLn('One or more elements are too big');
                    Result := false;
                end;
            end;
        except
            WriteLn('INPUT ERROR');
        end;
    Close(InF);
    InputDataFromFile := Result;
end;

procedure Sorting(MyArray: ArrayOfInteger);
var
    I, Temp, K, Highest: Integer;
    Breaker: Boolean;
begin
    Breaker := true;
    Highest := High(MyArray);
    for I := 1 to Highest do
    begin
        Temp := MyArray[I];
        K := I - 1;
        while (Breaker) and (K > -1) do
            if Temp < MyArray[K] then
            begin
                MyArray[K + 1] := MyArray[K];
                MyArray[K] := Temp;
                dec(K);
            end
            else
                Breaker := false;
        Breaker := true;
        WriteLn(I, ' step of sorting: ', PrintArray(MyArray));
    end;
end;

procedure OutputData(var MyArray: ArrayOfInteger);
var
    OutF: TextFile;
    Valid: Boolean;
    Reader: String;
begin
    WriteLn('Enter path to output file:');
    Valid := false;
    repeat
        try
            ReadLn(Reader);
            AssignFile(OutF, Reader);
            Rewrite(OutF);
            Valid := true;
        except
            WriteLn('File not found');
        end;
    until Valid;
    WriteLn(OutF, 'Sorted array: ' + #13#10 + PrintArray(MyArray));
    WriteLn('Sorted array: ' + #13#10 + PrintArray(MyArray));
    Close(OutF);
end;

procedure Main();
var
    Valid, ElementsValid: Boolean;
    Choice: Char;
    MyArray: ArrayOfInteger;
begin
    ElementsValid := true;
    Valid := false;
    WriteLn('This program sort entered array by simple insertions.');
    repeat
        WriteLn('Select input method: "C" - console');
        WriteLn('                     "F" - file');
        ReadLn(Choice);
        case Choice of
            'C':
                begin
                    InputData(MyArray);
                    Valid := true;
                end;
            'F':
                begin
                    ElementsValid := InputDataFromFile(MyArray);
                    Valid := true;
                end;
        else
            WriteLn('Error! Try again.');
        end;
    until Valid;
    if ElementsValid then
    begin
        WriteLn('Entered array: ');
        WriteLn(PrintArray(MyArray));
        Sorting(MyArray);
        OutputData(MyArray);
    end
    else
        WriteLn('There is an invalid data in file.');
    ReadLn;
end;

begin
    Main();

end.
