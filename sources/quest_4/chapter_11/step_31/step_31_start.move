module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, FungibleAsset};
    use std::option;
    use std::string::utf8;
    use std::signer;

    const ASSET_SYMBOL: vector<u8> = b"SH";

    //create a struct named `ManagedFungibleAsset` with ability key with mint_ref as member.

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
        
    //declare a variable `mint_ref` which invokes `fungible_asset::generate_mint_ref` with argument `constructor_ref`
    //declare a variable `metadata_object_signer` which invokes `object::generate_signer with argument `constructor_ref`;
    //use the built-in function `move_to` with &metadata_object_signer as first argument and , ManagedFungibleAsset {mint_ref} as second argument
      
    }


} 