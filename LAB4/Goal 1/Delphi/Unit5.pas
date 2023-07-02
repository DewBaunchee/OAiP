unit Unit5;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.Menus, Vcl.ExtCtrls,
    Vcl.StdCtrls, Vcl.Grids;

type
    TTimetable = record
        Professor, Day, Order, Subject: String[100];
    end;

    TEditForm = class(TForm)
        Timetable: TStringGrid;
        Button5: TButton;
        Button3: TButton;
        Button2: TButton;
        Button1: TButton;
        Panel1: TPanel;
        PopupMenu1: TPopupMenu;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        Open1: TMenuItem;
        Saveas1: TMenuItem;
        N1: TMenuItem;
        Close1: TMenuItem;
        About1: TMenuItem;
        Help1: TMenuItem;
        Hotkeys1: TMenuItem;
        SaveTextFileDialog1: TSaveTextFileDialog;
        OpenTextFileDialog1: TOpenTextFileDialog;
        procedure Open1Click(Sender: TObject);
        procedure Saveas1Click(Sender: TObject);
        procedure Close1Click(Sender: TObject);
        procedure Help1Click(Sender: TObject);
        procedure Hotkeys1Click(Sender: TObject);
        procedure GridClear;
        procedure FormCreate(Sender: TObject);
        procedure TimetableSelectCell(Sender: TObject; ACol: Integer;
          ARow: Integer; var CanSelect: Boolean);
        procedure TimetableSort(Method: Integer);
        procedure RowSwop(First: Integer; Second: Integer);
        procedure NonDaySort(Method: Integer);
        procedure DaySort();
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    EditForm: TEditForm;

implementation

{$R *.dfm}

uses Unit7, Unit2;

procedure TEditForm.Close1Click(Sender: TObject);
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
    EditForm.Close;
end;

procedure TEditForm.TimetableSelectCell(Sender: TObject; ACol: Integer;
  ARow: Integer; var CanSelect: Boolean);
begin
    if ARow = 0 then
        TimetableSort(ACol)
    else
    begin
        with Timetable do
        begin
            ModalEdit.OpenedIndex := ARow;
            ModalEdit.ProfessorEdit.Text := Cells[0, ARow];
            ModalEdit.DayEdit.Text := Cells[1, ARow];
            ModalEdit.OrderEdit.Text := Cells[2, ARow];
            ModalEdit.SubjectEdit.Text := Cells[3, ARow];
            ModalEdit.ShowModal;
        end;
    end;
end;

procedure TEditForm.TimetableSort(Method: Integer);
begin
    case Method of
        0, 2, 3:
            NonDaySort(Method);
        1:
            DaySort();
    end;
end;

procedure TEditForm.RowSwop(First: Integer; Second: Integer); { ÑÎÐÒÈÐÎÂÊÀ }
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

procedure TEditForm.NonDaySort(Method: Integer);
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
end;

procedure TEditForm.DaySort();
var
    I, J, Current: Integer;
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
end;

procedure TEditForm.Help1Click(Sender: TObject);
begin
    MessageBox(0, '     In this window you can find any record' +
      ' in timetable by selected criterion', 'Help',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TEditForm.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Alt+O - open timetable' + #13#10 + 'Alt+S - save timetable' +
      #13#10 + 'Alt+E - help' + #13#10 + 'Alt+H - hot keys' + #13#10 +
      'Esc - close', 'Hot keys', MB_OK + MB_ICONINFORMATION);
end;

procedure TEditForm.Open1Click(Sender: TObject);
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
                              PWideChar('Error! Error on step ¹' + IntToStr(I) +
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

procedure TEditForm.Saveas1Click(Sender: TObject);
var
    Put: file of TTimetable;
    RowRecord: TTimetable;
    I: Integer;
begin
    if SaveTextFileDialog1.Execute then
        try
            AssignFile(Put, SaveTextFileDialog1.FileName);
            Rewrite(Put);
            with Timetable do
                for I := 1 to RowCount - 1 do
                begin
                    RowRecord.Professor := Cells[0, I];
                    RowRecord.Day := Cells[1, I];
                    RowRecord.Order := Cells[2, I];
                    RowRecord.Subject := Cells[3, I];
                    Write(Put, RowRecord);
                end;
            CloseFile(Put);
        except
            MessageBox(0, 'Error! Cannot assign file.', 'File error',
              MB_OK + MB_ICONERROR);
        end;
end;

procedure TEditForm.GridClear;
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
end;

procedure TEditForm.FormCreate(Sender: TObject);
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

end.
