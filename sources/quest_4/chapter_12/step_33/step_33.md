# Transferring Fungible Tokens

## Introduction
Transferring tokens refers to moving fungible token units between accounts on-chain. We'll look at how to implement token transfer logic in Move.

## Accessing Transfer Capability
In Move, transfer privileges are encapsulated via a `TransferRef` capability:
```
struct ManagedFungibleAsset has key {
  mint_ref: MintRef,
  transfer_ref: TransferRef,
}
```
This capability is held in the resource managing fungible asset. By default, only the resource owner can utilize it. The `TransferRef` allows transferring units of the fungible token between accounts. This reference is held in the Metadata resource.

## Implementing a Transfer Function

Transfer logic checks for authority, check for both the source and the destination wallet, and finally transfers from sender to recipient, let me break it down for you,
```
public entry fun transfer(admin: &signer, from: address, to: address, amount: u64) acquires ManagedFungibleAsset {
```
First we will declare a function transfer and acquire `ManagedFungibleAsset`. Well we have already explained what `acquire` is so we can move on to the next line.
```
let asset_address = object::create_object_address(&@Robinson, ASSET_SYMBOL);
let asset = object::address_to_object<Metadata>(asset_address)
```
Now, we get a reference to the resource managing transfer capability by first getting the `asset_address` using  `object::create_object_address(&@Robinson, ASSET_SYMBOL)` which accepts the reference to the module name and the asset symbol as the parameters.
We will then convert this address to object using 	`object::address_to_object<Metadata>(asset_address)`	
```
let managed_fungible_asset = authorized_borrow_refs(admin, asset);
```
Now, we borrow a mutable reference to the TransferRef using `authorized_borrow_refs` which accepts the signer address and the asset object. This basically helps us to access the transfer capability of the coin we created.
```
let from_wallet = primary_fungible_store::primary_store(from, asset);
let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
```
Here we use the token storage framework library to get mutable references to the source and destination token wallets respectively. First we use `primary_store` function from `primary_fungible_store` to check if the coin exists with the sender and the secondly we check if the recipient account has a `primary store` to receive the coin
```
fungible_asset::transfer_with_ref(transfer_ref, from_wallet, to_wallet, amount);
```
Finally, we call the Aptos framework's `transfer_with_ref` function with the acquired TransferRef capability, passing the source, destination and transfer amount as argument.

---
Time to play around with the assets and see if you can tarnsfer it to another wallet. This one will be tad bit lengthy so get all geared up. Before we start with the function import `TransferRef` at all instances like we did for `MintRef`. Now declare an entry function `transfer` with parameters admin as signer, to as the recipient address and amount(u64) using `acquires` keyword access `MangedFungibleAsset`. Then declare a local variable `asset_address` to store the address for the coin's metadata from object library and then convert that to metadata object to access details. These two steps are similar to what we did in the previous exercise. Now declare a variable `transfer_ref` to allow admin signer to get access to transfer assets using `authorized_borrow_refs(admin, asset)`.transfer_ref. Next declare a variable `from_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::primary_store(from, asset)` similarly declare a variable `to_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::ensure_primary_store_exists(to, asset)`. Finally transfer the minted coins from the sender's wallet into the recipient's wallet using `fungible_asset::transfer_with_ref(transfer_ref, from_wallet, to_wallet, amount);`
