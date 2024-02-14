class HomeModel{
  int? id;
  String? name,image;
  List<dynamic>? bgImageList=[];
  List<dynamic>? quotesList=[];
  List<dynamic>? authorList=[];

  HomeModel(
      {this.id,
      this.name,
      this.image,
      this.bgImageList,
      this.quotesList,
      this.authorList});

  factory HomeModel.mapToModel(Map m1){
    return HomeModel(
      id: m1['id'],
      name: m1['name'],
      image: m1['image'],
      bgImageList: m1['bgImage'],
      quotesList: m1['quotes'],
      authorList: m1['author'],
    );
  }
}