unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtDlgs;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Check: TButton;
        Label5: TLabel;
        Result: TLabel;
        ErrorLabel: TLabel;
        SubstrEdit: TEdit;
        StrEdit: TEdit;
        KEdit: TEdit;
        MainMenu1: TMainMenu;
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
        File1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        Exit1: TMenuItem;
        About1: TMenuItem;
        Program1: TMenuItem;
        Author1: TMenuItem;
        CaseSens: TCheckBox;
        ClearButton: TButton;
    N1: TMenuItem;
        procedure Open1Click(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure StrKeyPress(Sender: TObject; var key: Char);
        procedure SubStrKeyPress(Sender: TObject; var key: Char);
        procedure IntKeyPress(Sender: TObject; var key: Char);
        procedure ClearButtonClick(Sender: TObject);
        procedure KEditExit(Sender: TObject);
        procedure StrChange(Sender: TObject);
        procedure SubStrChange(Sender: TObject);
        procedure CheckClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_LENGTH = 255;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0, 'This program defines K-th occurence of Substring in String',
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
    Valid: Boolean;
    Reader: String;
begin
    Valid := true;
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            ReadLn(InF, Reader);
            if Length(Reader) > MAX_LENGTH then
            begin
                Valid := false;
                ErrorLabel.Caption := 'Error! String is too big (Max length - '
                  + IntToStr(MAX_LENGTH) + ')';
            end
            else
                StrEdit.Text := Reader;
            ReadLn(InF, Reader);
            if (Valid) and (Length(Reader) > Length(StrEdit.Text)) then
            begin
                Valid := false;
                ErrorLabel.Caption :=
                  'Error! Length of Substring cannot be bigger than length of String.';
            end
            else
                SubstrEdit.Text := Reader;
            ReadLn(InF, Reader);
            if (Valid) and (StrToInt(Reader) > Length(StrEdit.Text) -
              Length(SubstrEdit.Text) + 1) then
            begin
                Valid := false;
                ErrorLabel.Caption :=
                  'Error! Value of K should be not bigger than length difference.';
            end
            else
                KEdit.Text := Reader;
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
            WriteLn(OutF, Result.Caption);
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(OutF);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_YESNO + MB_ICONQUESTION) = 6 then
        CanClose := true
    else
        CanClose := false;
end;

procedure TForm1.StrChange(Sender: TObject);
begin
    if Length(StrEdit.Text) = 0 then
    begin
        SubstrEdit.Clear();
        SubstrEdit.Enabled := false;
    end
    else
        SubstrEdit.Enabled := true;
end;

procedure TForm1.SubStrChange(Sender: TObject);
begin
    if Length(SubstrEdit.Text) = 0 then
    begin
        KEdit.Clear();
        KEdit.Enabled := false;
    end
    else
        KEdit.Enabled := true;
end;

procedure TForm1.KEditExit(Sender: TObject);
begin
    if (KEdit.Text = '') then
        KEdit.Text := '1';
end;

function Definition(St2, St1: String; K: Integer): Integer;
var
    DeletedLength: Integer;
begin
    DeletedLength := 0;
    while (K > 1) and (pos(St1, St2) > 0) do
    begin
        DeletedLength := DeletedLength + pos(St1, St2) + Length(St1) - 1;
        delete(St2, 1, pos(St1, St2) + Length(St1) - 1);
        dec(K);
    end;
    if pos(St1, St2) = 0 then
        Definition := 0
    else
        Definition := pos(St1, St2) + DeletedLength;
end;

procedure TForm1.CheckClick(Sender: TObject);
begin
    if (SubstrEdit.Enabled) and (SubstrEdit.Enabled) then
    begin
        if Length(KEdit.Text) = 0 then
            KEdit.Text := '1';
        if CaseSens.Checked then
            Result.Caption :=
              IntToStr(Definition(StrEdit.Text, SubstrEdit.Text, StrToInt(KEdit.Text)))
        else
            Result.Caption := IntToStr(Definition(LowerCase(StrEdit.Text),
              LowerCase(SubstrEdit.Text), StrToInt(KEdit.Text)));
    end
    else
        ErrorLabel.Caption := 'Error! Enter data.';
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
    KEdit.Clear();
    SubstrEdit.Clear();
    StrEdit.Clear();
    CaseSens.Checked := false;
end;

procedure TForm1.StrKeyPress(Sender: TObject; var key: Char);
begin
    if (Length((Sender as TEdit).Text + key) > MAX_LENGTH) and (ord(key) <> 8)
    then
    begin
        key := #0;
        ErrorLabel.Caption := 'Error! String is too big (Max length - ' +
          IntToStr(MAX_LENGTH) + ')';
    end;
    case key of
        'À' .. 'ß':
            key := #0;
        'à' .. 'ÿ':
            key := #0;
    end;
end;

procedure TForm1.SubStrKeyPress(Sender: TObject; var key: Char);
begin
    if (Length((Sender as TEdit).Text + key) > Length(StrEdit.Text)) and
      (ord(key) <> 8) then
    begin
        key := #0;
        ErrorLabel.Caption :=
          'Error! Length of Substring cannot be bigger than length of String.';
    end;
    case key of
        'À' .. 'ß':
            key := #0;
        'à' .. 'ÿ':
            key := #0;
    end;
end;

procedure TForm1.IntKeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
        '0':
            if Length(KEdit.Text) = 0 then
                key := #0
            else if StrToInt(KEdit.Text + key) > Length(StrEdit.Text) -
              Length(SubstrEdit.Text) + 1 then
            begin
                ErrorLabel.Caption :=
                  'Error! Value of K should be bigger than length difference.';
                key := #0;
            end;
        '1' .. '9':
            if StrToInt(KEdit.Text + key) > Length(StrEdit.Text) -
              Length(SubstrEdit.Text) + 1 then
            begin
                ErrorLabel.Caption :=
                  'Error! Value of K should be not bigger than length difference.';
                key := #0;
            end;
    else
        key := #0;
    end;

end;

end.
