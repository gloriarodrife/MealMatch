package com.mealmatch.mealmatch.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.IOException;

public class UserController {
    // Fake data
    private final String FAKE_EMAIL = "gloria@wcc.edu";
    private final String FAKE_PASS = "1234";
    @FXML
    public VBox loadingOverlay;
    @FXML
    public PasswordField newPassField;
    @FXML
    private VBox authSection;
    @FXML
    private VBox registerSection;
    @FXML
    private VBox profileSection;
    // Login
    @FXML
    private TextField emailField;
    @FXML
    private PasswordField passField;
    // Register
    @FXML
    private TextField regUsernameField;
    @FXML
    private TextField regEmailField;
    @FXML
    private PasswordField regPassField;
    // Profile
    @FXML
    private Label nameLabel;
    @FXML
    private Label emailLabel;
    @FXML
    private FlowPane favoritesFlowPane;

    @FXML
    public void initialize() {
        showLoginView();
    }

    private void showError() {
        javafx.scene.control.Alert alert = new javafx.scene.control.Alert(javafx.scene.control.Alert.AlertType.ERROR);
        alert.setTitle("Login Failed");
        alert.setHeaderText(null);
        alert.setContentText("Incorrect email or password. Please try again.");
        alert.showAndWait();
    }


    @FXML
    public void handleLogin(javafx.event.ActionEvent event) {
        String email = emailField.getText();
        String password = passField.getText();

        if (email.equals(FAKE_EMAIL) && password.equals(FAKE_PASS)) {
            try {
                javafx.fxml.FXMLLoader loader = new javafx.fxml.FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/hello-view.fxml"));
                javafx.scene.Parent root = loader.load();
                javafx.stage.Stage stage = (javafx.stage.Stage) ((javafx.scene.Node) event.getSource()).getScene().getWindow();
                stage.getScene().setRoot(root);
            } catch (java.io.IOException e) {
                System.err.println("Error loading main view: " + e.getMessage());
            }
        } else {
            showError();
        }
    }

    @FXML
    public void processRegistration() {
        if (!regEmailField.getText().isEmpty()) {
            showProfileView(regEmailField.getText(), regUsernameField.getText());
        }
    }

    @FXML
    public void showRegisterView() {
        authSection.setVisible(false);
        authSection.setManaged(false);
        profileSection.setVisible(false);
        profileSection.setManaged(false);

        registerSection.setVisible(true);
        registerSection.setManaged(true);
    }

    @FXML
    public void showLoginView() {
        registerSection.setVisible(false);
        registerSection.setManaged(false);
        profileSection.setVisible(false);
        profileSection.setManaged(false);

        authSection.setVisible(true);
        authSection.setManaged(true);
    }

    private void showProfileView(String email, String name) {
        authSection.setVisible(false);
        authSection.setManaged(false);
        registerSection.setVisible(false);
        registerSection.setManaged(false);

        profileSection.setVisible(true);
        profileSection.setManaged(true);

        nameLabel.setText("Name: " + name);
        emailLabel.setText("Email: " + email);
    }

    @FXML
    public void handleLogout() {
        emailField.clear();
        passField.clear();
        regUsernameField.clear();
        regEmailField.clear();
        regPassField.clear();

        showLoginView();
    }

    @FXML
    public void handleUpdatePass() {
        System.out.println("Password updated");
    }

    @FXML
    private void handleBack(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/hello-view.fxml"));
            Parent root = loader.load();

            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.getScene().setRoot(root);

        } catch (IOException e) {
            System.err.println("Error trying to go back: " + e.getMessage());
        }
    }
}