unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls, ComCtrls, DateUtils, Unit2;

type
  TRole = (rDuelist, rController, rSentinel, rInitiator);

  TAbility = record
    Name: string[30];
    Cost: Integer;
    Cooldown: Integer;
    IsSignature: Boolean;
  end;

  TAgentStats = record
    WinRate: Double;
    PickRate: Double;
    KDA: Double;
  end;

  TAgent = record
    Name: string[50];
    Role: TRole;
    Origin: string[30];
    ReleaseDate: TDate;
    Ultimate: TAbility;
    Stats: TAgentStats;
    IsUnlocked: Boolean;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    btnAdd: TButton;
    btnDelete: TButton;
    btnEdit: TButton;
    btnSortName: TButton;
    btnSortRole: TButton;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSortNameClick(Sender: TObject);
    procedure btnSortRoleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    function RoleToString(Role: TRole): string;
    function StringToRole(Str: string): TRole;
    procedure LoadAgents;
    procedure SaveAgent;
    procedure SortAgents(ByName: Boolean);
  public
  end;

var
  Form1: TForm1;
  AgentsFile: file of TAgent;
  CurrentAgent: TAgent;
  FileName: string = 'agents.dat';

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Настройка таблицы
  StringGrid1.ColCount := 9;
  StringGrid1.Cells[0, 0] := 'Имя';
  StringGrid1.Cells[1, 0] := 'Роль';
  StringGrid1.Cells[2, 0] := 'Страна';
  StringGrid1.Cells[3, 0] := 'Дата';
  StringGrid1.Cells[4, 0] := 'Ультимка';
  StringGrid1.Cells[5, 0] := 'WinRate';
  StringGrid1.Cells[6, 0] := 'PickRate';
  StringGrid1.Cells[7, 0] := 'KDA';
  StringGrid1.Cells[8, 0] := 'Доступен';

  LoadAgents;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.btnAddClick(Sender: TObject);
var
  EditForm: TfrmEditAgent;
begin
  EditForm := TfrmEditAgent.Create(nil);
  try
    EditForm.Caption := 'Добавить агента';
    if EditForm.ShowModal = mrOk then
    begin
      CurrentAgent.Name := EditForm.edtName.Text;
      CurrentAgent.Role := StringToRole(EditForm.cmbRole.Text);
      CurrentAgent.Origin := EditForm.edtOrigin.Text;
      CurrentAgent.Ultimate.Name := EditForm.edtUltimateName.Text;
      CurrentAgent.Ultimate.Cost := StrToIntDef(EditForm.edtUltimateCost.Text, 0);
      CurrentAgent.Stats.WinRate := StrToFloatDef(EditForm.edtWinRate.Text, 0);
      CurrentAgent.Stats.PickRate := StrToFloatDef(EditForm.edtPickRate.Text, 0);
      CurrentAgent.Stats.KDA := StrToFloatDef(EditForm.edtKDA.Text, 0);
      CurrentAgent.IsUnlocked := EditForm.cbUnlocked.Checked;

      SaveAgent;
      LoadAgents;
    end;
  finally
    EditForm.Free;
  end;
end;

procedure TForm1.btnEditClick(Sender: TObject);
var
  EditForm: TfrmEditAgent;
begin
  if StringGrid1.Row > 0 then
  begin
    EditForm := TfrmEditAgent.Create(nil);
    try
      EditForm.edtName.Text := StringGrid1.Cells[0, StringGrid1.Row];
      EditForm.cmbRole.Text := StringGrid1.Cells[1, StringGrid1.Row];
      EditForm.edtUltimateName.Text := StringGrid1.Cells[4, StringGrid1.Row];
      EditForm.edtWinRate.Text := StringGrid1.Cells[5, StringGrid1.Row];
      EditForm.edtPickRate.Text := StringGrid1.Cells[6, StringGrid1.Row];
      EditForm.edtKDA.Text := StringGrid1.Cells[7, StringGrid1.Row];
      EditForm.cbUnlocked.Checked := StringGrid1.Cells[8, StringGrid1.Row] = 'Да';

      if EditForm.ShowModal = mrOk then
      begin
        // Обновление данных
        CurrentAgent.Name := EditForm.edtName.Text;
        CurrentAgent.Role := StringToRole(EditForm.cmbRole.Text);
        CurrentAgent.Origin := EditForm.edtOrigin.Text;
        CurrentAgent.Ultimate.Name := EditForm.edtUltimateName.Text;
        CurrentAgent.Ultimate.Cost := StrToIntDef(EditForm.edtUltimateCost.Text, 0);
        CurrentAgent.Stats.WinRate := StrToFloatDef(EditForm.edtWinRate.Text, 0);
        CurrentAgent.Stats.PickRate := StrToFloatDef(EditForm.edtPickRate.Text, 0);
        CurrentAgent.Stats.KDA := StrToFloatDef(EditForm.edtKDA.Text, 0);
        CurrentAgent.IsUnlocked := EditForm.cbUnlocked.Checked;

        SaveAgent;
        LoadAgents;
      end;
    finally
      EditForm.Free;
    end;
  end;
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
var
  i: Integer;
  TempFile: file of TAgent;
