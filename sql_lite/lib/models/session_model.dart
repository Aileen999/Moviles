class SessionModel {
  int idUser;
  

  SessionModel(
    this.idUser,
   
  );
  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser
    };
  }
}
