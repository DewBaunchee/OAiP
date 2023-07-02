program Goal1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function Definition(St1, St2 : String; K : Integer) : Integer;
var
    DeletedLength : Integer;
begin
    DeletedLength := 0;
    while (K > 1) and (pos(St1, St2) > 0) do
    begin
        DeletedLength := DeletedLength + pos(St1, St2) + Length(St1) - 1;
        delete(St2, 1, pos(St1, St2) + Length(St1) - 1);
        dec(K);
    end;
    if pos(st1, st2) = 0 then
        Definition := 0
    else
        Definition := pos(St1, St2) + DeletedLength;
end;

procedure InputData(var St1, St2 : String; var K : Integer);
var
    InValid : Boolean;
begin
    InValid := false;
    WriteLn('Enter St1: ');
    ReadLn(St1);
    WriteLn('Enter St2: ');
    ReadLn(St2);
    repeat
        try
            WriteLn('Enter K: ');
            ReadLn(K);
            InValid := true;
        except
            WriteLn('INPUT ERROR');
        end;
    until InValid;
end;

procedure InputDataFromFile(var St1, St2 : String; var K : Integer);
var
    InF : TextFile;
    InValid : Boolean;
    Reader : String;
begin
    InValid := false;
    repeat
        try
            WriteLn('Enter path to input file: ');
            ReadLn(Reader);
            AssignFile(InF, Reader);
            Reset(InF);
            InValid := true;
        except
            WriteLn('INPUT ERROR');
        end;
    until InValid;
    ReadLn(InF, St1);
    ReadLn(InF, St2);
    try
        ReadLn(InF, K);
    except
        WriteLn('INPUT ERROR');
        InValid := false;
    end;
    if InValid then
    begin
        WriteLn('Entered St1: ', St1);
        WriteLn('Entered St2: ', St2);
        WriteLn('Entered K: ', K);
    end;
    Close(InF);
end;

procedure OutputData(Answer : Integer);
var
    OutF : TextFile;
    Reader : String;
begin
    WriteLn('Enter path to output file: ');
    ReadLn(Reader);
    AssignFile(OutF, Reader);
    Rewrite(OutF);
    WriteLn(OutF, Answer, ' - Answer');
    WriteLn(Answer, ' - Answer');
    Close(OutF);
end;

procedure Main();
var
    St1, St2 : String;
    K : Integer;
    Reader : Char;
    InValid : Boolean;
begin
    WriteLn('This program defines index of k-th match of St1 in St2. If there are no matches it should return 0' + #13#10);
    InValid := false;
    repeat
        WriteLn('Enter "C" if you want to input data from console or' + #13#10 + '"F" if you want to input data from file');
        ReadLn(Reader);
        case Reader of
            'C' :
            begin
                InputData(St1, St2, K);
                InValid := true;
            end;
            'F' :
            begin
                InputDataFromFile(St1, St2, K);
                InValid := true;
            end;
        end;
    until InValid;
    OutputData(Definition(St1, St2, K));
    ReadLn;
end;

begin
    Main();
end.
