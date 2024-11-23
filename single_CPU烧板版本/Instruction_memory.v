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
        memory[0] = 8'b00100100;
        memory[1] = 8'b00000001;
        memory[2] = 8'b00000000;
        memory[3] = 8'b00001000;
        memory[4] = 8'b00110100;
        memory[5] = 8'b00000010;
        memory[6] = 8'b00000000;
        memory[7] = 8'b00000010;
        memory[8] = 8'b00000000;
        memory[9] = 8'b01000001;
        memory[10] = 8'b00011000;
        memory[11] = 8'b00100000;
        memory[12] = 8'b00000000;
        memory[13] = 8'b01100010;
        memory[14] = 8'b00101000;
        memory[15] = 8'b00100010;
        memory[16] = 8'b00000000;
        memory[17] = 8'b10100010;
        memory[18] = 8'b00100000;
        memory[19] = 8'b00100100;
        memory[20] = 8'b00000000;
        memory[21] = 8'b10000010;
        memory[22] = 8'b01000000;
        memory[23] = 8'b00100101;
        memory[24] = 8'b00000000;
        memory[25] = 8'b00001000;
        memory[26] = 8'b01000000;
        memory[27] = 8'b01000000;
        memory[28] = 8'b00010101;
        memory[29] = 8'b00000001;
        memory[30] = 8'b11111111;
        memory[31] = 8'b11111110;
        memory[32] = 8'b00101000;
        memory[33] = 8'b01000110;
        memory[34] = 8'b00000000;
        memory[35] = 8'b00000100;
        memory[36] = 8'b00101000;
        memory[37] = 8'b11000111;
        memory[38] = 8'b00000000;
        memory[39] = 8'b00000000;
        memory[40] = 8'b00100100;
        memory[41] = 8'b11100111;
        memory[42] = 8'b00000000;
        memory[43] = 8'b00001000;
        memory[44] = 8'b00010000;
        memory[45] = 8'b11100001;
        memory[46] = 8'b11111111;
        memory[47] = 8'b11111110;
        memory[48] = 8'b10101100;
        memory[49] = 8'b00100010;
        memory[50] = 8'b00000000;
        memory[51] = 8'b00000100;
        memory[52] = 8'b10001100;
        memory[53] = 8'b00101001;
        memory[54] = 8'b00000000;
        memory[55] = 8'b00000100;
        memory[56] = 8'b00100100;
        memory[57] = 8'b00001010;
        memory[58] = 8'b11111111;
        memory[59] = 8'b11111110;
        memory[60] = 8'b00100101;
        memory[61] = 8'b01001010;
        memory[62] = 8'b00000000;
        memory[63] = 8'b00000001;
        memory[64] = 8'b00011001;
        memory[65] = 8'b01000000;
        memory[66] = 8'b11111111;
        memory[67] = 8'b11111110;
        memory[68] = 8'b00110000;
        memory[69] = 8'b01001011;
        memory[70] = 8'b00000000;
        memory[71] = 8'b00000010;
        memory[72] = 8'b00001000;
        memory[73] = 8'b00000000;
        memory[74] = 8'b00000000;
        memory[75] = 8'b00010011;
        memory[76] = 8'b00000000;
        memory[77] = 8'b10000010;
        memory[78] = 8'b01000000;
        memory[79] = 8'b00100101;
        memory[80] = 8'b11111100;
        memory[81] = 8'b00000000;
        memory[82] = 8'b00000000;
        memory[83] = 8'b00000000;


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
