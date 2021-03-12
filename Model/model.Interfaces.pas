unit model.Interfaces;

interface

uses
  Vcl.Samples.Spin, Vcl.ComCtrls, Data.DB, Datasnap.DBClient;

type
  TSpin = Vcl.Samples.Spin.TSpinEdit;
  TProgress = Vcl.ComCtrls.TProgressBar;
  TDataset = Data.DB.TDataSet;
  TClientDataSet = Datasnap.DBClient.TClientDataSet;
  TFieldType = Data.DB.TFieldType;


  iThreadModel = interface
    ['{BA90F9C5-441A-4E75-82AD-43B83CB12E6E}']
    procedure ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
  end;

  iProjetoModel = interface
    ['{439FE706-DEE1-4330-869C-5100AE55F761}']
    procedure RetornarDataSetPopulado(aDataSet: TDataSet);
    function ObterTotal(aDataSet: TDataSet): Currency;
    function ObterTotalDivisoes(aDataSet: TDataSet): Currency;
  end;

  iFactoryModel = interface
    ['{A77FB8F4-556B-4751-B652-773D14CBBD95}']
    function ThreadModel: iThreadModel;
    function ProjetoModel: iProjetoModel;
  end;
implementation

end.
