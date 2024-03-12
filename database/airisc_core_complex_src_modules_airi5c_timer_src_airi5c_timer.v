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
// File              : airi5c_times.v
// Author            : A. Stanitzki
// Creation Date     : 09.10.20
// Last Modified     : 15.02.21
// Version           : 1.0        
// Abstract          : Timer Module 


`include "airi5c_hasti_constants.vh"

module airi5c_timer #(parameter BASE_ADDR = 32'hC0000010)
(
  // system clk and reset
  input                              nreset,
  input                              clk,

  // timer interrupt
  output                             timer_tick,     // signals timer overflow
  // system bus 
  input [`HASTI_ADDR_WIDTH-1:0]      haddr,
  input                              hwrite,     
  input [`HASTI_SIZE_WIDTH-1:0]      hsize,
  input [`HASTI_BURST_WIDTH-1:0]     hburst,
  input                              hmastlock,
  input [`HASTI_PROT_WIDTH-1:0]      hprot,
  input [`HASTI_TRANS_WIDTH-1:0]     htrans,
  input [`HASTI_BUS_WIDTH-1:0]       hwdata,      
  output  reg [`HASTI_BUS_WIDTH-1:0] hrdata,
  output                             hready,
  output  [`HASTI_RESP_WIDTH-1:0]    hresp
);


reg [63:0]  time_r;
reg [63:0]  timecmp_r;

reg       write_req;
reg [1:0] target_reg;
// The timer peripheral can always handle read/writes in one cycle.
// So it will never issue wait cycles, hence hready is always '1'
assign hready = 1'b1; 

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    time_r <= 0;
    timecmp_r <= 0;
    target_reg <= 0;
    write_req <= 0;
  end else begin  
    if ((haddr[31:4] == BASE_ADDR[31:4]) && hwrite)
    begin
      target_reg <= haddr[3:2];
      write_req <= 1'b1;
    end else begin
      write_req <= 1'b0;
    end

    if(write_req && (target_reg == 2'b00))
      time_r <= {time_r[63:32],hwdata};
    else if(write_req && (target_reg == 2'b01))
      time_r <= {hwdata, time_r[31:0]};
    else 
      time_r <= time_r + 1;

    if(write_req && (target_reg == 2'b10)) timecmp_r[31:0] <= hwdata;
    if(write_req && (target_reg == 2'b11)) timecmp_r[63:32] <= hwdata;
  end
end

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin 
    hrdata <= 0;
  end else begin
    if((haddr[31:4] == BASE_ADDR[31:4]) && |htrans) begin
      case (haddr[3:2]) 
        2'b00 : hrdata <= time_r[31:0];
        2'b01 : hrdata <= time_r[63:32];
        2'b10 : hrdata <= timecmp_r[31:0];
        2'b11 : hrdata <= timecmp_r[63:32];
      endcase
    end
  end
end

assign  timer_tick = (time_r >= timecmp_r);
assign  hresp = `HASTI_RESP_OKAY;

endmodule
