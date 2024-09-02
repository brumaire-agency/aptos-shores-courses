# Understanding `create_collection` Function

In our NFT Contract `create_collection` is used to create a collection to store our NFT token. Let's break down the code.

#### 1. `create_collection` function signature:

```move
fun create_collection(creator: &signer) {
    // ...
}
```
- This line declares the `create_collection` function, which takes a `creator` parameter of type `&signer`.

#### 2. Converting byte arrays to strings:

```move
let description = string::utf8(COLLECTION_DESCRIPTION);
let name = string::utf8(COLLECTION_NAME);
let uri = string::utf8(COLLECTION_URI);
```
- These lines convert the byte arrays `COLLECTION_DESCRIPTION`, `COLLECTION_NAME`, and `COLLECTION_URI` to strings using the `string::utf8` function.
- The resulting strings are stored in the `description`, `name`, and `uri` variables, respectively.

#### 3. Creating an unlimited collection:

```move
collection::create_unlimited_collection(
    creator,
    description,
    name,
    option::none(),
    uri,
);
```
- The `collection::create_unlimited_collection` function is called with the following arguments:
  - `creator`: The signer account creating the collection.
  - `description`: The description of the collection.
  - `name`: The name of the collection.
  - `option::none()`: Indicates that no maximum supply is specified for the collection (unlimited).
  - `uri`: The URI (Uniform Resource Identifier) for the collection's metadata.
- This function creates a new unlimited collection with the specified details using the `creator` account.

---
Let us look at collection. Define a function `create_collection` that takes a `&signer` as input inside the function body declare three variables `description`, `name` and `uri` store "COLLECTION_DESCRIPTION" into variable `description` as type `string` using `string::utf8`. Similarly, store "COLLECTION_NAME" in variable `name` and "COLLECTION_URI" in variable `uri`. In the end call the `collection::create_unlimited_collection` function with arguments `creator`, `description`, `name`, `option::none()`, and `uri`.
    
