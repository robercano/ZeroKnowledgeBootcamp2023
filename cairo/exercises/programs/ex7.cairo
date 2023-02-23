%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    alloc_locals;

    if (idx == 128) {
        return (1,);
    }

    let (bit) = bitwise_and(n, 1);

    // Chain has already been broken, only bits set to 0 are allowed
    if (bit == 1 and broken_chain == 1) {
        return (0,);
    }
    // Pattern has been broken, directly return false
    if (bit == 1 and exp == 0) {
        return (0,);
    }
    // Pattern has been broken but it could be trailing zeroes, keep checking
    let (next_n, _) = unsigned_div_rem(n, 2);
    let (next_exp) = bitwise_xor(exp, 1);
    if (bit == 0 and exp == 1) {
        return pattern(next_n, idx+1, next_exp, 1);
    }

    return pattern(next_n, idx+1, next_exp, broken_chain);
}
