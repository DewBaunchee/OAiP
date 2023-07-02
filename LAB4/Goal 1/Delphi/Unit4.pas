unit Unit4;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
    Vcl.Menus, Vcl.ExtDlgs;

type
    TTimetable = record
        Professor, Day, Order, Subject: String[100];
    end;

    TFindForm = class(TForm)
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
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
        Timetable: TStringGrid;
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        CritEdit: TComboBox;
        FindEdit: TEdit;
        SearchButton: TButton;
        Button1: TButton;
        Button2: TButton;
        Button3: TButton;
        Button5: TButton;
        procedure FormCreate(Sender: TObject);
        procedure Close1Click(Sender: TObject);
        procedure GridClear;
        procedure Help1Click(Sender: TObject);
        procedure Hotkeys1Click(Sender: TObject);
        procedure Open1Click(Sender: TObject);
        procedure Saveas1Click(Sender: TObject);
        procedure CritEditKeyPress(Sender: TObject; var key: Char);
        procedure FindEditKeyPress(Sender: TObject; var key: Char);
        procedure SearchButtonClick(Sender: TObject);
        procedure Search();
        procedure RowTrans(First: Integer; Second: Integer);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FindForm: TFindForm;

implementation

{$R *.dfm}

procedure TFindForm.Close1Click(Sender: TObject);
begin
    Timetable.RowCount := 2;
    CritEdit.ItemIndex := 0;
    FindEdit.Text := '';
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
    FindForm.Close;
end;

procedure TFindForm.CritEditKeyPress(Sender: TObject; var key: Char);
begin
    key := #0;
end;

procedure TFindForm.FormCreate(Sender: TObject);
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

procedure TFindForm.Help1Click(Sender: TObject);
begin
    MessageBox(0, '     In this window you can find any record' +
      ' in timetable by selected criterion', 'Help',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TFindForm.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Alt+O - open timetable' + #13#10 + 'Alt+S - save timetable' +
      #13#10 + 'Alt+E - help' + #13#10 + 'Alt+H - hot keys' + #13#10 +
      'Esc - close', 'Hot keys', MB_OK + MB_ICONINFORMATION);
end;

procedure TFindForm.Open1Click(Sender: TObject);
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

procedure TFindForm.Saveas1Click(Sender: TObject);
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

procedure TFindForm.GridClear;
begin
    Timetable.RowCount := 2;
    Timetable.Cells[0, 1] := '';
    Timetable.Cells[1, 1] := '';
    Timetable.Cells[2, 1] := '';
    Timetable.Cells[3, 1] := '';
end;

procedure TFindForm.SearchButtonClick(Sender: TObject);
begin
    Search();
end;

procedure TFindForm.Search;
var
    I: Integer;
    Goals: Array of Integer;
begin
    SetLength(Goals, 0);
    with Timetable do
    begin
        for I := 1 to RowCount - 1 do
            if Cells[CritEdit.ItemIndex, I] = FindEdit.Text then
            begin
                SetLength(Goals, Length(Goals) + 1);
                Goals[High(Goals)] := I;
            end;
        for I := 1 to Length(Goals) do
            RowTrans(I, Goals[I - 1]);
        RowCount := Length(Goals) + 1;
    end;
end;

procedure TFindForm.RowTrans(First: Integer; Second: Integer); { ÑÎĞÒÈĞÎÂÊÀ }
var
    I: Integer;
begin
    with Timetable do
        for I := 0 to 3 do
            Cells[I, First] := Cells[I, Second];
end;

procedure TFindForm.FindEditKeyPress(Sender: TObject; var key: Char);
begin
    if key = #13 then
        SearchButtonClick(SearchButton);
    if Length(FindEdit.Text + key) > 100 then
        key := #0;
end;

end.
