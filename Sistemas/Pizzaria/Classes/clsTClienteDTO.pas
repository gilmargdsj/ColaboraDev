unit clsTClienteDTO;

interface

type
  TClienteDTO = class
  private
    FID: Integer;
    FLogin: String;
    FSenha: String;
    FEmail: String;
    FNome: String;
  published
    property ID: Integer read FID write FID;
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
    property Email: String read FEmail write FEmail;
    property Nome: String read FNome write FNome;
  end;

implementation

end.
