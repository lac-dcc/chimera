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
module uriscv_lsu
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter SUPPORT_TRAP_LSU_ALIGN = 1
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
     input  [31:0]  opcode_i
    ,input  [31:0]  rs1_val_i
    ,input  [31:0]  rs2_val_i

    ,output         mem_rd_o
    ,output [3:0]   mem_wr_o
    ,output [31:0]  mem_addr_o
    ,output [31:0]  mem_data_o
    ,output         mem_misaligned_o
);

//-----------------------------------------------------------------
// Includes
//-----------------------------------------------------------------
`include "uriscv_defs.v"

//-----------------------------------------------------------------
// Instruction Decode
//-----------------------------------------------------------------
wire type_load_w     = (opcode_i[6:2] == 5'b00000);
wire type_store_w    = (opcode_i[6:2] == 5'b01000);

wire [2:0] func3_w   = opcode_i[14:12]; // R, I, S

wire inst_lb_w       = type_load_w  && (func3_w == 3'b000);
wire inst_lh_w       = type_load_w  && (func3_w == 3'b001);
wire inst_lw_w       = type_load_w  && (func3_w == 3'b010);
wire inst_lbu_w      = type_load_w  && (func3_w == 3'b100);
wire inst_lhu_w      = type_load_w  && (func3_w == 3'b101);
wire inst_sb_w       = type_store_w && (func3_w == 3'b000);
wire inst_sh_w       = type_store_w && (func3_w == 3'b001);
wire inst_sw_w       = type_store_w && (func3_w == 3'b010);

//-----------------------------------------------------------------
// Decode LSU operation
//-----------------------------------------------------------------
reg [31:0]  imm12_r;
reg [31:0]  storeimm_r;

reg [31:0]  mem_addr_r;
reg [31:0]  mem_data_r;
reg [3:0]   mem_wr_r;
reg         mem_rd_r;
reg         mem_misaligned_r;

always @ *
begin
    imm12_r     = {{20{opcode_i[31]}}, opcode_i[31:20]};
    storeimm_r  = {{20{opcode_i[31]}}, opcode_i[31:25], opcode_i[11:7]};

    // Memory address
    mem_addr_r  = rs1_val_i + (type_store_w ? storeimm_r : imm12_r);

    if (SUPPORT_TRAP_LSU_ALIGN)
        mem_misaligned_r = (inst_lh_w | inst_lhu_w | inst_sh_w) ? mem_addr_r[0]:
                           (inst_lw_w | inst_sw_w)              ? (|mem_addr_r[1:0]):
                           1'b0;
    else
        mem_misaligned_r = 1'b0;

    mem_data_r = 32'h00000000;
    mem_wr_r   = 4'b0000;
    mem_rd_r   = 1'b0;

    case (1'b1)

    type_load_w:
        mem_rd_r   = 1'b1;

    inst_sb_w:
    begin
        case (mem_addr_r[1:0])
        2'h3 :
        begin
            mem_data_r      = {rs2_val_i[7:0], 24'h000000};
            mem_wr_r        = 4'b1000;
            mem_rd_r        = 1'b0;
        end
        2'h2 :
        begin
            mem_data_r      = {8'h00,rs2_val_i[7:0],16'h0000};
            mem_wr_r        = 4'b0100;
            mem_rd_r        = 1'b0;
        end
        2'h1 :
        begin
            mem_data_r      = {16'h0000,rs2_val_i[7:0],8'h00};
            mem_wr_r        = 4'b0010;
            mem_rd_r        = 1'b0;
        end
        2'h0 :
        begin
            mem_data_r      = {24'h000000,rs2_val_i[7:0]};
            mem_wr_r        = 4'b0001;
            mem_rd_r        = 1'b0;
        end
        default : ;
        endcase
    end

    inst_sh_w:
    begin
        case (mem_addr_r[1:0])
        2'h2 :
        begin
            mem_data_r      = {rs2_val_i[15:0],16'h0000};
            mem_wr_r        = 4'b1100;
            mem_rd_r        = 1'b0;
        end
        default :
        begin
            mem_data_r      = {16'h0000,rs2_val_i[15:0]};
            mem_wr_r        = 4'b0011;
            mem_rd_r        = 1'b0;
        end
        endcase
    end

    inst_sw_w:
    begin
        mem_data_r          = rs2_val_i;
        mem_wr_r            = 4'b1111;
        mem_rd_r            = 1'b0;
    end

    // Non load / store
    default:
        ;
    endcase
end

assign mem_rd_o         = mem_rd_r;
assign mem_wr_o         = mem_wr_r;
assign mem_addr_o       = mem_addr_r;
assign mem_data_o       = mem_data_r;
assign mem_misaligned_o = mem_misaligned_r;

endmodule
