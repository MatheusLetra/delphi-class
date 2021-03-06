unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UConversor;

type
  TfrmPrincipal = class(TForm)
    edNumero: TEdit;
    edRomano: TEdit;
    btnApagar: TButton;
    btnConverter: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnConverterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApagarClick(Sender: TObject);
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Conversor : TConversor;
    procedure Converter();
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.btnApagarClick(Sender: TObject);
begin
  edNumero.Text := '';
  edRomano.Text := '';
  edNumero.SetFocus;
end;

procedure TfrmPrincipal.btnConverterClick(Sender: TObject);
begin
  Converter;
end;

procedure TfrmPrincipal.Converter;
begin
  if (StrToIntDef(edNumero.Text,0) >= 1) and
     (StrToIntDef(edNumero.Text,0) <= 1000) then
  begin
    Conversor.Numero := StrToIntDef(edNumero.Text,0);
    edRomano.Text    := Conversor.Converter();
  end
  else
  begin
    ShowMessage('O n?mero digitado deve estar entre 1 e 1000.');
    edNumero.SetFocus;
  end;
end;

procedure TfrmPrincipal.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8]) then
    Key := #0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Conversor.Destroy;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Conversor := TConversor.Create();
end;

end.
