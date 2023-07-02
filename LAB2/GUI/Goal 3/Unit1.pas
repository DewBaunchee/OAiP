unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtDlgs, Vcl.StdCtrls,
    Vcl.Grids;

type
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
        MatrixLength: TComboBox;
        ErrorLabel: TLabel;
        Check: TButton;
        MatrixGrid: TStringGrid;
        Result: TLabel;
        Label5: TLabel;
        BackGround: TStringGrid;
        FocusStopper: TEdit;
        Button1: TButton;
        procedure Open1Click(Sender: TObject);
        procedure Save1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure Author1Click(Sender: TObject);
        procedure Program1Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure MatrixLengthKeyPress(Sender: TObject; var key: Char);
        procedure MatrixLengthExit(Sender: TObject);
        procedure CheckClick(Sender: TObject);
        function IsMatrixIdentity(): Boolean;
        procedure MatrixGridKeyPress(Sender: TObject; var key: Char);
        procedure MatrixLengthChange(Sender: TObject);
        procedure SetLenClick(Sender: TObject);
        procedure MatrixGridSelectCell(Sender: TObject; ARow, ACol: Integer;
          var CanSelect: Boolean);
        procedure MatrixGridExit(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MAX_ABS_VALUE = 100;

var
    Form1: TForm1;
    LastKey: Char;
    MLength, NextCell, LastRow, LastCol: Integer;

implementation

{$R *.dfm}

function TForm1.IsMatrixIdentity(): Boolean;
var
    ERow, ECol: Integer;
    Res: Boolean;
begin
    Res := true;
    ERow := 0;
    with MatrixGrid do
        while (ERow < MLength) and (Res) do
        begin
            ECol := 0;
            while (ECol < MLength) and (Res) do
            begin
                if ECol = ERow then
                begin
                    if StrToInt(Cells[ECol, ERow]) = 1 then
                        inc(ECol)
                    else
                        Res := false
                end
                else
                begin
                    if StrToInt(Cells[ECol, ERow]) = 0 then
                        inc(ECol)
                    else
                        Res := false;
                end;
            end;
            inc(ERow);
        end;
    IsMatrixIdentity := Res;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    I, J: Integer;
begin
    MatrixGrid.Height := 158;
    MLength := StrToInt(MatrixLength.Text);
    for I := 0 to MatrixGrid.ColCount do
        for J := 0 to MatrixGrid.ColCount do
        begin
            MatrixGrid.Cells[I, J] := '0';
            BackGround.Cells[I, J] := '0';
        end;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
    InF: TextFile;
    I, J, Reader: Integer;
    Valid: Boolean;
begin
    Valid := true;
    I := 0;
    J := 0;
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(InF, OpenTextFileDialog1.FileName);
            Reset(InF);
            try
                while (I < MLength) and (Valid) do
                begin
                    while (J < MLength) and (Valid) do
                    begin
                        Read(InF, Reader);
                        if abs(Reader) > MAX_ABS_VALUE then
                        begin
                            Valid := false;
                            ErrorLabel.Caption :=
                              'Error! Element is out of bounds. Aborted on Cell['
                              + IntToStr(J) + ', ' + IntToStr(I) + '].';
                        end
                        else
                            MatrixGrid.Cells[J, I] := IntToStr(Reader);
                        inc(J);
                    end;
                    inc(I);
                end;

            except
                ErrorLabel.Caption := 'Error! Corrupted data. Aborted on Cell['
                  + IntToStr(J) + ', ' + IntToStr(I) + '].';
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
            WriteLn(OutF, 'Matrix ' + Result.Caption + ' identity.');
        except
            ErrorLabel.Caption := 'Error! Unknown file error.';
        end;
    CloseFile(OutF);
end;

procedure TForm1.CheckClick(Sender: TObject);
begin
    if IsMatrixIdentity() then
    begin
        Result.Caption := '  is';
        Result.Font.Color := clLime;
    end
    else
    begin
        Result.Caption := 'isn' + #39 + 't';
        Result.Font.Color := clRed;
    end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Form1.Close();
end;

procedure TForm1.Program1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program calculates arithmetic mean of all positive elements.',
      'About program', MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Author1Click(Sender: TObject);
begin
    ErrorLabel.Caption := IntToStr(MatrixGrid.Height);
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

procedure TForm1.MatrixLengthExit(Sender: TObject);
begin
    MatrixGrid.Col := 0;
    MatrixGrid.Row := 0;
    if MatrixLength.Text = '' then
        MatrixLength.ItemIndex := 4;
    MLength := StrToInt(MatrixLength.Text);
    with MatrixGrid do
    begin
        Height := 8 + MLength * DefaultRowHeight;
        Width := 3 + MLength * (1 + DefaultColWidth);
    end;
end;

procedure TForm1.SetLenClick(Sender: TObject);
begin
    MatrixGrid.Col := 0;
    MatrixGrid.Row := 0;
    MLength := StrToInt(MatrixLength.Text);
    with MatrixGrid do
    begin
        Height := 8 + MLength * DefaultRowHeight;
        Width := 3 + MLength * (1 + DefaultColWidth);
    end;
end;

procedure TForm1.MatrixLengthChange(Sender: TObject);
begin
    MatrixLength.SetFocus();
end;

procedure TForm1.MatrixLengthKeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
        #13:
            FocusStopper.SetFocus();
        '1' .. '5':
            if Length(MatrixLength.Text) = 1 then
                key := #0;
    else
        key := #0;
    end;
end;

procedure TForm1.MatrixGridKeyPress(Sender: TObject; var key: Char);
begin
    with MatrixGrid do
    begin
        LastRow := Col;
        LastCol := Row;
        case key of
            #8:
                ;
            #13:
                begin
                    if (Row = 4) and (Col = 4) then
                    begin
                        Row := 0;
                        Col := 0;
                    end
                    else
                    begin
                        NextCell := Row * MLength + Col + 1;
                        Row := NextCell div MLength;
                        Col := NextCell - Row * MLength;
                    end;
                end;
            '0':
                if Cells[Col, Row] = '0' then
                    key := #0
                else
                begin
                    if Length(Cells[Col, Row]) > 0 then
                        if abs(StrToInt(Cells[Col, Row] + key)) > MAX_ABS_VALUE
                        then
                        begin
                            ErrorLabel.Caption :=
                              'Error! You are trying to enter ' +
                              Cells[Col, Row] + key + ' (max absolute value is '
                              + IntToStr(MAX_ABS_VALUE) + ')';
                            key := #0
                        end;
                end;
            '1' .. '9':
                if abs(StrToInt(Cells[Col, Row] + key)) > MAX_ABS_VALUE then
                begin
                    ErrorLabel.Caption := 'Error! You are trying to enter ' +
                      Cells[Col, Row] + key + ' (max absolute value is ' +
                      IntToStr(MAX_ABS_VALUE) + ')';
                    key := #0
                end;
            '-':
                if Length(Cells[Col, Row]) > 0 then
                    key := #0;
        else
            key := #0;
        end;
    end;
    BackGround.Cells[MatrixGrid.Row, MatrixGrid.Col] :=
      MatrixGrid.Cells[MatrixGrid.Row, MatrixGrid.Col] + key;
end;

procedure TForm1.MatrixGridSelectCell(Sender: TObject; ARow, ACol: Integer;
  var CanSelect: Boolean);
begin
    if MatrixGrid.Cells[LastRow, LastCol] = '' then
        MatrixGrid.Cells[LastRow, LastCol] := '0';
    CanSelect := true;
end;

procedure TForm1.MatrixGridExit(Sender: TObject);
begin
    with MatrixGrid do
        if Cells[LastRow, LastCol] = '' then
            Cells[LastRow, LastCol] := '0';
end;

end.
