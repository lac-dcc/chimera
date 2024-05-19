// This program was cloned from: https://github.com/chipsalliance/yosys-f4pga-plugins
// License: Apache License 2.0

// Copyright 2020-2022 F4PGA Authors
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
//
// SPDX-License-Identifier: Apache-2.0

module dpram_18x1024_x2 (   
    clk_a_0,
    WEN_a_0,
    REN_a_0,
    WR_ADDR_a_0,
    RD_ADDR_a_0,
    WDATA_a_0,
    RDATA_a_0,
    
    clk_b_0,
    WEN_b_0,
    REN_b_0,
    WR_ADDR_b_0,
    RD_ADDR_b_0,
    WDATA_b_0,
    RDATA_b_0,
    
    clk_a_1,
    WEN_a_1,
    REN_a_1,
    WR_ADDR_a_1,
    RD_ADDR_a_1,
    WDATA_a_1,
    RDATA_a_1,
    
    clk_b_1,
    WEN_b_1,
    REN_b_1,
    WR_ADDR_b_1,
    RD_ADDR_b_1,
    WDATA_b_1,
    RDATA_b_1
);

parameter ADDR_WIDTH0 = 10;
parameter DATA_WIDTH0 = 18;
parameter BE1_WIDTH0 = 2;
parameter BE2_WIDTH0 = 2;

parameter ADDR_WIDTH1 = 10;
parameter DATA_WIDTH1 = 18;
parameter BE1_WIDTH1 = 2;
parameter BE2_WIDTH1 = 2;

input wire clk_a_0;
input wire WEN_a_0;
input wire REN_a_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_a_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_a_0;
input wire [DATA_WIDTH0-1 :0] WDATA_a_0;
output wire [DATA_WIDTH0-1 :0] RDATA_a_0;

input wire clk_b_0;
input wire WEN_b_0;
input wire REN_b_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_b_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_b_0;
input wire [DATA_WIDTH0-1 :0] WDATA_b_0;
output wire [DATA_WIDTH0-1 :0] RDATA_b_0;

input wire clk_a_1;
input wire WEN_a_1;
input wire REN_a_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_a_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_a_1;
input wire [DATA_WIDTH1-1 :0] WDATA_a_1;
output wire [DATA_WIDTH1-1 :0] RDATA_a_1;

input wire clk_b_1;
input wire WEN_b_1;
input wire REN_b_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_b_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_b_1;
input wire [DATA_WIDTH1-1 :0] WDATA_b_1;
output wire [DATA_WIDTH1-1 :0] RDATA_b_1;
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH0),
              .DATA_WIDTH(DATA_WIDTH0),
              .BE1_WIDTH(BE1_WIDTH0),
              .BE2_WIDTH(BE2_WIDTH0)
              ) dpram_x18_inst0 ( 
              
              .CLK1_i(clk_a_0),
              .WEN1_i(WEN_a_0),
              .REN1_i(REN_a_0),
              .WR1_ADDR_i(WR_ADDR_a_0),
              .RD1_ADDR_i(RD_ADDR_a_0),
              .WDATA1_i(WDATA_a_0),
              .RDATA1_o(RDATA_a_0),
              
              .CLK2_i(clk_b_0),
              .WEN2_i(WEN_b_0),
              .REN2_i(REN_b_0),
              .WR2_ADDR_i(WR_ADDR_b_0),
              .RD2_ADDR_i(RD_ADDR_b_0),
              .WDATA2_i(WDATA_b_0),
              .RDATA2_o(RDATA_b_0)
              );
              
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH1),
              .DATA_WIDTH(DATA_WIDTH1),
              .BE1_WIDTH(BE1_WIDTH1),
              .BE2_WIDTH(BE2_WIDTH1)
              ) dpram_x18_inst1 ( 
              
              .CLK1_i(clk_a_1),
              .WEN1_i(WEN_a_1),
              .REN1_i(REN_a_1),
              .WR1_ADDR_i(WR_ADDR_a_1),
              .RD1_ADDR_i(RD_ADDR_a_1),
              .WDATA1_i(WDATA_a_1),
              .RDATA1_o(RDATA_a_1),
              
              .CLK2_i(clk_b_1),
              .WEN2_i(WEN_b_1),
              .REN2_i(REN_b_1),
              .WR2_ADDR_i(WR_ADDR_b_1),
              .RD2_ADDR_i(RD_ADDR_b_1),
              .WDATA2_i(WDATA_b_1),
              .RDATA2_o(RDATA_b_1)
              );
              
