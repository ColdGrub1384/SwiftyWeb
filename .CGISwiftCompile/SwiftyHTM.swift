extension String {

  // Print HTML from tag, attributes and inner
  func htm(_ attributes: [String] = [], inner:(() -> Void)? = nil) {

    var attributesString = ""

    // Parse attributes
    for attribute in attributes {
      attributesString = attributesString+" \(attribute)"
    }

    // Print HTML
    print("<\(self)\(attributesString)>")
    if let inner = inner {
      inner()
    }
    print("</\(self)>")
  }
}



