// ignore_for_file: non_constant_identifier_names
// created category class for display category in home page right now
class Categories {
  Categories({
    required this.id,
    required this.image,
    required this.categoryType,
    required this.categoryName,
  });

  final String id;
  final String image;
  final String categoryType;
  final String categoryName;
}
