unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtDlgs, Vcl.StdCtrls;

type
    ArrayOfInteger = Array of Integer;

    TForm1 = class(TForm)
        MainMenu1: TMainMenu;
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
        File1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        About1: TMenuItem;
        Program1: TMenuItem;
        Author1: TMenuItem;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        ErrorLabel: TLabel;
        ConcatButton: TButton;
        Label5: TLabel;
        SecondEdit: TEdit;
        FirstEdit: TEdit;
        FinalArrayMemo: TMemo;
    ClearButton: TButton;
        procedure Open1Click(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure KeyPress(Sender: TObject; var key: Char);
        procedure ConcatButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        function Sort(arr: ArrayOfInteger): ArrayOfInteger;
        procedure FillArray(str: String; var A: ArrayOfInteger);
        function PrintArray(A: ArrayOfInteger): String;
    procedure ClearButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_NUMBER_OF_ELEMENTS = 10;
    MAX_ABS_VALUE = 999;

var
    Form1: TForm1;
    NumberOfElements: Integer;
    LastKey: Char;
    FromFile, Valid: Boolean;
    CurrentElement: String;
    A, B, C: ArrayOfInteger;

implementation

{$R *.dfm}

function PosR(key: Char; str: String): Integer;
var
    I: Integer;
begin
    I := Length(str);
    while I > 0 do
    begin
        if str[I] = key then
        begin
            PosR := I;
            I := 0;
        end;
        Dec(I);
    end;

end;

procedure TForm1.FillArray(str: String; var A: ArrayOfInteger);
begin
    while Pos(' ', str) > 0 do
    begin
        SetLength(A, Length(A) + 1);
        A[High(A)] := StrToInt(Copy(str, 1, (Pos(' ', str) - 1)));
        delete(str, 1, Pos(' ', str));
    end;
    SetLength(A, Length(A) + 1);
    A[High(A)] := StrToInt(str);
end;

function TForm1.PrintArray(A: ArrayOfInteger): String;
var
    I: Integer;
    Res: String;
begin
    Res := '';
    for I := 0 to High(A) do
        Res := Res + IntToStr(A[I]) + ' ';
    PrintArray := Res;
end;

function arrConcat(A, B: ArrayOfInteger): ArrayOfInteger;
var
    C: ArrayOfInteger;
    I: Integer;
begin
    SetLength(C, Length(A) + Length(B));
    for I := 0 to Length(A) - 1 do
        C[I] := A[I];
    for I := Length(A) to Length(B) + Length(A) - 1 do
        C[I] := B[I - Length(A)];
    Result := C;
end;

function TForm1.Sort(arr: ArrayOfInteger): ArrayOfInteger;
var
    I, J, Value: Integer;
begin
    for I := 0 to High(arr) do
        for J := 0 to High(arr) do
        begin
            if arr[I] < arr[J] then
            begin
                Value := arr[J];
                arr[J] := arr[I];
                arr[I] := Value;
            end;
        end;
    Result := arr;
end;

function CountElements(str: String): Integer;
var
    I, Res: Integer;
begin
    Res := 1;
    for I := 1 to Length(str) do
        if str[I] = ' ' then
            Inc(Res);
    CountElements := Res;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
    FirstEdit.Clear();
    SecondEdit.Clear();
    FinalArrayMemo.Clear();
end;

procedure TForm1.ConcatButtonClick(Sender: TObject);
begin
    FinalArrayMemo.Clear();
    FillArray(Trim(FirstEdit.Text), A);
    FillArray(Trim(SecondEdit.Text), B);

    C := Sort(arrConcat(A, B));
    FinalArrayMemo.Lines.Add(PrintArray(C));
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda.', 'About author',
      MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program execute concatination of entered arrays and sort final array.',
      'About program', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Open1Click(Sender: TObject);
var
    Reader, Checker: String;
    InF: TextFile;
    I: Integer;
begin
    I := 0;
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            if EoF(InF) then
            begin
                ErrorLabel.Caption := 'Error! File is empty.';
                Valid := false;
            end
            else
                try
                    ReadLn(InF, Reader); { Проверка первой строки файла }
                    Reader := Trim(Reader);
                    Checker := Reader;
                    while (Pos(' ', Checker) > 0) and (Valid) do
                    begin
                        if abs(StrToInt(Copy(Checker, 1, (Pos(' ', Checker) - 1)
                          ))) > MAX_ABS_VALUE then
                        begin
                            Valid := false;
                            ErrorLabel.Caption :=
                              'Error! Element is out of bounds.';
                        end
                        else
                        begin
                            delete(Checker, 1, Pos(' ', Checker));
                            Inc(I);
                        end;
                        if abs(StrToInt(Checker)) > MAX_ABS_VALUE then
                        begin
                            Valid := false;
                            ErrorLabel.Caption :=
                              'Error! Element is out of bounds.';
                        end
                        else
                            Inc(I);
                    end;
                    if I > MAX_NUMBER_OF_ELEMENTS then
                    begin
                        Valid := false;
                        ErrorLabel.Caption := 'Error! Too many of elements';
                    end;
                    if Valid then
                        FirstEdit.Text := Reader;

                    ReadLn(InF, Reader); { Проверка второй строки файла }
                    Reader := Trim(Reader);
                    Checker := Reader;
                    while (Pos(' ', Checker) > 0) and (Valid) do
                    begin
                        if abs(StrToInt(Copy(Checker, 1, (Pos(' ', Checker) - 1)
                          ))) > MAX_ABS_VALUE then
                        begin
                            Valid := false;
                            ErrorLabel.Caption :=
                              'Error! Element is out of bounds.';
                        end
                        else
                        begin
                            delete(Checker, 1, Pos(' ', Checker));
                            Inc(I);
                        end;
                        if abs(StrToInt(Checker)) > MAX_ABS_VALUE then
                        begin
                            Valid := false;
                            ErrorLabel.Caption :=
                              'Error! Element is out of bounds.';
                        end
                        else
                            Inc(I);
                    end;
                    if I > MAX_NUMBER_OF_ELEMENTS then
                    begin
                        Valid := false;
                        ErrorLabel.Caption := 'Error! Too many of elements';
                    end;
                    if Valid then
                        SecondEdit.Text := Reader;
                except
                    ErrorLabel.Caption := 'Error! Corrupted data.';
                    Valid := false
                end;
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(InF);
end;

procedure TForm1.Save1Click(Sender: TObject);
var
    OutF: TextFile;
begin
    if SaveTextFileDialog1.Execute then
        try
            AssignFile(OutF, SaveTextFileDialog1.FileName);
            Rewrite(OutF);
            WriteLn(OutF, FinalArrayMemo.Lines[0]);
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(OutF);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_ICONQUESTION + MB_YESNO) = 6 then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Valid := true;
end;

