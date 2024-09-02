# Dig Deep into Creating Tokens

This exploration delves into the intricate process of creating tokens within a digital environment. Let's break down each step!

### Borrowing the MintInfo Resource

```move
let mint_info = borrow_global_mut<MintInfo>(@robinson);
```
-   The `borrow_global_mut` function is used to borrow the `MintInfo` resource from the `@robinson` account with mutable access.
-   The borrowed resource is stored in the `mint_info` variable, allowing it to be modified.

### Retrieving the Current Count

```move
let count = mint_info.count;
```
-   This line accesses the `count` field from the borrowed `MintInfo` resource and stores its value in the `count` variable.
-   The `count` variable represents the current count of tokens minted.

### Calculating the Next Count
```move
let next_count = count + 1;
```
-   Here, the `next_count` variable is calculated by adding 1 to the current count.
-   This value represents the count for the next token to be minted.

### Appending a Space and "#" to the Token Name
```move
string::append(&mut token_name, utf8(b" #"));
```
-   The `string::append` function is used to append a space and "#" to the `token_name` string.
-   The `&mut` syntax indicates that `token_name` is being borrowed as a mutable reference, allowing it to be modified.
-   The `utf8` function converts the byte array `b" #"` to a string before appending it.

### Appending the Next Count to the Token Name
```move
string::append(&mut token_name, utf8(num_to_str(next_count)));
```
-   The `num_to_str` function is called with the `next_count` value to convert the count to a string representation.
-   The resulting string is then converted to a `String` type using the `utf8` function.
-   Finally, the `string::append` function is used to append the converted count string to the `token_name` string.

In summary, this code snippet sequentially performs the following steps:
1.  Borrows the `MintInfo` resource with mutable access to modify it.
2.  Retrieves the current count of tokens.
3.  Calculates the next count for the new token.
4.  Appends a space and "#" to the token name.
5.  Appends the next count to the token name.

---
It is fun creating your own token isn't it? Keep moving forward the finishing line is near. Let us look at the tasks in this lesson. First borrow the global `MintInfo` resource at the address `@robinson` as mutable.Get the current `count` value from the `MintInfo` resource and increment the `count` value by 1 and store it in `next_count`. Then append the string " #" to the `token_name` string and finally convert the `next_count` value to a string and append it to the `token_name` string. 