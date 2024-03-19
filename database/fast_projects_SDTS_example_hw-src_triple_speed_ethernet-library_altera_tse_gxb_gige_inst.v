// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
//
// Revision Control Information
//
// $RCSfile: altera_tse_gxb_gige_inst.v,v $
// $Source: /ipbu/cvs/sio/projects/TriSpeedEthernet/src/RTL/Top_level_modules/altera_tse_gxb_gige_inst.v,v $
//
// $Revision: #1 $
// $Date: 2010/04/12 $
// Check in by : $Author: max $
// Author      : Siew Kong NG
//
// Project     : Triple Speed Ethernet - 1000 BASE-X PCS
//
// Description : 
//
// Instantiation for Alt2gxb, Alt4gxb

// 
// ALTERA Confidential and Proprietary
// Copyright 2007 (c) Altera Corporation
// All rights reserved
//
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

module altera_tse_gxb_gige_inst (
	cal_blk_clk,
	gxb_powerdown,
	pll_inclk,
	reconfig_clk,
	reconfig_togxb,	
	rx_analogreset,
	rx_cruclk,
	rx_datain,
	rx_digitalreset,
	rx_seriallpbken,
	tx_ctrlenable,
	tx_datain,
	tx_digitalreset,
	reconfig_fromgxb,
	rx_ctrldetect,
	rx_dataout,
	rx_disperr,
	rx_errdetect,
	rx_patterndetect,
	rx_rlv,
	rx_syncstatus,
	tx_clkout,
	tx_dataout,
	rx_rmfifodatadeleted,
	rx_rmfifodatainserted,
	rx_runningdisp
);
parameter DEVICE_FAMILY           = "ARRIAGX";    //  The device family the the core is targetted for.
parameter STARTING_CHANNEL_NUMBER = 0;
parameter ENABLE_ALT_RECONFIG     = 0;


	input	cal_blk_clk;
	input	gxb_powerdown;
	input	pll_inclk;
	input	reconfig_clk;
	input	[3:0]  reconfig_togxb;	
	input	rx_analogreset;
	input	rx_cruclk;
	input	rx_datain;
	input	rx_digitalreset;
	input	rx_seriallpbken;
	input	tx_ctrlenable;
	input	[7:0]  tx_datain;
	input	tx_digitalreset;
	output	[16:0]  reconfig_fromgxb;	
	output	rx_ctrldetect;
	output	[7:0]  rx_dataout;
	output	rx_disperr;
	output	rx_errdetect;
	output	rx_patterndetect;
	output	rx_rlv;
	output	rx_syncstatus;
	output	tx_clkout;
	output	tx_dataout;
	output	rx_rmfifodatadeleted;
	output	rx_rmfifodatainserted;
	output	rx_runningdisp;

	
	wire    [16:0] reconfig_fromgxb;
        wire    [2:0]  reconfig_togxb_alt2gxb;
        wire    reconfig_fromgxb_alt2gxb;
        wire    wire_reconfig_clk;
        wire    [3:0] wire_reconfig_togxb;

        (* altera_attribute = "-name MESSAGE_DISABLE 10036" *) 
        wire    [16:0] wire_reconfig_fromgxb;


        generate if (ENABLE_ALT_RECONFIG == 0)
            begin
            
                assign wire_reconfig_clk = 1'b0;
                assign wire_reconfig_togxb = 4'b0010;
                assign reconfig_fromgxb = {17{1'b0}};        
    
            end
        else
            begin

                assign wire_reconfig_clk = reconfig_clk;
                assign wire_reconfig_togxb = reconfig_togxb;
                assign reconfig_fromgxb = wire_reconfig_fromgxb;
 
            end
        endgenerate

	
	generate if ( DEVICE_FAMILY == "STRATIXIIGX" || DEVICE_FAMILY == "ARRIAGX")
	begin
	
          altera_tse_alt2gxb_gige the_altera_tse_alt2gxb_gige
          (
            .cal_blk_clk (cal_blk_clk),
            .gxb_powerdown (gxb_powerdown),
            .pll_inclk (pll_inclk),
            .reconfig_clk(wire_reconfig_clk),
            .reconfig_togxb(reconfig_togxb_alt2gxb),
            .reconfig_fromgxb(reconfig_fromgxb_alt2gxb), 
            .rx_analogreset (rx_analogreset),
            .rx_cruclk (rx_cruclk),
            .rx_ctrldetect (rx_ctrldetect),
            .rx_datain (rx_datain),
            .rx_dataout (rx_dataout),
            .rx_digitalreset (rx_digitalreset),
            .rx_disperr (rx_disperr),
            .rx_errdetect (rx_errdetect),
            .rx_patterndetect (rx_patterndetect),
            .rx_rlv (rx_rlv),
            .rx_seriallpbken (rx_seriallpbken),
            .rx_syncstatus (rx_syncstatus),
            .tx_clkout (tx_clkout),
            .tx_ctrlenable (tx_ctrlenable),
            .tx_datain (tx_datain),
            .tx_dataout (tx_dataout),
            .tx_digitalreset (tx_digitalreset),
            .rx_rmfifodatadeleted(rx_rmfifodatadeleted),
            .rx_rmfifodatainserted(rx_rmfifodatainserted),
            .rx_runningdisp(rx_runningdisp)
          );
          defparam
              the_altera_tse_alt2gxb_gige.starting_channel_number = STARTING_CHANNEL_NUMBER,
              the_altera_tse_alt2gxb_gige.ENABLE_ALT_RECONFIG = ENABLE_ALT_RECONFIG;


          assign reconfig_togxb_alt2gxb = wire_reconfig_togxb[2:0];
          assign wire_reconfig_fromgxb = {{16{1'b0}}, reconfig_fromgxb_alt2gxb};          
	
	end
	endgenerate

	generate if ( DEVICE_FAMILY == "STRATIXIV" || DEVICE_FAMILY == "HARDCOPYIV" || DEVICE_FAMILY == "ARRIAIIGX")
	begin
	
          altera_tse_alt4gxb_gige the_altera_tse_alt4gxb_gige
          (
            .cal_blk_clk (cal_blk_clk),
            .fixedclk(wire_reconfig_clk),
            .fixedclk_fast(1'b0),
            .gxb_powerdown (gxb_powerdown),            
            .pll_inclk (pll_inclk),
            .reconfig_clk(wire_reconfig_clk),
            .reconfig_togxb(wire_reconfig_togxb),
            .reconfig_fromgxb(wire_reconfig_fromgxb),       
            .rx_analogreset (rx_analogreset),
            .rx_cruclk (rx_cruclk),
            .rx_ctrldetect (rx_ctrldetect),
            .rx_datain (rx_datain),
            .rx_dataout (rx_dataout),
            .rx_digitalreset (rx_digitalreset),
            .rx_disperr (rx_disperr),
            .rx_errdetect (rx_errdetect),
            .rx_patterndetect (rx_patterndetect),
            .rx_rlv (rx_rlv),
            .rx_seriallpbken (rx_seriallpbken),
            .rx_syncstatus (rx_syncstatus),
            .tx_clkout (tx_clkout),
            .tx_ctrlenable (tx_ctrlenable),
            .tx_datain (tx_datain),
            .tx_dataout (tx_dataout),
            .tx_digitalreset (tx_digitalreset),
            .rx_rmfifodatadeleted(rx_rmfifodatadeleted),
            .rx_rmfifodatainserted(rx_rmfifodatainserted),
            .rx_runningdisp(rx_runningdisp)
          );
          defparam
              the_altera_tse_alt4gxb_gige.starting_channel_number = STARTING_CHANNEL_NUMBER;              
	
	end
	endgenerate
	
	
	generate if ( DEVICE_FAMILY == "CYCLONEIVGX")
	begin
	
          altera_tse_altgx_civgx_gige the_altera_tse_alt_gx_civgx
          (
            .cal_blk_clk (cal_blk_clk),
            .gxb_powerdown (gxb_powerdown),
            .pll_inclk (pll_inclk),
	    .reconfig_clk(wire_reconfig_clk),
            .reconfig_togxb(wire_reconfig_togxb),
            .rx_analogreset (rx_analogreset),
            .rx_ctrldetect (rx_ctrldetect),
            .rx_datain (rx_datain),
            .rx_dataout (rx_dataout),
            .rx_digitalreset (rx_digitalreset),
            .rx_disperr (rx_disperr),
            .rx_errdetect (rx_errdetect),
            .rx_patterndetect (rx_patterndetect),
            .rx_rlv (rx_rlv),
            .rx_syncstatus (rx_syncstatus),
            .tx_clkout (tx_clkout),
            .tx_ctrlenable (tx_ctrlenable),
            .tx_datain (tx_datain),
            .tx_dataout (tx_dataout),
            .tx_digitalreset (tx_digitalreset),
            .reconfig_fromgxb(wire_reconfig_fromgxb[4:0]),
            .rx_rmfifodatadeleted(rx_rmfifodatadeleted),
            .rx_rmfifodatainserted(rx_rmfifodatainserted),
            .rx_runningdisp(rx_runningdisp)			
          );
		  defparam
              the_altera_tse_alt_gx_civgx.starting_channel_number = STARTING_CHANNEL_NUMBER;          
	end
	endgenerate
	
endmodule
