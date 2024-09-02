# Let's Start with Non Fungible Asset in Move

When working with non fungible assets in Move on Aptos, we need to import specific types and modules to define and manage these assets effectively. Here's a breakdown of what these imports do:

1.  **aptos_framework::object::{Self, ConstructorRef, Object}:**

    -   **Self:**  Refers to the current module itself, allowing access to its associated functions and types.
    -   **ConstructorRef:**  A type representing a reference to an object constructor, used for creating new instances of objects.
    -   **Object:**  A type representing an on-chain object in the Aptos framework, providing a base for creating custom objects.

2.  **aptos_token_objects::collection:**

    -   The  `collection`  module from the  `aptos_token_objects`  crate likely contains types and functions related to managing collections of token objects.
    -   It may provide functionality for creating, querying, and manipulating collections of tokens within the Aptos ecosystem.

3.  **aptos_token_objects::property_map:**

    -   The  `property_map`  module from the  `aptos_token_objects`  crate probably defines types and functions for working with property maps associated with token objects.
    -   Property maps allow attaching arbitrary key-value pairs to token objects, enabling custom metadata and attributes to be associated with tokens.

4.  **std::option::{Self, Option}:**

    -   **Self:**  Refers to the  `option`  module itself, allowing access to its associated types and functions.
    -   **Option:**  A type representing an optional value, which can be either  `Some(value)`  if a value is present or  `None`  if no value is present.
    -   The  `Option`  type is commonly used to handle cases where a value may or may not exist, providing a way to express and handle the absence of a value.

5.  **aptos_token_objects::token:**

    -   The  `token`  module from the  `aptos_token_objects`  provides types and functions for working with individual token objects.
    -   It define the structure and behavior of token objects, including their properties, metadata, and associated operations such as minting, burning, and transferring tokens.

In essence, these imports lay the groundwork for defining and interacting with custom non fungible assets in Move on the Aptos blockchain. (edited) 

---
In this quest we will first create a module, do a few imports and then finally declare all the functions that are required to create your own NFT. This is the easiest of all tasks that you will get in this quest so get all geared up. Let us start with creating a shoreNFT package under module `robinson` then import `object` from `standard` library, secondly import `{Self, ConstructorRef, Object}` from `object` library of `aptos_framework` module then import `collection`, `property_map` and `token` from `aptos_token_objects` module and finally import `{string::String, signer, error}` from `standard` library.




