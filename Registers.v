// version 
// last edited 2026-02-08 , 2:19 AM
// last edited by Jayesh

module Registers(
    input [7:0] Data_in,
    input [1:0] Write_address,
    input Write_enable,
    input [1:0] Read_address_A,
    input [1:0] Read_address_B,
    input clk,
    output reg [7:0] Out_A,
    output reg [7:0] Out_B
);
    reg [7:0] register_file [0:3];

    always @(posedge clk) begin
        if (Write_enable) begin
            register_file[Write_address] <= Data_in;
        end
    end
endmodule