program DequeProgram;
uses
  crt;
const
  MAX_SIZE = 10; 
type
  TDeque = record
    Data: array[1..MAX_SIZE] of Integer;
    Front, Rear: Integer;
  end;
procedure InitializeDeque(var Deque: TDeque);
begin
  Deque.Front := 0;
  Deque.Rear := 0;
end;

function IsEmpty(Deque: TDeque): Boolean;
begin
  IsEmpty := (Deque.Front = 0);
end;

function IsFull(Deque: TDeque): Boolean;
begin
  IsFull := (Deque.Rear = MAX_SIZE);
end;

procedure PushFront(var Deque: TDeque; Value: Integer);
begin
  if IsFull(Deque) then
    Writeln('Deque is full')
  else
  begin
    if Deque.Front = 0 then
      Deque.Front := 1;
    Deque.Rear := Deque.Rear + 1;
    Deque.Data[Deque.Rear] := Value;
  end;
end;

procedure PushRear(var Deque: TDeque; Value: Integer);
begin
  if IsFull(Deque) then
    Writeln('Deque is full')
  else
  begin
    if Deque.Front = 0 then
      Deque.Front := 1;
    Deque.Rear := Deque.Rear + 1;
    Deque.Data[Deque.Rear] := Value;
  end;
end;
procedure PopFront(var Deque: TDeque);
begin
  if IsEmpty(Deque) then
    Writeln('Deque is empty')
  else
  begin
    Writeln('Popped from front: ', Deque.Data[Deque.Front]);
    if Deque.Front = Deque.Rear then
    begin
      Deque.Front := 0;
      Deque.Rear := 0;
    end
    else
      Deque.Front := Deque.Front + 1;
  end;
end;

procedure PopRear(var Deque: TDeque);
begin
  if IsEmpty(Deque) then
    Writeln('Deque is empty')
  else
  begin
    Writeln('Popped from rear: ', Deque.Data[Deque.Rear]);
    if Deque.Front = Deque.Rear then
    begin
      Deque.Front := 0;
      Deque.Rear := 0;
    end
    else
      Deque.Rear := Deque.Rear - 1;
  end;
end;

procedure DisplayDeque(Deque: TDeque);
var
  i: Integer;
begin
  if IsEmpty(Deque) then
    Writeln('Deque is empty')
  else
  begin
    Writeln('Deque contents:');
    for i := Deque.Front to Deque.Rear do
      Write(Deque.Data[i], ' ');
    Writeln;
  end;
end;

var
  Deque: TDeque;
  Choice, Value: Integer;

begin
  InitializeDeque(Deque);
  repeat
    ClrScr; 
    TextColor(White); 
    Writeln('1. Push to Front');
    Writeln('2. Push to Rear');
    Writeln('3. Pop from Front');
    Writeln('4. Pop from Rear');
    Writeln('5. Display Deque');
    Writeln('6. Exit');
    Write('Enter your choice: ');
    Readln(Choice);
    case Choice of
      1: begin
           Write('Enter value to push to front: ');
           Readln(Value);
           PushFront(Deque, Value);
         end;
      2: begin
           Write('Enter value to push to rear: ');
           Readln(Value);
           PushRear(Deque, Value);
         end;
      3: PopFront(Deque);
      4: PopRear(Deque);
      5: DisplayDeque(Deque);
      6: Writeln('Exiting...');
    else
      Writeln('Invalid choice');
    end;
    Write('Press any key to continue...');
    ReadKey; 
  until Choice = 6;
end.