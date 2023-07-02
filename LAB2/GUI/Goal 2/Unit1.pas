unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Menus;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        About1: TMenuItem;
        Program1: TMenuItem;
        Author1: TMenuItem;
        Label2: TLabel;
        Label3: TLabel;
        ErrorLabel: TLabel;
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
        DecimalEdit: TEdit;
        BinaryEdit: TEdit;
        Translate: TButton;
        procedure TranslateClick(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure Save1Click(Sender: TObject);
        procedure Open1Click(Sender: TObject);
        procedure KeyPress(Sender: TObject; var key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MIN_VALUE = -2147483648;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_YESNO + MB_ICONQUESTION) = 6 then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
    InF: TextFile;
    Reader: String;
begin
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            ReadLn(InF, Reader);
            try
                if StrToInt(Reader) > MIN_VALUE then
                    DecimalEdit.Text := Reader;
            except
                ErrorLabel.Caption :=
                  'Error! Value is out of bounds or invalid number.';
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
            WriteLn(OutF, BinaryEdit.Text);
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(OutF);
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program translate number from decimal to binary number system.',
      'About program', MB_OK + MB_ICONINFORMATION);
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda.', 'About author',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.TranslateClick(Sender: TObject);
var
    P: Integer;
    Answer: String;
    Positive: Boolean;
begin
    try
        Positive := false;
        P := StrToInt(DecimalEdit.Text);
        if P > -1 then
            Positive := true
        else
            P := -P;

        Answer := IntToStr(P mod 2) + '';
        P := P div 2;
        while P > 0 do
        begin
            Answer := IntToStr(P mod 2) + Answer;
            P := P div 2;
        end;
        while Length(Answer) < 31 do
            Answer := '0' + Answer;
        if Positive then
            BinaryEdit.Text := '0' + Answer
        else
            BinaryEdit.Text := '1' + Answer;
    except
        ErrorLabel.Caption := 'Error! INPUT ERROR.';
    end;
end;

procedure TForm1.KeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
        '-':
            if Length(DecimalEdit.Text) > 0 then
                key := #0;

        '0':
            if (DecimalEdit.Text = '0') or (DecimalEdit.Text = '-0') then
                key := #0;
        '1' .. '7':
            if DecimalEdit.Text = '-' then
            begin
                if Length(DecimalEdit.Text) > 1 then
                    if abs(StrToInt(DecimalEdit.Text)) > 2147483639 then
                    begin
                        ErrorLabel.Caption := 'Error! You are trying to enter '
                          + DecimalEdit.Text + key +
                          ' (max absolute value is 2 147 483 647)';
                        key := #0;
                    end;
            end
            else
                if Length(DecimalEdit.Text) > 0 then
                    if abs(StrToInt(DecimalEdit.Text)) > 2147483639 then
                    begin
                        ErrorLabel.Caption := 'Error! You are trying to enter ' +
                          DecimalEdit.Text + key +
                          ' (max absolute value is 2 147 483 647)';
                        key := #0;
                    end;
        '8' .. '9':
            if DecimalEdit.Text = '-' then
            begin
                if Length(DecimalEdit.Text) > 1 then
                    if abs(StrToInt(DecimalEdit.Text)) > 214748363 then
                    begin
                        ErrorLabel.Caption := 'Error! You are trying to enter '
                          + DecimalEdit.Text + key +
                          ' (max absolute value is 2 147 483 647)';
                        key := #0;
                    end;
            end
            else
                if Length(DecimalEdit.Text) > 0 then
                    if abs(StrToInt(DecimalEdit.Text)) > 214748363 then
                    begin
                        ErrorLabel.Caption := 'Error! You are trying to enter ' +
                          DecimalEdit.Text + key +
                          ' (max absolute value is 2 147 483 647)';
                        key := #0;
                    end;

    else
        key := #0;
    end;
end;

end.
