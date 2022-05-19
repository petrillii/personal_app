class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String cep;
  final String rua;
  final int numero;
  final String bairro;
  final String cidade;
  final String celular;
  final String dataNascimento;
  final double peso;
  final double altura;
  final int bf;

  SignUpModel(
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.cep,
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.celular,
    this.dataNascimento,
    this.peso,
    this.altura,
    this.bf,
  );
}
