package com.mealmatch.mealmatch.model;

import java.util.ArrayList;
import java.util.List;

public class Recipe {
    private String title;
    private String time;
    private String category;
    private String difficulty;
    private String imagePath;
    private List<String> dietaryTags;

    public Recipe(String title, String time, String category, String difficulty, String imagePath, List<String> dietaryTags) {
        this.title = title;
        this.time = time;
        this.category = category;
        this.difficulty = difficulty;
        this.imagePath = imagePath;
        this.dietaryTags = (dietaryTags != null) ? dietaryTags : new ArrayList<>();
    }

    public String getTitle() { return title; }
    public String getTime() { return time; }
    public String getCategory() { return category; }
    public String getDifficulty() { return difficulty; }
    public String getImagePath() { return imagePath; }
    public List<String> getDietaryTags() { return dietaryTags; }

    public boolean isVegetarian() { return dietaryTags.contains("Vegetarian"); }
    public boolean isVegan() { return dietaryTags.contains("Vegan"); }
    public boolean isGlutenFree() { return dietaryTags.contains("Gluten Free"); }
}