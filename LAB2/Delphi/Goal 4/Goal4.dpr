program Goal4;

uses
    SysUtils;

type
    ArrayOfInteger = array of Integer;

function sort(arr: ArrayOfInteger): ArrayOfInteger;
var
    i, j, Value: Integer;
begin
    for i := 0 to Length(arr) - 1 do
        for j := 0 to Length(arr) - 1 do
            if arr[i] < arr[j] then
            begin
                Value := arr[j];
                arr[j] := arr[i];
                arr[i] := Value;
            end;
    Result := arr;
end;

function splitToInt(S: String; Size: Integer): ArrayOfInteger;
var
    arr: ArrayOfInteger;
    i: Integer;
begin
    SetLength(arr, Size);
    i := 0;
    while (pos(', ', S) > 0) and (i < Size) do
    begin
        arr[i] := StrToInt(Copy(S, 1, (pos(', ', S) - 1)));
        delete(S, 1, pos(', ', S) + 1);
        inc(i);
    end;
    arr[i] := StrToInt(S);
    Result := arr;
end;

function arrConcat(A, B: ArrayOfInteger): ArrayOfInteger;
var
    C: ArrayOfInteger;
    i: Integer;
begin
    SetLength(C, Length(A) + Length(B));
    for i := 0 to Length(A) - 1 do
        C[i] := A[i];
    for i := Length(A) to Length(B) + Length(A) - 1 do
        C[i] := B[i - Length(A)];
    Result := C;
end;

procedure arrOut(arr: ArrayOfInteger; var outF: TextFile);
var
    i: Integer;
    str: String;
begin
    str := IntToStr(arr[0]);
    for i := 1 to Length(arr) - 1 do
        str := str + ', ' + IntToStr(arr[i]);
    Writeln(outF, str);
    Writeln(#13#10 + str);
end;

procedure main();
var
    A, B, C: ArrayOfInteger;
    M, N: Integer;
    Reader: String;
    inF, outF: TextFile;
    Valid: boolean;
begin
    Valid := false;
    repeat
        try
            Writeln('Enter input file directory: ');
            ReadLn(Reader);
            AssignFile(inF, Reader);
            Reset(inF);
            Valid := true;
        except
            Writeln('File not found');
        end;
    until Valid;

    Writeln('Enter output file directory: ');
    ReadLn(Reader);
    AssignFile(outF, Reader);
    Rewrite(outF);

    try
        ReadLn(inF, Reader);
        N := StrToInt(Reader);
        ReadLn(inF, Reader);
        M := StrToInt(Reader);
        ReadLn(inF, Reader);
        A := splitToInt(Reader, N);
        ReadLn(inF, Reader);
        B := splitToInt(Reader, M);
    except
        Writeln(outF, 'INPUT ERROR');
        Writeln('INPUT ERROR');
        Valid := false;
    end;
    if Valid then
    begin
        SetLength(A, N);
        SetLength(B, M);
        SetLength(C, M + N);

        A := sort(A);
        B := sort(B);
        C := sort(arrConcat(A, B));

        arrOut(C, outF);

        Close(inF);
        Close(outF);
    end;
    ReadLn;
end;

begin
    main();
end.
