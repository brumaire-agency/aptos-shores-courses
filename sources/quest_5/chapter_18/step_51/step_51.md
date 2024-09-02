# Converting Number to String Representation

This lesson breakdowns the `num_to_str` function, designed to transform an unsigned 64-bit integer into its string representation, stored as a vector of bytes.

### Function Declaration and Vector Initialization:

   The function is declared as `public fun num_to_str(num: u64): vector<u8>` to accept an unsigned 64-bit integer `num` and return a vector of bytes.
   It initializes an empty vector, `vec_data`, to store the bytes of the string representation.

   ```move
   public fun num_to_str(num: u64): vector<u8> {
       let vec_data = vector::empty<u8>();
        ...
   }
   ```
### Loop Iteration

   The function enters a loop until all digits of the number have been processed.

   ```move
   while (true) {
      
   }
   ```
### Digit Conversion and Vector Update:

   Within the loop, it extracts the least significant digit of `num` using modulo operator and converts it to its ASCII code.
   Appends the resulting byte to the end of `vec_data` using `vector::push_back`.

   ```move
   vector::push_back(&mut vec_data, (num % 10 + 48 as u8));
   ```
### Number Update and Break Condition:
   After processing each digit, it updates `num` by removing the least significant digit.
   Checks if `num` equals zero, signaling completion of digit processing, and breaks the loop.

   ```move
   num = num / 10;
   if (num == 0) {
       break
   };
   ```
### Vector Reversal:

After processing all digits, the bytes in `vec_data` represent the number in reverse order.
Utilizes `vector::reverse` function to reverse the byte order in `vec_data` to obtain the correct string representation.

   ```move
   vector::reverse<u8>(&mut vec_data);
   ```
### Returning the Vector:
Concludes by returning the `vec_data` vector containing the bytes of the string representation.
   ```move
   return vec_data;
   ```

---
How excited are you on successfully completing all these lessons? Don't worry we have just got one more and you will be a level up in the MOVE mastery game. In this lesson we will look into converting number to string type. Let's get coding define a public function `num_to_str` that takes a `u64` as input and returns a `vector<u8>`. Initialize an empty `vector<u8>` called `vec_data`, next declare a while loop, it will continue till the condition is true, inside the loop push the last digit of `num` (obtained by `num % 10`) plus the ASCII value of '0' (48) to `vec_data`. Divide `num` by 10 to remove the last digit if `num` becomes 0, exit the loop then, reverse the elements in `vec_data` to get the digits in the correct order. In the end return the `vec_data` vector, which now contains the byte representation of the string.