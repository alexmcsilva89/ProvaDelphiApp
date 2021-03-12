unit uTesteTarefa2;

interface

uses
  DUnitX.TestFramework, Vcl.Samples.Spin,Vcl.ComCtrls,ufTarefa2;

type
  [TestFixture]
  TTesteTarefa2 = class(TObject)
  private
    FSpin: TSpinEdit;
    FProgressBar: TProgressBar;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TesteExecutarLaco;
  end;

implementation

uses
  controller.Factory,System.SysUtils;

{ TTesteTarefa2 }

procedure TTesteTarefa2.Setup;
begin
  FSpin := TSpinEdit.Create(nil);
  FProgressBar := TProgressBar.Create(nil);
end;

procedure TTesteTarefa2.TearDown;
begin
  FSpin.Destroy;
  FProgressBar.Destroy;
end;

procedure TTesteTarefa2.TesteExecutarLaco;
begin
  FSpin.Value := -90;
  TThreadExecutar.FspMiliSegundos := FSpin;
  TThreadExecutar.FpbThread := FProgressBar;
  Assert.WillRaise(TThreadExecutar.Executar,nil,'TModelThread.ExecutarLaco');

  FSpin.Value := 0;
  TThreadExecutar.FspMiliSegundos := FSpin;
  TThreadExecutar.FpbThread := FProgressBar;
  Assert.WillRaise(TThreadExecutar.Executar,nil,'TModelThread.ExecutarLaco');
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteTarefa2);

end.
