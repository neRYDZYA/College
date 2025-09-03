unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls,DateTimePicker;

type
  { TfrmEditAgent }

  TfrmEditAgent = class(TForm)
    btnCancel: TButton;
    btnSave: TButton;
    cbUnlocked: TCheckBox;
    cmbRole: TComboBox;
    dtpRelease: TDateTimePicker;
    edtWinRate: TEdit;
    edtName: TEdit;
    edtOrigin: TEdit;
    edtKDA: TEdit;
    edtPickRate: TEdit;
    edtUltimateCost: TEdit;
    edtUltimateName: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmEditAgent: TfrmEditAgent;

implementation

{$R *.lfm}

{ TfrmEditAgent }

procedure TfrmEditAgent.FormCreate(Sender: TObject);
begin
  cmbRole.Items.Add('Duelist');
  cmbRole.Items.Add('Controller');
  cmbRole.Items.Add('Sentinel');
  cmbRole.Items.Add('Initiator');
  dtpRelease.Date := Now();
end;

procedure TfrmEditAgent.btnSaveClick(Sender: TObject);
begin
  if edtName.Text = '' then
  begin
    ShowMessage('Введите имя агента!');
    edtName.SetFocus;
    Exit;
  end;

  if cmbRole.ItemIndex = -1 then
  begin
    ShowMessage('Выберите роль агента!');
    cmbRole.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmEditAgent.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
