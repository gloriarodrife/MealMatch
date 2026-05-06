package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.database.UserDAO;
import com.mealmatch.mealmatch.model.Recipe;
import com.mealmatch.mealmatch.util.NavigationUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.SVGPath;

import java.util.Objects;

public class RecipeDetailController {
    @FXML
    public StackPane favoriteButton;
    @FXML
    private Label titleLabel;
    @FXML
    private Label timeLabel;
    @FXML
    private Label difficultyLabel;
    @FXML
    private FlowPane tagsContainer;
    @FXML
    private VBox ingredientsContainer;
    @FXML
    private VBox stepsContainer;
    @FXML
    private ImageView recipeImage;

    public void initData(Recipe recipe) {

        titleLabel.setText(recipe.title());
        timeLabel.setText(recipe.time().toUpperCase() + " TOTAL");
        difficultyLabel.setText(recipe.difficulty().toUpperCase());

        tagsContainer.getChildren().clear();

        if (tagsContainer != null && recipe.dietaryTags() != null) {
            tagsContainer.getChildren().clear();

            for (String tag : recipe.dietaryTags()) {
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
                tagsContainer.getChildren().add(label);
            }
        }


        ingredientsContainer.getChildren().clear();
        if (recipe.ingredients() != null) {
            for (String ing : recipe.ingredients()) {
                Label label = new Label("• " + ing);
                label.getStyleClass().add("step-text");
                label.setWrapText(true);
                ingredientsContainer.getChildren().add(label);
            }
        }


        stepsContainer.getChildren().clear();
        if (recipe.steps() != null) {
            int i = 1;
            for (String step : recipe.steps()) {
                VBox stepBox = new VBox();
                stepBox.getStyleClass().add("step-box");

                Label numLabel = new Label(String.format("%02d", i));
                numLabel.getStyleClass().add("step-num");

                Label textLabel = new Label(step);
                textLabel.getStyleClass().add("step-text");
                textLabel.setWrapText(true);

                stepBox.getChildren().addAll(numLabel, textLabel);
                stepsContainer.getChildren().add(stepBox);
                i++;
            }
        }

        if (favoriteButton != null) {
            com.mealmatch.mealmatch.model.User currentUser = UserController.getLoggedUser();
            SVGPath icon = (SVGPath) favoriteButton.lookup(".favorite-icon");

            if (currentUser != null && currentUser.getFavoriteRecipes().contains(recipe)) {
                if (!favoriteButton.getStyleClass().contains("favorite-active")) {
                    favoriteButton.getStyleClass().add("favorite-active");
                }
                if (icon != null) icon.setStyle("-fx-fill: #c04848; -fx-stroke: #c04848;");
            } else {
                favoriteButton.getStyleClass().remove("favorite-active");
                if (icon != null) icon.setStyle("-fx-fill: #E5A9A9; -fx-stroke: #E5A9A9;");
            }

            favoriteButton.setOnMouseClicked(event -> {
                com.mealmatch.mealmatch.model.User user = UserController.getLoggedUser();
                if (user != null) {
                    UserDAO userDAO = new UserDAO(); // Create DAO instance
                    SVGPath currentIcon = (SVGPath) favoriteButton.lookup(".favorite-icon");

                    if (user.getFavoriteRecipes().contains(recipe)) {
                        user.getFavoriteRecipes().remove(recipe);
                        userDAO.removeFavorite(user.getId(), recipe.id()); // Database Call

                        favoriteButton.getStyleClass().remove("favorite-active");
                        if (currentIcon != null) currentIcon.setStyle("-fx-fill: #E5A9A9; -fx-stroke: #E5A9A9;");
                    } else {
                        user.addFavorite(recipe);
                        userDAO.addFavorite(user.getId(), recipe.id()); // Database Call

                        favoriteButton.getStyleClass().add("favorite-active");
                        if (currentIcon != null) currentIcon.setStyle("-fx-fill: #c04848; -fx-stroke: #c04848;");
                    }
                }
            });
        }

        if (recipe.imagePath() != null) {
            try {

                String path = "/com/mealmatch/mealmatch/view/images/" + recipe.imagePath();
                Image img = new Image(Objects.requireNonNull(getClass().getResourceAsStream(path)));
                recipeImage.setImage(img);
            } catch (Exception e) {
                System.err.println("Could not load image: " + recipe.imagePath());
            }
        }
    }

    @FXML
    private void handleBack(ActionEvent event) {
        NavigationUtils.navigateToHome(event);
    }
}