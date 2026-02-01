`timescale 1ns / 1ps
module Shifter_to_right_TB;
reg [7:0] in_sim;
wire [7:0] out_sim;
wire  carry_out_sim;
Shifter_to_left dut(.in_bit(in_sim), .out_bit(out_sim), .carry_out(carry_out_sim));

initial begin
    $dumpfile("Shifter_to_right_TB.vcd");
    $dumpvars(0, Shifter_to_right_TB);
end

initial begin
    in_sim = 8'b 10001000;
    #10 in_sim = 8'b 11100000;
    #10 in_sim = 8'b 11010111;
    #10 in_sim = 8'b 01011110;
    #20 $finish;
end
initial begin
    $monitor($time, "in_sim = %b, out_bit = %b, carry_out = %b", in_sim, out_sim, carry_out_sim);
end
endmodule