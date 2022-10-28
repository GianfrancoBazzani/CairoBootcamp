%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 0000000010101010 PASS
// 0010101010101011 FAIL


// Correct 252 bit-length binary pattern because felt element is a 252-bit number at the time that i writing this code.
func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    alloc_locals;
    
    let (lsb) = bitwise_and(n,1);

    // if its firts iteration (idx = 0), return 0 if n = 0 or LSB of n = 1.
    if (idx == 0){
        if (n == 0){
            return(0,);
        }
        if (lsb == 1){
            return(0,);
        }
    }
    
    // if n = 0 and its not firts iteration means that the desired pattern matches.
    if (n == 0){
        if(idx == 1){
            return(1,);
        }
    }

    // shift n >> 1, remainder is the old LSB
    let (new_n, lsb) = unsigned_div_rem(n,2);
    
    // if old LSB XOR new LSB == 1 means that they are different and we call the recursion
    // compute new lsb new_n AND 1
    let (new_lsb) = bitwise_and(new_n,1);
    // evaluate if patern matches lsb XOR new_lsb
    let (pattern_match) = bitwise_xor(lsb, new_lsb);

    if (pattern_match == 1){
        if(n!=0){
            let (ret_val) = pattern(n = new_n, idx = 1, exp=0, broken_chain=0);
            return(ret_val,);
        }
    } 

    return(0,);
    

    
}
