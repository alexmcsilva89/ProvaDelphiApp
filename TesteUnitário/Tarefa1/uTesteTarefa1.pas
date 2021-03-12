unit uTesteTarefa1;

interface

uses
  DUnitX.TestFramework, uspQuery;

type
  [TestFixture]
  TTesteTarefa1 = class(TObject)
  private
    FspQuery : TspQuery;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TesteGeraSQL;
  end;

implementation

procedure TTesteTarefa1.Setup;
begin
  FspQuery := TspQuery.Create(nil);
end;

procedure TTesteTarefa1.TearDown;
begin
  FspQuery.Destroy;
end;


procedure TTesteTarefa1.TesteGeraSQL;
begin
  FspQuery.spCondicoes.Add('');
  FspQuery.spColunas.Add('');
  FspQuery.spTabelas.Add('');
  Assert.WillRaise(FspQuery.GeraSQL,nil,'TspQuery.GeraSQL');

  FspQuery.spColunas.Add('nome');
  FspQuery.spTabelas.Add('tabela');
  FspQuery.spTabelas.Add('tabela');
  FspQuery.spCondicoes.Add('where nome = ''Alex''');
  Assert.WillRaise(FspQuery.GeraSQL,nil,'TspQuery.GeraSQL');

  FspQuery.spColunas.Add('nome');
  FspQuery.spCondicoes.Add('where nome = ''Alex''');
  Assert.WillRaise(FspQuery.GeraSQL,nil,'TspQuery.GeraSQL');

end;

initialization
  TDUnitX.RegisterTestFixture(TTesteTarefa1);
end.
