unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TModalEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ProfessorEdit: TEdit;
    SubjectEdit: TEdit;
    CloseButton: TButton;
    DeleteButton: TButton;
    EditButton: TButton;
    DayEdit: TComboBox;
    OrderEdit: TComboBox;
    procedure CloseButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DeleteRow(Current : Integer);
    procedure RowSwop(First: Integer; Second: Integer);
    procedure DayKeyPress(Sender: TObject; var key: Char);
    procedure OrderKeyPress(Sender: TObject; var key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    OpenedIndex : Integer;
  end;

var
  ModalEdit: TModalEdit;

implementation

{$R *.dfm}

uses Unit5;

procedure TModalEdit.DayKeyPress(Sender: TObject; var key: Char);
begin
    key := #0;
end;

procedure TModalEdit.OrderKeyPress(Sender: TObject; var key: Char);
begin
    case key of
        #8:
            ;
        '1' .. '5':
            if Length((Sender as TComboBox).Text + key) > 1 then
                key := #0;
    else
        key := #0;
    end;
end;

procedure TModalEdit.CloseButtonClick(Sender: TObject);
begin
    ModalEdit.Close;
end;

procedure TModalEdit.DeleteButtonClick(Sender: TObject);
begin
    DeleteRow(OpenedIndex);
end;

procedure TModalEdit.RowSwop(First: Integer; Second: Integer); { —Œ–“»–Œ¬ ¿ }
var
    Temp: String;
    I: Integer;
begin
    with EditForm.Timetable do
        for I := 0 to 3 do
        begin
            Temp := Cells[I, First];
            Cells[I, First] := Cells[I, Second];
            Cells[I, Second] := Temp;
        end;
end;

procedure TModalEdit.DeleteRow(Current: Integer);
var
    I : Integer;
begin
    with EditForm.Timetable do
    begin
        for I := OpenedIndex to RowCount - 2 do
            begin
                RowSwop(I, I + 1);
            end;
        RowCount := RowCount - 1;
    end;
    ModalEdit.Close;
end;

procedure TModalEdit.EditButtonClick(Sender: TObject);
begin
    with EditForm.Timetable do
    begin
        Cells[0, OpenedIndex] := ProfessorEdit.Text;
        Cells[1, OpenedIndex] := DayEdit.Text;
        Cells[2, OpenedIndex] := OrderEdit.Text;
        Cells[3, OpenedIndex] := SubjectEdit.Text;
    end;
end;

end.
