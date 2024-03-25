# Burning Fungible Tokens

## Introduction
Burning refers to permanently destroying fungible token units to reduce total supply. Let's implement burning capabilities.

## Accessing Burn Capability
In Move, burn privileges are encapsulated via a `BurnRef` capability:
```
struct ManagedFungibleAsset has key {
  mint_ref: MintRef,
  transfer_ref: TransferRef,
  burn_ref: BurnRef
}
```
This capability is held in the resource managing fungible asset. By default, only the resource owner can utilize it. The `BurnRef` allows burning token units. This reference is held in the Metadata resource.

## Implementing a Burn Function
Burn logic checks for authority, check for both the source wallet, and finally burns the coin from owner, let me break it down for you,
```
public entry fun burn(admin: &signer, from: address, amount: u64) acquires ManagedFungibleAsset 
```
First we will declare a function burn and acquire `ManagedFungibleAsset`. Well we have already explained what `acquire` is so we can move on to the next line.	
```
let managed_fungible_asset = authorized_borrow_refs(admin, asset);
```
Now, we borrow a mutable reference to the BurnRef using `authorized_borrow_refs` which accepts the signer address and the asset object. This basically helps us to access the burn capability of the coin we created.
```
let from_wallet = primary_fungible_store::primary_store(from, asset);
```
Here we use the token storage framework library to get mutable references to the source wallet. We use `primary_store` function from `primary_fungible_store` to check if the coin exists with the wallet calling the burn function
```
fungible_asset::burn_from(burn_ref, from_wallet, amount);
```
Finally, we call the Aptos framework's `burn_from` function with the acquired `BurnRef` capability, passing the source and burn amount as argument.

---
Minting and Transferring is cool but let's talk about burning assets. Declare an entry function `burn` with parameters admin as signer, from as the sender address and amount(u64) using `acquires` keyword access `MangedFungibleAsset`. Then declare a variable `asset` and call `get_metadata` function. Next we repeat similar set of steps as we did for mint and transfer function, declare a variable `burn_ref` to allow admin signer to burn assets using `authorized_borrow_refs(admin, asset)`.burn_ref. Now Declare a variable `from_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::primary_store(from, asset)` Finally burn the minted coins using `fungible_asset::burn_from(burn_ref, from_wallet, amount);` Also please don't forget to do all the necessary imports and member creation for `burn_ref` like we did for `mint_ref` and `transfer_ref`.
