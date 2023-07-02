unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtDlgs;

type
    ArrayOfInteger = Array of Integer;

    TForm1 = class(TForm)
        Label1: TLabel;
        Result: TLabel;
        Label3: TLabel;
        ElemEdit: TEdit;
        Calculate: TButton;
        ErrorLabel: TLabel;
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
        procedure CalculateClick(Sender: TObject);
        procedure ElemEditKeyPress(Sender: TObject; var key: Char);
        procedure FormCreate(Sender: TObject);
        procedure FillArray(str: String; var A: ArrayOfInteger);
        procedure Open1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure Save1Click(Sender: TObject);
        procedure FillArrayFromFile(str: String; var A: ArrayOfInteger);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_NUMBER_OF_ELEMENTS = 10;
    MAX_ABS_VALUE = 200000000;

var
    Form1: TForm1;
    LastKey: Char;
    CurrentElement: String;
    A: ArrayOfInteger;
    NumberOfElements: Integer;
    FromFile, Valid: Boolean;

implementation

{$R *.dfm}

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

procedure TForm1.FillArrayFromFile(str: String; var A: ArrayOfInteger);
begin
    Valid := true;
    try
        while (Pos(' ', str) > 0) and Valid do
        begin
            SetLength(A, Length(A) + 1);
            A[High(A)] := StrToInt(Copy(str, 1, (Pos(' ', str) - 1)));
            delete(str, 1, Pos(' ', str));
            if abs(A[High(A)]) > MAX_ABS_VALUE then
            begin
                Valid := false;
                ErrorLabel.Caption := 'Error! A[' + IntToStr(High(A)) +
                  '] is bigger than ' + IntToStr(MAX_ABS_VALUE) + '.';
            end;
        end;
        SetLength(A, Length(A) + 1);
        A[High(A)] := StrToInt(str);
        if abs(A[High(A)]) > MAX_ABS_VALUE then
        begin
            Valid := false;
            ErrorLabel.Caption := 'Error! A[' + IntToStr(High(A)) +
              '] is bigger than ' + IntToStr(MAX_ABS_VALUE) + '.';
        end;
    except
        ErrorLabel.Caption := 'Error! INPUT ERROR';
        Valid := false;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    LastKey := ' ';
    CurrentElement := '';
    NumberOfElements := 0;
    FromFile := false;
    Valid := true;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
    Reader: String;
    InF: TextFile;
begin
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            if EoF(InF) then
                ErrorLabel.Caption := 'Error! File is empty.'
            else
            begin
                ReadLn(InF, Reader);
                ElemEdit.Text := Reader;
                FromFile := true;
                LastKey := ElemEdit.Text[Length(ElemEdit.Text)];
            end;
        except
            ErrorLabel.Caption := 'Error! Cannot assign file.';
        end;
    CloseFile(InF);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program calculate result by formule A[1] - A[2]+...+(-1)*(n-1)A[n] (n - number of elements)',
      'About program', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Save1Click(Sender: TObject);
var
    OutF: TextFile;
begin
    if SaveTextFileDialog1.Execute then
        try
            AssignFile(OutF, SaveTextFileDialog1.FileName);
            Rewrite(OutF);
            WriteLn(OutF, Result.Caption);
        except
            MessageDlg('Unknown file error', mtError, [mbOk], 0);
        end;
    CloseFile(OutF);
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda.', 'About author',
      MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_ICONQUESTION + MB_YESNO) = 6 then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.CalculateClick(Sender: TObject);
var
    I, Sign, N: Integer;
begin
    if FromFile then
        FillArrayFromFile(Trim(ElemEdit.Text), A)
    else
        FillArray(Trim(ElemEdit.Text), A);
    if Valid then
    begin
        Sign := -1;
        for I := 1 to High(A) do
        begin
            A[0] := A[0] + Sign * A[I];
            Sign := -Sign;
        End;
        Result.Caption := IntToStr(A[0]);
        NumberOfElements := 0;
        SetLength(A, 0);
    end;
end;

procedure TForm1.ElemEditKeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            begin
                delete(CurrentElement, Length(CurrentElement), 1);
                if Length(ElemEdit.Text) > 0 then
                begin
                    if LastKey = ' ' then
                        Dec(NumberOfElements);
                    LastKey := ElemEdit.Text[Length(ElemEdit.Text) - 1]
                end
                else
                begin
                    LastKey := ' ';
                    FromFile := false;
                end;
            end;
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
                ErrorLabel.Caption := 'Error! Max number of elements is ' + IntToStr(MAX_NUMBER_OF_ELEMENTS) + '.';
            end
            else if (Length((Sender as TEdit).Text) < 1) or (LastKey = ' ') or
              (LastKey = '-') then
                key := #0
            else
            begin
                Inc(NumberOfElements);
                CurrentElement := '';
            end;
        '-':
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
