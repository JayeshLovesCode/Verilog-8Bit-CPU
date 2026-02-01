'timescale 1ns / 1ps
module shifter_to_left_tb;
reg [7:0] in_sim;
wire [7:0] out_sim, carry_out_sim;
shifter_to_left_tb dut(.in_bit(in_sim), .out_bit(out_sim), .carry_out(carry_out_sim));
initial begin
    in_sim = 8'b 00000001;
    #10 in_sim = 8'b 10010101;
    #10 in_sim = 8'b 11111111;
    #10 in_sim = 8'b 00000000;
    #20 $finish;
end
initial begin
    $monitor($time, "in_sim = %b, out_bit = %b, carry_out = %b", in_sim, out_sim, carry_out_sim);
end
endmodule