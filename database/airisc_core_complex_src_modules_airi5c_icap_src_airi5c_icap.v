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
`include "airi5c_hasti_constants.vh"
module airi5c_icap
  #(
  parameter BASE_ADDR   = 32'hC0000060, 
  parameter CLK_FREQ_HZ = 32000000)
  (
  // system clk and reset
  input                              n_reset,  // active high async reset
  input                              clk,      // clock

  output                             lock,

  // AHB-Lite interface
  input   [`HASTI_ADDR_WIDTH-1:0]    haddr,    
  input                              hwrite,   
  input   [`HASTI_SIZE_WIDTH-1:0]    hsize,
  input   [`HASTI_BURST_WIDTH-1:0]   hburst,
  input                              hmastlock,
  input   [`HASTI_PROT_WIDTH-1:0]    hprot,
  input   [`HASTI_TRANS_WIDTH-1:0]   htrans,
  input   [`HASTI_BUS_WIDTH-1:0]     hwdata,
  output  reg [`HASTI_BUS_WIDTH-1:0] hrdata,
  output                             hready,
  output    [`HASTI_RESP_WIDTH-1:0]  hresp
);
// messy / experimental, switch ICAP for ASIC compatible stub if 
// we are not in an FPGA environment.
`define ASIC 1
`ifdef ASIC

assign hready = 1'b1;
assign hresp  = `HASTI_RESP_OKAY;
assign lock = 0; 
always @(posedge clk, negedge n_reset) begin
  if(~n_reset) begin
    hrdata <= 32'hdeadbeef;
  end else begin
    hrdata <= 32'hcafebabe;
  end
end

// nothing else. just a stub doing no harm.

`else 

assign hready = 1'b1;


`define ICAP_CTRL BASE_ADDR
`define ICAP_DIN  BASE_ADDR + 4
`define ICAP_DOUT BASE_ADDR + 8

reg [`HASTI_ADDR_WIDTH-1:0] haddr_r;
reg                         hwrite_r;
reg [`XPR_LEN-1:0]          icap_ctrl_r;

reg  [`XPR_LEN-1:0]  icap_din_r;
wire [`XPR_LEN-1:0]  icap_dout;

assign               lock = icap_ctrl_r[0];

wire                 icap_datawrite = (hwrite_r && (haddr_r == `ICAP_DIN));
wire                 icap_enb = ~(icap_datawrite & icap_ctrl_r[0]);


wire [31:0]          icap_din_bitswapped = 
{hwdata[24],hwdata[25],hwdata[26],hwdata[27],
 hwdata[28],hwdata[29],hwdata[30],hwdata[31],
 
 hwdata[16],hwdata[17],hwdata[18],hwdata[19],
 hwdata[20],hwdata[21],hwdata[22],hwdata[23],
 
 hwdata[8] ,hwdata[9] ,hwdata[10],hwdata[11],
 hwdata[12],hwdata[13],hwdata[14],hwdata[15],
 
 hwdata[0] ,hwdata[1] ,hwdata[2] ,hwdata[3],
 hwdata[4] ,hwdata[5] ,hwdata[6] ,hwdata[7]};

ICAPE2 #(.ICAP_WIDTH("X32"))
icape2_inst (
  .I(icap_din_bitswapped),
  .O(icap_dout),
  .CLK(clk),
  .CSIB(icap_enb),
  .RDWRB(1'b0)
);

always @(posedge clk or negedge n_reset) begin
  if(~n_reset) begin
    haddr_r <= `HASTI_ADDR_WIDTH'h0;
    hwrite_r <= 1'b0;
  end else begin 
    if (hwrite & (|htrans) & ((haddr & 32'hfffffff0) == BASE_ADDR)) haddr_r <= haddr;
    hwrite_r <= hwrite & (|htrans) & ((haddr & 32'hfffffff0) == BASE_ADDR);
  end
end

wire icap_rdwrb = icap_ctrl_r[1]; 

always @(posedge clk or negedge n_reset) begin
  if(~n_reset) begin
    hrdata      <= `HASTI_BUS_WIDTH'h0;
    icap_ctrl_r <= 32'hFFFFFFF0;    
  end else begin
    if(hwrite_r) begin
      if(haddr_r == `ICAP_CTRL) icap_ctrl_r <= hwdata;      
      if(haddr_r == `ICAP_DIN) icap_din_r <= hwdata;
    end
    if(|htrans) begin
      case(haddr)
        `ICAP_CTRL : begin hrdata <= icap_ctrl_r; end
        `ICAP_DOUT : begin hrdata <= icap_dout; end
        `ICAP_DIN :  begin hrdata <= icap_din_r; end
        default: ;
      endcase
    end
  end
end


assign hresp = `HASTI_RESP_OKAY;

`endif // messy ASIC 
endmodule
