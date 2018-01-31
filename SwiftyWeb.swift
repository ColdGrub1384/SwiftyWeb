import Foundation

/// Environment variables.
public let env = ProcessInfo.processInfo.environment

/// POST query readed with `readPost()`.
public var postString: String?

/// If POST query was readed with `readPost()`.
public var readedPost = false

/// An enumeration of HTTP methods supported by SwiftyWeb.
public enum Method {
    
  /// Post method.
  case POST
  
  /// Get method.
  case GET
}

/// Process GET or POST query into a dictionary.
///
/// - Parameters:
///     - query: Query string to process. For example: "foo=bar&bar=foo".
///
/// - Returns:
///     - Processed dictionary.
public func process(query: String) -> [String:String] {
  let items = query.components(separatedBy: "&")
  
  var dict = [String:String]()

  for item in items {
    let components = item.components(separatedBy:"=")
    if components.count == 2 {
      dict[components[0].removingPercentEncoding!.replacingOccurrences(of:"+", with: " ")] = components[1].removingPercentEncoding!.replacingOccurrences(of:"+", with: " ")
    } else {
      dict[components[0].removingPercentEncoding!.replacingOccurrences(of:"+", with: " ")] = ""
    }
  }

  return dict
}

/// Read POST query if there is one.
public func readPost() {
  readedPost = true
  guard let length_ = env["CONTENT_LENGTH"] else { return }
  if let length = Int(length_) {
    if length > 0 {
      postString = readLine()
    }
  }
}

/// Returns parsed GET query.
public var GET: [String:String] {
  guard let query = env["QUERY_STRING"] else { return [:] }
  return process(query: query)
}

/// Reads POST query and returns parsed query.
public var POST: [String:String] {
  if !readedPost {
    readPost()
  }

  return process(query: postString ?? "")
}

/// Returns `true` if given key is set for query for given method.
///
/// - Parameters:
///     - key: Key to check.
///     - method: Method of query where search `key`.
public func isKey(_ key: String, setForMethod method: Method) -> Bool {
  var dict: [String:String] {
    if method == .POST {
      return POST
    } else {
      return GET
    }
  }

  return dict.keys.contains(key)

}
