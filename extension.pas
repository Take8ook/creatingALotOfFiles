unit Extension;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Amount;

type

    { TFormExtension }

    TFormExtension = class(TForm)
        ButtonOK: TButton;
        EditExtensionOfFiles: TEdit;
        LabelTitle: TLabel;
        procedure ButtonOKClick(Sender: TObject);
    private

    public

    end;

var
    FormExtension: TFormExtension;

implementation

{$R *.lfm}

{ TFormExtension }

procedure TFormExtension.ButtonOKClick(Sender: TObject);
var
    newFile: TextFile;
    extensionStr: String;
    dirStr: String;
    amountOfFiles: Integer;
    i: Integer;
begin
    extensionStr := EditExtensionOfFiles.Text;
    dirStr := 'files';
    try
        amountOfFiles := strToInt(FormAmount.EditAmountOfFiles.Text);
        FormAmount.EditAmountOfFiles.Text := '';
        if not DirectoryExists(dirStr) then
            CreateDir(dirStr);
        if not DirectoryExists(dirStr + '/' + extensionStr) then
            CreateDir(dirStr + '/' + extensionStr);
        for i := 1 to amountOfFiles do
        begin
            AssignFile(newFile, dirStr + '/' + extensionStr +  '/' + intToStr(i) + '.' + extensionStr);
            ReWrite(newFile);
            CloseFile(newFile);
        end;
        ShowMessage('Файлы с расширением "' + extensionStr + '" созданы в папке "' + dirStr + '/' + extensionStr +'/"');
        FormExtension.Close;
    except on E : Exception do
        ShowMessage('Видимо, вы ввели расширение неправильно. Попробуйте ещё раз.');
    end;
end;

end.

