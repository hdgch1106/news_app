import 'package:app_news/infrastructure/models/newsapi/newsapi_categories.dart';

List<NewsapiCategories> getCategories() {
  List<NewsapiCategories> category = <NewsapiCategories>[];
  NewsapiCategories categoryModel = NewsapiCategories();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1542744095-fcf48d80b0fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80";
  category.add(categoryModel);

  //2
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80";
  category.add(categoryModel);

  //3
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80";
  category.add(categoryModel);

  //4
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1679678691010-894374986c54?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=898&q=80";
  category.add(categoryModel);

  //5
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://plus.unsplash.com/premium_photo-1676325102583-0839e57d7a1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  //5
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1628891890467-b79f2c8ba9dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  //5
  categoryModel = NewsapiCategories();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  return category;
}
