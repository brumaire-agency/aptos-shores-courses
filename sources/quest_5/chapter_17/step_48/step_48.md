# Creating named token

In this section, we'll dissect the code snippet that facilitates the creation of a new named token within the collection we created.

```move
let constructor_ref = token::create_named_token(
    &get_token_signer(),
    string::utf8(COLLECTION_NAME),
    description,
    token_name,
    option::none(),
    uri,
);
```
### Invoking `token::create_named_token()`:

The core operation in the provided code snippet is the usage of the `token::create_named_token` function. This function is pivotal for generating a new named token and returns a `constructor_ref`, which acts as a reference to the newly created token.

### Understanding the Arguments:

-   **`&get_token_signer()`:** This function call retrieves the signer responsible for token creation. Typically, this signer is obtained from the `CollectionCapability` resource, granting the necessary permissions for token manipulation.
-   **`string::utf8(COLLECTION_NAME)`:** The `COLLECTION_NAME` constant, converted to a UTF-8 encoded string, represents the name of the collection to which the token is associated. This string serves as a vital identifier for the collection.
-   **`description`:** The `description` variable holds supplementary information about the token, offering context or detailed attributes associated with the token.
-   **`token_name`:** This variable contains the name of the token, distinguishing it within the collection. The token name plays a crucial role in identifying and categorizing the token.
-   **`option::none()`:** Indicates that no additional metadata is provided for the token during its creation. This signifies a straightforward creation process without additional descriptive elements.
-   **`uri`:** The `uri` variable represents the Uniform Resource Identifier (URI) for the token. This URI could point to external resources or metadata associated with the token, providing additional context or information.

---
This one is going to be an easy ride since we have done something similar before. Get the token signer by calling the `get_token_signer` function.  Declare a variable `constructor_ref` and initialize it with the result of calling `token::create_named_token` and add the following arguments - `&get_token_signer()` , `string::utf8(COLLECTION_NAME)`,`description`, `token_name`, `option::none()` and `uri` to the `token::create_named_token` function. That's it, that is exactly how you create a named token. Now it is time you quickly jump off to the next lesson. See you there!