// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the alu used by load and store unit
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

module lsu_alu (
    input   [63:0]          atomic_read_memory_data,
    input   [63:0]          atomic_read_gpr_data,
    input                   EX_LS_reg_atomic_swap,
    input                   EX_LS_reg_atomic_add,
    input                   EX_LS_reg_atomic_xor,
    input                   EX_LS_reg_atomic_and,
    input                   EX_LS_reg_atomic_or,
    input                   EX_LS_reg_atomic_min,
    input                   EX_LS_reg_atomic_max,
    input                   EX_LS_reg_atomic_signed,
    output  [63:0]          atomic_wirte_memory_data
);

wire        sub;
wire        overflow;
wire        Cout;
wire [63:0] res_add;
wire [63:0] res_xor;
wire [63:0] res_and;
wire [63:0] res_or;
wire        res_lt;
wire        res_ltu;

add_with_Cout #(64)u_atomic_add_sub(
    .OP_A 	    ( atomic_read_memory_data   ),
    .OP_B 	    ( atomic_read_gpr_data      ),
    .Cin  	    ( sub                       ),
    .Sum  	    ( res_add                   ),
    .overflow   ( overflow                  ),
    .Cout 	    ( Cout                      )
);
assign sub      = EX_LS_reg_atomic_min | EX_LS_reg_atomic_max;

assign res_xor  = atomic_read_memory_data ^ atomic_read_gpr_data;
assign res_and  = atomic_read_memory_data & atomic_read_gpr_data;
assign res_or   = atomic_read_memory_data | atomic_read_gpr_data;

assign res_lt  = ((overflow)?((atomic_read_memory_data[63])&(~atomic_read_gpr_data[63])):res_add[63]);
assign res_ltu = (~Cout);

assign atomic_wirte_memory_data =   (atomic_read_gpr_data & {64{EX_LS_reg_atomic_swap}}) | 
                                    (res_add & {64{EX_LS_reg_atomic_add}}) | 
                                    (res_xor & {64{EX_LS_reg_atomic_xor}}) | 
                                    (res_and & {64{EX_LS_reg_atomic_and}}) | 
                                    (res_or  & {64{EX_LS_reg_atomic_or}})  | 
                                    (atomic_read_memory_data    & {64{EX_LS_reg_atomic_min & EX_LS_reg_atomic_signed    & res_lt}})     | 
                                    (atomic_read_gpr_data       & {64{EX_LS_reg_atomic_min & EX_LS_reg_atomic_signed    & (!res_lt)}})  | 
                                    (atomic_read_gpr_data       & {64{EX_LS_reg_atomic_max & EX_LS_reg_atomic_signed    & res_lt}})     | 
                                    (atomic_read_memory_data    & {64{EX_LS_reg_atomic_max & EX_LS_reg_atomic_signed    & (!res_lt)}})  | 
                                    (atomic_read_memory_data    & {64{EX_LS_reg_atomic_min & (!EX_LS_reg_atomic_signed) & res_ltu}})    | 
                                    (atomic_read_gpr_data       & {64{EX_LS_reg_atomic_min & (!EX_LS_reg_atomic_signed) & (!res_ltu)}}) | 
                                    (atomic_read_gpr_data       & {64{EX_LS_reg_atomic_max & (!EX_LS_reg_atomic_signed) & res_ltu}})    |
                                    (atomic_read_memory_data    & {64{EX_LS_reg_atomic_max & (!EX_LS_reg_atomic_signed) & (!res_ltu)}}) ;

endmodule //lsu_alu
