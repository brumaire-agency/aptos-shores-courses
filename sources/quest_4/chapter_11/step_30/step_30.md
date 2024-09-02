# Understanding init_module in Fungible Asset

When initiating the creation of a coin for the first time, developers are required to establish a named object intended to serve as the fungible asset metadata object. Typically, this process occurs within the init_module function. Creating a named object necessitates a signer, and it is advisable to employ the same signer used for deploying the module's account. Moreover, the `init_module` function guarantees the prompt creation of the fungible asset once the module is deployed.

```
fun init_module(module_signer:  &signer)  {
  let metadata_constructor_ref =  &object::create_named_object(module_signer,  MY_TOKEN_SYMBOL);
  let max_supply =  option::none();
  primary_fungible_store::create_primary_store_enabled_fungible_asset(
 constructor_ref,
 max_supply,
  string::utf8(b"Token Example"),
  string::utf8(ROKEN_EXAMPLE),
  6,
  string::utf8(b"https://mytokenexample.com/icon.png"),
  string::utf8(b"https://mytokenexample.com"),
  );
  }
```

In this example, we initially invoke `object::create_named_object`, which necessitates a signer, to establish a new object serving as the metadata object. Although developers have the flexibility to choose any signer, it is advisable to utilize the module signer. Subsequently, we invoked `primary_fungible_store::create_primary_store_enabled_fungible_asset`, which accepts seven arguments:

1.  The constructor ref obtained upon creating the metadata object.
2.  The maximum supply, representing the upper limit of fungible assets that can be minted. This parameter is **optional** and can be set as `option::none()`. Further details on this parameter will be covered in a separate lesson.
3.  The name of the fungible asset, which should be concise.
4.  The symbol of the fungible asset, a brief uppercase designation typically consisting of 3-5 letters.
5.  Decimals, denoting the number of fractional digits associated with the fungible asset's value. For instance, USD (United States Dollar) has 2 decimals. It is essential to minimize rounding errors since all computations on Aptos are based on integer math (e.g., 3/2 = 1). Most tokens feature 6-8 decimals.
6.  The URL pointing to the icon representing the fungible asset, visible in wallets and other web interfaces.
7.  The URL directing to the project, which may be displayed in wallets or web interfaces depending on the application's context.


Too many information to soak in isn't it? Don't worry we will be taking you through each line of code one by one while you also understand why are we using it particularly. Declare a constant `ASSET_SYMBOL` of type vector<u8> with value "SH". We now enter the `init_module` function body and declare a variable `constructor_ref` which invokes `object::create_named_object` with arguments (admin, ASSET_SYMBOL) we next invoke `primary_fungible_store::create_primary_store_enabled_fungible_asset`, which accepts seven arguments constructor_ref, option::none(), utf8(b"Shore Coin"), utf8( ASSET_SYMBOL), decimal with value 8, utf8(b"URL pointing to the icon representing the fungible asset") and another utf8(b"URL directing to the project"). 