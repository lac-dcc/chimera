// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
//
// Revision Control Information
//
// $RCSfile: altera_tse_pcs_pma_gige.v,v $
// $Source: /ipbu/cvs/sio/projects/TriSpeedEthernet/src/RTL/Top_level_modules/altera_tse_pcs_pma_gige.v,v $
//
// $Revision: #1 $
// $Date: 2010/04/12 $
// Check in by : $Author: max $
// Author      : Arul Paniandi
//
// Project     : Triple Speed Ethernet
//
// Description : 
//
// Top level PCS + PMA module for Triple Speed Ethernet PCS + PMA

// 
// ALTERA Confidential and Proprietary
// Copyright 2006 (c) Altera Corporation
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
 
(*altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION OFF" } *)
module altera_tse_pcs_pma_gige /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"R102,R105,D102,D101,D103\"" */(
    // inputs:
    address,
    clk,
    gmii_tx_d,
    gmii_tx_en,
    gmii_tx_err,
    gxb_cal_blk_clk,
    gxb_pwrdn_in,
    mii_tx_d,
    mii_tx_en,
    mii_tx_err,
    read,
    reconfig_clk,
    reconfig_togxb,
    ref_clk,
    reset,
    reset_rx_clk,
    reset_tx_clk,
    rxp,
    write,
    writedata,

    // outputs:
    gmii_rx_d,
    gmii_rx_dv,
    gmii_rx_err,
    hd_ena,
    led_an,
    led_char_err,
    led_col,
    led_crs,
    led_disp_err,
    led_link,
    mii_col,
    mii_crs,
    mii_rx_d,
    mii_rx_dv,
    mii_rx_err,
    pcs_pwrdn_out,
    readdata,
    reconfig_fromgxb,
    rx_clk,
    set_10,
    set_100,
    set_1000,
    tx_clk,
	rx_clkena,
	tx_clkena,
    txp,
    waitrequest
);


//  Parameters to configure the core for different variations
//  ---------------------------------------------------------

parameter PHY_IDENTIFIER        = 32'h 00000000; //  PHY Identifier 
parameter DEV_VERSION           = 16'h 0001 ;    //  Customer Phy's Core Version
parameter ENABLE_SGMII          = 1;             //  Enable SGMII logic for synthesis
parameter EXPORT_PWRDN          = 1'b0;          //  Option to export the Alt2gxb powerdown signal
parameter DEVICE_FAMILY         = "ARRIAGX";     //  The device family the the core is targetted for.
parameter TRANSCEIVER_OPTION    = 1'b0;          //  Option to select transceiver block for MAC PCS PMA Instantiation. 
                                                 //  Valid Values are 0 and 1:  0 - GXB (GIGE Mode) 1 - LVDS I/O.
parameter STARTING_CHANNEL_NUMBER = 0;           //  Starting Channel Number for Reconfig block
parameter ENABLE_ALT_RECONFIG   = 0;             //  Option to expose the alt_reconfig ports
parameter SYNCHRONIZER_DEPTH 	= 3;	  	 //  Number of synchronizer

  output  [7:0] gmii_rx_d;
  output  gmii_rx_dv;
  output  gmii_rx_err;
  output  hd_ena;
  output  led_an;
  output  led_char_err;
  output  led_col;
  output  led_crs;
  output  led_disp_err;
  output  led_link;
  output  mii_col;
  output  mii_crs;
  output  [3:0] mii_rx_d;
  output  mii_rx_dv;
  output  mii_rx_err;
  output  pcs_pwrdn_out;
  output  [15:0] readdata;
  output  [16:0] reconfig_fromgxb;
  output  rx_clk;
  output  set_10;
  output  set_100;
  output  set_1000;
  output  tx_clk;
  output  rx_clkena;
  output  tx_clkena;
  output  txp;
  output  waitrequest;
  
  input   [4:0] address;
  input   clk;
  input   [7:0] gmii_tx_d;
  input   gmii_tx_en;
  input   gmii_tx_err;
  input   gxb_pwrdn_in;
  input   gxb_cal_blk_clk;
  input   [3:0] mii_tx_d;
  input   mii_tx_en;
  input   mii_tx_err;
  input   read;
  input   reconfig_clk;
  input   [3:0] reconfig_togxb;
  input   ref_clk;
  input   reset;
  input   reset_rx_clk;
  input   reset_tx_clk;
  input   rxp;
  input   write;
  input   [15:0] writedata;


  wire    PCS_rx_reset;
  wire    PCS_tx_reset;
  wire    PCS_reset;
  wire    gige_pma_reset;
  wire    [7:0] gmii_rx_d;
  wire    gmii_rx_dv;
  wire    gmii_rx_err;
  wire    hd_ena;
  wire    led_an;
  wire    led_char_err;
  wire    led_char_err_gx;
  wire    led_col;
  wire    led_crs;
  wire    led_disp_err;
  wire    led_link;
  wire    link_status;
  wire    mii_col;
  wire    mii_crs;
  wire    [3:0] mii_rx_d;
  wire    mii_rx_dv;
  wire    mii_rx_err;
  wire    pcs_clk;
  wire    [7:0] pcs_rx_frame;
  wire    pcs_rx_kchar;

  wire    [15:0] readdata;
  wire    rx_char_err_gx;
  wire    rx_clk;
  wire    rx_disp_err;
  wire    [7:0] rx_frame;
  wire    rx_syncstatus;
  wire    rx_kchar;
  wire    set_10;
  wire    set_100;
  wire    set_1000;
  wire    tx_clk;
  wire    rx_clkena;
  wire    tx_clkena;
  wire    [7:0] tx_frame;
  wire    tx_kchar;
  wire    txp;
  wire    waitrequest;
  wire    sd_loopback;
  wire    pcs_pwrdn_out_sig;
  wire    gxb_pwrdn_in_sig;

  wire   rx_runlengthviolation;
  wire   rx_patterndetect;
  wire   rx_runningdisp;
  wire   rx_rmfifodatadeleted;
  wire   rx_rmfifodatainserted;
  wire   pcs_rx_rmfifodatadeleted;
  wire   pcs_rx_rmfifodatainserted;
    
  reg     pma_digital_rst0;
  reg     pma_digital_rst1;
  reg     pma_digital_rst2;


  wire    [16:0] reconfig_fromgxb;

    
  
// Reset logic used to reset the PMA blocks
// ----------------------------------------
always @(posedge clk or posedge reset_rx_clk)
   begin
     if (reset_rx_clk == 1)
        begin
          pma_digital_rst0 <= reset_rx_clk;
          pma_digital_rst1 <= reset_rx_clk;
          pma_digital_rst2 <= reset_rx_clk;
        end
     else 
        begin
          pma_digital_rst0 <= reset_rx_clk;
          pma_digital_rst1 <= pma_digital_rst0;
          pma_digital_rst2 <= pma_digital_rst1;
        end
   end



//  Assign the digital reset of the PMA to the PCS logic
//  --------------------------------------------------------
assign PCS_rx_reset = pma_digital_rst2;
assign PCS_tx_reset = reset_tx_clk | pma_digital_rst2;
assign PCS_reset = reset | pma_digital_rst2;



//  Assign the character error and link status to top level leds
//  ------------------------------------------------------------
assign led_char_err = led_char_err_gx;
assign led_link = link_status;



// Instantiation of the PCS core that connects to a PMA
// --------------------------------------------------------
  altera_tse_top_1000_base_x_strx_gx altera_tse_top_1000_base_x_strx_gx_inst
    (
        .rx_carrierdetected(pcs_rx_carrierdetected),
        .rx_rmfifodatadeleted(pcs_rx_rmfifodatadeleted),
        .rx_rmfifodatainserted(pcs_rx_rmfifodatainserted),
        .gmii_rx_d (gmii_rx_d),
        .gmii_rx_dv (gmii_rx_dv),
        .gmii_rx_err (gmii_rx_err),
        .gmii_tx_d (gmii_tx_d),
        .gmii_tx_en (gmii_tx_en),
        .gmii_tx_err (gmii_tx_err),
        .hd_ena (hd_ena),
        .led_an (led_an),
        .led_char_err (led_char_err_gx),
        .led_col (led_col),
        .led_crs (led_crs),
        .led_link (link_status),
        .mii_col (mii_col),
        .mii_crs (mii_crs),
        .mii_rx_d (mii_rx_d),
        .mii_rx_dv (mii_rx_dv),
        .mii_rx_err (mii_rx_err),
        .mii_tx_d (mii_tx_d),
        .mii_tx_en (mii_tx_en),
        .mii_tx_err (mii_tx_err),
        .powerdown (pcs_pwrdn_out_sig),
        .reg_addr (address),
        .reg_busy (waitrequest),
        .reg_clk (clk),
        .reg_data_in (writedata),
        .reg_data_out (readdata),
        .reg_rd (read),
        .reg_wr (write),
        .reset_reg_clk (PCS_reset),
        .reset_rx_clk (PCS_rx_reset),
        .reset_tx_clk (PCS_tx_reset),
        .rx_clk (rx_clk),
        .rx_clkout (pcs_clk),
        .rx_frame (pcs_rx_frame),
        .rx_kchar (pcs_rx_kchar),
        .sd_loopback (sd_loopback),
        .set_10 (set_10),
        .set_100 (set_100),
        .set_1000 (set_1000),
        .tx_clk (tx_clk),
		.rx_clkena(rx_clkena),
	    .tx_clkena(tx_clkena),
		.ref_clk(1'b0),
        .tx_clkout (pcs_clk),
        .tx_frame (tx_frame),
        .tx_kchar (tx_kchar)

    );    
    defparam
        altera_tse_top_1000_base_x_strx_gx_inst.PHY_IDENTIFIER = PHY_IDENTIFIER,
        altera_tse_top_1000_base_x_strx_gx_inst.DEV_VERSION = DEV_VERSION,
        altera_tse_top_1000_base_x_strx_gx_inst.ENABLE_SGMII = ENABLE_SGMII;



// Export powerdown signal or wire it internally
// ---------------------------------------------
generate if (EXPORT_PWRDN == 1)
    begin          
        assign gxb_pwrdn_in_sig = gxb_pwrdn_in;
        assign pcs_pwrdn_out = pcs_pwrdn_out_sig;
    end
else
    begin
        assign gxb_pwrdn_in_sig = pcs_pwrdn_out_sig;
		assign pcs_pwrdn_out = 1'b0;
    end      
endgenerate




// Instantiation of the Alt2gxb block as the PMA for Stratix_II_GX and ArriaGX devices
// ----------------------------------------------------------------------------------- 

    // Aligned Rx_sync from gxb
    // -------------------------------
    altera_tse_gxb_aligned_rxsync the_altera_tse_gxb_aligned_rxsync
      (
        .clk(pcs_clk),
        .reset(PCS_rx_reset),
        //input (from alt2gxb)
        .alt_dataout(rx_frame),
        .alt_sync(rx_syncstatus),
        .alt_disperr(rx_disp_err),
        .alt_ctrldetect(rx_kchar),
        .alt_errdetect(rx_char_err_gx),
        .alt_rmfifodatadeleted(rx_rmfifodatadeleted),
        .alt_rmfifodatainserted(rx_rmfifodatainserted),
        .alt_runlengthviolation(rx_runlengthviolation),
        .alt_patterndetect(rx_patterndetect),
        .alt_runningdisp(rx_runningdisp),

        //output (to PCS)
        .altpcs_dataout(pcs_rx_frame),
        .altpcs_sync(link_status),
        .altpcs_disperr(led_disp_err),
        .altpcs_ctrldetect(pcs_rx_kchar),
        .altpcs_errdetect(led_char_err_gx),
        .altpcs_rmfifodatadeleted(pcs_rx_rmfifodatadeleted),
        .altpcs_rmfifodatainserted(pcs_rx_rmfifodatainserted),
        .altpcs_carrierdetect(pcs_rx_carrierdetected)

       ) ;
       defparam
           the_altera_tse_gxb_aligned_rxsync.DEVICE_FAMILY = DEVICE_FAMILY;		



    // Altgxb in GIGE mode
    // --------------------
    altera_tse_gxb_gige_inst the_altera_tse_gxb_gige_inst
      (
        .cal_blk_clk (gxb_cal_blk_clk),
        .gxb_powerdown (gxb_pwrdn_in_sig),
        .pll_inclk (ref_clk),
        .reconfig_clk(reconfig_clk),
        .reconfig_togxb(reconfig_togxb),
        .reconfig_fromgxb(reconfig_fromgxb),
        .rx_analogreset (reset),
        .rx_cruclk (ref_clk),
        .rx_ctrldetect (rx_kchar),
        .rx_datain (rxp),
        .rx_dataout (rx_frame),
        .rx_digitalreset (pma_digital_rst2),
        .rx_disperr (rx_disp_err),
        .rx_errdetect (rx_char_err_gx),
        .rx_patterndetect (rx_patterndetect),
        .rx_rlv (rx_runlengthviolation),
        .rx_seriallpbken (sd_loopback),
        .rx_syncstatus (rx_syncstatus),
        .tx_clkout (pcs_clk),
        .tx_ctrlenable (tx_kchar),
        .tx_datain (tx_frame),
        .tx_dataout (txp),
        .tx_digitalreset (pma_digital_rst2),
        .rx_rmfifodatadeleted(rx_rmfifodatadeleted),
        .rx_rmfifodatainserted(rx_rmfifodatainserted),
        .rx_runningdisp(rx_runningdisp)

      );
      defparam
          the_altera_tse_gxb_gige_inst.ENABLE_ALT_RECONFIG = ENABLE_ALT_RECONFIG,
          the_altera_tse_gxb_gige_inst.STARTING_CHANNEL_NUMBER = STARTING_CHANNEL_NUMBER,
          the_altera_tse_gxb_gige_inst.DEVICE_FAMILY = DEVICE_FAMILY;




endmodule

