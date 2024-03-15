class User {

  String _firstName;
  String _lastName;
  String _id;

  get getFirstName => _firstName;

  set setFirstName(final firstName) => _firstName = firstName;

  get getLastName => _lastName;

  set setLastName( lastName) => _lastName = lastName;

  get getId => _id;

  set setId( id) => _id = id;

  User (this._firstName, this._lastName, this._id);
}