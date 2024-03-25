module robinson::shoreCurrency {

    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use aptos_framework::fungible_asset::{Self, MintRef, FungibleAsset};
    use std::option;
    use std::string::utf8;
    use std::signer; 


    //declare a const `ASSET_SYMBOL` of type vector<u8> with value "SH";
    //declare a function `init_module` with parameter `admin` as a signer
    //inside the function body declare a variable `constructor_ref` which invokes `object::create_named_object` with arguments (admin, ASSET_SYMBOL) 
    //next invoke `primary_fungible_store::create_primary_store_enabled_fungible_asset`, which accepts five arguments  constructor_ref, option::none(), utf8(b"Shore Coin"), utf8(ASSET_SYMBOL), decimal with value 8,  a utf8(b"URL pointing to the icon representing the fungible asset") and another utf8(b"URL directing to the project")




} 

   
    
