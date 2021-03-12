program ProvaDelphiAppTeste;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  uTesteTarefa1 in 'Tarefa1\uTesteTarefa1.pas',
  uspQuery in '..\Components\uspQuery.pas',
  uTesteTarefa2 in 'Tarefa2\uTesteTarefa2.pas',
  model.Factory in '..\Model\model.Factory.pas',
  model.Interfaces in '..\Model\model.Interfaces.pas',
  model.Projeto in '..\Model\model.Projeto.pas',
  model.Thread in '..\Model\model.Thread.pas',
  controller.Factory in '..\Controller\controller.Factory.pas',
  controller.Interfaces in '..\Controller\controller.Interfaces.pas',
  controller.Projeto in '..\Controller\controller.Projeto.pas',
  controller.Thread in '..\Controller\controller.Thread.pas',
  ufTarefa2 in '..\View\ufTarefa2.pas' {fTarefa2},
  uTesteTarefa3 in 'Tarefa3\uTesteTarefa3.pas',
  ufTarefa1 in '..\View\ufTarefa1.pas' {frmTarefa1},
  ufTarefa3 in '..\View\ufTarefa3.pas' {fTarefa3};

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
