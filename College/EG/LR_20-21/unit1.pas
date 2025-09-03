unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SixClick(Sender: TObject);
    procedure OneClick(Sender: TObject);
    procedure TwoClick(Sender: TObject);
    procedure ThreeClick(Sender: TObject);
    procedure ZeroClick(Sender: TObject);
    procedure PointClick(Sender: TObject);
    procedure SqrClick(Sender: TObject);
    procedure OneDivXClick(Sender: TObject);
    procedure EqualClick(Sender: TObject);
    procedure SqrtClick(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure DelLastSimClick(Sender: TObject);
    procedure ClearStrClick(Sender: TObject);
    procedure MinusXClick(Sender: TObject);
    procedure SevenClick(Sender: TObject);
    procedure EightClick(Sender: TObject);
    procedure NineClick(Sender: TObject);
    procedure FourClick(Sender: TObject);
    procedure FiveClick(Sender: TObject);
    procedure CEClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
    errorstate: boolean;
    a, b, c: real;
  znak: string;
implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.SixClick(Sender: TObject);
begin
 if errorstate then Exit;
  Edit1.Text := Edit1.Text + '6';
end;

procedure TForm1.OneClick(Sender: TObject);
begin
  if errorstate then Exit;
  Edit1.Text := Edit1.Text + '1';
end;

procedure TForm1.TwoClick(Sender: TObject);
begin
  if errorstate then Exit;
  Edit1.Text := Edit1.Text + '2';
end;

procedure TForm1.ThreeClick(Sender: TObject);
begin
 if errorstate then Exit;
  Edit1.Text := Edit1.Text + '3';
end;

procedure TForm1.ZeroClick(Sender: TObject);
begin
  if errorstate then Exit;
  Edit1.Text := Edit1.Text + '0';
end;

procedure TForm1.PointClick(Sender: TObject);  //точка
var str: string;
begin
      if errorstate then Exit;
  str := Edit1.Text;
  if (pos(',', str) = 0) and (str <> '') and (str <> '-') then
  Edit1.Text := Edit1.Text + ',';
end;

procedure TForm1.SqrClick(Sender: TObject); //КВАДРАТ
var
  a: Double;
begin
  if errorstate then Exit;
  if (Edit1.Text = '') or (Edit1.Text = '-') then Exit;

  try
    a := StrToFloat(Edit1.Text);  // Преобразуем текст в число
    a := a * a;                  // Вычисляем квадрат
    Edit1.Text := FloatToStr(a); // Выводим результат
  except
    on E: EConvertError do
      ShowMessage('Ошибка: введите число!');
  end;
end;

procedure TForm1.OneDivXClick(Sender: TObject); //1/X
begin
  if errorstate then Exit;
  if (Edit1.Text = '') or (Edit1.Text = '-') then Exit;
  a := strtofloat(Edit1.Text);
  try
  a := 1 / (a);
  Edit1.Text := floattostr(a);
  except
    on E: Exception do begin
      Edit1.Text := 'Ошибка: деление на 0';
      errorstate := True;
    end;
  end;
  a := 0;
end;

procedure TForm1.EqualClick(Sender: TObject); //=
begin
    if errorstate then Exit;
    if znak = '' then Exit;

    if (Edit1.Text = '') or (Edit1.Text = '-') then Exit;

    try
      b := StrToFloat(Edit1.Text);

      case znak of
        '+': a := a + b;
        '-': a := a - b;
        '/':
          begin
            if b = 0 then
              raise EDivByZero.Create('Деление на ноль');
            a := a / b;
          end;
        '*': a := a * b;
      end;

      Edit1.Text := FloatToStr(a);
      znak := '';

    except
      on E: EDivByZero do
      begin
        Edit1.Text := 'Ошибка: деление на 0';
        errorstate := True;
        znak := '';
      end;
      on E: Exception do
      begin
        Edit1.Text := 'Ошибка вычисления';
        errorstate := True;
        znak := '';
      end;
    end;
  end;
procedure TForm1.ClickZnak(Sender: TObject); //+-/*
begin
 if errorstate then Exit;
  if (znak <> '') and (Edit1.Text <> '') and (Edit1.Text <> '-') then
  begin
    // Выполнение предыдущей операции автоматически, если не нажато =

    if errorstate then Exit;
  end;

  if (Edit1.Text = '') or (Edit1.Text = '-') then Exit;

  a := StrToFloat(Edit1.Text);
  Edit1.Clear;
  znak := (Sender as TButton).Caption;
end;

procedure TForm1.DelLastSimClick(Sender: TObject);  //LAST SIM
var
str: string;
begin
 if errorstate then begin
 Edit1.Text := '';
 errorstate := False;
 end;
 str := Edit1.Text;
 if str <> '' then
 delete(str, length(str), 1);
 Edit1.Text := str;
end;
procedure TForm1.CEClick(Sender: TObject);    //CE
begin
  Edit1.Text := '';  // или просто пустую строку ''
end;
procedure TForm1.ClearStrClick(Sender: TObject);  //C
begin
  Edit1.Text := '';
  a := 0;
  b := 0;
  c := 0;
  errorstate := False;
end;
procedure TForm1.SevenClick(Sender: TObject);
begin
       if errorstate then Exit;
  Edit1.Text := Edit1.Text + '7';
end;
procedure TForm1.SqrtClick(Sender: TObject);  // KOREN
begin
  if errorstate then Exit;
  if (Edit1.Text = '') or (Edit1.Text = '-') then Exit;
  a := strtofloat(Edit1.Text);
  try
    a := sqrt(a);
    Edit1.Text := floattostr(a);
  except
    on E: Exception do begin
      Edit1.Text := 'Ошибка: отрицательное число';
      errorstate := True;
    end;
  end;
end;
procedure TForm1.MinusXClick(Sender: TObject);//MINUSPREDECHISLOM
begin
  if errorstate then Exit;
  if Edit1.Text = '' then
  begin
    Edit1.Text := '-';
    Exit;
  end;
  if (Edit1.Text[1] = '-') then
    Exit;
  if (Edit1.Text <> '-') then
    Edit1.Text := '-' + Edit1.Text;
end;
procedure TForm1.EightClick(Sender: TObject);
begin
 if errorstate then Exit;
  Edit1.Text := Edit1.Text + '8';
end;

procedure TForm1.NineClick(Sender: TObject);
begin
   if errorstate then Exit;
  Edit1.Text := Edit1.Text + '9';
end;

procedure TForm1.FourClick(Sender: TObject);
begin
  if errorstate then Exit;
  Edit1.Text := Edit1.Text + '4';
end;

procedure TForm1.FiveClick(Sender: TObject);
begin
    if errorstate then Exit;
  Edit1.Text := Edit1.Text + '5';
end;

end.

