import 'package:admin_vce/model/book_model.dart';

class Subscription {
  late String subscription_name;
  late String provider;
  late String? description;
  late String? credentials;
  late List<String> relevance;
  late String? image_address;
  late List<String>? tags;
  late List<Book>? popularPublications;
  late String subscriptionUrl;

  Subscription({
    required this.subscription_name,
    required this.provider,
    this.description,
    this.tags,
    this.image_address,
    this.credentials,
    this.popularPublications,
    required this.relevance,
    required this.subscriptionUrl,
  });
}
