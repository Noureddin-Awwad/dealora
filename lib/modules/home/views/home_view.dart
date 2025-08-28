import 'package:dealoraa/modules/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/banner_section.dart';
import '../widgets/cashback_banner.dart';
import '../widgets/flight_card.dart';
import '../widgets/horizontal_categories.dart';
import '../widgets/hotel_card.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DealoraAppBar(),
      body: ListView(
        children: [

          ///Cashback wallet
          const CashbackBanner(balance: 3,purchases: 3,cashback: 3,),

          ///Shops categories
          SectionTitle(
            title: "Shops",
            onViewAll: () {
              // Navigate to shops list
            },
          ),
          HorizontalCategoryStories(
            categories: [
              CategoryModel(title: 'Temu', imageUrl: 'https://logo.clearbit.com/temu.com'),
              CategoryModel(title: 'Shein', imageUrl: 'https://logo.clearbit.com/shein.com'),
              CategoryModel(title: 'AliExpress', imageUrl: 'https://logo.clearbit.com/aliexpress.com'),
              CategoryModel(title: 'eBay', imageUrl: 'https://logo.clearbit.com/ebay.com'),
            ],
            onTap: (category) {
              // Handle category tap
            },
          ),

          ///Banner Section
          const BannerSection(),

          ///Product Section

          SectionTitle(
            title: "Products",
            onViewAll: () {},
          ),

          SizedBox(
            height: 355,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: 6,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                  shopLogoUrl: 'https://logo.clearbit.com/temu.com',
                  title: 'Wireless Earbuds with Long Battery Life',
                  price: '\$24.99',
                  oldPrice: '\$39.99',
                  cashback: '7%',
                  shopName: 'Temu',
                  rating: 4.7,
                  inStock: true,
                  onCompare: () => print("Compare tapped"),
                  onTapFavorite: () => print("Favorited"),
                  onTap: () => print("Product tapped"),
                );
              },
            ),
          ),

          ///Flight Section

          SectionTitle(
            title: "Flights",
            onViewAll: () {},
          ),


          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 340, // ✅ match this with your FlightCard width
                  child: FlightCard(
                    departureCity: 'Beirut',
                    arrivalCity: 'Istanbul',
                    flightTime: '2h 45m',
                    flightDate: '12 Aug, 2025',
                    airlineLogo: 'https://logo.clearbit.com/turkishairlines.com',
                    airlineName: 'Turkish Airlines',
                    websiteName: 'Booking.com',
                    price: '\$129.99',
                    cashback: '6%',
                    flightClass: 'Economy', // ✨ Add this
                    onTap: () => print("Tapped"),
                  ),

                );
              },
            ),
          ),



          /// Hotels Section
          SectionTitle(
            title: "Hotels",
            onViewAll: () {},
          ),

          SizedBox(
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HotelCard(
                  imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                  name: 'Grand Plaza Hotel',
                  location: 'Downtown City',
                  rating: 4.5,
                  reviewCount: 128,
                  distanceKm: 0.8,
                  pricePerNight: 120,
                  amenities: [
                    Icons.wifi,
                    Icons.pool,
                    Icons.local_parking,
                    Icons.fitness_center,
                  ],
                  onTapBook: () {
                    // navigate to booking screen or open link
                  },
                ),
                // …more cards…
              ],
            ),
          ),




        ],
      ),
    );
  }
}
