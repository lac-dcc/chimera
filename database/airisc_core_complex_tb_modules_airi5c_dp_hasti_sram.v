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
// File              : airi5c_dp_hasti_sram.v
// Author            : 
// Date              : 
// Version           : 1.0         
// Abstract          : 
// History           :
// Notes             :
//
`timescale 1ns/100ps


`include "airi5c_hasti_constants.vh"

module airi5c_dp_hasti_sram(
  input                          hclk,
  input                          hresetn,
  input [`HASTI_ADDR_WIDTH-1:0]  p0_haddr,
  input                          p0_hwrite,
  input [`HASTI_SIZE_WIDTH-1:0]  p0_hsize,
  input [`HASTI_BURST_WIDTH-1:0] p0_hburst,
  input                          p0_hmastlock,
  input [`HASTI_PROT_WIDTH-1:0]  p0_hprot,
  input [`HASTI_TRANS_WIDTH-1:0] p0_htrans,
  input [`HASTI_BUS_WIDTH-1:0]   p0_hwdata,
  output [`HASTI_BUS_WIDTH-1:0]  p0_hrdata,
  output                         p0_hready,
  output                         p0_hresp,
  input [`HASTI_ADDR_WIDTH-1:0]  p1_haddr,
  input                          p1_hwrite,
  input [`HASTI_SIZE_WIDTH-1:0]  p1_hsize,
  input [`HASTI_BURST_WIDTH-1:0] p1_hburst,
  input                          p1_hmastlock,
  input [`HASTI_PROT_WIDTH-1:0]  p1_hprot,
  input [`HASTI_TRANS_WIDTH-1:0] p1_htrans,
  input [`HASTI_BUS_WIDTH-1:0]   p1_hwdata,
  output [`HASTI_BUS_WIDTH-1:0]  p1_hrdata,
  output                         p1_hready,
  output                         p1_hresp
);

parameter nwords = 65536;
reg [`HASTI_BUS_WIDTH-1:0]                              mem [nwords-1:0];

// p0
// flops
reg [`HASTI_ADDR_WIDTH-1:0]                             p0_addr_r;
wire [`HASTI_ADDR_WIDTH-1:0]                            p0_word_addr = p0_addr_r >> 2;
reg [`HASTI_SIZE_WIDTH-1:0]                             p0_size_r;
reg [1:0]                                               p0_state;
reg [1:0]                                               p0_next_state;
reg [`HASTI_BUS_WIDTH-1:0]                              p0_rdata;
wire [`HASTI_BUS_NBYTES-1:0]                            p0_wmask_lut = (p0_size_r == 0) ? `HASTI_BUS_NBYTES'h1 : (p0_size_r == 1) ? `HASTI_BUS_NBYTES'h3 : `HASTI_BUS_NBYTES'hf;
wire [`HASTI_BUS_NBYTES-1:0]                            p0_wmask_shift = p0_wmask_lut << p0_addr_r[1:0];
wire [`HASTI_BUS_WIDTH-1:0]                             p0_wmask = {{8{p0_wmask_shift[3]}},{8{p0_wmask_shift[2]}},{8{p0_wmask_shift[1]}},{8{p0_wmask_shift[0]}}};


