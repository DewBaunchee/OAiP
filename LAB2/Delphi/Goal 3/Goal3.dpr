program Goal3;

uses
    SysUtils;

type
    ArrayOfString = array of String;

function IsMatrixIdentity(A: array of ArrayOfString): Boolean;
var
    Row, Col: Integer;
    Res: Boolean;
begin
    Res := true;
    for Row := 0 to length(A) - 1 do
    begin
        col := 0;
        while (Col < length(A[Row])) and (Res) do
        begin
            if Col = Row then
                if A[Row][Col] = '1' then
                    inc(Col)
                else
                    Res := false
            else if A[Row][Col] = '0' then
                inc(Col)
            else
                Res := false;
        end;
    end;
    Result := Res;
end;

function Split(S: String; N: Integer): ArrayOfString;
var
    A: ArrayOfString;
    I: Integer;
begin
    SetLength(A, N);
    I := 0;
    while (pos(' ', S) > 0) and (I < N + 1) do
    begin
        A[I] := Copy(S, 1, (pos(' ', S) - 1));
        delete(S, 1, pos(' ', S));
        inc(I);
    end;
    A[I] := S;
    Result := A;
end;

procedure Main();
var
    N, I, J: Integer;
    Reader: String;
    A: array of ArrayOfString;
    InF, OutF: TextFile;
    Valid: Boolean;
begin
    Valid := false;
    repeat
        try
            WriteLn('Enter input file directory: ');
            ReadLn(Reader);
            AssignFile(InF, Reader);
            Reset(InF);
            Valid := true;
        except
            WriteLn('File not found');
        end;
    until Valid;
    WriteLn('Enter output file directory: ');
    ReadLn(Reader);
    AssignFile(OutF, Reader);
    Rewrite(OutF);
    Valid := false;
    try
        begin
            ReadLn(InF, Reader);
            N := StrToInt(Reader);
            SetLength(A, N, N);
            for I := 0 to N - 1 do
            begin
                ReadLn(InF, Reader);
                A[I] := Split(Reader, N);
            end;
            Valid := true;
        end;
    except
        WriteLn(OutF, 'INPUT ERROR');
        WriteLn('INPUT ERROR');
    end;

    if Valid then
    begin
        WriteLn;
        WriteLn(OutF, 'Is entered matrix identity?');
        WriteLn('Is entered matrix identity?');
        WriteLn;
        for I := 0 to length(A) - 1 do
        begin
            for J := 0 to length(A) - 2 do
            begin
                Write(OutF, A[I][J], ', ');
                Write(A[I][J], ', ');
            end;
            WriteLn(OutF, A[I][J]);
            WriteLn(A[I][J]);
        end;
        WriteLn(outF);
        WriteLn;
        if IsMatrixIdentity(A) then
        begin
            WriteLn(OutF, 'YES');
            WriteLn('YES')
        end
        else
        begin
            WriteLn(OutF, 'NO');
            WriteLn('NO')
        end;
    end;

    CloseFile(InF);
    CloseFile(OutF);
end;

begin
    Main();
    ReadLn;

end.
