unit Unit2;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids,
    Vcl.ExtCtrls, Vcl.ExtDlgs;

type
    TTimetable = record
        Professor, Day, Order, Subject: String[100];
    end;
    TCreateForm = class(TForm)
        ProfessorEdit: TEdit;
        SubjectEdit: TEdit;
        DayEdit: TComboBox;
        OrderEdit: TComboBox;
        PopupMenu1: TPopupMenu;
        AddRecordButton: TButton;
        Timetable: TStringGrid;
        SaveButton: TButton;
        ClearButton: TButton;
        HelpButton: TButton;
        CloseButton: TButton;
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        Save1: TMenuItem;
        Clear1: TMenuItem;
        N1: TMenuItem;
        Close1: TMenuItem;
        About1: TMenuItem;
        Help1: TMenuItem;
        Hotkeys1: TMenuItem;

    SaveTextFileDialog1: TSaveTextFileDialog;    procedure DayKeyPress(Sender: TObject; var key: Char);
        procedure OrderKeyPress(Sender: TObject; var key: Char);
        procedure OrderExit(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure AddRecordButtonClick(Sender: TObject);
        procedure ProfessorKeyPress(Sender: TObject; var key: Char);
        procedure SubjectKeyPress(Sender: TObject; var key: Char);
        procedure CloseButtonClick(Sender: TObject);
        procedure ClearButtonClick(Sender: TObject);
        procedure HelpButtonClick(Sender: TObject);
        procedure Hotkeys1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure GridClear();
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    CreateForm: TCreateForm;

implementation

{$R *.dfm}

procedure TCreateForm.FormCreate(Sender: TObject);
begin
    Timetable.Cells[0, 0] := 'Professor';
    Timetable.Cells[1, 0] := 'Day';
    Timetable.Cells[2, 0] := 'Order';
    Timetable.Cells[3, 0] := 'Subject';
    Timetable.ColWidths[0] := 250;
    Timetable.ColWidths[1] := 50;
    Timetable.ColWidths[2] := 50;
    Timetable.ColWidths[3] := 223;
end;

procedure TCreateForm.GridClear;
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
end;

procedure TCreateForm.HelpButtonClick(Sender: TObject);
begin
    MessageBox(0,
      '     In this window you should fill every field and click on "Add' +
      ' record" to add new record to timetable. Then you can save the timetable'
      + #13#10 + '     Also you can clear timetable and close this window.',
      'Help', MB_OK + MB_ICONINFORMATION);
end;

procedure TCreateForm.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Alt+S - save timetable' + #13#10 + 'Alt+C - clear timetable'
      + #13#10 + 'Esc - close window' + #13#10 + 'Alt+E - help' + #13#10 +
      'Alt+H - hot keys', 'Hot keys', MB_OK + MB_ICONINFORMATION);
end;

procedure TCreateForm.Save1Click(Sender: TObject);
var
    Put : file of TTimetable;
    RowRecord : TTimetable;
    I : Integer;
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
            MessageBox(0, 'Error! Cannot assign file.', 'File error', MB_OK + MB_ICONERROR);
        end;
end;

procedure TCreateForm.SubjectKeyPress(Sender: TObject; var key: Char);
begin
    if key = #13 then
        AddRecordButtonClick(AddRecordButton);
    if Length(SubjectEdit.Text + key) > 100 then key := #0;

end;

procedure TCreateForm.ProfessorKeyPress(Sender: TObject; var key: Char);
begin
    if Length(ProfessorEdit.Text + key) > 100 then key := #0;

    case key of
        #8:
            ;
        #13:
            SubjectEdit.SetFocus;
        'A' .. 'Z':
            ;
        'a' .. 'z':
            ;
        'à' .. 'ÿ':
            ;
        'À' .. 'ß':
            ;
    else
        key := #0;
    end;
end;

procedure TCreateForm.AddRecordButtonClick(Sender: TObject);
begin
    if (ProfessorEdit.Text = '') or (SubjectEdit.Text = '') then
        MessageBox(0, 'Fill every field', 'Error', MB_OK + MB_ICONWARNING)
    else
    begin
        with Timetable do
        begin
            Cells[0, RowCount - 1] := ProfessorEdit.Text;
            Cells[1, RowCount - 1] := DayEdit.Text;
            Cells[2, RowCount - 1] := OrderEdit.Text;
            Cells[3, RowCount - 1] := SubjectEdit.Text;
            RowCount := RowCount + 1;
            ProfessorEdit.Text := '';
            DayEdit.Text := 'Mon';
            OrderEdit.Text := '1';
            SubjectEdit.Text := '';
        end;
        ProfessorEdit.SetFocus;
    end;
end;

procedure TCreateForm.ClearButtonClick(Sender: TObject);
begin
    ProfessorEdit.Text := '';
    SubjectEdit.Text := '';
    OrderEdit.Text := '1';
    DayEdit.Text := 'Mon';
    GridClear();
end;

procedure TCreateForm.CloseButtonClick(Sender: TObject);
begin
    ProfessorEdit.Text := '';
    SubjectEdit.Text := '';
    OrderEdit.Text := '1';
    DayEdit.Text := 'Mon';
    GridClear();
    CreateForm.Close;
end;

procedure TCreateForm.DayKeyPress(Sender: TObject; var key: Char);
begin
    key := #0;
end;

procedure TCreateForm.OrderKeyPress(Sender: TObject; var key: Char);
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

procedure TCreateForm.OrderExit(Sender: TObject);
begin
    if OrderEdit.Text = '' then
        OrderEdit.Text := '1';
end;

end.