endmodule    

module dpram_9x2048_x2 (   
    clk_a_0,
    WEN_a_0,
    REN_a_0,
    WR_ADDR_a_0,
    RD_ADDR_a_0,
    WDATA_a_0,
    RDATA_a_0,
    
    clk_b_0,
    WEN_b_0,
    REN_b_0,
    WR_ADDR_b_0,
    RD_ADDR_b_0,
    WDATA_b_0,
    RDATA_b_0,
    
    clk_a_1,
    WEN_a_1,
    REN_a_1,
    WR_ADDR_a_1,
    RD_ADDR_a_1,
    WDATA_a_1,
    RDATA_a_1,
    
    clk_b_1,
    WEN_b_1,
    REN_b_1,
    WR_ADDR_b_1,
    RD_ADDR_b_1,
    WDATA_b_1,
    RDATA_b_1
);

parameter ADDR_WIDTH0 = 11;
parameter DATA_WIDTH0 = 9;
parameter BE1_WIDTH0 = 1;
parameter BE2_WIDTH0 = 1;

parameter ADDR_WIDTH1 = 11;
parameter DATA_WIDTH1 = 9;
parameter BE1_WIDTH1 = 1;
parameter BE2_WIDTH1 = 1;

input wire clk_a_0;
input wire WEN_a_0;
input wire REN_a_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_a_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_a_0;
input wire [DATA_WIDTH0-1 :0] WDATA_a_0;
output wire [DATA_WIDTH0-1 :0] RDATA_a_0;

input wire clk_b_0;
input wire WEN_b_0;
input wire REN_b_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_b_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_b_0;
input wire [DATA_WIDTH0-1 :0] WDATA_b_0;
output wire [DATA_WIDTH0-1 :0] RDATA_b_0;

input wire clk_a_1;
input wire WEN_a_1;
input wire REN_a_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_a_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_a_1;
input wire [DATA_WIDTH1-1 :0] WDATA_a_1;
output wire [DATA_WIDTH1-1 :0] RDATA_a_1;

input wire clk_b_1;
input wire WEN_b_1;
input wire REN_b_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_b_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_b_1;
input wire [DATA_WIDTH1-1 :0] WDATA_b_1;
output wire [DATA_WIDTH1-1 :0] RDATA_b_1;
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH0),
              .DATA_WIDTH(DATA_WIDTH0),
              .BE1_WIDTH(BE1_WIDTH0),
              .BE2_WIDTH(BE2_WIDTH0)
              ) dpram_x18_inst0 ( 
              
              .CLK1_i(clk_a_0),
              .WEN1_i(WEN_a_0),
              .REN1_i(REN_a_0),
              .WR1_ADDR_i(WR_ADDR_a_0),
              .RD1_ADDR_i(RD_ADDR_a_0),
              .WDATA1_i(WDATA_a_0),
              .RDATA1_o(RDATA_a_0),
              
              .CLK2_i(clk_b_0),
              .WEN2_i(WEN_b_0),
              .REN2_i(REN_b_0),
              .WR2_ADDR_i(WR_ADDR_b_0),
              .RD2_ADDR_i(RD_ADDR_b_0),
              .WDATA2_i(WDATA_b_0),
              .RDATA2_o(RDATA_b_0)
              );
              
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH1),
              .DATA_WIDTH(DATA_WIDTH1),
              .BE1_WIDTH(BE1_WIDTH1),
              .BE2_WIDTH(BE2_WIDTH1)
              ) dpram_x18_inst1 ( 
              
              .CLK1_i(clk_a_1),
              .WEN1_i(WEN_a_1),
              .REN1_i(REN_a_1),
              .WR1_ADDR_i(WR_ADDR_a_1),
              .RD1_ADDR_i(RD_ADDR_a_1),
              .WDATA1_i(WDATA_a_1),
              .RDATA1_o(RDATA_a_1),
              
              .CLK2_i(clk_b_1),
              .WEN2_i(WEN_b_1),
              .REN2_i(REN_b_1),
              .WR2_ADDR_i(WR_ADDR_b_1),
              .RD2_ADDR_i(RD_ADDR_b_1),
              .WDATA2_i(WDATA_b_1),
              .RDATA2_o(RDATA_b_1)
              );
              
endmodule    