assign p0_hrdata = p0_rdata;
assign p0_hready = 1'b1;
assign p0_hresp = `HASTI_RESP_OKAY;


always @(posedge hclk) begin
  if(!hresetn) begin
    p0_state <= 2'b00;
    p0_addr_r <= `HASTI_ADDR_WIDTH'h0;
    p0_size_r <= `HASTI_SIZE_WIDTH'h2;
  end else begin
    p0_state <= p0_next_state;
    p0_addr_r <= p0_haddr;            // read addr every cycle (but maybe don't use it.)
    p0_size_r <= p0_hsize;
    if(p0_state == 2'b10) begin
      mem[p0_word_addr] <= (mem[p0_word_addr] & ~p0_wmask) | (p0_hwdata & p0_wmask);//  p0_hwdata;    // write on next clock if in WRITE state.
      //$write("wrote: %h to %h",(p0_hwdata & p0_wmask), p0_word_addr);            
    end        
  end
end

always @* begin
  p0_next_state = 2'b00;        // default: goto IDLE.
  p0_rdata = `HASTI_BUS_WIDTH'h0;    // when read is inactive, output 0.

  case(p0_state)
  2'b00    :    begin                                    // IDLE - ADDR CYCLE
        p0_next_state = (p0_htrans != `HASTI_TRANS_NONSEQ) ? 2'b00 :
            p0_hwrite ? 2'b10 : 2'b01;            
      end
  2'b01    :    begin                                    // READ - DATA CYLCE
        p0_next_state = (p0_htrans != `HASTI_TRANS_NONSEQ) ? 2'b00 :    // if last Read/Write, go back to IDLE.
            p0_hwrite ? 2'b10 : 2'b01;

//        p0_rdata = mem[p0_word_addr] >> ( 8* p0_addr_r[1:0]);            // read data from sampled addr.
        p0_rdata = mem[p0_word_addr];            // read data from sampled addr.
      end
  2'b10    :    begin                                    // WRITE - DATA CYCLE
        p0_next_state = (p0_htrans != `HASTI_TRANS_NONSEQ) ? 2'b00 :    // if last Read/Write, go back to IDLE.
            p0_hwrite ? 2'b10 : 2'b01;
//        p0_rdata = mem[p0_word_addr] >> ( 8* p0_addr_r[1:0]);        
        p0_rdata = mem[p0_word_addr];        

      end
  2'b11    :    begin
      end
  default :     begin end
  endcase
end


// p1

wire                         p1_ren = (p1_htrans == `HASTI_TRANS_NONSEQ && !p1_hwrite);
reg                          p1_bypass;
reg [`HASTI_ADDR_WIDTH-1:0]  p1_reg_raddr;
reg [`HASTI_SIZE_WIDTH-1:0]  p1_size_r;

always @(posedge hclk) begin
  p1_reg_raddr <= p1_haddr;
  if (!hresetn) begin
   p1_bypass <= 0;
   p1_size_r <= 0;
  end else begin
   p1_size_r <= p1_hsize;
   if (p1_htrans == `HASTI_TRANS_NONSEQ) begin
    if (p1_hwrite) begin
      $write("error: write access to imem port");
    end else begin
       p1_bypass <= (p0_state == 2'b10) && (p0_word_addr == (p1_haddr >> 2));
    end
   end // if (p1_htrans == `HASTI_TRANS_NONSEQ)
  end
end


reg [`HASTI_BUS_WIDTH-1:0] p1_rdata;

always @(*) begin
  p1_rdata = 32'hdeadbeef;
  if(p1_reg_raddr[1]) begin
    case(p1_size_r) 
      2 : p1_rdata = {mem[(p1_reg_raddr >> 2) + 1][15:0], mem[p1_reg_raddr >> 2][31:16]};
      1 : p1_rdata = {16'h0,mem[p1_reg_raddr >> 2][31:16]};
      0 : p1_rdata = {24'h0,mem[p1_reg_raddr >> 2][23:16]};
    endcase
  end else begin
    case(p1_size_r) 
      2 : p1_rdata = mem[p1_reg_raddr >> 2];
      1 : p1_rdata = {16'h0,mem[p1_reg_raddr >> 2][15:0]};
      0 : p1_rdata = 32'hdeadbeef;
    endcase
  end
end

wire [`HASTI_BUS_WIDTH-1:0] p1_rmask = {32{p1_bypass}};// & p0_wmask;
assign p1_hrdata = (p0_hwdata & p1_rmask) | (p1_rdata & ~p1_rmask);
assign p1_hready = 1'b1;
assign p1_hresp = `HASTI_RESP_OKAY;
integer i = 0;


`ifndef VERILATOR
initial begin
  $write("clearing RAM...");
  for(i = 0; i < (nwords-1); i = i + 1) begin
    mem[i] = 0;
  end
  $write("done.\n");
end
`endif

endmodule
