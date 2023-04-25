enum Flavor { dev, prod }

abstract class Environment {
  get baseUrl;
}

class DevEnvironment implements Environment {
  @override
  get baseUrl => 'https://jsonplaceholder.typicode.dev.com';
}

class ProdEnvironment implements Environment {
  @override
  get baseUrl => 'https://jsonplaceholder.typicode.dev.com';
}

Environment choosingEnvironment(Flavor flavor) {
  if (flavor == Flavor.prod) {
    return ProdEnvironment();
  } else {
    return DevEnvironment();
  }
}
