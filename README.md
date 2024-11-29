Create a new Flutter project if you haven't already.

In the project's lib directory, create a new Dart file named theme.dart.

In theme.dart, define a theme class with the following:

A primary color.
Two themes: light and dark, each with primary colors.
In your project's main.dart file:

Import the theme.dart file.
Create a simple Flutter app using GetMaterialApp.
Use the light theme as the default theme for your app.
Implement a toggle button in the AppBar to switch between light and dark themes.
Create a new Dart file named product.dart in the lib directory.

Define a Product class with properties like name, imageUrl, and price.
In your project's main.dart file:

Import the product.dart file.
Create a list of Product objects with various products, including names, image URLs, and prices.
Implement a CatalogPage widget:

Display an AppBar with the title "Flutter Store" and the theme toggle button.
Use a GridView or ListView.builder to display the list of products.
Each product should be shown as a card with its name, image, and price.
Make use of either GestureDetector or InkWell to make the product cards interactive:

When a user taps a card, display a simple dialog or toast with the product's name.
Test your app on both Android and iOS simulators/emulators or physical devices to ensure it works correctly.

Implement an animation of your choice (e.g., AnimatedContainer, AnimatedOpacity) to add a subtle visual effect to your app.
