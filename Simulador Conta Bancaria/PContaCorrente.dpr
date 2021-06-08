program PContaCorrente;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Frm_Principal},
  UContaCorrente in 'UContaCorrente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
