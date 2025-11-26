import 'package:flutter_app_template/domain/entities/subscription_product.dart';

abstract class SubscriptionRepository {
  Future<void> initialize();

  Future<List<SubscriptionProduct>> getProducts();

  Future<bool> purchaseProduct(String productId);

  Future<bool> restorePurchases();

  Future<bool> isSubscribed();

  Stream<bool> get subscriptionStream;
}
