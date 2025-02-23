import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  int _selectedIndex = 1; // Default selected tab is "Home"
  final PanelController _panelController = PanelController();
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  final Location _location = Location();
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check location permission
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get current location
    _currentLocation = await _location.getLocation();
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("current_location"),
          position:
              LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          infoWindow: const InfoWindow(title: "You are here"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });

    // Move camera to current location
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        14.0, // Adjust zoom level as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Google Maps
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentLocation != null
                    ? LatLng(_currentLocation!.latitude!,
                        _currentLocation!.longitude!)
                    : const LatLng(14.5995,
                        120.9842), // Default to Manila if location is not fetched yet
                zoom: 14.0,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                _fetchCurrentLocation();
              },
            ),
          ),

          // Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            minHeight: 40,
            maxHeight: _selectedIndex == 1
                ? 40
                : 400, // Disable dragging when Home is active
            isDraggable: _selectedIndex != 1, // Disable dragging for Home tab
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            panel: _buildPanelContent(),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: const Color(0xFF282931),
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          Icon(Icons.tips_and_updates, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.route, color: Colors.white),
        ],
      ),
    );
  }

  // Handle bottom navigation bar clicks
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 1) {
        _panelController.close(); // Hide panel when Home is active
      } else {
        _panelController.open(); // Show panel for other sections
      }
    });
  }

  // Drag Handle Click Logic
  void _handleDragHandleClick() {
    if (_selectedIndex == 1) {
      _onItemTapped(0);
    } else {
      if (_panelController.isPanelClosed) {
        _panelController.open();
      } else {
        _panelController.close();
      }
    }
  }

  // Build panel content with drag handle
  Widget _buildPanelContent() {
    return Column(
      children: [
        GestureDetector(
          onTap: _handleDragHandleClick,
          child: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Expanded(
          child: _selectedIndex == 0
              ? _buildTipsContent()
              : _selectedIndex == 2
                  ? _buildRoutesContent()
                  : Container(),
        ),
      ],
    );
  }

  // Tips & Updates Content
  Widget _buildTipsContent() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Generative AI Insights",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Generative AI can help enhance user experience by providing real-time updates and route optimizations...",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Routes Content with Clickable Cards
  Widget _buildRoutesContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildRouteCard("Route A"),
          _buildRouteCard("Route B"),
          _buildRouteCard("Route C"),
        ],
      ),
    );
  }

  // Helper function to create route cards
  Widget _buildRouteCard(String title) {
    return GestureDetector(
      onTap: () {
        print("$title clicked!");
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
