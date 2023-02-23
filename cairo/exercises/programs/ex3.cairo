from starkware.cairo.common.math import unsigned_div_rem
// Perform and log output of simple arithmetic operations
func simple_math{range_check_ptr}() {
   // adding 13 +  14
   let add = 13 + 14;
   %{ print(f"passing value: {ids.add}") %}

   // multiplying 3 * 6
   let mul = 3*6;
   %{ print(f"passing value: {ids.mul}") %}

   // dividing 6 by 2
   let div = 6/2;
   %{ print(f"passing value: {ids.div}") %}

   // dividing 70 by 2
   let div2 = 70/2;
   %{ print(f"passing value: {ids.div2}") %}

   // dividing 7 by 2
   let (div3,_) = unsigned_div_rem(7, 2);
   %{ print(f"passing value: {ids.div3}") %}


    return ();
}
