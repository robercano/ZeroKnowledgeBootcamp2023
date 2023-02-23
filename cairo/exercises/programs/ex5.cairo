from starkware.cairo.common.math import abs_value
// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise
func abs_eq{range_check_ptr}(x: felt, y: felt) -> (bit: felt) {
    let abs_x = abs_value(x);
    let abs_y = abs_value(y);

    if (abs_x == abs_y) {
        return (1,);
    } else {
        return (0,);
    }
}
