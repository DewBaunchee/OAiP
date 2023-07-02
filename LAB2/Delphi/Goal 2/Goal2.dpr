program Goal2;

{$APPTYPE CONSOLE}

uses
    SysUtils;

function convert(P : Integer): string;
var
    Answer: string;
begin
    Answer := IntToStr(P mod 2) + '';
    P := P div 2;
    while P > 0 do
    begin
        Answer := IntToStr(P mod 2) + Answer;
        P := P div 2;
    end;
    Result := Answer;
end;

procedure output(Answer : String);
begin
    WriteLn('Answer:  ', Answer);
end;

procedure main();
var
    P: integer;
    Valid: boolean;
begin
    Valid := false;
    WriteLn('This program converts a number from decimal to binary.');
    WriteLn;
    WriteLn('Enter natural number (<2 147 483 648)');

    repeat
        try
            begin
                ReadLn(P);
                if P < 1 then
                    WriteLn('Enter natural number!')
                else
                    Valid := true;
            end;
        except
            WriteLn('INPUT ERROR');
        end;
    until Valid;

    output(convert(P));
    ReadLn;
end;
begin
    main();
end.
