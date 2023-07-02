unit ElementClass;

interface

uses classes, Sysutils;

type
    TElement = class(TObject)
    private
        Content: String;
        Prev, Next: TElement;
    public
        constructor Create(ElementContent: String);
        procedure SetContent(ElementContent: String);
        function GetContent(): String;
        procedure SetNext(Element: TElement);
        function GetNext(): TElement;
        procedure SetPrev(Element: TElement);
        function GetPrev(): TElement;
    end;

implementation

constructor TElement.Create(ElementContent: String);
begin
    Content := ElementContent;
    Prev := Nil;
    Next := Nil;
end;

procedure TElement.SetContent(ElementContent: String);
begin
    Content := ElementContent;
end;

function TElement.GetContent;
begin
    Result := Content;
end;

procedure TElement.SetNext(Element: TElement);
begin
    Next := Element;
end;

function TElement.GetNext;
begin
    Result := Next;
end;

procedure TElement.SetPrev(Element: TElement);
begin
    Prev := Element;
end;

function TElement.GetPrev;
begin
    Result := Prev;
end;

end.
