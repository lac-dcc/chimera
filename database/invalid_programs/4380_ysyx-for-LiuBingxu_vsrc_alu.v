// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// a alu uesd by exu
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

`include "./define.v"
module alu(
    input                   clk,
    input                   rst_n,
    input                   flush_flag,
    input                   ready_flag,
//***********************************************************
    input                   ID_EX_reg_decode_valid,
    //control_sign:
    input                   ID_EX_reg_sub,
    input                   ID_EX_reg_word,
    //logic_sign:
    input                   ID_EX_reg_logic_valid,
    input                   ID_EX_reg_logic_or,
    input                   ID_EX_reg_logic_xor,
    input                   ID_EX_reg_logic_and,
    //branch:
    input                   ID_EX_reg_branch_ne,
    input                   ID_EX_reg_branch_eq,
    input                   ID_EX_reg_branch_lt,
    input                   ID_EX_reg_branch_ge,
    input                   ID_EX_reg_branch_signed,
    //shift:
    input                   ID_EX_reg_shift_valid,
    input                   ID_EX_reg_shift_al,
    input                   ID_EX_reg_shift_lr,
    input                   ID_EX_reg_shift_word,
    //set:
    input                   ID_EX_reg_set_valid,
    input                   ID_EX_reg_set_signed,
    //Zicsr:
    input                   ID_EX_reg_csr_valid,
    input                   ID_EX_reg_csr_set,
    input                   ID_EX_reg_csr_clear,
    input                   ID_EX_reg_csr_swap,
    //mul:
    input                   ID_EX_reg_mul_valid,
    input                   ID_EX_reg_mul_high,
    input  [1:0]            ID_EX_reg_mul_signed,
    input                   ID_EX_reg_mul_word,
    input                   ID_EX_reg_div_valid,
    input                   ID_EX_reg_div_signed,
    input                   ID_EX_reg_div_rem,
    input                   ID_EX_reg_div_word,
    //atomic:
    input                   ID_EX_reg_atomic_valid,
    //trap:
    input                   ID_EX_reg_trap_valid,
    //operand
    input  [63:0]           ID_EX_reg_operand1,
    input  [63:0]           ID_EX_reg_operand2,
//***********************************************************
    output                  o_valid,
    output                  branch_flag,
    output [63:0]           res
);

// arithmetic(add or sub)
wire [63:0] 	        Sum;
wire                	Cout;
wire                    overflow;

//logic
wire [63:0]             res_and;
wire [63:0]             res_xor;
wire [63:0]             res_or;

//cmp or branch
wire                    res_eq;
wire                    res_ne;
wire                    res_ge;
wire                    res_lt;
wire                    res_geu;
wire                    res_ltu;

//shift
wire [63:0]             shift_data;
wire [5:0]              shift_shamt;
wire [63:0]             shift_res;

//mul
wire [63:0]             mul_a;
wire [63:0]             mul_b;
wire [63:0] 	        mul_result_hi;
wire [63:0] 	        mul_result_lo;
wire                    mul_valid;
wire        	        mul_o_valid;

//div
wire [63:0]             dividend;
wire [63:0]             divisor;
wire [63:0] 	        quotient;
wire [63:0] 	        remainder;
wire                    div_valid;
wire        	        div_o_valid;

//out
wire [63:0]             logic_res;
wire [63:0]             mul_res;
wire [63:0]             div_res;
wire [63:0]             set_res;
wire [63:0]             sum_res;
wire [63:0]             csr_res;

//arithmetic(add or sub)
add_with_Cout #(64)add_sub(
    .OP_A 	    ( ID_EX_reg_operand1    ),
    .OP_B 	    ( ID_EX_reg_operand2    ),
    .Cin  	    ( ID_EX_reg_sub         ),
    .Sum  	    ( Sum                   ),
    .overflow   ( overflow              ),
    .Cout 	    ( Cout                  )
);

//logic
assign res_and = ID_EX_reg_operand1 & ID_EX_reg_operand2;
assign res_xor = ID_EX_reg_operand1 ^ ID_EX_reg_operand2;
assign res_or  = ID_EX_reg_operand1 | ID_EX_reg_operand2;

//cmp or branch
assign res_eq  = (Sum==0)?1'b1:1'b0;
assign res_ne  = (~res_eq);
assign res_ge  = ((overflow)?((~ID_EX_reg_operand1[63])&(ID_EX_reg_operand2[63])):(~Sum[63]));
assign res_lt  = ((overflow)?((ID_EX_reg_operand1[63])&(~ID_EX_reg_operand2[63])):Sum[63]);
assign res_ltu = (~Cout);
assign res_geu = Cout;

//shift
buck_shift #(64,6)u_buck_shift(
    .LR       	( ID_EX_reg_shift_lr    ),
    .AL       	( ID_EX_reg_shift_al    ),
    .shamt    	( shift_shamt           ),
    .data_in  	( shift_data            ),
    .data_out 	( shift_res             )
);
assign shift_shamt = ID_EX_reg_operand2[5:0];
assign shift_data  = (!ID_EX_reg_shift_word) ? ID_EX_reg_operand1 : 
                        ((ID_EX_reg_shift_al) ? {{32{ID_EX_reg_operand1[31]}},ID_EX_reg_operand1[31:0]} : 
                            {32'h0,ID_EX_reg_operand1[31:0]}); 

//mul
mulu u_mulu(
    .clk           	( clk                   ),
    .rst_n         	( rst_n                 ),
    .mul_flush     	( flush_flag            ),
    .mul_valid     	( mul_valid             ),
    .mul_signed    	( ID_EX_reg_mul_signed  ),
    .mul_a         	( mul_a                 ),
    .mul_b         	( mul_b                 ),
    .mul_result_hi 	( mul_result_hi         ),
    .mul_result_lo 	( mul_result_lo         ),
    .mul_o_ready   	( ready_flag            ),
    .mul_o_valid   	( mul_o_valid           )
);
assign mul_a     = ID_EX_reg_operand1;
assign mul_b     = ID_EX_reg_operand2;
assign mul_valid = ID_EX_reg_mul_valid & ID_EX_reg_decode_valid & (!ID_EX_reg_trap_valid);

//div
divu u_divu(
    .clk         	( clk                   ),
    .rst_n       	( rst_n                 ),
    .div_flush   	( flush_flag            ),
    .div_signed  	( ID_EX_reg_div_signed  ),
    .div_valid   	( div_valid             ),
    .dividend    	( dividend              ),
    .divisor     	( divisor               ),
    .quotient    	( quotient              ),
    .remainder   	( remainder             ),
    .div_o_valid 	( div_o_valid           ),
    .div_o_ready 	( ready_flag            )
);
assign dividend     = (!ID_EX_reg_div_word) ? ID_EX_reg_operand1 : (
                        (ID_EX_reg_div_signed) ? {{32{ID_EX_reg_operand1[31]}},ID_EX_reg_operand1[31:0]} : 
                            {32'h0, ID_EX_reg_operand1[31:0]});
assign divisor      = (!ID_EX_reg_div_word) ? ID_EX_reg_operand2 : (
                        (ID_EX_reg_div_signed) ? {{32{ID_EX_reg_operand2[31]}},ID_EX_reg_operand2[31:0]} : 
                            {32'h0, ID_EX_reg_operand2[31:0]});
assign div_valid    = ID_EX_reg_div_valid & ID_EX_reg_decode_valid & (!ID_EX_reg_trap_valid);

//*************************************************************************
assign logic_res = (res_and & {64{ID_EX_reg_logic_and}}) | (res_or & {64{ID_EX_reg_logic_or}}) | (res_xor & {64{ID_EX_reg_logic_xor}});
assign set_res   = (ID_EX_reg_set_signed) ? {63'h0, res_lt} : {63'h0, res_ltu};
assign mul_res   = (ID_EX_reg_mul_word) ? ({{32{mul_result_lo[31]}},mul_result_lo[31:0]}) :
                        ((ID_EX_reg_mul_high) ? mul_result_hi : mul_result_lo);
assign div_res   = (ID_EX_reg_div_word) ? ((ID_EX_reg_div_rem) ? {{32{remainder[31]}},remainder[31:0]} : {{32{quotient[31]}},quotient[31:0]}) : 
                        ((ID_EX_reg_div_rem) ? remainder : quotient);
assign sum_res   = (ID_EX_reg_word) ? {{32{Sum[31]}},Sum[31:0]} : Sum;
assign csr_res = (Sum & {64{ID_EX_reg_csr_swap}}) | (res_or & {64{ID_EX_reg_csr_set}}) | (res_and & {64{ID_EX_reg_csr_clear}});
//*************************************************************************
assign o_valid      = div_o_valid | mul_o_valid;
assign branch_flag  = (res_ne & ID_EX_reg_branch_ne) | (res_eq & ID_EX_reg_branch_eq) | 
                    (res_ge & ID_EX_reg_branch_ge & ID_EX_reg_branch_signed) | 
                    (res_lt & ID_EX_reg_branch_lt & ID_EX_reg_branch_signed) | 
                    (res_geu & ID_EX_reg_branch_ge & (!ID_EX_reg_branch_signed)) | 
                    (res_ltu & ID_EX_reg_branch_lt & (!ID_EX_reg_branch_signed));
assign res          = (ID_EX_reg_logic_valid) ? logic_res : (
                        (ID_EX_reg_set_valid) ? set_res : (
                            (ID_EX_reg_csr_valid) ? csr_res : (
                                (ID_EX_reg_div_valid) ? div_res : (
                                    (ID_EX_reg_mul_valid) ? mul_res : (
                                        (ID_EX_reg_shift_valid) ? shift_res : (
                                            (ID_EX_reg_atomic_valid) ? ID_EX_reg_operand1 : sum_res
                                        )
                                    )
                                )
                            )
                        )
                    );

//*************************************************************************

endmodule //alu

