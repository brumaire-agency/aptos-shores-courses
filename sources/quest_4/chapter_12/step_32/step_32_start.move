module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, FungibleAsset}; //import Metadata
    use std::option;
    use std::string::utf8;
    use std::signer;

    const ASSET_SYMBOL: vector<u8> = b"SH";

    struct ManagedFungibleAsset has key {
        mint_ref: MintRef,

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
        let metadata_object_signer = object::generate_signer(constructor_ref);
        move_to(
            &metadata_object_signer,
            ManagedFungibleAsset {mint_ref}
        )
    }

    // Declare an entry function mint with parameters admin as signer, to as the recipient address and amount(u64) as the amount of coin which needs to be transferred also using `acquires` keyword access `MangedFungibleAsset`
    // Declare a local variable `asset_address` to store the address for the coin's metadata using `create_object_address(&@module_name, ASSET_SYMBOL)` from object library
    // Declare a local variable asset to convert that to metadata object to access details using `address_to_object<Metadata>(asset_address)` from object library
    // Declare a variable `managed_fungible_asset` to allow admin signer to get access to minting using `authorized_borrow_refs(admin, asset)`
    // Declare a variable `to_wallet` to check if the primary store of the fungible token exists or it will create one using `primary_fungible_store::ensure_primary_store_exists(to, asset)`
    // Declare a variable `fa` to mint new coins calling the `mint` function
    // Deposit newly minted coins into the recipient's wallet using `deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa)` from fungible_asset library;

} 