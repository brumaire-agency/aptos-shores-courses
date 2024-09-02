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

    
    struct CollectionCapability has key {
        capability: SignerCapability,
        burn_signer_capability: SignerCapability,
    }

    struct MintInfo has key {
        count: u64,
    }

    // Define a constant `APP_SIGNER_CAPABILITY_SEED` of type `vector<u8>` with the value `b"APP_SIGNER_CAPABILITY"`
    // Define a constant `BURN_SIGNER_CAPABILITY_SEED` of type `vector<u8>` with the value `b"BURN_SIGNER_CAPABILITY"`
    // Define a constant `COLLECTION_NAME` of type `vector<u8>` with the value `b"ShoreID Collection"`
    // Define a constant `COLLECTION_DESCRIPTION` of type `vector<u8>` with the value `b"ShoreID Collection Description"`
    // Define a constant `COLLECTION_URI` of type `vector<u8>` with the value `b"https://scarlet-live-iguana-759.mypinata.cloud/ipfs/QmNXMDmpoQvty8grDz8cv8Varu6JQw6ZR3aGYC4o3yV6MD"`



}