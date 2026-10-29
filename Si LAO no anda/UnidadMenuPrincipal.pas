unit UnidadMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ComCtrls;

type
  TformMenuPrincipal = class(TForm)
    dlAbrir: TOpenDialog;
    LWEB: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    txtFichero: TMemo;
    bSel: TButton;
    bRegistrar: TButton;
    bp: TProgressBar;
    TabSheet2: TTabSheet;
    txtResultado: TMemo;
    procedure bSelClick(Sender: TObject);
    procedure bRegistrarClick(Sender: TObject);
    procedure registrarOCX (fichero : string);
    procedure LWEBClick(Sender: TObject);
  private
    { Private declarations }
    registrados, noRegistrados : integer;
  public
    { Public declarations }
  end;

var
  formMenuPrincipal: TformMenuPrincipal;

implementation

{$R *.dfm}

function ExecAndWait(const ExecuteFile, ParamString : string): boolean;
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile);
    lpParameters := PChar(ParamString);
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@SEInfo) then
  begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result:=True;
  end
  else Result:=False;
end;


procedure TformMenuPrincipal.registrarOCX (fichero : string);
type
  TRegFunc = function : HResult; stdcall;
var
  ARegFunc : TRegFunc;
  aHandle  : THandle;
begin
  try
    aHandle := LoadLibrary(PChar(fichero));
    if aHandle <> 0 then
    begin
      ARegFunc := GetProcAddress(aHandle,'DllRegisterServer');
      if Assigned(ARegFunc) then
      begin
        ExecAndWait('regsvr32','/s ' + fichero);
      end;
      FreeLibrary(aHandle);
    end;
    txtResultado.Lines.Add (Format('%s -> Registrado.', [fichero]));
    registrados := registrados + 1;    
  except
    noRegistrados := noRegistrados + 1;
    txtResultado.Lines.Add (Format('%s -> Error al registrar', [fichero]));
  end;
end;

procedure TformMenuPrincipal.bSelClick(Sender: TObject);
var
  i : integer;
begin
  if dlAbrir.Execute then
  begin
    for i := 0 to dlAbrir.Files.Count - 1 do
      txtFichero.Lines.Add (dlAbrir.Files[i]);
    bRegistrar.SetFocus;
  end;
end;

procedure TformMenuPrincipal.bRegistrarClick(Sender: TObject);
var
  i : integer;
begin
  Screen.Cursor := crHourGlass;
  registrados := 0;
  noRegistrados := 0;
  txtResultado.clear;
  bp.Visible := true;
  bp.Min := 0;
  bp.Max := txtFichero.Lines.Count;
  for i := 0 to txtFichero.Lines.Count do
  begin
    bp.Position := i;
    bp.Refresh;
    if txtFichero.Lines[i] <> '' then
    begin
      if FileExists(txtFichero.Lines[i]) then
        registrarOCX(txtFichero.Lines[i])
      else
      begin
        txtResultado.Lines.Add (txtFichero.Lines[i] + ' -> No existe.');
        noRegistrados := noRegistrados + 1;
      end;
    end;
  end;
  bp.Visible := false;
  Screen.Cursor := crDefault;
  MessageDlg('El proceso de registro ha finalizado con el siguiente resultado: ' +
      chr(13) + chr(13) +
      ' · Registrados: ' + inttostr (registrados) + chr(13) +
      ' · No registrados: ' + inttostr (noRegistrados),
      mtInformation, [mbok], 0);
  TabSheet2.Show;
end;

procedure TformMenuPrincipal.LWEBClick(Sender: TObject);
begin
  ShellExecute(Handle, Nil, PChar('http://www.ajpdsoft.com'),
      Nil, Nil, SW_SHOWNORMAL);
end;

end.
