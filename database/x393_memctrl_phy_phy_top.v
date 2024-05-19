// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>phy_top
 * @file phy_top.v
 * @date 2014-04-30  
 * @author Andrey Filippov
 *
 * @brief Top module of the DDR3 phy
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * phy_top.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  phy_top.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  phy_top #(
    parameter IOSTANDARD_DQ =   "SSTL15_T_DCI",
    parameter IOSTANDARD_DM =   "SSTL15",
    parameter IOSTANDARD_DQS =  "DIFF_SSTL15_T_DCI",
    parameter IOSTANDARD_CMDA = "SSTL15",
    parameter IOSTANDARD_CLK = "DIFF_SSTL15",
    parameter SLEW_DQ =         "SLOW",
    parameter SLEW_DQS =        "SLOW",
    parameter SLEW_CMDA =       "SLOW",
    parameter SLEW_CLK =       "SLOW",
    parameter IBUF_LOW_PWR =    "TRUE",
    parameter IODELAY_GRP =     "IODELAY_MEMORY",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter integer ADDRESS_NUMBER= 15,
    parameter PHASE_WIDTH           = 8,
    parameter BANDWIDTH =     "OPTIMIZED",
    // Assuming 100MHz input clock, 800MHz Fvco, 400MHz clk, 200MHz clk_div, 200MHz mclk 
    parameter CLKIN_PERIOD          = 10, //ns >1.25, 600<Fvco<1200
    parameter CLKFBOUT_MULT =       8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
    parameter DIVCLK_DIVIDE=        1,
    parameter CLKFBOUT_USE_FINE_PS =1, // if 1 move CLKFBOUT_PHASE and SDCLK_PHASE, if 0 - other outputs (moved phases should be 0/same)
    parameter CLKFBOUT_PHASE =      0.000,
    parameter SDCLK_PHASE =         0.000,
    parameter CLK_PHASE =           0.000,
    parameter CLK_DIV_PHASE =       0.000,
    parameter MCLK_PHASE =          90.000,  
    parameter REF_JITTER1 =         0.010,
    parameter SS_EN =              "FALSE",
    parameter SS_MODE =      "CENTER_HIGH",
    parameter SS_MOD_PERIOD =       10000
)(
    output                       ddr3_nrst, // output NRST port
    output                       ddr3_clk, // DDR3 clock differential output, positive
    output                       ddr3_nclk,// DDR3 clock differential output, negative
    output  [ADDRESS_NUMBER-1:0] ddr3_a,   // output address ports (14:0) for 4Gb device
    output                 [2:0]ddr3_ba,  // output bank address ports
    output                       ddr3_we,  // output WE port
    output                       ddr3_ras, // output RAS port
    output                       ddr3_cas, // output CAS port
    output                       ddr3_cke, // output Clock Enable port
    output                       ddr3_odt, // output ODT port

    inout                 [15:0] dq,       // DQ  I/O pads
    output                       dml,      // LDM  I/O pad (actually only output)
    inout                        dqsl,     // LDQS I/O pad
    inout                        ndqsl,    // ~LDQS I/O pad
    output                       dmu,      // UDM  I/O pad (actually only output)
    inout                        dqsu,     // UDQS I/O pad
    inout                        ndqsu,    // ~UDQS I/O pad
    
    input                        clk_in,   // master input clock, initially assuming 100MHz
    output                       clk,      // free-running system clock, same frequency as iclk (shared for R/W),     BUFR output
    output                       clk_div,  // free-running half clk frequency, front aligned to clk (shared for R/W), BUFR output
    output                       mclk,     // same as clk_div, through separate BUFG and static phase adjust
    input                        mrst,     // @posedge mclk synchronous reset - should not interrupt mclk generation
    input                        ref_clk,  // global clock for idelay_ctrl calibration
    output                       idelay_ctrl_reset,
    input                        rst_in,   // reset delays/serdes - global reset?
    input                        ddr_rst,  // active high - generate NRST to memory
    input                        dci_rst,  // active high - reset DCI circuitry
    input                        dly_rst,  // active high - delay calibration circuitry
     
    input [2*ADDRESS_NUMBER-1:0] in_a,     // input address, 2 bits per signal (first, second) (29:0) for 4Gb device
    input                  [5:0] in_ba,    // input bank address, 2 bits per signal (first, second)
    input                  [1:0] in_we,    // input WE, 2 bits (first, second)
    input                  [1:0] in_ras,   // input RAS, 2 bits (first, second)
    input                  [1:0] in_cas,   // input CAS, 2 bits (first, second)
    input                  [1:0] in_cke,   // input CKE, 2 bits (first, second)
    input                  [1:0] in_odt,   // input ODT, 2 bits (first, second)
//    input                  [1:0] in_tri,   // tristate command/address outputs - same timing, but no odelay
    input                        in_tri,   // tristate command/address outputs - same timing, but no odelay
    
    input                 [63:0] din,             // parallel data to be sent out (4 bits per DG I/))
    input                  [7:0] din_dm,          // parallel data to be sent out over DM
    input                  [7:0] tin_dq,          // tristate for data out (sent out earlier than data!) and dm 
    input                  [7:0] din_dqs,         // parallel data to be sent out over DQS
    input                  [7:0] tin_dqs,         // tristate for DQS out (sent out earlier than data!) 
    output                [63:0] dout,            // parallel data received from DDR3 memory, 4 bits per DQ I/O
    
    
    input                        inv_clk_div,     // invert clk_div for R channels (clk_div is shared between R and W)
    input                        dci_disable_dqs, // disable DCI termination during writes and idle for dqs
    input                        dci_disable_dq,  // disable DCI termination during writes and idle for dq and dm signals
    
    input                  [7:0] dly_data, // delay value (3 LSB - fine delay)
    input                  [6:0] dly_addr, // select which delay to program
    input                        ld_delay, // load delay data to selected iodelayl (clk_div synchronous)
    input                        set,       // clk_div synchronous set all delays from previously loaded values
//    output                       locked,
    output                       locked_mmcm,
    output                       locked_pll,
    output                       dly_ready,
    output                       dci_ready,
    output               [7:0]   tmp_debug,
    output                       ps_rdy,
    output     [PHASE_WIDTH-1:0] ps_out 
);
  assign locked_pll = 1; // not used anymore, reference clock generation moved to other module
  reg rst= 1'b1;

  always @(posedge clk_div) begin // Why is it @ negedge clk_div?
    if (mrst) rst <= 1'b1;
    else      rst <= 1'b0;
  end

  wire  ld_data_l = (dly_addr[6:5] == 2'h0) && ld_delay ;             
  wire  ld_data_h = (dly_addr[6:5] == 2'h1) && ld_delay ;             
  wire  ld_cmda =   (dly_addr[6:5] == 2'h2) && ld_delay ;             
  wire  ld_mmcm=    (dly_addr[6:0] == 7'h60) && ld_delay ;
//  wire  clkfb_ref, clk_ref_pre; 

  wire clkin_stopped_mmcm;
  wire clkfb_stopped_mmcm;
  
  
  reg dbg1=0;
  reg dbg2=0;

  always @ (posedge mclk) begin
    if (mrst) dbg1 <= 0;
    else     dbg1 <= ~dbg1;
  end

  always @ (posedge clk_div) begin
    if (mrst) dbg2 <= 0;
    else dbg2 <= ~dbg2;
  end


  assign tmp_debug ={
    dbg2, //dly_addr[1],
    dbg1, //dly_addr[0],
    clkin_stopped_mmcm,
    clkfb_stopped_mmcm,
    ddr_rst,
    mrst, // rst_in, rst_in - is it global clock?
    dci_rst,
    dly_rst
  };

/* memory reset */
    obuf #(
        .CAPACITANCE("DONT_CARE"),
        .DRIVE(12),
        .IOSTANDARD(IOSTANDARD_CMDA),
        .SLEW("SLOW")
    ) obuf_i (
        .O(ddr3_nrst), // output
        .I(~ddr_rst)   // input
    );
  
  cmd_addr #(
    .IODELAY_GRP(IODELAY_GRP),
    .IOSTANDARD(IOSTANDARD_CMDA),
    .SLEW(SLEW_CMDA),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
    .ADDRESS_NUMBER(ADDRESS_NUMBER)
  ) cmd_addr_i(
    .ddr3_a   (ddr3_a[ADDRESS_NUMBER-1:0]), // output address ports (14:0) for 4Gb device
    .ddr3_ba  (ddr3_ba[2:0]),             // output bank address ports
    .ddr3_we  (ddr3_we),                 // output WE port
    .ddr3_ras (ddr3_ras),                // output RAS port
    .ddr3_cas (ddr3_cas),                // output CAS port
    .ddr3_cke (ddr3_cke),                // output Clock Enable port
    .ddr3_odt (ddr3_odt),                // output ODT port
    .clk      (clk),                     // free-running system clock, same frequency as iclk (shared for R/W)
    .clk_div  (clk_div),                 // free-running half clk frequency, front aligned to clk (shared for R/W)
    .rst      (rst),                     // reset delays/serdes
    .in_a     (in_a[2*ADDRESS_NUMBER-1:0]), // input address, 2 bits per signal (first, second) (29:0) for 4Gb device
    .in_ba    (in_ba[5:0]),              // input bank address, 2 bits per signal (first, second)
    .in_we    (in_we[1:0]),              // input WE, 2 bits (first, second)
    .in_ras   (in_ras[1:0]),             // input RAS, 2 bits (first, second)
    .in_cas   (in_cas[1:0]),             // input CAS, 2 bits (first, second)
    .in_cke   (in_cke[1:0]),             // input CKE, 2 bits (first, second)
    .in_odt   (in_odt[1:0]),             // input ODT, 2 bits (first, second)
//    .in_tri   (in_tri[1:0]),             // tristate command/address outputs - same timing, but no odelay
    .in_tri   (in_tri),             // tristate command/address outputs - same timing, but no odelay
    .dly_data (dly_data[7:0]),           // delay value (3 LSB - fine delay)
    .dly_addr (dly_addr[4:0]),           // select which delay to program
    .ld_delay (ld_cmda),               // load delay data to selected iodelayl (clk_div synchronous)
    .set      (set)                      // clk_div synchronous set all delays from previously loaded values
);

  byte_lane #(
    .IODELAY_GRP     (IODELAY_GRP),
    .IBUF_LOW_PWR    (IBUF_LOW_PWR),
    .IOSTANDARD_DQ   (IOSTANDARD_DQ),
    .IOSTANDARD_DM   (IOSTANDARD_DM),
    .IOSTANDARD_DQS  (IOSTANDARD_DQS),
    .SLEW_DQ         (SLEW_DQ),
    .SLEW_DQS        (SLEW_DQS),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
  ) byte_lane0_i (
    .dq              (dq[7:0]),          // DQ  I/O pads
    .dm              (dml),              // DM  I/O pad (actually only output)
    .dqs             (dqsl),             //  DQS I/O pad
    .ndqs            (ndqsl),            // ~DQS I/O pad
    .clk             (clk),              // free-running system clock, same frequency as iclk (shared for R/W)
    .clk_div         (clk_div),          // free-running half clk frequency, front aligned to clk (shared for R/W)
    .inv_clk_div     (inv_clk_div),      // invert clk_div for R channels (clk_div is shared between R and W)
    .rst             (rst),
    .dci_disable_dqs (dci_disable_dqs),  // disable DCI termination during writes and idle for dqs
    .dci_disable_dq  (dci_disable_dq),   // disable DCI termination during writes and idle for dq and dm signals
    .din             (din[31:0]),        // parallel data to be sent out (4 bits per DQ I/O))
    .din_dm          (din_dm[3:0]),      // parallel data to be sent out over DM
    .tin_dq          (tin_dq[3:0]),      // tristate for data out (sent out earlier than data!) and dm 
    .din_dqs         (din_dqs[3:0]),     // parallel data to be sent out over DQS
    .tin_dqs         (tin_dqs[3:0]),     // tristate for DQS out (sent out earlier than data!) 
    .dout            (dout[31:0]),       // parallel data received from DDR3 memory, 4 bits per DQ I/O
    .dly_data        (dly_data[7:0]),    // delay value (3 LSB - fine delay)
    .dly_addr        (dly_addr[4:0]),    // select which delay to program
    .ld_delay        (ld_data_l),        // load delay data to selected iodelayl (clk_div synchronous)
    .set             (set)               // clk_div synchronous set all delays from previously loaded values
);

  byte_lane #(
    .IODELAY_GRP     (IODELAY_GRP),
    .IBUF_LOW_PWR    (IBUF_LOW_PWR),
    .IOSTANDARD_DQ   (IOSTANDARD_DQ),
    .IOSTANDARD_DM   (IOSTANDARD_DM),
    .IOSTANDARD_DQS  (IOSTANDARD_DQS),
    .SLEW_DQ         (SLEW_DQ),
    .SLEW_DQS        (SLEW_DQS),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
  ) byte_lane1_i (
    .dq              (dq[15:8]),         // DQ  I/O pads
    .dm              (dmu),              // DM  I/O pad (actually only output)
    .dqs             (dqsu),             //  DQS I/O pad
    .ndqs            (ndqsu),            // ~DQS I/O pad
    .clk             (clk),              // free-running system clock, same frequency as iclk (shared for R/W)
    .clk_div         (clk_div),          // free-running half clk frequency, front aligned to clk (shared for R/W)
    .inv_clk_div     (inv_clk_div),      // invert clk_div for R channels (clk_div is shared between R and W)
    .rst             (rst),
    .dci_disable_dqs (dci_disable_dqs),  // disable DCI termination during writes and idle for dqs
    .dci_disable_dq  (dci_disable_dq),   // disable DCI termination during writes and idle for dq and dm signals
    .din             (din[63:32]),       // parallel data to be sent out (4 bits per DQ I/O))
    .din_dm          (din_dm[7:4]),      // parallel data to be sent out over DM
    .tin_dq          (tin_dq[7:4]),      // tristate for data out (sent out earlier than data!) and dm 
    .din_dqs         (din_dqs[7:4]),     // parallel data to be sent out over DQS
    .tin_dqs         (tin_dqs[7:4]),     // tristate for DQS out (sent out earlier than data!) 
    .dout            (dout[63:32]),      // parallel data received from DDR3 memory, 4 bits per DQ I/O
    .dly_data        (dly_data[7:0]),    // delay value (3 LSB - fine delay)
    .dly_addr        (dly_addr[4:0]),    // select which delay to program
    .ld_delay        (ld_data_h),        // load delay data to selected iodelayl (clk_div synchronous)
    .set             (set)               // clk_div synchronous set all delays from previously loaded values
);
//ddr3_clk
wire sdclk; // BUFIO
    oddr_ds #(
        .IOSTANDARD(IOSTANDARD_CLK),
        .SLEW(SLEW_CLK)
    ) oddr_ds_i (
        .clk(sdclk), // input
        .ce(1'b1), // input
        .rst(1'b0), //rst_n_clk), // input no need to reset?
        .set(1'b0), // input
        .din(2'b01), // input[1:0] 
        .tin(rst),   // tristate at reset
        .dq(ddr3_clk), // output
        .ndq(ddr3_nclk) // output
    );
// Clocks: MMCM is used to generate ddr3 differential clock (no dynamic phase shift),
// clk - write bit clock, phase dynamically adjusted, BUFR (initially 400MHz)
// clk_div  half bit frequency clock, phase dynamically adjusted, BUFR. Used also for delay/phase control (200MHz)
// mclk - same frequency as clk_div (same dynamic phase adjust), but with BUFG to be used in other regions. Phase to be
// statically adjusted for clock boundary crossing
// Phase control included, allowing setting phase in +/- 127 steps, each 1/56 of 1/Fvco (~22ps for Fvco=800MHz)
// So shifting phase dynamically by plus/- 113 moves SDCLK by a full period (2.5ns) forward and backward (113= 0x71)
wire clk_pre, clk_div_pre, sdclk_pre, mclk_pre, clk_fb;
BUFR clk_bufr_i (.O(clk), .CE(), .CLR(), .I(clk_pre));
//BUFIO clk_buf_i (.O(clk), .I(clk_pre));
BUFR clk_div_bufr_i (.O(clk_div), .CE(), .CLR(), .I(clk_div_pre));
BUFIO iclk_bufio_i (.O(sdclk), .I(sdclk_pre) );
///BUFG clk_ref_i (.O(ref_clk), .I(clk_ref_pre));
BUFG mclk_i (.O(mclk),.I(mclk_pre) );
    mmcm_phase_cntr #(
        .PHASE_WIDTH         (PHASE_WIDTH),
        .CLKIN_PERIOD        (CLKIN_PERIOD),
        .BANDWIDTH           (BANDWIDTH),
        .CLKFBOUT_MULT_F     (CLKFBOUT_MULT),
        .DIVCLK_DIVIDE       (DIVCLK_DIVIDE),
        .CLKFBOUT_PHASE      (CLKFBOUT_USE_FINE_PS? 0.0 :           CLKFBOUT_PHASE),
        .CLKOUT0_PHASE       (CLKFBOUT_USE_FINE_PS? 0.0 :           SDCLK_PHASE),
        .CLKOUT1_PHASE       (CLKFBOUT_USE_FINE_PS? CLK_PHASE :     0.0),
        .CLKOUT2_PHASE       (CLKFBOUT_USE_FINE_PS? CLK_DIV_PHASE : 0.0),
        .CLKOUT3_PHASE       (CLKFBOUT_USE_FINE_PS? MCLK_PHASE :   90.000), // (78.75), // (MCLK_PHASE), // should be multiple of 11.25 (90.000/8)
//ERROR: [DRC 23-20] Rule violation (AVAL-139) Phase shift check - The MMCME2_ADV cell mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/mmcm_phase_cntr_i/MMCME2_ADV_i has a fractional CLKOUT3_PHASE value (75.000)  with CLKOUT3_USE_FINE_PS set to FALSE. It should be a multiple of [45 / CLKOUT3_DIVIDE] = [45 / 4] = 11.250.
        
//        .CLKOUT4_PHASE          (0.000),
//        .CLKOUT5_PHASE          (0.000),
//        .CLKOUT6_PHASE          (0.000),
        .CLKFBOUT_USE_FINE_PS (CLKFBOUT_USE_FINE_PS? "TRUE" : "FALSE"),
        .CLKOUT0_USE_FINE_PS  (CLKFBOUT_USE_FINE_PS? "TRUE" : "FALSE"),
        .CLKOUT1_USE_FINE_PS  (CLKFBOUT_USE_FINE_PS? "FALSE" : "TRUE"),
        .CLKOUT2_USE_FINE_PS  (CLKFBOUT_USE_FINE_PS? "FALSE" : "TRUE"),
        .CLKOUT3_USE_FINE_PS  (CLKFBOUT_USE_FINE_PS? "FALSE" : "TRUE"),
//        .CLKOUT4_USE_FINE_PS("FALSE"),
//        .CLKOUT5_USE_FINE_PS("FALSE"),
//        .CLKOUT6_USE_FINE_PS("FALSE"),
        .CLKOUT0_DIVIDE_F    (2.000),
        .CLKOUT1_DIVIDE      (2),
        .CLKOUT2_DIVIDE      (4),
        .CLKOUT3_DIVIDE      (4),
//        .CLKOUT4_DIVIDE(1),
//        .CLKOUT5_DIVIDE(1),
//        .CLKOUT6_DIVIDE(1),
        .COMPENSATION             ("ZHOLD"),
        .REF_JITTER1         (REF_JITTER1),
//        .REF_JITTER2(0.010),
        .SS_EN               (SS_EN),
        .SS_MODE             (SS_MODE),
        .SS_MOD_PERIOD       (SS_MOD_PERIOD),
        .STARTUP_WAIT             ("FALSE")
    ) mmcm_phase_cntr_i (
        .clkin1              (clk_in), // input
        .clkin2              (1'b0), // input
        .sel_clk2            (1'b0), // input
        .clkfbin             (clk_fb), // input
//        .rst                 (rst), // input
        .rst                 (rst_in), // input
        .pwrdwn                 (1'b0), // input
        .psclk               (clk_div), // input
        .ps_we               (ld_mmcm), // input
        .ps_din              (dly_data), // input[7:0] 
        .ps_ready            (ps_rdy), // output
        .ps_dout             (ps_out), // output[7:0] reg 
        .clkout0             (sdclk_pre), // output
        .clkout1             (clk_pre), // output
        .clkout2             (clk_div_pre), // output
        .clkout3             (mclk_pre), // output
        .clkout4(), // output
        .clkout5(), // output
        .clkout6(), // output
        .clkout0b(), // output
        .clkout1b(), // output
        .clkout2b(), // output
        .clkout3b(), // output
        .clkfbout            (clk_fb), // output
        .clkfboutb(), // output
        .locked              (locked_mmcm),
        .clkin_stopped       (clkin_stopped_mmcm), // output
        .clkfb_stopped       (clkfb_stopped_mmcm) // output
         // output
    );
// Does it need to be re-calibrated periodically - yes when temperature changes, same as dci_reset
assign idelay_ctrl_reset = rst || dly_rst;
    idelay_ctrl# (
        .IODELAY_GRP("IODELAY_MEMORY")
    ) idelay_ctrl_i (
        .refclk(ref_clk),
        .rst(idelay_ctrl_reset), // route it to the top
        .rdy(dly_ready)
    );
    dci_reset dci_reset_i (
        .reset(rst || dci_rst), // input
        .ready(dci_ready) // output
    );
//assign dci_ready= !(rst || dci_rst); 
endmodule

