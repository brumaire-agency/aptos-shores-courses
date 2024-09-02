# Let's Start with Fungible Asset in Move

When working with fungible assets in Move on Aptos, we need to import specific types and modules to define and manage these assets effectively. Here's a breakdown of what these imports do:

1.  **aptos_framework::object::{Self, Object}:-**
    -   **Self:** Refers to the specific type implementing a trait, likely representing the fungible asset itself.
    -   **Object:** The base Object trait that all on-chain objects inherit from, providing common functionality.

2.  **aptos_framework::primary_fungible_store:-**
    -   Contains utilities for interacting with the primary on-chain store of fungible asset balances, offering functions for querying balances and transferring assets.

3.  **aptos_framework::fungible_asset::{Self, MintRef, FungibleAsset}:-**
    -   **Self:** Another reference to the concrete fungible asset type.
    -   **MintRef:** A reference to the mint capability for a fungible asset, allowing the creation of new units.
    -   **FungibleAsset:** The core trait defining basic operations related to fungible assets, such as balance queries and asset transfers.

4.  **std::option:-**
    -   Provides a standard option type for encoding optional values, handling cases where a value may be present or absent.

5.  **std::string::utf8:-**
    -   Supports working with string values encoded in UTF-8 format, ensuring compatibility and proper encoding of string data.

6.  **std::signer:-**
    -   Represents the signer type, containing information about the public key and signature authority of an on-chain actor sending a transaction, crucial for transaction verification.

In essence, these imports lay the groundwork for defining and interacting with custom fungible assets in Move on the Aptos blockchain. By implementing the FungibleAsset trait, having a mint capability, and storing balances in the `primary_fungible_store`, developers can effectively manage and work with fungible assets.

---
In this quest we will first create a module, do a few imports and then finally declare all the functions that are required to create your own token. It is a long to-do list so get all geared up to create your own shore currency. Let us start with creating a shoreCurrency package under module `robinson` then import `object` library and `primary_fungible_store` from `aptos_framework`, and finally `option`, `string::utf8` and `signer` from standard library. 