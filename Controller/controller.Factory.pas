unit controller.Factory;

interface

uses
  controller.Interfaces;

type
  TSpin = controller.Interfaces.TSpin;
  TProgress = controller.Interfaces.TProgress;
  TClientDataSet = controller.Interfaces.TClientDataSet;

  TControllerFactory = class(TInterfacedObject,iFactoryController)
  public
    class function New: iFactoryController;
    function ThreadController: iThreadController;
    function ProjetoController: iProjetoController;
  end;
implementation

uses
  controller.Thread,controller.Projeto;

{ TControllerFactory }

class function TControllerFactory.New: iFactoryController;
begin
  Result := TControllerFactory.Create;
end;

function TControllerFactory.ProjetoController: iProjetoController;
begin
  Result := TProjetoController.Create;
end;

function TControllerFactory.ThreadController: iThreadController;
begin
  Result := TThreadController.Create;
end;

end.
