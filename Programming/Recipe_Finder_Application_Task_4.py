"""
 Problem Statement: Create a recipe finder app that lets users:
1. Search Recipes:
○ Type ingredients into an input field and press Enter.
○ Fetch matching recipes stored as an array of objects.
2. Bonus Features:
○ Allow recipe filtering by type (e.g., Lunch, Breakfast) using a dropdown menu.   
    
"""

li = [{"Name": "Pasta", "Type": "Lunch","Ingredients":["Tomato Sauce","Pasta","Water","Onion","Chies"]},
      {"Name": "Pizza", "Type": "Dinner","Ingredients":["Capcian","Piza Base","Panier","Onion","Chies"]},
      {"Name": "Burger", "Type": "Lunch","Ingredients":["Tomato","Bun","Patato","Onion","Chies","Mianoze"]},
      {"Name": "Pancakes", "Type": "Breakfast","Ingredients":["flour", "milk", "egg"]},
      {"Name": "Omelette", "Type": "Breakfast","Ingredients":["egg", "cheese", "milk"]}, 
      {"Name": "Grilled Cheese Sandwich", "Type": "Lunch","Ingredients":["bread", "cheese", "butter"]},
      {"Name": "Caesar Salad", "Type": "Lunch","Ingredients":["lettuce", "croutons", "cheese", "dressing"]},
      {"Name": "Chocolate Cake", "Ingredients": ["flour", "cocoa", "sugar", "egg"], "Type": "Dessert"}]




def find_recipe(ingredients, recipe_type=None):
    matching_recipes = []
    for recipe in li:
        if recipe_type and recipe["Type"] != recipe_type:
            continue
        if all(ingredient in recipe["Ingredients"] for ingredient in ingredients):
            matching_recipes.append(recipe)
    return matching_recipes


ing = input("Enter ingredients: ").split(",")
print(find_recipe(ing))
