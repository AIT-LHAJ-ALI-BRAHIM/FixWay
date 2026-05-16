import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/worker_map_marker.dart';
import '../widgets/category_chips.dart';

// ── Data model for a worker shown on the map ──
class MapWorker {
  final String id;
  final String name;
  final String categoryId;
  final String assetPath;
  final LatLng location;
  final double rating;

  const MapWorker({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.assetPath,
    required this.location,
    required this.rating,
  });
}

// ── Data model for profession category ──
class ProfessionCategory {
  final String id;
  final String name;
  final String iconAsset;
  final IconData fallbackIcon;

  const ProfessionCategory({
    required this.id,
    required this.name,
    required this.iconAsset,
    required this.fallbackIcon,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;
  String? _selectedCategoryId;
  bool _showPanel = false;

  // ── Casablanca center (Morocco) ──
  final LatLng _mapCenter = const LatLng(33.5731, -7.5898);

  // ── Profession categories ──
  final List<ProfessionCategory> _categories = const [
    ProfessionCategory(
      id: 'plumbing',
      name: 'Plumbing',
      iconAsset: 'assets/images/workers/Plompier.png',
      fallbackIcon: Icons.plumbing,
    ),
    ProfessionCategory(
      id: 'electrical',
      name: 'Electrical',
      iconAsset: 'assets/images/workers/electricite.png',
      fallbackIcon: Icons.electrical_services,
    ),
    ProfessionCategory(
      id: 'carpentry',
      name: 'Carpentry',
      iconAsset: 'assets/images/workers/njar-circle (1).png',
      fallbackIcon: Icons.carpenter,
    ),
    ProfessionCategory(
      id: 'painting',
      name: 'Painting',
      iconAsset: 'assets/images/workers/Painter.png',
      fallbackIcon: Icons.format_paint,
    ),
    ProfessionCategory(
      id: 'cleaning',
      name: 'Cleaning',
      iconAsset: 'assets/images/workers/cleaner.png',
      fallbackIcon: Icons.cleaning_services,
    ),
    ProfessionCategory(
      id: 'mechanic',
      name: 'Mechanic',
      iconAsset: 'assets/images/workers/mechanic_37-circle.png',
      fallbackIcon: Icons.build,
    ),
    ProfessionCategory(
      id: 'blacksmith',
      name: 'Blacksmith',
      iconAsset: 'assets/images/workers/blachsmith copy.png',
      fallbackIcon: Icons.hardware,
    ),
    ProfessionCategory(
      id: 'gypsum',
      name: 'Gypsum',
      iconAsset: 'assets/images/workers/Gypus.png',
      fallbackIcon: Icons.grid_view_rounded,
    ),
    ProfessionCategory(
      id: 'hairdresser_m',
      name: 'Barber',
      iconAsset: 'assets/images/workers/coifure.png',
      fallbackIcon: Icons.content_cut,
    ),
    ProfessionCategory(
      id: 'hairdresser_f',
      name: 'Hair Stylist',
      iconAsset: 'assets/images/workers/coifure-Famale.png',
      fallbackIcon: Icons.face,
    ),
    ProfessionCategory(
      id: 'gardener',
      name: 'Gardener',
      iconAsset: 'assets/images/workers/jardiner.png',
      fallbackIcon: Icons.grass,
    ),
    ProfessionCategory(
      id: 'delivery',
      name: 'Delivery',
      iconAsset: 'assets/images/workers/delivery.png',
      fallbackIcon: Icons.local_shipping,
    ),
    ProfessionCategory(
      id: 'driver',
      name: 'Driver',
      iconAsset: 'assets/images/workers/driver.png',
      fallbackIcon: Icons.drive_eta,
    ),
    ProfessionCategory(
      id: 'aluminium',
      name: 'Aluminium',
      iconAsset: 'assets/images/workers/ALIMNUM-circle (1).png',
      fallbackIcon: Icons.window,
    ),
    ProfessionCategory(
      id: 'constructor',
      name: 'Constructor',
      iconAsset: 'assets/images/workers/constractor.png',
      fallbackIcon: Icons.construction,
    ),
    ProfessionCategory(
      id: 'electronics',
      name: 'Electronics',
      iconAsset: 'assets/images/workers/electronic.png',
      fallbackIcon: Icons.memory,
    ),
    ProfessionCategory(
      id: 'auto_electric',
      name: 'Auto Electric',
      iconAsset: 'assets/images/workers/alectri_mechanic.png',
      fallbackIcon: Icons.electric_car,
    ),
    ProfessionCategory(
      id: 'signage',
      name: 'Signage',
      iconAsset: 'assets/images/workers/signer.png',
      fallbackIcon: Icons.signpost,
    ),
  ];

  // ── Mock workers on the map (later from backend) ──
  final List<MapWorker> _workers = const [
    MapWorker(
      id: '1',
      name: 'Ahmed',
      categoryId: 'plumbing',
      assetPath: 'assets/images/workers/Plompier.png',
      location: LatLng(33.5770, -7.5850),
      rating: 4.8,
    ),
    MapWorker(
      id: '2',
      name: 'Youssef',
      categoryId: 'electrical',
      assetPath: 'assets/images/workers/electricite.png',
      location: LatLng(33.5700, -7.5920),
      rating: 4.5,
    ),
    MapWorker(
      id: '3',
      name: 'Hassan',
      categoryId: 'painting',
      assetPath: 'assets/images/workers/Painter.png',
      location: LatLng(33.5750, -7.5800),
      rating: 4.9,
    ),
    MapWorker(
      id: '4',
      name: 'Karim',
      categoryId: 'mechanic',
      assetPath: 'assets/images/workers/mechanic_37-circle.png',
      location: LatLng(33.5680, -7.5870),
      rating: 4.7,
    ),
    MapWorker(
      id: '5',
      name: 'Said',
      categoryId: 'cleaning',
      assetPath: 'assets/images/workers/cleaner.png',
      location: LatLng(33.5800, -7.5950),
      rating: 4.3,
    ),
    MapWorker(
      id: '6',
      name: 'Omar',
      categoryId: 'delivery',
      assetPath: 'assets/images/workers/delivery.png',
      location: LatLng(33.5720, -7.5750),
      rating: 4.6,
    ),
    MapWorker(
      id: '7',
      name: 'Rachid',
      categoryId: 'carpentry',
      assetPath: 'assets/images/workers/njar-circle (1).png',
      location: LatLng(33.5760, -7.5980),
      rating: 4.4,
    ),
    MapWorker(
      id: '8',
      name: 'Fatima',
      categoryId: 'hairdresser_f',
      assetPath: 'assets/images/workers/coifure-Famale.png',
      location: LatLng(33.5690, -7.5780),
      rating: 4.9,
    ),
    MapWorker(
      id: '9',
      name: 'Ali',
      categoryId: 'blacksmith',
      assetPath: 'assets/images/workers/blachsmith copy.png',
      location: LatLng(33.5810, -7.5830),
      rating: 4.2,
    ),
    MapWorker(
      id: '10',
      name: 'Driss',
      categoryId: 'gypsum',
      assetPath: 'assets/images/workers/Gypus.png',
      location: LatLng(33.5740, -7.5900),
      rating: 4.1,
    ),
    MapWorker(
      id: '11',
      name: 'Nour',
      categoryId: 'gardener',
      assetPath: 'assets/images/workers/jardiner.png',
      location: LatLng(33.5660, -7.5960),
      rating: 4.6,
    ),
    MapWorker(
      id: '12',
      name: 'Khalid',
      categoryId: 'constructor',
      assetPath: 'assets/images/workers/constractor.png',
      location: LatLng(33.5790, -7.5710),
      rating: 4.8,
    ),
  ];

  List<MapWorker> get _filteredWorkers {
    if (_selectedCategoryId == null) return _workers;
    return _workers.where((w) => w.categoryId == _selectedCategoryId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──
            _buildHeader(context),

            // ── Map + Overlay Panel ──
            Expanded(
              child: Stack(
                children: [
                  // Map
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: _mapCenter,
                      initialZoom: 13.5,
                      minZoom: 5,
                      maxZoom: 18,
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.all,
                      ),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.fixway.app',
                      ),
                      MarkerLayer(
                        markers: _filteredWorkers.map((worker) {
                          return Marker(
                            point: worker.location,
                            width: 56,
                            height: 56,
                            child: WorkerMapMarker(
                              assetPath: worker.assetPath,
                              onTap: () => _showWorkerPreview(context, worker),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  // ── Inline bottom panel ──
                  if (_showPanel)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildInlinePanel(context),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ── Bottom Navigation Bar ──
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // ══════════════════════════════════════════════════
  //  HEADER
  // ══════════════════════════════════════════════════
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row: logo + centered greeting + notification
          Row(
            children: [
              // App Logo (Left)
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  'assets/images/applogo.png',
                  fit: BoxFit.contain,
                ),
              ),
              // Centered greeting
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Hello, Ahmed!',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: const Color(0xFF191B22),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Find trusted professionals near you',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Notification bell (Right) - balanced width to ensure text is perfectly centered
              SizedBox(
                width: 80,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF191B22),
                          size: 24,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════
  //  INLINE BOTTOM PANEL (categories + find worker)
  // ══════════════════════════════════════════════════
  Widget _buildInlinePanel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // Category chips (horizontal scroll)
          CategoryChips(
            categories: _categories,
            selectedCategoryId: _selectedCategoryId,
            onCategorySelected: (id) {
              setState(() {
                _selectedCategoryId = _selectedCategoryId == id ? null : id;
              });
            },
          ),
          const SizedBox(height: 16),
          // Find Worker button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigate to service request flow
                },
                icon: const Icon(Icons.add, size: 20),
                label: const Text(
                  'Find worker',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0047AB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Subtitle
          Text(
            'Describe your problem and get offers',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════
  //  BOTTOM NAVIGATION
  // ══════════════════════════════════════════════════
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(0, Icons.home_filled, 'Home'),
                  _buildNavItem(1, Icons.assignment_outlined, 'My Requests'),
                  const SizedBox(width: 48), // Space for floating button
                  _buildNavItem(3, Icons.local_offer_outlined, 'Offers'),
                  _buildNavItem(4, Icons.person_outline, 'Profile'),
                ],
              ),
              // Floating Center Button
              Positioned(
                top: -30,
                child: GestureDetector(
                  onTap: () {
                    setState(() => _showPanel = !_showPanel);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2962FF), // Vibrant blue
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ), // The white ring around the button
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2962FF).withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _showPanel ? Icons.close : Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = _currentNavIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentNavIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF0047AB) : Colors.grey[400],
            size: 24,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
              color: isActive ? const Color(0xFF0047AB) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════
  //  WORKER PREVIEW BOTTOM SHEET
  // ══════════════════════════════════════════════════
  void _showWorkerPreview(BuildContext context, MapWorker worker) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Worker image
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF0047AB),
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(worker.assetPath, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Worker info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          worker.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _categories
                              .firstWhere((c) => c.id == worker.categoryId)
                              .name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Rating
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          worker.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    // TODO: Navigate to worker profile / request
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0047AB),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'View Profile',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
