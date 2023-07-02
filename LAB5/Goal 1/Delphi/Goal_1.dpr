program Goal_1;

uses
  Vcl.Forms,
  MainClass in 'MainClass.pas' {MainForm},
  ElementClass in 'ElementClass.pas',
  DblLinkedListClass in 'DblLinkedListClass.pas',
  AddModal in 'AddModal.pas' {AddModalForm},
  EditModal in 'EditModal.pas' {EditModalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddModalForm, AddModalForm);
  Application.CreateForm(TEditModalForm, EditModalForm);
  Application.Run;
end.
