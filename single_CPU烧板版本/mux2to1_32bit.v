`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 16:35:47
// Design Name: 
// Module Name: mux2to1_32bit
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


module mux2to1_32bit(
    input wire sel,
    input wire [31:0]data_i_1,
    input wire [31:0]data_i_2,
    output reg [31:0]data_o
    );

    always@ (*)
    begin
        case(sel)
            1'b0: data_o = data_i_1;
            1'b1: data_o = data_i_2;
            default: data_o = 32'h00000000;
        endcase
    end



endmodule
