unit MainClass;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    Vcl.ExtDlgs,
    Vcl.Menus, DblLinkedListClass, ElementClass, AddModal, EditModal;

type
    TMainForm = class(TForm)
        MainMenu1: TMainMenu;
        OpenTextFileDialog1: TOpenTextFileDialog;
        SaveTextFileDialog1: TSaveTextFileDialog;
        Panel1: TPanel;
        Panel2: TPanel;
        PrevButton: TButton;
        NextButton: TButton;
        PrevLabel: TLabel;
        CurrentLabel: TLabel;
        Label4: TLabel;
        ExitButton: TButton;
        EditButton: TButton;
        SaveButton: TButton;
        OpenButton: TButton;
        DeleteButton: TButton;
        AddButton: TButton;
        CreateButton: TButton;
        NextLabel: TLabel;
        File1: TMenuItem;
        Open1: TMenuItem;
        Save1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        Edit1: TMenuItem;
        Edit2: TMenuItem;
        Add1: TMenuItem;
        Delete1: TMenuItem;
        About1: TMenuItem;
        Hotkeys1: TMenuItem;
        N2: TMenuItem;
        Aboutprogram1: TMenuItem;
        Aboutauthor1: TMenuItem;
        PopupMenu1: TPopupMenu;
        PrevIndexLabel: TLabel;
        CurrentIndexLabel: TLabel;
        NextIndexLabel: TLabel;
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure Hotkeys1Click(Sender: TObject);
        procedure Aboutauthor1Click(Sender: TObject);
        procedure Aboutprogram1Click(Sender: TObject);
        procedure Exit1Click(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure CreateButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure EditButtonClick(Sender: TObject);
        procedure NextButtonClick(Sender: TObject);
        procedure PrevButtonClick(Sender: TObject);
        procedure SaveButtonClick(Sender: TObject);
        procedure OpenButtonClick(Sender: TObject);
    private
        { Private declarations }

        procedure OnAdd();
        procedure OnEdit();
        procedure ClearForm();
        procedure SetLabels(Index: Integer);
        procedure SwitchButtonStatus();
    public
        { Public declarations }

        List: TDblLinkedList;
        LabelIndex: Integer;
    end;

const
    MaximumCount = 10;
    MaximumLength = 20;

var
    MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ClearForm;
begin
    List := TDblLinkedList.Create;

    PrevIndexLabel.Caption := '';
    CurrentIndexLabel.Caption := '';
    NextIndexLabel.Caption := '';

    PrevLabel.Caption := '';
    CurrentLabel.Caption := '';
    NextLabel.Caption := '';
end;

procedure TMainForm.CreateButtonClick(Sender: TObject);
begin
    ClearForm;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
begin
    if LabelIndex > 0 then
    begin
        List.Delete(LabelIndex);
        if LabelIndex = List.GetCount + 1 then
            SetLabels(LabelIndex - 1)
        else
            SetLabels(LabelIndex);
    end;

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    ClearForm();
    SwitchButtonStatus;
end;

procedure TMainForm.OnAdd;
begin
    if List.GetCount = MaximumCount then
        MessageBox(0, PWideChar('Maximum number of elements (' +
          IntToStr(MaximumCount) + ').'), 'Error', MB_OK + MB_ICONERROR)
    else
    begin
        AddModalForm.ShowModal();
        SetLabels(List.GetCount);
    end;
end;

procedure TMainForm.OnEdit;
begin
    EditModalForm.ElementEdit.Text := CurrentLabel.Caption;
    EditModalForm.ShowModal();
end;

procedure TMainForm.OpenButtonClick(Sender: TObject);
var
    OpFile: TextFile;
    Reader: String;
    ContinueChoose: Integer;
begin
    ContinueChoose := 6;
    if OpenTextFileDialog1.Execute then
        try
            AssignFile(OpFile, OpenTextFileDialog1.FileName);
            Reset(OpFile);
            if EoF(OpFile) then
                MessageBox(0, 'File is empty.', 'Message',
                  MB_OK + MB_ICONASTERISK)
            else
            begin
                ClearForm();
                while (not EoF(OpFile)) and (List.GetCount < 20) and
                  (ContinueChoose = 6) do
                begin
                    ReadLn(OpFile, Reader);
                    if Length(Reader) > 0 then
                        if Length(Reader) > MaximumLength then
                            ContinueChoose :=
                              MessageBox(0,
                              PWideChar('Line ¹' + IntToStr(List.GetCount) +
                              ' is too big. Do you want to skip and continue?'),
                              'Error!', MB_YESNO + MB_ICONERROR)
                        else
                            List.Add(Reader);
                end;
                SetLabels(1);
            end;
            CloseFile(OpFile);
        except
            MessageBox(0, 'Unknown file error.', 'Error!',
              MB_OK + MB_ICONERROR);
        end;
end;

procedure TMainForm.PrevButtonClick(Sender: TObject);
begin
    SetLabels(LabelIndex - 1);
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
var
    OpFile: TextFile;
begin
    if SaveTextFileDialog1.Execute then
        try
            AssignFile(OpFile, SaveTextFileDialog1.FileName);
            Rewrite(OpFile);

            if MessageBox(0, 'Do you want to save reversed list?', 'Question',
              MB_YESNO + MB_ICONQUESTION) = 6 then
                WriteLn(OpFile, List.GetListForFile(True))
            else
                WriteLn(OpFile, List.GetListForFile(False));

            CloseFile(OpFile);
        except
            MessageBox(0, 'Unknown file error.', 'Error!',
              MB_OK + MB_ICONERROR);
        end;
end;

procedure TMainForm.SetLabels(Index: Integer);
var
    Current: TElement;
begin
    Current := List.GetElement(Index);

    if Current = Nil then
    begin
        CurrentIndexLabel.Caption := '';
        CurrentLabel.Caption := '';
        LabelIndex := 0;
    end
    else
    begin
        CurrentIndexLabel.Caption := IntToStr(Index) + '.';
        CurrentLabel.Caption := Current.GetContent;
        LabelIndex := Index;

        if Current.GetPrev = Nil then
        begin
            PrevIndexLabel.Caption := '';
            PrevLabel.Caption := '';
        end
        else
        begin
            PrevIndexLabel.Caption := IntToStr(Index - 1) + '.';
            PrevLabel.Caption := Current.GetPrev.GetContent;
        end;

        if Current.GetNext = Nil then
        begin
            NextIndexLabel.Caption := '';
            NextLabel.Caption := '';
        end
        else
        begin
            NextIndexLabel.Caption := IntToStr(Index + 1) + '.';
            NextLabel.Caption := Current.GetNext.GetContent;
        end;
    end;

    SwitchButtonStatus();
end;

procedure TMainForm.SwitchButtonStatus;
begin
    if LabelIndex = 0 then
    begin
        PrevButton.Enabled := False;
        NextButton.Enabled := False;
        DeleteButton.Enabled := False;
        EditButton.Enabled := False;
    end
    else
    begin
        DeleteButton.Enabled := True;
        EditButton.Enabled := True;

        if LabelIndex = 1 then
            PrevButton.Enabled := False
        else
            PrevButton.Enabled := True;

        if LabelIndex = List.GetCount then
            NextButton.Enabled := False
        else
            NextButton.Enabled := True;
    end;

end;

procedure TMainForm.AddButtonClick(Sender: TObject);
begin
    OnAdd;
end;

procedure TMainForm.EditButtonClick(Sender: TObject);
begin
    OnEdit;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
    Self.Close();
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_YESNO + MB_ICONWARNING) = 6 then
        CanClose := True
    else
        CanClose := False;
end;

procedure TMainForm.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Ctrl+O      - open file with list' + #13#10 +
      'Ctrl+S      - save list to file' + #13#10 + 'Ctrl+E      - edit element'
      + #13#10 + 'Ctrl+A      - add element' + #13#10 +
      'Ctrl+D      - delete element' + #13#10 + 'Ctrl+K      - hot keys' +
      #13#10 + 'Ctrl+P      - about program' + #13#10 +
      'Ctrl+U      - about author' + #13#10 + 'Esc      - exit', 'Hot keys',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TMainForm.NextButtonClick(Sender: TObject);
begin
    SetLabels(LabelIndex + 1);
end;

procedure TMainForm.Aboutauthor1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda, student of group 951007.',
      'About author', MB_OK + MB_ICONINFORMATION);
end;

procedure TMainForm.Aboutprogram1Click(Sender: TObject);
begin
    MessageBox(0,
      '    This program provides an opportunity to create, view and edit ' +
      'double-linked list. This application has hot keys, which make it ' +
      'easier to work with the program.', 'Help', MB_OK + MB_ICONINFORMATION);
end;

end.
