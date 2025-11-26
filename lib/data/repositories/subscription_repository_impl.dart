import 'dart:async';
import 'dart:io';
import 'package:flutter_app_template/domain/entities/subscription_product.dart';
import 'package:flutter_app_template/domain/repositories/subscription_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final StreamController<bool> _subscriptionController = StreamController<bool>.broadcast();

  final Set<String> _productIds = {
    'your_subscription_product_id',
  };

  @override
  Future<void> initialize() async {
    final bool available = await _inAppPurchase.isAvailable();
    if (!available) {
      throw Exception('In-app purchases not available');
    }

    _inAppPurchase.purchaseStream.listen((purchaseDetailsList) {
      _handlePurchaseUpdates(purchaseDetailsList);
    });

    await _checkSubscriptionStatus();
  }

  @override
  Future<List<SubscriptionProduct>> getProducts() async {
    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(_productIds);

    if (response.error != null) {
      throw Exception('Failed to fetch products: ${response.error}');
    }

    if (response.productDetails.isEmpty) {
      return [];
    }

    return response.productDetails.map((productDetails) {
      return SubscriptionProduct(
        id: productDetails.id,
        title: productDetails.title,
        description: productDetails.description,
        price: productDetails.price,
        currencyCode: productDetails.currencyCode,
      );
    }).toList();
  }

  @override
  Future<bool> purchaseProduct(String productId) async {
    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails({productId});

    if (response.productDetails.isEmpty) {
      return false;
    }

    final ProductDetails productDetails = response.productDetails.first;
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);

    return await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  @override
  Future<bool> restorePurchases() async {
    try {
      await _inAppPurchase.restorePurchases();
      await _checkSubscriptionStatus();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isSubscribed() async {
    await _checkSubscriptionStatus();
    return _subscriptionController.hasListener ? false : false;
  }

  @override
  Stream<bool> get subscriptionStream => _subscriptionController.stream;

  Future<void> _checkSubscriptionStatus() async {
    try {
      await _inAppPurchase.restorePurchases();
    } catch (e) {
      _subscriptionController.add(false);
    }
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        _subscriptionController.add(true);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        _subscriptionController.add(false);
      }

      if (purchaseDetails.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  }

  void dispose() {
    _subscriptionController.close();
  }
}
