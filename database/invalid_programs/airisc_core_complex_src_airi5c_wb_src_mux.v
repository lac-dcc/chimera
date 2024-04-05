//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File             : airi5c_wb_src_mux.v
// Author           : A. Stanitzki
// Creation Date    : 09.08.22
// Last Modified    : 09.08.22
// Version          : 1.0
// Abstract         : Sets the source for the WB
//
`timescale 1ns/100ps

`include "airi5c_ctrl_constants.vh"
`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"

module airi5c_wb_src_mux(
  input  [`WB_SRC_SEL_WIDTH-1:0] wb_src_sel_i,

  input  [`XPR_LEN-1:0]        csr_rdata_wb_i,
  input  [`XPR_LEN-1:0]        pcpi_rd_wb_i,
  input  [`XPR_LEN-1:0]        rs1_data_wb_i,
  input  [`XPR_LEN-1:0]        alu_out_wb_i,
`ifdef ISA_EXT_F
  input  [`XPR_LEN-1:0]        fpu_out_wb_i,
`endif

  input  [`XPR_LEN-1:0]        dmem_rdata_i,
  input  [`MEM_TYPE_WIDTH-1:0] dmem_type_wb_i,
  input  [`XPR_LEN-1:0]        store_data_wb_i,

  output [`XPR_LEN-1:0]        bypass_data_wb_o,
  output reg [`XPR_LEN-1:0]        wb_data_wb_o,
  output [`XPR_LEN-1:0]        dmem_hwdata_o
);

// load_data()
// differentiate between byte/halfword/word wide reads from memory, unsigned or signed

function [`XPR_LEN-1:0] load_data;
  input [`XPR_LEN-1:0]        addr;
  input [`XPR_LEN-1:0]        data;
  input [`MEM_TYPE_WIDTH-1:0] mem_type;
  reg   [`XPR_LEN-1:0]        shifted_data;
  reg   [`XPR_LEN-1:0]        b_extend;
  reg   [`XPR_LEN-1:0]        h_extend;
  begin    
    shifted_data = (data >> 8*(addr[1:0]));
    b_extend = {{24{shifted_data[7]}},8'b0};
    h_extend = {{16{shifted_data[15]}},16'b0};
    case (mem_type)
      `MEM_TYPE_LB  : load_data = (shifted_data & `XPR_LEN'hff) | b_extend;
      `MEM_TYPE_LH  : load_data = (shifted_data & `XPR_LEN'hffff) | h_extend;
      `MEM_TYPE_LBU : load_data = (shifted_data & `XPR_LEN'hff);
      `MEM_TYPE_LHU : load_data = (shifted_data & `XPR_LEN'hffff);
       default : load_data = shifted_data;
    endcase
  end
endfunction


// store_data()
// differentiate between byte/halfword/word wide writes to memory

function [`XPR_LEN-1:0] store_data;
  input [`XPR_LEN-1:0]        addr;
  input [`XPR_LEN-1:0]        data;
  input [`MEM_TYPE_WIDTH-1:0] mem_type;
  begin
     case (mem_type)
       `MEM_TYPE_SB : store_data = {4{data[7:0]}};
       `MEM_TYPE_SH : store_data = {2{data[15:0]}};
       default : store_data = data;
     endcase
  end
endfunction


reg [`XPR_LEN-1:0] bypass_data_r;
assign bypass_data_wb_o = bypass_data_r;

wire [`XPR_LEN-1:0] expanded_load_data;
assign expanded_load_data = load_data(alu_out_wb_i,dmem_rdata_i,dmem_type_wb_i);

assign dmem_hwdata_o = store_data(alu_out_wb_i,store_data_wb_i,dmem_type_wb_i);

always @(*) begin
  case (wb_src_sel_i)
    `WB_SRC_CSR   : bypass_data_r = csr_rdata_wb_i;
    `WB_SRC_PCPI  : bypass_data_r = pcpi_rd_wb_i;
`ifdef ISA_EXT_F
    `WB_SRC_FPU   : bypass_data_r = fpu_out_wb_i;
`endif
    `WB_SRC_REG   : bypass_data_r = rs1_data_wb_i;
    default       : bypass_data_r = alu_out_wb_i;
  endcase 
end

always @(*) begin
  case (wb_src_sel_i)
    `WB_SRC_ALU   : wb_data_wb_o = bypass_data_r;
    `WB_SRC_MEM   : wb_data_wb_o = expanded_load_data;
    `WB_SRC_CSR   : wb_data_wb_o = bypass_data_r;
    `WB_SRC_PCPI  : wb_data_wb_o = bypass_data_r;
`ifdef ISA_EXT_F
    `WB_SRC_FPU   : wb_data_wb_o = bypass_data_r;
`endif
    `WB_SRC_REG   : wb_data_wb_o = bypass_data_r;
    default       : wb_data_wb_o = bypass_data_r;
  endcase
end

endmodule
