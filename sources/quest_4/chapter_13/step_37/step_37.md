# Unfreezing Accounts in Move

## Introduction

Unfreezing refers to allowing certain freezed accounts to transfer or receive fungible assets.

## Accessing Transfer Capability
In Move, transfer privileges are encapsulated via a `TransferRef` capability:
```
struct ManagedFungibleAsset has key {
  mint_ref: MintRef,
  transfer_ref: TransferRef,
  burn_ref: BurnRef
}
```
This capability is held in the resource managing fungible asset. By default, only the resource owner can utilize it.

## Implementing an unfreeze Function
Freeze logic checks for authority, checks if primary store exists, and finally unfreeze the account, let me break it down for you,
```
public entry fun unfreeze_account(admin: &signer, account: address) acquires ManagedFungibleAsset 
```
First we will declare a function burn and acquire `ManagedFungibleAsset`. Well we have already explained what `acquire` is so we can move on to the next line.
```
 let asset = get_metadata();
```
Now, we get a reference to the resource managing transfer capability by calling the get_metadata() function.
```
let managed_fungible_asset = authorized_borrow_refs(admin, asset);
```
Now, we borrow a mutable reference to the TransferRef using `authorized_borrow_refs` which accepts the signer address and the asset object. This basically helps us to access the transfer capability of the coin we created.
```
let wallet = primary_fungible_store::ensure_primary_store_exists(account, asset);
```
Here we use the token storage framework library to get mutable references to the source wallet. We use `ensure_primary_store_exists` function from `primary_fungible_store` to check if the primary store of the account exists.
```
fungible_asset::set_frozen_flag(transfer_ref, wallet, false);
```
Finally, we call the Aptos framework's `set_frozen_flag` function with the acquired `TransferRef` capability, passing the wallet to be frozen and a 'true' boolean which will set the `freeze account function` of the account to `false` allowing all incoming or outgoing transfers.

---

This chapter is all about uno-reversing the previous lesson i.e. unfreezing your assets. Declare an entry function `unfreeze_account` with parameters admin as signer, and account of type address `acquires` keyword access `MangedFungibleAsset`. Declare a variable `asset` and call `get_metadata` function now declare a variable `transfer_ref` to allow admin signer to get access to transfer assets using `authorized_borrow_refs(admin, asset)`.transfer_ref next up we declare a variable `wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::ensure_primary_store_exists(account, asset)`lastly using fungible_asset::set_frozen_flag(transfer_ref, wallet, false) to set the freeze account function of the account to `false` allowing all incoming or outgoing transfers. 
