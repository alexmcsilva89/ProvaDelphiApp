unit uTesteTarefa3;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTesteTarefa3 = class(TObject)
  public
     [Test]
     procedure TesteObterTotalSoma;overload;

     [Test]
     [TestCase('Case1','169,719')]
     [TestCase('Case2','195,39-745,39','-')]
     [TestCase('Case3','199,900-749,90','-')]
     procedure TesteObterTotalSoma(aValue: String; aResult: String);overload;

     [Test]
     procedure TesteObterTotalDivisoes; overload;

     [Test]
     [TestCase('Case4','169-13,52','-')]
     [TestCase('Case5','195,39-13,78','-')]
     [TestCase('Case6','199,900-13,83','-')]
     procedure TesteObterTotalDivisoes(aValue: String; aResult: String);overload;
  end;

implementation

uses
  controller.Factory, System.SysUtils;

{ TTesteTarefa3 }

procedure TTesteTarefa3.TesteObterTotalDivisoes;
var
  Lcds : TClientDataSet;
  LTotalDivisoes : Currency;
begin
  Lcds := TClientDataSet.Create(nil);
  try
    TControllerFactory.New
                      .ProjetoController
                      .RetornarDataSetPopulado(Lcds);

    LTotalDivisoes := TControllerFactory.New
                                        .ProjetoController
                                        .ObterTotalDivisoes(Lcds);
    Assert.IsTrue(LTotalDivisoes = 11.83);
  finally
    Lcds.Destroy;
  end;
end;

procedure TTesteTarefa3.TesteObterTotalSoma;
var
  Lcds : TClientDataSet;
  LTotal : Currency;
begin
  Lcds := TClientDataSet.Create(nil);
  try
    TControllerFactory.New
                      .ProjetoController
                      .RetornarDataSetPopulado(Lcds);

    LTotal := TControllerFactory.New
                                .ProjetoController
                                .ObterTotal(Lcds);
    Assert.IsTrue(LTotal = 550);
  finally
    Lcds.Destroy;
  end;
end;

procedure TTesteTarefa3.TesteObterTotalDivisoes(aValue, aResult: String);
var
  Lcds : TClientDataSet;
  LTotal : Currency;
begin
  Lcds := TClientDataSet.Create(nil);
  try
    TControllerFactory.New
                      .ProjetoController
                      .RetornarDataSetPopulado(Lcds);

    Lcds.Append;
    Lcds.FieldByName('Valor').AsCurrency := StrToCurr(aValue);
    Lcds.Post;

    LTotal := TControllerFactory.New
                                .ProjetoController
                                .ObterTotalDivisoes(Lcds);
    Assert.IsTrue(LTotal = StrToCurr(aResult));
  finally
    Lcds.Destroy;
  end;
end;

procedure TTesteTarefa3.TesteObterTotalSoma(aValue, aResult: String);
var
  Lcds : TClientDataSet;
  LTotal : Currency;
begin
  Lcds := TClientDataSet.Create(nil);
  try
    TControllerFactory.New
                      .ProjetoController
                      .RetornarDataSetPopulado(Lcds);

    Lcds.Append;
    Lcds.FieldByName('Valor').AsCurrency := StrToCurr(aValue);
    Lcds.Post;

    LTotal := TControllerFactory.New
                                .ProjetoController
                                .ObterTotal(Lcds);
    Assert.IsTrue(LTotal = StrToCurr(aResult));
  finally
    Lcds.Destroy;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteTarefa3);

end.
