class Usuario {
  final String id;
  final String ra;
  final String nome;

  const Usuario(
    this.id,
    this.ra,
    this.nome,
  );

  static Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(json['id'].toString(), json['RA'], json['nome']);
  }
}
