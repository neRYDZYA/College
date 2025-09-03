unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
  TMaterial = record
    Name: string;
    Density: Double; // плотность в кг/м³
  end;

  { TForm1 }

  TForm1 = class(TForm)
    ButtonCalculate: TButton;
    ComboBoxMaterials: TComboBox;
    EditLength: TEdit;
    EditWidth: TEdit;
    EditHeight: TEdit;
    Image1: TImage;
    Label1: TLabel;
    LabelResult: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ButtonCalculateClick(Sender: TObject);
    procedure EditWidthChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    Materials: array of TMaterial;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer; // Объявляем переменную цикла отдельно
begin
  // Инициализация списка материалов
  SetLength(Materials, 11);

  Materials[0].Name := 'Алюминий';
  Materials[0].Density := 2700;

  Materials[1].Name := 'Железо';
  Materials[1].Density := 7870;

  Materials[2].Name := 'Медь';
  Materials[2].Density := 8960;

  Materials[3].Name := 'Свинец';
  Materials[3].Density := 11340;

  Materials[4].Name := 'Дерево (сосна)';
  Materials[4].Density := 500;

  Materials[5].Name := 'Золото';
  Materials[5].Density := 19320;

  Materials[6].Name := 'Серебро';
  Materials[6].Density := 10500;

  Materials[7].Name := 'Платина';
  Materials[7].Density := 21450;

  Materials[8].Name := 'Титан';
  Materials[8].Density := 4500;

  Materials[9].Name := 'Полиэтилен';
  Materials[9].Density := 950;

  Materials[10].Name := 'Криптонит';
  Materials[10].Density := 17812;

  // Заполнение ComboBox
  ComboBoxMaterials.Items.Clear;
  for i := 0 to High(Materials) do
    ComboBoxMaterials.Items.Add(Materials[i].Name);
  ComboBoxMaterials.ItemIndex := 0;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.ButtonCalculateClick(Sender: TObject);
var
  fLength, fWidth, fHeight, Volume, Mass: Double;
  MaterialIndex: Integer;
begin
  try
    // Проверка на пустые поля ввода
    if Trim(EditLength.Text) = '' then
      raise Exception.Create('Введите длину бруска!');

    if Trim(EditWidth.Text) = '' then
      raise Exception.Create('Введите ширину бруска!');

    if Trim(EditHeight.Text) = '' then
      raise Exception.Create('Введите высоту бруска!');

    // Получение размеров из полей ввода
    fLength := StrToFloat(EditLength.Text);
    fWidth := StrToFloat(EditWidth.Text);
    fHeight := StrToFloat(EditHeight.Text);

    // Проверка на положительные значения
    if fLength <= 0 then
      raise Exception.Create('Длина должна быть положительной!');

    if fWidth <= 0 then
      raise Exception.Create('Ширина должна быть положительной!');

    if fHeight <= 0 then
      raise Exception.Create('Высота должна быть положительной!');

    // Расчет объема
    Volume := fLength * fWidth * fHeight;

    // Получение выбранного материала
    MaterialIndex := ComboBoxMaterials.ItemIndex;
    if MaterialIndex = -1 then
      raise Exception.Create('Выберите материал из списка!');

    // Расчет массы
    Mass := Volume * Materials[MaterialIndex].Density;

    // Вывод результата
    LabelResult.Caption := Format('Масса бруска: %.2f кг', [Mass]);
    LabelResult.Font.Color := clGreen;

  except
    on E: Exception do
    begin
      LabelResult.Caption := 'Ошибка: ' + E.Message;
      LabelResult.Font.Color := clRed;
    end;
  end;
end;

procedure TForm1.EditWidthChange(Sender: TObject);
begin

end;

end.

