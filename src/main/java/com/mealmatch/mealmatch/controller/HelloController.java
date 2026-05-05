package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.database.RecipeDAO;
import com.mealmatch.mealmatch.model.Recipe;
import com.mealmatch.mealmatch.util.NavigationUtils;
import javafx.animation.PauseTransition;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.util.Duration;

import java.util.ArrayList;
import java.util.List;


public class HelloController {
    @FXML
    private TextField searchRecipe;
    @FXML
    private CheckBox checkVegetarian;
    @FXML
    private CheckBox checkVegan;
    @FXML
    private CheckBox checkGlutenFree;

    // Category filters
    @FXML
    private CheckBox checkEasy;
    @FXML
    private CheckBox checkIntermediate;

    private List<Recipe> allRecipes;

    //ALL filters
    private String selectedCategory = "All Recipes";
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
        allRecipes = getAllRecipes();
        renderRecipes(allRecipes);

        PauseTransition pause = new PauseTransition(Duration.millis(300));
        searchRecipe.textProperty().addListener((obs, oldVal, newVal) -> {
            pause.setOnFinished(event -> applyFilters());
            pause.playFromStart();
        });

    }

    @FXML
    private void handleCategoryAction(javafx.event.ActionEvent event) {
        Hyperlink link = (Hyperlink) event.getSource();
        selectedCategory = link.getText();
        link.setVisited(false);
        applyFilters();
    }


    //combined filtering process
    @FXML
    public void applyFilters() {

        List<Recipe> filtered = new ArrayList<>();
        String query = searchRecipe.getText().toLowerCase();

        for (Recipe r : allRecipes) {
            boolean matchesSearch = query.isEmpty() || r.title().toLowerCase().contains(query);
            boolean matchesCat = selectedCategory.equals("All Recipes") || r.category().equalsIgnoreCase(selectedCategory);

            boolean matchesDiff = true;
            if (checkEasy.isSelected() || checkIntermediate.isSelected()) {
                matchesDiff = (checkEasy.isSelected() && r.difficulty().equalsIgnoreCase("Easy")) ||
                        (checkIntermediate.isSelected() && r.difficulty().equalsIgnoreCase("Intermediate"));
            }

            boolean matchesVeg = !checkVegetarian.isSelected() || r.dietaryTags().contains("Vegetarian");
            boolean matchesVegan = !checkVegan.isSelected() || r.dietaryTags().contains("Vegan");
            boolean matchesGF = !checkGlutenFree.isSelected() || r.dietaryTags().contains("Gluten Free");

            if (matchesSearch && matchesCat && matchesDiff && matchesVeg && matchesVegan && matchesGF) {
                filtered.add(r);
            }
        }

        renderRecipes(filtered);
    }


    @FXML
    public void onUserButtonClick(javafx.event.ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/user-view.fxml"));
            javafx.scene.Parent userRoot = loader.load();

            // Get the current stage (window) from the button click event
            javafx.stage.Stage stage = (javafx.stage.Stage) ((javafx.scene.Node) event.getSource()).getScene().getWindow();

            // Replace the current content with the new user page
            stage.getScene().setRoot(userRoot);

        } catch (Exception e) {
            System.err.println("Error loading user view: " + e.getMessage());
        }
    }

    private void renderRecipes(List<Recipe> recipes) {
        recipeGrid.getChildren().clear();

        if (recipes.isEmpty()) {
            Label noResultsLabel = new Label("No recipes match the filters.");
            noResultsLabel.setStyle("-fx-font-size: 16px; -fx-text-fill: gray; -fx-padding: 20px;");
            recipeGrid.getChildren().add(noResultsLabel);
            return;
        }

        for (Recipe recipe : recipes) {
            VBox card = NavigationUtils.createRecipeCard(recipe);

            if (card != null) {
                recipeGrid.getChildren().add(card);
            }
        }
    }


    private List<Recipe> getAllRecipes() {
        RecipeDAO recipeDAO = new RecipeDAO();
        return recipeDAO.getAllRecipes();
    }

}