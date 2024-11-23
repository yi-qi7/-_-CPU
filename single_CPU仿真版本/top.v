`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/16 13:16:50
// Design Name: 
// Module Name: top
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


module top(
    input wire clk
    );

    wire rst;
    wire [31:0]new_pc;
    wire [31:0]pc;
    wire [5:0]op;
    wire [4:0]rs;
    wire [4:0]rt;
    wire [4:0]rd;
    wire [4:0]sa;
    wire [5:0]funct;
    wire [15:0]imm;
    wire [31:0]jump_pc;
    wire [31:0] imm_ext;

    wire [3:0]ALUop;
    wire Regwrite;
    wire ALUsrcA;
    wire ALUsrcB;
    wire RegDst;
    wire ExtSel;
    wire [1:0]pcsrc;
    wire datasrc;
    wire mWR;

    wire [4:0]rt_or_rs;
    wire [31:0]data_o_1;
    wire [31:0]data_o_2;
    wire [31:0]data_o_A;
    wire [31:0]data_o_B;
    wire sign;
    wire zero;
    wire [31:0]data_o;
    wire [31:0]data_memory_out;
    wire [31:0]data_i;
    wire [31:0]pc_add_4;
    wire [31:0]pc_add_imm;

PC u_PC(
    .clk    ( clk    ),
    .rst    ( rst    ),
    .data_i ( new_pc ),
    .pc     ( pc     )
);

Instruction_memory u_Instruction_memory(
    .pc      ( pc      ),
    .op      ( op      ),
    .rs      ( rs      ),
    .rt      ( rt      ),
    .rd      ( rd      ),
    .sa      ( sa      ),
    .funct   ( funct   ),
    .imm     ( imm     ),
    .jump_pc ( jump_pc )
);

imm_extend u_imm_extend(
    .data_i ( imm ),
    .ExtSel ( ExtSel ),
    .data_o  ( imm_ext  )
);

control u_control(
    .op       ( op       ),
    .funct    ( funct    ),
    .zero     ( zero     ),
    .sign     ( sign     ),
    .ALUop    ( ALUop    ),
    .Regwrite ( Regwrite ),
    .ALUsrcA  ( ALUsrcA  ),
    .ALUsrcB  ( ALUsrcB  ),
    .RegDst   ( RegDst   ),
    .ExtSel   ( ExtSel   ),
    .pcsrc    ( pcsrc    ),
    .datasrc  ( datasrc  ),
    .mWR      ( mWR      ),
    .rst      ( rst      )
);

mux2to1_5bit u_mux2to1_5bit(
    .sel      ( RegDst      ),
    .data_i_1 ( rt ),
    .data_i_2 ( rd ),
    .data_o   ( rt_or_rs   )
);

Register u_Register(
    .clk         ( clk         ),
    .en_write    ( Regwrite    ),
    .address_o_1 ( rs ),
    .address_o_2 ( rt ),
    .address_i   ( rt_or_rs  ),
    .data_i      ( data_i      ),
    .data_o_1    ( data_o_1    ),
    .data_o_2    ( data_o_2    )
);

mux2to1_32bit u_mux2to1_32bit_A(
    .sel      ( ALUsrcA      ),
    .data_i_1 ( data_o_1 ),
    .data_i_2 ( {{27'b0}, {sa}} ),
    .data_o   ( data_o_A   )
);

mux2to1_32bit u_mux2to1_32bit_B(
    .sel      ( ALUsrcB      ),
    .data_i_1 ( data_o_2 ),
    .data_i_2 ( imm_ext ),
    .data_o   ( data_o_B   )
);

ALU u_ALU(
    .ALUop    ( ALUop    ),
    .data_i_1 ( data_o_A ),
    .data_i_2 ( data_o_B ),
    .sign     ( sign     ),
    .zero     ( zero     ),
    .data_o   ( data_o   )
);

data_memory u_data_memory(
    .clk      ( clk      ),
    .en_write ( mWR ),
    .address  ( data_o << 2  ),
    .data_i   ( data_o_2   ),
    .data_o   ( data_memory_out   )
);

mux2to1_32bit u_mux2to1_32bit_data_memory(
    .sel      ( datasrc      ),
    .data_i_1 ( data_o ),
    .data_i_2 ( data_memory_out ),
    .data_o   ( data_i   )
);

adding_device u_adding_device_4(
    .data_i_1 ( 4 ),
    .data_i_2 ( pc ),
    .data_o   ( pc_add_4   )
);

adding_device u_adding_device_imm(
    .data_i_1 ( pc_add_4 ),
    .data_i_2 ( imm_ext << 2 ),
    .data_o   ( pc_add_imm   )
);

mux4to1_32bit u_mux4to1_32bit(
    .sel      ( pcsrc      ),
    .data_i_1 ( pc_add_4 ),
    .data_i_2 ( pc_add_imm ),
    .data_i_3 ( jump_pc ),
    .data_i_4 ( 32'b0 ),
    .data_o   ( new_pc   )
);


endmodule
