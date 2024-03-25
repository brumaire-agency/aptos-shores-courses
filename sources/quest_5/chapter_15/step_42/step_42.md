### Let's Start With Structs

In our NFT contract, three important structs are defined: `TokenIdentifier`, `CollectionCapability`, and `MintInfo`. Let's delve into each of them:

#### TokenIdentifier struct:

```move
struct TokenIdentifier has key {
    mutator_ref: token::MutatorRef,
    burn_ref: token::BurnRef,
}
```
- This struct represents a unique identifier for a token.
- It has the key ability, meaning it can be stored in global storage and used as a key for accessing resources.
- It contains two fields:
  - `mutator_ref`: A `token::MutatorRef` that allows modifying the token's properties.
  - `burn_ref`: A `token::BurnRef` that allows burning (destroying) the token.

#### CollectionCapability struct:

```move
struct CollectionCapability has key {
    capability: SignerCapability,
    burn_signer_capability: SignerCapability,
}
```
- This struct represents the capabilities required to manage the token collection.
- It has the key ability, allowing it to be stored in global storage.
- It contains two fields:
  - `capability`: A `SignerCapability` that represents the capability to sign transactions on behalf of the collection.
  - `burn_signer_capability`: Another `SignerCapability` specifically used for burning tokens.

#### MintInfo struct:

```move
struct MintInfo has key {
    count: u64,
}
```
- This struct keeps track of the minting information for the token collection.
- It has the key ability, allowing it to be stored in global storage.
- It contains a single field:
  - `count`: A `u64` value representing the current count of minted tokens.
These structs play crucial roles in managing the token collection and individual tokens:
- The `TokenIdentifier` struct stores the necessary references for each token, enabling token modification and burning.
- The `CollectionCapability` struct holds the capabilities required to manage the token collection, including signing transactions and burning tokens.
- The `MintInfo` struct keeps track of the minting count, which is incremented each time a new token is minted.

These structs are stored in global storage using functions like `move_to`, and their fields can be accessed and modified using functions like `borrow_global` and `borrow_global_mut`, respectively. They provide the foundation for managing tokens and their associated metadata efficiently.

---
Let's construct structs. In this chapter we will be creating three structs in total. First define a struct `TokenIdentifier` of ability key with two fields: - `mutator_ref` of type `token::MutatorRef`, `burn_ref` of type `token::BurnRef`, second define a struct `CollectionCapability` of ability key with two fields: `capability` of type `SignerCapability`, `burn_signer_capability` of type `SignerCapability` and finally define a struct `MintInfo`of ability key with one field `count` of type `u64`.












