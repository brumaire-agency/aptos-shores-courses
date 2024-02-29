module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, FungibleAsset};
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
     
    public entry fun mint(admin: &signer, to: address, amount: u64) acquires ManagedFungibleAsset {
        let asset_address = object::create_object_address(&@robinson, ASSET_SYMBOL);
        let asset = object::address_to_object<Metadata>(asset_address);
        let managed_fungible_asset = authorized_borrow_refs(admin, asset);
        let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
        let fa = fungible_asset::mint(&managed_fungible_asset.mint_ref, amount);
        fungible_asset::deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa);
    }


} 