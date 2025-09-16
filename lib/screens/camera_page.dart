import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/screens/qr_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final MobileScannerController _cameraController;
  StreamSubscription<BarcodeCapture>? _subscription;
  bool _handlingBarcode = false;

  @override
  void initState() {
    super.initState();

    _cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );

    // شروع کردن اسکن و گوش دادن به استریم بارکدها
    _cameraController.start();
    _subscription = _cameraController.barcodes.listen(_onBarcode);
  }

  void _onBarcode(BarcodeCapture capture) {
    if (capture.barcodes.isEmpty) return;
    final barcode = capture.barcodes.first;
    final raw = barcode.rawValue;
    if (raw == null) {
      debugPrint('Failed to scan Barcode');
      return;
    }

    if (_handlingBarcode) return;
    _handlingBarcode = true;

    debugPrint('Barcode found: $raw');
    // TODO: اینجا کاری که بعد از اسکن می‌خوای انجام بدی (مثلاً ناویگیت یا دیالوگ) بنویس

    // بعد از یک تاخیر کوتاه اجازه بده اسکن دوباره انجام بشه
    Future.delayed(const Duration(milliseconds: 800), () {
      _handlingBarcode = false;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: _cameraController,
            // onDetect هم کار می‌کنه، ولی ما از stream بالا استفاده کردیم.
            onDetect: (capture) {},
          ),

          // overlay پروژه شما
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.5),
          ),

          // AppBar ساده بالا
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
                Row(
                  children: [
                    // سوئیچ دوربین
                    _circleButton(
                      onTap: () async => await _cameraController.switchCamera(),
                      child:
                          const Icon(Icons.cameraswitch, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    // دکمه‌ی تورچ — وضعیت را از value (MobileScannerState) می‌خوانیم
                    ValueListenableBuilder<MobileScannerState>(
                      valueListenable: _cameraController,
                      builder: (context, state, child) {
                        final t = state.torchState;
                        IconData icon = Icons.flash_off;
                        Color color = Colors.white;
                        switch (t) {
                          case TorchState.on:
                            icon = Icons.flash_on;
                            color = Colors.yellow;
                            break;
                          case TorchState.off:
                            icon = Icons.flash_off;
                            color = Colors.white;
                            break;
                          case TorchState.unavailable:
                            icon = Icons.flash_off;
                            color = Colors.grey;
                            break;
                          case TorchState.auto:
                            icon = Icons.flash_auto;
                            color = Colors.white;
                            break;
                        }
                        return _circleButton(
                          onTap: () => _cameraController.toggleTorch(),
                          child: Icon(icon, color: color),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({required VoidCallback onTap, required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Constans.primaryColor.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
