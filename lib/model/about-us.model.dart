class AboutUsModel {
  String titulo;
  String descricao;

  AboutUsModel(this.titulo, this.descricao);

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
        json['content']['titulo'], json['content']['descricao']);
  }
}
