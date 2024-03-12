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

module dpram_36x1024 (
    clock0,
    WEN1_i,
    REN1_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    clock1,
    WEN2_i,
    REN2_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 36;
parameter BE1_WIDTH = 4;
parameter BE2_WIDTH = 4;

input wire clock0;
input wire WEN1_i;
input wire REN1_i;
input wire [ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA1_i;
output wire [DATA_WIDTH-1 :0] RDATA1_o;

input wire clock1;
input wire WEN2_i;
input wire REN2_i;
input wire [ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA2_i;
output wire [DATA_WIDTH-1 :0] RDATA2_o;

DPRAM_36K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH),
              .DATA_WIDTH(DATA_WIDTH),
              .BE1_WIDTH(BE1_WIDTH),
              .BE2_WIDTH(BE2_WIDTH)
              ) dpram_x36_inst (             
              .CLK1_i(clock0),
              .WEN1_i(WEN1_i),
              .WR1_BE_i(4'b1111),
              .REN1_i(REN1_i),
              .WR1_ADDR_i(WR1_ADDR_i),
              .RD1_ADDR_i(RD1_ADDR_i),
              .WDATA1_i(WDATA1_i),
              .RDATA1_o(RDATA1_o),
              
              .CLK2_i(clock1),
              .WEN2_i(WEN2_i),
              .WR2_BE_i(4'b1111),
              .REN2_i(REN2_i),
              .WR2_ADDR_i(WR2_ADDR_i),
              .RD2_ADDR_i(RD2_ADDR_i),
              .WDATA2_i(WDATA2_i),
              .RDATA2_o(RDATA2_o)
              );

endmodule

module dpram_18x2048 (
    clock0,
    WEN1_i,
    REN1_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    clock1,
    WEN2_i,
    REN2_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter ADDR_WIDTH = 11;
parameter DATA_WIDTH = 18;
parameter BE1_WIDTH = 2;
parameter BE2_WIDTH = 2;

input wire clock0;
input wire WEN1_i;
input wire REN1_i;
input wire [ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA1_i;
output wire [DATA_WIDTH-1 :0] RDATA1_o;

input wire clock1;
input wire WEN2_i;
input wire REN2_i;
input wire [ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA2_i;
output wire [DATA_WIDTH-1 :0] RDATA2_o;

DPRAM_36K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH),
              .DATA_WIDTH(DATA_WIDTH),
              .BE1_WIDTH(BE1_WIDTH),
              .BE2_WIDTH(BE2_WIDTH)
              ) dpram_x36_inst (             
              .CLK1_i(clock0),
              .WEN1_i(WEN1_i),
              .WR1_BE_i(2'b11),
              .REN1_i(REN1_i),
              .WR1_ADDR_i(WR1_ADDR_i),
              .RD1_ADDR_i(RD1_ADDR_i),
              .WDATA1_i(WDATA1_i),
              .RDATA1_o(RDATA1_o),
              
              .CLK2_i(clock1),
              .WEN2_i(WEN2_i),
              .WR2_BE_i(2'b11),
              .REN2_i(REN2_i),
              .WR2_ADDR_i(WR2_ADDR_i),
              .RD2_ADDR_i(RD2_ADDR_i),
              .WDATA2_i(WDATA2_i),
              .RDATA2_o(RDATA2_o)
              );

endmodule

module dpram_9x4096 (
    clock0,
    WEN1_i,
    REN1_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    clock1,
    WEN2_i,
    REN2_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter ADDR_WIDTH = 12;
parameter DATA_WIDTH = 9;
parameter BE1_WIDTH = 1;
parameter BE2_WIDTH = 1;

input wire clock0;
input wire WEN1_i;
input wire REN1_i;
input wire [ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA1_i;
output wire [DATA_WIDTH-1 :0] RDATA1_o;

input wire clock1;
input wire WEN2_i;
input wire REN2_i;
input wire [ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA2_i;
output wire [DATA_WIDTH-1 :0] RDATA2_o;

DPRAM_36K_BLK #(
              .ADDR_WIDTH(ADDR_WIDTH),
              .DATA_WIDTH(DATA_WIDTH),
              .BE1_WIDTH(BE1_WIDTH),
              .BE2_WIDTH(BE2_WIDTH)
              ) dpram_x36_inst (             
              .CLK1_i(clock0),
              .WEN1_i(WEN1_i),
              .WR1_BE_i(1'b1),
              .REN1_i(REN1_i),
              .WR1_ADDR_i(WR1_ADDR_i),
              .RD1_ADDR_i(RD1_ADDR_i),
              .WDATA1_i(WDATA1_i),
              .RDATA1_o(RDATA1_o),
              
              .CLK2_i(clock1),
              .WEN2_i(WEN2_i),
              .WR2_BE_i(1'b1),
              .REN2_i(REN2_i),
              .WR2_ADDR_i(WR2_ADDR_i),
              .RD2_ADDR_i(RD2_ADDR_i),
              .WDATA2_i(WDATA2_i),
              .RDATA2_o(RDATA2_o)
              );

endmodule
