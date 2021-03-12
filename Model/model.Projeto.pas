unit model.Projeto;

interface

uses
  model.Interfaces;

type
  TModelProjeto = class(TInterfacedObject,iProjetoModel)
  private
    Fcds: TClientDataSet;
    procedure PopularDataSet;
    procedure CriarDataSet;
  public
    procedure RetornarDataSetPopulado(aDataSet: TDataSet);
    function ObterTotal(aDataSet: TDataSet): Currency;
    function ObterTotalDivisoes(aDataSet: TDataSet): Currency;
  end;
implementation

uses
  System.SysUtils,System.Math;

{ TModelProjeto }
procedure TModelProjeto.CriarDataSet;
begin
  Fcds.Close;
  Fcds.FieldDefs.Clear;
  with Fcds.FieldDefs.AddFieldDef do
  begin
    DataType := TFieldType.ftInteger;
    Name := 'IdProjeto';
  end;
  with Fcds.FieldDefs.AddFieldDef do
  begin
    DataType := TFieldType.ftString;
    Name := 'NomeProjeto';
    Size := 50;
  end;
  with Fcds.FieldDefs.AddFieldDef do
  begin
    DataType := TFieldType.ftCurrency;
    Name := 'Valor';
  end;
  Fcds.CreateDataSet;
end;

function TModelProjeto.ObterTotal(aDataSet: TDataSet): Currency;
begin
  Result := 0;
  aDataSet.First;
  while not aDataSet.Eof do
  begin
    Result := Result + aDataSet.FieldByName('Valor').AsCurrency;
    aDataSet.Next;
  end;
end;

function TModelProjeto.ObterTotalDivisoes(aDataSet: TDataSet): Currency;
var
  LDivisor: Currency;
  LTotal: Currency;
  LPrimeiroLoop : Boolean;
begin
  LDivisor := 0;
  LTotal := 0;
  LPrimeiroLoop := True;
  aDataSet.First;
  while not aDataSet.Eof do
  begin
    if aDataSet.FieldByName('Valor').AsCurrency = 0 then
      raise Exception.Create('Não é permitido obter o total de divisões pois há valores zerados');
    if LPrimeiroLoop then
    begin
      LPrimeiroLoop := False;
      LDivisor := aDataSet.FieldByName('Valor').AsCurrency;
    end
    else
      begin
        LTotal := LTotal + (aDataSet.FieldByName('Valor').AsCurrency / LDivisor);
        LDivisor := aDataSet.FieldByName('Valor').AsCurrency;
      end;
    aDataSet.Next;
  end;
  Result := RoundTo(LTotal,-2);
end;

procedure TModelProjeto.PopularDataSet;
var
  I: Integer;
  J: Integer;
begin
  I := 10;
  J := 1;
  while I <> 110 do
  begin
    Fcds.Append;
    Fcds.FieldByName('IdProjeto').AsInteger := J;
    Fcds.FieldByName('NomeProjeto').AsString := 'Projeto '+IntToStr(J);
    Fcds.FieldByName('Valor').AsCurrency := I;
    Fcds.Post;
    J := J+1;
    I := I+10;
  end;
end;

procedure TModelProjeto.RetornarDataSetPopulado(aDataSet: TDataSet);
begin
  Fcds := TClientDataSet(aDataSet);
  CriarDataSet;
  PopularDataSet;
end;

end.
