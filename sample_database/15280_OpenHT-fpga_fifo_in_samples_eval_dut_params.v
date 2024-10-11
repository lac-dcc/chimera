// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

localparam WADDR_DEPTH = 32;
localparam WDATA_WIDTH = 16;
localparam RADDR_DEPTH = 32;
localparam RDATA_WIDTH = 16;
localparam FIFO_CONTROLLER = "FABRIC";
localparam FORCE_FAST_CONTROLLER = 0;
localparam IMPLEMENTATION = "LUT";
localparam WADDR_WIDTH = 5;
localparam RADDR_WIDTH = 5;
localparam REGMODE = "reg";
localparam RESETMODE = "async";
localparam ENABLE_ALMOST_FULL_FLAG = "FALSE";
localparam ALMOST_FULL_ASSERTION = "static-dual";
localparam ALMOST_FULL_ASSERT_LVL = 31;
localparam ALMOST_FULL_DEASSERT_LVL = 30;
localparam ENABLE_ALMOST_EMPTY_FLAG = "TRUE";
localparam ALMOST_EMPTY_ASSERTION = "static-single";
localparam ALMOST_EMPTY_ASSERT_LVL = 16;
localparam ALMOST_EMPTY_DEASSERT_LVL = 17;
localparam ENABLE_DATA_COUNT_WR = "FALSE";
localparam ENABLE_DATA_COUNT_RD = "FALSE";
localparam FAMILY = "LIFCL";
`define LIFCL
`define je5d00
`define LIFCL-40
