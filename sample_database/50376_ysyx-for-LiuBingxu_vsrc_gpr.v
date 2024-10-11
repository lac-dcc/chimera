// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the Universal Register Unit for a cpu core
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

module gpr (
    input                   clk,
//interface with idu
    input  [4 :0]           rs1,
    input  [4 :0]           rs2,
    output [63:0]           WB_ID_src1,
    output [63:0]           WB_ID_src2,
//interface with lsu 
    //gpr
    input  [4:0]            LS_WB_reg_rd,
    input                   LS_WB_reg_dest_wen,
    input  [63:0]           write_data
);

reg [63:0] riscv_reg [1:31];

always @(posedge clk) begin
    if(LS_WB_reg_dest_wen & (LS_WB_reg_rd != 5'h0))begin
        riscv_reg[LS_WB_reg_rd] <= write_data;
    end
end

assign WB_ID_src1 = (rs1 == 5'h0) ? 64'h0 : riscv_reg[rs1];
assign WB_ID_src2 = (rs2 == 5'h0) ? 64'h0 : riscv_reg[rs2];

endmodule //gpr
