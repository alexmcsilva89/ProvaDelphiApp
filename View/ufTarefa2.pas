unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin;

type
  TThreadExecutar = class
  public
    class var FspMiliSegundos: TSpinEdit;
    class var FpbThread: TProgressBar;
    class procedure Executar;
  end;


  TfTarefa2 = class(TForm)
    pnPrincipal: TPanel;
    pnThread2: TPanel;
    pnThread1: TPanel;
    pbThread1: TProgressBar;
    speMiliSegundos2: TSpinEdit;
    speMiliSegundos1: TSpinEdit;
    pnExecutar: TPanel;
    btnThread: TButton;
    lblThread1: TLabel;
    lblThread2: TLabel;
    pbThread2: TProgressBar;
    procedure btnThreadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExecutarThread1;
    procedure ExecutarThread2;
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  controller.Factory;

{$R *.dfm}
class procedure TThreadExecutar.Executar;
begin
  TControllerFactory.New
                    .ThreadController
                    .ExecutarLaco(FspMiliSegundos,FpbThread); 
end;

procedure TfTarefa2.btnThreadClick(Sender: TObject);
begin
  ExecutarThread1;
  ExecutarThread2;
end;

procedure TfTarefa2.ExecutarThread1;
begin
  TThreadExecutar.FspMiliSegundos := speMiliSegundos1;
  TThreadExecutar.FpbThread := pbThread1;
  TThreadExecutar.Executar;
end;

procedure TfTarefa2.ExecutarThread2;
begin
  TThreadExecutar.FspMiliSegundos := speMiliSegundos2;
  TThreadExecutar.FpbThread := pbThread2;
  TThreadExecutar.Executar;
end;
procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa2 := nil;
end;

end.
