// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
// Copyright (c) 2018 by Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// --------------------------------------------------------------------
//
// Permission:
//
// Lattice SG Pte. Ltd. grants permission to use this code
// pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice provides no warranty
// regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                     Lattice SG Pte. Ltd.
//                     101 Thomson Road, United Square #07-02
//                     Singapore 307591
//
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                     +65-6631-2000 (Singapore)
//                     +1-503-268-8001 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
// FILE DETAILS
// Project : <>
// File : lscc_ddr_tb.v
// Title :
// Dependencies :
// Description :
// =============================================================================
// REVISION HISTORY
// Version : 1.0
// Author(s) :
// Mod. Date : 02.12.2019
// Changes Made : Initial version
// -----------------------------------------------------------------------------
// Version : 1.0
// Author(s) :
// Mod. Date :
// Changes Made :
// =============================================================================
`ifndef __LSCC_DDR_TB__
`define __LSCC_DDR_TB__

`timescale 100 fs / 1 fs

module tb_top();

`include "dut_params.v"
// =======================================================================================================================
// Add Post PAR netlist delay to testbench
// Set below values to 0 during RTL and Post Synthesis simulation. Change values when running Post PAR simulation.
// Can be used when GDDRX1_RX.SCLK.Aligned and GDDRX1_RX.SCLK.Centered configurations are used
// =======================================================================================================================
localparam ENABLE_POST_PAR_DLY  = 0;       // Enable or Disable delay inclusion on the testbench
// Coarse Delay Values
localparam COARSE_DLY           = "1P6NS"; // Coarse delay setting [Allowed Value   : "1P6NS"]
// Fine Delay Step 
localparam FINE_DLY_STEP        = 31;      // Fine delay setting    [Allowed Values : 31 | 33 ]
                                           // For GDDRX1_RX.SCLK.Aligned use 31.
										   // For GDDRX1_RX.SCLK.Centered use 33.

// =============================================================================
// Testbench Starts Here
// =============================================================================
reg                            sync_clk_i;
reg                            sync_rst_i;
reg                            sync_update_i;
reg                            sync_start_i;

// PLL LMMI
// Inputs
reg                            pll_rstn_i;
reg                            pll_clki_i;
reg                            lmmi_clk_i;
reg                            lmmi_resetn_i;
reg                            lmmi_request_i;
reg                            lmmi_wr_rdn_i;
reg  [6:0]                     lmmi_offset_i;
reg  [7:0]                     lmmi_wdata_i;

// outputs
wire                           lmmi_ready_o;
wire  [7:0]                    lmmi_rdata_o;
wire                           lmmi_rdata_valid_o;
//

reg                            apb_penable_i;
reg                            apb_psel_i;
reg                            apb_pwrite_i;
reg   [6:0]                    apb_paddr_i;
reg   [7:0]                    apb_pwdata_i;

wire                           apb_pready_o;
wire                           apb_pslverr_o;
wire [7:0]                     apb_prdata_o;

wire                           sync_done_w;
reg                            sync_done_r;
wire                           ready_o;

reg                            slow_clk_w_r;
reg                            slow_clk_w;
reg                            slow_clk_90_w;
reg                            slow_clk_90_w_r;
reg                            sync_clk_w;

wire                           clk_i;
wire                           clk90_i;
wire                           eclk_i;
wire                           eclk90_i;
wire                           clk;

reg                            rst_i;
reg                            rst_dly_r;
reg                 [63:0]     watchdog_r;

wire                           sclk_o;
wire                           sclk_o_exp_w;

wire                           clk_o;
wire                           clk_o_exp_w;

wire          [IN_WIDTH:0]     data_i;
reg           [IN_WIDTH:0]     data_i_r;
wire         [OUT_WIDTH:0]     data_o;
reg          [OUT_WIDTH:0]     data_o_exp_td;
reg          [OUT_WIDTH:0]     data_o_exp_r;
reg          [OUT_WIDTH:0]     data_o_exp_r_d;
reg          [OUT_WIDTH:0]     data_o_exp_r_d1;
reg          [OUT_WIDTH:0]     data_o_exp_r_d2;
reg          [OUT_WIDTH:0]     data_o_exp_r_d3;
reg          [OUT_WIDTH:0]     data_o_exp_r_d4;
reg          [OUT_WIDTH:0]     data_o_exp_r_d5;
reg          [OUT_WIDTH:0]     data_o_exp_r_d6;
reg          [OUT_WIDTH:0]     data_o_exp_r_d7;
reg          [OUT_WIDTH:0]     data_o_exp_r_d8;
reg          [OUT_WIDTH:0]     data_o_exp_r_d9;
reg          [OUT_WIDTH:0]     data_o_exp_r_d10;
reg          [OUT_WIDTH:0]     data_o_exp_r_d11;
reg          [OUT_WIDTH:0]     data_o_exp_r_d12;
reg          [OUT_WIDTH:0]     data_o_exp_r_d13;
reg          [OUT_WIDTH:0]     data_o_exp_r_d14;
reg          [OUT_WIDTH:0]     data_o_exp_r_d15;
reg          [OUT_WIDTH:0]     data_o_exp_r_d16;
reg          [OUT_WIDTH:0]     data_o_exp_r_d17;
reg          [OUT_WIDTH:0]     data_o_exp_r_d18;
reg          [OUT_WIDTH:0]     data_o_exp_r_d19;
reg          [OUT_WIDTH:0]     data_o_exp_r_d20;

reg          [OUT_WIDTH:0]     data_o_exp_end_w;
reg          [OUT_WIDTH:0]     data_o_last_r;
reg          [OUT_WIDTH:0]     data_o_last_r1;
reg          [OUT_WIDTH:0]     data_o_last_r2;
reg          [OUT_WIDTH:0]     data_o_last_r3;
reg          [OUT_WIDTH:0]     data_accumulator_r;
reg          [OUT_WIDTH:0]     data_o_expected_r;
reg           [IN_WIDTH:0]     data_i_r_0;
reg           [IN_WIDTH:0]     data_i_r_1;
reg           [IN_WIDTH:0]     data_i_r_2;
reg           [IN_WIDTH:0]     data_i_r_3;
reg           [IN_WIDTH:0]     data_i_r_4;
reg           [IN_WIDTH:0]     data_i_r_5;
reg           [IN_WIDTH:0]     data_i_r_6;
reg           [IN_WIDTH:0]     data_i_r_7;
reg           [IN_WIDTH:0]     data_i_r_8;
reg           [IN_WIDTH:0]     data_i_r_9;
reg           [IN_WIDTH:0]     data_i_r_10;
reg           [IN_WIDTH:0]     data_i_r_11;
reg           [IN_WIDTH:0]     data_i_r_12;
reg           [IN_WIDTH:0]     data_i_r_13;
reg           [IN_WIDTH:0]     data_i_r_14;
reg           [IN_WIDTH:0]     data_i_r_15;
reg           [IN_WIDTH:0]     data_i_r_16;
wire          [IN_WIDTH:0]     data_end_w;
wire          [IN_WIDTH:0]     data_i_r_post_dly;

reg        [BUS_WIDTH-1:0]     data_move_i;
reg        [BUS_WIDTH-1:0]     data_move_r;
reg        [BUS_WIDTH-1:0]     data_loadn_i;
wire       [BUS_WIDTH-1:0]     data_cflag_o;
reg        [(BUS_WIDTH*2)-1:0] data_coarse_dly_i;
reg        [BUS_WIDTH-1:0]     data_direction_i;
reg                            outen_n_i;
reg        [3:0]               outen_n_i_r;
reg                            alignwd_i;
reg                            alignwd_stop_r;
reg                            start_input_data_r;
reg                            input_data_dyn_r;

reg                            clk_move_i;
reg                            clk_move_r;
reg                            clk_loadn_i;
wire                           clk_cflag_o;
reg        [1:0]               clk_coarse_dly_i;
reg                            clk_direction_i;
reg                            clk_test_done_r;

wire                [63:0]     fine_dly_w;

reg                 [63:0]     data_coarse_dly_r;
reg                 [63:0]     data_fine_dly_r[BUS_WIDTH-1:0];
reg                 [63:0]     data_fine_dly_exp_r;
reg                 [63:0]     data_total_dly_r[BUS_WIDTH-1:0];
reg        [BUS_WIDTH-1:0]     data_error_vec_r;
reg                 [11:0]     data_counter_r;
reg                 [6:0]      move_cntr_r;

reg                 [63:0]     clk_coarse_dly_r;
reg                 [63:0]     clk_fine_dly_r;
reg                 [63:0]     clk_fine_dly_exp_r;
reg                 [63:0]     clk_total_dly_r;
reg                            clk_error_r;

