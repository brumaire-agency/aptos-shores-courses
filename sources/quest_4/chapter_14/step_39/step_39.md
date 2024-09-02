# Deposit Asset in Move

## Introduction

The `Deposit` function provides a mechanism for asset owners to deposit assets to their accounts, disregarding the frozen status set on the account.

## Accessing Transfer Capability

In Move, burn privileges are encapsulated via a `TransferRef` capability:
```
struct ManagedFungibleAsset has key {
mint_ref: MintRef,
transfer_ref: TransferRef,
burn_ref: BurnRef
}
```
This capability is held in the resource managing fungible asset. By default, only the resource owner can utilize it.

## Implementing a Deposit Function
Deposit logic checks for authority, checks if primary store exists, and finally deposit the assets, let me break it down for you,
```
public fun deposit(admin: &signer, to: address, fa: FungibleAsset) acquires ManagedFungibleAsset
```
First we will declare a function deposit and acquire `ManagedFungibleAsset`. Well we have already explained what `acquire` is so we can move on to the next line.
```
let asset = get_metadata();
```
Now, we get a reference to the resource managing transfer capability by calling the get_metadata() function.
```
let transfer_ref = &authorized_borrow_refs(admin, asset).transfer_ref;
```
Now, we borrow a mutable reference to the TransferRef using `authorized_borrow_refs` which accepts the signer address and the asset object. This basically helps us to access the transfer capability of the coin we created.
```
let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
```
Here we use the token storage framework library to get mutable references to the source wallet. We use `ensure_primary_store_exists` function from `primary_fungible_store` to check if the primary exists in the 'to' account, if not a primary store will be created for the 'to' account.
```
 fungible_asset::deposit_with_ref(transfer_ref, to_wallet, fa);
```
Finally, we call the Aptos framework's `deposit_with_ref` function with the acquired `TransferRef` capability, passing the address to which the asset will be deposit and the reference to the asset to be deposited.














