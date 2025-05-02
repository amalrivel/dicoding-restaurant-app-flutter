1. Memulai dengan Model Data
Mulai dengan membuat model data karena ini adalah fondasi aplikasi Anda:

Model dasar (data/models/)
Buat restaurant.dart terlebih dahulu untuk model dasar
Lanjutkan dengan restaurant_list.dart untuk menampung hasil API /list
Implementasikan model lain seperti category.dart, menu_item.dart, dll.
Model ini akan menjadi dasar untuk deserialisasi JSON dari API.

2. Implementasi API Service
Setelah model dibuat, buat service untuk berkomunikasi dengan API:

API Constants (config/constants/api_constants.dart)

Definisikan base URL dan endpoint
API Service (data/services/api_service.dart)

Implementasikan metode getRestaurants() untuk mendapatkan daftar restoran
Buatlah service untuk mengkonversi response JSON ke model Anda


3. Repository Layer
Implementasikan repository yang akan menjadi jembatan antara UI dan data source:

Restaurant Repository (data/repositories/restaurant_repository.dart)
Gunakan API Service untuk mendapatkan data
Tambahkan logic untuk caching jika diperlukan


. State Management dengan Provider
Buat provider untuk mengelola state:

Restaurant Provider (providers/restaurant_provider.dart)
Gunakan repository untuk mendapatkan data
Implementasikan state untuk loading, error, dan data


5. Implementasikan UI Dasar
Setelah data layer siap, mulai dengan UI dasar:

HomeScreen (ui/screens/home_screen.dart)

Implementasikan UI untuk menampilkan daftar restoran
Gunakan provider untuk mendapatkan data
Restaurant Card (ui/widgets/restaurant/restaurant_card.dart)

Buat widget card untuk menampilkan restoran dalam daftar


. Tambahkan Detail Restoran
Implementasikan fungsi detail restoran:

Detail Model (data/models/restaurant_detail.dart)

Tambahkan model untuk detail restoran
Detail Service (data/services/api_service.dart)

Tambahkan metode getRestaurantDetail()
Detail Provider (providers/restaurant_detail_provider.dart)

Buat provider untuk mengelola state detail restoran
Detail Screen (ui/screens/restaurant_detail_screen.dart)

Implementasikan UI untuk menampilkan detail restoran

7. Fitur Pencarian
Tambahkan fungsi pencarian:

Search Service (dalam api_service.dart)

Tambahkan metode searchRestaurants()
Search UI (ui/screens/search_screen.dart)

Implementasikan UI pencarian

8. Fitur Review
Terakhir, implementasikan fitur review:

Add Review Service (dalam api_service.dart)

Tambahkan metode addReview()
Review UI (ui/widgets/restaurant_detail/add_review_form.dart)

Implementasikan form untuk menambahkan review
