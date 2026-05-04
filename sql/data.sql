USE mealmatch_db;

-- Clear existing data to avoid duplicates if you run it multiple times
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE steps;
TRUNCATE TABLE ingredients;
TRUNCATE TABLE dietary_tags;
TRUNCATE TABLE user_favorites;
TRUNCATE TABLE recipes;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Authentic Basque Cheesecake', '12 hours', 'Desserts', 'Advanced', 'cheesecake.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, '1 kg Cream cheese (room temp)'),
       (@last_id, '400g Caster sugar'),
       (@last_id, '7 Large eggs (room temp)'),
       (@last_id, '500ml Heavy cream (35% fat)'),
       (@last_id, '1 tbsp Cornstarch (for GF)');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Gather ingredients and let them reach room temp. Preheat oven to 400°F (200°C). Prepare 9-inch pan with crumpled parchment.'),
       (@last_id, 2, 'Beat cream cheese and sugar for 5-7 mins until silky. Add eggs one at a time, mixing gently.'),
       (@last_id, 3,
        'Mix cream and cornstarch slurry, add to batter. Bake for 45-50 mins until top is burnt but center jiggles.'),
       (@last_id, 4, 'Cool at room temp for 3-4 hours, then refrigerate for at least 6 hours or overnight.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Fluffy Berry Pancakes', '15 min', 'Breakfast', 'Easy', 'pancakes.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, '1 cup flour'),
       (@last_id, '2 tbsp sugar'),
       (@last_id, '1 cup milk'),
       (@last_id, 'Fresh berries');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Mix dry ingredients in a large bowl.'),
       (@last_id, 2, 'Whisk in milk and eggs until smooth.'),
       (@last_id, 3, 'Cook on a hot griddle until bubbly.'),
       (@last_id, 4, 'Serve with fresh berries and syrup.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Chocolate Chip Waffles', '20 min', 'Breakfast', 'Easy', 'waffles.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'GF Flour'),
       (@last_id, 'Chocolate chips'),
       (@last_id, 'Eggs'),
       (@last_id, 'Butter');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Preheat your waffle iron.'),
       (@last_id, 2, 'Mix the batter and fold in chips.'),
       (@last_id, 3, 'Pour into iron and cook until golden.'),
       (@last_id, 4, 'Top with whipped cream and enjoy.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Margherita Pizza', '25 min', 'Main Courses', 'Easy', 'pizza.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pizza dough'),
       (@last_id, 'Tomato sauce'),
       (@last_id, 'Mozzarella'),
       (@last_id, 'Basil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Roll out the dough.'),
       (@last_id, 2, 'Spread sauce and add cheese.'),
       (@last_id, 3, 'Bake at 450°F until crisp.'),
       (@last_id, 4, 'Garnish with fresh basil.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Street Veggie Tacos', '30 min', 'Main Courses', 'Intermediate', 'tacos.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Corn tortillas'),
       (@last_id, 'Black beans'),
       (@last_id, 'Avocado'),
       (@last_id, 'Lime');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Warm tortillas.'),
       (@last_id, 2, 'Season beans with chili and lime.'),
       (@last_id, 3, 'Fill tortillas with beans and avocado.'),
       (@last_id, 4, 'Top with cilantro.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Roasted Pumpkin Soup', '45 min', 'Soups', 'Intermediate', 'soup.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pumpkin'),
       (@last_id, 'Coconut milk'),
       (@last_id, 'Ginger'),
       (@last_id, 'Vegetable broth');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Roast pumpkin chunks.'),
       (@last_id, 2, 'Sauté ginger and pumpkin.'),
       (@last_id, 3, 'Simmer and blend until smooth.'),
       (@last_id, 4, 'Stir in coconut milk.');
INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mediterranean Quinoa Salad', '20 min', 'Main Courses', 'Easy', 'quinoa-salad.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Quinoa'),
       (@last_id, 'Cucumber'),
       (@last_id, 'Kalamata olives'),
       (@last_id, 'Lemon juice');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Boil quinoa.'),
       (@last_id, 2, 'Chop veggies and mix with dressing.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Zucchini Zoodles Pasta', '15 min', 'Main Courses', 'Easy', 'zucchini-pasta.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Zucchini'),
       (@last_id, 'Pesto sauce'),
       (@last_id, 'Cherry tomatoes');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Spiralize zucchini.'),
       (@last_id, 2, 'Sauté quickly with pesto.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Honey Glazed Salmon', '25 min', 'Main Courses', 'Intermediate', 'salmon.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Salmon fillet'),
       (@last_id, 'Honey'),
       (@last_id, 'Soy sauce (GF)'),
       (@last_id, 'Garlic');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Marinate salmon.'),
       (@last_id, 2, 'Pan-sear until flaky.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Thai Green Curry', '40 min', 'Main Courses', 'Intermediate', 'curry.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Green curry paste'),
       (@last_id, 'Coconut milk'),
       (@last_id, 'Tofu cubes'),
       (@last_id, 'Bamboo shoots'),
       (@last_id, 'Thai basil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Fry the curry paste in a splash of coconut cream until fragrant.'),
       (@last_id, 2, 'Add the rest of the coconut milk and bring to a simmer.'),
       (@last_id, 3, 'Add tofu and vegetables, cooking until tender.'),
       (@last_id, 4, 'Finish with fresh basil and serve with jasmine rice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Garden Veggie Pizza', '35 min', 'Main Courses', 'Easy', 'veggie-pizza.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pizza dough'),
       (@last_id, 'Bell peppers'),
       (@last_id, 'Zucchini'),
       (@last_id, 'Mushrooms'),
       (@last_id, 'Black olives');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Chop all vegetables into small, even pieces.'),
       (@last_id, 2, 'Spread tomato sauce and layer veggies over the dough.'),
       (@last_id, 3, 'Bake at 425°F for 15-20 minutes until crust is golden.'),
       (@last_id, 4, 'Slice and serve immediately.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Creamy Tomato Basil', '30 min', 'Soups', 'Easy', 'tomato-basil.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'San Marzano tomatoes'),
       (@last_id, 'Fresh basil'),
       (@last_id, 'Heavy cream'),
       (@last_id, 'Garlic cloves');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté garlic and onions until translucent.'),
       (@last_id, 2, 'Add crushed tomatoes and simmer for 20 minutes.'),
       (@last_id, 3, 'Blend the mixture until completely smooth.'),
       (@last_id, 4, 'Stir in heavy cream and hand-torn basil leaves.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Autumn Mushroom Soup', '55 min', 'Soups', 'Intermediate', 'autumn-soup.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Mixed wild mushrooms'),
       (@last_id, 'Fresh thyme'),
       (@last_id, 'Vegetable stock'),
       (@last_id, 'Shallots');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté mushrooms with thyme until all water evaporates and they brown.'),
       (@last_id, 2, 'Deglaze the pan with a bit of stock and add the rest of the liquid.'),
       (@last_id, 3, 'Simmer on low heat to develop a deep earthy flavor.'),
       (@last_id, 4, 'Blend half of the soup to create a thick, creamy base with chunks.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Avocado Toast Deluxe', '10 min', 'Breakfast', 'Easy', 'avocado-toast.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Thick sourdough bread'),
       (@last_id, 'Ripe Hass avocado'),
       (@last_id, 'Red pepper flakes'),
       (@last_id, 'Radish slices');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Toast the sourdough until dark and crunchy.'),
       (@last_id, 2, 'Mash the avocado with a pinch of salt and lemon juice.'),
       (@last_id, 3, 'Spread generously over the toast.'),
       (@last_id, 4, 'Top with chili flakes, radish, and a drizzle of olive oil.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mixed Berry Sorbet', '4 hours', 'Desserts', 'Easy', 'berry-sorbet.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Frozen mixed berries'),
       (@last_id, 'Simple syrup'),
       (@last_id, 'Lemon juice');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Place frozen berries in a high-speed blender.'),
       (@last_id, 2, 'Add lemon juice and a bit of syrup.'),
       (@last_id, 3, 'Process until smooth, adding syrup as needed.'),
       (@last_id, 4, 'Freeze for 3 hours before serving for the perfect texture.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spicy Beef Stir-Fry', '25 min', 'Main Courses', 'Intermediate', 'spicy-beef.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Flank steak, sliced'),
       (@last_id, 'Broccoli florets'),
       (@last_id, 'Soy sauce'),
       (@last_id, 'Chili flakes');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sear the beef slices in a hot wok until browned.'),
       (@last_id, 2, 'Add broccoli and stir-fry until tender-crisp.'),
       (@last_id, 3, 'Toss with soy sauce and chili flakes.'),
       (@last_id, 4, 'Serve immediately over warm rice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Vegan Lentil Shepherd''s Pie', '1 hour', 'Main Courses', 'Intermediate', 'vegan-lentil.jpeg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Brown lentils'),
       (@last_id, 'Carrots and peas'),
       (@last_id, 'Mashed potatoes (dairy-free)'),
       (@last_id, 'Vegetable broth');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Simmer lentils and chopped vegetables in vegetable broth until cooked.'),
       (@last_id, 2, 'Transfer the lentil mixture into the base of a baking dish.'),
       (@last_id, 3, 'Spread a thick layer of dairy-free mashed potatoes on top.'),
       (@last_id, 4, 'Bake at 400°F (200°C) for 20 minutes until the top is golden and crispy.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mango Smoothie Bowl', '10 min', 'Breakfast', 'Easy', 'mango-bowl.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Frozen mango chunks'),
       (@last_id, 'Almond milk'),
       (@last_id, 'Chia seeds'),
       (@last_id, 'Gluten-free granola');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Add frozen mango and a splash of almond milk to a blender.'),
       (@last_id, 2, 'Blend on high until thick and completely smooth.'),
       (@last_id, 3, 'Pour the smoothie mixture into a shallow bowl.'),
       (@last_id, 4, 'Garnish with chia seeds, granola, and extra fresh fruit.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Lemon Garlic Butter Shrimp', '15 min', 'Main Courses', 'Easy', 'shrimp.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Large shrimp, peeled and deveined'),
       (@last_id, 'Unsalted butter'),
       (@last_id, 'Garlic cloves, minced'),
       (@last_id, 'Fresh lemon juice');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Melt butter in a large skillet over medium heat.'),
       (@last_id, 2, 'Add minced garlic and sauté for 1 minute until fragrant.'),
       (@last_id, 3, 'Add shrimp in an even layer and cook until they turn pink and opaque.'),
       (@last_id, 4, 'Remove from heat, drizzle with fresh lemon juice, and toss to coat.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Caprese Panini', '15 min', 'Main Courses', 'Easy', 'caprese.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Ciabatta bread'),
       (@last_id, 'Fresh mozzarella'),
       (@last_id, 'Tomato slices'),
       (@last_id, 'Pesto and balsamic glaze');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Slice the ciabatta and spread pesto on both sides.'),
       (@last_id, 2, 'Layer mozzarella and tomato slices.'),
       (@last_id, 3, 'Drizzle with balsamic glaze and close the sandwich.'),
       (@last_id, 4, 'Press in a panini grill until the cheese melts.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Creamy Mushroom Risotto', '40 min', 'Main Courses', 'Intermediate', 'risotto.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Arborio rice'),
       (@last_id, 'Vegetable broth (warm)'),
       (@last_id, 'Cremini mushrooms'),
       (@last_id, 'Parmesan cheese');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté mushrooms until browned, then remove from pan and set aside.'),
       (@last_id, 2, 'Toast Arborio rice in the pan with olive oil for 2 minutes.'),
       (@last_id, 3, 'Gradually add warm broth one ladle at a time, stirring continuously.'),
       (@last_id, 4, 'Once rice is tender and creamy, fold in mushrooms and parmesan.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Teriyaki Chicken Bowl', '25 min', 'Main Courses', 'Easy', 'teriyaki-bowl.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breast, diced'),
       (@last_id, 'Teriyaki sauce'),
       (@last_id, 'Jasmine rice'),
       (@last_id, 'Sesame seeds and green onions');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cook the jasmine rice according to package instructions.'),
       (@last_id, 2, 'Pan-fry the diced chicken breast until golden and cooked through.'),
       (@last_id, 3, 'Pour teriyaki sauce over the chicken and simmer until the sauce thickens.'),
       (@last_id, 4, 'Serve chicken over rice, garnished with sesame seeds and green onions.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Tiramisu', '4 hours', 'Desserts', 'Intermediate', 'tiramisu.jpeg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Espresso coffee (cooled)'),
       (@last_id, 'Ladyfingers (Savoiardi)'),
       (@last_id, 'Mascarpone cheese'),
       (@last_id, 'Cocoa powder');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Whisk egg yolks and sugar until pale, then fold in mascarpone.'),
       (@last_id, 2, 'Dip ladyfingers briefly in cooled espresso and layer in a dish.'),
       (@last_id, 3, 'Spread a layer of the mascarpone cream over the ladyfingers.'),
       (@last_id, 4, 'Repeat layers, chill for 4 hours, and dust with cocoa powder before serving.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spinach Stuffed Chicken', '35 min', 'Main Courses', 'Intermediate', 'stuffed-chicken.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breasts'),
       (@last_id, 'Fresh spinach'),
       (@last_id, 'Cream cheese'),
       (@last_id, 'Garlic powder');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cut a pocket into the side of each chicken breast.'),
       (@last_id, 2, 'Mix cream cheese, chopped spinach, and garlic powder.'),
       (@last_id, 3, 'Stuff the mixture into the chicken pockets and secure with toothpicks.'),
       (@last_id, 4, 'Bake at 375°F (190°C) for 25-30 minutes until chicken is cooked through.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Black Bean Burrito Bowl', '15 min', 'Main Courses', 'Easy', 'burrito-bowl.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Canned black beans (rinsed)'),
       (@last_id, 'Cooked brown rice'),
       (@last_id, 'Corn kernels'),
       (@last_id, 'Pico de gallo');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Warm the black beans and corn in a small skillet.'),
       (@last_id, 2, 'Divide the cooked brown rice into serving bowls.'),
       (@last_id, 3, 'Top with beans, corn, and a generous scoop of pico de gallo.'),
       (@last_id, 4, 'Garnish with fresh cilantro and a squeeze of lime juice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Garlic Butter Baked Salmon', '20 min', 'Main Courses', 'Easy', 'salmon.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Salmon fillets'),
       (@last_id, 'Melted butter'),
       (@last_id, 'Minced garlic'),
       (@last_id, 'Fresh parsley');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Preheat oven to 400°F (200°C) and line a baking sheet with foil.'),
       (@last_id, 2, 'Place salmon on the foil and season with salt and pepper.'),
       (@last_id, 3, 'Whisk melted butter, garlic, and parsley, then pour over the salmon.'),
       (@last_id, 4, 'Bake for 12-15 minutes until the salmon flakes easily with a fork.');


# Same items
INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Authentic Basque Cheesecake', '12 hours', 'Desserts', 'Advanced', 'cheesecake.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, '1 kg Cream cheese (room temp)'),
       (@last_id, '400g Caster sugar'),
       (@last_id, '7 Large eggs (room temp)'),
       (@last_id, '500ml Heavy cream (35% fat)'),
       (@last_id, '1 tbsp Cornstarch (for GF)');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Gather ingredients and let them reach room temp. Preheat oven to 400°F (200°C). Prepare 9-inch pan with crumpled parchment.'),
       (@last_id, 2, 'Beat cream cheese and sugar for 5-7 mins until silky. Add eggs one at a time, mixing gently.'),
       (@last_id, 3,
        'Mix cream and cornstarch slurry, add to batter. Bake for 45-50 mins until top is burnt but center jiggles.'),
       (@last_id, 4, 'Cool at room temp for 3-4 hours, then refrigerate for at least 6 hours or overnight.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Fluffy Berry Pancakes', '15 min', 'Breakfast', 'Easy', 'pancakes.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, '1 cup flour'),
       (@last_id, '2 tbsp sugar'),
       (@last_id, '1 cup milk'),
       (@last_id, 'Fresh berries');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Mix dry ingredients in a large bowl.'),
       (@last_id, 2, 'Whisk in milk and eggs until smooth.'),
       (@last_id, 3, 'Cook on a hot griddle until bubbly.'),
       (@last_id, 4, 'Serve with fresh berries and syrup.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Chocolate Chip Waffles', '20 min', 'Breakfast', 'Easy', 'waffles.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'GF Flour'),
       (@last_id, 'Chocolate chips'),
       (@last_id, 'Eggs'),
       (@last_id, 'Butter');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Preheat your waffle iron.'),
       (@last_id, 2, 'Mix the batter and fold in chips.'),
       (@last_id, 3, 'Pour into iron and cook until golden.'),
       (@last_id, 4, 'Top with whipped cream and enjoy.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Margherita Pizza', '25 min', 'Main Courses', 'Easy', 'pizza.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pizza dough'),
       (@last_id, 'Tomato sauce'),
       (@last_id, 'Mozzarella'),
       (@last_id, 'Basil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Roll out the dough.'),
       (@last_id, 2, 'Spread sauce and add cheese.'),
       (@last_id, 3, 'Bake at 450°F until crisp.'),
       (@last_id, 4, 'Garnish with fresh basil.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Street Veggie Tacos', '30 min', 'Main Courses', 'Intermediate', 'tacos.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Corn tortillas'),
       (@last_id, 'Black beans'),
       (@last_id, 'Avocado'),
       (@last_id, 'Lime');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Warm tortillas.'),
       (@last_id, 2, 'Season beans with chili and lime.'),
       (@last_id, 3, 'Fill tortillas with beans and avocado.'),
       (@last_id, 4, 'Top with cilantro.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Roasted Pumpkin Soup', '45 min', 'Soups', 'Intermediate', 'soup.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pumpkin'),
       (@last_id, 'Coconut milk'),
       (@last_id, 'Ginger'),
       (@last_id, 'Vegetable broth');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Roast pumpkin chunks.'),
       (@last_id, 2, 'Sauté ginger and pumpkin.'),
       (@last_id, 3, 'Simmer and blend until smooth.'),
       (@last_id, 4, 'Stir in coconut milk.');
INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mediterranean Quinoa Salad', '20 min', 'Main Courses', 'Easy', 'quinoa-salad.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Quinoa'),
       (@last_id, 'Cucumber'),
       (@last_id, 'Kalamata olives'),
       (@last_id, 'Lemon juice');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Boil quinoa.'),
       (@last_id, 2, 'Chop veggies and mix with dressing.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Zucchini Zoodles Pasta', '15 min', 'Main Courses', 'Easy', 'zucchini-pasta.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Zucchini'),
       (@last_id, 'Pesto sauce'),
       (@last_id, 'Cherry tomatoes');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Spiralize zucchini.'),
       (@last_id, 2, 'Sauté quickly with pesto.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Honey Glazed Salmon', '25 min', 'Main Courses', 'Intermediate', 'salmon.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Salmon fillet'),
       (@last_id, 'Honey'),
       (@last_id, 'Soy sauce (GF)'),
       (@last_id, 'Garlic');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Marinate salmon.'),
       (@last_id, 2, 'Pan-sear until flaky.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Thai Green Curry', '40 min', 'Main Courses', 'Intermediate', 'curry.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Green curry paste'),
       (@last_id, 'Coconut milk'),
       (@last_id, 'Tofu cubes'),
       (@last_id, 'Bamboo shoots'),
       (@last_id, 'Thai basil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Fry the curry paste in a splash of coconut cream until fragrant.'),
       (@last_id, 2, 'Add the rest of the coconut milk and bring to a simmer.'),
       (@last_id, 3, 'Add tofu and vegetables, cooking until tender.'),
       (@last_id, 4, 'Finish with fresh basil and serve with jasmine rice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Garden Veggie Pizza', '35 min', 'Main Courses', 'Easy', 'veggie-pizza.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pizza dough'),
       (@last_id, 'Bell peppers'),
       (@last_id, 'Zucchini'),
       (@last_id, 'Mushrooms'),
       (@last_id, 'Black olives');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Chop all vegetables into small, even pieces.'),
       (@last_id, 2, 'Spread tomato sauce and layer veggies over the dough.'),
       (@last_id, 3, 'Bake at 425°F for 15-20 minutes until crust is golden.'),
       (@last_id, 4, 'Slice and serve immediately.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Creamy Tomato Basil', '30 min', 'Soups', 'Easy', 'tomato-basil.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'San Marzano tomatoes'),
       (@last_id, 'Fresh basil'),
       (@last_id, 'Heavy cream'),
       (@last_id, 'Garlic cloves');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté garlic and onions until translucent.'),
       (@last_id, 2, 'Add crushed tomatoes and simmer for 20 minutes.'),
       (@last_id, 3, 'Blend the mixture until completely smooth.'),
       (@last_id, 4, 'Stir in heavy cream and hand-torn basil leaves.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Autumn Mushroom Soup', '55 min', 'Soups', 'Intermediate', 'autumn-soup.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Mixed wild mushrooms'),
       (@last_id, 'Fresh thyme'),
       (@last_id, 'Vegetable stock'),
       (@last_id, 'Shallots');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté mushrooms with thyme until all water evaporates and they brown.'),
       (@last_id, 2, 'Deglaze the pan with a bit of stock and add the rest of the liquid.'),
       (@last_id, 3, 'Simmer on low heat to develop a deep earthy flavor.'),
       (@last_id, 4, 'Blend half of the soup to create a thick, creamy base with chunks.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Avocado Toast Deluxe', '10 min', 'Breakfast', 'Easy', 'avocado-toast.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Thick sourdough bread'),
       (@last_id, 'Ripe Hass avocado'),
       (@last_id, 'Red pepper flakes'),
       (@last_id, 'Radish slices');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Toast the sourdough until dark and crunchy.'),
       (@last_id, 2, 'Mash the avocado with a pinch of salt and lemon juice.'),
       (@last_id, 3, 'Spread generously over the toast.'),
       (@last_id, 4, 'Top with chili flakes, radish, and a drizzle of olive oil.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mixed Berry Sorbet', '4 hours', 'Desserts', 'Easy', 'berry-sorbet.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Frozen mixed berries'),
       (@last_id, 'Simple syrup'),
       (@last_id, 'Lemon juice');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Place frozen berries in a high-speed blender.'),
       (@last_id, 2, 'Add lemon juice and a bit of syrup.'),
       (@last_id, 3, 'Process until smooth, adding syrup as needed.'),
       (@last_id, 4, 'Freeze for 3 hours before serving for the perfect texture.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spicy Beef Stir-Fry', '25 min', 'Main Courses', 'Intermediate', 'spicy-beef.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Flank steak, sliced'),
       (@last_id, 'Broccoli florets'),
       (@last_id, 'Soy sauce'),
       (@last_id, 'Chili flakes');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sear the beef slices in a hot wok until browned.'),
       (@last_id, 2, 'Add broccoli and stir-fry until tender-crisp.'),
       (@last_id, 3, 'Toss with soy sauce and chili flakes.'),
       (@last_id, 4, 'Serve immediately over warm rice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Vegan Lentil Shepherd''s Pie', '1 hour', 'Main Courses', 'Intermediate', 'vegan-lentil.jpeg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Brown lentils'),
       (@last_id, 'Carrots and peas'),
       (@last_id, 'Mashed potatoes (dairy-free)'),
       (@last_id, 'Vegetable broth');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Simmer lentils and chopped vegetables in vegetable broth until cooked.'),
       (@last_id, 2, 'Transfer the lentil mixture into the base of a baking dish.'),
       (@last_id, 3, 'Spread a thick layer of dairy-free mashed potatoes on top.'),
       (@last_id, 4, 'Bake at 400°F (200°C) for 20 minutes until the top is golden and crispy.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Mango Smoothie Bowl', '10 min', 'Breakfast', 'Easy', 'mango-bowl.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Frozen mango chunks'),
       (@last_id, 'Almond milk'),
       (@last_id, 'Chia seeds'),
       (@last_id, 'Gluten-free granola');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Add frozen mango and a splash of almond milk to a blender.'),
       (@last_id, 2, 'Blend on high until thick and completely smooth.'),
       (@last_id, 3, 'Pour the smoothie mixture into a shallow bowl.'),
       (@last_id, 4, 'Garnish with chia seeds, granola, and extra fresh fruit.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Lemon Garlic Butter Shrimp', '15 min', 'Main Courses', 'Easy', 'shrimp.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Large shrimp, peeled and deveined'),
       (@last_id, 'Unsalted butter'),
       (@last_id, 'Garlic cloves, minced'),
       (@last_id, 'Fresh lemon juice');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Melt butter in a large skillet over medium heat.'),
       (@last_id, 2, 'Add minced garlic and sauté for 1 minute until fragrant.'),
       (@last_id, 3, 'Add shrimp in an even layer and cook until they turn pink and opaque.'),
       (@last_id, 4, 'Remove from heat, drizzle with fresh lemon juice, and toss to coat.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Caprese Panini', '15 min', 'Main Courses', 'Easy', 'caprese.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Ciabatta bread'),
       (@last_id, 'Fresh mozzarella'),
       (@last_id, 'Tomato slices'),
       (@last_id, 'Pesto and balsamic glaze');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Slice the ciabatta and spread pesto on both sides.'),
       (@last_id, 2, 'Layer mozzarella and tomato slices.'),
       (@last_id, 3, 'Drizzle with balsamic glaze and close the sandwich.'),
       (@last_id, 4, 'Press in a panini grill until the cheese melts.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Creamy Mushroom Risotto', '40 min', 'Main Courses', 'Intermediate', 'risotto.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Arborio rice'),
       (@last_id, 'Vegetable broth (warm)'),
       (@last_id, 'Cremini mushrooms'),
       (@last_id, 'Parmesan cheese');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Sauté mushrooms until browned, then remove from pan and set aside.'),
       (@last_id, 2, 'Toast Arborio rice in the pan with olive oil for 2 minutes.'),
       (@last_id, 3, 'Gradually add warm broth one ladle at a time, stirring continuously.'),
       (@last_id, 4, 'Once rice is tender and creamy, fold in mushrooms and parmesan.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Teriyaki Chicken Bowl', '25 min', 'Main Courses', 'Easy', 'teriyaki-bowl.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breast, diced'),
       (@last_id, 'Teriyaki sauce'),
       (@last_id, 'Jasmine rice'),
       (@last_id, 'Sesame seeds and green onions');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cook the jasmine rice according to package instructions.'),
       (@last_id, 2, 'Pan-fry the diced chicken breast until golden and cooked through.'),
       (@last_id, 3, 'Pour teriyaki sauce over the chicken and simmer until the sauce thickens.'),
       (@last_id, 4, 'Serve chicken over rice, garnished with sesame seeds and green onions.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Tiramisu', '4 hours', 'Desserts', 'Intermediate', 'tiramisu.jpeg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Espresso coffee (cooled)'),
       (@last_id, 'Ladyfingers (Savoiardi)'),
       (@last_id, 'Mascarpone cheese'),
       (@last_id, 'Cocoa powder');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Whisk egg yolks and sugar until pale, then fold in mascarpone.'),
       (@last_id, 2, 'Dip ladyfingers briefly in cooled espresso and layer in a dish.'),
       (@last_id, 3, 'Spread a layer of the mascarpone cream over the ladyfingers.'),
       (@last_id, 4, 'Repeat layers, chill for 4 hours, and dust with cocoa powder before serving.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spinach Stuffed Chicken', '35 min', 'Main Courses', 'Intermediate', 'stuffed-chicken.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breasts'),
       (@last_id, 'Fresh spinach'),
       (@last_id, 'Cream cheese'),
       (@last_id, 'Garlic powder');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cut a pocket into the side of each chicken breast.'),
       (@last_id, 2, 'Mix cream cheese, chopped spinach, and garlic powder.'),
       (@last_id, 3, 'Stuff the mixture into the chicken pockets and secure with toothpicks.'),
       (@last_id, 4, 'Bake at 375°F (190°C) for 25-30 minutes until chicken is cooked through.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Black Bean Burrito Bowl', '15 min', 'Main Courses', 'Easy', 'burrito-bowl.jpg');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Canned black beans (rinsed)'),
       (@last_id, 'Cooked brown rice'),
       (@last_id, 'Corn kernels'),
       (@last_id, 'Pico de gallo');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Warm the black beans and corn in a small skillet.'),
       (@last_id, 2, 'Divide the cooked brown rice into serving bowls.'),
       (@last_id, 3, 'Top with beans, corn, and a generous scoop of pico de gallo.'),
       (@last_id, 4, 'Garnish with fresh cilantro and a squeeze of lime juice.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Garlic Butter Baked Salmon', '20 min', 'Main Courses', 'Easy', 'salmon.png');
SET @last_id = LAST_INSERT_ID();

INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');

INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Salmon fillets'),
       (@last_id, 'Melted butter'),
       (@last_id, 'Minced garlic'),
       (@last_id, 'Fresh parsley');

INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Preheat oven to 400°F (200°C) and line a baking sheet with foil.'),
       (@last_id, 2, 'Place salmon on the foil and season with salt and pepper.'),
       (@last_id, 3, 'Whisk melted butter, garlic, and parsley, then pour over the salmon.'),
       (@last_id, 4, 'Bake for 12-15 minutes until the salmon flakes easily with a fork.');