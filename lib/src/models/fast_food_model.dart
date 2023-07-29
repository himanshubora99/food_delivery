class FastFood {
   String image;
   String name;
   String type;
   double price;
   double tax;
   int rating;
   int quantity;
   bool isFavourite;

  FastFood({
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.tax,
    required this.quantity,
    required this.isFavourite,
    required this.rating,
  });
}