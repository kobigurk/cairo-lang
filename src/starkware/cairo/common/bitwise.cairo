from starkware.cairo.common.cairo_builtins import BitwiseBuiltin

# Computes the bitwise operations and, xor and or.
#
# Arguments:
#   bitwise_ptr - the bitwise builtin pointer.
#   x, y - the two field elements to operate on, in this order. Both inputs should be 251-bit
#     integers, and are taken as unsigned ints.
#
# Returns:
#   x_and_y = x & y (bitwise and).
#   x_xor_y = x ^ y (bitwise xor).
#   x_or_y = x | y (bitwise or).
func bitwise_operations{bitwise_ptr : BitwiseBuiltin*}(x : felt, y : felt) -> (
        x_and_y : felt, x_xor_y : felt, x_or_y : felt):
    bitwise_ptr.x = x
    bitwise_ptr.y = y
    let x_and_y = bitwise_ptr.x_and_y
    let x_xor_y = bitwise_ptr.x_xor_y
    let x_or_y = bitwise_ptr.x_or_y
    let bitwise_ptr = bitwise_ptr + BitwiseBuiltin.SIZE
    return (x_and_y=x_and_y, x_xor_y=x_xor_y, x_or_y=x_or_y)
end

# Computes the bitwise and of two inputs.
#
# Arguments:
#   bitwise_ptr - the bitwise builtin pointer.
#   x, y - the two field elements to operate on, in this order. Both inputs should be 251-bit
#     integers, and are taken as unsigned ints.
#
# Returns:
#   x_and_y = x & y (bitwise and).
func bitwise_and{bitwise_ptr : BitwiseBuiltin*}(x : felt, y : felt) -> (x_and_y : felt):
    bitwise_ptr.x = x
    bitwise_ptr.y = y
    let x_and_y = bitwise_ptr.x_and_y
    let x_xor_y = bitwise_ptr.x_xor_y
    let x_or_y = bitwise_ptr.x_or_y
    %{
        ids.x_xor_y = ids.x ^ ids.y
        ids.x_or_y = ids.x | ids.y
    %}
    let bitwise_ptr = bitwise_ptr + BitwiseBuiltin.SIZE
    return (x_and_y=x_and_y)
end

# Computes the bitwise xor of two inputs.
#
# Arguments:
#   bitwise_ptr - the bitwise builtin pointer.
#   x, y - the two field elements to operate on, in this order. Both inputs should be 251-bit
#     integers, and are taken as unsigned ints.
#
# Returns:
#   x_xor_y = x ^ y (bitwise xor).
func bitwise_xor{bitwise_ptr : BitwiseBuiltin*}(x : felt, y : felt) -> (x_xor_y : felt):
    bitwise_ptr.x = x
    bitwise_ptr.y = y
    let x_and_y = bitwise_ptr.x_and_y
    let x_xor_y = bitwise_ptr.x_xor_y
    let x_or_y = bitwise_ptr.x_or_y
    %{
        ids.x_and_y = ids.x & ids.y
        ids.x_or_y = ids.x | ids.y
    %}
    let bitwise_ptr = bitwise_ptr + BitwiseBuiltin.SIZE
    return (x_xor_y=x_xor_y)
end

# Computes the bitwise or of two inputs.
#
# Arguments:
#   bitwise_ptr - the bitwise builtin pointer.
#   x, y - the two field elements to operate on, in this order. Both inputs should be 251-bit
#     integers, and are taken as unsigned ints.
#
# Returns:
#   x_or_y = x | y (bitwise or).
func bitwise_or{bitwise_ptr : BitwiseBuiltin*}(x : felt, y : felt) -> (x_or_y : felt):
    bitwise_ptr.x = x
    bitwise_ptr.y = y
    let x_and_y = bitwise_ptr.x_and_y
    let x_xor_y = bitwise_ptr.x_xor_y
    let x_or_y = bitwise_ptr.x_or_y
    %{
        ids.x_and_y = ids.x & ids.y
        ids.x_xor_y = ids.x ^ ids.y
    %}
    let bitwise_ptr = bitwise_ptr + BitwiseBuiltin.SIZE
    return (x_or_y=x_or_y)
end
