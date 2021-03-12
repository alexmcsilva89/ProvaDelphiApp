unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ufTarefa1,ufTarefa2,ufTarefa3;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Tarefas: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmTarefa1: TfrmTarefa1;
    frmTarefa2: TfTarefa2;
    frmTarefa3: TfTarefa3;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}
procedure TFrmPrincipal.miTarefa1Click(Sender: TObject);
begin
  frmTarefa1 := TFrmTarefa1.Create(Self);
  frmTarefa1.Show;
end;

procedure TFrmPrincipal.miTarefa2Click(Sender: TObject);
begin
  frmTarefa2 := TfTarefa2.Create(Self);
  frmTarefa2.Show;
end;

procedure TFrmPrincipal.miTarefa3Click(Sender: TObject);
begin
  frmTarefa3 := TfTarefa3.Create(Self);
  frmTarefa3.Show;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
end.



