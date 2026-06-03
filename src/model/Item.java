package model;

public class Item {

    private final int itemId;
    private final String icon;
    private final int typeId;
    private final String name;
    private final int level;

    public Item(int itemId, String icon, int typeId, String name, int level) {
        this.itemId = itemId;
        this.icon = icon;
        this.typeId = typeId;
        this.name = name;
        this.level = level;
    }

    public int getItemId() {
        return itemId;
    }

    public String getIcon() {
        return icon;
    }

    public int getTypeId() {
        return typeId;
    }

    public String getName() {
        return name;
    }

    public int getLevel() {
        return level;
    }
}
