program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufTarefa1 in 'View\ufTarefa1.pas' {frmTarefa1},
  view.principal in 'View\view.principal.pas' {FrmPrincipal},
  ufTarefa2 in 'View\ufTarefa2.pas' {fTarefa2},
  controller.Thread in 'Controller\controller.Thread.pas',
  model.Thread in 'Model\model.Thread.pas',
  controller.Interfaces in 'Controller\controller.Interfaces.pas',
  model.Interfaces in 'Model\model.Interfaces.pas',
  controller.Factory in 'Controller\controller.Factory.pas',
  model.Factory in 'Model\model.Factory.pas',
  ufTarefa3 in 'View\ufTarefa3.pas' {fTarefa3},
  controller.Projeto in 'Controller\controller.Projeto.pas',
  model.Projeto in 'Model\model.Projeto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
