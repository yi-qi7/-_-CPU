`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 17:00:24
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
    input wire [31:0]pc,
    output wire [5:0]op,
    output wire [4:0]rs,
    output wire [4:0]rt,
    output wire [4:0]rd,
    output wire [4:0]sa,
    output wire [5:0]funct,
    output wire [15:0]imm,
    output wire [31:0]jump_pc
    );

    reg [7:0]memory[255:0];

    initial begin
        #5;
        $readmemb("Instruction.txt", memory);
    end

    reg [31:0]instruction;
    always @(pc) 
    begin
        instruction[31:24] = memory[pc];
        instruction[23:16] = memory[pc + 1];
        instruction[15:8]  = memory[pc + 2];
        instruction[7:0]   = memory[pc + 3];
    end

    assign op = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign sa = instruction[10:6];
    assign funct = instruction[5:0];
    assign imm = instruction[15:0];
    assign jump_pc = {{pc[31:28]}, {instruction[25:0]}, {2'b00}};






endmodule
