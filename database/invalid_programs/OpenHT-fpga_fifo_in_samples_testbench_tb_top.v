// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
//   Copyright (c) 2018 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED
// --------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS
// Project               :
// File                  : tb_top.v
// Title                 : Testbench for fifo_dc.
// Dependencies          : 1.
//                       : 2.
// Description           :
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0.1
// Author(s)             :
// Mod. Date             : 03/05/2018
// Changes Made          : Initial version of testbench for fifo dc
// =============================================================================
`timescale 1 ns / 1 ns

`include "clk_rst_gen.v"
`include "mem_model.v"
`include "flag_checker.v"
`include "fifo_master.v"

`ifndef TB_TOP
`define TB_TOP

//==========================================================================
// Module : tb_top
//==========================================================================

`timescale 1 ns / 1 ns

module tb_top();

`include "dut_params.v"

localparam CLK0_FREQ        = (FAMILY == "iCE40UP") ? 40 : 10;
localparam CLK1_FREQ        = (FAMILY == "iCE40UP") ? 40 : 12;
localparam RESET_CNT        = (FAMILY == "iCE40UP") ? 140 : 35;
localparam TIMEOUT          = 4000000;
localparam LATENCY          = (FIFO_CONTROLLER == "HARD_IP") ? 0 : 2;
localparam DEASSERT_LATENCY = (FIFO_CONTROLLER == "HARD_IP") ? ((REGMODE == "reg")? 2 : 1) : 0;
localparam WR_DEASSERT_CHK  = (FIFO_CONTROLLER == "FABRIC") | (REGMODE == "noreg");

wire wr_clk_i;
wire rd_clk_i;
wire [WDATA_WIDTH-1:0] wr_data_i;
wire wr_en_i;
wire rd_en_i;
wire rst_i;
wire rp_rst_i;

wire [WADDR_WIDTH-1:0] almost_full_th_i;
wire [WADDR_WIDTH-1:0] almost_full_clr_th_i;
wire [RADDR_WIDTH-1:0] almost_empty_th_i;
wire [RADDR_WIDTH-1:0] almost_empty_clr_th_i;

wire [RDATA_WIDTH-1:0] rd_data_o;

wire full_o;
wire empty_o;
wire almost_full_o;
wire almost_empty_o;
wire [WADDR_WIDTH:0] wr_data_cnt_o;
wire [RADDR_WIDTH:0] rd_data_cnt_o;

wire [WADDR_WIDTH-1:0] waddr_i;
wire [RADDR_WIDTH-1:0] raddr_i;

wire [RDATA_WIDTH-1:0] rd_data_test_o;
wire full_test_o;
wire empty_test_o;
wire afull_test_o;
wire aempty_test_o;
wire [WADDR_WIDTH:0] wr_datacnt_test_o;
wire [RADDR_WIDTH:0] rd_datacnt_test_o;

wire m_rst_i;
wire m_rp_rst_i;
wire gen_rst_i;

assign rst_i    = gen_rst_i | m_rst_i;
assign rp_rst_i = gen_rst_i | m_rp_rst_i;

// ----------------------------
// GSR instance
// ----------------------------
`ifndef iCE40UP
    GSR GSR_INST ( .GSR_N(1'b1), .CLK(1'b0));
`endif

`include "dut_inst.v"

clk_rst_gen # (
    .CLK_PERIOD0              (CLK0_FREQ),
    .CLK_PERIOD1              (CLK1_FREQ),
    .RST_GEN                  (RESET_CNT),
    .TIMEOUT                  (TIMEOUT)
) clk_gen (                   
    .clk0_o                   (wr_clk_i),
    .clk1_o                   (rd_clk_i),
    .rst_o                    (gen_rst_i),
    .rst_n_o                  ()
);                            
					          
