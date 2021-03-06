unit UConversor;

interface

type
  TConversor = class

private
  fNumero: Integer;
  const
    VetorInt: array [0 .. 12] of Integer = (1000, 900, 500, 400, 100, 90, 50,
      40, 10, 9, 5, 4, 1);

  const
    VetorString: array [0 .. 12] of string = ('M', 'CM', 'D', 'CD', 'C', 'XC',
      'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');


  protected

  public
    property Numero: Integer read fNumero write fNumero;

    function Converter(): String;

    Constructor Create;
    Destructor Destroy; Override;
  end;

implementation

{ TConversor }

function TConversor.Converter(): String;
var
  I, N: Integer;
  Converter : Boolean;
begin
  N         := Numero;
  Converter := True;

  while Converter do
  begin
    if N = 0 then
      Converter := False;
    I := 0;
    while (N > 0) do
    begin
      if (N >= VetorInt[I]) then
      begin
        Result := Result + VetorString[I];
        N := N - VetorInt[I];
      end
      else
      begin
        I := I + 1;
      end;
    end;
  end;
end;

constructor TConversor.Create;
begin
  inherited;
end;

destructor TConversor.Destroy;
begin
  inherited;
end;

end.
