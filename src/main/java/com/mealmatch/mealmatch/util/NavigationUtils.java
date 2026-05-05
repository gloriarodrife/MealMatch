package com.mealmatch.mealmatch.util;

import com.mealmatch.mealmatch.controller.RecipeDetailController;
import com.mealmatch.mealmatch.controller.UserController;
import com.mealmatch.mealmatch.model.Recipe;
import com.mealmatch.mealmatch.model.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.SVGPath;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class NavigationUtils {

    public static void showRecipeDetail(Recipe recipe, MouseEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(NavigationUtils.class.getResource("/com/mealmatch/mealmatch/view/recipe-detail.fxml"));
            Parent detailRoot = loader.load();

            RecipeDetailController controller = loader.getController();
            controller.initData(recipe);

            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.getScene().setRoot(detailRoot);
        } catch (Exception e) {
            System.err.println("Error loading recipe detail: " + e.getMessage());
        }
    }


    public static void navigateToHome(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(NavigationUtils.class.getResource("/com/mealmatch/mealmatch/view/hello-view.fxml"));
            Parent root = loader.load();

            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.getScene().setRoot(root);

        } catch (IOException e) {
            System.err.println("Error trying to go back: " + e.getMessage());
        }
    }

    public static VBox createRecipeCard(Recipe recipe) {
        try {
            FXMLLoader loader = new FXMLLoader(NavigationUtils.class.getResource("/com/mealmatch/mealmatch/view/recipe-card.fxml"));
            VBox card = loader.load();

            Label title = (Label) card.lookup("#titleLabel");
            Label time = (Label) card.lookup("#timeLabel");
            Label difficulty = (Label) card.lookup("#difficultyLabel");
            Label category = (Label) card.lookup("#categoryLabel");

            if (title != null) title.setText(recipe.title());
            if (category != null) category.setText(recipe.category());
            if (time != null) time.setText(recipe.time());
            if (difficulty != null) difficulty.setText(recipe.difficulty());

            HBox dietaryContainer = (HBox) card.lookup("#dietaryContainer");
            if (dietaryContainer != null && recipe.dietaryTags() != null) {
                dietaryContainer.getChildren().clear();

                List<String> sortedTags = new ArrayList<>(recipe.dietaryTags());
                java.util.Collections.sort(sortedTags);

                for (String tag : sortedTags) {
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
            if (iv != null && recipe.imagePath() != null) {
                try {
                    String path = "/com/mealmatch/mealmatch/view/images/" + recipe.imagePath();
                    Image img = new Image(Objects.requireNonNull(NavigationUtils.class.getResourceAsStream(path)));
                    iv.setImage(img);

                    Rectangle clip = new Rectangle(iv.getFitWidth(), iv.getFitHeight());
                    clip.setArcWidth(36);
                    clip.setArcHeight(36);
                    iv.setClip(clip);
                } catch (Exception e) {
                    System.err.println("Could not load image: " + recipe.imagePath());
                }
            }

            card.setOnMouseClicked(event -> showRecipeDetail(recipe, event));
            StackPane favoriteBtn = (StackPane) card.lookup("#favoriteButton");

            if (favoriteBtn != null) {
                favoriteBtn.setPickOnBounds(true);

                SVGPath icon = (SVGPath) favoriteBtn.lookup(".favorite-icon");

                User currentUserOnLoad = UserController.getLoggedUser();
                if (currentUserOnLoad != null && currentUserOnLoad.getFavoriteRecipes().contains(recipe)) {
                    if (!favoriteBtn.getStyleClass().contains("favorite-active")) {
                        favoriteBtn.getStyleClass().add("favorite-active");
                    }

                    if (icon != null) icon.setStyle("-fx-fill: #c04848; -fx-stroke: #c04848;");

                } else {
                    favoriteBtn.getStyleClass().remove("favorite-active");
                    if (icon != null) icon.setStyle("-fx-fill: #E5A9A9; -fx-stroke: #E5A9A9;");
                }

                favoriteBtn.setOnMouseClicked(event -> {
                    event.consume();

                    User currentUser = UserController.getLoggedUser();
                    if (currentUser != null) {
                        if (currentUser.getFavoriteRecipes().contains(recipe)) {
                            currentUser.getFavoriteRecipes().remove(recipe);
                            favoriteBtn.getStyleClass().remove("favorite-active");
                            System.out.println("Removed from favorites: " + recipe.title());

                            if (icon != null) icon.setStyle("-fx-fill: #E5A9A9; -fx-stroke: #E5A9A9;");
                        } else {
                            currentUser.addFavorite(recipe);
                            favoriteBtn.getStyleClass().add("favorite-active");
                            System.out.println("Added to favorites: " + recipe.title());
                            if (icon != null) icon.setStyle("-fx-fill: #c04848; -fx-stroke: #c04848;");
                        }
                    } else {
                        System.out.println("User must be logged in!");
                    }
                });
            }

            card.setOnMouseClicked(event -> showRecipeDetail(recipe, event));

            return card;

        } catch (Exception e) {
            System.err.println("Error creating recipe card: " + e.getMessage());
            return null;
        }
    }

}
