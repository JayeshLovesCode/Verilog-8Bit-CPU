module Adder(
    input [7:0] A,B,
    input Carry_in,
    output [7:0] Sum,
    output Carry_out
);
    assign {Carry_out, Sum} = A + B + Carry_in;
endmodule