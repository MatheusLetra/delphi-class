unit UContaCorrente;

interface

type
  TContaCorrente = class

  private

    fSaldo : Double;
    fCPF: String;
    fNomeCliente: String;
  public

    procedure Sacar(Value: Double);
    procedure Depositar(Value: Double);
    function ConsultarSaldo() : Double;
    constructor Create ;
    destructor Destroy ; override ;

  published
     property CPF: String read fCPF write fCPF;
     property NomeCliente: String read fNomeCliente write fNomeCliente;
     property Saldo: Double read fSaldo;
  end;

implementation

{ TContaCorrente }

function TContaCorrente.ConsultarSaldo(): Double;
begin
  Result := fSaldo;
end;

constructor TContaCorrente.Create;
begin
  inherited Create;
end;

procedure TContaCorrente.Depositar(Value: Double);
begin
  fSaldo := fSaldo + Value;
end;

destructor TContaCorrente.Destroy;
begin
  inherited Destroy ;
end;

procedure TContaCorrente.Sacar(Value: Double);
begin
  fSaldo := fSaldo - Value;
end;

end.
