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
            VBox card = new VBox(0);
            card.setStyle("-fx-background-color: white; -fx-background-radius: 10; -fx-effect: dropshadow(three-pass-box, rgba(0,0,0,0.1), 4, 0, 0, 2);");
            card.setPrefWidth(210);

            ImageView iv = new ImageView();
            try {
                String path = "/com/mealmatch/mealmatch/view/images/" + recipe.getImagePath();
                iv.setImage(new Image(Objects.requireNonNull(getClass().getResourceAsStream(path))));
                iv.setFitWidth(210);
                iv.setFitHeight(125);
                javafx.scene.shape.Rectangle clip = new javafx.scene.shape.Rectangle(210, 125);
                clip.setArcWidth(20); clip.setArcHeight(20);
                iv.setClip(clip);
            } catch (Exception e) { System.err.println("Img missing"); }

            VBox info = new VBox(2);
            info.setPadding(new Insets(8, 10, 10, 10));

            // Title - Aligned height
            Label title = new Label(recipe.getTitle());
            title.setStyle("-fx-font-weight: bold; -fx-font-size: 13; -fx-text-fill: #2c3e50;");
            title.setWrapText(true);
            title.setMinHeight(34);
            title.setMaxHeight(34);
            title.setAlignment(Pos.TOP_LEFT);

            // Dietary Tags - Aligned height
            HBox tagBox = new HBox(4);
            tagBox.setAlignment(Pos.CENTER_LEFT);
            tagBox.setMinHeight(18);
            tagBox.setMaxHeight(18);

            for (String tag : recipe.getDietaryTags()) {
                Label b = new Label();
                String st = "-fx-font-size: 8px; -fx-font-weight: bold; -fx-padding: 1 4; -fx-background-radius: 3; -fx-border-radius: 3; -fx-border-width: 1; ";
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

            // Time & Difficulty Row - CENTER_LEFT keeps icons and text on the same level
            HBox details = new HBox(6);
            details.setAlignment(Pos.CENTER_LEFT); // THIS FIXES THE ICON ALIGNMENT

            Label timeIcon = new Label("⏱");
            Label timeText = new Label(recipe.getTime());
            Label diffIcon = new Label("📊");
            Label diffText = new Label(recipe.getDifficulty());

            String detailStyle = "-fx-text-fill: #95a5a6; -fx-font-size: 10;";
            timeIcon.setStyle(detailStyle);
            timeText.setStyle(detailStyle);
            diffIcon.setStyle(detailStyle);
            diffText.setStyle(detailStyle);

            details.getChildren().addAll(timeIcon, timeText, diffIcon, diffText);

            info.getChildren().addAll(title, tagBox, details);
            card.getChildren().addAll(iv, info);
            recipeGrid.getChildren().add(card);
        }
    }

    private List<Recipe> getMockRecipes() {
        List<Recipe> list = new ArrayList<>();
        list.add(new Recipe("Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Chocolate Chip Waffles", "20 min", "Breakfast", "Easy", "pancakes.jpg", List.of()));
        list.add(new Recipe("French Toast Deluxe", "10 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Blueberry Morning Crepes", "20 min", "Breakfast", "Intermediate", "pancakes.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Classic Margherita Pizza", "25 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Pepperoni Feast", "30 min", "Main Courses", "Easy", "pizza.jpg", List.of()));
        list.add(new Recipe("Homemade BBQ Pizza", "40 min", "Main Courses", "Intermediate", "pizza.jpg", List.of()));
        list.add(new Recipe("Garden Veggie Pizza", "35 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        list.add(new Recipe("Street Veggie Tacos", "30 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Spicy Beef Tacos", "35 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Gluten Free")));
        list.add(new Recipe("Grilled Chicken Tacos", "25 min", "Main Courses", "Easy", "tacos.jpg", List.of("Gluten Free")));
        list.add(new Recipe("Roasted Pumpkin Soup", "45 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Creamy Tomato Basil", "30 min", "Soups", "Easy", "soup.jpg", List.of("Vegetarian", "Gluten Free")));
        list.add(new Recipe("Spicy Lentil Stew", "50 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        list.add(new Recipe("Autumn Mushroom Soup", "55 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Gluten Free")));
        return list;
    }
}