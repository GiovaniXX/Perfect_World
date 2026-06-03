package DAO;

import model.Item;
import connection.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ItemDAO {

    public ArrayList<String> getItemNames() throws ClassNotFoundException, SQLException {
        ArrayList<String> items = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT name FROM items";
            try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    items.add(rs.getString("name"));
                }
            }
        }
        return items;
    }

    public Item getItemByName(String name) throws ClassNotFoundException, SQLException {
        Item item;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM items WHERE name = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                try (ResultSet rs = stmt.executeQuery()) {
                    item = null;
                    if (rs.next()) {
                        item = new Item(
                                rs.getInt("item_id"),
                                rs.getString("icon"),
                                rs.getInt("type_id"),
                                rs.getString("name"),
                                rs.getInt("level")
                        );
                    }
                }
            }
        }
        return item;
    }
}
