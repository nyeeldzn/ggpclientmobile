class ListaRuptura {

  final int id;
  final String desc;
  final String date;
  List product_list = [];

  ListaRuptura(this.id, this.desc, this.date);

  @override
  String toString() {
    return 'ListaRuptura{id: $id, desc: $desc, date: $date, product_list: $product_list}';
  }
}