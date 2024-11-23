`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 18:12:10
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk,
    input wire rst,
    input wire [31:0]data_i,
    output reg [31:0]pc
    );

    initial begin
        pc = 0;
    end

    always @(posedge clk)
    begin
        if(rst)
        begin
            pc <= pc;
        end 
        else
        begin
            pc <= data_i;
        end
    end
endmodule
