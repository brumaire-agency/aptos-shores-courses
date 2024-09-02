# Understanding `create_token` Function

The `get_token_signer` function serves as a crucial component in obtaining the signer capability required for token management operations. Let's break down its signature:

```move
fun get_token_signer(): signer acquires CollectionCapability {
     ...
}
```
This declaration indicates that `get_token_signer` is a function returning a `signer` type. Additionally, the `acquires CollectionCapability` annotation signifies that this function will interact with the `CollectionCapability` resource, either by reading from it or modifying it.

### Understanding Creation of Signer with Capability

To execute operations on behalf of the `@robinson` account, the function must create a signer with the appropriate capability. Here's how it's done:

```move
account::create_signer_with_capability(&borrow_global<CollectionCapability(@robinson)capability)
```

- `borrow_global<CollectionCapability>(@robinson)`: This snippet borrows the `CollectionCapability` resource associated with the `@robinson` account. It retrieves the capability field from the borrowed resource.
- `account::create_signer_with_capability(...)`: The capability field obtained from the `CollectionCapability` resource is then used to create a signer with the necessary capability. This enables the signer to perform actions authorized by the `@robinson` account.

### Declaring `create_token` Function

The `create_token` function is a public entry point allowing users to initiate the token creation process. Let's break down its signature:

```move
public entry fun create_token(user: &signer) acquires CollectionCapability, MintInfo {
    // ...
}
```
This signature indicates that `create_token` is a public entry function, accessible from outside the module. It takes a `user` parameter of type `&signer`, representing the user account initiating the token creation process. Furthermore, it acquires both the `CollectionCapability` and `MintInfo` resources, signifying its intention to read from or modify these resources.

### Converting Byte Arrays to Strings

Before proceeding with token creation, certain preparatory steps are necessary, including converting byte arrays to strings:

```move
let uri = string::utf8(COLLECTION_URI);
let description = string::utf8(COLLECTION_DESCRIPTION);
```

- `string::utf8(COLLECTION_URI)`: This line converts the byte array `COLLECTION_URI` to a UTF-8 encoded string, storing the result in the `uri` variable.
- `string::utf8(COLLECTION_DESCRIPTION)`: Similarly, this line converts the byte array `COLLECTION_DESCRIPTION` to a UTF-8 encoded string, storing the result in the `description` variable.

These conversions facilitate the use of human-readable strings for URI and description fields in the token creation process.

### Obtaining the User's Address

To identify the user initiating the token creation, the function retrieves the address associated with the user signer:

```move
let user_addr = address_of(user);
```

- `address_of(user)`: This snippet utilizes the `address_of` function to obtain the address of the user signer passed as the `user` parameter. The resulting address is stored in the `user_addr` variable for further use.

### Creating the Token Name
Finally, the function establishes a name for the token being created:

```move
let token_name = string::utf8(b"Shore ID");
```

- `string::utf8(b"Shore ID")`: This line converts the byte array `b"Shore ID"` to a UTF-8 encoded string, representing the name of the token being created. The resulting string is stored in the `token_name` variable.

In summary, the `get_token_signer` function retrieves the necessary signer capability from the `CollectionCapability` resource associated with the `@robinson` account, enabling subsequent token management operations. Meanwhile, the `create_token` function provides a user-friendly interface for initiating the token creation process, acquiring essential resources, and preparing necessary data for token creation.

---
Too much to grasp isn't it? Be patient we are almost nearing the end of the quest a few more small steps that's it. In this lesson we are supposed to create two functions first define a function `get_token_signer` that returns a `signer` that acquires the global `CollectionCapability` resource next create a signer using `account::create_signer_with_capability` which accepts the SignerCapability as input finally retrieve immutable reference of `CollectionCapability` struct at address `robinson`.

Moving on to the next one, define a public entry function `create_token` that takes a `&signer` as input that also acquires the global `CollectionCapability` and `MintInfo` resources, inside the function body declare four variables `uri`, `description`, `user_addr` and `token_name`. Store "COLLECTION_URI" into variable `uri` as type `string` using `string::utf8`. Similarly, store "COLLECTION_DESCRIPTION" in variable `description` and "Shore ID" in variable `token_name` and lastly for `user_addr` initialize it with the address of the `user`. Tadaa wasn't it simple? Let's get MOVEing!