`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/22 17:23:01
// Design Name: 
// Module Name: SegLED
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


module SegLED(
	input[3:0] Store,
	input Reset,
	output reg[7:0] Out
);
	always@(Store or Reset)
    begin
		if(Reset == 0)
        begin
		    Out= 8'b11111110;
		end
		else 
        begin
			case(Store)
				4'b0000: Out=	8'b00000011;	//0
				4'b0001: Out=	8'b10011111;	//1
				4'b0010: Out=	8'b00100101;	//2
				4'b0011: Out=	8'b00001101;	//3
				4'b0100: Out=	8'b10011001;	//4
				4'b0101: Out=	8'b01001001;	//5
				4'b0110: Out=	8'b01000001;	//6
				4'b0111: Out=	8'b00011111;	//7
				4'b1000: Out=	8'b00000001;	//8
				4'b1001: Out=	8'b00001001;	//9
				4'b1010: Out=	8'b00010001;	//A
				4'b1011: Out=	8'b11000001;	//b
				4'b1100: Out=	8'b01100011;	//C
				4'b1101: Out=	8'b10000101;	//d
				4'b1110: Out=	8'b01100001;	//E
				4'b1111: Out=	8'b01110001;	//F
				default: Out=	8'b00000000;	//all light
			endcase
		end
	end
endmodule
