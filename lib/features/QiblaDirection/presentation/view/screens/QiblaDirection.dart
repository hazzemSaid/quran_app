import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart';

double calculateQiblaDirection(double lat, double lon) {
  const double meccaLat = 21.4225;
  const double meccaLon = 39.8262;

  double deltaLon = radians(meccaLon - lon);
  double latRad = radians(lat);
  double meccaLatRad = radians(meccaLat);

  double y = sin(deltaLon) * cos(meccaLatRad);
  double x = cos(latRad) * sin(meccaLatRad) -
      sin(latRad) * cos(meccaLatRad) * cos(deltaLon);

  double qiblaAngle = atan2(y, x);
  return degrees(qiblaAngle) % 360;
}

class QiblaCompass extends StatefulWidget {
  @override
  _QiblaCompassState createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  double _qiblaDirection = 0; // اتجاه القبلة
  double _currentHeading = 0; // اتجاه الهاتف الحالي
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _getLocationAndCalculateQibla();
    _listenToSensor();
  }

  /// ✅ الحصول على موقع المستخدم وحساب اتجاه القبلة
  void _getLocationAndCalculateQibla() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      double qiblaDirection =
          calculateQiblaDirection(position.latitude, position.longitude);
      setState(() {
        _qiblaDirection = qiblaDirection;
      });
      print("Qibla Angle: $_qiblaDirection");
    } catch (e) {
      print("خطأ في تحديد الموقع: $e");
    }
  }

  /// ✅ قراءة مستشعر البوصلة وتحديث الاتجاه
  void _listenToSensor() {
    _subscription = magnetometerEvents.listen((MagnetometerEvent event) {
      double heading = atan2(event.y, event.x) * (180 / pi);
      if (heading < 0) heading += 360;

      setState(() {
        _currentHeading = heading;
      });
      print("Current Heading: $_currentHeading");
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 🔄 احسب الفرق بين اتجاه الهاتف واتجاه القبلة
    double direction = (_qiblaDirection - _currentHeading + 360) % 360;
    direction = direction - 90; // لتغيير اتجاه الصورة
    print("Direction: $direction");

    return Scaffold(
      appBar: AppBar(title: Text('بوصلة القبلة')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🧭 صورة البوصلة كخلفية

            /// 📍 أيقونة تشير إلى اتجاه القبلة (الكعبة)
            Transform.rotate(
                angle: -radians(direction), // لاحظ الإشارة السالبة هنا
                child: Icon(
                  Icons.location_on,
                  size: 50,
                )),
          ],
        ),
      ),
    );
  }
}
