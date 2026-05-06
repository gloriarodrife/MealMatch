USE mealmatch_db;

-- 1. Clear existing data to avoid duplicates
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE user_favorites;
TRUNCATE TABLE steps;
TRUNCATE TABLE ingredients;
TRUNCATE TABLE dietary_tags;
TRUNCATE TABLE recipes;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Create users table with bio column directly (avoids running ALTER TABLE multiple times)
CREATE TABLE IF NOT EXISTS users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30)  NOT NULL UNIQUE,
    email    VARCHAR(60)  NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio      VARCHAR(255) DEFAULT ''
);

INSERT INTO users (username, email, password, bio)
VALUES ('Gloria Rodriguez', 'gloria@wcc.edu', '1234',
        'CS student. On a quest to bake the perfect Basque Cheesecake! 🍰'),
       ('Laura Sosa', 'laura@mealmatch.com', 'admin123',
        'MealMatch co-creator! Passionate about clean code and great recipes.'),
       ('Miller Steven', 'miller@wcc.edu', 'havefun',
        'Amateur cook. Always looking for quick and easy meals between classes.'),
       ('Lauren', 'lauren@example.com', 'chicken', 'Just here for the good food and dessert recommendations.'),
       ('Mario', 'mario@example.com', 'pass123', 'Trying to survive college on a ramen budget. Need cheap recipes! 🍜'),
       ('Prof. Smith', 'smith@wcc.edu', 'qwerty', 'Looking for healthy meal prep ideas for the week.');


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
VALUES (@last_id, 1,
        'In a large mixing bowl, sift together the flour, sugar, baking powder, and a pinch of salt to prevent any lumps.'),
       (@last_id, 2,
        'In a separate smaller bowl, whisk the milk, eggs, and a dash of vanilla extract until completely smooth and well combined.'),
       (@last_id, 3,
        'Create a well in the center of the dry ingredients, pour in the wet mixture, and fold gently just until incorporated (do not overmix).'),
       (@last_id, 4,
        'Heat a lightly buttered griddle over medium heat. Pour 1/4 cup of batter per pancake and cook until bubbles form on the surface, then flip and cook until golden brown. Serve immediately with fresh berries and warm maple syrup.');

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
VALUES (@last_id, 1,
        'Preheat your waffle iron to the desired temperature setting and lightly coat it with non-stick spray or melted butter.'),
       (@last_id, 2,
        'In a large bowl, whisk together the gluten-free flour, baking powder, and salt. In another bowl, beat the eggs and melted butter, then combine both mixtures.'),
       (@last_id, 3,
        'Gently fold the chocolate chips into the batter, ensuring they are evenly distributed without overworking the dough.'),
       (@last_id, 4,
        'Pour the appropriate amount of batter into the center of the hot waffle iron. Close the lid and cook until the steam stops and the waffle is golden and crispy. Top with whipped cream before serving.');

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
VALUES (@last_id, 1,
        'Place a pizza stone in the oven and preheat to its highest setting (around 450°F to 500°F) for at least 30 minutes.'),
       (@last_id, 2,
        'On a lightly floured surface, gently stretch and roll out the pizza dough into a 12-inch circle, keeping the edges slightly thicker for the crust.'),
       (@last_id, 3,
        'Spread a thin, even layer of tomato sauce over the dough, leaving a 1-inch border. Distribute slices of fresh mozzarella evenly across the sauce.'),
       (@last_id, 4,
        'Carefully transfer the pizza to the hot stone and bake for 8-10 minutes until the crust is blistered and the cheese is bubbling. Garnish with fresh basil leaves as soon as it comes out of the oven.');

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
VALUES (@last_id, 1,
        'Warm the corn tortillas in a dry skillet over medium-high heat for about 30 seconds per side until they are soft and slightly charred, then wrap in a clean towel to keep warm.'),
       (@last_id, 2,
        'In a small saucepan, heat the black beans along with a pinch of cumin, chili powder, and a squeeze of fresh lime juice, mashing them slightly to thicken.'),
       (@last_id, 3,
        'Halve the avocados, remove the pit, and slice the flesh into thick wedges. Toss them lightly in lime juice to prevent browning.'),
       (@last_id, 4,
        'Assemble the tacos by spooning the seasoned black beans onto the warm tortillas, adding the avocado slices, and garnishing with freshly chopped cilantro and diced white onions.');

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
VALUES (@last_id, 1,
        'Preheat the oven to 400°F (200°C). Toss the pumpkin chunks with olive oil, salt, and pepper, and roast on a baking sheet for 25-30 minutes until deeply tender and slightly caramelized.'),
       (@last_id, 2,
        'In a large heavy-bottomed pot, heat a splash of oil over medium heat. Add freshly grated ginger and minced garlic, sautéing for 2 minutes until fragrant.'),
       (@last_id, 3,
        'Transfer the roasted pumpkin to the pot and pour in the vegetable broth. Bring to a gentle simmer, then use an immersion blender to puree the mixture until completely smooth and velvety.'),
       (@last_id, 4,
        'Lower the heat, stir in the coconut milk, and let it warm through for 5 minutes without boiling. Adjust seasoning to taste and serve with a drizzle of extra coconut milk on top.');

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
VALUES (@last_id, 1,
        'Rinse the quinoa thoroughly under cold water. Combine with water or vegetable broth in a saucepan, bring to a boil, then cover and simmer on low for 15 minutes until the liquid is absorbed and the quinoa is fluffy.'),
       (@last_id, 2,
        'While the quinoa cools, dice the cucumber, halve the Kalamata olives, and finely chop any additional vegetables like red onions or cherry tomatoes.'),
       (@last_id, 3,
        'In a small jar, vigorously shake together the freshly squeezed lemon juice, extra virgin olive oil, minced garlic, dried oregano, salt, and black pepper to create the dressing.'),
       (@last_id, 4,
        'In a large serving bowl, gently toss the cooled quinoa with the chopped vegetables and pour the dressing over the top. Stir well to combine and let it sit for 10 minutes so the flavors meld before serving.');

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
VALUES (@last_id, 1,
        'Wash the zucchini thoroughly, trim the ends, and use a spiralizer to cut them into long, noodle-like strands. Pat them dry with a paper towel to remove excess moisture.'),
       (@last_id, 2,
        'Heat a large skillet over medium-high heat with a drizzle of olive oil. Add the cherry tomatoes and cook for 3-4 minutes until they begin to blister and burst.'),
       (@last_id, 3,
        'Add the zucchini noodles to the skillet and toss quickly for no more than 1 to 2 minutes to warm them through without letting them become soggy.'),
       (@last_id, 4,
        'Remove the skillet from the heat immediately. Add generous spoonfuls of vegan pesto sauce, tossing everything gently until the zoodles are evenly coated. Serve right away.');

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
VALUES (@last_id, 1,
        'In a small mixing bowl, whisk together the honey, gluten-free soy sauce, freshly minced garlic, and a splash of rice vinegar to create a smooth marinade.'),
       (@last_id, 2,
        'Place the salmon fillets in a shallow dish, pour half of the marinade over them, and let them rest at room temperature for 10-15 minutes so the flavors can penetrate the fish.'),
       (@last_id, 3,
        'Heat a non-stick skillet over medium-high heat with a small amount of oil. Place the salmon flesh-side down and sear for 3-4 minutes until a crust forms, then carefully flip to the skin side.'),
       (@last_id, 4,
        'Pour the remaining marinade into the pan, allowing it to bubble and reduce into a thick, sticky glaze. Spoon the glaze continuously over the salmon as it finishes cooking for 2 more minutes. Serve warm.');

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
VALUES (@last_id, 1,
        'Scoop the thick cream from the top of the canned coconut milk and heat it in a wok or large pot over medium heat until it begins to bubble and release its oils.'),
       (@last_id, 2,
        'Add the green curry paste to the hot coconut cream, stirring continuously for 2-3 minutes until it becomes highly fragrant and the oils separate slightly from the paste.'),
       (@last_id, 3,
        'Pour in the remaining coconut milk along with the bamboo shoots, cubed firm tofu, and a pinch of sugar. Lower the heat and let the curry simmer gently for 10-15 minutes so the tofu absorbs the flavor.'),
       (@last_id, 4,
        'Remove the pot from the heat. Stir in a generous handful of fresh Thai basil leaves and a squeeze of lime juice right before serving. Serve hot alongside steamed jasmine rice.');

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
VALUES (@last_id, 1,
        'Preheat your oven to 425°F (220°C). Thoroughly wash all the vegetables and chop the bell peppers, zucchini, and mushrooms into small, uniform pieces to ensure they cook evenly.'),
       (@last_id, 2,
        'Stretch or roll out the pizza dough onto a lightly greased baking sheet or a pizza stone. Spread a generous layer of your favorite tomato sauce evenly across the base.'),
       (@last_id, 3,
        'Layer the chopped vegetables over the sauce, ensuring the mushrooms are on top so they can release their moisture without making the crust soggy. Scatter the sliced black olives across the pizza.'),
       (@last_id, 4,
        'Bake in the preheated oven for 15-20 minutes, monitoring closely until the crust is golden brown and the vegetables are tender-crisp. Slice into triangles and serve immediately.');

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
VALUES (@last_id, 1,
        'In a large Dutch oven or soup pot, melt a knob of butter over medium heat. Add diced onions and minced garlic, sautéing for 5-7 minutes until they are completely translucent and soft.'),
       (@last_id, 2,
        'Pour in the crushed San Marzano tomatoes, season with salt and freshly cracked black pepper, and bring the mixture to a rolling boil. Reduce the heat to low, cover, and let it simmer gently for 20 minutes to deepen the flavor.'),
       (@last_id, 3,
        'Carefully transfer the hot soup to a stand blender or use an immersion blender directly in the pot, blending on high until the texture is perfectly smooth and silky.'),
       (@last_id, 4,
        'Return the blended soup to low heat. Slowly stir in the heavy cream and a generous handful of hand-torn fresh basil leaves. Heat for 2 more minutes without letting it boil, then serve warm with crusty bread.');

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
VALUES (@last_id, 1,
        'Clean the mixed wild mushrooms with a damp cloth and slice them evenly. In a large pot, melt butter over medium heat and sauté finely diced shallots until soft and golden.'),
       (@last_id, 2,
        'Add the sliced mushrooms and fresh thyme sprigs to the pot. Cook undisturbed for 5 minutes to let them brown, then stir occasionally until all their natural moisture has evaporated and they develop a deep caramelization.'),
       (@last_id, 3,
        'Deglaze the pot with a splash of vegetable stock, scraping up any browned bits from the bottom. Pour in the rest of the stock, bring to a gentle boil, then lower the heat and simmer for 25 minutes.'),
       (@last_id, 4,
        'To achieve a perfect rustic texture, use a ladle to transfer exactly half of the soup into a blender. Puree until creamy, then stir it back into the pot with the remaining chunky broth. Serve hot.');

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
VALUES (@last_id, 1,
        'Slice the sourdough bread thickly and toast it in a toaster or on a hot skillet until the edges are dark brown and the center is sturdy and crunchy.'),
       (@last_id, 2,
        'Cut the ripe Hass avocado in half, remove the pit, and scoop the flesh into a bowl. Mash it with a fork, mixing in a pinch of sea salt, black pepper, and a generous squeeze of fresh lemon juice.'),
       (@last_id, 3,
        'Use a butter knife to spread the mashed avocado evenly and thickly over the warm sourdough slices from edge to edge.'),
       (@last_id, 4,
        'Top the toast with thinly sliced radishes for crunch, sprinkle with red pepper flakes for heat, and finish with a light drizzle of high-quality extra virgin olive oil before eating.');

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
VALUES (@last_id, 1,
        'Remove the mixed berries from the freezer and let them sit at room temperature for about 5 minutes just to soften slightly before blending.'),
       (@last_id, 2,
        'Transfer the partially thawed berries into a food processor or a high-speed blender. Pour in a tablespoon of fresh lemon juice to brighten the flavor.'),
       (@last_id, 3,
        'Begin blending on medium speed, slowly pouring in cold simple syrup in a thin stream through the lid opening. Continue processing until the mixture turns into a smooth, thick paste.'),
       (@last_id, 4,
        'Transfer the blended sorbet mixture into a chilled, airtight, freezer-safe container. Smooth the top with a spatula and freeze for at least 3 to 4 hours to achieve the perfect scoopable texture.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spicy Beef Stir-Fry', '25 min', 'Main Courses', 'Intermediate', 'spicy-beef.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Flank steak, sliced'),
       (@last_id, 'Broccoli florets'),
       (@last_id, 'Soy sauce'),
       (@last_id, 'Chili flakes');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Slice the flank steak against the grain into thin strips. Toss the strips lightly with cornstarch and a splash of soy sauce, letting them sit for 10 minutes to tenderize.'),
       (@last_id, 2,
        'Heat a wok or large skillet over high heat until it begins to smoke slightly. Add a tablespoon of oil and sear the beef in batches so it browns properly without steaming. Remove and set aside.'),
       (@last_id, 3,
        'Wipe the wok clean, add a little more oil, and toss in the broccoli florets. Stir-fry aggressively for 3-4 minutes until they are bright green and tender-crisp.'),
       (@last_id, 4,
        'Return the seared beef to the wok along with the broccoli. Pour in the remaining soy sauce and a heavy pinch of chili flakes, tossing everything continuously for 1 minute until coated and hot. Serve immediately.');

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
VALUES (@last_id, 1,
        'In a large oven-safe skillet or Dutch oven, sauté diced onions, carrots, and celery until softened. Stir in rinsed brown lentils, vegetable broth, and robust herbs like rosemary and thyme.'),
       (@last_id, 2,
        'Bring the mixture to a boil, then reduce heat, cover, and simmer for 30-35 minutes until the lentils are completely tender and the broth has reduced into a thick, savory gravy.'),
       (@last_id, 3,
        'While the lentils cook, boil potatoes until tender, then mash them smoothly with dairy-free butter, a splash of plant milk, salt, and pepper.'),
       (@last_id, 4,
        'Spread the mashed potatoes in an even, thick layer over the cooked lentil mixture. Use a fork to create ridges on top, then bake at 400°F (200°C) for 20 minutes until the peaks are golden and crispy.');

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
VALUES (@last_id, 1,
        'Place the frozen mango chunks into a blender. To achieve a thick, ice-cream-like consistency, let them sit for just a minute or two before blending.'),
       (@last_id, 2,
        'Pour in just a small splash of almond milk—only enough to get the blender blades moving. Blend on high speed, using a tamper if necessary, until the mixture is thick and completely smooth.'),
       (@last_id, 3,
        'Scrape the thick smoothie mixture out of the blender and spread it evenly into a shallow serving bowl.'),
       (@last_id, 4,
        'Arrange the toppings immediately before it melts: sprinkle gluten-free granola in a line, add a handful of chia seeds, and garnish with fresh fruit slices for added texture and visual appeal.');

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
VALUES (@last_id, 1,
        'Thoroughly pat the peeled and deveined shrimp completely dry with paper towels. Season them generously with salt, pepper, and a pinch of paprika.'),
       (@last_id, 2,
        'In a large, heavy skillet, melt the unsalted butter over medium heat. Add the finely minced garlic and sauté for about 1 minute, stirring constantly so it becomes fragrant but does not burn.'),
       (@last_id, 3,
        'Add the shrimp to the skillet in a single, even layer. Cook undisturbed for 2 minutes until the bottoms start turning pink, then quickly flip each one and cook for 1 more minute until fully opaque.'),
       (@last_id, 4,
        'Immediately remove the skillet from the heat to prevent overcooking. Pour in the fresh lemon juice, toss the shrimp to coat them in the buttery pan sauce, and garnish with chopped parsley before serving.');

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
VALUES (@last_id, 1,
        'Take a fresh ciabatta roll and slice it horizontally. Generously spread a thick layer of high-quality basil pesto onto the inside of both halves of the bread.'),
       (@last_id, 2,
        'Slice the fresh mozzarella and ripe tomatoes into thick rounds. Layer them alternately onto the bottom half of the ciabatta, ensuring the entire surface is covered.'),
       (@last_id, 3,
        'Drizzle a rich balsamic glaze directly over the tomatoes and cheese, and sprinkle lightly with sea salt and freshly ground black pepper. Place the top half of the ciabatta on the sandwich.'),
       (@last_id, 4,
        'Preheat a panini press or a heavy skillet. Grill the sandwich for 4-5 minutes, pressing down firmly, until the bread is deeply toasted with grill marks and the mozzarella is warmly melted.');

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
VALUES (@last_id, 1,
        'In a separate saucepan, keep the vegetable broth consistently warm over low heat. In a large skillet, sauté the sliced cremini mushrooms in butter until deeply browned, then remove them and set aside.'),
       (@last_id, 2,
        'In the same skillet, add a little olive oil and finely diced onions, cooking until soft. Add the dry Arborio rice and toast it for 2-3 minutes, stirring constantly until the edges of the grains become translucent.'),
       (@last_id, 3,
        'Begin the risotto process by adding the warm broth exactly one ladle at a time. Stir continuously and vigorously, allowing the rice to absorb the liquid completely before adding the next ladle.'),
       (@last_id, 4,
        'After 20-25 minutes, when the rice is al dente and suspended in a creamy sauce, remove from heat. Fold the cooked mushrooms back in, along with a final knob of butter and grated Parmesan cheese. Serve immediately.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Teriyaki Chicken Bowl', '25 min', 'Main Courses', 'Easy', 'teriyaki-bowl.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breast, diced'),
       (@last_id, 'Teriyaki sauce'),
       (@last_id, 'Jasmine rice'),
       (@last_id, 'Sesame seeds and green onions');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Rinse the jasmine rice under cold water until the water runs clear. Cook it in a rice cooker or on the stovetop according to package directions, then fluff with a fork and keep warm.'),
       (@last_id, 2,
        'Cut the chicken breast into even, bite-sized cubes. Heat a drizzle of oil in a large skillet over medium-high heat and sear the chicken until golden brown on all sides and fully cooked through.'),
       (@last_id, 3,
        'Lower the heat and pour the teriyaki sauce directly into the skillet with the chicken. Let it simmer and bubble for 3-4 minutes, stirring constantly so the sauce thickens and glazes the meat evenly.'),
       (@last_id, 4,
        'Assemble the bowls by scooping a generous portion of fluffy jasmine rice into the base, topping it with the glazed chicken, and sprinkling generously with toasted sesame seeds and thinly sliced green onions.');

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
VALUES (@last_id, 1,
        'Brew a strong batch of espresso coffee and let it cool completely in a wide, shallow bowl. In a mixing bowl, vigorously whisk egg yolks and sugar until the mixture becomes pale and thick.'),
       (@last_id, 2,
        'Gently fold the room-temperature mascarpone cheese into the egg yolk mixture until completely smooth. In a separate bowl, whip heavy cream to stiff peaks and gently fold it into the mascarpone cream to lighten it.'),
       (@last_id, 3,
        'Working quickly, dip each ladyfinger briefly into the cooled espresso (do not let them soak or they will disintegrate) and arrange them in a tight, single layer at the bottom of a rectangular dish.'),
       (@last_id, 4,
        'Spread half of the mascarpone cream evenly over the ladyfingers. Repeat with a second layer of dipped ladyfingers and the remaining cream. Cover tightly and refrigerate for at least 4 hours before dusting heavily with cocoa powder to serve.');

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
VALUES (@last_id, 1,
        'Preheat your oven to 375°F (190°C). Place the chicken breasts flat on a cutting board and carefully slice horizontally into the thickest part of each breast to create a deep pocket, being careful not to cut all the way through.'),
       (@last_id, 2,
        'In a mixing bowl, combine the softened cream cheese, finely chopped fresh spinach, garlic powder, salt, and pepper, stirring until it forms a uniform, thick filling.'),
       (@last_id, 3,
        'Spoon the spinach mixture generously inside the pocket of each chicken breast. Press the edges of the chicken together and secure them tightly with toothpicks so the filling does not escape while cooking.'),
       (@last_id, 4,
        'Season the outside of the stuffed chicken breasts with paprika and salt. Place them in a lightly oiled baking dish and bake for 25-30 minutes until the chicken reaches an internal temperature of 165°F (74°C). Remove toothpicks before serving.');

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
VALUES (@last_id, 1,
        'Drain and thoroughly rinse the canned black beans under cold water. In a small skillet, warm the beans and corn kernels over medium heat with a pinch of cumin and salt until heated through.'),
       (@last_id, 2,
        'Prepare your serving bowls by laying down a generous, warm bed of cooked brown rice or quinoa at the bottom of each bowl.'),
       (@last_id, 3,
        'Arrange the warmed black beans and corn on top of the rice in neat sections. Add a large scoop of fresh, vibrant pico de gallo to the center of the bowl.'),
       (@last_id, 4,
        'Finish the bowl by garnishing with freshly chopped cilantro, a few slices of jalapeño if you like heat, and a generous squeeze of fresh lime juice over everything before eating.');

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
VALUES (@last_id, 1,
        'Preheat your oven to 400°F (200°C) and line a rimmed baking sheet with aluminum foil or parchment paper for easy cleanup.'),
       (@last_id, 2,
        'Pat the salmon fillets dry with a paper towel and place them skin-side down on the prepared baking sheet. Season evenly with salt and black pepper.'),
       (@last_id, 3,
        'In a small bowl, whisk together the melted butter, finely minced garlic, and freshly chopped parsley. Slowly pour this mixture over each salmon fillet, using a brush to ensure they are fully coated.'),
       (@last_id, 4,
        'Bake in the preheated oven for 12-15 minutes, depending on the thickness of the fillets, until the edges are opaque and the center flakes easily with a fork. Serve hot with a wedge of lemon.');

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
        'Ensure all ingredients are strictly at room temperature. Preheat the oven to 400°F (200°C). Take two large sheets of parchment paper, crumple them up to make them pliable, and press them into a 9-inch springform pan, leaving the edges extending over the sides.'),
       (@last_id, 2,
        'In a large stand mixer fitted with the paddle attachment, beat the cream cheese and sugar together on medium speed for 5-7 minutes until the mixture is incredibly silky and the sugar has dissolved. Add the eggs one at a time, beating gently just until incorporated after each addition to avoid incorporating too much air.'),
       (@last_id, 3,
        'In a small separate bowl, whisk a small amount of the heavy cream with the cornstarch to create a smooth slurry. Add this slurry, along with the rest of the heavy cream and a pinch of salt, into the main batter, mixing on low speed until just combined.'),
       (@last_id, 4,
        'Pour the batter into the prepared pan and bake for 45-50 minutes. The top should be deeply browned—almost burnt—but the center must still jiggle significantly when shaken. Remove from the oven, allow it to cool completely at room temperature for 3-4 hours, then refrigerate for at least 6 hours (preferably overnight) before un-molding and slicing.');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Preheat oven to 400°F (200°C) and line a baking sheet with foil.'),
       (@last_id, 2, 'Place salmon on the foil and season with salt and pepper.'),
       (@last_id, 3, 'Whisk melted butter, garlic, and parsley, then pour over the salmon.'),
       (@last_id, 4, 'Bake for 12-15 minutes until the salmon flakes easily with a fork.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Traditional Galician Empanada', '1.5 hours', 'Main Courses', 'Intermediate', 'empanada.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Empanada dough (flour, yeast, water)'),
       (@last_id, 'Canned tuna in olive oil'),
       (@last_id, 'Large white onions, sliced'),
       (@last_id, 'Red bell peppers');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'In a large pan, heat olive oil and slowly fry the sliced onions and red bell peppers until they are completely soft and caramelized to make the traditional sofrito.'),
       (@last_id, 2,
        'Stir the drained tuna into the sofrito, season with paprika and salt, and let the filling cool down completely before assembling the pie.'),
       (@last_id, 3,
        'Roll out half of the dough to line the bottom of a greased baking dish. Spread the cooled filling evenly across the dough, leaving a small border around the edges.'),
       (@last_id, 4,
        'Cover with the remaining rolled-out dough, crimp the edges tightly to seal, pierce the top with a fork to let steam escape, and bake at 375°F (190°C) for 40 minutes until golden brown.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Beef Burger', '20 min', 'Main Courses', 'Easy', 'burger.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Ground beef (80/20)'),
       (@last_id, 'Brioche buns'),
       (@last_id, 'Cheddar cheese'),
       (@last_id, 'Lettuce and tomato');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Gently form the ground beef into round patties slightly wider than your buns. Press a small dimple into the center of each patty so they cook flat.'),
       (@last_id, 2,
        'Heat a cast-iron skillet over high heat. Season the patties generously with salt and pepper right before placing them in the hot pan.'),
       (@last_id, 3,
        'Cook for 3-4 minutes until a crust forms, flip, add a slice of cheddar cheese, and cover the pan for 1 minute to melt the cheese completely.'),
       (@last_id, 4,
        'Toast the brioche buns with a little butter. Assemble the burger by placing lettuce and tomato on the bottom bun, followed by the cheesy patty and your favorite sauce.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spanish Tortilla (Potato Omelette)', '45 min', 'Main Courses', 'Intermediate', 'tortilla.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Potatoes, thinly sliced'),
       (@last_id, 'Large eggs'),
       (@last_id, 'Yellow onion, diced'),
       (@last_id, 'Olive oil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Heat a generous amount of olive oil in a non-stick skillet. Slowly fry the sliced potatoes and onions over medium-low heat until tender but not browned, then drain excess oil.'),
       (@last_id, 2,
        'Crack the eggs into a large bowl, beat them lightly, and add a heavy pinch of salt. Fold the warm, drained potato and onion mixture into the eggs and let it rest for 10 minutes.'),
       (@last_id, 3,
        'Pour the entire mixture back into a hot, lightly oiled skillet. Cook over medium heat until the edges set and the bottom is golden brown, using a spatula to tuck in the sides.'),
       (@last_id, 4,
        'Place a large plate over the skillet, quickly invert the tortilla onto the plate, and slide it back into the pan to cook the other side for 2-3 minutes. Serve warm or at room temperature.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('French Onion Soup', '1 hour', 'Soups', 'Intermediate', 'french-onion.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Yellow onions, thinly sliced'),
       (@last_id, 'Beef broth'),
       (@last_id, 'Gruyère cheese, grated'),
       (@last_id, 'Baguette slices');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Melt butter in a large Dutch oven over medium-low heat. Add the sliced onions and cook slowly for 30-40 minutes, stirring occasionally until deeply caramelized and jammy.'),
       (@last_id, 2,
        'Sprinkle a tablespoon of flour over the onions and cook for 1 minute. Pour in the beef broth and a splash of dry white wine, bringing the soup to a simmer for 20 minutes.'),
       (@last_id, 3,
        'While the soup simmers, toast the baguette slices under the broiler until crispy. Rub them lightly with a raw garlic clove for extra flavor.'),
       (@last_id, 4,
        'Ladle the hot soup into oven-safe bowls. Top each with a toasted baguette slice, cover completely with grated Gruyère cheese, and broil until the cheese is bubbling and golden.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Vegetarian Pad Thai', '30 min', 'Main Courses', 'Intermediate', 'pad-thai.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Rice noodles'),
       (@last_id, 'Firm tofu, cubed'),
       (@last_id, 'Pad Thai sauce (tamarind base)'),
       (@last_id, 'Crushed peanuts and lime');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Soak the rice noodles in warm water according to package instructions until pliable but still slightly firm, then drain thoroughly.'),
       (@last_id, 2,
        'Heat oil in a wok and pan-fry the cubed tofu until golden and crispy on all sides. Push the tofu to one side of the wok and scramble two eggs on the other side.'),
       (@last_id, 3,
        'Add the softened noodles and Pad Thai sauce to the wok. Toss vigorously over high heat until the noodles absorb the sauce and cook through.'),
       (@last_id, 4,
        'Toss in a handful of fresh bean sprouts and green onions right before removing from the heat. Serve immediately, garnished with crushed peanuts and a wedge of lime.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Cinnamon Roll Oatmeal', '10 min', 'Breakfast', 'Easy', 'oatmeal.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Rolled oats'),
       (@last_id, 'Almond milk'),
       (@last_id, 'Ground cinnamon'),
       (@last_id, 'Maple syrup');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'In a small saucepan, bring the almond milk to a gentle boil. Stir in the rolled oats, a heavy pinch of ground cinnamon, and a tiny dash of vanilla extract.'),
       (@last_id, 2,
        'Reduce the heat to low and simmer for 5-7 minutes, stirring occasionally, until the oats have absorbed most of the liquid and become thick and creamy.'),
       (@last_id, 3,
        'Remove the saucepan from the heat and stir in a spoonful of maple syrup to sweeten the oatmeal perfectly.'),
       (@last_id, 4,
        'Transfer the oatmeal to a bowl and drizzle the top with a simple glaze made from powdered sugar and a splash of milk to replicate the cinnamon roll experience.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Crispy Baked Tofu Bites', '35 min', 'Main Courses', 'Easy', 'baked-tofu.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Extra-firm tofu'),
       (@last_id, 'Cornstarch'),
       (@last_id, 'Soy sauce (GF)'),
       (@last_id, 'Sesame oil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Wrap the extra-firm tofu block in a clean kitchen towel and place a heavy object on top for 15 minutes to press out all the excess moisture. Cut into small cubes.'),
       (@last_id, 2,
        'Toss the tofu cubes in a bowl with gluten-free soy sauce and a drizzle of sesame oil until coated. Then, sprinkle cornstarch over them and toss gently until they have a dry, powdery coating.'),
       (@last_id, 3,
        'Spread the coated tofu cubes in a single layer on a parchment-lined baking sheet, making sure they are not touching each other.'),
       (@last_id, 4,
        'Bake at 400°F (200°C) for 25-30 minutes, flipping halfway through, until the exterior is extremely crispy and golden brown. Serve as a snack or add to stir-fries.');

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
VALUES (@last_id, 1,
        'Clean the mixed wild mushrooms and slice them evenly. Melt butter over medium heat and sauté finely diced shallots.'),
       (@last_id, 2,
        'Add the sliced mushrooms and thyme. Cook undisturbed for 5 minutes, then stir until all natural moisture has evaporated.'),
       (@last_id, 3,
        'Deglaze the pot with stock, scraping up browned bits. Pour in the rest of the stock, bring to a boil, and simmer for 25 minutes.'),
       (@last_id, 4,
        'Transfer exactly half of the soup into a blender. Puree until creamy, then stir it back into the pot with the remaining chunky broth.');

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
VALUES (@last_id, 1, 'Slice the sourdough bread thickly and toast it until the edges are dark brown and crunchy.'),
       (@last_id, 2, 'Mash the avocado flesh with a fork, mixing in sea salt, black pepper, and fresh lemon juice.'),
       (@last_id, 3, 'Spread the mashed avocado evenly and thickly over the warm sourdough slices.'),
       (@last_id, 4,
        'Top with thinly sliced radishes, sprinkle with red pepper flakes, and finish with a light drizzle of olive oil.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Crispy Baked Tofu Bites', '35 min', 'Main Courses', 'Easy', 'baked-tofu.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegan'),
       (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Extra-firm tofu'),
       (@last_id, 'Cornstarch'),
       (@last_id, 'Soy sauce (GF)'),
       (@last_id, 'Sesame oil');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Press the extra-firm tofu for 15 minutes to remove excess moisture. Cut into small cubes.'),
       (@last_id, 2,
        'Toss cubes with soy sauce and sesame oil. Sprinkle cornstarch and toss gently until dry and coated.'),
       (@last_id, 3, 'Spread the tofu in a single layer on a parchment-lined baking sheet.'),
       (@last_id, 4, 'Bake at 400°F (200°C) for 25-30 minutes, flipping halfway, until extremely crispy and golden.');


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
VALUES (@last_id, 1, 'Let the frozen mixed berries sit at room temperature for 5 minutes to soften slightly.'),
       (@last_id, 2, 'Transfer to a food processor and pour in a tablespoon of fresh lemon juice.'),
       (@last_id, 3, 'Blend on medium speed, slowly pouring in cold simple syrup until it forms a smooth paste.'),
       (@last_id, 4, 'Transfer to an airtight container and freeze for at least 3 to 4 hours before serving.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Beef Burger', '20 min', 'Main Courses', 'Easy', 'burger.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Ground beef (80/20)'),
       (@last_id, 'Brioche buns'),
       (@last_id, 'Cheddar cheese'),
       (@last_id, 'Lettuce and tomato');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Form ground beef into patties slightly wider than the buns. Press a dimple into the center of each.'),
       (@last_id, 2,
        'Heat a cast-iron skillet over high heat. Season patties with salt and pepper right before cooking.'),
       (@last_id, 3, 'Cook 3-4 minutes per side, adding cheddar cheese during the last minute and covering to melt.'),
       (@last_id, 4,
        'Toast the brioche buns. Assemble with lettuce, tomato, the cheesy patty, and your favorite sauce.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Black Bean Burrito Bowl', '15 min', 'Main Courses', 'Easy', 'burrito-bowl.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Canned black beans'),
       (@last_id, 'Cooked brown rice'),
       (@last_id, 'Corn kernels'),
       (@last_id, 'Pico de gallo');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Drain and rinse the black beans. Warm the beans and corn in a skillet with a pinch of cumin.'),
       (@last_id, 2, 'Lay down a generous, warm bed of cooked brown rice at the bottom of each bowl.'),
       (@last_id, 3, 'Arrange the beans and corn on top of the rice in neat sections. Add a scoop of pico de gallo.'),
       (@last_id, 4, 'Garnish with freshly chopped cilantro and a squeeze of fresh lime juice.');


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
VALUES (@last_id, 1, 'Slice the ciabatta horizontally and spread a thick layer of basil pesto on both halves.'),
       (@last_id, 2, 'Layer thick rounds of fresh mozzarella and tomatoes on the bottom half.'),
       (@last_id, 3, 'Drizzle balsamic glaze over the tomatoes and cheese, and sprinkle lightly with sea salt.'),
       (@last_id, 4, 'Grill the sandwich in a panini press for 4-5 minutes until the mozzarella is melted.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Authentic Basque Cheesecake', '12 hours', 'Desserts', 'Advanced', 'cheesecake.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, '1 kg Cream cheese (room temp)'),
       (@last_id, '400g Caster sugar'),
       (@last_id, '7 Large eggs'),
       (@last_id, '500ml Heavy cream'),
       (@last_id, '1 tbsp Cornstarch');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Preheat the oven to 400°F (200°C). Press two crumpled sheets of parchment paper into a 9-inch pan.'),
       (@last_id, 2, 'Beat cream cheese and sugar for 5-7 minutes until silky. Mix in the eggs one at a time.'),
       (@last_id, 3,
        'Whisk cornstarch with a bit of heavy cream, then mix it into the main batter with the rest of the cream.'),
       (@last_id, 4,
        'Bake for 45-50 minutes until the top is burnt but the center jiggles. Cool at room temp, then chill overnight.');


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
VALUES (@last_id, 1, 'Heat the thick cream from the top of the coconut milk in a wok until it bubbles.'),
       (@last_id, 2, 'Stir in the green curry paste and cook for 2-3 minutes until fragrant and oils separate.'),
       (@last_id, 3, 'Add remaining coconut milk, bamboo shoots, and tofu. Simmer gently for 10-15 minutes.'),
       (@last_id, 4, 'Remove from heat, stir in fresh Thai basil and lime juice. Serve hot with jasmine rice.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Traditional Galician Empanada', '1.5 hours', 'Main Courses', 'Intermediate', 'empanada.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Empanada dough'),
       (@last_id, 'Canned tuna in olive oil'),
       (@last_id, 'White onions, sliced'),
       (@last_id, 'Red bell peppers');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1,
        'Slowly fry the sliced onions and red bell peppers in olive oil until fully caramelized to make the sofrito.'),
       (@last_id, 2,
        'Stir the drained tuna into the sofrito, season with sweet paprika, and let the filling cool down completely.'),
       (@last_id, 3, 'Roll out dough to line a baking dish. Spread the cooled filling evenly, leaving a border.'),
       (@last_id, 4,
        'Cover with the remaining dough, crimp edges, pierce the top, and bake at 375°F (190°C) for 40 minutes.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('French Onion Soup', '1 hour', 'Soups', 'Intermediate', 'french-onion.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Yellow onions, sliced'),
       (@last_id, 'Beef broth'),
       (@last_id, 'Gruyère cheese'),
       (@last_id, 'Baguette slices');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cook sliced onions slowly in butter for 30-40 minutes until deeply caramelized and jammy.'),
       (@last_id, 2, 'Sprinkle a little flour over the onions, then pour in beef broth and simmer for 20 minutes.'),
       (@last_id, 3, 'Toast baguette slices under the broiler and rub them lightly with a raw garlic clove.'),
       (@last_id, 4, 'Ladle hot soup into bowls, top with baguette and Gruyère, and broil until bubbling and golden.');


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
VALUES (@last_id, 1, 'Place frozen mango chunks in a blender and let sit for two minutes to soften slightly.'),
       (@last_id, 2, 'Add a tiny splash of almond milk and blend on high until thick and completely smooth.'),
       (@last_id, 3, 'Scrape the thick smoothie mixture out and spread it evenly into a shallow serving bowl.'),
       (@last_id, 4, 'Garnish immediately with chia seeds, granola, and fresh fruit slices before it melts.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Cinnamon Roll Oatmeal', '10 min', 'Breakfast', 'Easy', 'oatmeal.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Rolled oats'),
       (@last_id, 'Almond milk'),
       (@last_id, 'Ground cinnamon'),
       (@last_id, 'Maple syrup');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Bring almond milk to a gentle boil in a small saucepan. Stir in oats, cinnamon, and vanilla.'),
       (@last_id, 2, 'Simmer on low for 5-7 minutes until the oats have absorbed the liquid and become creamy.'),
       (@last_id, 3, 'Remove from heat and stir in a spoonful of maple syrup.'),
       (@last_id, 4, 'Transfer to a bowl and drizzle with a simple powdered sugar glaze.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Vegetarian Pad Thai', '30 min', 'Main Courses', 'Intermediate', 'pad-thai.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Rice noodles'),
       (@last_id, 'Firm tofu, cubed'),
       (@last_id, 'Pad Thai sauce'),
       (@last_id, 'Crushed peanuts');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Soak rice noodles in warm water until pliable, then drain thoroughly.'),
       (@last_id, 2, 'Pan-fry cubed tofu in a wok until crispy. Push aside and scramble two eggs on the other side.'),
       (@last_id, 3, 'Add the softened noodles and Pad Thai sauce. Toss over high heat until noodles cook through.'),
       (@last_id, 4, 'Toss in bean sprouts and green onions. Garnish with crushed peanuts and a wedge of lime.');


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
VALUES (@last_id, 1, 'Sift together the flour, sugar, baking powder, and a pinch of salt to prevent lumps.'),
       (@last_id, 2, 'Whisk the milk, eggs, and a dash of vanilla extract in a separate bowl until smooth.'),
       (@last_id, 3, 'Create a well in the dry ingredients, pour in the wet mixture, and fold gently.'),
       (@last_id, 4, 'Cook 1/4 cup portions on a hot, buttered griddle. Serve with fresh berries and maple syrup.');


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
VALUES (@last_id, 1, 'Preheat a pizza stone in the oven at 450°F-500°F for at least 30 minutes.'),
       (@last_id, 2, 'Stretch the pizza dough into a 12-inch circle, keeping edges thicker for the crust.'),
       (@last_id, 3, 'Spread a thin layer of tomato sauce and distribute slices of fresh mozzarella evenly.'),
       (@last_id, 4, 'Bake for 8-10 minutes until the crust blisters. Garnish with fresh basil immediately.');


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
VALUES (@last_id, 1, 'Boil quinoa in vegetable broth, then cover and simmer for 15 minutes until fluffy.'),
       (@last_id, 2, 'Dice cucumber, halve Kalamata olives, and chop cherry tomatoes while the quinoa cools.'),
       (@last_id, 3, 'Vigorously shake lemon juice, olive oil, minced garlic, oregano, salt, and pepper in a jar.'),
       (@last_id, 4, 'Toss the cooled quinoa with vegetables and dressing. Let it sit for 10 minutes before serving.');


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
VALUES (@last_id, 1,
        'Sauté cremini mushrooms in butter until deeply browned, then remove and set aside. Keep broth warm.'),
       (@last_id, 2, 'Cook diced onions in olive oil until soft, add Arborio rice and toast for 2-3 minutes.'),
       (@last_id, 3, 'Add warm broth one ladle at a time, stirring vigorously until absorbed before adding more.'),
       (@last_id, 4, 'When rice is al dente, remove from heat. Fold in cooked mushrooms, butter, and Parmesan.');


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
VALUES (@last_id, 1, 'Whisk honey, gluten-free soy sauce, minced garlic, and rice vinegar to create a marinade.'),
       (@last_id, 2, 'Pour half the marinade over the salmon fillets and let them rest for 10-15 minutes.'),
       (@last_id, 3, 'Sear salmon flesh-side down in a skillet for 3-4 minutes, then flip to the skin side.'),
       (@last_id, 4,
        'Pour remaining marinade into the pan, letting it reduce into a thick glaze. Spoon over the fish.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Lemon Garlic Butter Shrimp', '15 min', 'Main Courses', 'Easy', 'shrimp.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Large shrimp, peeled'),
       (@last_id, 'Unsalted butter'),
       (@last_id, 'Garlic cloves, minced'),
       (@last_id, 'Fresh lemon juice');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Pat the shrimp completely dry with paper towels and season with salt, pepper, and paprika.'),
       (@last_id, 2, 'Melt butter in a large skillet and sauté minced garlic for 1 minute until fragrant.'),
       (@last_id, 3, 'Cook shrimp in an even layer for 2 minutes, flip, and cook 1 more minute until opaque.'),
       (@last_id, 4, 'Remove from heat immediately, toss with fresh lemon juice, and garnish with chopped parsley.');

INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Roasted Pumpkin Soup', '45 min', 'Soups', 'Intermediate', 'soup.jpg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian'),
       (@last_id, 'Vegan'),
       (@last_id, 'Gluten Free');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Pumpkin chunks'),
       (@last_id, 'Coconut milk'),
       (@last_id, 'Ginger'),
       (@last_id, 'Vegetable broth');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Toss pumpkin with olive oil and roast at 400°F (200°C) for 25-30 minutes until caramelized.'),
       (@last_id, 2, 'Heat oil in a pot and sauté freshly grated ginger and minced garlic for 2 minutes.'),
       (@last_id, 3, 'Add the roasted pumpkin and vegetable broth. Puree with an immersion blender until smooth.'),
       (@last_id, 4, 'Lower the heat, stir in coconut milk, and warm through for 5 minutes without boiling.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Spicy Beef Stir-Fry', '25 min', 'Main Courses', 'Intermediate', 'spicy-beef.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Flank steak, sliced'),
       (@last_id, 'Broccoli florets'),
       (@last_id, 'Soy sauce'),
       (@last_id, 'Chili flakes');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Slice flank steak against the grain. Toss lightly with cornstarch and a splash of soy sauce.'),
       (@last_id, 2, 'Sear the beef in batches in a smoking hot wok until browned. Remove and set aside.'),
       (@last_id, 3, 'Stir-fry broccoli florets aggressively for 3-4 minutes until bright green and tender-crisp.'),
       (@last_id, 4, 'Return beef to wok. Add soy sauce and chili flakes, tossing continuously for 1 minute.');


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
VALUES (@last_id, 1, 'Carefully slice horizontally into the thickest part of each chicken breast to create a pocket.'),
       (@last_id, 2, 'Mix softened cream cheese, chopped fresh spinach, garlic powder, salt, and pepper.'),
       (@last_id, 3, 'Stuff the mixture inside each pocket and secure tightly with toothpicks.'),
       (@last_id, 4,
        'Season the outside and bake at 375°F (190°C) for 25-30 minutes. Remove toothpicks before serving.');


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
VALUES (@last_id, 1, 'Warm corn tortillas in a dry skillet over medium-high heat until soft and slightly charred.'),
       (@last_id, 2, 'Heat black beans in a saucepan with cumin, chili powder, and lime juice, mashing slightly.'),
       (@last_id, 3, 'Slice avocados into thick wedges and toss lightly in lime juice to prevent browning.'),
       (@last_id, 4, 'Spoon seasoned beans onto warm tortillas, add avocado, and garnish with cilantro and onions.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Teriyaki Chicken Bowl', '25 min', 'Main Courses', 'Easy', 'teriyaki-bowl.png');
SET @last_id = LAST_INSERT_ID();
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Chicken breast, diced'),
       (@last_id, 'Teriyaki sauce'),
       (@last_id, 'Jasmine rice'),
       (@last_id, 'Sesame seeds');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Cook jasmine rice in a rice cooker or stovetop according to package directions, then fluff.'),
       (@last_id, 2, 'Pan-fry diced chicken breast in a skillet until golden brown and cooked through.'),
       (@last_id, 3,
        'Pour teriyaki sauce into the skillet and simmer for 3-4 minutes until it thickens and glazes the meat.'),
       (@last_id, 4, 'Scoop rice into bowls, top with the glazed chicken, and sprinkle with toasted sesame seeds.');


INSERT INTO recipes (title, prep_time, category, difficulty, image_path)
VALUES ('Classic Tiramisu', '4 hours', 'Desserts', 'Intermediate', 'tiramisu.jpeg');
SET @last_id = LAST_INSERT_ID();
INSERT INTO dietary_tags (recipe_id, tag_name)
VALUES (@last_id, 'Vegetarian');
INSERT INTO ingredients (recipe_id, name)
VALUES (@last_id, 'Espresso coffee'),
       (@last_id, 'Ladyfingers'),
       (@last_id, 'Mascarpone cheese'),
       (@last_id, 'Cocoa powder');
INSERT INTO steps (recipe_id, step_order, description)
VALUES (@last_id, 1, 'Whisk egg yolks and sugar until pale, then fold in room-temperature mascarpone cheese.'),
       (@last_id, 2, 'Whip heavy cream to stiff peaks and gently fold it into the mascarpone mixture to lighten it.'),
       (@last_id, 3, 'Dip ladyfingers briefly into cooled espresso and arrange them in a single layer in a dish.'),
       (@last_id, 4, 'Spread half the cream, repeat layers, chill for 4 hours, and dust heavily with cocoa powder.');


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
VALUES (@last_id, 1, 'Sauté diced onions and minced garlic in butter for 5-7 minutes until completely translucent.'),
       (@last_id, 2,
        'Pour in crushed San Marzano tomatoes, bring to a rolling boil, then simmer gently for 20 minutes.'),
       (@last_id, 3, 'Use an immersion blender to puree the mixture directly in the pot until perfectly smooth.'),
       (@last_id, 4, 'Return to low heat, slowly stir in heavy cream and fresh torn basil leaves. Serve warm.');