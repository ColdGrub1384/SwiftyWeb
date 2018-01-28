extension String {

  /// Print HTML from tag, attributes and inner
  func htm(_ attributes: [String] = [], inner:(() -> Void)? = nil, single: Bool = false) {

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
    
    if !single {
	   print("</\(self)>")
	 }
  }

}



