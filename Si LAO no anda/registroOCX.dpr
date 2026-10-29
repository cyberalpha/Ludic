program registroOCX;

uses
  Forms,
  UnidadMenuPrincipal in 'UnidadMenuPrincipal.pas' {formMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'AjpdSoft Registro de OCX y DLL';
  Application.CreateForm(TformMenuPrincipal, formMenuPrincipal);
  Application.Run;
end.
