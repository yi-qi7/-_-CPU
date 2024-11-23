`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/16 15:32:35
// Design Name: 
// Module Name: tb_single_CPU
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


module tb_single_CPU();

    reg clk;

    always #5 clk = ~clk;

    initial begin
        clk = 0;
    end



top u_top(
    .clk  ( clk  )
);


endmodule
