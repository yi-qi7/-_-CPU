`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 13:17:50
// Design Name: 
// Module Name: Register
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

module Register(
    input wire clk,
    input wire en_write,
    input wire [4:0]address_o_1,
    input wire [4:0]address_o_2,
    input wire [4:0]address_i,
    input wire [31:0]data_i,
    output wire [31:0]data_o_1,
    output wire [31:0]data_o_2
    );

    reg [31:0]data[31:0];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1) 
            data[i] <= 0;
    end

    always@(negedge clk)
    begin
        if(en_write)
        begin
            data[address_i] <= data_i;
        end
    end

    assign data_o_1 = data[address_o_1];
    assign data_o_2 = data[address_o_2];


endmodule
