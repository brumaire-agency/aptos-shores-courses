module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, TransferRef, Metadata, FungibleAsset}; //import BurnRef
    use std::option;
    use std::string::utf8;
    use std::signer;

    const ASSET_SYMBOL: vector<u8> = b"SH";

    struct ManagedFungibleAsset has key {
        mint_ref: MintRef,
        transfer_ref: TransferRef,
         // create `burn_ref` as member

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
        let transfer_ref = fungible_asset::generate_transfer_ref(constructor_ref);
        // declare a variable `burn_ref` which invokes `fungible_asset::generate_burn_ref` with argument `constructor_ref`
        let metadata_object_signer = object::generate_signer(constructor_ref);
        move_to(
            &metadata_object_signer,
            ManagedFungibleAsset {mint_ref, transfer_ref} //add `burn_ref` as parameter
        )
    }

    #[view]
    public fun get_metadata(): Object<Metadata> {
        let asset_address = object::create_object_address(&@robinson, ASSET_SYMBOL);
        object::address_to_object<Metadata>(asset_address)
    }
     
    public entry fun mint(admin: &signer, to: address, amount: u64) acquires ManagedFungibleAsset {
        let asset = get_metadata();
        let managed_fungible_asset = authorized_borrow_refs(admin, asset);
        let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
        let fa = fungible_asset::mint(&managed_fungible_asset.mint_ref, amount);
        fungible_asset::deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa);
    }

   public entry fun transfer(admin: &signer, from: address, to: address, amount: u64) acquires ManagedFungibleAsset {
        let asset = get_metadata();
        let transfer_ref = &authorized_borrow_refs(admin, asset).transfer_ref;
        let from_wallet = primary_fungible_store::primary_store(from, asset);
        let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
        fungible_asset::transfer_with_ref(transfer_ref, from_wallet, to_wallet, amount);
    }

    // Declare an entry function `burn` with parameters admin as signer, from as the sender address and amount(u64) using `acquires` keyword access `MangedFungibleAsset`
    // Declare a variable `asset` and call `get_metadata` function
    // Declare a variable `burn_ref` to allow admin signer to burn assets using `authorized_borrow_refs(admin, asset)`.burn_ref
    // Declare a variable `from_wallet` to check if the primary store of the fungible token exists using `primary_fungible_store::primary_store(from, asset)`
    // Burn the minted coins using `fungible_asset::burn_from(burn_ref, from_wallet, amount);`

} 