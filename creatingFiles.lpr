program creatingFiles;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces,
    Forms,
    Amount,
    Extension
    ;

{$R *.res}

begin
    RequireDerivedFormResource:=True;
    Application.Scaled:=True;
    Application.Initialize;
    Application.CreateForm(TFormAmount, FormAmount);   
    Application.CreateForm(TFormExtension, FormExtension);
    Application.Run;
end.

