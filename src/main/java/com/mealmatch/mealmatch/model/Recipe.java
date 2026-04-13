package com.mealmatch.mealmatch.model;

import java.util.ArrayList;
import java.util.List;

public class Recipe {
    private final String title;
    private final String time;
    private final String category;
    private final String difficulty;
    private final String imagePath;
    private final List<String> dietaryTags;
    private final List<String> ingredients;
    private final List<String> steps;

    public Recipe(String title, String time, String category, String difficulty, String imagePath, List<String> dietaryTags,
                  List<String> ingredients, List<String> steps) {
        this.title = title;
        this.time = time;
        this.category = category;
        this.difficulty = difficulty;
        this.imagePath = imagePath;
        this.dietaryTags = (dietaryTags != null) ? dietaryTags : new ArrayList<>();
        this.ingredients = (ingredients != null) ? ingredients : new ArrayList<>();
        this.steps = (steps != null) ? steps : new ArrayList<>();
    }

    public String title() {
        return title;
    }

    public String time() {
        return time;
    }

    public String category() {
        return category;
    }

    public String difficulty() {
        return difficulty;
    }

    public String imagePath() {
        return imagePath;
    }

    public List<String> dietaryTags() {
        return dietaryTags;
    }

    public boolean isVegetarian() {
        return dietaryTags.contains("Vegetarian");
    }

    public boolean isVegan() {
        return dietaryTags.contains("Vegan");
    }

    public boolean isGlutenFree() {
        return dietaryTags.contains("Gluten Free");
    }

    public List<String> ingredients() {
        return ingredients;
    }

    public List<String> steps() {
        return steps;
    }
}