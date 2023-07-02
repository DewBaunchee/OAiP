unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtDlgs, Vcl.StdCtrls;

type
    SetOfChar = Set of Char;

    TForm1 = class(TForm)
        Label1: TLabel;
        MainMenu1: TMainMenu;
        Label2: TLabel;
        Label3: TLabel;
        OriginalEdit: TEdit;
        FinalMemo: TMemo;
        ConvertButton: TButton;
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
        ClearButton: TButton;
        ErrorLabel: TLabel;
        procedure Open1Click(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure KeyPress(Sender: TObject; var key: Char);
        procedure MemoKeyPress(Sender: TObject; var key: Char);
        procedure ClearButtonClick(Sender: TObject);
        procedure InputSet(var S: SetOfChar);
        function SetToStr(Answer: SetOfChar): String;
        procedure ConvertButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_LENGTH = 255;
    PATTERN = ['0' .. '9', '.', '^', '!', '+', '-', '*', '/'];

var
    Form1: TForm1;
    S: SetOfChar;

implementation

{$R *.dfm}

procedure TForm1.InputSet(var S: SetOfChar);
var
    I: Integer;
    Reader: AnsiString;
begin
    Reader := OriginalEdit.Text;
    for I := 1 to Length(OriginalEdit.Text) do
    begin
        include(S, Reader[I]);
    end;
end;

function TForm1.SetToStr(Answer: SetOfChar): String;
var
    I: Integer;
    StringAnswer: String;
begin
    StringAnswer := '';
    for I := 0 to 255 do
        if Chr(I) in Answer then
            StringAnswer := StringAnswer + Chr(I);
    SetToStr := StringAnswer;
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program excludes all symbols except digits and some arithmetical operations',
      'About program', MB_OK + MB_ICONASTERISK);
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

procedure TForm1.Open1Click(Sender: TObject);
var
    InF: TextFile;
    Reader: String;
    I: Integer;
begin
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            Readln(InF, Reader);
            if Length(Reader) < 256 then
                OriginalEdit.Text := Reader
            else
                ErrorLabel.Caption := 'Entered set is too large';
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
            WriteLn(OutF, FinalMemo.Lines[0]);
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(OutF);
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
    FinalMemo.Clear();
    OriginalEdit.Clear();
end;

procedure TForm1.ConvertButtonClick(Sender: TObject);
begin
    FinalMemo.Clear();
    InputSet(S);
    FinalMemo.Lines.Add(SetToStr(S * PATTERN));
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_YESNO + MB_ICONQUESTION) = 6 then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.KeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
    else
        if Length(OriginalEdit.Text + key) > MAX_LENGTH then
        begin
            ErrorLabel.Caption := 'Error! Max length is ' +
              IntToStr(MAX_LENGTH);
        end;
    end;
end;

procedure TForm1.MemoKeyPress(Sender: TObject; var key: Char);
begin
    key := #0;
end;

end.
