class DbSecrets{
  final String host; 
  final String dbName;
  final String port;
  final String username; 
  final String password;
  static DbSecrets? _dbsecrets;
  static DbSecrets? get object => _dbsecrets; 
  DbSecrets._(this.host,this.dbName,this.port, this.username, this.password);
  
  static void registerCredentials(String host,String dbName,String port, String username, String password){
    _dbsecrets??=DbSecrets._(host, dbName, port, username, password);
  }

}
