unit EditModal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
    TEditModalForm = class(TForm)
        ElementEdit: TEdit;
        ClearButton: TButton;
        EditButton: TButton;
        PopupMenu1: TPopupMenu;
        procedure EditButtonClick(Sender: TObject);
        procedure ReturnElement();
        procedure ElemEditKeyPress(Sender: TObject; var Key: Char);
        procedure ClearButtonClick(Sender: TObject);
        procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure EditChange(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MaximumLength = 20;

var
    EditModalForm: TEditModalForm;

implementation

{$R *.dfm}

uses MainClass;

procedure TEditModalForm.EditChange(Sender: TObject);
begin
    if ElementEdit.Text = '' then
        EditButton.Enabled := False
    else
        EditButton.Enabled := True;
end;

procedure TEditModalForm.ClearButtonClick(Sender: TObject);
begin
    ElementEdit.Text := '';
    ElementEdit.SetFocus;
end;

procedure TEditModalForm.KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    TEdit(Sender).ReadOnly := (Shift = [ssCtrl]);
end;

procedure TEditModalForm.EditButtonClick(Sender: TObject);
begin
    ReturnElement();
end;

procedure TEditModalForm.ReturnElement;
begin
    MainForm.List.GetElement(MainForm.LabelIndex).SetContent(ElementEdit.Text);
    MainForm.CurrentLabel.Caption := ElementEdit.Text;
    ElementEdit.Text := '';
    EditModalForm.Close();
end;

procedure TEditModalForm.ElemEditKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #8:
            ;
        #13:
            ReturnElement();
    else
        if Length(ElementEdit.Text + Key) > MaximumLength then
        begin
            Key := #0;
            MessageBox(0, PWideChar('Maximum length is ' + IntToStr(MaximumLength) + '.'), 'Error',
              MB_OK + MB_ICONERROR);
        end;
    end;
end;

end.
