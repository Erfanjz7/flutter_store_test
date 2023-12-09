class Products{
  String productName;
  int id;
  String price;
  String image_url;
  bool off;
  String description;

  Products(this.productName, this.id, this.price, this.image_url, this.off,
      this.description);

  String getProducName(){
    return this.productName;
  }

  int getId(){
    return this.id;
  }

  String getPrice(){
    return this.price;
  }

  String getImageUrl(){
    return this.image_url;
  }

  bool getOff(){
    return this.off;
  }

  String getDescription(){
    return this.description;
  }

  void setProductName(String productName){
    this.productName = productName;
  }

  void setId(int id){
    this.id = id;
  }

  void setPrice(String price){
    this.price = price;
  }

  void setImageUrl(String image_url){
    this.image_url = image_url;
  }

  void setOff(bool off){
    this.off = off;
  }

  void setDescription(String descriptioon){
    this.description = descriptioon;
  }

}