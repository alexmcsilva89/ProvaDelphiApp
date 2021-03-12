unit controller.Thread;

interface

uses
  controller.Interfaces;

type
  TThreadController = class(TInterfacedObject,iThreadController)
  public
    procedure ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
  end;
implementation

uses
  model.Factory;

{ TThreadController }

procedure TThreadController.ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
begin
  TModelFactory.New
               .ThreadModel
               .ExecutarLaco(aMilisegundos,aProgresso);
end;

end.
