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

    reg CLK;
    reg [1:0]SW;
    reg Reset;
    reg Button;

    always #1 CLK = ~CLK;
    always #10000000 Button = ~Button;

    initial begin
        CLK = 0;
        SW = 2'b00;
        Reset = 0;
        Button = 0;
        #1
        Reset = 1;
    end

    wire [3:0]AN;
    wire [7:0]Out;

top u_top(
    .CLK    ( CLK    ),
    .SW     ( SW     ),
    .Reset  ( Reset  ),
    .Button ( Button ),
    .AN     ( AN     ),
    .Out    ( Out    )
);



endmodule