procedure TForm1.KeyPress(Sender: TObject; var key: Char);
begin

    NumberOfElements := CountElements((Sender as TEdit).Text);
    if NumberOfElements = 1 then
        CurrentElement := (Sender as TEdit).Text
    else
        CurrentElement := Copy((Sender as TEdit).Text,
          PosR(' ', (Sender as TEdit).Text), 1000);
    if Length((Sender as TEdit).Text) > 0 then
        LastKey := (Sender as TEdit).Text[Length((Sender as TEdit).Text)];
    case key of
        #8:
            ;
        '0':
            if (LastKey = '0') then
                if (StrToInt(CurrentElement) = 0) then
                    key := #0
                else if abs(StrToInt(CurrentElement + key)) > MAX_ABS_VALUE then
                begin
                    ErrorLabel.Caption := 'Error! You are trying to enter ' +
                      CurrentElement + key + ' (max absolute value is ' +
                      IntToStr(MAX_ABS_VALUE) + ')';
                    key := #0
                end;
        '1' .. '9':
            if abs(StrToInt(CurrentElement + key)) > MAX_ABS_VALUE then
            begin
                ErrorLabel.Caption := 'Error! You are trying to enter ' +
                  CurrentElement + key + ' (max absolute value is ' +
                  IntToStr(MAX_ABS_VALUE) + ')';
                key := #0
            end;
        ' ':
            if (NumberOfElements = MAX_NUMBER_OF_ELEMENTS) then
            begin
                key := #0;
                ErrorLabel.Caption := 'Error! Max number of elements is ' +
                  IntToStr(MAX_NUMBER_OF_ELEMENTS) + '.';
            end
            else if (Length((Sender as TEdit).Text) < 1) or (LastKey = ' ') or
              (LastKey = '-') then
                key := #0;
        '-':
            if (Length((Sender as TEdit).Text) > 0) then
                if not(LastKey = ' ') then
                    key := #0;
    else
        key := #0;
    end;
    if (ord(key) > 0) and (ord(key) <> 8) then
    begin
        LastKey := key;
        CurrentElement := CurrentElement + key;
    end;
end;

end.
