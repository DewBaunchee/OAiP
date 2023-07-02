unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
    TForm1 = class(TForm)
        MainMenu1: TMainMenu;
        File1: TMenuItem;
        Help1: TMenuItem;
        Label1: TLabel;
        Label2: TLabel;
        Timetable: TButton;
        Exit: TButton;
        Help: TButton;
        Edit: TButton;
        Find: TButton;
        View: TButton;
        Create: TButton;
        Create1: TMenuItem;
        View1: TMenuItem;
        Find1: TMenuItem;
        Edit1: TMenuItem;
        N1: TMenuItem;
        Exit1: TMenuItem;
        Hotkeys1: TMenuItem;
        Aboutprogram1: TMenuItem;
        Aboutauthor1: TMenuItem;
        N2: TMenuItem;
        PopupMenu1: TPopupMenu;
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure ExitClick(Sender: TObject);
        procedure Hotkeys1Click(Sender: TObject);
        procedure Aboutprogram1Click(Sender: TObject);
        procedure Aboutauthor1Click(Sender: TObject);
        procedure HelpClick(Sender: TObject);
        procedure CreateClick(Sender: TObject);
        procedure FormMoving(var m: TMessage); message WM_MOVING;
        procedure ViewClick(Sender: TObject);
        procedure FindClick(Sender: TObject);
        procedure EditClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;
    OpenedWindow: Char;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5;

procedure TForm1.CreateClick(Sender: TObject);
begin
    case OpenedWindow of
        'V':
            ViewForm.Close;
        'F':
            FindForm.Close;
        'E':
            EditForm.Close;
    end;
    CreateForm.Left := Form1.Left + 4;
    CreateForm.Top := Form1.Top + 110;
    CreateForm.Show;
    OpenedWindow := 'C';
end;

procedure TForm1.EditClick(Sender: TObject);
begin

    case OpenedWindow of
        'V':
            ViewForm.Close;
        'F':
            FindForm.Close;
        'C':
            CreateForm.Close;
    end;
    EditForm.Left := Form1.Left + 4;
    EditForm.Top := Form1.Top + 110;
    EditForm.Show;
    OpenedWindow := 'E';
end;

procedure TForm1.FindClick(Sender: TObject);
begin

    case OpenedWindow of
        'V':
            ViewForm.Close;
        'C':
            CreateForm.Close;
        'E':
            EditForm.Close;
    end;
    FindForm.Left := Form1.Left + 4;
    FindForm.Top := Form1.Top + 110;
    FindForm.Show;
    OpenedWindow := 'F';
end;

procedure TForm1.ViewClick(Sender: TObject);
begin
    case OpenedWindow of
        'C':
            CreateForm.Close;
        'F':
            FindForm.Close;
        'E':
            EditForm.Close;
    end;
    ViewForm.Left := Form1.Left + 4;
    ViewForm.Top := Form1.Top + 110;
    ViewForm.Show;
    OpenedWindow := 'V';
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
    Form1.Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageBox(0, 'Do you want to exit?', 'Exit',
      MB_YESNO + MB_ICONWARNING) = 6 then
        CanClose := true
    else
        CanClose := false;

end;

procedure TForm1.FormMoving(var m: TMessage);
begin
    case OpenedWindow of
        'C':
            begin
                CreateForm.Left := Form1.Left + 4;
                CreateForm.Top := Form1.Top + 110;
            end;
        'V':
            begin
                ViewForm.Left := Form1.Left + 4;
                ViewForm.Top := Form1.Top + 110;
            end;
        'F':
            begin
                FindForm.Left := Form1.Left + 4;
                FindForm.Top := Form1.Top + 110;
            end;
        'E':
            begin
                EditForm.Left := Form1.Left + 4;
                EditForm.Top := Form1.Top + 110;
            end;
    end;
end;

procedure TForm1.HelpClick(Sender: TObject);
begin
    MessageBox(0,
      '     This program provides an opportunity to create, view and edit timetable of classes. '
      + 'There is hot keys in application which simplifies using of program.' +
      #13#10 + '     You in main window of app. To use other functions ' +
      'click on relevant buttons. More information in "Help".', 'About program',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TForm1.Hotkeys1Click(Sender: TObject);
begin
    MessageBox(0, 'Alt+C      - create timetable' + #13#10 +
      'Alt+V      - view timetable' + #13#10 +
      'Alt+F      - search in timetable' + #13#10 +
      'Alt+E      - edit timetable' + #13#10 + 'Esc       - exit' + #13#10 +
      'Alt+H      - hot keys' + #13#10 + 'Alt+P      - about program' + #13#10 +
      'Alt+A      - about author', 'Hot keys', MB_OK + MB_ICONINFORMATION);
end;

procedure TForm1.Aboutauthor1Click(Sender: TObject);
begin
    MessageBox(0, 'Created by Matvey Vorivoda, student of group 951007.',
      'About author', MB_OK + MB_ICONINFORMATION);
end;

procedure TForm1.Aboutprogram1Click(Sender: TObject);
begin
    MessageBox(0,
      'This program provides an opportunity to create, view and edit timetable of classes. There is hot keys in application which simplifies using of program.',
      'About program', MB_OK + MB_ICONINFORMATION);
end;

end.
