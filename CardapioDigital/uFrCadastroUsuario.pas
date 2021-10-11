unit uFrCadastroUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame,uniScreenMask,
  uniGUIBaseClasses, uniImageList, uniPanel, uniButton, uniBitBtn,
  Vcl.Imaging.jpeg, uniImage, uniMultiItem, uniComboBox, uniScrollBox,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniLabel, uniEdit,
  uniPageControl, Data.DB, UniFSButton, Vcl.Imaging.pngimage, uniFileUpload,
  uniSweetAlert;

type
  TfrCadastroUsuario = class(TUniFrame)
    DataSourceUsuario: TDataSource;
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    Tab2: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniScrollBox2: TUniScrollBox;
    UniPanel3: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel5: TUniLabel;
    UniNome: TUniEdit;
    UniLogin: TUniEdit;
    UniEmail: TUniEdit;
    UniSenha: TUniEdit;
    UniComboBox1: TUniComboBox;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    UniNativeImageList1: TUniNativeImageList;
    UniScreenMask1: TUniScreenMask;
    UniSweetAlert1: TUniSweetAlert;
    BtCan: TUniFSButton;
    BtGrv: TUniFSButton;
    BtExc: TUniFSButton;
    BtInc: TUniFSButton;
    BtAlt: TUniFSButton;
    EdPesquisar: TUniEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure EdPesquisarChange(Sender: TObject);
    procedure BtAltxClick(Sender: TObject);
    procedure BtIncxClick(Sender: TObject);
    procedure BtExcxClick(Sender: TObject);
    procedure BtCanxClick(Sender: TObject);
    procedure BtGrvxClick(Sender: TObject);
  private
     xIncluindo, xDeletando, xEditando, xSoAlerta : Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDados;



procedure TfrCadastroUsuario.BtAltxClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := True;
  xDeletando := False;

  UniComboBox1.SetFocus;

// Visualizando a Tab2
  PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := False ;
  PageCadastro.Pages[1].TabVisible := True ;

 // Visualizando Botao do Crud
  BtInc.Enabled := False;
  BtAlt.Enabled := False;
  BtExc.Enabled := False;
  BtGrv.Enabled := True;
  BtCan.Enabled := True;
  uniNome.Text := dmDados.QueryUsuarioNOME.Value;
  uniEmail.Text := dmDados.QueryUsuarioEMAIL.Value;
  uniLogin.Text := dmDados.QueryUsuarioLOGIN.Value;
  uniSenha.Text := dmDados.QueryUsuarioSENHA.Value;
  uniComboBox1.Text := dmDados.QueryUsuarioPERFIL.Value;
end;

procedure TfrCadastroUsuario.BtCanxClick(Sender: TObject);
begin
  EdPesquisar.Visible := True;
  //  dmDados.RDWFDQueryUsuario.Cancel;
  PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := True ;
  PageCadastro.Pages[1].TabVisible := False ;

  // Visualizando Botao do Crud
  BtInc.Enabled := True;
  BtAlt.Enabled := True;
  BtExc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  EdPesquisar.Clear;
  dmDados.QueryUsuario.Close();
  dmDados.QueryUsuario.Open();
  btAlt.Enabled := dmDados.QueryUsuario.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  btExc.Enabled :=  dmDados.QueryUsuario.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
end;

procedure TfrCadastroUsuario.BtExcxClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  //  Confirmacao da exclusao com SweetAlert1
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := True;

  UniSweetAlert1.Title := 'Deseja excluir esse Usuario';
  UniSweetAlert1.AlertType := atError;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'N�o';
  UniSweetAlert1.Show(dmDados.QueryUsuarioNOME.Value);

end;

procedure TfrCadastroUsuario.BtGrvxClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  //  usando  SweetAlert1
  if UniComboBox1.Text = '' then
  begin
    xSoAlerta := True;   // bloqueia alerta
    UniSweetAlert1.Title := ('Perfil Obrigat�rio');
    UniSweetAlert1.AlertType := atInfo;
    UniSweetAlert1.ShowConfirmButton := False;
    UniSweetAlert1.ShowCancelButton := True;
    UniSweetAlert1.CancelButtonText := 'Ok';
    UniSweetAlert1.Show('selecione o Perfil');
    exit;
  end;

    //  usando  SweetAlert1
  if UniNome.Text = '' then
  begin
    xSoAlerta := True; // Bloqueia o alerta
    UniSweetAlert1.Title := ('Nome Obrigat�rio');
    UniSweetAlert1.AlertType := atInfo;
    UniSweetAlert1.ShowConfirmButton := False;
    UniSweetAlert1.ShowCancelButton := True ;
    UniSweetAlert1.CancelButtonText := 'Ok';
    UniSweetAlert1.Show('Digite seu Nome');
    exit;
  end;

  //  Salvando com SweetAlert1
  xSoAlerta := False;
  UniSweetAlert1.Title := 'Deseja salvar esse Usuario ?';
  UniSweetAlert1.AlertType := atQuestion;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'N�o';
  UniSweetAlert1.Show( UniNome.Text );

  BtInc.Enabled := True;
  BtAlt.Enabled := True;
  BtExc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := True ;
  PageCadastro.Pages[1].TabVisible := False ;

