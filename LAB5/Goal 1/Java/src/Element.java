public class Element {

    private String elementContent;
    private Element prev, next;

    public Element (String content) {
        elementContent = content;
    }

    public String getContent () {
        return elementContent;
    }

    public boolean setContent (String content) {
        if (content.length() > 30) {
            System.out.println("Error! Entered element is too big (length > 30).");
            return true;
        } else {
            elementContent = content;
        }
        return false;
    }

    public Element getNext () {
        return next;
    }

    public void setNext (Element nextElement) {
        next = nextElement;
    }

    public Element getPrev () {
        return prev;
    }

    public void setPrev (Element prevELement) {
        prev = prevELement;
    }
}
