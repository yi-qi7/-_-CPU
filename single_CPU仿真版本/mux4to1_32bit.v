`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 16:37:00
// Design Name: 
// Module Name: mux4to1_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux4to1_32bit(
    input wire [1:0]sel,
    input wire [31:0]data_i_1,
    input wire [31:0]data_i_2,
    input wire [31:0]data_i_3,
    input wire [31:0]data_i_4,
    output reg [31:0]data_o
    );

    always@ (*)
    begin
        case(sel)
            2'b00: data_o = data_i_1;
            2'b01: data_o = data_i_2;
            2'b10: data_o = data_i_3;
            2'b11: data_o = data_i_4;
            default: data_o = 32'h00000000;
        endcase
    end



endmodule
