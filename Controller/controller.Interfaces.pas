unit controller.Interfaces;

interface

uses
  Vcl.Samples.Spin, Vcl.ComCtrls,Data.DB,Datasnap.DBClient;

type
  TSpin = Vcl.Samples.Spin.TSpinEdit;
  TProgress = Vcl.ComCtrls.TProgressBar;
  TDataset = Data.DB.TDataSet;
  TClientDataSet = Datasnap.DBClient.TClientDataSet;
  TFieldType = Data.DB.TFieldType;

  iThreadController = interface
    ['{727C6535-B9A3-4E48-96E4-031662BF92AF}']
    procedure ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
  end;

  iProjetoController = interface
    ['{AADBF30D-6A41-4D0F-9E1F-C2A741298B71}']
    procedure RetornarDataSetPopulado(aDataSet: TDataSet);
    function ObterTotal(aDataSet: TDataSet): Currency;
    function ObterTotalDivisoes(aDataSet: TDataSet): Currency;
  end;

  iFactoryController = interface
    ['{0B90F831-8075-44DC-9A32-C7452031193E}']
    function ThreadController: iThreadController;
    function ProjetoController: iProjetoController;
  end;
implementation

end.
