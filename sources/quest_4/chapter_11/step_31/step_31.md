# Managing Fungible Assets in Move

Managing fungible assets in Move involves encapsulating control over the asset within a resource. This ensures secure access and allows for precise control over actions like minting and transferring.

## Defining the ManagedFungibleAsset Resource

We define a `ManagedFungibleAsset` resource to hold key capabilities:
```
struct ManagedFungibleAsset has key {
  mint_ref: MintRef,
  transfer_ref: TransferRef,
  burn_ref: BurnRef,
}
```
The permissions required to manage fungible assets are referred to as "Refs," with three distinct types:

1. ****BurnRef:**** This allows the burning of fungible assets of the specific type created. Further details on this will be provided in subsequent lessons.
2. ****FreezeRef:**** This permits the freezing of a user's FungibleStore object, preventing them from sending or receiving fungible assets. It also enables the forceful transfer of a token amount from the user's wallet, functioning as a combination of burn and mint actions.
3. ****MintRef:**** This facilitates the minting of additional fungible assets.

It's important to note that Refs cannot be copied and are exclusively created during the initial transaction where the metadata object is established. They cannot be duplicated or generated afterward. All Refs can be stored. As a reminder, resources can be freely added to objects, so the most convenient approach to store Refs is within a resource directly attached to the metadata object itself.

## Generating References

Using the Aptos fungible asset framework, we generate these references:
```
let mint_ref = fungible_asset::generate_mint_ref(constructor_ref);
```
## Creating a Unique Signer

We create a unique signer to hold the resource:
```
let metadata_object_signer = object::generate_signer(constructor_ref);
```
## Moving the Resource

Finally, we move the assembled resource to this signer account:
```
move_to(&metadata_object_signer, ManagedFungibleAsset {...});
```
This approach centralizes control over the fungible asset within the resource. The references provide the flexibility to implement custom logic for minting, burning, and transferring. It ensures secure management by abstracting control privileges into a single access point, which can be selectively granted to designated actors.

****Note:**** To _*move*_ resources from one account to another we will use the built it function `move_to` which always accepts `signer` as the `first argument` and the `resource` you need to transfer to the signer as the `second argument`

---
It is time for you to learn how to manage your fungible assets. In this lesson we start by creating a struct named `ManagedFungibleAsset` with ability key with mint_ref as member. Then declare a variable `mint_ref` which invokes `fungible_asset::generate_mint_ref` with argument `constructor_ref`, declare another  variable `metadata_object_signer` which invokes `object::generate_signer` with argument `constructor_ref` and finally use the built-in function `move_to` with &`metadata_object_signer` as first argument and , `ManagedFungibleAsset{mint_ref}` as second argument.