wire                           d_clk;       // TX data generation clock

wire  [8:0]                    dcntl_o;

// -----------------------------------------------------------------------------
// Local Parameters
// -----------------------------------------------------------------------------
// localparam real    CLK_PERIOD_CEIL    = (10*1000*1000.0 / CLK_FREQ);
// localparam integer CLK_PERIOD         = CLK_PERIOD_CEIL - 0.5;
localparam integer  CLK_PERIOD_01      = (1000*1000 / CLK_FREQ);
localparam integer  CLK_PERIOD         = (10 * CLK_PERIOD_01);
localparam          SYNC_CLK_PERIOD    = (10*1000*1000.0 / CLKI_FREQ);
localparam          DDR_CLK_PERIOD     = CLK_PERIOD  / (GEARING);
localparam real     PLL_REF_CLOCK_CEIL = (10*1000*1000.0 / CLKI_FREQ);
localparam integer  PLL_REF_CLOCK      = PLL_REF_CLOCK_CEIL - 0.5;


// SIOLOGIC/IOLOGIC Intrisic delay values
localparam X1_BYPASSED_DEL      = 0;
localparam X1_STATIC_DEL        = 1000;
localparam X1_DYNAMIC_DEL       = 500;
localparam X2_4_5_BYPASSED_DEL  = 0;
localparam X2_4_5_STATIC_DEL    = 500;
localparam X2_4_5_DYNAMIC_DEL   = 500;

localparam INT_DELAY            =
 (GEARING==1 && DATA_PATH_DELAY == "BYPASS" )? X1_BYPASSED_DEL    :
 (GEARING==1 && DATA_PATH_DELAY == "STATIC" )? X1_STATIC_DEL      :
 (GEARING==1 && DATA_PATH_DELAY == "DYNAMIC")? X1_DYNAMIC_DEL     :
 (GEARING!=1 && DATA_PATH_DELAY == "BYPASS" )? X2_4_5_BYPASSED_DEL:
 (GEARING!=1 && DATA_PATH_DELAY == "STATIC" )? X2_4_5_STATIC_DEL  :
 (GEARING!=1 && DATA_PATH_DELAY == "DYNAMIC")? X2_4_5_DYNAMIC_DEL :
 500;
// Coarese Delay Values
localparam DELAY_00_VAL         = 0;    // 0.0ns
localparam DELAY_01_VAL         = 8000; // 0.8ns
localparam DELAY_10_VAL         = 16000;// 1.6ns

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Generate Variables
// -----------------------------------------------------------------------------
genvar  i;

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
integer   k                         = 0;
integer   j                         = 0;
integer   l                         = 0;
integer   c                         = 0;
integer   d                         = 0;
integer   e                         = 0;
integer   f                         = 0;
integer   g                         = 0;
integer   pass_count                = 0;
integer   error_count               = 0;
integer   sclk_o_rising_edge_count  = 0;
integer   clk_o_rising_edge_count   = 0;

realtime  sclk_o_next_period        = 0.0;
realtime  sclk_o_exp_period         = 0.0;
realtime  sclk_o_period             = GEARING*CLK_PERIOD;

realtime  clk_o_exp_period          = 0.0;
realtime  clk_o_next_period         = 0.0;
realtime  clk_o_period              = CLK_PERIOD;

assign data_error_flag_w = | data_error_vec_r;
assign fine_dly_w        = (INTERFACE_TYPE == "RECEIVE" & 
                            DATA_PATH_DELAY == "BYPASS" & 
							GEARING == 1 & 
							ENABLE_POST_PAR_DLY == 1)   ? (FINE_DLY_STEP* 125) : (D_FINE_DEL_INPUT * 125); //fine_delay * 12.5ps

// -----------------------------------------------------------------------------
// Submodule Instantiations
// -----------------------------------------------------------------------------
// GSR

// Uncomment if you are using Radiant Version 1.1
// GSR GSR_INST(.GSR(1'b1), .CLK(1'b0), .GSROUT());

// Uncomment if you are using Radiant Version 1.2
///////////////////// GSR /////////////////////
reg CLK_GSR = 0;
reg USER_GSR = 1;
wire GSROUT;

initial begin
    forever begin
        #5;
        CLK_GSR = ~CLK_GSR;
    end
end

GSR GSR_INST (
    .GSR_N(USER_GSR),
    .CLK(CLK_GSR)
);

// -----------------------------------------------------------------------------
// Data Checking Task
// -----------------------------------------------------------------------------
task    data_checker
    (
        input         [IN_WIDTH :0] input_data,
        input         [OUT_WIDTH:0] expected_data,
        input         [OUT_WIDTH:0] actual_data,
        inout integer               tdp_pass_count,
        inout integer               tdp_error_count
    );
    begin
         if (data_error_flag_w == 0)
         begin
            $display("\t\tPASS");
            tdp_pass_count = tdp_pass_count + 1;
         end else
         begin
            $display("\t\tERROR");
            tdp_error_count = tdp_error_count + 1;
         end
         $display("\t\tINPUT DATA: %h", input_data);
         $display("\t\tEXPECTED DATA: %h ACTUAL DATA: %h ", expected_data, actual_data);
         $display("*******************************************");
    end
endtask
// -----------------------------------------------------------------------------
// End Task
// -----------------------------------------------------------------------------

//Input Clock generation
initial begin
  slow_clk_w = 0;
  forever slow_clk_w = #(CLK_PERIOD/2) ~slow_clk_w;
end

initial begin
  slow_clk_w_r = 1;
  forever slow_clk_w_r = #(GEARING*CLK_PERIOD/2) ~slow_clk_w_r;
end

initial begin
  slow_clk_90_w = 0;
  forever slow_clk_90_w = #(CLK_PERIOD/8) slow_clk_w;
end

initial begin
  slow_clk_90_w_r = 0;
  forever slow_clk_90_w_r = #(CLK_PERIOD/4) slow_clk_w_r;
end

initial begin
  sync_clk_w = 0;
  forever sync_clk_w = #(SYNC_CLK_PERIOD/2) ~sync_clk_w;
end

generate
    if(INTERFACE_TYPE == "RECEIVE") begin
        if (CLOCK_DATA_RELATION == "CENTERED") begin
            assign clk = slow_clk_w; //Need for expected data.
        end
        else begin
            assign clk = slow_clk_w;
        end
    end
    else begin
        assign clk = slow_clk_w;
        if (GEARING == 1) begin
            assign d_clk = slow_clk_w;
        end
        else begin
            assign d_clk = sclk_o;
        end
    end
endgenerate

generate
    if((INTERFACE_TYPE == "RECEIVE") && (CLOCK_DATA_RELATION == "ALIGNED") || (INCLUDE_GDDR_SYNC == 1)) begin
        assign sync_done_w = ready_o & sync_done_r;
    end
    else begin
        assign sync_done_w = rst_dly_r;
    end
endgenerate

generate
    if (INTERFACE_TYPE == "TRANSMIT") begin
        always @( * ) begin
            for(k=0; k<(OUT_WIDTH+1); k=k+1) begin
                data_o_exp_td[k] <= #(data_total_dly_r[k]) (outen_n_i_r[0])? 1'bz : data_o_exp_end_w[k];// Transport delayed expected data for TX.
            end
        end
    end
endgenerate

generate
    for(i=0; i<(IN_WIDTH+1); i=i+1) begin
        if(INTERFACE_TYPE == "TRANSMIT") begin
            assign data_i[i] = data_i_r[i];
        end
        else begin
		    if( GEARING != 1) begin
                assign #(CLK_PERIOD/2 - data_total_dly_r[i]) data_i[i] = data_i_r_1[i];
		    end 
			else begin
			    if (INTERFACE_TYPE == "RECEIVE" & DATA_PATH_DELAY == "BYPASS" & GEARING == 1 & ENABLE_POST_PAR_DLY == 1) begin
				    assign #(CLK_PERIOD/2) data_i[i] = data_i_r_1[i];				
				end
				else begin			
                    assign #(CLK_PERIOD/2 - data_total_dly_r[i]) data_i[i] = data_i_r_1[i];
			    end
			end
        end
    end
endgenerate