mem_model # (                 
    .ADDR_DEPTH_A             (WADDR_DEPTH),
    .DATA_WIDTH_A             (WDATA_WIDTH),
    .ADDR_DEPTH_B             (RADDR_DEPTH),
    .DATA_WIDTH_B             (RDATA_WIDTH),
    .REGMODE_A                (REGMODE),
    .REGMODE_B                (REGMODE),
    .RESETMODE                (RESETMODE),
    .RESET_RELEASE            (RESETMODE)
) data_chk (                  
    .clk_a_i                  (wr_clk_i),
    .clk_b_i                  (rd_clk_i),
				              
    .rst_a_i                  (rst_i),
    .clk_en_a_i               (wr_en_i),
    .rdout_clken_a_i          (1'b1),
    .wr_en_a_i                (wr_en_i),
    .wr_data_a_i              (wr_data_i),
    .addr_a_i                 (waddr_i),
    .ben_a_i                  ({roundUP(WDATA_WIDTH, 8){1'b0}}),
    .rd_data_a_o              (),
					          
    .rst_b_i                  (rst_i),
    .clk_en_b_i               (rd_en_i),
    .rdout_clken_b_i          (1'b1),
    .wr_en_b_i                (1'b0),
    .wr_data_b_i              ({RDATA_WIDTH{1'b0}}),
    .addr_b_i                 (raddr_i),
    .ben_b_i                  ({roundUP(RDATA_WIDTH, 8){1'b0}}),
					          
    .rd_data_b_o              (rd_data_test_o)
);

flag_checker # (
    .WADDR_DEPTH              (WADDR_DEPTH              ),
    .WDATA_WIDTH              (WDATA_WIDTH              ),
    .RADDR_DEPTH              (RADDR_DEPTH              ),
    .RDATA_WIDTH              (RDATA_WIDTH              ),
    .WADDR_WIDTH              (WADDR_WIDTH              ),
    .RADDR_WIDTH              (RADDR_WIDTH              ),
    .REGMODE                  (REGMODE                  ),
    .RESETMODE                (RESETMODE                ),
    .ENABLE_ALMOST_FULL_FLAG  (ENABLE_ALMOST_FULL_FLAG  ),
    .ALMOST_FULL_ASSERTION    (ALMOST_FULL_ASSERTION    ),
    .ALMOST_FULL_ASSERT_LVL   (ALMOST_FULL_ASSERT_LVL   ),
    .ALMOST_FULL_DEASSERT_LVL (ALMOST_FULL_DEASSERT_LVL ),
    .ENABLE_ALMOST_EMPTY_FLAG (ENABLE_ALMOST_EMPTY_FLAG ),
    .ALMOST_EMPTY_ASSERTION   (ALMOST_EMPTY_ASSERTION   ),
    .ALMOST_EMPTY_ASSERT_LVL  (ALMOST_EMPTY_ASSERT_LVL  ),
    .ALMOST_EMPTY_DEASSERT_LVL(ALMOST_EMPTY_DEASSERT_LVL),
    .ENABLE_DATA_COUNT_WR     (ENABLE_DATA_COUNT_WR     ),
    .ENABLE_DATA_COUNT_RD     (ENABLE_DATA_COUNT_RD     ),
    .LATENCY                  (LATENCY                  ),
    .DEASSERT_LATENCY         (DEASSERT_LATENCY         )
) flag_chk (
    .wr_clk_i                 (wr_clk_i), 
    .rd_clk_i                 (rd_clk_i), 
    .rst_i                    (rst_i), 
    .rp_rst_i                 (rp_rst_i), 
    .wr_en_i                  (wr_en_i), 
    .rd_en_i                  (rd_en_i), 
    .almost_full_th_i         (almost_full_th_i), 
    .almost_full_clr_th_i     (almost_full_clr_th_i), 
    .almost_empty_th_i        (almost_empty_th_i), 
    .almost_empty_clr_th_i    (almost_empty_clr_th_i), 

    .full_o                   (full_test_o), 
    .empty_o                  (empty_test_o), 
    .almost_full_o            (afull_test_o), 
    .almost_empty_o           (aempty_test_o), 
    .wr_data_cnt_o            (wr_datacnt_test_o), 
    .rd_data_cnt_o            (rd_datacnt_test_o)
);

fifo_master # (                                       
    .WADDR_DEPTH              (WADDR_DEPTH             ),
    .WADDR_WIDTH              (WADDR_WIDTH             ),
    .WDATA_WIDTH              (WDATA_WIDTH             ),
    .RADDR_DEPTH              (RADDR_DEPTH             ),
    .RADDR_WIDTH              (RADDR_WIDTH             ),
    .RDATA_WIDTH              (RDATA_WIDTH             ),
    .REGMODE                  (REGMODE                 ),
    .ENABLE_ALMOST_FULL_FLAG  (ENABLE_ALMOST_FULL_FLAG ),
    .ENABLE_ALMOST_EMPTY_FLAG (ENABLE_ALMOST_EMPTY_FLAG),
    .ENABLE_DATA_COUNT_WR     (ENABLE_DATA_COUNT_WR    ),
    .ENABLE_DATA_COUNT_RD     (ENABLE_DATA_COUNT_RD    ),
    .WR_DEASSERT_CHK          (WR_DEASSERT_CHK),
    .RD_DEASSERT_CHK          (1)
) fifo_ctrl (                 
    .wr_clk_i                 (wr_clk_i),
    .rd_clk_i                 (rd_clk_i),
    .rst_i                    (rst_i),
    .rp_rst_i                 (rp_rst_i),
							  
    .almost_full_th_i         (almost_full_th_i),
    .almost_full_clr_th_i     (almost_full_clr_th_i),
    .almost_empty_th_i        (almost_empty_th_i),
    .almost_empty_clr_th_i    (almost_empty_clr_th_i),
							  
    .wr_data_i                (wr_data_i),
    .wr_en_i                  (wr_en_i),
    .rd_en_i                  (rd_en_i),
							  
    .waddr_i                  (waddr_i),
    .raddr_i                  (raddr_i),
							  
    .rd_data_o                (rd_data_o),
    .full_o                   (full_o),
    .empty_o                  (empty_o),
    .almost_full_o            (almost_full_o),
    .almost_empty_o           (almost_empty_o),
    .wr_data_cnt_o            (wr_data_cnt_o),
    .rd_data_cnt_o            (rd_data_cnt_o),

    .rd_data_test_o           (rd_data_test_o),
    .full_test_o              (full_test_o),
    .empty_test_o             (empty_test_o),
    .afull_test_o             (afull_test_o),
    .aempty_test_o            (aempty_test_o),
    .wr_datacnt_test_o        (wr_datacnt_test_o),
    .rd_datacnt_test_o        (rd_datacnt_test_o),
	
	.m_rst_o				  (m_rst_i),
	.m_rp_rst_o				  (m_rp_rst_i)
);

//------------------------------------------------------------------------------
// Function Definition
//------------------------------------------------------------------------------

function [31:0] clog2;
  input [31:0] value;
  reg   [31:0] num;
  begin
    num = value - 1;
    for (clog2=0; num>0; clog2=clog2+1) num = num>>1;
  end
endfunction

function [31:0] roundUP;
    input [31:0] dividend;
    input [31:0] divisor;
    begin
        if(divisor == 1) begin
            roundUP = dividend;
        end
        else if(dividend <= divisor) begin
            roundUP = 1;
        end
        else begin
            roundUP = dividend/divisor + (((dividend % divisor) == 0) ? 0 : 1);
        end
    end
endfunction

endmodule
`endif

