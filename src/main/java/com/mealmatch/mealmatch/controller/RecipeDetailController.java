package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.model.Recipe;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import java.io.IOException;

public class RecipeDetailController {
    @FXML
    private Label titleLabel;


    public void initData(Recipe recipe) {
        titleLabel.setText(recipe.getTitle());
    }


    @FXML
    private void handleBack(javafx.event.ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/hello-view.fxml"));
            Parent root = loader.load();

            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();

            stage.getScene().setRoot(root);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
