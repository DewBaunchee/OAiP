unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtDlgs;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        MEdit: TEdit;
        Label2: TLabel;
        NEdit: TEdit;
        Label3: TLabel;
        Result: TLabel;
        ErrorLabel: TLabel;
        Calculate: TButton;
        MainMenu1: TMainMenu;
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
        FIle1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        About1: TMenuItem;
        Program1: TMenuItem;
        Author1: TMenuItem;
        procedure Open1Click(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure CalculateClick(Sender: TObject);
        procedure KeyPress(Sender: TObject; var key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_VALUE = 100000000;

var
    Form1: TForm1;
    m, n, r: Integer;
    Valid: Boolean;

implementation

{$R *.dfm}

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program calculate GCD of natural numbers M and N by Euclidean Algorithm (M and N not bigger than)',
      'About program', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda.', 'About author',
      MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.CalculateClick(Sender: TObject);
begin
    r := 0;
    m := StrToInt(MEdit.Text);
    n := StrToInt(NEdit.Text);

    if m < n then
    begin
        r := m;
        m := n;
        n := r;
    end;
    repeat
    begin
        r := m mod n;
        m := n;
        n := r;
    end;
    until r = 0;
    Result.Caption := IntToStr(m);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
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
            ReadLn(InF, Reader);
            if (StrToInt(Reader) < 1) or (StrToInt(Reader) > MAX_VALUE) then
                ErrorLabel.Caption := 'Error! ' + Reader +
                  ' is out of bound (natural number not bigger than )' +
                  IntToStr(MAX_VALUE) + ' are needed'
            else
                MEdit.Text := Reader;

            ReadLn(InF, Reader);
            if (StrToInt(Reader) < 1) or (StrToInt(Reader) > MAX_VALUE) then
                ErrorLabel.Caption := 'Error! ' + Reader +
                  ' is out of bound (natural number not bigger than )' +
                  IntToStr(MAX_VALUE) + ' are needed'
            else
                NEdit.Text := Reader;
        except
            MessageDlg('Unknown file error', mtError, [mbOk], 0);
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
            WriteLn(OutF, Result.Caption);
        except
            MessageDlg('Unknown file error', mtError, [mbOk], 0);
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

procedure TForm1.KeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
        '0':
            if Length((Sender as TEdit).Text) = 0 then
                key := #0;
        '1' .. '9':
            if StrToInt((Sender as TEdit).Text + key) > MAX_VALUE then
            begin
                ErrorLabel.Caption := 'Error! You are trying to enter ' +
                  ((Sender as TEdit).Text + key) + ', but max value is ' +
                  IntToStr(MAX_VALUE);
                key := #0;
            end;
    else
        key := #0;
    end;
end;

end.
