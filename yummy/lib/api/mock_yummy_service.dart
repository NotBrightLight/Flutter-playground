import '../models/models.dart';

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockYummyService {
  // Batch request that gets both today recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    final restaurants = await _getRestaurants();
    final categories = await _getCategories();
    final friendPosts = await _getFriendFeed();

    return ExploreData(restaurants, categories, friendPosts);
  }

  // Get sample food categories to display in ui
  Future<List<FoodCategory>> _getCategories() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 50));
    // Return mock categories
    return categories;
  }

  // Get the friend posts to display in ui
  Future<List<Post>> _getFriendFeed() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 50));
    // Return mock posts
    return posts;
  }

  // Get the restaurants to display in ui
  Future<List<Restaurant>> _getRestaurants() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 50));
    // Return mock restaurants
    return restaurants;
  }
}
