package com.mealmatch.mealmatch.database;

import com.mealmatch.mealmatch.model.Recipe;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RecipeDAO {

    public List<Recipe> getAllRecipes() {
        List<Recipe> recipes = new ArrayList<>();
        String query = "SELECT * FROM recipes";

        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                int id = rs.getInt("id");

                Recipe recipe = new Recipe(
                        rs.getString("title"),
                        rs.getString("prep_time"),
                        rs.getString("category"),
                        rs.getString("difficulty"),
                        rs.getString("image_path"),
                        getDetails(id, "dietary_tags", "tag_name"),
                        getDetails(id, "ingredients", "name"),
                        getDetails(id, "steps", "description")
                );
                recipes.add(recipe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recipes;
    }

    private List<String> getDetails(int recipeId, String table, String column) throws SQLException {
        List<String> details = new ArrayList<>();
        String query = "SELECT " + column + " FROM " + table + " WHERE recipe_id = ?";

        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, recipeId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                details.add(rs.getString(column));
            }
        }
        return details;
    }
}
