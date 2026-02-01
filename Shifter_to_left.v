module Shifter_to_left (
    input [7:0] in_bit,
    output [7:0] out_bit, carry_out
);
    assign out_bit = in_bit << 1;
    assign carry_out = in_bit[7];
endmodule