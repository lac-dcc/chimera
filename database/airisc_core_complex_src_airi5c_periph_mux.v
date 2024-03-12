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
// File              : airi5c_periph_mux.v
// Author            : A. Stanitzki
// Creation Date     : 24.01.22
// Version           : 1.0
// Abstract          : DMEM Read MUX for internal peripherals          
//

`timescale 1ns / 1ps

module airi5c_periph_mux #
  (
    // number of slave ports
    parameter S_COUNT = 7,
    // Hier könnte auch eine 8 stimmen, aber vermutlich stimmen die Bitbreiten und Adressen nicht mehr (AUt/IHo)
    // base addresses of slave ports
    parameter S_BASE_ADDR  = {32'h80000000,32'hC0000100,32'hC0000200,32'hC0000300,32'hC0000400,32'hC0000500,32'hC0000600,32'hC0000700},        
    // widht of slave port addresses    
    parameter S_ADDR_WIDTH = {32'd28,32'd8,32'd8,32'd8,32'd8,32'd8,32'd8,32'd8}
  )
  ( 
  input                           clk_i,
  input                           rst_ni,
  
  // input address used to select slave
  input      [`HASTI_BUS_WIDTH-1:0]  m_haddr,
  output reg                         m_hready,
  output reg [`HASTI_RESP_WIDTH-1:0] m_hresp,
  output reg [`HASTI_BUS_WIDTH-1:0]  m_hrdata, 
    
  input  [S_COUNT-1:0]                    s_hready,
  input  [S_COUNT*`HASTI_RESP_WIDTH-1:0]  s_hresp,
  input  [S_COUNT*`HASTI_BUS_WIDTH-1:0]   s_hrdata
  );

  localparam CL_S_COUNT = $clog2(S_COUNT);
    
  // hold register to store addr during data phase.
  reg  [`HASTI_ADDR_WIDTH-1:0]  data_phase_addr;
  reg     match, match2;
  integer i,j;

  always @(posedge clk_i or negedge rst_ni) begin
    if(~rst_ni) begin
      data_phase_addr <= 0;
    end else begin
      data_phase_addr <= m_haddr;
    end
  end
  
  // Adress phase mux forwards the 
  // appropriate hready and hresp signals
  // to the master during the addr phase.
  reg [CL_S_COUNT-1:0] select, select2;

  always @* begin : address_phase_mux
    match = 1'b0;   
    select = 0;
    for (i = 0; i < S_COUNT; i = i + 1) begin
      if((S_BASE_ADDR[i*32 +: 32] >> S_ADDR_WIDTH[i*32 +: 32]) == (m_haddr >> S_ADDR_WIDTH[i*32 +: 32])) begin
        select = i;
        match = 1'b1;
      end
    end
    if(match) begin
      m_hready = s_hready[select];
      m_hresp  = s_hresp[select*`HASTI_RESP_WIDTH +: `HASTI_RESP_WIDTH];
    end else begin
      m_hready = &s_hready; //1'b1;
      m_hresp = `HASTI_RESP_ERROR; 
    end
  end

  always @* begin : data_phase_mux
    match2 = 1'b0;
    select2 = 0;   
    for (j = 0; j < S_COUNT; j = j + 1) begin
      if((S_BASE_ADDR[j*32 +: 32] >> S_ADDR_WIDTH[j*32 +: 32]) == (data_phase_addr >> S_ADDR_WIDTH[j*32 +: 32])) begin              
        select2 = j;
        match2 = 1'b1;
      end
    end
    if(match2) m_hrdata[31:0] = s_hrdata[select2*32 +: 32];
    else m_hrdata[31:0] = 32'hdeadbeef;          
  end
  
endmodule
