from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) { 
    // Arr_len is used as recursion index.
    if (arr_len == 0) {
        // When arr_len 0 is reached, return 0.
        return (sum=0);
    }
    
    // Recurson to iterate orver all elements of the array.
    let (sum) = sum_even(arr_len - 1, arr, run, idx);

    // Eval is_odd, this is done for every cycle of recursion in every array element. 
    let (is_odd) = bitwise_and(arr[arr_len-1],1);

    // If even return the accumulated value + the current recursion cycle element.    
    if(is_odd != 1){
        let new_sum = sum + arr[arr_len-1];
        return (sum=new_sum);
    }

    // If odd return only the accumulated value.
    return(sum=sum);
    
}
