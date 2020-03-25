unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


//------ Código responsável por identificar e mostrar a senha oculta ------
procedure TForm1.Timer1Timer(Sender: TObject);
var
  //Variável que irá receber a posição do cursor do mouse
  Pos: TPoint;
  //Variável que irá receber a senha oculta
  Paswd: array[0..63] of Char;
  HWin: Cardinal;
begin

  //Pega a posição do cursor na tela
  GetCursorPos(Pos);
  //Pega o Handle da Janela sobre a qual o cursor está localizado
  HWin := WindowFromPoint(Pos);

  //Verifica se há senha oculta
  if SendMessage(HWin, EM_GETPASSWORDCHAR, 0, 0) <> 0 then
  begin

    //Descobre a senha oculta
    SendMessage(HWin, WM_GETTEXT, 64, Longint(@Paswd));
    //Mostra a senha no Editbox
    edit1.Text:=Paswd;

  end;

end;

end.
