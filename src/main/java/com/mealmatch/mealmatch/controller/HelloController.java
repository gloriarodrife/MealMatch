package com.mealmatch.mealmatch.controller;

import javafx.fxml.FXML;
import javafx.scene.layout.FlowPane;

public class HelloController {
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
        System.out.println("Loading Main Layout...");

        // Later, we will call the JSON loader here and use a loop
        // to create and add recipe cards to the 'recipeGrid'.

        recipeGrid.getChildren().clear();

        System.out.println("The recipe grid for the recipes");
    }
}
