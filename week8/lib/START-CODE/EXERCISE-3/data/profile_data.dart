import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan OGOR",
  position: "Flutter Developer",
  avatarUrl: 'assets/images/ronanProfile.webp',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogor@cadt.edu"),
    TileData(icon: Icons.work, title: "Company", value: "CADT"),
    TileData(icon: Icons.cake, title: "Birthday", value: "01 Jan 1990"),
    TileData(icon: Icons.language, title: "Website", value: "www.cadt.edu.kh"),
    TileData(icon: Icons.school, title: "Education", value: "Computer Science"),
    TileData(icon: Icons.sports_soccer, title: "Hobby", value: "Football"),
  ],
);
