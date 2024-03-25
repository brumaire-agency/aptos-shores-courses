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

}