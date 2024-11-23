`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 13:17:50
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire [3:0]ALUop,
    input wire [31:0]data_i_1,
    input wire [31:0]data_i_2,
    output reg sign,
    output reg zero,
    output reg [31:0]data_o
    );

    always@(*)
    begin
        case(ALUop)
        4'b0000:begin data_o = data_i_1 & data_i_2; end
        4'b0001:begin data_o = data_i_1 | data_i_2; end
        4'b0010:begin data_o = data_i_1 ^ data_i_2; end
        4'b0011:begin data_o = ~(data_i_1 | data_i_2); end
        4'b0100:begin data_o = data_i_1 + data_i_2; end
        4'b0101:begin data_o = data_i_1 - data_i_2; end
        4'b0110:begin data_o = (data_i_1 < data_i_2); end
        4'b0111:begin data_o = (data_i_2 << (data_i_1[4:0])); end
        4'b1000:begin data_o = (data_i_2 == data_i_1); end
        4'b1001:begin data_o = (data_i_2 != data_i_1); end
        4'b1010:begin data_o = (data_i_1 == 0 || data_i_1[31] == 1) ; end
        default: data_o = 8'b00000000;
        endcase
    end

    always@(*)
    begin
        if(data_o)
        begin
            sign = 1;
            zero = 0;
        end
        else
        begin
            sign = 0;
            zero = 1;
        end
    end


endmodule

