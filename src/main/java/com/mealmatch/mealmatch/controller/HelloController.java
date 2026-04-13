package com.mealmatch.mealmatch.controller;

import com.mealmatch.mealmatch.model.Recipe;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.CheckBox;
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
            List<Recipe> filtered = allRecipes.stream().filter(recipe -> recipe.title().toLowerCase().contains(queryLowerCase)).toList();
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
                        .filter(r -> r.category().equalsIgnoreCase(category))
                        .toList();
                renderRecipes(filtered);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void handleFilters() {
        List<Recipe> allRecipes = getMockRecipes();
        List<String> activeDifficulties = new ArrayList<>();

        if (checkEasy.isSelected()) activeDifficulties.add("Easy");
        if (checkIntermediate.isSelected()) activeDifficulties.add("Intermediate");

        if (activeDifficulties.isEmpty()) {
            renderRecipes(allRecipes);
            return;
        }

        List<Recipe> filtered = allRecipes.stream()
                .filter(recipe -> activeDifficulties.contains(recipe.difficulty()))
                .toList();

        renderRecipes(filtered);
    }

    @FXML
    public void handleDietaryFilter() {
        List<Recipe> allRecipes = getMockRecipes();

        List<String> activeFilters = new ArrayList<>();

        if (checkVegetarian.isSelected()) activeFilters.add("Vegetarian");
        if (checkVegan.isSelected()) activeFilters.add("Vegan");
        if (checkGlutenFree.isSelected()) activeFilters.add("Gluten Free");

        if (activeFilters.isEmpty()) {
            renderRecipes(allRecipes);
            return;
        }

        List<Recipe> filtered = allRecipes.stream()
                .filter(recipe -> {
                    List<String> recipeTags = recipe.dietaryTags();
                    return activeFilters.stream().allMatch(filter ->
                            recipeTags.stream().anyMatch(tag -> tag.equalsIgnoreCase(filter))
                    );
                })
                .toList();

        renderRecipes(filtered);
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

                if (title != null) title.setText(recipe.title());
                if (category != null) category.setText(recipe.category());
                if (time != null) time.setText(recipe.time());
                if (difficulty != null) difficulty.setText(recipe.difficulty());


                if (dietaryContainer != null && recipe.dietaryTags() != null) {
                    dietaryContainer.getChildren().clear();

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
                        dietaryContainer.getChildren().add(label);
                    }
                }

                ImageView iv = (ImageView) card.lookup("#recipeImage");
                if (iv != null && recipe.imagePath() != null) {
                    try {
                        String path = "/com/mealmatch/mealmatch/view/images/" + recipe.imagePath();
                        Image img = new Image(Objects.requireNonNull(getClass().getResourceAsStream(path)));
                        iv.setImage(img);

                        Rectangle clip = new Rectangle(iv.getFitWidth(), iv.getFitHeight());
                        clip.setArcWidth(36);
                        clip.setArcHeight(36);
                        iv.setClip(clip);
                    } catch (Exception e) {
                        System.err.println("Could not load image: " + recipe.imagePath());
                    }
                }

                card.setOnMouseClicked(event -> {

                    showRecipeDetail(recipe, event);
                });
                recipeGrid.getChildren().add(card);

            } catch (Exception e) {
                System.err.println("Error loading recipe card: " + e.getMessage());
            }
        }
    }

    private void showRecipeDetail(Recipe recipe, javafx.scene.input.MouseEvent event) {


        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mealmatch/mealmatch/view/recipe-detail.fxml"));
            javafx.scene.Parent detailRoot = loader.load();

            RecipeDetailController controller = loader.getController();
            controller.initData(recipe);

            javafx.stage.Stage stage = (javafx.stage.Stage) ((javafx.scene.Node) event.getSource()).getScene().getWindow();
            stage.getScene().setRoot(detailRoot);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private List<Recipe> getMockRecipes() {
        List<Recipe> recipes = new ArrayList<>();

        recipes.add(new Recipe(
                "Authentic Basque Cheesecake",
                "12 hours",
                "Desserts",
                "Advanced",
                "pancakes.jpg",
                List.of("Vegetarian", "Gluten Free"),
                List.of(
                        "1 kg Cream cheese (room temp)",
                        "400g Caster sugar",
                        "7 Large eggs (room temp)",
                        "500ml Heavy cream (35% fat)",
                        "1 tbsp Cornstarch (for GF)"
                ),
                List.of(
                        "Begin by gathering your ingredients and allowing the cream cheese and eggs to reach room temperature for at least two hours; this ensures a perfectly smooth batter without any lumps. Preheat your oven to 400°F (200°C) with the fan on. Take a 9-inch springform pan and press two large sheets of parchment paper into it, intentionally crumpling the paper to fit the edges. This rustic, folded paper will give the cheesecake its signature jagged edges and prevent it from leaking.",

                        "In a large mixing bowl, beat the softened cream cheese and sugar together on a medium-low speed for about 5 to 7 minutes until the sugar is completely dissolved and the mixture is incredibly silky. It is crucial not to whip air into the batter, so keep the mixer speed low. Add the room-temperature eggs one at a time, mixing just until the yolk disappears into the batter before adding the next one. Stop frequently to scrape down the sides and bottom of the bowl with a silicone spatula.",

                        "In a separate small bowl, whisk a small amount of the heavy cream with the cornstarch until a smooth slurry forms with absolutely no lumps. Slowly pour this slurry, along with the rest of the heavy cream, into the main batter while stirring gently. Pour this very liquid batter into your prepared pan. Bake for exactly 45 to 50 minutes. The top should look dark brown, almost burnt and caramelized, but the center must still have a significant, wavy jiggle when you gently shake the pan.",

                        "Remove the cheesecake from the oven and let it sit on a wire rack. It will have puffed up high during baking and will drastically sink and crack as it cools—this is exactly what is supposed to happen and is part of its charm. Allow it to cool completely at room temperature for about 3 to 4 hours. Once at room temperature, transfer it to the refrigerator to chill for at least 6 hours, or preferably overnight. This critical resting phase is essential for the custard-like center to set properly before slicing."
                )
        ));
        // --- BREAKFAST ---
        recipes.add(new Recipe("Fluffy Berry Pancakes", "15 min", "Breakfast", "Easy", "pancakes.jpg",
                List.of("Vegetarian"),
                List.of("1 cup flour", "2 tbsp sugar", "1 cup milk", "Fresh berries"),
                List.of("Mix dry ingredients in a large bowl.", "Whisk in milk and eggs until smooth.", "Cook on a hot griddle until bubbly.", "Serve with fresh berries and syrup.")));

        recipes.add(new Recipe("Chocolate Chip Waffles", "20 min", "Breakfast", "Easy", "pancakes.jpg",
                List.of("Vegetarian", "Gluten Free"),
                List.of("GF Flour", "Chocolate chips", "Eggs", "Butter"),
                List.of("Preheat your waffle iron.", "Mix the batter and fold in chips.", "Pour into iron and cook until golden.", "Top with whipped cream and enjoy.")));

        recipes.add(new Recipe("French Toast Deluxe", "10 min", "Breakfast", "Easy", "pancakes.jpg",
                List.of("Vegetarian"),
                List.of("Brioche bread", "Cinnamon", "Vanilla extract", "Maple syrup"),
                List.of("Whisk eggs with cinnamon and vanilla.", "Soak bread slices in the mixture.", "Fry in butter until both sides are brown.", "Drizzle with plenty of maple syrup.")));

        // --- MAIN COURSES ---
        recipes.add(new Recipe("Classic Margherita Pizza", "25 min", "Main Courses", "Easy", "pizza.jpg",
                List.of("Vegetarian"),
                List.of("Pizza dough", "Tomato sauce", "Mozzarella", "Basil"),
                List.of("Roll out the dough on a floured surface.", "Spread sauce and add cheese slices.", "Bake at 450°F until the crust is crisp.", "Garnish with fresh basil leaves.")));

        recipes.add(new Recipe("Pepperoni Feast", "30 min", "Main Courses", "Easy", "pizza.jpg",
                List.of(),
                List.of("Dough", "Pepperoni", "Cheese", "Oregano"),
                List.of("Prepare the base and spread tomato sauce.", "Layer generously with cheese and pepperoni.", "Bake until cheese is bubbly and brown.", "Sprinkle oregano before serving hot.")));

        recipes.add(new Recipe("Homemade BBQ Pizza", "40 min", "Main Courses", "Intermediate", "pizza.jpg",
                List.of("Gluten Free"),
                List.of("GF Crust", "BBQ Sauce", "Grilled chicken", "Red onions"),
                List.of("Prepare the gluten-free pizza base.", "Use BBQ sauce instead of tomato.", "Add chicken and thinly sliced onions.", "Bake until the edges are golden-brown.")));

        // --- SOUPS ---
        recipes.add(new Recipe("Roasted Pumpkin Soup", "45 min", "Soups", "Intermediate", "soup.jpg",
                List.of("Vegetarian", "Vegan", "Gluten Free"),
                List.of("Pumpkin", "Coconut milk", "Ginger", "Vegetable broth"),
                List.of("Roast pumpkin chunks with olive oil.", "Sauté ginger and add roasted pumpkin.", "Simmer with broth and blend until smooth.", "Stir in coconut milk for creaminess.")));

        recipes.add(new Recipe("Creamy Tomato Basil", "30 min", "Soups", "Easy", "soup.jpg",
                List.of("Vegetarian", "Gluten Free"),
                List.of("Tomatoes", "Fresh basil", "Heavy cream", "Garlic"),
                List.of("Sauté garlic and onions in a pot.", "Add tomatoes and simmer for 20 minutes.", "Blend the soup and add fresh basil.", "Finish with a splash of heavy cream.")));

        recipes.add(new Recipe("Spicy Lentil Stew", "50 min", "Soups", "Intermediate", "soup.jpg",
                List.of("Vegan", "Vegetarian"),
                List.of("Red lentils", "Carrots", "Cumin", "Spinach"),
                List.of("Rinse lentils and boil in water.", "Add chopped carrots and cumin spice.", "Cook until lentils are soft and thick.", "Fold in fresh spinach at the very end.")));

        // --- TACOS ---
        recipes.add(new Recipe("Street Veggie Tacos", "30 min", "Main Courses", "Intermediate", "tacos.jpg",
                List.of("Vegetarian", "Vegan"),
                List.of("Corn tortillas", "Black beans", "Avocado", "Lime"),
                List.of("Warm the tortillas on a dry pan.", "Season beans with chili and lime.", "Fill tortillas with beans and avocado.", "Top with cilantro and extra lime juice.")));

        recipes.add(new Recipe("Spicy Beef Tacos", "35 min", "Main Courses", "Intermediate", "tacos.jpg",
                List.of("Gluten Free"),
                List.of("Ground beef", "Taco shells", "Jalapeños", "Salsa"),
                List.of("Brown the beef and drain excess fat.", "Add taco seasoning and chopped peppers.", "Fill the shells with the meat mixture.", "Serve with spicy salsa and cheese.")));

        recipes.add(new Recipe("Grilled Chicken Tacos", "25 min", "Main Courses", "Easy", "tacos.jpg",
                List.of("Gluten Free"),
                List.of("Chicken breast", "Slaw mix", "Corn", "Tortillas"),
                List.of("Grill chicken strips until fully cooked.", "Prepare a quick corn and lime slaw.", "Assemble tacos with chicken and slaw.", "Add a dollop of sour cream on top.")));

        // --- EXTRA ---
        recipes.add(new Recipe("Garden Veggie Pizza", "35 min", "Main Courses", "Easy", "pizza.jpg",
                List.of("Vegetarian"),
                List.of("Dough", "Bell peppers", "Zucchini", "Mushrooms"),
                List.of("Chop all vegetables into small pieces.", "Spread sauce and layer veggies on dough.", "Bake at 425°F for 15-20 minutes.", "Cut into slices and serve immediately.")));

        recipes.add(new Recipe("Autumn Mushroom Soup", "55 min", "Soups", "Intermediate", "soup.jpg",
                List.of("Vegetarian", "Gluten Free"),
                List.of("Wild mushrooms", "Thyme", "Onion", "Cream"),
                List.of("Sauté mushrooms with fresh thyme.", "Add broth and simmer to develop flavor.", "Blend half the soup for a thick texture.", "Stir in cream and season with pepper.")));

        recipes.add(new Recipe("Blueberry Morning Crepes", "20 min", "Breakfast", "Intermediate", "pancakes.jpg",
                List.of("Vegetarian", "Vegan", "Gluten Free"),
                List.of("Buckwheat flour", "Almond milk", "Blueberries", "Agave"),
                List.of("Mix buckwheat and milk into a thin batter.", "Pour thin layers into a non-stick pan.", "Fill with fresh blueberries and agave.", "Roll them up and serve while warm.")));

        return recipes;
    }


}