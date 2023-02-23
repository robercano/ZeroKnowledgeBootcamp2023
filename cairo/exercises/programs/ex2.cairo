from starkware.cairo.common.uint256 import Uint256, uint256_add

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    tempvar val = y + 1;

    return (val,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    let one = Uint256(low = 1, high = 0);
    let (val,_) = uint256_add(y, one);

    return (val,);
}
