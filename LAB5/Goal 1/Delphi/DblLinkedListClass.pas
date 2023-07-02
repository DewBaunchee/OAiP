unit DblLinkedListClass;

interface

uses classes, Sysutils, ElementClass;

type
    TDblLinkedList = class(TObject)
    private
        Count: Integer;
        Head, Tail: TElement;
    public
        constructor Create;
        procedure Clear;
        procedure Add(Content: String);
        function GetElement(RequiredElementIndex: Integer): TElement;
        procedure Delete(RequiredElementIndex: Integer);
        function GetListForFile(Reversed: Boolean): String;
        function GetCount(): Integer;
    end;

implementation

constructor TDblLinkedList.Create;
begin
    Head := Nil;
    Tail := Nil;
    Count := 0;
end;

procedure TDblLinkedList.Clear;
begin
    Head := Nil;
    Tail := Nil;
    Count := 0;
end;

procedure TDblLinkedList.Add(Content: string);
begin
    if Head = Nil then
    begin
        Head := TElement.Create(Content);
        Tail := Head;
    end
    else
    begin
        Tail.SetNext(TElement.Create(Content));
        Tail.GetNext.SetPrev(Tail);
        Tail := Tail.GetNext();
    end;
    Inc(Count);
end;

function TDblLinkedList.GetElement(RequiredElementIndex: Integer): TElement;
var
    I: Integer;
    Current: TElement;
begin
    Current := Head;
    for I := 2 to RequiredElementIndex do
        Current := Current.GetNext();
    Result := Current;
end;

procedure TDblLinkedList.Delete(RequiredElementIndex: Integer);
var
    Current: TElement;
begin
    if Count = 1 then
    begin
        Head := Nil;
        Tail := Nil;
    end
    else if RequiredElementIndex = 1 then
    begin
        Head := Head.GetNext();
        Head.SetPrev(Nil);
    end
    else if RequiredElementIndex = Count then
    begin
        Tail := Tail.GetPrev();
        Tail.SetNext(Nil);
    end
    else
    begin
        Current := GetElement(RequiredElementIndex);
        Current.GetPrev().SetNext(Current.GetNext());
        Current.GetNext().SetPrev(Current.GetPrev());
    end;
    Dec(Count);
end;

function TDblLinkedList.GetListForFile(Reversed: Boolean): String;
var
    Answer: String;
    Current: TElement;
    I: Integer;
begin
    if Count = 0 then
        Answer := #13#10 + '     {EMPTY LIST}     ' + #13#10
    else if Reversed then
    begin
        Current := Tail;
        for I := Count downto 1 do
        begin
            Answer := Answer + Current.GetContent() + #13#10;
            Current := Current.GetPrev();
        end;
    end
    else
    begin
        Current := Head;
        for I := 1 to Count do
        begin
            Answer := Answer + Current.GetContent() + #13#10;
            Current := Current.GetNext();
        end;
    end;
    GetListForFile := Answer;
end;

function TDblLinkedList.GetCount;
begin
    Result := Count;
end;

end.
