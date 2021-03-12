unit controller.Projeto;

interface

uses
  controller.interfaces;

type
  TProjetoController = class(TInterfacedObject,iProjetoController)
  public
    procedure RetornarDataSetPopulado(aDataSet: TDataSet);
    function ObterTotal(aDataSet: TDataSet): Currency;
    function ObterTotalDivisoes(aDataSet: TDataSet): Currency;
  end;
implementation
{ TProjetoController }
uses
  model.Factory;

function TProjetoController.ObterTotal(aDataSet: TDataSet): Currency;
begin
  Result := TModelFactory.New
                         .ProjetoModel
                         .ObterTotal(aDataSet);
end;

function TProjetoController.ObterTotalDivisoes(aDataSet: TDataSet): Currency;
begin
  Result := TModelFactory.New
                         .ProjetoModel
                         .ObterTotalDivisoes(aDataSet);
end;

procedure TProjetoController.RetornarDataSetPopulado(aDataSet: TDataSet);
begin
  TModelFactory.New
               .ProjetoModel
               .RetornarDataSetPopulado(aDataSet);
end;

end.
