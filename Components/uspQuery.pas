unit uspQuery;

interface

uses
  FireDAC.Comp.Client, System.Classes, Firedac.Dapt;
type
  TspQuery = class(TFDQuery)
  private
  const
    WHERE = ' where ';
    SELECT = ' select ';
    FROM = ' from ';
  var
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
    FSQL: String;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
    procedure SetSQL(const Value: String);
    procedure MontarSQL;
    procedure LimparListas;
  published
    property SQL: String read FSQL write SetSQL;
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
    procedure GeraSQL;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  end;
implementation

uses
  System.SysUtils;

{ TspQuery }

constructor TspQuery.Create(AOwner:TComponent);
begin
  inherited;
  spCondicoes := TStringList.Create;
  spColunas := TStringList.Create;
  spTabelas := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  spCondicoes.Destroy;
  spColunas.Destroy;
  spTabelas.Destroy;
  inherited;
end;

procedure TspQuery.GeraSQL;
begin
  if spTabelas.Count = 0 then
  begin
    LimparListas;
    raise Exception.Create('Informe pelo menos uma tabela');
  end;

  if spTabelas.Count > 1 then
  begin
    LimparListas;
    raise Exception.Create('É permitido informar apenas uma tabela para a geração do SQL');
  end
  else if spTabelas[0] = emptystr then
  begin
    LimparListas;
    raise Exception.Create('Informe pelo menos uma tabela');
  end;

  MontarSQL;
end;

procedure TspQuery.LimparListas;
begin
  spCondicoes.Clear;
  spColunas.Clear;
  spTabelas.Clear;
end;

procedure TspQuery.MontarSQL;
var
  LCondicao: String;
  LColuna: String;
  LTabela: String;
begin
  FSQL := SELECT;
  LTabela := spTabelas[0];

  if spColunas.Count > 0 then
  begin
    for LColuna in spColunas do
      FSQL := FSQL + LColuna.ToLower+',';
    FSQL := Copy(FSQL,0,Length(FSQL)-1);
  end
  else
  begin
    FSQL := FSQL + ' * ';
  end;

  FSQL := FSQL + FROM + LTabela.ToLower;

  if spCondicoes.Count > 0 then
  begin
    FSQL := FSQL + WHERE;
    for LCondicao in spCondicoes do
      FSQL := FSQL + LCondicao.ToLower;
  end;
  LimparListas;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  FspTabelas := Value;
end;

procedure TspQuery.SetSQL(const Value: String);
begin
  FSQL := Value;
end;

end.
