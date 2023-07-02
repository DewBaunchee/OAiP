unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtDlgs;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        Result: TLabel;
        Calculate: TButton;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        About1: TMenuItem;
        Save1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        Program1: TMenuItem;
        Author1: TMenuItem;
        SaveTextFileDialog: TSaveTextFileDialog;
        UncertEdit: TEdit;
        Label2: TLabel;
        ErrorLabel: TLabel;
        procedure CalculateClick(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure KeyPress(Sender: TObject; var key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CalculateClick(Sender: TObject);
var
    s, x, h, Uncert: double;
begin
    x := 0;
    s := 0;
    Uncert := StrToFloat(UncertEdit.Text);
    while (x < 5) do
    begin
        x := x + Uncert; // Чем меньше шаг, тем точнее вычисления
        h := 25 - x * x;
        s := s + Uncert * h;
    end;
    s := s * 2;
    Result.Caption := Format('%.10f', [s]);
end;

procedure TForm1.KeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8: ;
        '0':
            if (Length((Sender as TEdit).Text) > 0) then
                if (Pos(',', (Sender as TEdit).Text) = 0) and
                  ((Sender as TEdit).Text <> '-') then
                    if StrToFloat((Sender as TEdit).Text) = 0 then
                        key := #0;
        '1' .. '9':
            if (StrToFloat((Sender as TEdit).Text + key) > 0.1) or
              (StrToFloat((Sender as TEdit).Text + key) < 0.0000001) then
                key := #0;
        ',':
            if ((Length((Sender as TEdit).Text) = 0) or
              ((Length((Sender as TEdit).Text) = 1) and
              ((Sender as TEdit).Text = '-'))) or
              (Pos(',', (Sender as TEdit).Text) > 0) then
                key := #0;
        else
            key := #0;
    end;
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda.', 'About author', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0, 'This program calculate area of figure limited by y = 25 and y = x^2', 'About program', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if mrYes = MessageDlg('Do you want to exit?', mtWarning, [mbYes, mbNo], 0)
    then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.Save1Click(Sender: TObject);
var
    OutF: TextFile;
begin
    if SaveTextFileDialog.Execute then
        try
            AssignFile(OutF, SaveTextFileDialog.FileName);
            Rewrite(OutF);
            WriteLn(OutF, Result.Caption);
        except
            MessageDlg('Unknown file error', mtError, [mbOk], 0);
        end;
    CloseFile(OutF);
end;

end.
