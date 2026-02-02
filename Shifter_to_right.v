// version  1.0.0 
// last edited 2026-02-01 , 11:20 AM
// last edited by Venoth
module Shifter_to_right (
    input [7:0] in_bit,
    output [7:0] out_bit,
    output carry_out
);
    assign out_bit = in_bit >> 1;
    assign carry_out = in_bit[0];
endmodule