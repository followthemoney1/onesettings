class GoogleSearchResponse {
  String kind;
  Url url;
  Queries queries;
  Context context;
  SearchInformation searchInformation;
  List<Items> items;

  GoogleSearchResponse({this.kind, this.url, this.queries, this.context, this.searchInformation, this.items});

  GoogleSearchResponse.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
    queries = json['queries'] != null ? new Queries.fromJson(json['queries']) : null;
    context = json['context'] != null ? new Context.fromJson(json['context']) : null;
    searchInformation = json['searchInformation'] != null ? new SearchInformation.fromJson(json['searchInformation']) : null;
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) { items.add(new Items.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.url != null) {
      data['url'] = this.url.toJson();
    }
    if (this.queries != null) {
      data['queries'] = this.queries.toJson();
    }
    if (this.context != null) {
      data['context'] = this.context.toJson();
    }
    if (this.searchInformation != null) {
      data['searchInformation'] = this.searchInformation.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Url {
  String type;
  String template;

  Url({this.type, this.template});

  Url.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    template = json['template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['template'] = this.template;
    return data;
  }
}

class Queries {
  List<Request> request;
//  List<NextPage> nextPage;

  Queries({this.request});

  Queries.fromJson(Map<String, dynamic> json) {
    if (json['request'] != null) {
      request = new List<Request>();
      json['request'].forEach((v) { request.add(new Request.fromJson(v)); });
    }
//    if (json['nextPage'] != null) {
//      nextPage = new List<NextPage>();
//      json['nextPage'].forEach((v) { nextPage.add(new NextPage.fromJson(v)); });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.request != null) {
      data['request'] = this.request.map((v) => v.toJson()).toList();
    }
//    if (this.nextPage != null) {
//      data['nextPage'] = this.nextPage.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class Request {
  String title;
  String totalResults;
  String searchTerms;
  int count;
  int startIndex;
  String inputEncoding;
  String outputEncoding;
  String safe;
  String cx;

  Request({this.title, this.totalResults, this.searchTerms, this.count, this.startIndex, this.inputEncoding, this.outputEncoding, this.safe, this.cx});

  Request.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalResults = json['totalResults'];
    searchTerms = json['searchTerms'];
    count = json['count'];
    startIndex = json['startIndex'];
    inputEncoding = json['inputEncoding'];
    outputEncoding = json['outputEncoding'];
    safe = json['safe'];
    cx = json['cx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['totalResults'] = this.totalResults;
    data['searchTerms'] = this.searchTerms;
    data['count'] = this.count;
    data['startIndex'] = this.startIndex;
    data['inputEncoding'] = this.inputEncoding;
    data['outputEncoding'] = this.outputEncoding;
    data['safe'] = this.safe;
    data['cx'] = this.cx;
    return data;
  }
}

class Context {
  String title;
  List<List> facets;

  Context({this.title, this.facets});

  Context.fromJson(Map<String, dynamic> json) {
    title = json['title'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;

    return data;
  }
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}


class SearchInformation {
  double searchTime;
  String formattedSearchTime;
  String totalResults;
  String formattedTotalResults;

  SearchInformation({this.searchTime, this.formattedSearchTime, this.totalResults, this.formattedTotalResults});

  SearchInformation.fromJson(Map<String, dynamic> json) {
    searchTime = json['searchTime'];
    formattedSearchTime = json['formattedSearchTime'];
    totalResults = json['totalResults'];
    formattedTotalResults = json['formattedTotalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchTime'] = this.searchTime;
    data['formattedSearchTime'] = this.formattedSearchTime;
    data['totalResults'] = this.totalResults;
    data['formattedTotalResults'] = this.formattedTotalResults;
    return data;
  }
}

class Items {
  String kind;
  String title;
  String htmlTitle;
  String link;
  String displayLink;
  String snippet;
  String htmlSnippet;
  String cacheId;
  String formattedUrl;
  String htmlFormattedUrl;
  Pagemap pagemap;
  List<Labels> labels;
  String mime;
  String fileFormat;

  Items({this.kind, this.title, this.htmlTitle, this.link, this.displayLink, this.snippet, this.htmlSnippet, this.cacheId, this.formattedUrl, this.htmlFormattedUrl, this.pagemap, this.labels, this.mime, this.fileFormat});

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    title = json['title'];
    htmlTitle = json['htmlTitle'];
    link = json['link'];
    displayLink = json['displayLink'];
    snippet = json['snippet'];
    htmlSnippet = json['htmlSnippet'];
    cacheId = json['cacheId'];
    formattedUrl = json['formattedUrl'];
    htmlFormattedUrl = json['htmlFormattedUrl'];
    pagemap = json['pagemap'] != null ? new Pagemap.fromJson(json['pagemap']) : null;
    if (json['labels'] != null) {
      labels = new List<Labels>();
      json['labels'].forEach((v) { labels.add(new Labels.fromJson(v)); });
    }
    mime = json['mime'];
    fileFormat = json['fileFormat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['title'] = this.title;
    data['htmlTitle'] = this.htmlTitle;
    data['link'] = this.link;
    data['displayLink'] = this.displayLink;
    data['snippet'] = this.snippet;
    data['htmlSnippet'] = this.htmlSnippet;
    data['cacheId'] = this.cacheId;
    data['formattedUrl'] = this.formattedUrl;
    data['htmlFormattedUrl'] = this.htmlFormattedUrl;
    if (this.pagemap != null) {
      data['pagemap'] = this.pagemap.toJson();
    }
    if (this.labels != null) {
      data['labels'] = this.labels.map((v) => v.toJson()).toList();
    }
    data['mime'] = this.mime;
    data['fileFormat'] = this.fileFormat;
    return data;
  }
}

class Pagemap {
  List<Metatags> metatags;
  List<CseThumbnail> cseThumbnail;
  List<CseImage> cseImage;

  Pagemap({this.metatags, this.cseThumbnail, this.cseImage});

  Pagemap.fromJson(Map<String, dynamic> json) {
    if (json['metatags'] != null) {
      metatags = new List<Metatags>();
      json['metatags'].forEach((v) { metatags.add(new Metatags.fromJson(v)); });
    }
    if (json['cse_thumbnail'] != null) {
      cseThumbnail = new List<CseThumbnail>();
      json['cse_thumbnail'].forEach((v) { cseThumbnail.add(new CseThumbnail.fromJson(v)); });
    }
    if (json['cse_image'] != null) {
      cseImage = new List<CseImage>();
      json['cse_image'].forEach((v) { cseImage.add(new CseImage.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metatags != null) {
      data['metatags'] = this.metatags.map((v) => v.toJson()).toList();
    }
    if (this.cseThumbnail != null) {
      data['cse_thumbnail'] = this.cseThumbnail.map((v) => v.toJson()).toList();
    }
    if (this.cseImage != null) {
      data['cse_image'] = this.cseImage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metatags {
  String viewport;
  String moddate;
  String creator;
  String creationdate;
  String fullbanner;
  String producer;
  String author;
  String ogImage;
  String ogType;
  String twitterCard;
  String twitterTitle;
  String twitterSite;
  String twitterDescription;
  String ogTitle;
  String ogUrl;
  String ogDescription;
  String twitterImage;
  String title;

  Metatags({this.viewport, this.moddate, this.creator, this.creationdate, this.fullbanner, this.producer, this.author, this.ogImage, this.ogType, this.twitterCard, this.twitterTitle, this.twitterSite, this.twitterDescription, this.ogTitle, this.ogUrl, this.ogDescription, this.twitterImage, this.title});

  Metatags.fromJson(Map<String, dynamic> json) {
    viewport = json['viewport'];
    moddate = json['moddate'];
    creator = json['creator'];
    creationdate = json['creationdate'];
    fullbanner = json['fullbanner'];
    producer = json['producer'];
    author = json['author'];
    ogImage = json['og:image'];
    ogType = json['og:type'];
    twitterCard = json['twitter:card'];
    twitterTitle = json['twitter:title'];
    twitterSite = json['twitter:site'];
    twitterDescription = json['twitter:description'];
    ogTitle = json['og:title'];
    ogUrl = json['og:url'];
    ogDescription = json['og:description'];
    twitterImage = json['twitter:image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['viewport'] = this.viewport;
    data['moddate'] = this.moddate;
    data['creator'] = this.creator;
    data['creationdate'] = this.creationdate;
    data['fullbanner'] = this.fullbanner;
    data['producer'] = this.producer;
    data['author'] = this.author;
    data['og:image'] = this.ogImage;
    data['og:type'] = this.ogType;
    data['twitter:card'] = this.twitterCard;
    data['twitter:title'] = this.twitterTitle;
    data['twitter:site'] = this.twitterSite;
    data['twitter:description'] = this.twitterDescription;
    data['og:title'] = this.ogTitle;
    data['og:url'] = this.ogUrl;
    data['og:description'] = this.ogDescription;
    data['twitter:image'] = this.twitterImage;
    data['title'] = this.title;
    return data;
  }
}

class CseThumbnail {
  String src;
  String width;
  String height;

  CseThumbnail({this.src, this.width, this.height});

  CseThumbnail.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class CseImage {
  String src;

  CseImage({this.src});

  CseImage.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    return data;
  }
}

class Labels {
  String name;
  String displayName;
  String labelWithOp;

  Labels({this.name, this.displayName, this.labelWithOp});

  Labels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    labelWithOp = json['label_with_op'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['label_with_op'] = this.labelWithOp;
    return data;
  }
}
