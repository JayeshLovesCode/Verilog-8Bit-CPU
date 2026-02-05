// version  1.0.0 
// last edited 2026-02-04 , 11:30 PM
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
        //Test Case for 000
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 000;
        #10

        A_sim = 11100100;
        B_sim = 10100010;
        OP_Code_sim = 000;
        #10

        A_sim = 11100100;
        B_sim = 00000000;
        OP_Code_sim = 000;
        #10

        A_sim = 00000000;
        B_sim = 11100100;
        OP_Code_sim = 000;
        #10


        //Test Case for OP_Code 001
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 001;
        #10


        //Test Case for OP_Code 011
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 011;
        #10

        //Test Case for OP_Code 100
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 100;
        #10

        //Test Case for OP_Code 101
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 101;
        #10

        //Test Case for OP_Code 110
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 110;
        #10

        //Test Case for OP_Code 111
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 111;
        #10

        $finish

    end

    initial begin
        $monitor($time, "A_sim = %b, B_sim = %b, OP_Code_sim = %b, Result_sim = %b, NZCV_sim = %b,", A_sim, B_sim, OP_Code_sim, Result_sim, NZCV_sim);
    end



endmodule