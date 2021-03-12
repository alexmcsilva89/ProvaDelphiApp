unit model.Factory;

interface

uses
  model.Interfaces;

type
  TModelFactory = class(TInterfacedObject,iFactoryModel)
  public
    class function New: iFactoryModel;
    function ThreadModel: iThreadModel;
    function ProjetoModel: iProjetoModel;
  end;
implementation

uses
  model.Thread, model.Projeto;

{ iModelFactory }

class function TModelFactory.New: iFactoryModel;
begin
  Result := TModelFactory.Create;
end;

function TModelFactory.ProjetoModel: iProjetoModel;
begin
  Result := TModelProjeto.Create;
end;

function TModelFactory.ThreadModel: iThreadModel;
begin
  Result := TModelThread.Create;
end;

end.
