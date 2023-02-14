unit Amount;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

    { TFormAmount }

    TFormAmount = class(TForm)
        ButtonOK: TButton;
        EditAmountOfFiles: TEdit;
        LabelTitle: TLabel;
        procedure ButtonOKClick(Sender: TObject);
    private

    public

    end;

var
    FormAmount: TFormAmount;

implementation uses Extension;

{$R *.lfm}

{ TFormAmount }

procedure TFormAmount.ButtonOKClick(Sender: TObject);
var
    n: Integer;
begin
    try
        n := strToInt(EditAmountOfFiles.Text);
        if n > 1 then
        begin        
            //ShowMessage('Вы ввели ' + intToStr(n));
            FormExtension.ShowModal;
        end
        else
        begin
            ShowMessage('Введите число, больше чем 1');
        end;
    except on E : Exception do
        ShowMessage('Видимо, вы ввели число неправильно. Попробуйте ещё раз.');
    end;
end;

end.

