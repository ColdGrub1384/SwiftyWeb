public extension String {

  /// Print HTML from given tag, attributes and inner.
  ///   Examples:
  ///
  ///       "a".htm("href='https://www.google.com'")
  ///       // <a href='https://www.google.com'></a>
  ///
  ///       "div".htm() {
  ///         "p".htm() {
  ///           print("Hello World!")
  ///         }
  ///       }
  ///       /* <div>
  ///         <p>
  ///         Hello World!
  ///         </p>
  ///         </div>
  ///       */
  ///
  ///       "br".htm(single: true)
  ///       // <br>
  ///
  /// - Parameters:
  ///   - attributes: Attributes of tag, default value is `[]`.
  ///
  ///   - single: If the tag is single, default is false.
  ///
  ///   - inner: Code executed before closing the tag, use it to print inner html.
  public func htm(_ attributes: [String] = [], single: Bool = false, inner:(() -> Void)? = nil) {
    
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



