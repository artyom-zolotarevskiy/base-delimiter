program BaseDelimiter;

uses
  Vcl.Forms,
  home in 'home.pas' {homeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(ThomeForm, homeForm);
  Application.Run;
end.
