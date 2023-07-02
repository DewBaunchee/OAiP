unit Unit3;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
    Vcl.Grids, Vcl.ExtDlgs;

type
    TTimetable = record
        Professor, Day, Order, Subject: String[100];
    end;

    TViewForm = class(TForm)
        Timetable: TStringGrid;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        Open1: TMenuItem;
        N1: TMenuItem;
        Close1: TMenuItem;
        About1: TMenuItem;
        Help1: TMenuItem;
        Hotkeys1: TMenuItem;
        Panel1: TPanel;
        PopupMenu1: TPopupMenu;
        OpenButton: TButton;
        HelpButton: TButton;
        CloseButton: TButton;
        OpenTextFileDialog1: TOpenTextFileDialog;
        procedure FormCreate(Sender: TObject);
        procedure Close1Click(Sender: TObject);
        procedure Help1Click(Sender: TObject);
        procedure Hotkeys1Click(Sender: TObject);
        procedure Open1Click(Sender: TObject);
        procedure TimetableSort(Method: Integer);
        procedure TimetableSelectCell(Sender: TObject; ACol, ARow: Integer;
          var CanSelect: Boolean);
        procedure NonDaySort(Method: Integer);
        procedure RowSwop(First, Second: Integer);
        procedure GridClear;
        procedure DaySort;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    ViewForm: TViewForm;

implementation

{$R *.dfm}

uses Unit6, Unit2;

procedure TViewForm.Close1Click(Sender: TObject);
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
    ViewForm.Close;
end;

procedure TViewForm.RowSwop(First: Integer; Second: Integer); { —Œ–“»–Œ¬ ¿ }
var
    Temp: String;
    I: Integer;
begin
    with Timetable do
        for I := 0 to 3 do
        begin
            Temp := Cells[I, First];
            Cells[I, First] := Cells[I, Second];
            Cells[I, Second] := Temp;
        end;
end;

procedure TViewForm.GridClear;
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
end;

procedure TViewForm.NonDaySort(Method: Integer);
var
    I, J: Integer;
begin
    with Timetable do
    begin
        for I := 1 to RowCount - 1 do
            for J := 1 to RowCount - I - 1 do
                if Cells[Method, J] > Cells[Method, J + 1] then
                    RowSwop(J, J + 1);
    end;
end; { —Œ–“»–Œ¬ ¿ }

procedure TViewForm.DaySort();
var
    I, J, Current : Integer;
begin
    Current := 1;
    with Timetable do
    begin
        for I := 0 to 5 do
            for J := 1 to RowCount - 1 do
                if Cells[1, J] = CreateForm.DayEdit.Items[I] then
                begin
                    RowSwop(Current, J);
                    Inc(Current);
                end;
    end;
end;  { —Œ–“»–Œ¬ ¿ }

procedure TViewForm.TimetableSort(Method: Integer);
begin
    case Method of
        0, 2, 3:
            NonDaySort(Method);
        1:  DaySort();
    end;
end; { —Œ–“»–Œ¬ ¿ }

procedure TViewForm.TimetableSelectCell(Sender: TObject; ACol: Integer;
  ARow: Integer; var CanSelect: Boolean);
begin
    if ARow = 0 then
        TimetableSort(ACol)
    else
    begin
        with Timetable do
        begin
            ModalView.ProfessorEdit.Text := Cells[0, ARow];
            ModalView.DayEdit.Text := Cells[1, ARow];
            ModalView.OrderEdit.Text := Cells[2, ARow];
            ModalView.SubjectEdit.Text := Cells[3, ARow];
            ModalView.ShowModal;
        end;
    end;
end; { —Œ–“»–Œ¬ ¿ }

procedure TViewForm.FormCreate(Sender: TObject);
begin
    with Timetable do
    begin
        Cells[0, 0] := 'Professor';
        Cells[1, 0] := 'Day';
        Cells[2, 0] := 'Order';
        Cells[3, 0] := 'Subject';
        ColWidths[0] := 250;
        ColWidths[1] := 50;
        ColWidths[2] := 50;
        ColWidths[3] := 223;
        Row := 1;
        Col := 0;
    end;
end;

procedure TViewForm.Help1Click(Sender: TObject);
begin
    MessageBox(0, '     This window provides viewing of any saved timetable.' +
      ' There is hot keys which simplifies using of program.' + #13#10 +
      '     You can sort timetable by click on title of column.', 'Help',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TViewForm.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Alt+O - open timetable' + #13#10 + 'Alt+E - help' + #13#10 +
      'Alt+H - hot keys' + #13#10 + 'Esc - close', 'Hot keys',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TViewForm.Open1Click(Sender: TObject);
var
    Put: file of TTimetable;
    I: Integer;
    RowRecord: TTimetable;
begin
    I := 1;
    GridClear();
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(Put, OpenTextFileDialog1.FileName);
            Reset(Put);
            if EoF(Put) then
                MessageBox(0, 'Error! File is empty.', 'File error',
                  MB_OK + MB_ICONERROR)
            else
            begin
                with Timetable do
                begin
                    while not EoF(Put) do
                        try
                            Read(Put, RowRecord);
                            Cells[0, I] := RowRecord.Professor;
                            Cells[1, I] := RowRecord.Day;
                            Cells[2, I] := RowRecord.Order;
                            Cells[3, I] := RowRecord.Subject;
                            RowCount := RowCount + 1;
                            Inc(I);
                        except
                            MessageBox(0,
                              PWideChar('Error! Error on step π' + IntToStr(I) +
                              '.'), 'Error', MB_OK + MB_ICONERROR);
                        end;
                    RowCount := RowCount - 2;
                end;
            end;
            CloseFile(Put);
        except
            MessageBox(0, 'Error! Cannot assign file.', 'File error',
              MB_OK + MB_ICONERROR);
        end;
end;

end.
