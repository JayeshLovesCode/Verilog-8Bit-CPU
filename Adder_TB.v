`timescale 1ns / 1ps
module Adder_TB;
    //Testbench signals 
    reg [7:0] A_sim, B_sim;
    reg Carry_in_sim;
    wire [7:0] Sum_sim;
    wire Carry_out_sim;
    Adder dut(.A(A_sim), .B(B_sim), .Carry_in(Carry_in_sim), .Sum(Sum_sim), .Carry_out(Carry_out_sim));

    //Dumpfile and dumpvariable  for waveform generaotr
    initial begin
        $dumpfile("Adder_TB.vcd"); // dumpfile name
        $dumpvars(0,Adder_TB); // ) 0 is dumping previous signals
    end

    //Applying stimulus for generator 
    initial begin
        A_sim = 8'b 10110000;
        B_sim = 8'b 01001000;
        Carry_in_sim = 0;
        #10 
        A_sim = 8'b 10001000;
        B_sim = 8'b 11001000;
        Carry_in_sim = 0;
        #10 
        A_sim = 8'b 11110000;
        B_sim = 8'b 11010000;
        Carry_in_sim = 0;
        #10 
        A_sim = 8'b 11000000;
        B_sim = 8'b 00101000;
        Carry_in_sim = 1;
        #10 
        A_sim = 8'b 10010111;
        B_sim = 8'b 11011000;
        Carry_in_sim = 1;
        #10 
        A_sim = 8'b 10101100;
        B_sim = 8'b 11111010;
        Carry_in_sim = 1;
        #10 
        $finish;
    end
    initial begin
        $monitor($time, "A_sim = %d, B_sim = %d, Carry_in_sim = %b, Sum_sim = %d, Carry_out_sim = %b,", A_sim, B_sim, Carry_in_sim, Sum_sim, Carry_out_sim);
    end

endmodule

