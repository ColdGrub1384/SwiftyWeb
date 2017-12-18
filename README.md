# SwiftyWeb
## Swift library for CGI

- [ x ] Global variables and functions
- [ x ] No need to recompile for each edit
- [ x ] Automatic library integration, no Package Manager
- [  ] Slow loading
- [  ] No MySQL

SwiftyWeb includes a Swift helper for CGI that contains:

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
    
All these values are global, so you can use them like this:

    if isKey("name", setForMethod: .GET) {
        print(GET["name"])
    }
    
    if isKey("password", setForMethod: .POST) {
        print(POST["password"])
    }
    
SwiftyWeb also include a String extension with a function to generate HTML:

    htm(_ attributes: [String] = [], inner:(() -> Void)? = nil)
    
You can use it like this:

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

# Usage
Init a project, install via the package manager, compile and move?

NO.

With SwiftyWeb, you can simply write your code and open the browser.


Install typing this in a shell:

    curl https://github.com/ColdGrub1384/SwiftyWeb/blob/master/install | sudo bash

Now, you can write Swift CGIs putting this in the top or your file:

    #!/usr/bin/swiftw
    
    // Your code here
(Don't forget to chmod +x your file)

SwiftyWeb is written in Swift 3 because Raspberry Pi doesn't supports Swift 4, but it's easy to convert to Swift 4.