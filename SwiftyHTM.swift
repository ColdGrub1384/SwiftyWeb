public extension String {

  /// Print HTML from given tag, attributes and inner.
  ///
  /// - Parameters:
  ///   - attributes: Attributes of tag, default value is `[]`.
  ///
  ///   Example:
  ///
  ///       "a".htm("href='https://www.google.com'")
  ///       // <a href='https://www.google.com'></a>
  ///
  ///   - single: If the tag is single, default is false.
  ///
  ///   Example:
  ///
  ///     "br".htm(single: true)
  ///     // <br>
  ///
  ///   - inner: Code executed before closing the tag, use it to print inner html.
  ///
  ///   Example:
  ///
  ///     "div".htm() {
  ///       "p".htm() {
  ///         print("Hello World!")
  ///       }
  ///     }
  ///     /* <div>
  ///        <p>
  ///        Hello World!
  ///        </p>
  ///        </div>
  ///     */
  ///
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



