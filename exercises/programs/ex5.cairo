from starkware.cairo.common.math import (abs_value)

// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise

// The inclusion of range_check_ptr implicit argument in function signature is needed since is used by abs_value()
func abs_eq{range_check_ptr }(x: felt, y: felt) -> (bit: felt) {
    // Allowing memory allocation
    alloc_locals;
    
    // Return_val memory alocation
    local return_val;
    
    // Computing abs val of x and y
    let abs_x = abs_value(x);
    let abs_y = abs_value(y);

    // return_val assertion control flow
    if( abs_x == abs_y) {
        assert return_val = 1;
    } else {
        assert return_val = 0;
    }
    
    return (return_val,);
}
