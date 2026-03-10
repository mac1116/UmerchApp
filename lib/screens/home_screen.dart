import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models.dart';
import '../category_card.dart';
import '../product_card.dart';
import '../filter_chip.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  String selectedCategory = 'All';
  String searchQuery = '';
  int cartCount = 0;
  int favoriteCount = 0;
  int _selectedNavIndex = 0;
  int _currentBannerPage = 0;
  final int _bannerCount = 4;
  final PageController _bannerController = PageController();
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSwipe();
  }

  void _startAutoSwipe() {
    _bannerTimer?.cancel();
    _bannerTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (!_bannerController.hasClients) return;
      final nextPage = (_currentBannerPage + 1) % _bannerCount;
      _bannerController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  final List<String> categories = [
    'All',
    'Shirts',
    'Accessories',
    'Bottles',
    'Others',
  ];

  final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'UM CCE Esports Jersey',
      description: 'Premium quality sports jersey',
      price: 500,
      originalPrice: 600,
      imageUrl: 'https://via.placeholder.com/300x300?text=Esports+Jersey',
      stock: 125,
      category: 'Shirts',
      isFavorite: false,
    ),
    Product(
      id: '2',
      name: 'Wooden Tumbler',
      description: 'Eco-friendly wooden tumbler',
      price: 500,
      originalPrice: 600,
      imageUrl: 'https://via.placeholder.com/300x300?text=Wooden+Tumbler',
      stock: 125,
      category: 'Bottles',
      isFavorite: false,
    ),
    Product(
      id: '3',
      name: 'Premium T-Shirt',
      description: 'Comfortable cotton blend',
      price: 350,
      originalPrice: 450,
      imageUrl: 'https://via.placeholder.com/300x300?text=T-Shirt',
      stock: 85,
      category: 'Shirts',
      isFavorite: false,
    ),
    Product(
      id: '4',
      name: 'Stainless Steel Bottle',
      description: 'Keep drinks cold for hours',
      price: 450,
      originalPrice: 600,
      imageUrl: 'https://via.placeholder.com/300x300?text=Steel+Bottle',
      stock: 156,
      category: 'Bottles',
      isFavorite: false,
    ),
    Product(
      id: '5',
      name: 'Campus Cap',
      description: 'Adjustable classic cap',
      price: 250,
      originalPrice: 350,
      imageUrl: 'https://via.placeholder.com/300x300?text=Campus+Cap',
      stock: 200,
      category: 'Accessories',
      isFavorite: false,
    ),
    Product(
      id: '6',
      name: 'Merch Hoodie',
      description: 'Cozy and comfortable hoodie',
      price: 650,
      originalPrice: 850,
      imageUrl: 'https://via.placeholder.com/300x300?text=Hoodie',
      stock: 95,
      category: 'Shirts',
      isFavorite: false,
    ),
    Product(
      id: '7',
      name: 'Branded Bag',
      description: 'Stylish shoulder bag',
      price: 800,
      originalPrice: 1000,
      imageUrl: 'https://via.placeholder.com/300x300?text=Branded+Bag',
      stock: 50,
      category: 'Others',
      isFavorite: false,
    ),
    Product(
      id: '8',
      name: 'Water Bottle Set',
      description: 'Pack of 2 premium bottles',
      price: 900,
      originalPrice: 1200,
      imageUrl: 'https://via.placeholder.com/300x300?text=Bottle+Set',
      stock: 75,
      category: 'Bottles',
      isFavorite: false,
    ),
  ];

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    double iconSize,
    double fontSize,
  ) {
    final isSelected = _selectedNavIndex == index;
    final color = isSelected ? const Color(0xFF9C0306) : Colors.grey;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _selectedNavIndex = index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: iconSize),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Product> getFilteredProducts() {
    List<Product> filtered = allProducts;

    if (selectedCategory != 'All') {
      filtered = filtered.where((p) => p.category == selectedCategory).toList();
    }

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF9C0306),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 30,
            left: 16,
            right: 8,
            bottom: 16,
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: Text(
                        'Y',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Hi, Yosh',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.tune, color: Colors.grey, size: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Special to you',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    controller: _bannerController,
                    onPageChanged: (index) {
                      setState(() => _currentBannerPage = index);
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/crop1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/crop2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/crop3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/crop4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_bannerCount, (index) {
                        return GestureDetector(
                          onTap: () {
                            _bannerController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentBannerPage == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentBannerPage == index
                                  ? const Color(0xFF9C0306)
                                  : Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                    icon: '👕',
                    label: 'Shirt',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Shirts';
                      });
                    },
                  ),
                  CategoryCard(
                    icon: '✨',
                    label: 'Accessories',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Accessories';
                      });
                    },
                  ),
                  CategoryCard(
                    icon: '🍾',
                    label: 'Bottles',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Bottles';
                      });
                    },
                  ),
                  CategoryCard(
                    icon: '🎒',
                    label: 'Others',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Others';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomFilterChip(
                          label: category,
                          isSelected: selectedCategory == category,
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped: ${product.name}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    onFavoriteToggle: (isFavorite) {
                      setState(() {
                        product.isFavorite = isFavorite;
                        isFavorite ? favoriteCount++ : favoriteCount--;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          final iconSize = constraints.maxWidth < 360 ? 20.0 : 24.0;
          final fontSize = constraints.maxWidth < 360 ? 10.0 : 12.0;
          final fabSize = constraints.maxWidth < 360 ? 52.0 : 64.0;
          final fabIconSize = constraints.maxWidth < 360 ? 24.0 : 30.0;
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      Icons.home_filled,
                      'Home',
                      0,
                      iconSize,
                      fontSize,
                    ),
                    _buildNavItem(
                      Icons.search,
                      'Search',
                      1,
                      iconSize,
                      fontSize,
                    ),
                    SizedBox(width: fabSize),
                    _buildNavItem(
                      Icons.favorite_outline,
                      'Favorites',
                      3,
                      iconSize,
                      fontSize,
                    ),
                    _buildNavItem(
                      Icons.person_outline,
                      'Profile',
                      4,
                      iconSize,
                      fontSize,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -(fabSize / 2.4),
                child: GestureDetector(
                  onTap: () {
                    setState(() => _selectedNavIndex = 2);
                  },
                  child: Container(
                    width: fabSize,
                    height: fabSize,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9C0306),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9C0306).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: fabIconSize,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
