package com.mealmatch.mealmatch.model;


import java.util.ArrayList;
import java.util.List;

public record Recipe(String title, String time, String category, String difficulty, String imagePath,
                     List<String> dietaryTags, List<String> ingredients, List<String> steps) {
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
}