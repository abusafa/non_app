import 'dart:convert';

import 'package:http/http.dart' as http;
class ProductData {
  Product product;
  Meta meta;
  String type;
  String canonicalUrl;

  ProductData({this.product, this.meta, this.type, this.canonicalUrl});

  ProductData.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    type = json['type'];
    canonicalUrl = json['canonical_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['type'] = this.type;
    data['canonical_url'] = this.canonicalUrl;
    return data;
  }

  static getData(String url) async {
    http.Response r  = await http.get(url);
    ProductData data = ProductData.fromJson(jsonDecode(r.body));
    return data;
  }
}

class Product {
  String sku;
  List<Breadcrumbs> breadcrumbs;
  String productTitle;
  String brand;
  String brandCode;
  String longDescription;
  List<String> featureBullets;
  List<Specifications> specifications;
  List<String> imageKeys;
  String sizingGuide;
  int estimatedDeliveryCity;
  List<Variants> variants;
  dynamic attachments;
  List<Groups> groups;
  List<FbtOffers> fbtOffers;
  List<RichContent> richContent;
  List<dynamic> buyingOptions;

  Product(
      {this.sku,
      this.breadcrumbs,
      this.productTitle,
      this.brand,
      this.brandCode,
      this.longDescription,
      this.featureBullets,
      this.specifications,
      this.imageKeys,
      this.sizingGuide,
      this.estimatedDeliveryCity,
      this.variants,
      this.attachments,
      this.groups,
      this.fbtOffers,
      this.richContent,
      this.buyingOptions});

