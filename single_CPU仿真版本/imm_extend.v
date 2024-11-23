`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 16:44:39
// Design Name: 
// Module Name: imm_extend
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


module imm_extend(
    input wire [15:0] data_i,
    input wire ExtSel,
    output wire [31:0] data_o
    );

    assign data_o[15:0] = data_i;
    assign data_o[31:16] = ExtSel ? {16{data_i[15]}} : 16'b0;



endmodule
