package com.mealmatch.mealmatch.controller;


import com.mealmatch.mealmatch.model.Recipe;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


public class HelloController {
    @FXML
    private TextField searchRecipe;

    /**
     * This is the container where the recipe cards will be rendered.
     */

    @FXML
    private FlowPane recipeGrid;

    /**
     * This method is automatically called when the FXML view is loaded.
     */
    @FXML
    public void initialize() {
        renderRecipes(getMockRecipes());
        searchRecipe.textProperty().addListener((observable, oldValue, newValue) -> handleSearchByTitle(newValue));
    }

    private void handleSearchByTitle(String search) {
        List<Recipe> allRecipes = getMockRecipes();

        if (search == null || search.isEmpty()) {
            renderRecipes(allRecipes);
        } else {
            String queryLowerCase = search.toLowerCase();
            List<Recipe> filtered = allRecipes.stream().filter(recipe -> recipe.getTitle().toLowerCase().contains(queryLowerCase)).toList();
            renderRecipes(filtered);
        }

    }

    @FXML
    private void handleCategoryAction(javafx.event.ActionEvent event) {
        try {
            Hyperlink clickedLink = (Hyperlink) event.getSource();
            String category = clickedLink.getText();

            List<Recipe> allRecipes = getMockRecipes();

            if (category.equals("All Recipes")) {
                renderRecipes(allRecipes);
            } else {
                List<Recipe> filtered = allRecipes.stream()
                        .filter(r -> r.getCategory().equalsIgnoreCase(category))
                        .toList();
                renderRecipes(filtered);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void renderRecipes(List<Recipe> recipes) {
        recipeGrid.getChildren().clear();

        for (Recipe recipe : recipes) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/recipe-card.fxml"));
                VBox card = loader.load();

                Label title = (Label) card.lookup("#titleLabel");
                Label time = (Label) card.lookup("#timeLabel");
                Label difficulty = (Label) card.lookup("#difficultyLabel");
                Label category = (Label) card.lookup("#categoryLabel");

                if (title != null) title.setText(recipe.getTitle());
                if (category != null) category.setText(recipe.getCategory());
                if (time != null) time.setText(recipe.getTime());
                if (difficulty != null) difficulty.setText(recipe.getDifficulty());

                ImageView iv = (ImageView) card.lookup("#recipeImage");
                if (iv != null && recipe.getImagePath() != null) {
                    try {
                        String path = "/com/mealmatch/mealmatch/view/images/" + recipe.getImagePath();
                        Image img = new Image(Objects.requireNonNull(getClass().getResourceAsStream(path)));
                        iv.setImage(img);
                    } catch (Exception e) {
                        System.err.println("Could not load image: " + recipe.getImagePath());
                    }
                }

                recipeGrid.getChildren().add(card);

            } catch (Exception e) {
                System.err.println("Error loading recipe card: " + e.getMessage());
            }
        }
    }
    @FXML
    private javafx.scene.control.TextField searchField;

    @FXML
    private javafx.scene.control.CheckBox checkVegetarian;

    @FXML
    private javafx.scene.control.CheckBox checkVegan;

    @FXML
    private javafx.scene.control.CheckBox checkGlutenFree;


    private List<Recipe> getMockRecipes() {
        List<Recipe> recipes = new ArrayList<>();

        // Format: Title, Time, Category, Difficulty, Image, Vegetarian, Vegan, GlutenFree
        recipes.add(new Recipe("Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg", true, false, false));
        recipes.add(new Recipe("Chocolate Chip Waffles", "20 min", "Breakfast", "Easy", "pancakes.jpg", false, false, false));
        recipes.add(new Recipe("French Toast Deluxe", "10 min", "Breakfast", "Easy", "pancakes.jpg", true, false, false));

        recipes.add(new Recipe("Classic Margherita Pizza", "25 min", "Main Courses", "Easy", "pizza.jpg", true, false, false));
        recipes.add(new Recipe("Pepperoni Feast", "30 min", "Main Courses", "Easy", "pizza.jpg", false, false, false));
        recipes.add(new Recipe("Homemade BBQ Pizza", "40 min", "Main Courses", "Intermediate", "pizza.jpg", false, false, false));

        recipes.add(new Recipe("Roasted Pumpkin Soup", "45 min", "Soups", "Intermediate", "soup.jpg", true, true, true));
        recipes.add(new Recipe("Creamy Tomato Basil", "30 min", "Soups", "Easy", "soup.jpg", true, false, true));
        recipes.add(new Recipe("Spicy Lentil Stew", "50 min", "Soups", "Intermediate", "soup.jpg", true, true, true));

        recipes.add(new Recipe("Street Veggie Tacos", "30 min", "Main Courses", "Intermediate", "tacos.jpg", true, true, true));
        recipes.add(new Recipe("Spicy Beef Tacos", "35 min", "Main Courses", "Intermediate", "tacos.jpg", false, false, true));
        recipes.add(new Recipe("Grilled Chicken Tacos", "25 min", "Main Courses", "Easy", "tacos.jpg", false, false, true));

        recipes.add(new Recipe("Garden Veggie Pizza", "35 min", "Main Courses", "Easy", "pizza.jpg", true, false, false));
        recipes.add(new Recipe("Autumn Mushroom Soup", "55 min", "Soups", "Intermediate", "soup.jpg", true, false, true));
        recipes.add(new Recipe("Blueberry Morning Crepes", "20 min", "Breakfast", "Intermediate", "pancakes.jpg", true, false, false));

        return recipes;
    }
    @FXML
    public void handleFilterChange(ActionEvent actionEvent) {
        List<Recipe> allRecipes = getMockRecipes();
        List<Recipe> filteredResults = new ArrayList<>();

        String searchText = "";
        if (searchField != null) {
            searchText = searchField.getText().toLowerCase();
        }

        for (Recipe recipe : allRecipes) {
            boolean matchesSearch = recipe.getTitle().toLowerCase().contains(searchText);

            boolean matchesDietary = true;
            if (checkVegetarian.isSelected() && !recipe.isVegetarian()) {
                matchesDietary = false;
            }
            if (checkVegan.isSelected() && !recipe.isVegan()) {
                matchesDietary = false;
            }
            if (checkGlutenFree.isSelected() && !recipe.isGlutenFree()) {
                matchesDietary = false;
            }

            if (matchesSearch && matchesDietary) {
                filteredResults.add(recipe);
            }
        }

        renderRecipes(filteredResults);
    }
}
