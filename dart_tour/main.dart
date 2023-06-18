String sayHello(String name, int age, [String? country = 'kr']) {
  return '$name is $age years old and from $country';
}

void main() {
  final String? name = '니꼬';
  name?.isNotEmpty;
  print(sayHello('nico', 12));
}