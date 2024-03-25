module robinson::shoreNFT {

    use aptos_framework::account::{Self, SignerCapability};
    use aptos_framework::event;
    use aptos_framework::object;
    use aptos_std::string_utils::{to_string};
    use aptos_token_objects::collection;
    use aptos_token_objects::token;
    use std::option;
    use std::signer::address_of;
    use std::signer;
    use std::string::{Self, String, utf8};

    struct TokenIdentifier has key {
        mutator_ref: token::MutatorRef,
        burn_ref: token::BurnRef,
    }

    // Tokens require a signer to create, so this is the signer for the collection
    struct CollectionCapability has key {
        capability: SignerCapability,
        burn_signer_capability: SignerCapability,
    }

    struct MintInfo has key {
        count: u64,
    }

    const APP_SIGNER_CAPABILITY_SEED: vector<u8> = b"APP_SIGNER_CAPABILITY";
    const BURN_SIGNER_CAPABILITY_SEED: vector<u8> = b"BURN_SIGNER_CAPABILITY";
    const COLLECTION_NAME: vector<u8> = b"ShoreID Collection";
    const COLLECTION_DESCRIPTION: vector<u8> = b"ShoreID Collection Description";
    const COLLECTION_URI: vector<u8> = b"https://scarlet-live-iguana-759.mypinata.cloud/ipfs/QmNXMDmpoQvty8grDz8cv8Varu6JQw6ZR3aGYC4o3yV6MD";

    // Define a function `init_module` that takes a `&signer` as input
    // Create a resource account using `account::create_resource_account` with `account` as the signer and `APP_SIGNER_CAPABILITY_SEED` as the seed and store the the returned tuple value into `token_resource` and `token_signer_cap`
    // Create another resource account using `account::create_resource_account` with `account` as the signer and `BURN_SIGNER_CAPABILITY_SEED` as the seed and store the returned tuple into a throwaway variable (`_`) and `burn_signer_capability`
    // Move the `CollectionCapability` struct with fields `capability` and `burn_signer_capability` to the `account` signer's storage
    // Move the `MintInfo` struct with field `count` initialized to `0` to the `account` signer's storage
    // Call the `create_collection` function with `&token_resource` as an argument.


}