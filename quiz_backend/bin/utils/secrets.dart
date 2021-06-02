class DbSecrets{
  final String supabaseUrl;
  final String supabasekey;
  static DbSecrets? _dbsecrets;
  static DbSecrets? get secrets => _dbsecrets;
  DbSecrets._({required this.supabaseUrl,required this.supabasekey});
  static void registerCredentials({required String supabaseUrl,required String supabasekey}){
    _dbsecrets??=DbSecrets._(supabaseUrl: supabaseUrl, supabasekey: supabasekey);
  }
}
