program Goal_1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {CreateForm},
  Unit3 in 'Unit3.pas' {ViewForm},
  Unit4 in 'Unit4.pas' {FindForm},
  Unit5 in 'Unit5.pas' {EditForm},
  Unit6 in 'Unit6.pas' {ModalView},
  Unit7 in 'Unit7.pas' {ModalEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCreateForm, CreateForm);
  Application.CreateForm(TViewForm, ViewForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TModalView, ModalView);
  Application.CreateForm(TModalEdit, ModalEdit);
  Application.Run;
end.
