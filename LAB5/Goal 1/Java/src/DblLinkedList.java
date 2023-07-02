public class DblLinkedList {

    private Element begin, end;
    private int count;

    public DblLinkedList() {
        begin = null;
        end = null;
        count = 0;
    }

    public void clear() {
        begin = null;
        end = null;
        count = 0;
    }

    public boolean add(String content) {
        if (count == 30) {
            System.out.println("Error! Maximum number of elements (30).");
            return true;
        } else {
            if (content.length() > 30) {
                System.out.println("Error! Entered element is too big (length > 30).");
                return true;
            } else {
                if (begin == null) {
                    begin = new Element(content);
                    begin.setPrev(null);
                    begin.setNext(null);
                    end = begin;
                } else {
                    end.setNext(new Element(content));
                    end.getNext().setPrev(end);
                    end = end.getNext();
                    end.setNext(null);
                }
            }
        }
        count++;
        return false;
    }

    public Element getElement(int requiredElementIndex) {
        if (requiredElementIndex > count || requiredElementIndex < 1) {
            System.out.println("Entered index is out of bounds.");
            return null;
        } else {
            Element current = begin;
            for (int i = 1; i < requiredElementIndex; i++) {
                current = current.getNext();
            }
            return current;
        }
    }

    public boolean delete(int requiredElementIndex) {
        Element current = getElement(requiredElementIndex);
        if (current == null) {
            System.out.println("Entered index is out of bounds.");
            return true;
        } else {
            if (count == 1) {
                begin = null;
                end = null;
            } else {
                if (requiredElementIndex == 1) {
                    begin = begin.getNext();
                    begin.setPrev(null);
                } else {
                    if (requiredElementIndex == count) {
                        end = end.getPrev();
                        end.setNext(null);
                    } else {
                        current.getPrev().setNext(current.getNext());
                        current.getNext().setPrev(current.getPrev());
                    }
                }
            }
        }
        count--;
        return false;
    }

    public String getList(boolean reversed) {
        String answer = "";
        Element current;
        if (count == 0) {
            return "\n      {EMPTY LIST}      \n";
        }
        if (reversed) {
            current = end;
            for (int i = count; i > 0; i--) {
                answer = answer + i + ". " + current.getContent() + ".\n";
                current = current.getPrev();
            }
        } else {
            current = begin;
            for (int i = 0; i < count; i++) {
                answer = answer + (i + 1) + ". " + current.getContent() + ".\n";
                current = current.getNext();
            }
        }
        return answer;
    }

    public String getListForFile(boolean reversed) {
        String answer = "";
        Element current;

        if (reversed) {
            current = end;
            for (int i = count; i > 0; i--) {
                answer = answer + current.getContent() + "\n";
                current = current.getPrev();
            }
        } else {
            current = begin;
            for (int i = 0; i < count; i++) {
                answer = answer + current.getContent() + "\n";
                current = current.getNext();
            }
        }

        return answer;
    }

    public int getCount() {
        return count;
    }
}
