// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    alloc_locals;

    if (n == 1) {
        return (1,);
    }

    let (sum) = calculate_sum(n - 1);
    return (n + sum,);
}
