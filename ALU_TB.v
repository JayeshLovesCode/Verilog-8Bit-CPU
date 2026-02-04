// version  1.0.0 
// last edited 2026-02-02 , 9:01 PM
// last edited by Venoth

//Rough ALU Test Bench 
// last edited by Venoth 
`timescale 1ns / 1ps
module ALU_TB;
    reg [7:0] A_sim, B_sim;
    reg [2:0] OP_Code_sim;
    wire [7:0] Result_sim;
    wire [3:0] NZCV_sim;
    ALU dut(.A(A_sim), .B(B_sim), .OP_Code(OP_Code_sim), .Result(Result_sim), .NZCV(NZCV_sim));

    initial begin
        $dumpfile("ALU_TB.vcd");
        $dumpvars(0, ALU_TB);
    end

    // Stimulus for generator 
    initial begin
        //Test Case for 
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 000;
    end

    initial begin
        $monitor($time, "A_sim = %b, B_sim = %b, OP_Code_sim = %b, Result_sim = %b, NZCV_sim = %b,", A_sim, B_sim, OP_Code_sim, Result_sim, NZCV_sim);
    end



endmodule