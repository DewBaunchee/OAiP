public class Link {

    private int tag;
    private int level;
    private Link left, right, root;

    public Link(int inTag) {
        tag = inTag;
        level = 0;
        left = right = root = null;
    }
            // tag
    public void setTag(int inTag) {
        tag = inTag;
    }

    public int getTag() {
        return tag;
    }
            // level
    public void setLevel(int inLevel) {
        level = inLevel;
    }

    public int getLevel() {
        return level;
    }
            // left
    public void setLeft(Link inLeft) {
        left = inLeft;
    }

    public Link getLeft() {
        return left;
    }
            // right
    public void setRight(Link inRight) {
        right = inRight;
    }

    public Link getRight() {
        return right;
    }
            // root
    public void setRoot(Link inRoot) {
        root = inRoot;
    }

    public Link getRoot() {
        return root;
    }
}
