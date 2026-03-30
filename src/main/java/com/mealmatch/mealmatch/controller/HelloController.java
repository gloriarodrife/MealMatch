package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.model.Recipe;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class HelloController {
    @FXML private TextField searchRecipe;
    @FXML private FlowPane recipeGrid;
    @FXML private CheckBox checkVegetarian, checkVegan, checkGlutenFree;

    private String currentCategory = "All Recipes";

    @FXML
    public void initialize() {
        renderRecipes(getMockRecipes());
        searchRecipe.textProperty().addListener((obs, old, newValue) -> applyAllFilters());
    }

    @FXML
    public void handleFilterChange(ActionEvent event) {
        applyAllFilters();
    }

    @FXML
    private void handleCategoryAction(ActionEvent event) {
        Hyperlink clickedLink = (Hyperlink) event.getSource();
        currentCategory = clickedLink.getText();
        applyAllFilters();
    }

    private void applyAllFilters() {
        String search = searchRecipe.getText().toLowerCase();
        List<Recipe> filtered = getMockRecipes().stream().filter(r ->
                (currentCategory.equals("All Recipes") || r.getCategory().equalsIgnoreCase(currentCategory)) &&
                        r.getTitle().toLowerCase().contains(search) &&
                        (!checkVegetarian.isSelected() || r.isVegetarian()) &&
                        (!checkVegan.isSelected() || r.isVegan()) &&
                        (!checkGlutenFree.isSelected() || r.isGlutenFree())
        ).toList();
        renderRecipes(filtered);
    }

    private void renderRecipes(List<Recipe> recipes) {
        recipeGrid.getChildren().clear();
        for (Recipe recipe : recipes) {
            VBox card = new VBox(10);
            card.setStyle("-fx-background-color: white; -fx-background-radius: 12; -fx-effect: dropshadow(three-pass-box, rgba(0,0,0,0.1), 8, 0, 0, 4);");
            card.setPrefWidth(240);

            ImageView iv = new ImageView();
            try {
                String path = "/com/mealmatch/mealmatch/view/images/" + recipe.getImagePath();
                iv.setImage(new Image(Objects.requireNonNull(getClass().getResourceAsStream(path))));
                iv.setFitWidth(240);
                iv.setFitHeight(150);
                javafx.scene.shape.Rectangle clip = new javafx.scene.shape.Rectangle(240, 150);
                clip.setArcWidth(24); clip.setArcHeight(24);
                iv.setClip(clip);
            } catch (Exception e) { System.err.println("Img missing: " + recipe.getImagePath()); }

            VBox info = new VBox(6);
            info.setPadding(new Insets(5, 12, 12, 12));

            Label title = new Label(recipe.getTitle());
            title.setStyle("-fx-font-weight: bold; -fx-font-size: 15; -fx-text-fill: #2c3e50;");
            title.setWrapText(true);

            HBox tagBox = new HBox(5);
            tagBox.setAlignment(Pos.CENTER_LEFT);
            for (String tag : recipe.getDietaryTags()) {
                Label b = new Label();
                String st = "-fx-font-size: 9px; -fx-font-weight: bold; -fx-padding: 2 6; -fx-background-radius: 4; -fx-border-radius: 4; -fx-border-width: 1; ";
                if (tag.equals("Vegetarian")) {
                    b.setText("Veggie");
                    b.setStyle(st + "-fx-background-color: #eafaf1; -fx-text-fill: #27ae60; -fx-border-color: #27ae60;");
                } else if (tag.equals("Vegan")) {
                    b.setText("Vegan");
                    b.setStyle(st + "-fx-background-color: #e8f8f5; -fx-text-fill: #16a085; -fx-border-color: #16a085;");
                } else if (tag.equals("Gluten Free")) {
                    b.setText("GF");
                    b.setStyle(st + "-fx-background-color: #fef9e7; -fx-text-fill: #f39c12; -fx-border-color: #f39c12;");
                }
                tagBox.getChildren().add(b);
            }

            HBox details = new HBox(10);
            Label time = new Label("⏱ " + recipe.getTime());
            Label diff = new Label("📊 " + recipe.getDifficulty());
            time.setStyle("-fx-text-fill: #7f8c8d; -fx-font-size: 11;");
            diff.setStyle("-fx-text-fill: #7f8c8d; -fx-font-size: 11;");
            details.getChildren().addAll(time, diff);

            info.getChildren().addAll(title, tagBox, details);
            card.getChildren().addAll(iv, info);
            recipeGrid.getChildren().add(card);
        }
    }

    private List<Recipe> getMockRecipes() {
        List<Recipe> list = new ArrayList<>();
        // Breakfast
        list.add(new Recipe("Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Chocolate Chip Waffles", "20 min", "Breakfast", "Easy", "pancakes.jpg", List.of()));
        list.add(new Recipe("French Toast Deluxe", "10 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Blueberry Morning Crepes", "20 min", "Breakfast", "Intermediate", "pancakes.jpg", List.of("Vegetarian")));

        // Main Courses
        list.add(new Recipe("Classic Margherita Pizza", "25 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Pepperoni Feast", "30 min", "Main Courses", "Easy", "pizza.jpg", List.of()));
        list.add(new Recipe("Homemade BBQ Pizza", "40 min", "Main Courses", "Intermediate", "pizza.jpg", List.of()));
        list.add(new Recipe("Garden Veggie Pizza", "35 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Street Veggie Tacos", "30 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Spicy Beef Tacos", "35 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Gluten Free")));
        list.add(new Recipe("Grilled Chicken Tacos", "25 min", "Main Courses", "Easy", "tacos.jpg", List.of("Gluten Free")));

        // Soups
        list.add(new Recipe("Roasted Pumpkin Soup", "45 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Creamy Tomato Basil", "30 min", "Soups", "Easy", "soup.jpg", List.of("Vegetarian", "Gluten Free")));
        list.add(new Recipe("Spicy Lentil Stew", "50 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Autumn Mushroom Soup", "55 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Gluten Free")));

        return list;
    }
}