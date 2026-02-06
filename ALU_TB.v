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
        //Test Case for 000 binary additon 

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 000;
        #10
        //Testing Carry_out is 1?
        A_sim = 11100100;
        B_sim = 10100010;
        OP_Code_sim = 000;
        #10
        //confirm Carr_out is zero 
        A_sim = 11100100;
        B_sim = 00000000;
        OP_Code_sim = 000;
        #10
        //confirm Carry_out is zero with addtion 
        A_sim = 00001010;
        B_sim = 11100100;
        OP_Code_sim = 000;
        #10

        //Test Case for OP_Code 001 binary subtraction 

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 001;
        #10

        //Confirm Carr_out is zero
        A_sim = 11111111;
        B_sim = 00000000;
        OP_Code_sim = 001;
        #10

        A_sim = 11010111;
        B_sim = 10111010;
        OP_Code_sim = 001;
        #10

        A_sim = 01101100;
        B_sim = 10111010;
        OP_Code_sim = 001;
        #10

        //Test Case for OP_Code 010 AND gate

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 010;
        #10
        //Base Case for all gates
        A_sim = 11111111;
        B_sim = 00000000;
        OP_Code_sim = 010;
        #10

        A_sim = 11100110;
        B_sim = 00101100;
        OP_Code_sim = 010;
        #10



        //Test Case for OP_Code 011 OR gate

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 011;
        #10
        //Base Case for all gates
        A_sim = 11111111;
        B_sim = 00000000;
        OP_Code_sim = 011;
        #10

        A_sim = 10111100;
        B_sim = 00010010;
        OP_Code_sim = 011;
        #10

        //Test Case for OP_Code 100 XOR gate

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 100;
        #10
        //Base Case for all gates
        A_sim = 11111111;
        B_sim = 00000000;
        OP_Code_sim = 100;
        #10

        A_sim = 00010100;
        B_sim = 10111010;
        OP_Code_sim = 100;
        #10


        //Test Case for OP_Code 101 Shift A left

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 101;
        #10

        //Carry_out as 1
        A_sim = 10000100;
        B_sim = 10101000;
        OP_Code_sim = 101;
        #10

        //Carry_out as 0
        A_sim = 01110101;
        B_sim = 00101000;
        OP_Code_sim = 101;
        #10


        //Test Case for OP_Code 110 shift A right

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 110;
        #10

        //Carry_out as 1
        A_sim = 01011101;
        B_sim = 00101000;
        OP_Code_sim = 110;
        #10
        //Carry_out as 0
        A_sim = 01011100;
        B_sim = 11100010;
        OP_Code_sim = 110;
        #10

        //Test Case for OP_Code 111 shift A right

        //base case for all OP_Code
        A_sim = 00000000;
        B_sim = 00000000;
        OP_Code_sim = 111;
        #10

        A_sim = 11111111;
        B_sim = 11111111;
        OP_Code_sim = 111;
        #10

        A_sim = 01010010;
        B_sim = 10101000;
        OP_Code_sim = 111;
        #10

        A_sim = 10000100;
        B_sim = 10101000;
        OP_Code_sim = 111;
        #10

        A_sim = 01000111;
        B_sim = 10101011;
        OP_Code_sim = 111;
        #10



        $finish

    end

    initial begin
        $monitor($time, "A_sim = %b, B_sim = %b, OP_Code_sim = %b, Result_sim = %b, NZCV_sim = %b,", A_sim, B_sim, OP_Code_sim, Result_sim, NZCV_sim);
    end



endmodule