# Minting New Coins

## Introduction
Minting is the process of creating new units of a fungible token or coins in order to increase the total supply. In this lesson, we will look at how minting works for a managed fungible asset in Move.

## Managing Mint Capabilities
In Move, minting privileges are encapsulated via a `MintRef` capability:
```
struct ManagedFungibleAsset has key {
  mint_ref: MintRef,
}
```
This capability is held in the resource managing fungible asset. By default, only the resource owner can utilize it. The `MintRef` allows minting new units of the fungible token. This reference is held in the Metadata resource.
## Implementing a Mint Function
Minting logic checks for authority, mints new coins, and deposits to recipient, let me break it down for you,
```
public entry fun mint(admin: &signer, to: address, amount: u64) acquires ManagedFungibleAsset {
```
First we will declare a function mint and acquire `ManagedFungibleAsset`. The `acquires` keyword indicates this function will access the `ManagedFungibleAsset` resource, acquiring a reference to it. In simple terms it's like getting access to a key card.
```
let asset_address = object::create_object_address(&@module_name, ASSET_SYMBOL);
let asset = object::address_to_object<Metadata>(asset_address)
```
Now, we get a reference to the resource managing minting by first getting the `asset_address` using  `object::create_object_address(&@module_name, ASSET_SYMBOL)` which accepts the reference to the module name and the asset symbol as the parameters.
We will then convert this address to object using   `object::address_to_object<Metadata>(asset_address)`
```
let managed_fungible_asset = authorized_borrow_refs(admin, asset);
```
Now, we borrow a mutable reference to the MintRef using `authorized_borrow_refs` which accepts the signer address and the asset object. This basically helps us to access the minting capability of the coin we created.
```
let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
```
Now, we are checking if the primary stores exists for the account `to` using `ensure_primary_store_exists` function from `primary_fungible_store` and if it doesn't, a primary store will be created automatically.
```
let fa = fungible_asset::mint(&managed_fungible_asset.mint_ref, amount);
fungible_asset::deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa);
```
Now the last steps would to mint the coin using `mint` function from `fungible_asset` which accepts the reference to the `mint ref` from the `managed_fungible_asset` resource and the amount to be minted as parameters
After we mint the coin, we then deposit this newly minted coin to recipients address using `deposit_with_ref` from the `fungible_asset` library  which accepts the reference to the `transfer ref` from the `managed_fungible_asset` resource, the recipient wallet address and the newly minted token as parameters.

---
It is time to mint all of this data to your memory and get coding. Declare an entry function `mint` with parameters admin as signer, to as the recipient address and amount(u64) as the amount of coin which needs to be transferred then declare a local variable `asset_address` to store the address for the coin's metadata using `create_object_address(&@module_name, ASSET_SYMBOL)` from object library. Next up we declare a local variable asset to convert that to metadata object to access details using `address_to_object<Metadata>(asset_address)` from object library. Now we declare a variable `managed_fungible_asset` to allow admin signer to get access to minting using `authorized_borrow_refs(admin, asset)`. We now declare a variable `to_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::ensure_primary_store_exists(to, asset)` then declare a variable `fa` to mint new coins calling the `mint` function and finally deposit newly minted coins into the recipient's wallet using `deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa)` from fungible_asset library.