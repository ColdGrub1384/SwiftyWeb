import Foundation

let env = ProcessInfo.processInfo.environment
var postString: String?
var readedPost = false

enum Method {
  case POST
  case GET
}

func process(query: String) -> [String:String] {
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

func readPost() {
  readedPost = true
  guard let length_ = env["CONTENT_LENGTH"] else { return }
  if let length = Int(length_) {
    if length > 0 {
      postString = readLine()
    }
  }
}

var GET: [String:String] {
  guard let query = env["QUERY_STRING"] else { return [:] }
  return process(query: query)
}

var POST: [String:String] {
  if !readedPost {
    readPost()
  }

  return process(query: postString ?? "")
}

func isKey(_ key: String, setForMethod method: Method) -> Bool {
  var dict: [String:String] {
    if method == .POST {
      return POST
    } else {
      return GET
    }
  }

  return dict.keys.contains(key)

}
