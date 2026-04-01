package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.model.Recipe;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.shape.Rectangle;

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
                HBox dietaryContainer = (HBox) card.lookup("#dietaryContainer");

                if (title != null) title.setText(recipe.getTitle());
                if (category != null) category.setText(recipe.getCategory());
                if (time != null) time.setText(recipe.getTime());
                if (difficulty != null) difficulty.setText(recipe.getDifficulty());


                if (dietaryContainer != null && recipe.getDietaryTags() != null) {
                    dietaryContainer.getChildren().clear();

                    for (String tag : recipe.getDietaryTags()) {
                        String displayTag = tag;
                        String styleClass = "dietary-tag";
                        
                        if (tag.equalsIgnoreCase("Gluten Free")) {
                            displayTag = "GF";
                            styleClass = "tag-gf";
                        } else if (tag.equalsIgnoreCase("Vegetarian") || tag.equalsIgnoreCase("Veggie")) {
                            displayTag = "Veggie";
                            styleClass = "tag-veggie";
                        } else if (tag.equalsIgnoreCase("Vegan")) {
                            styleClass = "tag-vegan";
                        }

                        Label label = new Label(displayTag);
                        label.getStyleClass().addAll("dietary-tag", styleClass);
                        dietaryContainer.getChildren().add(label);
                    }
                }

                ImageView iv = (ImageView) card.lookup("#recipeImage");
                if (iv != null && recipe.getImagePath() != null) {
                    try {
                        String path = "/com/mealmatch/mealmatch/view/images/" + recipe.getImagePath();
                        Image img = new Image(Objects.requireNonNull(getClass().getResourceAsStream(path)));
                        iv.setImage(img);

                        Rectangle clip = new Rectangle(iv.getFitWidth(), iv.getFitHeight());
                        clip.setArcWidth(36);
                        clip.setArcHeight(36);
                        iv.setClip(clip);
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

    private List<Recipe> getMockRecipes() {
        List<Recipe> recipes = new ArrayList<>();

        recipes.add(new Recipe("Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));
        recipes.add(new Recipe("Chocolate Chip Waffles", "20 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian", "Gluten Free")));
        recipes.add(new Recipe("French Toast Deluxe", "10 min", "Breakfast", "Easy", "pancakes.jpg", List.of("Vegetarian")));

        recipes.add(new Recipe("Classic Margherita Pizza", "25 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        recipes.add(new Recipe("Pepperoni Feast", "30 min", "Main Courses", "Easy", "pizza.jpg", List.of()));
        recipes.add(new Recipe("Homemade BBQ Pizza", "40 min", "Main Courses", "Intermediate", "pizza.jpg", List.of("Gluten Free")));

        recipes.add(new Recipe("Roasted Pumpkin Soup", "45 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));
        recipes.add(new Recipe("Creamy Tomato Basil", "30 min", "Soups", "Easy", "soup.jpg", List.of("Vegetarian", "Gluten Free")));
        recipes.add(new Recipe("Spicy Lentil Stew", "50 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegan", "Vegetarian")));

        recipes.add(new Recipe("Street Veggie Tacos", "30 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Vegetarian", "Vegan")));
        recipes.add(new Recipe("Spicy Beef Tacos", "35 min", "Main Courses", "Intermediate", "tacos.jpg", List.of("Gluten Free")));
        recipes.add(new Recipe("Grilled Chicken Tacos", "25 min", "Main Courses", "Easy", "tacos.jpg", List.of("Gluten Free")));

        recipes.add(new Recipe("Garden Veggie Pizza", "35 min", "Main Courses", "Easy", "pizza.jpg", List.of("Vegetarian")));
        recipes.add(new Recipe("Autumn Mushroom Soup", "55 min", "Soups", "Intermediate", "soup.jpg", List.of("Vegetarian", "Gluten Free")));
        recipes.add(new Recipe("Blueberry Morning Crepes", "20 min", "Breakfast", "Intermediate", "pancakes.jpg", List.of("Vegetarian", "Vegan", "Gluten Free")));

        return recipes;
    }
}