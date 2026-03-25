package com.mealmatch.mealmatch.model;

/**
 * Represents a cooking recipe within the Meal Match application.
 * Stores core information such as title, preparation time, category, and difficulty.
 */
public class Recipe {
    private static int counter = 0;
    private final int id;
    private String title;
    private String time;
    private String category;
    private String difficulty;
    private String imagePath;

    /**
     * Constructs a Recipe with a unique ID and detailed information.
     *
     * @param title      The name of the dish.
     * @param time       Estimated preparation time (e.g., "25 min").
     * @param category   The food category (e.g., "Breakfast", "Main Courses").
     * @param difficulty The skill level required (e.g., "Easy", "Intermediate").
     * @param imagePath  The relative path or filename for the recipe image.
     */
    public Recipe(String title, String time, String category, String difficulty, String imagePath) {
        this.id = ++counter;
        this.title = title;
        this.time = time;
        this.category = category;
        this.difficulty = difficulty;
        this.imagePath = imagePath;
    }

    /**
     * Returns the unique identifier for this recipe.
     *
     * @return An integer representing the unique ID.
     */
    public int getId() {
        return id;
    }

    /**
     * Returns the recipe title.
     *
     * @return A string representing the name of the dish.
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the recipe title.
     *
     * @param title The new name of the dish.
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Returns the estimated preparation time.
     *
     * @return A string representing the time (e.g., "30 mins").
     */
    public String getTime() {
        return time;
    }

    /**
     * Sets the estimated preparation time.
     *
     * @param time The new time string.
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * Returns the food category.
     *
     * @return A string representing the category (e.g., "Soups").
     */
    public String getCategory() {
        return category;
    }

    /**
     * Sets the food category.
     *
     * @param category The new category for the recipe.
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * Returns the difficulty level.
     *
     * @return A string representing the difficulty (e.g., "Easy").
     */
    public String getDifficulty() {
        return difficulty;
    }

    /**
     * Sets the difficulty level.
     *
     * @param difficulty The new difficulty level.
     */
    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    /**
     * Returns the path to the recipe's image.
     *
     * @return A string representing the file path or name.
     */
    public String getImagePath() {
        return imagePath;
    }

    /**
     * Sets the path for the recipe's image.
     *
     * @param imagePath The new path or filename for the image.
     */
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}