unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,controller.Factory, Data.DB;

type
  TfTarefa3 = class(TForm)
    pnPrincipal: TPanel;
    pnTotais: TPanel;
    pnValoresProjeto: TPanel;
    grdValoresProjeto: TDBGrid;
    lblValoresProjeto: TLabel;
    pnBotoes: TPanel;
    btnObterTotal: TButton;
    edtTotal: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    btnObterTotalDivisoes: TButton;
    edtTotalDivisoes: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    Fds: TDataSource;
    Fcds: TClientDataSet;
    procedure ExibirValores;
    procedure ObterTotal;
    procedure ObterTotalDivisoes;
  public
    { Public declarations }
    destructor Destroy;override;
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}
procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  ObterTotal;
end;

procedure TfTarefa3.btnObterTotalDivisoesClick(Sender: TObject);
begin
  ObterTotalDivisoes;
end;

destructor TfTarefa3.Destroy;
begin
  Fcds.Destroy;
  Fds.Destroy;
  inherited;
end;

procedure TfTarefa3.ExibirValores;
begin
  TControllerFactory.New
                    .ProjetoController
                    .RetornarDataSetPopulado(Fcds);
  Fds.DataSet := Fcds;
  grdValoresProjeto.DataSource := Fds;
  grdValoresProjeto.Columns[0].FieldName := 'IdProjeto';
  grdValoresProjeto.Columns[1].FieldName := 'NomeProjeto';
  grdValoresProjeto.Columns[2].FieldName := 'Valor';
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  Fcds := TClientDataSet.Create(nil);
  Fds := TDataSource.Create(nil);
  ExibirValores;
end;

procedure TfTarefa3.ObterTotal;
begin
  EdtTotal.Text := FormatFloat( '#,##0.00' ,TControllerFactory.New
                                                              .ProjetoController
                                                              .ObterTotal(Fcds));
end;

procedure TfTarefa3.ObterTotalDivisoes;
begin
  edtTotalDivisoes.Text := CurrToStr(TControllerFactory.New
                                                       .ProjetoController
                                                       .ObterTotalDivisoes(Fcds));
end;

end.
