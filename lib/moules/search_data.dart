import 'dart:convert';

import 'package:http/http.dart' as http;
class SearchData {
  String canonicalUrl;
  List<Breadcrumbs> breadcrumbs;
  int nbHits;
  int nbPages;
  List<Facets> facets;
  Search search;
  List<Hits> hits;
  String searchEngine;
  String viewType;
  Meta meta;
  dynamic cms;
  String type;

  SearchData(
      {this.canonicalUrl,
      this.breadcrumbs,
      this.nbHits,
      this.nbPages,
      this.facets,
      this.search,
      this.hits,
      this.searchEngine,
      this.viewType,
      this.meta,
      this.cms,
      this.type});

  SearchData.fromJson(Map<String, dynamic> json) {
    canonicalUrl = json['canonical_url'];
    if (json['breadcrumbs'] != null) {
      breadcrumbs = new List<Breadcrumbs>();
      json['breadcrumbs'].forEach((v) {
        breadcrumbs.add(new Breadcrumbs.fromJson(v));
      });
    }
    nbHits = json['nbHits'];
    nbPages = json['nbPages'];
    if (json['facets'] != null) {
      facets = new List<Facets>();
      json['facets'].forEach((v) {
        facets.add(new Facets.fromJson(v));
      });
    }
    search =
        json['search'] != null ? new Search.fromJson(json['search']) : null;
    if (json['hits'] != null) {
      hits = new List<Hits>();
      json['hits'].forEach((v) {
        hits.add(new Hits.fromJson(v));
      });
    }
    searchEngine = json['searchEngine'];
    viewType = json['viewType'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    cms = json['cms'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canonical_url'] = this.canonicalUrl;
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs.map((v) => v.toJson()).toList();
    }
    data['nbHits'] = this.nbHits;
    data['nbPages'] = this.nbPages;
    if (this.facets != null) {
      data['facets'] = this.facets.map((v) => v.toJson()).toList();
    }
    if (this.search != null) {
      data['search'] = this.search.toJson();
    }
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
    data['searchEngine'] = this.searchEngine;
    data['viewType'] = this.viewType;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.cms != null) {
      data['cms'] = this.cms.toJson();
    }
    data['type'] = this.type;
    return data;
  }

  static getData(String url) async {
    http.Response r  = await http.get(url);
    SearchData data = SearchData.fromJson(jsonDecode(r.body));
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

class Facets {
  String code;
  String name;
  String type;
  dynamic data;

  Facets({this.code, this.name, this.type, this.data});

  Facets.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    type = json['type'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['type'] = this.type;
    data['data'] = this.data;

    return data;
  }
}

class Data {
  String name;
  String code;
  int count;
  int idCategory;
  int idParent;
  int sortKey;

  Data(
      {this.name,
      this.code,
      this.count,
      this.idCategory,
      this.idParent,
      this.sortKey});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    count = json['count'];
    idCategory = json['id_category'];
    idParent = json['id_parent'];
    sortKey = json['sort_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['count'] = this.count;
    data['id_category'] = this.idCategory;
    data['id_parent'] = this.idParent;
    data['sort_key'] = this.sortKey;
    return data;
  }
}

class Search {
  List<dynamic> brand;
  dynamic category;
  List<dynamic> filterKey;
  Sort sort;
  int limit;
  int page;

  Search(
      {this.brand,
      this.category,
      this.filterKey,
      this.sort,
      this.limit,
      this.page});

  Search.fromJson(Map<String, dynamic> json) {
    if (json['brand'] != null) {
      brand = new List<dynamic>();
      json['brand'].forEach((v) {
        brand.add(v);
      });
    }
    category = json['category'];
    if (json['filterKey'] != null) {
      filterKey = new List<dynamic>();
      json['filterKey'].forEach((v) {
        filterKey.add(v);
      });
    }
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brand != null) {
      data['brand'] = this.brand.map((v) => v.toJson()).toList();
    }
    data['category'] = this.category;
    if (this.filterKey != null) {
      data['filterKey'] = this.filterKey.map((v) => v.toJson()).toList();
    }

    if (this.sort != null) {
      data['sort'] = this.sort.toJson();
    }
    data['limit'] = this.limit;
    data['page'] = this.page;
    return data;
  }
}

class Sort {
  String by;
  String dir;

  Sort({this.by, this.dir});

  Sort.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    dir = json['dir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['dir'] = this.dir;
    return data;
  }
}

class Hits {
  String offerCode;
  String sku;
  String skuConfig;
  String brand;
  String name;
  dynamic plpSpecifications;
  double price;
  double salePrice;
  String url;
  String imageKey;
  bool isBuyable;
  List<String> flags;
  String catalogTagType;
  String catalogTag;

  Hits(
      {this.offerCode,
      this.sku,
      this.skuConfig,
      this.brand,
      this.name,
      this.plpSpecifications,
      this.price,
      this.salePrice,
      this.url,
      this.imageKey,
      this.isBuyable,
      this.flags,
      this.catalogTagType,
      this.catalogTag});

  Hits.fromJson(Map<String, dynamic> json) {
    offerCode = json['offer_code'];
    sku = json['sku'];
    skuConfig = json['sku_config'];
    brand = json['brand'];
    name = json['name'];
    plpSpecifications = json['plp_specifications'];
    price = double.tryParse( "${json['price']}");
    salePrice = json['sale_price'] != null
        ? double.tryParse("${json['sale_price']}")
        : 0.0;
    url = json['url'];
    imageKey = json['image_key'];
    isBuyable = json['is_buyable'];
    flags = json['flags'].cast<String>();
    catalogTagType = json['catalog_tag_type'];
    catalogTag = json['catalog_tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_code'] = this.offerCode;
    data['sku'] = this.sku;
    data['sku_config'] = this.skuConfig;
    data['brand'] = this.brand;
    data['name'] = this.name;
    if (this.plpSpecifications != null) {
      data['plp_specifications'] = this.plpSpecifications.toJson();
    }
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['url'] = this.url;
    data['image_key'] = this.imageKey;
    data['is_buyable'] = this.isBuyable;
    data['flags'] = this.flags;
    data['catalog_tag_type'] = this.catalogTagType;
    data['catalog_tag'] = this.catalogTag;
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
