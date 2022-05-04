class Baby{
  const Baby({
    this.image,
    this.name,
    this.age,
    this.gender,
    this.desc,
    this.birthDay,
    this.ageOfBirth,
    this.birthWeight,
    this.birthLength,
    this.headSize,
  });

  final String image, name, desc, gender;
  final int age, birthWeight, ageOfBirth, birthDay;
  final double birthLength, headSize;


  factory Baby.fromMap(map){
    return Baby(
      name: map['name'],
      desc: map['desc'],
      age: map['age'],
      gender: map['gender'],
      birthDay: map['birthDay'],
      ageOfBirth: map['ageOfBirth'],
      birthLength: map['birthLength'].toDouble(),
      birthWeight: map['birthWeight'],
      headSize: map['headSize'].toDouble(),
      image: map['image'],
    );
  }
  Map<String, dynamic> BabytoMap() {
    return {
      'name': name,
      'desc': desc,
      'age': age,
      'gender': gender,
      'birthDay': birthDay,
      'ageOfBirth' : ageOfBirth,
      'birthLength': birthLength,
      'birthWeight': birthWeight,
      'headSize': headSize,
      'image': image,
    };
  }
}