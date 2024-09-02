# `authorized_borrow_refs` function in Move

## Introduction

The `authorized_borrow_refs` function is an inline function that borrows an immutable reference to the `ManagedFungibleAsset` resource associated with a given metadata object. It validates that the signer is the owner of the metadata object before allowing the borrow operation.

## Implementing a inline `authorized_borrow_refs` Function
```
inline fun authorized_borrow_refs(
        owner: &signer,
        asset: Object<Metadata>,
    ): &ManagedFungibleAsset acquires ManagedFungibleAsset 
```
`authorized_borrow_refs`  function takes two parameters
   - `owner`: a reference to a  `signer`  representing the expected owner of the metadata object.
   - `asset`: an  `Object<Metadata>` representing the metadata object.
The function returns an immutable reference (`&`) to the `ManagedFungibleAsset`  resource.
The function acquires the  `ManagedFungibleAsset`  resource, indicating that it will access the resource during execution.

## Check Ownership
```
assert!(object::is_owner(asset,  signer::address_of(owner)),  error::permission_denied(ENOT_OWNER));
```
The  `object::is_owner(asset, signer::address_of(owner))`  function is called to check if the  `owner`  is indeed the owner of the  `asset`  metadata object.
It compares the address of the  `owner`  signer with the owner address stored in the metadata object.
The  `assert!`  macro is used to enforce the ownership check:
-   If the  `owner`  is not the owner of the  `asset`, an error is thrown using  `error::permission_denied(ENOT_OWNER)`.
-   `ENOT_OWNER`  is a constant defined in the code, representing the error code for "not the owner"

## Borrow Global Struct `ManagedFungibleAsset`
 ```
 borrow_global<ManagedFungibleAsset>(object::object_address(&asset))
 ```
-   If the ownership check passes, the function proceeds to borrow the  `ManagedFungibleAsset`  resource associated with the  `asset`  metadata object.
-   The  `object::object_address(&asset)`  function is called to obtain the address of the  `asset`  metadata object.
-   The  `borrow_global<ManagedFungibleAsset>(...)`  function is used to borrow the  `ManagedFungibleAsset`  resource from the global storage at the obtained address.
-   The borrowed reference to the  `ManagedFungibleAsset`  resource is then returned.

The `authorized_borrow_refs` function serves as a helper function to ensure that only the authorized owner of the metadata object can borrow the associated `ManagedFungibleAsset` resource. It provides a secure way to access the resource while enforcing ownership checks. (edited) 

---
We have reached the end of this module and it is time for you to add the last peice of the code to create your `Shore Coin`. First import `error` module from standard library, then declare a constant `ENOT_OWNER` of type `u64` with value `1`. Now let's move to the last function of this code, declare an inline function `authorized_borrow_refs` with parameters owner acting as a reference to the signer, and asset representing `Object<Metadata>` which returns an immutable reference to `ManagedFungibleAsset` resource, using `acquires` keyword access `ManagedFungibleAsset` from the function. Now using assert keyword check  if the  `owner`  is indeed the owner of the  `asset`  metadata object if not an error is thrown using  `error::permission_denied(ENOT_OWNER)`.
in the end use borrow_global<ManagedFungibleAsset>(object::object_address(&asset)) to borrow the  `ManagedFungibleAsset`  resource from the global storage at the obtained address.























