class HomeModel{
  int? id;
  String? name,image,bgImage;
  List<dynamic>? quotesList=[];
  List<dynamic>? authorList=[];

  HomeModel(
      {this.id,
      this.name,
      this.image,
      this.bgImage,
      this.quotesList,
      this.authorList});

  factory HomeModel.mapToModel(Map m1){
    return HomeModel(
      id: m1['id'],
      name: m1['name'],
      image: m1['image'],
      bgImage: m1['bgImage'],
      quotesList: m1['quotes'],
      authorList: m1['author'],
    );
  }
}