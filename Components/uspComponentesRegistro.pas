unit uspComponentesRegistro;

interface

uses
  uspQuery,system.classes;

procedure register;

implementation

procedure register;
begin
  RegisterComponents('spComponentes',[TspQuery]);
end;

end.
