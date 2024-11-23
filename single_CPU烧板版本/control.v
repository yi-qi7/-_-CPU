`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 18:42:20
// Design Name: 
// Module Name: control
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


module control(
    input wire [5:0]op,
    input wire [5:0]funct,
    input wire zero,
    input wire sign,
    output reg [3:0]ALUop,
    output reg Regwrite,
    output reg ALUsrcA,
    output reg ALUsrcB,
    output reg RegDst,
    output reg ExtSel,
    output reg [1:0]pcsrc,
    output reg datasrc,
    output reg mWR,
    output reg rst
    );

    initial begin
        pcsrc = 0;
    end

    always @(*) 
    begin
        case (op)
        6'b000000:begin
            case (funct)
            6'b000000:begin 
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 1;
                ALUsrcB = 0;
                ALUop = 4'b0111;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            6'b100000:begin 
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 0;
                ALUsrcB = 0;
                ALUop = 4'b0100;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            6'b100010:begin 
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 0;
                ALUsrcB = 0;
                ALUop = 4'b0101;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            6'b100100:begin 
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 0;
                ALUsrcB = 0;
                ALUop = 4'b0000;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            6'b100101:begin 
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 0;
                ALUsrcB = 0;
                ALUop = 4'b0001;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            default: begin
                pcsrc = 0;
                RegDst = 1;
                ExtSel = 0;
                ALUsrcA = 0;
                ALUsrcB = 0;
                ALUop = 4'b0001;
                mWR = 0;
                datasrc = 0;
                Regwrite = 1;
                rst = 0;
            end
            endcase
        end
        6'b001001:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0100;
            mWR = 0;
            datasrc = 0;
            Regwrite = 1;
            rst = 0;
        end
        6'b001100:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 0;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0000;
            mWR = 0;
            datasrc = 0;
            Regwrite = 1;
            rst = 0;
        end
        6'b001101:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 0;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0001;
            mWR = 0;
            datasrc = 0;
            Regwrite = 1;
            rst = 0;
        end
        6'b001010:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0110;
            mWR = 0;
            datasrc = 0;
            Regwrite = 1;
            rst = 0;
        end
        6'b101011:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0100;
            mWR = 1;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        6'b100011:begin 
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 1;
            ALUop = 4'b0100;
            mWR = 0;
            datasrc = 1;
            Regwrite = 1;
            rst = 0;
        end
        6'b000100:begin
            pcsrc = zero ? 0 : 1;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1000;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        6'b000101:begin
            pcsrc = zero ? 0 : 1;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1001;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        6'b000110:begin
            pcsrc = sign ? 1 : 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1010;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        6'b000010:begin
            pcsrc = 2;
            RegDst = 0;
            ExtSel = 0;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1000;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        6'b111111:begin
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1000;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 1;
        end
        default: begin
            pcsrc = 0;
            RegDst = 0;
            ExtSel = 1;
            ALUsrcA = 0;
            ALUsrcB = 0;
            ALUop = 4'b1000;
            mWR = 0;
            datasrc = 0;
            Regwrite = 0;
            rst = 0;
        end
        endcase
    end






endmodule
