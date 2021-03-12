unit model.Thread;

interface

uses
  model.Interfaces,System.Threading;

type
  TModelThread = class(TInterfacedObject,iThreadModel)
  public
    class function New: iThreadModel;
    procedure ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
  end;
implementation

uses
  System.SysUtils, System.Classes;

{ TModelThread }

procedure TModelThread.ExecutarLaco(aMilisegundos: TSpin; aProgresso: TProgress);
var
  LTask : ITask;
begin
  if aMilisegundos.Value <= 0 then
    raise Exception.Create('Valor informado deve ser maior que 0');

  LTask := TTask.Create(procedure
                        var
                          I: Integer;
                        begin
                          for I := 0 to 100 do
                          begin
                            Sleep(aMilisegundos.Value);
                            aProgresso.Position := I;
                          end;
                        end);
  LTask.Start;
end;

class function TModelThread.New: iThreadModel;
begin
  Result := TModelThread.Create;
end;

end.
