package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.database.UserDAO;
import com.mealmatch.mealmatch.model.Recipe;
import com.mealmatch.mealmatch.model.User;
import com.mealmatch.mealmatch.util.NavigationUtils;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;

import java.util.ArrayList;
import java.util.List;

public class UserController {
    public static User loggedUser = null;
    // Fake data
    private final String FAKE_EMAIL = "gloria@wcc.edu";
    private final String FAKE_PASS = "1234";
    private final String FAKE_NAME = "Gloria Rodriguez";


    @FXML
    public VBox loadingOverlay;
    @FXML
    public PasswordField newPassField;
    @FXML
    public Region spacer;
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

    public static User getLoggedUser() {
        return loggedUser;
    }

    @FXML
    public void initialize() {
        if (loggedUser != null) {
            showProfileView();
        } else {
            showLoginView();
        }
    }

    private void showError(String title, String errorMessage) {
        javafx.scene.control.Alert alert = new javafx.scene.control.Alert(javafx.scene.control.Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(errorMessage);
        alert.showAndWait();
    }


    @FXML
    public void handleLogin(javafx.event.ActionEvent event) {
        String email = emailField.getText();
        String password = passField.getText();

        if (email.isEmpty() || password.isEmpty()) {
            showError("Missing Information", "Please enter both email and password.");
            return;
        }

        UserDAO userDAO = new UserDAO();
        User authenticatedUser = userDAO.validateCredentials(email, password);

        if (authenticatedUser != null) {
            loggedUser = authenticatedUser; // Guarda la sesión global
            NavigationUtils.navigateToHome(event);
        } else {
            showError("Invalid Credentials", "The email or password provided is incorrect.");
        }
    }

    @FXML
    public void processRegistration() {
        if (!regEmailField.getText().isEmpty()) {
            showProfileView();
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

        spacer.setManaged(false);
    }

    @FXML
    public void showLoginView() {
        registerSection.setVisible(false);
        registerSection.setManaged(false);
        profileSection.setVisible(false);
        profileSection.setManaged(false);

        authSection.setVisible(true);
        authSection.setManaged(true);

        spacer.setManaged(false);
    }

    @FXML
    private void showProfileView() {
        authSection.setVisible(false);
        authSection.setManaged(false);
        registerSection.setVisible(false);
        registerSection.setManaged(false);

        profileSection.setVisible(true);
        profileSection.setManaged(true);

        spacer.setManaged(true);

        nameLabel.setText(loggedUser.getUsername());
        emailLabel.setText(loggedUser.getEmail());

        loadFavorites();
    }

    @FXML
    private void loadFavorites() {
        favoritesFlowPane.getChildren().clear();
        User currentUser = getLoggedUser();

        if (currentUser != null) {
            List<Recipe> favorites = currentUser.getFavoriteRecipes();

            for (Recipe recipe : favorites) {
                VBox card = NavigationUtils.createRecipeCard(recipe);
                if (card != null) {
                    favoritesFlowPane.getChildren().add(card);
                }
            }
        }
    }

    @FXML
    public void handleLogout(javafx.event.ActionEvent event) {
        emailField.clear();
        passField.clear();
        regUsernameField.clear();
        regEmailField.clear();
        regPassField.clear();

        loggedUser = null;
        NavigationUtils.navigateToHome(event);
    }

    @FXML
    public void handleUpdatePass() {
        System.out.println("Password updated");
    }

    @FXML
    private void handleBack(javafx.event.ActionEvent event) {
        NavigationUtils.navigateToHome(event);
    }


    // Fake Favorites data
    private List<Recipe> getMockFavorites() {
        List<Recipe> favs = new ArrayList<>();

        favs.add(new Recipe(
                "Authentic Basque Cheesecake", "12 hours", "Desserts", "Advanced", "pancakes.jpg",
                List.of("Vegetarian", "Gluten Free"), List.of("Cheese", "Sugar"), List.of("Mix", "Bake")
        ));

        favs.add(new Recipe(
                "Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg",
                List.of("Vegetarian"), List.of("Flour", "Milk"), List.of("Cook", "Serve")
        ));

        return favs;
    }
}