begin
  if StringGrid1.Row > 0 then
  begin
    if MessageDlg('Удалить агента?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      AssignFile(TempFile, 'temp.dat');
      Rewrite(TempFile);

      AssignFile(AgentsFile, FileName);
      Reset(AgentsFile);

      for i := 0 to FileSize(AgentsFile) - 1 do
      begin
        Read(AgentsFile, CurrentAgent);
        if i <> StringGrid1.Row - 1 then
          Write(TempFile, CurrentAgent);
      end;

      CloseFile(AgentsFile);
      CloseFile(TempFile);

      DeleteFile(FileName);
      RenameFile('temp.dat', FileName);

      LoadAgents;
    end;
  end;
end;

procedure TForm1.LoadAgents;
var
  i: Integer;
begin
  StringGrid1.RowCount := 1;

  if FileExists(FileName) then
  begin
    AssignFile(AgentsFile, FileName);
    try
      Reset(AgentsFile);
      StringGrid1.RowCount := FileSize(AgentsFile) + 1;

      for i := 0 to FileSize(AgentsFile) - 1 do
      begin
        Read(AgentsFile, CurrentAgent);
        StringGrid1.Cells[0, i+1] := CurrentAgent.Name;
        StringGrid1.Cells[1, i+1] := RoleToString(CurrentAgent.Role);
        StringGrid1.Cells[2, i+1] := CurrentAgent.Origin;
        StringGrid1.Cells[3, i+1] := DateToStr(CurrentAgent.ReleaseDate);
        StringGrid1.Cells[4, i+1] := CurrentAgent.Ultimate.Name;
        StringGrid1.Cells[5, i+1] := FormatFloat('0.00', CurrentAgent.Stats.WinRate);
        StringGrid1.Cells[6, i+1] := FormatFloat('0.00', CurrentAgent.Stats.PickRate);
        StringGrid1.Cells[7, i+1] := FormatFloat('0.00', CurrentAgent.Stats.KDA);
        StringGrid1.Cells[8, i+1] := BoolToStr(CurrentAgent.IsUnlocked, 'Да', 'Нет');
      end;
    finally
      CloseFile(AgentsFile);
    end;
  end;
end;

procedure TForm1.SaveAgent;
begin
  AssignFile(AgentsFile, FileName);
  try
    if FileExists(FileName) then
      Reset(AgentsFile)
    else
      Rewrite(AgentsFile);

    Seek(AgentsFile, FileSize(AgentsFile));
    Write(AgentsFile, CurrentAgent);
  finally
    CloseFile(AgentsFile);
  end;
end;

procedure TForm1.SortAgents(ByName: Boolean);
var
  i, j: Integer;
  TempAgent: TAgent;
  AgentList: array of TAgent;
begin
  if not FileExists(FileName) then Exit;

  AssignFile(AgentsFile, FileName);
  try
    Reset(AgentsFile);
    SetLength(AgentList, FileSize(AgentsFile));

    for i := 0 to High(AgentList) do
      Read(AgentsFile, AgentList[i]);

    // Сортировка пузырьком
    for i := 0 to High(AgentList) - 1 do
      for j := i + 1 to High(AgentList) do
        if (ByName and (AgentList[i].Name > AgentList[j].Name)) or
           (not ByName and (AgentList[i].Role > AgentList[j].Role)) then
        begin
          TempAgent := AgentList[i];
          AgentList[i] := AgentList[j];
          AgentList[j] := TempAgent;
        end;

    // Перезапись файла
    Rewrite(AgentsFile);
    for i := 0 to High(AgentList) do
      Write(AgentsFile, AgentList[i]);
  finally
    CloseFile(AgentsFile);
    LoadAgents;
  end;
end;

function TForm1.RoleToString(Role: TRole): string;
begin
  case Role of
    rDuelist: Result := 'Duelist';
    rController: Result := 'Controller';
    rSentinel: Result := 'Sentinel';
    rInitiator: Result := 'Initiator';
  end;
end;

function TForm1.StringToRole(Str: string): TRole;
begin
  if Str = 'Duelist' then Result := rDuelist
  else if Str = 'Controller' then Result := rController
  else if Str = 'Sentinel' then Result := rSentinel
  else Result := rInitiator;
end;

procedure TForm1.btnSortNameClick(Sender: TObject);
begin
  SortAgents(True);
end;

procedure TForm1.btnSortRoleClick(Sender: TObject);
begin
  SortAgents(False);
end;

end.