end;

procedure TfrCadastroUsuario.BtIncxClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  xSoAlerta := False;
  xIncluindo := True;
  xEditando := False;
  xDeletando := False;
  //UniDBComboBox1v:= 0;
  PageCadastro.ActivePage := Tab2 ;
  // Visualizando a Tab2
  PageCadastro.Pages[0].TabVisible := False ;
  PageCadastro.Pages[1].TabVisible := Visible ;
  // Visualizando Botao do Crud
  BtInc.Enabled := False;
  BtAlt.Enabled := False;
  BtExc.Enabled := False;
  BtGrv.Enabled := True;
  BtCan.Enabled := True;
  UniComboBox1.SetFocus;

  UniComboBox1.ItemIndex := 0;
  EdPesquisar.Clear;
  uniNome.Clear;
  uniEmail.Clear;
  uniLogin.Clear;
  uniSenha.Clear;
end;

procedure TfrCadastroUsuario.EdPesquisarChange(Sender: TObject);
begin
 // pesquisa dinamica na tabela Usuario
  dmDados.QueryUsuario.SQL.Clear;
  dmDados.QueryUsuario.SQL.Add('select * from USUARIO where');
  dmDados.QueryUsuario.SQL.Add('(NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryUsuario.SQL.Add('or LOGIN LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryUsuario.SQL.Add(')order by NOME');
  dmDados.QueryUsuario.Open;
end;

procedure TfrCadastroUsuario.UniFrameCreate(Sender: TObject);
begin
  dmDados.QueryUsuario.Open;
  btAlt.Enabled := dmDados.QueryUsuario.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  btExc.Enabled := dmDados.QueryUsuario.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  PageCadastro.Pages[0].TabVisible := True  ;
  PageCadastro.Pages[1].TabVisible := False ;
  BtInc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
end;

procedure TfrCadastroUsuario.UniSweetAlert1Confirm(Sender: TObject);
  var xErro,vxUsuario, vexUsuario : String;
begin
   if xSoAlerta = True then exit;

   if xIncluindo then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('insert into USUARIO values (NULL, :vNOME, :vEMAIL, :vLOGIN, :vSENHA, :vPERFIL)');
     dmDados.QueryAuxiliar.Params[0].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
     dmDados.QueryAuxiliar.Params[4].DataType := ftString;

     dmDados.QueryAuxiliar.Params[0].Value := uniNome.Text;
     dmDados.QueryAuxiliar.Params[1].Value := uniEmail.Text;
     dmDados.QueryAuxiliar.Params[2].Value := uniLogin.Text;
     dmDados.QueryAuxiliar.Params[3].Value := uniSenha.Text;
     dmDados.QueryAuxiliar.Params[4].Value := uniComboBox1.Text;

     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryUsuario.Close();
     dmDados.QueryUsuario.Open();
     xIncluindo := False;

//     MainForm.RegistraLog('INCLUS�O', 'INCLUS�O DO USU�RIO: '+UniNome.Text);    log

   end;
   if xEditando then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('update USUARIO set NOME=:vNOME, EMAIL=:vEMAIL, LOGIN=:vLOGIN, SENHA=:vSENHA, PERFIL=:vPERFIL where ID=:vID');
     dmDados.QueryAuxiliar.Params[0].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
     dmDados.QueryAuxiliar.Params[4].DataType := ftString;
     dmDados.QueryAuxiliar.Params[5].DataType := ftInteger;

     dmDados.QueryAuxiliar.Params[0].Value := uniNome.Text;
     dmDados.QueryAuxiliar.Params[1].Value := uniEmail.Text;
     dmDados.QueryAuxiliar.Params[2].Value := uniLogin.Text;
     dmDados.QueryAuxiliar.Params[3].Value := uniSenha.Text;
     dmDados.QueryAuxiliar.Params[4].Value := uniComboBox1.Text;
     dmDados.QueryAuxiliar.Params[5].Value := dmDados.QueryUsuarioID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryUsuario.Close();
     dmDados.QueryUsuario.Open();
     xEditando := False;
   end;
   if xDeletando then
   begin
     vexUsuario := dmDados.QueryUsuarioNOME.value;

     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('delete from USUARIO where ID=:vID');
     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value :=  dmDados.QueryUsuarioID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );

     dmDados.QueryUsuario.Close();
     dmDados.QueryUsuario.Open();
     xDeletando := False;

//     MainForm.RegistraLog('EXCLUS�O', 'EXCLU�DO DO USU�RIO: '+vexUsuario);   log
   end;

end;

procedure TfrCadastroUsuario.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;

end;

end.