generate
    if(INTERFACE_TYPE == "TRANSMIT") begin
        if(CLOCK_DATA_RELATION == "CENTERED") begin
            if(GEARING == 1) begin
                assign eclk_i   = 0;
                assign eclk90_i = 0;
                assign clk_i    = slow_clk_w;
                assign clk90_i  = slow_clk_90_w;
            end
            else begin
                assign eclk_i   = slow_clk_w;
                assign eclk90_i = slow_clk_90_w;
                assign clk_i    = slow_clk_w;      //Need for expected data generation
                assign clk90_i  = 0;
            end
        end
        else begin
            if(GEARING == 1) begin
                assign eclk_i   = 0;
                assign eclk90_i = 0;
                assign clk_i    = slow_clk_w;
                assign clk90_i  = 0;
            end
            else begin
                assign eclk_i   = 0;
                assign eclk90_i = 0;
                assign clk_i    = slow_clk_w;
                assign clk90_i  = 0;
            end
        end
    end
    else begin
        assign eclk90_i = 0;
        assign eclk_i   = 0;
        assign clk90_i  = 0;
        if (CLOCK_DATA_RELATION == "CENTERED") begin
			assign clk_i    = slow_clk_90_w;
		end
        else begin
            assign clk_i    = slow_clk_w;
        end
    end
endgenerate

