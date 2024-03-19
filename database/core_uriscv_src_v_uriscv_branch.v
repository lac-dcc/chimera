//-----------------------------------------------------------------
//                          uRISC-V CPU
//                            V0.5.0
//               github.com/ultraembedded/core_uriscv
//                     Copyright 2015-2021
//
//                   admin@ultra-embedded.com
//
//                     License: Apache 2.0
//-----------------------------------------------------------------
// Copyright 2015-2021 github.com/ultraembedded
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------
module uriscv_branch
(
     input  [31:0]  pc_i
    ,input  [31:0]  opcode_i
    ,input  [31:0]  rs1_val_i
    ,input  [31:0]  rs2_val_i
    ,output         branch_o
    ,output [31:0]  branch_target_o
);

//-----------------------------------------------------------------
// Includes
//-----------------------------------------------------------------
`include "uriscv_defs.v"

//-----------------------------------------------------------------
// less_than_signed: Less than operator (signed)
// Inputs: x = left operand, y = right operand
// Return: (int)x < (int)y
//-----------------------------------------------------------------
function [0:0] less_than_signed;
    input  [31:0] x;
    input  [31:0] y;
    reg [31:0] v;
begin
    v = (x - y);
    if (x[31] != y[31])
        less_than_signed = x[31];
    else
        less_than_signed = v[31];
end
endfunction

//-----------------------------------------------------------------
// greater_than_signed: Greater than operator (signed)
// Inputs: x = left operand, y = right operand
// Return: (int)x > (int)y
//-----------------------------------------------------------------
function [0:0] greater_than_signed;
    input  [31:0] x;
    input  [31:0] y;
    reg [31:0] v;
begin
    v = (y - x);
    if (x[31] != y[31])
        greater_than_signed = y[31];
    else
        greater_than_signed = v[31];
end
endfunction

//-----------------------------------------------------------------
// Branch Decode
//-----------------------------------------------------------------
wire type_branch_w  = (opcode_i[6:2] == 5'b11000);
wire type_jalr_w    = (opcode_i[6:2] == 5'b11001);
wire type_jal_w     = (opcode_i[6:2] == 5'b11011);

wire [2:0] func3_w  = opcode_i[14:12]; // R, I, S
wire [6:0] func7_w  = opcode_i[31:25]; // R

wire branch_beq_w   = (func3_w == 3'b000);
wire branch_bne_w   = (func3_w == 3'b001);
wire branch_blt_w   = (func3_w == 3'b100);
wire branch_bge_w   = (func3_w == 3'b101);
wire branch_bltu_w  = (func3_w == 3'b110);
wire branch_bgeu_w  = (func3_w == 3'b111);

reg         branch_r;
reg [31:0]  branch_target_r;
reg [31:0]  imm12_r;
reg [31:0]  bimm_r;
reg [31:0]  jimm20_r;

always @ *
begin
    branch_r        = 1'b0;
    branch_target_r = 32'b0;

    // Opcode decode
    imm12_r         = {{20{opcode_i[31]}}, opcode_i[31:20]};
    bimm_r          = {{19{opcode_i[31]}}, opcode_i[31],    opcode_i[7],  opcode_i[30:25], opcode_i[11:8],  1'b0};
    jimm20_r        = {{12{opcode_i[31]}}, opcode_i[19:12], opcode_i[20], opcode_i[30:25], opcode_i[24:21], 1'b0};

    // Default branch target is relative to current PC
    branch_target_r = (pc_i + bimm_r);    

    if (type_jal_w)
    begin
        branch_r        = 1'b1;
        branch_target_r = pc_i + jimm20_r;
    end
    else if (type_jalr_w)
    begin
        branch_r            = 1'b1;
        branch_target_r     = rs1_val_i + imm12_r;
        branch_target_r[0]  = 1'b0;
    end
    else if (type_branch_w)
    begin
        case (1'b1)
        branch_beq_w: // beq
            branch_r      = (rs1_val_i == rs2_val_i);

        branch_bne_w: // bne
            branch_r      = (rs1_val_i != rs2_val_i);

        branch_blt_w: // blt
            branch_r      = less_than_signed(rs1_val_i, rs2_val_i);

        branch_bge_w: // bge
            branch_r      = greater_than_signed(rs1_val_i, rs2_val_i) | (rs1_val_i == rs2_val_i);

        branch_bltu_w: // bltu
            branch_r      = (rs1_val_i < rs2_val_i);

        branch_bgeu_w: // bgeu
            branch_r      = (rs1_val_i >= rs2_val_i);

        default:
            ;
        endcase
    end
end

assign branch_o        = branch_r;
assign branch_target_o = branch_target_r;

endmodule
