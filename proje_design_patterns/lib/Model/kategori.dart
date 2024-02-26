class Kategori{
  int? kategori_id;
  String? kategori_adi;
  String? kategori_icerik;
  Kategori({required this.kategori_id,required this.kategori_adi,required this.kategori_icerik});
  
  Kategori.fromMap(Map<String,dynamic> veri){
    kategori_id=veri["kategori_id"];
    kategori_adi=veri["kategori_adi"];
    kategori_icerik=veri["kategori_icerik"];
  }
  Map<String,dynamic> toMap(){
    return{
      "kategori_id":kategori_id,
      "kategori_adi":kategori_adi,
      "kategori_icerik":kategori_icerik,
    };
  }
  static List<Kategori>liste=[
    
    Kategori(kategori_id: 1, kategori_adi: "CREATIONAL PATTERNS", kategori_icerik:"Creational Patterns(Yaratıcı Kalıp), nesnelerin yaratılması ve yönetilmesi ile ilgilidir. Nesnelerin hangi sınıflarda hangi kurallarla oluşturulacağı, oluşturulan nesneler üzerine yapılacak olan güncellemeler ile ilgili durumları, bağımlılıkların azaltılması ve nesne oluştururken ihtiyaca göre en optimal çözümlerin üretilmesi için geliştirilmiş tasarımlardır."),
    Kategori(kategori_id: 2, kategori_adi: "STRUCTURAL PATTERNS", kategori_icerik: "Structural Pattern(Yapısal Kalıp), bir yazılım sisteminin farklı bileşenlerini nasıl bir araya getireceğimizi, nasıl ilişkilendireceğimizi ve nasıl organize edeceğimizi belirlememize yardımcı olur. Yapısal desenler, programın temel yapısını ve bileşenler arasındaki ilişkileri açıkça tanımlamak için kullanılır. Bu desenler, yazılımın bakımını ve geliştirilmesini kolaylaştırmak ve kodun yeniden kullanılabilirliğini artırmak için önemlidir."),
    Kategori(kategori_id: 3, kategori_adi: "BEHAVIORAL PATTERNS", kategori_icerik: "Behavioral Pattern(Davranışsal Kalıp), yazılım tasarımında nesneler arasındaki işbirliği ve iletişimi düzenlemek için kullanılan tasarım desenleridir. Bu desenler, bir yazılım sistemindeki nesnelerin nasıl bir araya geleceğini, nasıl etkileşimde bulunacaklarını ve nasıl davranacaklarını tanımlar. "),
  ];
}