always @ (posedge slow_clk_w) begin
    if(watchdog_r == {32{1'b1}}) begin
        $display("******  TEST IS TIMED OUT  ******\n");
        $stop;
        watchdog_r <= 0;
    end
    else begin
        watchdog_r <= watchdog_r + 1;
    end
end

initial begin
    data_accumulator_r     = 0;
    data_o_expected_r      = 0;
    data_o_exp_r_d         = 1'b0;
    data_o_exp_td          = 1'b0;
    clk_move_i             = 1'b0;
    clk_direction_i        = 1'b0;
    clk_loadn_i            = 1'b1;
    data_direction_i       = {BUS_WIDTH{1'b0}};
    data_move_i            = {BUS_WIDTH{1'b0}};
    data_loadn_i           = {BUS_WIDTH{1'b0}};
    watchdog_r             = 0;
    rst_i                  = 0;
    data_error_vec_r       = {BUS_WIDTH{1'b0}};
    data_fine_dly_exp_r    = 0;
    clk_error_r            = 0;
    clk_fine_dly_exp_r     = 0;
    clk_move_r             = 0;
    clk_test_done_r        = 0;
    data_move_r            = 0;
    data_i_r               = {(IN_WIDTH+1){1'b0}};
    outen_n_i              = 0;
    outen_n_i_r            = 0;
    alignwd_i              = 0;
    alignwd_stop_r         = 0;
    rst_dly_r              = 0;
	move_cntr_r            = 0;
    pll_rstn_i             = 1'b1;
    @(posedge sync_clk_w);
    rst_i                  = 1;
    @(posedge sync_clk_w);
    rst_i                  = 0;
    @(posedge sync_clk_w);
    rst_dly_r              = 1;
end

initial begin
    if (PLL_ENABLE == 1) begin
        @(posedge sync_clk_w);
        @(posedge sync_clk_w);
        @(posedge sync_clk_w);
        clk_test_done_r  = 1;
    end
end

initial begin
    if(GEARING != 1) begin
	    if(DATA_PATH_DELAY == "STATIC" | DATA_PATH_DELAY == "BYPASS") begin
		    assign start_input_data_r = ready_o;
		end
		else begin
		    assign start_input_data_r = input_data_dyn_r;
		end
	end
end
initial begin
    if((GEARING == 2 | GEARING == 4) &  INTERFACE_TYPE == "RECEIVE") begin
	    if (CLOCK_DATA_RELATION == "ALIGNED") begin
            @(posedge start_input_data_r);
            data_i_r = 1'b0;
            @(posedge clk_i);
            @(posedge clk_i);
            data_i_r = 1'b1;
            forever data_i_r = #(CLK_PERIOD) ~data_i_r;
	    end
		else begin        
		    @(posedge clk_i);
            data_i_r = 1'b0;
            @(posedge clk_i);
            @(posedge clk_i);
            data_i_r = 1'b1;
            forever data_i_r = #(CLK_PERIOD) ~data_i_r;		
		end
    end
	if(GEARING == 5 &  INTERFACE_TYPE == "RECEIVE") begin
	    if (CLOCK_DATA_RELATION == "ALIGNED") begin
	        @(posedge start_input_data_r);
            data_i_r = 1'b0;
            @(posedge clk_i);
            @(posedge clk_i);
            @(posedge clk_i);
            @(posedge clk_i);
            while (start_input_data_r) begin
                @(posedge clk_i);
                data_i_r = 1'b0;
                @(posedge clk_i);
                data_i_r = 1'b1;
                @(posedge clk_i);
                data_i_r = 1'b0;
                @(posedge clk_i);
                data_i_r = 1'b1;
                @(posedge clk_i);
                data_i_r = 1'b1;
            end	
		end
		else begin
            data_i_r = 1'b0;
            @(posedge clk_i);
            @(posedge clk_i);
            @(posedge clk_i);
            @(posedge clk_i);
			while (rst_i == 1'b1) begin
                data_i_r = 1'b0;
                @(posedge clk_i);
			end
            while (rst_i == 1'b0) begin
                @(posedge clk_i);
                data_i_r = 1'b0;
                @(posedge clk_i);
                data_i_r = 1'b1;
                @(posedge clk_i);
                data_i_r = 1'b0;
                @(posedge clk_i);
                data_i_r = 1'b1;
                @(posedge clk_i);
                data_i_r = 1'b1;
            end	
		end
    end
end

// Reset assertion test
generate
    if (1==GEARING) begin
        always @(posedge rst_i) begin
            if (rst_dly_r && rst_i && ~clk_o && data_o !== {OUT_WIDTH+1{1'b0}}) begin
                $display(" ---------------------------------------------- ");
                $display("\tERROR: Reset assertion fails: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
                $stop;
            end
            else begin
            #1;
                $display(" ---------------------------------------------- ");
                $display("\tINFO: Reset assertion is done: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
            end
        end
    end
    else begin
        always @(posedge rst_i, posedge sync_rst_i) begin
            if (rst_i && rst_dly_r && sync_rst_i && ~ready_o &&
                ~clk_o && ~sclk_o && data_o !== {OUT_WIDTH+1{1'b0}}) begin
                $display(" ---------------------------------------------- ");
                $display("\tERROR: Reset assertion fails: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
                $stop;
            end
            else begin
            #1;
                $display(" ---------------------------------------------- ");
                $display("\tINFO: Reset assertion is done: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
            end
        end
    end
endgenerate// END Reset assertion test

generate
    if(INTERFACE_TYPE == "RECEIVE") begin
    //Data delay
        initial begin
            @(posedge clk, negedge clk);
            @(posedge clk, negedge clk);
            for(k=0; k<BUS_WIDTH; k=k+1) begin
                data_fine_dly_r[k] = fine_dly_w;
            end

            if(DATA_COARSE_DELAY_VALUE == "0NS") begin
                data_coarse_dly_i = {BUS_WIDTH{2'b00}};
            end
            if(DATA_COARSE_DELAY_VALUE == "0P8NS") begin
                data_coarse_dly_i = {BUS_WIDTH{2'b01}};
            end
            if(DATA_COARSE_DELAY_VALUE == "1P6NS") begin
                data_coarse_dly_i = {BUS_WIDTH{2'b10}};
            end

            data_loadn_i     = {BUS_WIDTH{1'b0}};
            data_direction_i = {BUS_WIDTH{1'b0}};

            while(rst_i == 0)
                @(posedge clk, negedge clk);
            while(rst_i == 1)
                @(posedge clk, negedge clk);
            while(sync_done_w !== 1)
                @(posedge clk, negedge clk);
            while(clk_test_done_r !== 1)
                @(posedge clk, negedge clk);
                @(posedge clk, negedge clk);
                @(posedge clk, negedge clk);
                @(posedge clk, negedge clk);
				
            data_loadn_i     = {BUS_WIDTH{1'b1}};
			
            @(posedge clk, negedge clk);
            data_direction_i = {BUS_WIDTH{1'b0}};

            if(DATA_PATH_DELAY == "DYNAMIC") begin
                if (GEARING != 1) begin // RX, DYNAMIC, GEARING == X2/X4/X5
                    data_loadn_i        = {BUS_WIDTH{1'b0}};
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Resets data delay value to default: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
                    @(posedge clk_i);
                        data_loadn_i        = {BUS_WIDTH{1'b1}};
                    @(posedge clk_i);
                        input_data_dyn_r = 1'b1;
                    @(posedge sclk_o);
					
                    while((&data_cflag_o == 0) && ((data_fine_dly_exp_r + fine_dly_w + data_coarse_dly_r) < (CLK_PERIOD/2))) begin
                        data_move_i ={BUS_WIDTH{1'b1}};
                        @(posedge clk_i);
                            data_move_i = {BUS_WIDTH{1'b0}};
                        @(posedge clk_i);
                            data_fine_dly_exp_r = data_fine_dly_exp_r + 125;
					    	
                        if(data_fine_dly_exp_r > 15875) begin
                            $display(" ---------------------------------------------- ");
                            $display("\tERROR: DATA OVERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                            $display(" ---------------------------------------------- ");
                            $stop;
                        end
						
						move_cntr_r = move_cntr_r + 1;
                    end
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Word alignment starts: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
                    repeat (4) begin
                        @(posedge sclk_o);
                        alignwd_i = 1;
				    	repeat (5) begin
                            @(posedge sclk_o);
				    	end
                        alignwd_i = 0;
                        @(posedge sclk_o);
                    end	
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Word alignment is done: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
				    @(posedge sclk_o);
                        alignwd_stop_r = 1'b1;
                    @(posedge sclk_o);
				    
                    repeat (100) begin
                        @(posedge clk_i);
                    end					
                    
					data_direction_i = {BUS_WIDTH{1'b1}};
					
                    for(j=0;j<move_cntr_r;j=j+1) begin
                        @(posedge clk_i);
                            //data_i_r = $random;
                            data_move_i = {BUS_WIDTH{1'b1}};
                        @(posedge clk_i);
                            data_move_i = {BUS_WIDTH{1'b0}};
                    end
					
                    data_loadn_i        = {BUS_WIDTH{1'b0}};
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Resets data delay value to default: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
				
                    @(posedge clk_i);
                        data_loadn_i        = {BUS_WIDTH{1'b1}};
                    @(posedge clk_i);
                        for(c=0;c<128;c=c+1) begin
                            //data_i_r = $random;
                            @(posedge clk_i);
                        end
						
                    if(clk_error_r == 0) begin
                        $display("CLOCK MATCH");
                        $display("CLOCK TEST PASSED\n");
                    end
                    else begin
                        $display("CLOCK MISMATCH");
                        $display("CLOCK TEST FAILED\n");
                    end
					
                    //$display("Failed RX data number = %d", error_count);
                    //$display("Passed RX data number = %d\n", pass_count);
                    
					if (error_count == 0 && clk_error_r == 0) begin
                       $display("*******SIMULATION PASSED*******\n");
                    end 
					else begin
                       $display("TIME = %t", $time) ;
                       $display("******* TEST FAILED *******\n");
                    end
					
                    $stop;	
                end

                else begin // RX, DYNAMIC, GEARING == X1
                    data_loadn_i        = {BUS_WIDTH{1'b0}};
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Resets data delay value to default: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
                    @(posedge clk_i);
                        data_loadn_i        = {BUS_WIDTH{1'b1}};
                    @(posedge clk_i);
			    
                    while((&data_cflag_o == 0) && ((data_fine_dly_exp_r + fine_dly_w + data_coarse_dly_r) < (CLK_PERIOD/2))) begin
						data_move_i ={BUS_WIDTH{1'b1}};
                        @(posedge clk_i);
                            data_move_i = {BUS_WIDTH{1'b0}};
                        @(posedge clk_i);
                            data_fine_dly_exp_r = data_fine_dly_exp_r + 125;
                        if(data_fine_dly_exp_r > 15875) begin
                           $display(" ---------------------------------------------- ");
                           $display("\tERROR: DATA OVERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                           $display(" ---------------------------------------------- ");
                           $stop;
                        end
						
						move_cntr_r = move_cntr_r +1;
                    end
					
                    data_direction_i = {BUS_WIDTH{1'b1}};
					
                    for(j=0;j<move_cntr_r;j=j+1) begin
                        @(posedge clk_i);
                            data_move_i = {BUS_WIDTH{1'b1}};
                        @(posedge clk_i);
                            data_move_i = {BUS_WIDTH{1'b0}};
                    end
					
                    data_loadn_i    = {BUS_WIDTH{1'b0}};
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Resets data delay value to default: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
                    @(posedge clk_i);
                        data_loadn_i   = {BUS_WIDTH{1'b1}};
                    @(posedge clk_i);
					
					for(j=0;j<move_cntr_r;j=j+1) begin
                        @(posedge clk_i);
                            data_i_r = data_i_r + 1;
                            data_move_i = {BUS_WIDTH{1'b1}};
                        @(posedge clk_i);
                            data_i_r = data_i_r + 1;
                            data_move_i = {BUS_WIDTH{1'b0}};
                    end
					
                end
				
                if(clk_error_r == 0) begin
                    $display("CLOCK MATCH");
                    $display("CLOCK TEST PASSED\n");
                end
                else begin
                    $display("CLOCK MISMATCH");
                    $display("CLOCK TEST FAILED\n");
                end
				
                //$display("Failed RX data number = %d", error_count);
                //$display("Passed RX data number = %d\n", pass_count);
				
                if (error_count == 0 && clk_error_r == 0) begin
                    $display("******* SIMULATION PASSED *******\n");
                end 
				else begin
                    $display("TIME = %t", $time) ;
                    $display("******* TEST FAILED *******\n");
                end
				
                $stop;
            end
            else begin       // RX, STATIC or BYPASS 
			    if (GEARING != 1) begin //GEARING == X2/X4/X5
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Word alignment starts: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
				    
                    repeat (4) begin
                        @(posedge sclk_o);
                        alignwd_i = 1;
				    	repeat (5) begin
                            @(posedge sclk_o);
				    	end
                        alignwd_i = 0;
                        @(posedge sclk_o);
                    end
				    
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Word alignment is done: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
                    
				    @(posedge sclk_o);
                        alignwd_stop_r = 1'b1;
                    @(posedge sclk_o);
				    
                    repeat (1000) begin
                        @(posedge clk_i);
                    end
				end
				else begin //GEARING == X1
                    @(posedge clk_i);
                    for(c=0;c<(512);c=c+1) begin 
                        data_i_r = c;
                        @(posedge clk_i);
                    end
				end
	        
                if(clk_error_r == 0) begin
                    $display("CLOCK MATCH");
                    $display("CLOCK TEST PASSED\n");
                end
                else begin
                    $display("CLOCK MISMATCH");
                    $display("CLOCK TEST FAILED\n");
                end
				
                //$display("Failed RX data number = %d", error_count);
                //$display("Passed RX data number = %d\n", pass_count);
				
                if (error_count == 0 && clk_error_r == 0) begin
                    $display("******* SIMULATION PASSED *******\n");
                end 
				else begin
                    $display("TIME = %t", $time) ;
                    $display("******* TEST FAILED *******\n");
                end
				
                $stop;
            end
        end
    end//RECEIVE
    else begin //TRANSMIT
        initial begin //Data delay
            @(posedge clk);
            for(k=0; k<BUS_WIDTH; k=k+1) begin
                data_fine_dly_r[k] = fine_dly_w;
            end

            if(DATA_COARSE_DELAY_VALUE == "0NS") begin
              data_coarse_dly_i = {BUS_WIDTH{2'b00}};
            end
            if(DATA_COARSE_DELAY_VALUE == "0P8NS") begin
              data_coarse_dly_i = {BUS_WIDTH{2'b01}};
            end
            if(DATA_COARSE_DELAY_VALUE == "1P6NS") begin
              data_coarse_dly_i = {BUS_WIDTH{2'b10}};
            end

            data_loadn_i     = {BUS_WIDTH{1'b0}};
            data_move_i      = {BUS_WIDTH{1'b0}};
            data_direction_i = {BUS_WIDTH{1'b0}};

            while(rst_i == 0)
                @(posedge clk, negedge clk);
            while(rst_i == 1)
                @(posedge clk, negedge clk);
            while(sync_done_w !== 1)
                @(posedge clk, negedge clk);
            while(rst_dly_r !== 1)
                @(posedge clk, negedge clk);
            while(clk_test_done_r !== 1)
                @(posedge clk, negedge clk);
	        
            @(posedge clk, negedge clk);
            @(posedge clk, negedge clk);
            @(posedge clk, negedge clk);
                data_loadn_i     = {BUS_WIDTH{1'b1}};
            @(posedge clk, negedge clk);

            data_direction_i = {BUS_WIDTH{1'b0}};
			
            if(DATA_PATH_DELAY == "DYNAMIC") begin
                data_loadn_i        = {BUS_WIDTH{1'b0}};
				
                $display(" ---------------------------------------------- ");
                $display("\tINFO: Resets data delay value to default: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
				
                @(posedge clk);
                    data_loadn_i        = {BUS_WIDTH{1'b1}};
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);

                while(((& data_cflag_o) == 0) && (data_fine_dly_exp_r < 15875)) begin
                    data_move_i = {BUS_WIDTH{~data_cflag_o}};
                    @(posedge clk);
                        data_move_i = {BUS_WIDTH{1'b0}};
                    @(posedge clk);
                        data_fine_dly_exp_r = data_fine_dly_exp_r + 125;
						
                    if(data_fine_dly_exp_r > 15875) begin
                        $display(" ---------------------------------------------- ");
                        $display("\tERROR: DATA OVERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                        $display(" ---------------------------------------------- ");
                        $stop;
                    end
                end

                data_direction_i = {BUS_WIDTH{1'b1}};
				
                for(c=0;c<126;c=c+1) begin
                    @(posedge clk);
                    @(posedge clk);
                        data_move_i = {BUS_WIDTH{1'b1}};
                    @(posedge clk);
                    @(posedge clk);
                        data_move_i = {BUS_WIDTH{1'b0}};
                end
	            
                for(c=0;c<127;c=c+1) begin
                    @(posedge d_clk);
                    data_i_r = $random;
                end
				
                if (TRISTATE_EN == 1) begin
                    @(posedge clk);
                    #1;
                    outen_n_i <= 1'b1;
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Tri-State is enabled: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
					
                    for(c=0;c<16;c=c+1) begin
                        @(posedge d_clk);
                    end
					
                    @(posedge clk);
                    #1;
                    outen_n_i <= 1'b0;
					
                    $display(" ---------------------------------------------- ");
                    $display("\tINFO: Tri-State is disabled: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
	                
                    for(c=0;c<16;c=c+1) begin
                        @(posedge d_clk);
                        data_i_r = $random;
                    end
                end
				
                if(clk_error_r == 0) begin
                    $display("CLOCK MATCH");
                    $display("CLOCK TEST PASSED\n");
                end
                else begin
                    $display("CLOCK MISMATCH");
                    $display("CLOCK TEST FAILED\n");
                end
				
                //$display("Failed TX data number = %d", error_count);
                //$display("Passed TX data number = %d\n", pass_count);
				
                if (error_count == 0 && clk_error_r == 0) begin
                    $display("******* SIMULATION PASSED *******\n");
                end 
				else begin
                    $display("TIME = %t", $time) ;
                    $display("******* TEST FAILED *******\n");
                end
				
                $stop;
            end // TX DYANMIC
        else begin // TX STATIC
            for(c=0;c<32;c=c+1) begin
                @(posedge d_clk);
                data_i_r = $random;
            end
			
            if (TRISTATE_EN == 1) begin
                outen_n_i <= 1'b1;
				
                $display(" ---------------------------------------------- ");
                $display("\tINFO: Tri-State is enabled: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
				
                for(c=0;c<8;c=c+1) begin
                    @(posedge d_clk);
                    data_i_r = $random;
                end
				
                outen_n_i <= 1'b0;
				
                $display(" ---------------------------------------------- ");
                $display("\tINFO: Tri-State is disabled: -- %0t fs", $time);
                $display(" ---------------------------------------------- ");
		    
                for(c=0;c<16;c=c+1) begin
                    @(posedge d_clk);
                    data_i_r = $random;
                end
            end
			
            if(clk_error_r == 0) begin
                $display("CLOCK MATCH");
                $display("CLOCK TEST PASSED\n");
            end
            else begin
                $display("CLOCK MISMATCH");
                $display("CLOCK TEST FAILED\n");
            end
			
            $display("Failed TX data number = %d", error_count);
            $display("Passed TX data number = %d\n", pass_count);
			
            if (error_count == 0 && clk_error_r == 0) begin
                $display("******* SIMULATION PASSED *******\n");
            end 
			else begin
                $display("TIME = %t", $time) ;
                $display("******* TEST FAILED *******\n");
            end
            $stop;
        end// TX STATIC
    end 
end//TX
endgenerate

//Clock delay
initial begin
    @(posedge clk);
        clk_loadn_i      = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);

    if(CLOCK_PATH_DELAY == "FIXED") begin
        clk_fine_dly_r = 0;
        clk_coarse_dly_i = 0;
    end
    else begin
        clk_fine_dly_r = fine_dly_w;
        
        if(DATA_COARSE_DELAY_VALUE == "0NS") begin
            clk_coarse_dly_i = {BUS_WIDTH{2'b00}};
        end
        if(DATA_COARSE_DELAY_VALUE == "0P8NS") begin
            clk_coarse_dly_i = {BUS_WIDTH{2'b01}};
        end
        if(DATA_COARSE_DELAY_VALUE == "1P6NS") begin
            clk_coarse_dly_i = {BUS_WIDTH{2'b10}};
        end
    end

    clk_loadn_i      = 1'b1;
    clk_move_i       = 1'b0;
    clk_direction_i  = 1'b0;

    while(rst_i == 0)
        @(posedge clk, negedge clk);
    while(rst_i == 1)
        @(posedge clk, negedge clk);
    while(sync_done_w !== 1)
        @(posedge clk, negedge clk);
    
    if(INTERFACE_TYPE == "TRANSMIT") begin
        while(rst_dly_r !== 1) begin
            @(posedge clk, negedge clk);
            clk_loadn_i      = 1'b1;
	    end
    end

    clk_direction_i = 1'b0;
    if(CLOCK_PATH_DELAY == "DYNAMIC") begin
        if (INTERFACE_TYPE == "RECEIVE") begin
            for(j=dcntl_o;j<=510;j=j+1) begin
                clk_move_i = {BUS_WIDTH{1'b0}};
                @(posedge clk);
                @(posedge clk);
                    clk_move_i = {BUS_WIDTH{1'b1}};
                @(posedge clk);
                @(posedge clk);
	    		
                //if (j == 511 && clk_cflag_o == 1'b1) begin
                //    $display(" ---------------------------------------------- ");
                //    $display("\t CLOCK OVERFLOW FLAG TEST PASSED: -- %0t fs", $time);
                //    $display(" ---------------------------------------------- ");
                //    clk_error_r = 0;
                //end
				//else if (j == 511 && clk_cflag_o == 1'b0) begin
				//    for(l=0;l<=512;l=l+1) begin
                //        clk_move_i = {BUS_WIDTH{1'b0}};
                //        @(posedge clk);
                //        @(posedge clk);
                //            clk_move_i = {BUS_WIDTH{1'b1}};
                //        @(posedge clk);
                //        @(posedge clk);
				//	    
                //        if (l == 511 && clk_cflag_o == 1'b1) begin
                //            $display(" ---------------------------------------------- ");
                //            $display("\t CLOCK OVERFLOW FLAG TEST PASSED: -- %0t fs", $time);
                //            $display(" ---------------------------------------------- ");
                //            clk_error_r = 0;
                //        end
				//	    else if (l == 511 && clk_cflag_o == 1'b0) begin
                //            $display(" ---------------------------------------------- ");
                //            $display("\tError: CLOCK OVERFLOW FLAG TEST FAILED: -- %0t fs", $time);
                //            $display(" ---------------------------------------------- ");
                //            clk_error_r = 1;
				//        end  
				//		else begin
                //            clk_error_r = 0;
				//		end
                //    end						
				//end
				//else begin
                //    clk_error_r = 0;
				//end
            end
            
			clk_move_i = {BUS_WIDTH{1'b0}};
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
			clk_direction_i = 1'b1;
            @(posedge clk);
            @(posedge clk);
	    	
            for(j=0;j<=510;j=j+1) begin
                clk_move_i = {BUS_WIDTH{1'b0}};
                @(posedge clk);
                @(posedge clk);
                    clk_move_i = {BUS_WIDTH{1'b1}};
                @(posedge clk);
                @(posedge clk);
	    		
                //if (j == 1023 && clk_cflag_o != 1'b1) begin
                //    $display(" ---------------------------------------------- ");
                //    $display("\tERROR: CLOCK UNDERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                //    $display(" ---------------------------------------------- ");
                //    clk_error_r = 1;
                //end
                clk_move_i = {BUS_WIDTH{1'b0}};
            end
        end
        else begin
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            while((clk_cflag_o == 0) && (clk_fine_dly_exp_r < 15875)) begin
                clk_move_i = ~clk_cflag_o;
                @(posedge clk);
                @(posedge clk);
                    clk_move_i = 1'b0;
                @(posedge clk);
                @(posedge clk);
                    clk_fine_dly_exp_r = clk_fine_dly_exp_r + 125;
					
                if(clk_fine_dly_exp_r > 15875) begin
                    $display(" ---------------------------------------------- ");
                    $display("\tERROR: CLOCK OVERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
                end
            end

            clk_direction_i = 1'b1;
			
            for(j=0;j<127;j=j+1) begin
                clk_move_i = {BUS_WIDTH{1'b1}};
                @(posedge clk);
                @(posedge clk);
                    clk_move_i = {BUS_WIDTH{1'b0}};
                @(posedge clk);
                @(posedge clk);
            end
        end
		
        repeat (20) begin
            @(posedge clk);
            @(posedge clk);
        end
		
        clk_loadn_i = 0;
        @(posedge clk);
        @(posedge clk);
            clk_move_i = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
            clk_move_i = 0;
        @(posedge clk);
        @(posedge clk);
            clk_loadn_i = 1;
        @(posedge clk);
        repeat(100) begin // after this time DDRDLL.CODE should be applied.
            @(posedge clk);
        end
        clk_test_done_r = 1;
    end
    else begin
	
    end
    repeat(100) begin // after this time DDRDLL.CODE should be applied.
        @(posedge clk);
    end
    clk_test_done_r = 1;
end


//Expected output clock generation
generate
    if(INTERFACE_TYPE == "TRANSMIT") begin
        if(CLOCK_DATA_RELATION == "CENTERED") begin
            assign #(clk_total_dly_r) clk_o_exp_w = clk90_i;
            assign sclk_o_exp_w = slow_clk_90_w;
        end
        else begin
            if (GEARING == 1) begin
                assign #(clk_total_dly_r+INT_DELAY) clk_o_exp_w = clk_i;
                assign sclk_o_exp_w = 0;
            end
            else begin
                assign #(clk_total_dly_r+INT_DELAY) clk_o_exp_w = clk_i;
                assign sclk_o_exp_w = clk_i;
            end
        end
    end
    else begin
        if(CLOCK_DATA_RELATION == "CENTERED") begin
            if(GEARING == 1) begin
                assign clk_o_exp_w  = 0;
                assign sclk_o_exp_w = clk_i;
            end
            else if (GEARING == 5) begin
                assign clk_o_exp_w  = 0;
                assign sclk_o_exp_w = ~slow_clk_w_r;
            end
            else begin
                assign clk_o_exp_w  = 0;
                assign sclk_o_exp_w = slow_clk_w_r;
            end
        end
        else begin
            if(GEARING == 1) begin
                assign clk_o_exp_w  = 0;
                assign sclk_o_exp_w = slow_clk_90_w_r;
            end
            else begin
                assign clk_o_exp_w  = 0;
                assign sclk_o_exp_w = slow_clk_90_w_r;
            end
        end
    end
endgenerate

generate
    if (INTERFACE_TYPE == "TRANSMIT") begin
        if(GEARING == 2) begin
            always @( * )begin
                data_o_last_r     <= data_o_exp_r_d6;
            end
        end
        else if(GEARING == 4) begin
            always @( * ) begin
                data_o_last_r     <= data_o_exp_r_d16;
             end
        end
        else if(GEARING == 5) begin
            always @( * )  begin
                data_o_last_r     <= data_o_exp_r_d20;
            end
        end
        else begin
            always @( * ) begin
                data_o_last_r     <= data_o_exp_r;
            end
        end
    end
endgenerate

generate
    if (INTERFACE_TYPE == "RECEIVE") begin
        always @(*) begin
            if (data_counter_r == 0) begin
                data_o_expected_r <= data_accumulator_r;
            end
        end
    end
endgenerate

//Expected output data generation
generate
    if (INTERFACE_TYPE == "TRANSMIT") begin
        if (GEARING == 5) begin
            always @(posedge d_clk) begin
                outen_n_i_r[0]    <= outen_n_i;
                outen_n_i_r[1]    <= outen_n_i_r[0];
                outen_n_i_r[2]    <= outen_n_i_r[1];
                outen_n_i_r[3]    <= outen_n_i_r[2];
                data_counter_r <= 4*(OUT_WIDTH + 1);
            end
        end
        if (GEARING < 5 && GEARING > 1) begin
            always @(posedge d_clk) begin
                outen_n_i_r[0]    <= outen_n_i;
                outen_n_i_r[1]    <= outen_n_i_r[0];
                outen_n_i_r[2]    <= outen_n_i_r[1];
                outen_n_i_r[3]    <= outen_n_i_r[2];
                data_counter_r    <= 2*(OUT_WIDTH + 1);
            end
        end
        if (GEARING == 1) begin
            always @(posedge d_clk) begin
                data_counter_r    <= OUT_WIDTH + 1;
            end
        end
    end
endgenerate

generate
    if(INTERFACE_TYPE == "TRANSMIT") begin
	    if ( GEARING == 1 & CLK_PERIOD < 55560 ) begin
            always @ (posedge clk_i, negedge clk_i, posedge rst_i) begin
                if((rst_i == 1) || (rst_dly_r == 0)) begin
                    data_counter_r     <= 0;
			    end
				else begin
				    if(data_counter_r == (IN_WIDTH-OUT_WIDTH)) begin
                        data_counter_r <= 0;
                    end
                    else begin
                        data_counter_r <= data_counter_r + OUT_WIDTH+1;
                    end
				end
			end
		end
		else begin
            always @ (posedge clk_i, negedge clk_i, posedge rst_i) begin
                if((rst_i == 1) || (rst_dly_r == 0)) begin
                    data_counter_r     <=  OUT_WIDTH + 1;
			    end
				else begin
				    if(data_counter_r == (IN_WIDTH-OUT_WIDTH)) begin
                        data_counter_r <= 0;
                    end
                    else begin
                        data_counter_r <= data_counter_r + OUT_WIDTH+1;
                    end
				end
			end
		end
		
        always @ (posedge clk_i, negedge clk_i, posedge rst_i) begin
            if((rst_i == 1) || (rst_dly_r == 0)) begin
                data_accumulator_r <= 0;
                data_o_expected_r  <= 0;
                data_o_exp_r       <= 0;
                data_i_r_0         <= 0;
                data_i_r_1         <= 0;
                data_i_r_2         <= 0;
                data_i_r_3         <= 0;
                data_i_r_4         <= 0;
                data_i_r_5         <= 0;
                data_i_r_6         <= 0;
                data_i_r_7         <= 0;
                data_i_r_8         <= 0;
                data_i_r_9         <= 0;
                data_i_r_10        <= 0;
                data_i_r_11        <= 0;
                data_i_r_12        <= 0;
                data_i_r_13        <= 0;
                data_i_r_14        <= 0;
                data_i_r_15        <= 0;
                data_i_r_16        <= 0;
                data_o_exp_r_d     <= 0;
                data_o_exp_r_d1    <= 0;
                data_o_exp_r_d2    <= 0;
                data_o_exp_r_d3    <= 0;
                data_o_exp_r_d4    <= 0;
                data_o_exp_r_d5    <= 0;
                data_o_exp_r_d6    <= 0;
                data_o_exp_r_d7    <= 0;
                data_o_exp_r_d8    <= 0;
                data_o_exp_r_d9    <= 0;
                data_o_exp_r_d10   <= 0;
                data_o_exp_r_d11   <= 0;
                data_o_exp_r_d12   <= 0;
                data_o_exp_r_d13   <= 0;
                data_o_exp_r_d14   <= 0;
                data_o_exp_r_d15   <= 0;
                data_o_exp_r_d16   <= 0;
                data_o_exp_r_d17   <= 0;
                data_o_exp_r_d18   <= 0;
                data_o_exp_r_d19   <= 0;
                data_o_exp_r_d20   <= 0;
            end
            else begin
                data_i_r_0     <= data_i;
                data_i_r_1     <= data_i_r_0;
                data_i_r_2     <= data_i_r_1;
                data_i_r_3     <= data_i_r_2;
                data_i_r_4     <= data_i_r_3;
                data_i_r_5     <= data_i_r_4;
                data_i_r_6     <= data_i_r_5;
                data_i_r_7     <= data_i_r_6;
                data_i_r_8     <= data_i_r_7;
                data_i_r_9     <= data_i_r_8;
                data_i_r_10    <= data_i_r_9;
                data_i_r_11    <= data_i_r_10;
                data_i_r_12    <= data_i_r_11;
                data_i_r_13    <= data_i_r_12;
                data_i_r_14    <= data_i_r_13;
                data_i_r_15    <= data_i_r_14;
                data_i_r_16    <= data_i_r_15;
                data_o_last_r1 <= data_o_last_r;
                data_o_last_r2 <= data_o_last_r1;
                data_o_last_r3 <= data_o_last_r2;
		    	
                for(k=0; k <= OUT_WIDTH; k=k+1) begin
                    data_o_exp_r[k] <= (GEARING == 1)?data_i_r_4[k + data_counter_r]:
                                                    data_i_r_5[k + data_counter_r];//x2 - 6
		    
                    data_o_exp_r_d   <= data_o_exp_r;
                    data_o_exp_r_d1  <= data_o_exp_r_d;
                    data_o_exp_r_d2  <= data_o_exp_r_d1;
                    data_o_exp_r_d3  <= data_o_exp_r_d2;
                    data_o_exp_r_d4  <= data_o_exp_r_d3;
                    data_o_exp_r_d5  <= data_o_exp_r_d4;
                    data_o_exp_r_d6  <= data_o_exp_r_d5;
                    data_o_exp_r_d7  <= data_o_exp_r_d6;
                    data_o_exp_r_d8  <= data_o_exp_r_d7;
                    data_o_exp_r_d9  <= data_o_exp_r_d8;
                    data_o_exp_r_d10 <= data_o_exp_r_d9;
                    data_o_exp_r_d11 <= data_o_exp_r_d10;
                    data_o_exp_r_d12 <= data_o_exp_r_d11;
                    data_o_exp_r_d13 <= data_o_exp_r_d12;
                    data_o_exp_r_d14 <= data_o_exp_r_d13;
                    data_o_exp_r_d15 <= data_o_exp_r_d14;
                    data_o_exp_r_d16 <= data_o_exp_r_d15;
                    data_o_exp_r_d17 <= data_o_exp_r_d16;
                    data_o_exp_r_d18 <= data_o_exp_r_d17;
                    data_o_exp_r_d19 <= data_o_exp_r_d18;
                    data_o_exp_r_d20 <= data_o_exp_r_d19;
                end
            end
        end
    end
    else begin
        always @ (posedge clk, negedge clk, posedge rst_i) begin
        //always @ (posedge clk_i, negedge clk_i, posedge rst_i) begin
            if((rst_i == 1) /*|| (alignwd_i == 1)*/) begin
                data_counter_r     <= 0;
                data_o_exp_r       <= 0;
                data_accumulator_r <= 0;
                data_o_expected_r  <= 0;
                data_i_r_0         <= 0;
                data_i_r_1         <= 0;
                data_i_r_2         <= 0;
                data_i_r_3         <= 0;
                data_i_r_4         <= 0;
                data_i_r_5         <= 0;
                data_i_r_6         <= 0;
                data_i_r_7         <= 0;
                data_i_r_8         <= 0;
                data_i_r_9         <= 0;
                data_i_r_10        <= 0;
                data_i_r_11        <= 0;
                data_i_r_12        <= 0;
                data_i_r_13        <= 0;
                data_i_r_14        <= 0;
                data_i_r_15        <= 0;
                data_i_r_16        <= 0;
                data_o_exp_end_w   <= 0;
            end
            else begin
                data_counter_r     <= data_counter_r + (IN_WIDTH+1);
				
                for(k=0; k <= IN_WIDTH; k=k+1) begin
                    data_accumulator_r[k+data_counter_r] <= data_end_w[k];
                end
				
                data_i_r_0 <= data_i_r;
                data_i_r_1 <= data_i_r_0;
                data_i_r_2 <= data_i_r_1;
                data_i_r_3 <= data_i_r_2;
                data_i_r_4 <= data_i_r_3;
                data_i_r_5 <= data_i_r_4;
                data_i_r_6 <= data_i_r_5;
                data_i_r_7 <= data_i_r_6;
                data_i_r_8 <= data_i_r_7;
                data_i_r_9 <= data_i_r_8;
                data_i_r_10 <= data_i_r_9;
                data_i_r_11 <= data_i_r_10;
                data_i_r_12 <= data_i_r_11;
                data_i_r_13 <= data_i_r_12;
                data_i_r_14 <= data_i_r_13;
                data_i_r_15 <= data_i_r_14;
                data_i_r_16 <= data_i_r_15;
			end
        end
    end
endgenerate

generate
    if (INTERFACE_TYPE == "RECEIVE") begin 
	    if (DATA_PATH_DELAY == "BYPASS" & GEARING == 1) begin
		    if (CLOCK_DATA_RELATION == "ALIGNED") begin
                for(i=0; i<BUS_WIDTH; i=i+1) begin 
	                assign #(CLK_PERIOD/4 + data_total_dly_r[i]) data_i_r_post_dly[i] = ENABLE_POST_PAR_DLY ? data_i_r_2[i]: {BUS_WIDTH{1'b0}};
		        end
			end
			else begin
                for(i=0; i<BUS_WIDTH; i=i+1) begin 
	                assign #(CLK_PERIOD/2 + data_total_dly_r[i]) data_i_r_post_dly[i] = ENABLE_POST_PAR_DLY ? data_i_r_2[i]: {BUS_WIDTH{1'b0}};
		        end
			end
		end
    end		
endgenerate

generate
    if (INTERFACE_TYPE == "RECEIVE") begin
        always @( data_o) begin
            data_counter_r   <= 0;
        end
    end
endgenerate

generate
    if(GEARING == 2) begin //X2 GEARING
        assign data_end_w = (DATA_PATH_DELAY == "BYPASS")? data_i_r_6 :
                                                           data_i_r_6 ;// INDEL="INPUT_DELAY"
    end
    else if(GEARING == 4) begin //X4 GEARING
        assign data_end_w = (DATA_PATH_DELAY == "BYPASS")? data_i_r_4 :
                                                           data_i_r_4 ;// INDEL="INPUT_DELAY"
    end
    else if(GEARING == 5) begin //X5 GEARING
        assign data_end_w = (DATA_PATH_DELAY == "BYPASS")? data_i_r_6 :
                                                           data_i_r_6 ;// INDEL="INPUT_DELAY"
    end
    else begin
        assign data_end_w = (INTERFACE_TYPE == "RECEIVE" & 
		                     DATA_PATH_DELAY == "BYPASS" & 
							 GEARING == 1 & 
							 ENABLE_POST_PAR_DLY == 1)   ? data_i_r_post_dly :
                                                           data_i_r_2 ;
    end
endgenerate

// PLL Initialization.
generate
    if (1==PLL_ENABLE) begin
        initial begin
            pll_clki_i = 0;
            forever pll_clki_i = #(PLL_REF_CLOCK/2) ~pll_clki_i;
        end
        initial begin
            pll_rstn_i = 0;
            repeat (14) begin
               @(posedge pll_clki_i);
            end
            pll_rstn_i = 1;
        end
    end
endgenerate

//GDDR/RX_SYNC Logic
generate
    if((INCLUDE_GDDR_SYNC == 1) || ((INTERFACE_TYPE == "RECEIVE") && (CLOCK_DATA_RELATION == "ALIGNED"))) begin
        initial begin
            sync_clk_i = 0;
            forever begin
                sync_clk_i = #(SYNC_CLK_PERIOD/2) ~sync_clk_i;
            end
        end
        
        initial begin
            sync_rst_i = 1;
            while(rst_i == 0)
            #1;
            sync_rst_i = 1;
            #1;
            sync_update_i = 1;
            while(rst_i == 1)
            #1;
            @(posedge sync_clk_i);
            @(posedge sync_clk_i);
            @(posedge sync_clk_i);
            @(posedge sync_clk_i);
            @(posedge sync_clk_i);
            sync_rst_i = 0;
        end
        
        initial begin
            sync_update_i = 0;
            sync_done_r   = 0;
            sync_start_i  = 0;
            while(rst_i == 0)
            #1;
            while(rst_i == 1)
            #1;
            while(sync_rst_i == 1)
            #1;
            
            @(posedge sync_clk_i);
            sync_start_i = 1'b1;
            @(posedge sync_clk_i);
            sync_update_i = 0;
            @(posedge sync_clk_i);
            sync_update_i = 0;
            sync_done_r   = 1;
        end        
    end
    else begin
        initial begin
            sync_clk_i    = 0;
            sync_rst_i    = 0;
            sync_start_i  = 0;
            sync_update_i = 0;
            sync_done_r   = 0;
        end
    end
endgenerate


//Expected dynamic fine data delay calculation
generate
    if(DATA_PATH_DELAY == "DYNAMIC") begin
        for(i=0;i<BUS_WIDTH;i=i+1) begin
            always @ (posedge clk) begin
                if(rst_i == 1'b1) begin
                    data_move_r[i] = 1'b0;
                end
                else begin
                    data_move_r[i] <= data_move_i[i];
                    if (!data_loadn_i) begin
                        data_fine_dly_r[i] = fine_dly_w;
                    end
                    if((data_move_i[i] == 1'b1) && (data_move_r[i] == 1'b0)) begin
                        if(data_direction_i[i] == 0) begin
                            if(data_fine_dly_r[i] < 15875) begin
                                data_fine_dly_r[i] = data_fine_dly_r[i]+125;
                            end
                        end
                        else begin
                            if(data_fine_dly_r[i] > 0) begin
                                data_fine_dly_r[i] = data_fine_dly_r[i]-125;
                            end
                        end
                    end
                end
            end
        end
    end
endgenerate

//Expected dynamic fine clock delay calculation
generate
    if(CLOCK_PATH_DELAY == "DYNAMIC") begin
        always @ (posedge clk) begin
            if(rst_i == 1'b1) begin
                clk_move_r = 1'b0;
            end
            else begin
                clk_move_r = clk_move_i;
                if( (clk_move_i == 1'b0 && clk_move_r == 1'b1) ) begin
                    if(clk_direction_i == 0) begin
                        if(clk_fine_dly_r < 15875) begin
                            clk_fine_dly_r = clk_fine_dly_r+125;
                        end
                    end
                    else begin
                        if(clk_fine_dly_r > 0) begin
                            clk_fine_dly_r = clk_fine_dly_r-125;
                        end
                    end
                end
            end
        end
    end
endgenerate

//Expected Total delay calculation
always @ ( * ) begin
    if (INTERFACE_TYPE == "RECEIVE" & DATA_PATH_DELAY == "BYPASS" & GEARING == 1 & ENABLE_POST_PAR_DLY == 1) begin
        if(COARSE_DLY =="0NS") begin
            data_coarse_dly_r = DELAY_00_VAL;
        end
        else if(COARSE_DLY =="0P8NS") begin
            data_coarse_dly_r = DELAY_01_VAL;
        end
        else if(COARSE_DLY =="1P6NS") begin
            data_coarse_dly_r = DELAY_10_VAL;
        end
		else begin
            data_coarse_dly_r = DELAY_00_VAL;
		end
	end
	else begin
        if(data_coarse_dly_i[1:0] == 2'b00) begin
            data_coarse_dly_r = DELAY_00_VAL;
        end
        else if(data_coarse_dly_i[1:0] == 2'b01) begin
            data_coarse_dly_r = DELAY_01_VAL;
        end
        else if(data_coarse_dly_i[1:0] == 2'b10) begin
            data_coarse_dly_r = DELAY_10_VAL;
        end
	end
    
    if(CLOCK_PATH_DELAY == "DYNAMIC") begin
        clk_coarse_dly_r = data_coarse_dly_r;
    end
    else begin
        clk_coarse_dly_r = 0;
    end
    
    if(INTERFACE_TYPE == "TRANSMIT") begin
        for(k=0; k<BUS_WIDTH; k=k+1) begin
            data_total_dly_r[k] <= data_fine_dly_r[k] + data_coarse_dly_r;
            data_o_exp_end_w <= data_o_last_r;
        end
    end
    else begin
        for(k=0; k<BUS_WIDTH; k=k+1) begin
            data_total_dly_r[k] = (data_fine_dly_r[k] + data_coarse_dly_r);
        end
    end
	
    clk_total_dly_r = clk_fine_dly_r + clk_coarse_dly_r;
end

generate
    if (DATA_PATH_DELAY == "DYNAMIC") begin
        always @(posedge clk) begin
            for(k=0; k<BUS_WIDTH; k=k+1) begin
                @(posedge clk);
                if ((data_fine_dly_r[k] == 0 && 1'b1 !== data_cflag_o[k] && fine_dly_w !== 0 )) begin
                    $display(" ---------------------------------------------- ");
                    $display("\tERROR: DATA UNDERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
                    $stop;
                end
            end
        end
    end
endgenerate

generate
    if (CLOCK_PATH_DELAY == "DYNAMIC") begin
        always @(posedge clk) begin
            for(k=0; k<BUS_WIDTH; k=k+1) begin
                @(posedge clk);
                if ( (clk_fine_dly_r == 0 && 1'b1 !== clk_cflag_o && fine_dly_w !== 0 ) ) begin
                    $display(" ---------------------------------------------- ");
                    $display("\tERROR: CLOCK UNDERFLOW FLAG TEST FAIL: -- %0t fs", $time);
                    $display(" ---------------------------------------------- ");
                    $stop;
                end
            end
        end
    end
endgenerate

//Data error generation logic
reg check_start = 0;

always @(posedge sclk_o) begin
    if (|data_o) check_start <= 1'b1; // Ignore the first data.
end

generate
    if(INTERFACE_TYPE == "TRANSMIT") begin
        for(i=0; i<BUS_WIDTH; i=i+1) begin
            always @ ( data_o ) begin
                if (outen_n_i == outen_n_i_r[3] && (rst_i == 1'b0) && (sync_done_w == 1)) begin
                    #1;
                    data_checker(data_i, data_o_exp_td, data_o, pass_count, error_count);
                    if((data_o[i] !== data_o_exp_td[i])) begin
                        data_error_vec_r[i] = 1'b1;
                    end
                    else begin
                        data_error_vec_r[i] = 1'b0;
                    end
                end
            end
        end
    end
    else begin
	    if (GEARING != 1) begin
            always @( data_o_expected_r && alignwd_stop_r == 1'b1 ) begin
                if ((rst_i == 1'b0) && (sync_done_w == 1) && check_start == 1'b1) begin
                    #1;
                    data_checker(data_i, data_o_expected_r, data_o, pass_count, error_count);
                    if((data_o !== data_o_expected_r)) begin
                        data_error_vec_r = 1;
                    end
                    else begin
                        data_error_vec_r = 0;
                    end
                end
            end
		end
		else begin
            always @( data_o_expected_r ) begin
                if ((rst_i == 1'b0) && (sync_done_w == 1) && check_start == 1'b1) begin
                    #1;
                    data_checker(data_i, data_o_expected_r, data_o, pass_count, error_count);
                    if((data_o !== data_o_expected_r)) begin
                        data_error_vec_r = 1;
                    end
                    else begin
                        data_error_vec_r = 0;
                    end
                end
            end
		end
    end
endgenerate

generate
    if (INTERFACE_TYPE == "RECEIVE" || GEARING != 1) begin
        always @(posedge sclk_o) begin
            sclk_o_rising_edge_count <= sclk_o_rising_edge_count+1;
            sclk_o_next_period <= $realtime;
        end
        always @(posedge sclk_o)  begin
            if (sclk_o_rising_edge_count >=1) begin
                sclk_o_exp_period <= ($realtime - sclk_o_next_period);
            end
        end
    end
endgenerate

generate
    if (INTERFACE_TYPE == "TRANSMIT") begin
        always @(posedge clk_o) begin
            clk_o_rising_edge_count <= clk_o_rising_edge_count+1;
            clk_o_next_period <= $realtime;
        end
        always @(posedge clk_o)  begin
            if (clk_o_rising_edge_count >=1) begin
                clk_o_exp_period <= ($realtime - clk_o_next_period);
            end
        end
    end
endgenerate

generate
    if(INTERFACE_TYPE == "RECEIVE") begin
        always @( data_o ) begin
            if((rst_i == 1'b1) || (rst_dly_r == 0) && sync_done_w == 1) begin
                if ((sclk_o_period - sclk_o_exp_period > 100) || (sclk_o_exp_period - sclk_o_period > 100)) begin // 1ps violation depends on period rounding.
                    clk_error_r = 1'b1;
                end
                else begin
                    clk_error_r = 1'b0;
                end
            end
        end
    end
    else begin
        always @ ( * ) begin
            if ((rst_i == 1'b0) && (sync_done_w == 1)) begin
                if((rst_dly_r == 1'b1)) begin
                    clk_error_r = 1'b0;
                end
                else if((sclk_o_period - sclk_o_exp_period > 100) || (sclk_o_exp_period - sclk_o_period > 100) && GEARING!=1) begin // 1ps violation depends on period rounding.
                    clk_error_r = 1'b1;
                end
                else if((clk_o_period - clk_o_exp_period > 100) || (clk_o_exp_period - clk_o_period > 100)) begin // 1ps violation depends on period rounding.
                    clk_error_r = 1'b1;
                end
            end
        end
    end
endgenerate

`include "dut_inst.v"

endmodule
//==============================================================================
// lscc_ddr_tb.v
//==============================================================================
`endif