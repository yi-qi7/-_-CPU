`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 18:20:50
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire clk,
    input wire en_write,
    input wire [31:0]address,
    input wire [31:0]data_i,
    output wire [31:0]data_o
    );

    reg [7:0]data[255:0];

    assign data_o[31:24] = data[address];
    assign data_o[23:16] = data[address + 1];
    assign data_o[15:8]  = data[address + 2];
    assign data_o[7:0]   = data[address + 3];

    always @(negedge clk)
    begin
        if(en_write)
        begin
            data[address]     = data_i[31:24];
            data[address + 1] = data_i[23:16];
            data[address + 2] = data_i[15:8];
            data[address + 3] = data_i[7:0];
        end
    end

endmodule
