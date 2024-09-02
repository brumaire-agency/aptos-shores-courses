# Adding function to read the Token URI

This function, `get_token_URI`, encapsulates the process of retrieving the Uniform Resource Identifier (URI) associated with the token collection.

```move
public fun get_token_URI(): String {
    string::utf8(COLLECTION_URI)
}
```
### Function Signature:

   - The function is declared as `public fun get_token_URI(): String`.
   - It's named `get_token_URI` and doesn't require any parameters.
   - The return type is `String`, indicating that it returns a string value representing the token URI.

### Function Body:

   - The function body consists of a single expression: `string::utf8(COLLECTION_URI)`.
   - `COLLECTION_URI` holds the URI of the token collection.
   - The `string::utf8` function converts the `COLLECTION_URI` (presumably a byte array) into a human-readable string format.

### Returning the Token URI:
   - The function returns the result of `string::utf8(COLLECTION_URI)`, which is the string representation of the token URI.

---
Yayyyy we have reached the end of the quest. Just this one and you will be able to create and mint an NFT of your own. Let's go! Define a public function `get_token_URI` that returns a `String` and convert the byte array `COLLECTION_URI` to a UTF-8 encoded `String` and return it. That was it. Congratulations on making it to the end. Let's keep MOVEing. See you in the next quest. 






