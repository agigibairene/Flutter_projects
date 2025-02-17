import "../utils/shoe.dart";


class Cart{

  // List of items for sale
  List <Shoe> shoeShop = [
    Shoe(imagePath: "assets/images/cool.png", name: "Air Max 90",description: "Classic running shoe with a retro design.",amount: 120,),
    Shoe(imagePath: "assets/images/cool.png",name: "Yeezy Boost 350",description: "Comfortable and stylish lifestyle sneaker.",amount: 220,),
    Shoe(imagePath: "assets/images/cool.png",name: "Nike Dunk Low",description: "Skate-inspired low-top sneaker.",amount: 110),
    Shoe(imagePath: "assets/images/cool.png",name: "Adidas Ultraboost",description: "Performance running shoe with responsive cushioning.",amount: 180,),
    Shoe(imagePath: "assets/images/cool.png",name: "Puma Suede Classic",description: "Timeless streetwear sneaker with a soft suede upper.",amount: 85,),
    Shoe(imagePath: "assets/images/cool.png",name: "Converse Chuck 70",description: "High-top canvas sneaker with vintage details.",amount: 75,),
    Shoe(imagePath: "assets/images/cool.png",name: "Vans Old Skool",description: "Iconic skate shoe with a signature side stripe.",amount: 65,),
    Shoe(imagePath: "assets/images/cool.png",name: "Reebok Classic Leather",description: "Retro running shoe with a minimalist design.",amount: 90,),
    Shoe(imagePath: "assets/images/cool.png",name: "New Balance 574",description: "Comfortable sneaker with classic New Balance branding.",amount: 100,),
    Shoe(imagePath: "assets/images/cool.png",name: "Jordan 1 Retro High",description: "Legendary basketball shoe with a premium leather upper.",amount: 200)
  ];


  // List of items in the user's cart
  List<Shoe> userCart = [];


  // Get List of items for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  // Get User cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  // Add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
  }


  // Remove items from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
  }
}