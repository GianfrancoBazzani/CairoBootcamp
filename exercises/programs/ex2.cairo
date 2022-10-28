from starkware.cairo.common.uint256 import (Uint256 , uint256_add)

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {    
    return (y + 1,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    // Creating uint256 struct = 1
    let num_one: Uint256 = Uint256(low=1, high=0);

    // Uint256_add returns a tuple (res, carry) with the _ in the tuple deconstruction we are discarding the carry value
    let (y_plus_one: Uint256,_) = uint256_add(y, num_one);

    return (y_plus_one,);
}
