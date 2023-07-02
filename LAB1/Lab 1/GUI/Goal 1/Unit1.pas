unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
    Vcl.ExtDlgs;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        Result: TLabel;
        X1Label: TLabel;
        X1Edit: TEdit;
        Y1Label: TLabel;
        Y1Edit: TEdit;
        X2Label: TLabel;
        X2Edit: TEdit;
        Y2Label: TLabel;
        Y2Edit: TEdit;
        Check: TButton;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        About1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        Exit1: TMenuItem;
        N1: TMenuItem;
        StatusBar1: TStatusBar;
        Program1: TMenuItem;
        Author1: TMenuItem;
        OpenTextFileDialog: TOpenTextFileDialog;
        SaveTextFileDialog: TSaveTextFileDialog;
        ErrorLabel: TLabel;
        procedure CheckClick(Sender: TObject);
        procedure KeyPress(Sender: TObject; var key: Char);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_ABS_VALUE = 40001;

var
    Form1: TForm1;
    R1, R2, X1, X2, Y1, Y2: double;
    Valid : Boolean;

implementation

{$R *.dfm}

procedure TForm1.CheckClick(Sender: TObject);
begin
    Valid := false;
    ErrorLabel.Caption := '';
    try
        X1 := StrToFloat(X1Edit.Text);
        X2 := StrToFloat(X2Edit.Text);
        Y1 := StrToFloat(Y1Edit.Text);
        Y2 := StrToFloat(Y2Edit.Text);

        R1 := sqrt(X1 * X1 + Y1 * Y1);
        R2 := sqrt(X2 * X2 + Y2 * Y2);
        if (abs(R1 - R2) < 0.001) then
        begin
            Result.Caption := 'YES';
            Result.Font.Color := clLime;
            Valid := true;
        end
        else
        begin
            Result.Caption := 'NO';
            Result.Font.Color := clRed;
            Valid := true;
        end;
    except
        MessageDlg('INPUT ERROR', mtError, [mbOk], 0);
    end;
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    ShowMessage('Created by Matvey Vorivoda.');
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    ShowMessage
      ('This program checks the points with coordinates (X1, Y1) and (X2, Y2) lie on the same circle');
end;

procedure TForm1.Save1Click(Sender: TObject);
var
    OutF : TextFile;
begin
    if Valid and SaveTextFileDialog.Execute then
        try
            AssignFile(OutF, SaveTextFileDialog.FileName);
            Rewrite(OutF);
            WriteLn(OutF, Result.Caption);
        except
            MessageDlg('Unknown file error', mtError, [mbOk], 0);
        end;
    CloseFile(OutF);
end;

procedure TForm1.Open1Click(Sender: TObject);
var
    Reader: String;
    Validator: Integer;
    InF: TextFile;
begin
    Validator := 0;
    if OpenTextFileDialog.Execute then
        try
            AssignFile(InF, OpenTextFileDialog.FileName);
            Reset(InF);
            if EoF(InF) then
                ErrorLabel.Caption := 'Error! File is empty.'
            else
            begin
                ReadLn(InF, Reader);
                if abs(StrToFloat(Reader)) < MAX_ABS_VALUE then
                begin
                    X1Edit.Text := Reader;
                    Inc(Validator);
                end;
                ReadLn(InF, Reader);
                if abs(StrToFloat(Reader)) < MAX_ABS_VALUE then
                begin
                    X2Edit.Text := Reader;
                    Inc(Validator);
                end;
                ReadLn(InF, Reader);
                if abs(StrToFloat(Reader)) < MAX_ABS_VALUE then
                begin
                    Y1Edit.Text := Reader;
                    Inc(Validator);
                end;
                ReadLn(InF, Reader);
                if abs(StrToFloat(Reader)) < MAX_ABS_VALUE then
                begin
                    Y2Edit.Text := Reader;
                    Inc(Validator);
                end;
                if Validator < 4 then
                    ErrorLabel.Caption := 'Error! INPUT ERROR';
            end;
        except
            ErrorLabel.Caption := 'Error! INPUT ERROR';
        end;
    CloseFile(InF);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if mrYes = MessageDlg('Do you want to exit?', mtWarning, [mbYes, mbNo], 0)
    then
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
            if (Length((Sender as TEdit).Text) > 0) then
                if (Pos(',', (Sender as TEdit).Text) = 0) and
                  ((Sender as TEdit).Text <> '-') then
                    if StrToFloat((Sender as TEdit).Text) = 0 then
                        key := #0;

        '1' .. '9':
            if abs(StrToFloat(((Sender as TEdit).Text + key))) > MAX_ABS_VALUE
            then
            begin
                ErrorLabel.Caption := 'Error! You are trying to enter : ' +
                  (Sender as TEdit).Text + key +
                  ' (Max absolute value < 40 001).';
                key := #0;
            end;
        '-':
            if Length((Sender as TEdit).Text) > 0 then
                key := #0;
        ',':
            if ((Length((Sender as TEdit).Text) = 0) or
              ((Length((Sender as TEdit).Text) = 1) and
              ((Sender as TEdit).Text = '-'))) or
              (Pos(',', (Sender as TEdit).Text) > 0) then
                key := #0;
    else
        begin
            ErrorLabel.Caption := 'Error! Only numbers, "," and "-".';
            key := #0;
        end;
    end;

end;

end.
