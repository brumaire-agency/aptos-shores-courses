# Making Token Contracts Reusable

## Introduction
When writing Move smart contracts, we want to make our code organized and reusable across functions. In this lesson, we'll refactor a token contract for reusability.

## The Code Reuse Issue
Our current token contract has mint and transfer logic that duplicates getting the metadata:
```
// Mint function structure
get_metadata()
borrow_mint_cap()
mint_tokens()
// Transfer function structure
get_metadata()
borrow_transfer_cap()
transfer_tokens()
```
This duplicates logic and makes changing the metadata tricky and also the code in this case isn't optimized.

## Creating a Reusable Function
We can abstract the common metadata logic:
```
 #[view]
 public fun get_metadata(): Object<Metadata> {
        let asset_address = object::create_object_address(&@FACoin, ASSET_SYMBOL);
        object::address_to_object<Metadata>(asset_address)
    }
```
Now both functions can call:
```
let metadata = get_metadata()
```
---
Let's talk optimization of code. In the previous two lessons you might have noticed that there is continuous repition of a few lines of code, instead of doing redundant work we will optimize the code a little bit. Declare a `view` only function `get_metadata()` which returns `Object<Metadata>` then declare a local variable `asset_address` to store the address for the coin's metadata using `create_object_address(&@module_name, ASSET_SYMBOL)` from object library finally return the conversion of asset address to object of the metadata to access details using `address_to_object<Metadata>(asset_address)` from object library. Once you are done creating the function replace the following two lines of code by calling the `get_metadata` function. 

**Code to be replaced:** 

```
 let asset_address = object::create_object_address(&@robinson, ASSET_SYMBOL);
 let asset = object::address_to_object<Metadata>(asset_address);
```

     