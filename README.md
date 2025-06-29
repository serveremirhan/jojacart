Jojocart - Online Alışveriş Uygulaması

Jojocart, satıcılar ve müşterileri bir araya getiren kapsamlı bir online alışveriş platformudur. Kullanıcı dostu arayüzü ve güçlü altyapısı sayesinde satıcılar ürünlerini kolayca yönetirken, müşteriler de geniş ürün yelpazesini keşfedip güvenle alışveriş yapabilir.
Özellikler
Satıcı Paneli

    Ürün Yönetimi: Satıcılar, kendi ürünlerini ekleyebilir, mevcut ürünlerini güncelleyebilir ve silebilir.

    Sipariş Takibi: Gelen siparişleri görüntüleyebilir ve durumlarını yönetebilir.

    Müşteri İletişimi: Müşterilerden gelen mesajlara yanıt verebilir.

    Profil Yönetimi: Satıcı bilgileri güncellenebilir.

Müşteri Paneli

    Ürün Keşfi: Kategorilere göre ürünleri gezebilir ve arama yapabilir.

    Alışveriş Sepeti: Beğendiği ürünleri sepete ekleyebilir ve birden fazla ürünü aynı anda satın alabilir.

    Sipariş Geçmişi: Daha önce verdiği siparişleri görüntüleyebilir.

    Güvenli Ödeme: Güvenli ödeme yöntemleri ile alışverişini tamamlayabilir.

    Profil Yönetimi: Müşteri bilgileri güncellenebilir.

Teknolojiler

Bu web uygulaması aşağıdaki teknolojiler kullanılarak geliştirilmiştir:

    Backend: Java Spring Framework (Servlet)

    Veritabanı: MSSQL

Kurulum ve Çalıştırma

Projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları takip edebilirsiniz:
Gereksinimler

    Java Development Kit (JDK) 17 veya üzeri

    Apache Maven

    MSSQL Server

    IDE (IntelliJ IDEA, Eclipse vb.)

Veritabanı Yapılandırması

    MSSQL Server: Veritabanı sunucunuzda JojocartDB adında bir veritabanı oluşturun.

    Veritabanı Bağlantısı: Projenin src/main/resources/application.properties veya application.yml dosyasında veritabanı bağlantı bilgilerini güncelleyin:

    spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=JojocartDB;
    spring.datasource.username=your_username
    spring.datasource.password=your_password

Projeyi Çalıştırma

    Projeyi klonlayın:
    git clone https://github.com/kullaniciadi/jojocart.git

    Proje dizinine gidin:
    cd jojocart

    Bağımlılıkları indirin ve projeyi derleyin:
    mvn clean install

    Uygulamayı çalıştırın:
    mvn spring-boot:run

Uygulama varsayılan olarak http://localhost:8080 adresinde çalışacaktır.
Lisans

Bu proje, [Lisans Adı] lisansı altında lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasına bakınız.
Katkıda Bulunma

Projeye katkıda bulunmak isterseniz, lütfen bir pull request gönderin veya bir issue açın. Her türlü katkı memnuniyetle karşılanır.
