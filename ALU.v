// version  1.0.0 
// last edited 2026-02-01 , 11:20 AM
// last edited by Jayesh

//Rough ALU Outline

module ALU( 
    input [7:0] A, B,
    input [2:0] OP_Code,
    output [7:0] Result,
    output [3:0] NZCV
);
    always@(*) begin
        if (OP_Code == 3'b000) begin
            Result = 8'b00000000; 
        end
        else if (OP_Code == 3'b001) begin
            Result = 8'b00000000;
        end
        else if (OP_Code == 3'b010) begin
            Result = 8'b00000000;
        end
        else if (OP_Code == 3'b011) begin
            Result = 8'b00000000;
        end
        else if (OP_Code == 3'b100) begin
            Result = 8'b00000000; 
        end
        else if (OP_Code == 3'b101) begin
            Result = 8'b00000000;    
        end
        else if (OP_Code == 3'b110) begin
            Result = 8'b00000000;
        end
        else if (OP_Code == 3'b111) begin
            Result = 8'b00000000;
        end
        else begin
            Result = 8'b00000000; 
        end
    end
endmodule