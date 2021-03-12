unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uspQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmTarefa1 = class(TForm)
    pnPrincipal: TPanel;
    pnSQLGerado: TPanel;
    pnSuperior: TPanel;
    pnColunas: TPanel;
    pnTabelas: TPanel;
    pnGeraSQL: TPanel;
    mColunas: TMemo;
    lblColunas: TLabel;
    mTabelas: TMemo;
    lblTabelas: TLabel;
    pnCondicoes: TPanel;
    lblCondicoes: TLabel;
    mCondicoes: TMemo;
    btnGeraSQL: TButton;
    mSQLGerado: TMemo;
    lblSQLGerado: TLabel;
    spQuery1: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GeraSQL: String;
  public
    { Public declarations }
  end;

var
  frmTarefa1: TfrmTarefa1;

implementation

{$R *.dfm}

procedure TfrmTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  mSQLGerado.Lines.Text := GeraSQL;
end;

procedure TfrmTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmTarefa1 := nil;
end;

procedure TfrmTarefa1.FormShow(Sender: TObject);
begin
  mColunas.SetFocus;
end;

function TfrmTarefa1.GeraSQL: String;
var
  LColunas,
  LTabelas,
  LCondicoes: TArray<String>;
begin
  LColunas := mColunas.Lines.ToStringArray;
  LTabelas := mTabelas.Lines.ToStringArray;
  LCondicoes := mCondicoes.Lines.ToStringArray;

  spQuery1.spColunas.AddStrings(LColunas);
  spQuery1.spTabelas.AddStrings(LTabelas);
  spQuery1.spCondicoes.AddStrings(Lcondicoes);

  spQuery1.GeraSQL;
  Result := spQuery1.SQL;
end;

end.
