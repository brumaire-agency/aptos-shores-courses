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


  //Define a struct `TokenIdentifier` of ability key with two fields: - `mutator_ref` of type `token::MutatorRef`, `burn_ref` of type `token::BurnRef`
  //Define a struct `CollectionCapability` of ability key with two fields: `capability` of type `SignerCapability`, `burn_signer_capability` of type `SignerCapability`
  //Define a struct `MintInfo`of ability key with one field `count` of type `u64`

}