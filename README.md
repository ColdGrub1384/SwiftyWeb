# SwiftyWeb
## Swift library for CGI

- [x] Global variables and functions
- [x] No need to recompile for each edit
- [x] Automatic library integration, no Package Manager
- [x] Show compiler errors in browser
- [ ] No MySQL

SwiftyWeb includes a Swift helper for CGI that contains:

```swift
env: [String:String] // Environment variables
postString: String? // Scanned post query
readedPost: Bool // If POST was readed
    
enum Method { // HTTP Methods
    case POST
    case GET
}
    
process(query: String) -> [String:String] // Process a query string into a dictionary
readPost() // Read POST input
    
GET: [String:String] // Returns GET processed query
POST: [String:String] // Returns POST processed query and read input if it was not readed
isKey(_ key: String, setForMethod method: Method) -> Bool // If key is set in POST or GET
```
All these values are global, so you can use them like this:
```swift
if isKey("name", setForMethod: .GET) {
    print(GET["name"])
}
    
if isKey("password", setForMethod: .POST) {
    print(POST["password"])
}
```
SwiftyWeb also include a String extension with a function to generate HTML:
```swift
htm(_ attributes: [String] = [], inner:(() -> Void)? = nil)
```
You can use it like this:
```swift
// GET
"h1".htm() {
    print("GET Parameters")
}

"ul".htm() {
    for (key, value) in GET {
        "li".htm() {
            print(key+":"+value)
        }
    }
}

// POST
"h1".htm() {
    print("POST Parameters")
}

"ul".htm() {
    for (key, value) in POST {
        "li".htm() {
            print(key+":"+value)
        }
    }
}
```
# Usage
Init a project, install via the package manager, compile and move?

NO.

With SwiftyWeb, you can simply write your code and open the browser.



Install typing this in a shell:

    curl https://raw.githubusercontent.com/ColdGrub1384/SwiftyWeb/master/install 2>/dev/null | sudo bash

## Slow method
Now, you can write Swift CGIs putting this in the top or your file:

    #!/usr/bin/swiftw
    
    // Your code here
(Don't forget to chmod +x your file)

You can also include other files:

    #!/usr/bin/swiftw AnotherFile.swift

    // Your code here

## Fast method
Loading CGIs with '#!/usr/bin/swiftw' is very slow, you can compile files manually typing:
    swiftw -o PATH_TO_NEW_EXECUTABLE FILES TO COMPILE
A file will be created and you can put it in your CGI's folder.

SwiftyWeb is written in Swift 3 because Raspberry Pi doesn't supports Swift 4, but it's easy to convert to Swift 4.
