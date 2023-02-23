from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if (arr_len == 0) {
        return (0,);
    }

    let (sum_of_rest) = sum_even(arr_len - 1, arr + 1, 0, 0);
    
    let (is_even) = bitwise_and(arr[0], 1);
    if (is_even == 0) {
        return (arr[0] + sum_of_rest,);
    } else {
        return (sum_of_rest,);
    }
}
