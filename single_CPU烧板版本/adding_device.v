`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 18:18:33
// Design Name: 
// Module Name: adding_device
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


module adding_device(
    input wire [31:0]data_i_1,
    input wire [31:0]data_i_2,
    output wire [31:0]data_o
    );

    assign data_o = data_i_1 + data_i_2;
endmodule
