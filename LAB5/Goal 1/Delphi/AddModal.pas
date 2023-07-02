unit AddModal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
    TAddModalForm = class(TForm)
        AddButton: TButton;
        ElementEdit: TEdit;
        PopupMenu1: TPopupMenu;
        procedure AddButtonClick(Sender: TObject);
        procedure ReturnElement();
        procedure ElemEditKeyPress(Sender: TObject; var Key: Char);
        procedure EditChange(Sender: TObject);
        procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

const
    MaximumLength = 20;

var
    AddModalForm: TAddModalForm;

implementation

{$R *.dfm}

uses MainClass;

procedure TAddModalForm.EditChange(Sender: TObject);
begin
    if ElementEdit.Text = '' then
        AddButton.Enabled := False
    else
        AddButton.Enabled := True;
end;

procedure TAddModalForm.AddButtonClick(Sender: TObject);
begin
    ReturnElement();
end;

procedure TAddModalForm.ReturnElement;
begin
    if Length(ElementEdit.Text) > 0 then
        MainForm.List.Add(ElementEdit.Text);
    ElementEdit.Text := '';
    AddModalForm.Close();
end;

procedure TAddModalForm.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    TEdit(Sender).ReadOnly:= (Shift=[ssCtrl]);
end;

procedure TAddModalForm.ElemEditKeyPress(Sender: TObject; var Key: Char);
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
