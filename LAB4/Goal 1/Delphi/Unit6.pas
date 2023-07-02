unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TModalView = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ProfessorEdit: TEdit;
    DayEdit: TEdit;
    SubjectEdit: TEdit;
    OrderEdit: TEdit;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModalView: TModalView;

implementation

{$R *.dfm}

procedure TModalView.CloseButtonClick(Sender: TObject);
begin
    ModalView.Close;
end;

end.
