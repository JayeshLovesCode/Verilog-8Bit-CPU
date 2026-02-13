// version  1.0.0 
// last edited 2026-02-04 , 10:22 PM
// last edited by Jayesh

//Word = 32 bit.
//we need 2 types of memory the main memory and the registers.
//Processor contains ALU, Resiters, FSM, IR, PC.
//the registers are used to say which values to operate on and the last word in register is for the address in the main memory for PC.
//the main memory stores the instruction and sends it to IR nad it then goes to FSM

//The negative numbers are stored in 2's complement form.
//Carry flag is generated when the output is correct but there was a carry out of the MSB.
//Overflow flag is generated when the output is incorrect.
//For Example when we add 2 positive numbers and get a negative number or when we add 2 negative numbers and get a positive number.
//
//Opr = 0000 for NOP
//Opr = 0001 for ADD
//Opr = 0010 for SUB
//Opr = 0011 for RY
//Opr = 0100 for AND
//Opr = 0101 for OR
//Opr = 0110 for XOR
//Opr = 0111 for NOT

module ALU( 
    input [7:0] A, B,
    input [2:0] OP_Code,
    output reg [7:0] Result,
    output reg [3:0] NZCV
);
    wire [7:0]adder_sum;
    wire adder_carry;
    Adder adder_inst(.A(A), .B(B), .Carry_in(1'b0), .Sum(adder_sum), .Carry_out(adder_carry));

    wire [7:0]subtractor_diff;
    wire subtractor_borrow;
    Adder subtractor_inst(.A(A), .B(~B), .Carry_in(1'b1), .Sum(subtractor_diff), .Carry_out(subtractor_borrow));

    wire [7:0]left_shifted_out;
    wire carry_left_shift;
    Shifter_to_left shifter_left_inst(.in_bit(A), .out_bit(left_shifted_out), .carry_out(carry_left_shift));

    wire [7:0]right_shifted_out;
    wire carry_right_shift;
    Shifter_to_right shifter_right_inst(.in_bit(A), .out_bit(right_shifted_out), .carry_out(carry_right_shift));

    always@(*) begin
        if (OP_Code == 3'b000) begin
            Result = adder_sum;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = adder_carry;
            if ((adder_sum[7] != A[7]) && (A[7] == B[7])) begin
                NZCV[3] = 1'b1;
            end
            else begin
                NZCV[3] = 1'b0;
            end
        end
        else if (OP_Code == 3'b001) begin
            Result = subtractor_diff;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = subtractor_borrow;
            if ((subtractor_diff[7] != A[7]) && (A[7] != B[7])) begin
                NZCV[3] = 1'b1;
            end
            else begin
                NZCV[3] = 1'b0;
            end
        end
        else if (OP_Code == 3'b010) begin
            Result = A & B;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = 1'b0;
            NZCV[3] = 1'b0;
        end
        else if (OP_Code == 3'b011) begin
            Result = A | B;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = 1'b0;
            NZCV[3] = 1'b0;
        end
        else if (OP_Code == 3'b100) begin
            Result = A ^ B;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = 1'b0;
            NZCV[3] = 1'b0;
        end
        else if (OP_Code == 3'b101) begin
            Result = left_shifted_out;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = carry_left_shift;
            NZCV[3] = 1'b0;
        end
        else if (OP_Code == 3'b110) begin
            Result = right_shifted_out;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = carry_right_shift;
            NZCV[3] = 1'b0;
        end
        else if (OP_Code == 3'b111) begin
            Result = A;
            NZCV[0] = Result[7];
            NZCV[1] = (Result == 8'b00000000) ? 1'b1 : 1'b0;
            NZCV[2] = 1'b0;
            NZCV[3] = 1'b0;
        end
    end
endmodule