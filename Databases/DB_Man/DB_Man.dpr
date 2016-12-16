program DB_Man;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
