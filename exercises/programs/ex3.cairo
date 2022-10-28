// Perform and log output of simple arithmetic operations
func simple_math() {
    // adding 13 +  14
    let sum = 13 + 14;
    %{
        print("Sum =",ids.sum)
    %}

    // multiplying 3 * 6
    let mul = 3*6;
    %{
        print("Mult =",ids.mul)
    %}

    // dividing 6 by 2
    let div = 6/2;
    %{
        print("Mult =",ids.div)
    %}

    // dividing 70 by 2
    let div = 70/2;
    %{
        print("Mult =",ids.div)
    %}
   // dividing 7 by 2
    let div = 7/2;
    %{
        print("Mult =",ids.div)
    %}
    return ();
}
