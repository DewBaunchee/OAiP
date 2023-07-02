program pass;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type
    TMatrix = array of array of Integer;
procedure InputData(var Table : TMatrix);
var
    i, j, k, N : Integer;
begin
    k := 1;
    WriteLn('Enter number of teams:');
    ReadLn(N);
    SetLength(Table, N, N);
    for i := 0 to High(Table) do
    begin
        Table[i][i] := 0;
        for j := k to High(Table) do
        begin
            WriteLn('Table[', i, '][', j, ']: ');
            ReadLn(Table[i][j]);
            Table[j][i] := 2 - Table[i][j];
        end;
        inc(k);
    end;
end;

procedure ShowMatrix(Table : TMatrix);
var
    i, j : Integer;
begin
    Write(#13#10 + 'Matches  : ');
    for i := 1 to Length(Table) do
        Write(i, ' ');
    Write(#13#10 + '--------');
    for i := 0 to High(Table) do
    begin
        Write(#13#10 + 'Team ', i + 1, '-th: ');
        for j := 0 to High(Table) do
            Write(Table[i][j], ' ');
    end;
end;

procedure Calculating(var Table : TMatrix);
var
    i, j, k : Integer;
begin
    k := 1;
    for i := 0 to High(Table) do
    begin
        for j := k to High(Table) do
                Table[i][i] := Table[i][i] + Table[i][j];
        inc(k);
    end;
end;

procedure OutputData(Table : TMatrix);
var
    i : Integer;
begin
    for i := 0 to High(Table) do
        Write(#13#10 + 'Count of ', i + 1, '-th team: ', Table[i][i]);
end;

var
    Table : TMatrix;
begin
    InputData(Table);
    WriteLn('Entered table: ');
    ShowMatrix(Table);
    Calculating(Table);
    OutputData(Table);
    Readln;
end.
