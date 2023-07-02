program Goal2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    SetOfChar = Set of Char;

const
    PATTERN = ['0' .. '9', '.', '^', '!', '+', '-', '*', '/'];

function Intersection(S: SetOfChar): SetOfChar;
begin
    Intersection := S * PATTERN;
end;

procedure InputData(var S: SetOfChar);
var
    Valid: Boolean;
    Reader: AnsiString;
    I: Integer;
begin
    Valid := false;
    repeat
        try
            WriteLn('Enter set (set length should be less than 256): ');
            ReadLn(Reader);
            if Length(Reader) < 256 then
            begin
                Valid := true;
                for I := 1 to Length(Reader) do
                    include(S, Reader[I]);
            end;
        except
            WriteLn('Entered set is too large');
        end;
    until Valid;
end;

procedure InputDataFromFile(var S: SetOfChar);
var
    InF: TextFile;
    Valid: Boolean;
    Reader: AnsiString;
    I: Integer;
begin
    Valid := false;
    repeat
        try
            WriteLn('Enter path to input file: ');
            ReadLn(Reader);
            AssignFile(InF, Reader);
            Reset(InF);
            Valid := true;
        except
            WriteLn('Invalid path');
        end;
    until Valid;
    ReadLn(InF, Reader);
    if Length(Reader) < 256 then
    begin
        WriteLn('Entered String: ', Reader);
        for I := 1 to Length(Reader) do
            include(S, Reader[I]);
    end
    else
        WriteLn('Entered set is too large');
    Close(InF);
end;

procedure OutputData(Answer: SetOfChar);
var
    OutF: TextFile;
    I: Integer;
    Reader: String;
begin
    WriteLn('Enter path to output file: ');
    ReadLn(Reader);
    AssignFile(OutF, Reader);
    Rewrite(OutF);
    for I := 0 to 255 do
        if Chr(I) in Answer then
        begin
            Write(OutF, Chr(I));
            Write(Chr(I));
        end;
    WriteLn(OutF, ' - answer.');
    WriteLn(' - answer.');
    Close(OutF);
end;

procedure Main();
var
    S: SetOfChar;
    Reader: Char;
    Valid: Boolean;
begin
    WriteLn('This program filters out everything except numbers and arithmetic operations, and create new string.'
      + #13#10);
    S := [];
    Valid := false;
    repeat
        WriteLn('Enter "C" if you want to input data from console or' + #13#10 +
          '"F" if you want to input data from file');
        ReadLn(Reader);
        case Reader of
            'C':
                begin
                    InputData(S);
                    Valid := true;
                end;
            'F':
                begin
                    InputDataFromFile(S);
                    Valid := true;
                end;
        end;
    until Valid;
    if SizeOf(S) > 0 then
        OutputData(Intersection(S))
    else
        WriteLn('Set is empty');
    ReadLn;
end;

begin
    Main();

end.
