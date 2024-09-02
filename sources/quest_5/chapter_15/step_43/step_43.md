### Let's Understand the Constants

In our nft contract, several constants are defined to configure the behavior of the nft contract. Let's explore each of them:

#### APP_SIGNER_CAPABILITY_SEED:

```move
const APP_SIGNER_CAPABILITY_SEED: vector<u8> = b"APP_SIGNER_CAPABILITY";
```
- This constant is a vector of bytes representing the seed used to create the resource account for the application's signer capability.
- It is utilized in the `init_module` function to create a resource account with the specified seed.

#### BURN_SIGNER_CAPABILITY_SEED:

```move
const BURN_SIGNER_CAPABILITY_SEED: vector<u8> = b"BURN_SIGNER_CAPABILITY";
```
- This constant is a vector of bytes representing the seed used to create the resource account for the burn signer capability.
- It is employed in the `init_module` function to create a separate resource account specifically for burning tokens.

#### COLLECTION_NAME:

```move
const COLLECTION_NAME: vector<u8> = b"ShoreID Collection";
```
- This constant is a vector of bytes representing the name of the token collection.
- It is used in the `create_collection` function to set the name of the collection during creation.

#### COLLECTION_DESCRIPTION:

```move
const COLLECTION_DESCRIPTION: vector<u8> = b"ShoreID Collection Description";
```
- This constant is a vector of bytes representing the description of the token collection.
- It is employed in the `create_collection` function to set the description of the collection during creation.

#### COLLECTION_URI:

```move
const COLLECTION_URI: vector<u8> = b"https://scarlet-live-iguana-759.mypinata.cloud/ipfs/QmNXMDmpoQvty8grDz8cv8Varu6JQw6ZR3aGYC4o3yV6MD";
```
- This constant is a vector of bytes representing the URI (Uniform Resource Identifier) of the token collection.
- It is used in the `create_collection` function to set the URI of the collection during creation.
- The URI typically points to a location where additional information about the collection can be found, such as metadata or images.
These constants serve as configuration values and are used in the following ways:
- `APP_SIGNER_CAPABILITY_SEED` and `BURN_SIGNER_CAPABILITY_SEED` are utilized to create resource accounts with specific seeds in the `init_module` function.
- `COLLECTION_NAME`, `COLLECTION_DESCRIPTION`, and `COLLECTION_URI` are used to set the corresponding properties of the token collection when it is created in the `create_collection` function.
By using constants, the code becomes more readable and maintainable. If you need to change any of these values, you can simply modify the constant definition, and it will be reflected throughout the code wherever the constant is used.

---
Good work up till now. This one is an easy step so let's get MOVEing quickly. We will declare five constants in total first define a constant `APP_SIGNER_CAPABILITY_SEED` of type `vector<u8>` with the value `b"APP_SIGNER_CAPABILITY"` next we define a constant `BURN_SIGNER_CAPABILITY_SEED` of type `vector<u8>` with the value `b"BURN_SIGNER_CAPABILITY"`. The next three constants will be `COLLECTION_NAME` of type `vector<u8>` with the value `b"ShoreID Collection"`, `COLLECTION_DESCRIPTION` of type `vector<u8>` with the value `b"ShoreID Collection Description"` and  `COLLECTION_URI` of type `vector<u8>` with the value `b"https://scarlet-live-iguana-759.mypinata.cloud/ipfs/QmNXMDmpoQvty8grDz8cv8Varu6JQw6ZR3aGYC4o3yV6MD"`. These can be replaced with respective values of your choice when working on a project of your own.