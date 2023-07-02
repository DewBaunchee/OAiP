public class BinTree {

    private int count;
    private Link mainRoot;

    public BinTree() {
        count = 0;
        mainRoot = null;
    }

    public String add(int tag) {

        String errorText = "";
        int level = 0;

        if (tag > 100 || tag < -100) {
            errorText = "Number is out of bounds.";
        }
        if (count == 30) {
            errorText = errorText + " Max number of elements.";
        }
        if (errorText.length() == 0) {
            if (mainRoot == null) {
                mainRoot = new Link(tag);
                mainRoot.setLevel(0);
                count++;
            } else {
                boolean notAdded = true;
                Link current = mainRoot;
                while (notAdded) {
                    if (current.getTag() == tag) {
                        notAdded = false;
                        errorText = "Number is already included.";
                    } else {

                        if (current.getTag() < tag) {

                            if (current.getRight() == null) {
                                current.setRight(new Link(tag));
                                current.getRight().setRoot(current);
                                current.getRight().setLevel(level + 1);
                                notAdded = false;
                                count++;
                            } else {
                                current = current.getRight();
                                level++;
                            }

                        } else {

                            if (current.getLeft() == null) {
                                current.setLeft(new Link(tag));
                                current.getLeft().setRoot(current);
                                current.getLeft().setLevel(level + 1);
                                notAdded = false;
                                count++;
                            } else {
                                current = current.getLeft();
                                level++;
                            }

                        }
                    }
                }
            }
        }
        return errorText;
    }

    public String viewTree() {
        return recView("", mainRoot);
    }

    private String recView(String answer, Link link) {
        if (link == null) {
            return "\n-----------------\n     {EMPTY}     \n-----------------\n";
        } else {
            if (link.getLeft() != null) {
                answer = recView(answer, link.getLeft());
            }

            answer = answer + " " + link.getTag();

            if (link.getRight() != null) {
                answer = recView(answer, link.getRight());
            }

            return answer.trim();
        }
    }

    public Link getLink(int key) {

        boolean notFound = true;
        Link current = mainRoot;
        while (notFound) {
            if (key == current.getTag()) {
                return current;
            }
            if (key < current.getTag()) {
                if (current.getLeft() == null) {
                    notFound = false;
                } else {
                    current = current.getLeft();
                }
            } else {
                if (key > current.getTag()) {
                    if (current.getRight() == null) {
                        notFound = false;
                    } else {
                        current = current.getRight();
                    }
                }
            }
        }

        return new Link(-101);
    }

    public String delete(int key) {
        String errorText = "";

        if (getLink(key).getTag() == -101) {
            errorText = "Element not found.";
        } else {
            Link currentRoot = getLink(key).getRoot();
            if (currentRoot == null) {
                mainRoot = null;
            } else {
                if (currentRoot.getTag() > key) {
                    currentRoot.setLeft(null);
                } else {
                    currentRoot.setRight(null);
                }
            }
            count--;
        }

        return errorText;
    }
}
