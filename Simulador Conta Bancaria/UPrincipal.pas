unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MaskUtils, UContaCorrente;

type
  TFrm_Principal = class(TForm)
    btnCriarConta: TButton;
    btnSacar: TButton;
    btnDepositar: TButton;
    btnConsultarSaldo: TButton;
    edCPF: TEdit;
    edNomeCliente: TEdit;
    edValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnCriarContaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSacarClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure btnConsultarSaldoClick(Sender: TObject);
  private
    { Private declarations }
    ContaCorrente: TContaCorrente;
    procedure ValidarCampos();
    procedure IniciarConta();
    procedure BloquearDadosCliente();
    procedure LimparValor();
    function ValidarSaldo(Valor: Double): Boolean;
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

procedure TFrm_Principal.BloquearDadosCliente;
begin
  edCPF.Enabled := not edCPF.Enabled;
  edNomeCliente.Enabled := not edNomeCliente.Enabled;
  edValor.Enabled := not edValor.Enabled;
  btnSacar.Enabled := not btnSacar.Enabled;
  btnDepositar.Enabled := not btnDepositar.Enabled;
  btnConsultarSaldo.Enabled := not btnConsultarSaldo.Enabled;
  btnCriarConta.Enabled := not btnCriarConta.Enabled;
end;

procedure TFrm_Principal.btnConsultarSaldoClick(Sender: TObject);
begin
  ShowMessage('Saldo Disponível: R$ ' + FormatFloat('#,##0.00',
    ContaCorrente.ConsultarSaldo));
end;

procedure TFrm_Principal.btnCriarContaClick(Sender: TObject);
begin
  ValidarCampos();
  IniciarConta();
end;

procedure TFrm_Principal.btnDepositarClick(Sender: TObject);
var
  ValorDigitado: Double;
begin
  ValorDigitado := StrToFloatDef(edValor.Text, 0);
  if ValorDigitado > 0 then
  begin
    ValorDigitado := StrToFloatDef(edValor.Text, 0);
    ContaCorrente.Depositar(ValorDigitado);
    ShowMessage('Depósito Efetuado com Sucesso!');
    LimparValor;
  end;
end;

procedure TFrm_Principal.btnSacarClick(Sender: TObject);
var
  ValorDigitado: Double;
begin
  ValorDigitado := StrToFloatDef(edValor.Text, 0);

  if ValorDigitado > 0 then
  begin
    if ValidarSaldo(ValorDigitado) then
    begin
      ContaCorrente.Sacar(ValorDigitado);
      ShowMessage('Saque Efetuado com Sucesso!');
      LimparValor;
    end
    else
      ShowMessage('Saldo Insuficiente!');
  end;
end;

procedure TFrm_Principal.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #13]) then
    Key := #0;
end;

procedure TFrm_Principal.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in (['0' .. '9', #13, #8, ',']))) or
    ((Key = ',') and (Pos(',', edValor.Text) > 0)) then
    Key := #0;
end;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ContaCorrente.Destroy;
end;

procedure TFrm_Principal.IniciarConta;
begin
  ContaCorrente := TContaCorrente.Create;
  ContaCorrente.CPF := Trim(edCPF.Text);
  ContaCorrente.NomeCliente := Trim(edNomeCliente.Text);
  BloquearDadosCliente;
end;

procedure TFrm_Principal.LimparValor;
begin
  edValor.Text := '';
end;

procedure TFrm_Principal.ValidarCampos;
begin
  if Trim(edCPF.Text) = '' then
  begin
    ShowMessage('É necessário Informar um CPF!');
    abort;
  end;

  if Trim(edNomeCliente.Text) = '' then
  begin
    ShowMessage('É necessário Informar um Nome!');
    abort;
  end;

end;

function TFrm_Principal.ValidarSaldo(Valor: Double): Boolean;
begin
  Result := False;
  if Valor <= ContaCorrente.Saldo then
    Result := True;
end;

end.
