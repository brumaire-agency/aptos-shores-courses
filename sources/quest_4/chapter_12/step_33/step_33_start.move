module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, Metadata, FungibleAsset}; //import TransferRef
    use std::option;
    use std::string::utf8;
    use std::signer;



    const ASSET_SYMBOL: vector<u8> = b"SH";

    struct ManagedFungibleAsset has key {
        mint_ref: MintRef,
        // create `transfer_ref` as member

    }

    fun init_module(admin: &signer) {
        let constructor_ref = &object::create_named_object(admin, ASSET_SYMBOL);
        primary_fungible_store::create_primary_store_enabled_fungible_asset(
            constructor_ref,
            option::none(),
            utf8(b"Shore Coin"), 
            utf8(ASSET_SYMBOL), 
            8, 
            utf8(b""), 
            utf8(b""),
        );
        
        let mint_ref = fungible_asset::generate_mint_ref(constructor_ref);
        // declare a variable `transfer_ref` which invokes `fungible_asset::generate_transfer_ref` with argument `constructor_ref`
        let metadata_object_signer = object::generate_signer(constructor_ref);
        move_to(
            &metadata_object_signer,
            ManagedFungibleAsset {mint_ref} //add `transfer_ref` as parameter
        )
    }
     
    public entry fun mint(admin: &signer, to: address, amount: u64) acquires ManagedFungibleAsset {
        let asset_address = object::create_object_address(&@robinson, ASSET_SYMBOL);
        let asset = object::address_to_object<Metadata>(asset_address);
        let managed_fungible_asset = authorized_borrow_refs(admin, asset);
        let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
        let fa = fungible_asset::mint(&managed_fungible_asset.mint_ref, amount);
        fungible_asset::deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa);
    }

    // Declare an entry function `transfer` with parameters admin as signer, to as the recipient address and amount(u64) using `acquires` keyword access `MangedFungibleAsset`
    // Declare a local variable `asset_address` to store the address for the coin's metadata using `create_object_address(&@module_name, ASSET_SYMBOL)` from object library
    // Declare a local variable asset to convert that to metadata object to access details using `address_to_object<Metadata>(asset_address)` from object library
    // Declare a variable `transfer_ref` to allow admin signer to get access to transfer assets using `authorized_borrow_refs(admin, asset)`.transfer_ref
    // Declare a variable `from_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::primary_store(from, asset)`
    // Declare a variable `to_wallet` to check if the primary store of the fungible token exists or it will create one using `primary_fungible_store::ensure_primary_store_exists(to, asset)`
    // Transfer the minted coins from the sender's wallet into the recipient's wallet using `fungible_asset::transfer_with_ref(transfer_ref, from_wallet, to_wallet, amount);`

} 