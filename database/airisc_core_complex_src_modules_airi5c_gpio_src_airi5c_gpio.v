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
// File              : airi5c_gpio.v 
// Author            : A. Stanitzki
// Creation Date     : 09.10.20
// Last Modified     : 15.02.21
// Version           : 1.0    
// Abstract          : Implementation for GPIO-Ports
//
`include "airi5c_hasti_constants.vh"
module airi5c_gpio
  #(parameter BASE_ADDR = 32'hC0000008, parameter WIDTH = 8)    
(
  // system clk and reset
  input     nreset,
  input     clk,

  // gpio in/outputs
  output  reg [WIDTH-1:0]            gpio_d,
  output  reg [WIDTH-1:0]            gpio_en,
  input   [WIDTH-1:0]                gpio_i,

  // system bus 
  input [`HASTI_ADDR_WIDTH-1:0]      haddr,
  input                              hwrite,     // unused, as imem is read-only (typically)
  input [`HASTI_SIZE_WIDTH-1:0]      hsize,
  input [`HASTI_BURST_WIDTH-1:0]     hburst,
  input                              hmastlock,
  input [`HASTI_PROT_WIDTH-1:0]      hprot,
  input [`HASTI_TRANS_WIDTH-1:0]     htrans,
  input [`HASTI_BUS_WIDTH-1:0]       hwdata,      // unused, as imem is read-only (typically)
  output  reg [`HASTI_BUS_WIDTH-1:0] hrdata,
  output                             hready,
  output    [`HASTI_RESP_WIDTH-1:0]  hresp
);

reg [`HASTI_ADDR_WIDTH-1:0] haddr_r;
reg                         hwrite_r;

always @(posedge clk or negedge nreset) begin
  if(~nreset)
    haddr_r <= 0;
  else 
    haddr_r <= haddr;   
end

always @(posedge clk or negedge nreset) begin
  if(~nreset)
    hwrite_r <= 0;
  else 
    hwrite_r <= hwrite;
end

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    hrdata   <= 0;
    gpio_d   <= 0;
    gpio_en  <= 0; 
  end else begin
    if(hwrite_r) begin
      case(haddr_r) 
        (BASE_ADDR)   : gpio_d <= hwdata[WIDTH-1:0];
        (BASE_ADDR+4) : gpio_en <= hwdata[WIDTH-1:0];              
        default       : ;
      endcase 
    end

    if(|htrans) begin
      case(haddr)
        (BASE_ADDR) : begin hrdata <= gpio_i; end
        (BASE_ADDR+4) : begin hrdata <= gpio_en; end
        default: ;
      endcase
    end
  end
end

// the core complex peripherals will always 
// handle read/writes in one cycle, so they will 
// never issue wait cycles. Hence hready is always 1'b1
assign hready = 1'b1;
assign hresp = 0;

endmodule