module dpram_18x1024_9x2048 (   
    clk_a_0,
    WEN_a_0,
    REN_a_0,
    WR_ADDR_a_0,
    RD_ADDR_a_0,
    WDATA_a_0,
    RDATA_a_0,
    
    clk_b_0,
    WEN_b_0,
    REN_b_0,
    WR_ADDR_b_0,
    RD_ADDR_b_0,
    WDATA_b_0,
    RDATA_b_0,
    
    clk_a_1,
    WEN_a_1,
    REN_a_1,
    WR_ADDR_a_1,
    RD_ADDR_a_1,
    WDATA_a_1,
    RDATA_a_1,
    
    clk_b_1,
    WEN_b_1,
    REN_b_1,
    WR_ADDR_b_1,
    RD_ADDR_b_1,
    WDATA_b_1,
    RDATA_b_1
);

parameter ADDR_WIDTH0 = 10;
parameter DATA_WIDTH0 = 18;
parameter BE1_WIDTH0 = 2;
parameter BE2_WIDTH0 = 2;

parameter ADDR_WIDTH1 = 11;
parameter DATA_WIDTH1 = 9;
parameter BE1_WIDTH1 = 1;
parameter BE2_WIDTH1 = 1;

input wire clk_a_0;
input wire WEN_a_0;
input wire REN_a_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_a_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_a_0;
input wire [DATA_WIDTH0-1 :0] WDATA_a_0;
output wire [DATA_WIDTH0-1 :0] RDATA_a_0;

input wire clk_b_0;
input wire WEN_b_0;
input wire REN_b_0;
input wire [ADDR_WIDTH0-1 :0] WR_ADDR_b_0;
input wire [ADDR_WIDTH0-1 :0] RD_ADDR_b_0;
input wire [DATA_WIDTH0-1 :0] WDATA_b_0;
output wire [DATA_WIDTH0-1 :0] RDATA_b_0;

input wire clk_a_1;
input wire WEN_a_1;
input wire REN_a_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_a_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_a_1;
input wire [DATA_WIDTH1-1 :0] WDATA_a_1;
output wire [DATA_WIDTH1-1 :0] RDATA_a_1;

input wire clk_b_1;
input wire WEN_b_1;
input wire REN_b_1;
input wire [ADDR_WIDTH1-1 :0] WR_ADDR_b_1;
input wire [ADDR_WIDTH1-1 :0] RD_ADDR_b_1;
input wire [DATA_WIDTH1-1 :0] WDATA_b_1;
output wire [DATA_WIDTH1-1 :0] RDATA_b_1;
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH0),
              .DATA_WIDTH(DATA_WIDTH0),
              .BE1_WIDTH(BE1_WIDTH0),
              .BE2_WIDTH(BE2_WIDTH0)
              ) dpram_x18_inst0 ( 
              
              .CLK1_i(clk_a_0),
              .WEN1_i(WEN_a_0),
              .REN1_i(REN_a_0),
              .WR1_ADDR_i(WR_ADDR_a_0),
              .RD1_ADDR_i(RD_ADDR_a_0),
              .WDATA1_i(WDATA_a_0),
              .RDATA1_o(RDATA_a_0),
              
              .CLK2_i(clk_b_0),
              .WEN2_i(WEN_b_0),
              .REN2_i(REN_b_0),
              .WR2_ADDR_i(WR_ADDR_b_0),
              .RD2_ADDR_i(RD_ADDR_b_0),
              .WDATA2_i(WDATA_b_0),
              .RDATA2_o(RDATA_b_0)
              );
              
 
DPRAM_18K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH1),
              .DATA_WIDTH(DATA_WIDTH1),
              .BE1_WIDTH(BE1_WIDTH1),
              .BE2_WIDTH(BE2_WIDTH1)
              ) dpram_x18_inst1 ( 
              
              .CLK1_i(clk_a_1),
              .WEN1_i(WEN_a_1),
              .REN1_i(REN_a_1),
              .WR1_ADDR_i(WR_ADDR_a_1),
              .RD1_ADDR_i(RD_ADDR_a_1),
              .WDATA1_i(WDATA_a_1),
              .RDATA1_o(RDATA_a_1),
              
              .CLK2_i(clk_b_1),
              .WEN2_i(WEN_b_1),
              .REN2_i(REN_b_1),
              .WR2_ADDR_i(WR_ADDR_b_1),
              .RD2_ADDR_i(RD_ADDR_b_1),
              .WDATA2_i(WDATA_b_1),
              .RDATA2_o(RDATA_b_1)
              );
              
endmodule    