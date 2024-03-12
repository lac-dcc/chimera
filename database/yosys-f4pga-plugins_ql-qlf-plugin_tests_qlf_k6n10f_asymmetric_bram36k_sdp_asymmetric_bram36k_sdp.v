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

module spram_9x4096_36x1024 (
    WEN_i,
    REN_i,
    clock0,
    clock1,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 12;
parameter RD_ADDR_WIDTH = 10;
parameter WR_DATA_WIDTH = 9;
parameter RD_DATA_WIDTH = 36;
parameter BE_WIDTH = 1;

input wire WEN_i;
input wire REN_i;
input wire clock0;
input wire clock1;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

RAM_36K_BLK #(
              .WR_ADDR_WIDTH(WR_ADDR_WIDTH),
              .RD_ADDR_WIDTH(RD_ADDR_WIDTH),
              .WR_DATA_WIDTH(WR_DATA_WIDTH),
              .RD_DATA_WIDTH(RD_DATA_WIDTH),
              .BE_WIDTH(BE_WIDTH)
              ) spram_x36_inst (
              
              .WEN_i(WEN_i),
              .WR_BE_i(1'b1),
              .REN_i(REN_i),              
              .WR_CLK_i(clock0),
              .RD_CLK_i(clock1),
              .WR_ADDR_i(WR_ADDR_i),
              .RD_ADDR_i(RD_ADDR_i),
              .WDATA_i(WDATA_i),
              .RDATA_o(RDATA_o)
              );
              
endmodule    

module spram_18x2048_36x1024 (
    WEN_i,
    REN_i,
    clock0,
    clock1,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 11;
parameter RD_ADDR_WIDTH = 10;
parameter WR_DATA_WIDTH = 18;
parameter RD_DATA_WIDTH = 36;
parameter BE_WIDTH = 2;

input wire WEN_i;
input wire REN_i;
input wire clock0;
input wire clock1;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

RAM_36K_BLK #(
              .WR_ADDR_WIDTH(WR_ADDR_WIDTH),
              .RD_ADDR_WIDTH(RD_ADDR_WIDTH),
              .WR_DATA_WIDTH(WR_DATA_WIDTH),
              .RD_DATA_WIDTH(RD_DATA_WIDTH),
              .BE_WIDTH(BE_WIDTH)
              ) spram_x36_inst (
              
              .WEN_i(WEN_i),
              .WR_BE_i(2'b11),
              .REN_i(REN_i),              
              .WR_CLK_i(clock0),
              .RD_CLK_i(clock1),
              .WR_ADDR_i(WR_ADDR_i),
              .RD_ADDR_i(RD_ADDR_i),
              .WDATA_i(WDATA_i),
              .RDATA_o(RDATA_o)
              );
              
endmodule   

module spram_18x2048_9x4096 (
    WEN_i,
    REN_i,
    clock0,
    clock1,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 11;
parameter RD_ADDR_WIDTH = 12;
parameter WR_DATA_WIDTH = 18;
parameter RD_DATA_WIDTH = 9;
parameter BE_WIDTH = 2;

input wire WEN_i;
input wire REN_i;
input wire clock0;
input wire clock1;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

RAM_36K_BLK #(
              .WR_ADDR_WIDTH(WR_ADDR_WIDTH),
              .RD_ADDR_WIDTH(RD_ADDR_WIDTH),
              .WR_DATA_WIDTH(WR_DATA_WIDTH),
              .RD_DATA_WIDTH(RD_DATA_WIDTH),
              .BE_WIDTH(BE_WIDTH)
              ) spram_x36_inst (
              
              .WEN_i(WEN_i),
              .WR_BE_i(2'b11),
              .REN_i(REN_i),              
              .WR_CLK_i(clock0),
              .RD_CLK_i(clock1),
              .WR_ADDR_i(WR_ADDR_i),
              .RD_ADDR_i(RD_ADDR_i),
              .WDATA_i(WDATA_i),
              .RDATA_o(RDATA_o)
              );
              
endmodule    

module spram_36x1024_18x2048 (
    WEN_i,
    REN_i,
    clock0,
    clock1,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 10;
parameter RD_ADDR_WIDTH = 11;
parameter WR_DATA_WIDTH = 36;
parameter RD_DATA_WIDTH = 18;
parameter BE_WIDTH = 4;

input wire WEN_i;
input wire REN_i;
input wire clock0;
input wire clock1;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

RAM_36K_BLK #(
              .WR_ADDR_WIDTH(WR_ADDR_WIDTH),
              .RD_ADDR_WIDTH(RD_ADDR_WIDTH),
              .WR_DATA_WIDTH(WR_DATA_WIDTH),
              .RD_DATA_WIDTH(RD_DATA_WIDTH),
              .BE_WIDTH(BE_WIDTH)
              ) spram_x36_inst (
              
              .WEN_i(WEN_i),
              .WR_BE_i(4'b1111),
              .REN_i(REN_i),              
              .WR_CLK_i(clock0),
              .RD_CLK_i(clock1),
              .WR_ADDR_i(WR_ADDR_i),
              .RD_ADDR_i(RD_ADDR_i),
              .WDATA_i(WDATA_i),
              .RDATA_o(RDATA_o)
              );
              
endmodule     