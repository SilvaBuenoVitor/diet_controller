class Food{
  final int userId;
  final int id;
  final String name;
  final double weight;
  final int calories;
  Food(this.userId,this.id,this.name,this.weight,this.calories);

  Food.fromJson(Map<String,dynamic> json):
    userId = json['userId'],
    id = json['id'],
    name = json['name'],
    weight = json['weight'],
    calories = json['calories'];

  Map<String, dynamic> toJson()=>{
    'userId' : userId,
    'id' : id,
    'name' : name,
    'weight' : weight,
    'calories' : calories
  };
}