  Product.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    if (json['breadcrumbs'] != null) {
      breadcrumbs = new List<Breadcrumbs>();
      json['breadcrumbs'].forEach((v) {
        breadcrumbs.add(new Breadcrumbs.fromJson(v));
      });
    }
    productTitle = json['product_title'];
    brand = json['brand'];
    brandCode = json['brand_code'];
    longDescription = json['long_description'];
    featureBullets = json['feature_bullets'].cast<String>();
    if (json['specifications'] != null) {
      specifications = new List<Specifications>();
      json['specifications'].forEach((v) {
        specifications.add(new Specifications.fromJson(v));
      });
    }
    imageKeys = json['image_keys'].cast<String>();
    sizingGuide = json['sizing_guide'];
    estimatedDeliveryCity = json['estimated_delivery_city'];
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    attachments = json['attachments'];
    if (json['groups'] != null) {
      groups = new List<Groups>();
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
    if (json['fbt_offers'] != null) {
      fbtOffers = new List<FbtOffers>();
      json['fbt_offers'].forEach((v) {
        fbtOffers.add(new FbtOffers.fromJson(v));
      });
    }
    if (json['rich_content'] != null) {
      richContent = new List<RichContent>();
      json['rich_content'].forEach((v) {
        richContent.add(new RichContent.fromJson(v));
      });
    }

    if (json['buying_options'] != null) {
      buyingOptions = new List<String>();
      json['buying_options'].forEach((v) {
        buyingOptions.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sku'] = this.sku;
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs.map((v) => v.toJson()).toList();
    }
    data['product_title'] = this.productTitle;
    data['brand'] = this.brand;
    data['brand_code'] = this.brandCode;
    data['long_description'] = this.longDescription;
    data['feature_bullets'] = this.featureBullets;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications.map((v) => v.toJson()).toList();
    }
    data['image_keys'] = this.imageKeys;
    data['sizing_guide'] = this.sizingGuide;
    data['estimated_delivery_city'] = this.estimatedDeliveryCity;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments.toJson();
    }
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    if (this.fbtOffers != null) {
      data['fbt_offers'] = this.fbtOffers.map((v) => v.toJson()).toList();
    }
    if (this.richContent != null) {
      data['rich_content'] = this.richContent.map((v) => v.toJson()).toList();
    }
    if (this.buyingOptions != null) {
      data['buying_options'] =
          this.buyingOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RichContent {
  List<Modules> modules;

  RichContent({this.modules});

  RichContent.fromJson(Map<String, dynamic> json) {
    if (json['modules'] != null) {
      modules = new List<Modules>();
      json['modules'].forEach((v) {
        modules.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modules {
  String type;
  int numPerRow;
  OuterSpacing outerSpacing;
  List<Banners> banners;

  Modules({this.type, this.numPerRow, this.outerSpacing, this.banners});

  Modules.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    numPerRow = json['numPerRow'];
    outerSpacing = json['outerSpacing'] != null
        ? new OuterSpacing.fromJson(json['outerSpacing'])
        : null;
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['numPerRow'] = this.numPerRow;
    if (this.outerSpacing != null) {
      data['outerSpacing'] = this.outerSpacing.toJson();
    }
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OuterSpacing {
  int top;
  int bottom;

  OuterSpacing({this.top, this.bottom});

  OuterSpacing.fromJson(Map<String, dynamic> json) {
    top = json['top'];
    bottom = json['bottom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['top'] = this.top;
    data['bottom'] = this.bottom;
    return data;
  }
}

class Banners {
  String imageUrl;

  Banners({this.imageUrl});

  Banners.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class FbtOffers {
  String title;
  String sku;
  String imageKey;
  String offerCode;
  double price;
  double salePrice;
  List<String> flags;

  FbtOffers(
      {this.title,
      this.sku,
      this.imageKey,
      this.offerCode,
      this.price,
      this.salePrice,
      this.flags});

  FbtOffers.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sku = json['sku'];
    imageKey = json['image_key'];
    offerCode = json['offer_code'];
    price = json['price'] == null ? double.tryParse("${json['price']}") : 0.0;
    salePrice = json['sale_price'] != null
        ? double.parse("${json['sale_price']}")
        : 0.0;
    flags = json['flags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sku'] = this.sku;
    data['image_key'] = this.imageKey;
    data['offer_code'] = this.offerCode;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['flags'] = this.flags;
    return data;
  }
}

class Groups {
  String name;
  List<Options> options;

  Groups({this.name, this.options});

  Groups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String name;
  String sku;
  int isAvailable;
  String imageKey;

  Options({this.name, this.sku, this.isAvailable, this.imageKey});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sku = json['sku'];
    isAvailable = json['is_available'];
    imageKey = json['image_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['is_available'] = this.isAvailable;
    data['image_key'] = this.imageKey;
    return data;
  }
}

class Breadcrumbs {
  String name;
  String code;

  Breadcrumbs({this.name, this.code});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Specifications {
  String name;
  String code;
  String value;

  Specifications({this.name, this.code, this.value});

  Specifications.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['value'] = this.value;
    return data;
  }
}

class Variants {
  String sku;
  String variant;
  List<Offers> offers;

  Variants({this.sku, this.variant, this.offers});

  Variants.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    variant = json['variant'];
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sku'] = this.sku;
    data['variant'] = this.variant;
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String offerCode;
  String sku;
  String skuConfig;
  int stock;
  int price;
  bool isBuyable;
  int salePrice;
  bool isReturnable;
  Null note;
  int isFbn;
  String estimatedDelivery;
  String estimatedDeliveryDate;
  String estimatedDeliveryExpires;
  List<String> flags;
  String catalogTagType;
  String catalogTag;
  bool emiValue;
  String estimatedDeliveryTimeSlot;
  dynamic shippingPreference;
  String storeName;
  String storeCode;
  List<Null> sellerRatings;
  String warranty;

  Offers(
      {this.offerCode,
      this.sku,
      this.skuConfig,
      this.stock,
      this.price,
      this.isBuyable,
      this.salePrice,
      this.isReturnable,
      this.note,
      this.isFbn,
      this.estimatedDelivery,
      this.estimatedDeliveryDate,
      this.estimatedDeliveryExpires,
      this.flags,
      this.catalogTagType,
      this.catalogTag,
      this.emiValue,
      this.estimatedDeliveryTimeSlot,
      this.shippingPreference,
      this.storeName,
      this.storeCode,
      this.sellerRatings,
      this.warranty});

  Offers.fromJson(Map<String, dynamic> json) {
    offerCode = json['offer_code'];
    sku = json['sku'];
    skuConfig = json['sku_config'];
    stock = json['stock'];
    price = json['price'];
    isBuyable = json['is_buyable'];
    salePrice = json['sale_price'];
    isReturnable = json['is_returnable'];
    note = json['note'];
    isFbn = json['is_fbn'];
    estimatedDelivery = json['estimated_delivery'];
    estimatedDeliveryDate = json['estimated_delivery_date'];
    estimatedDeliveryExpires = json['estimated_delivery_expires'];
    flags = json['flags'].cast<String>();
    catalogTagType = json['catalog_tag_type'];
    catalogTag = json['catalog_tag'];
    emiValue = json['emi_value'];
    estimatedDeliveryTimeSlot = json['estimated_delivery_time_slot'];
    shippingPreference = json['shipping_preference'];
    storeName = json['store_name'];
    storeCode = json['store_code'];
    if (json['seller_ratings'] != null) {
      sellerRatings = new List<Null>();
      json['seller_ratings'].forEach((v) {
        sellerRatings.add(v);
      });
    }
    warranty = json['warranty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_code'] = this.offerCode;
    data['sku'] = this.sku;
    data['sku_config'] = this.skuConfig;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['is_buyable'] = this.isBuyable;
    data['sale_price'] = this.salePrice;
    data['is_returnable'] = this.isReturnable;
    data['note'] = this.note;
    data['is_fbn'] = this.isFbn;
    data['estimated_delivery'] = this.estimatedDelivery;
    data['estimated_delivery_date'] = this.estimatedDeliveryDate;
    data['estimated_delivery_expires'] = this.estimatedDeliveryExpires;
    data['flags'] = this.flags;
    data['catalog_tag_type'] = this.catalogTagType;
    data['catalog_tag'] = this.catalogTag;
    data['emi_value'] = this.emiValue;
    data['estimated_delivery_time_slot'] = this.estimatedDeliveryTimeSlot;
    if (this.shippingPreference != null) {
      data['shipping_preference'] = this.shippingPreference.toJson();
    }
    data['store_name'] = this.storeName;
    data['store_code'] = this.storeCode;
    if (this.sellerRatings != null) {
      data['seller_ratings'] = this.sellerRatings.map((v) => v).toList();
    }
    data['warranty'] = this.warranty;
    return data;
  }
}

class Meta {
  String h1;
  String title;
  String desc;

  Meta({this.h1, this.title, this.desc});

  Meta.fromJson(Map<String, dynamic> json) {
    h1 = json['h1'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['h1'] = this.h1;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}
