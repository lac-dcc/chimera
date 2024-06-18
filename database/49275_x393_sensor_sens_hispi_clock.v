// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_hispi_clock
 * @file sens_hispi_clock.v
 * @date 2015-10-13  
 * @author Andrey Filippov     
 *
 * @brief Recover iclk/iclk2x from the HiSPi differntial clock
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_hispi_clock.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_hispi_clock.v is distributed in the hope that it will be useful,
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

module  sens_hispi_clock#(
    
    parameter SENS_PHASE_WIDTH=            8,      // number of bits for te phase counter (depends on divisors)
    parameter SENS_BANDWIDTH =             "OPTIMIZED",  //"OPTIMIZED", "HIGH","LOW"
    parameter CLKIN_PERIOD_SENSOR =        3.000, // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter CLKFBOUT_MULT_SENSOR =       3,      // 330 MHz --> 990 MHz
    parameter CLKFBOUT_PHASE_SENSOR =      0.000,  // CLOCK FEEDBACK phase in degrees (3 significant digits, -360.000...+360.000)
    parameter IPCLK_PHASE =                0.000,
    parameter IPCLK2X_PHASE =              0.000,
    parameter BUF_IPCLK =                 "BUFR",
    parameter BUF_IPCLK2X =               "BUFR",  

    parameter SENS_DIVCLK_DIVIDE =         1,            // Integer 1..106. Divides all outputs with respect to CLKIN
    parameter SENS_REF_JITTER1   =         0.010,        // Expected jitter on CLKIN1 (0.000..0.999)
    parameter SENS_REF_JITTER2   =         0.010,
    parameter SENS_SS_EN         =        "FALSE",      // Enables Spread Spectrum mode
    parameter SENS_SS_MODE       =        "CENTER_HIGH",//"CENTER_HIGH","CENTER_LOW","DOWN_HIGH","DOWN_LOW"
    parameter SENS_SS_MOD_PERIOD =         10000,        // integer 4000-40000 - SS modulation period in ns
    // Used with delay
    parameter IODELAY_GRP =             "IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE =     0,
    parameter real REFCLK_FREQUENCY =    200.0,
    parameter HIGH_PERFORMANCE_MODE =   "FALSE",
    
    parameter HISPI_DELAY_CLK =           "FALSE",      
    parameter HISPI_MMCM =                "TRUE",
    parameter HISPI_CAPACITANCE =         "DONT_CARE",
    parameter HISPI_DIFF_TERM =           "TRUE",
    parameter HISPI_UNTUNED_SPLIT =       "FALSE", // Very power-hungry
    parameter HISPI_DQS_BIAS =            "TRUE",
    parameter HISPI_IBUF_DELAY_VALUE =    "0",
    parameter HISPI_IBUF_LOW_PWR =        "TRUE",
    parameter HISPI_IFD_DELAY_VALUE =     "AUTO",
    parameter HISPI_IOSTANDARD =          "DIFF_SSTL18_I" //"DIFF_SSTL18_II" for high current (13.4mA vs 8mA)

)(
    input        mclk,
    input        mrst,
    input  [7:0] phase,
    input        set_phase,
    input        load,      // only used when delay, not phase
    input        rst_mmcm,
    input        clp_p,
    input        clk_n,
    output       ipclk,   // 165 MHz
    output       ipclk2x, // 330 MHz
    output       ps_rdy,          // output
    output [7:0] ps_out,          // output[7:0] reg 
    output       locked_pxd_mmcm,
    output       clkin_pxd_stopped_mmcm, // output
    output       clkfb_pxd_stopped_mmcm // output
);
    wire         ipclk_pre;
    wire         ipclk2x_pre;     // output
    wire         clk_fb;
    wire         prst = mrst;
    wire         clk_in;
    wire         clk_int;
    wire         set_phase_w = (HISPI_DELAY_CLK == "TRUE") ? 1'b0: set_phase;
    wire   [7:0] phase_w  =    (HISPI_DELAY_CLK == "TRUE") ? 8'b0: phase;
    wire         ps_rdy_w;
    wire   [7:0] ps_out_w; 
    
    assign ps_rdy = (HISPI_DELAY_CLK == "TRUE") ? 1'b1 : ps_rdy_w;
    assign ps_out = (HISPI_DELAY_CLK == "TRUE") ? 8'b0 : ps_out_w;
    generate
        if (HISPI_UNTUNED_SPLIT == "TRUE") begin
            ibufds_ibufgds_50 #(
                .CAPACITANCE      (HISPI_CAPACITANCE),
                .DIFF_TERM        (HISPI_DIFF_TERM),
                .DQS_BIAS         (HISPI_DQS_BIAS),
                .IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
                .IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
                .IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
                .IOSTANDARD       (HISPI_IOSTANDARD)
            ) ibufds_ibufgds0_i (
                .O    (clk_int),      // output
                .I    (clp_p), // input
                .IB   (clk_n)  // input
            );
        end else begin
            ibufds_ibufgds #(
                .CAPACITANCE      (HISPI_CAPACITANCE),
                .DIFF_TERM        (HISPI_DIFF_TERM),
                .DQS_BIAS         (HISPI_DQS_BIAS),
                .IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
                .IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
                .IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
                .IOSTANDARD       (HISPI_IOSTANDARD)
            ) ibufds_ibufgds0_i (
                .O    (clk_int),      // output
                .I    (clp_p), // input
                .IB   (clk_n)  // input
            );
        end
    endgenerate
    generate
        if (HISPI_DELAY_CLK == "TRUE") begin
            idelay_nofine # (
                .IODELAY_GRP           (IODELAY_GRP),
                .DELAY_VALUE           (IDELAY_VALUE),
                .REFCLK_FREQUENCY      (REFCLK_FREQUENCY),
                .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE)
            ) clk_dly_i(
                .clk          (mclk),
                .rst          (mrst),
                .set          (set_phase),
                .ld           (load),
                .delay        (phase[4:0]),
                .data_in      (clk_int),
                .data_out     (clk_in)
            );
        end else begin
            assign clk_in =  clk_int;
        end
    endgenerate

    // generate phase-shifterd pixel clock (and 2x version) from either the internal clock (that is output to the sensor) or from the clock
    // received from the sensor (may need to reset MMCM after resetting sensor)
    
    generate
        if (HISPI_MMCM == "TRUE") begin
            mmcm_phase_cntr #(
                .PHASE_WIDTH         (SENS_PHASE_WIDTH),
                .CLKIN_PERIOD        (CLKIN_PERIOD_SENSOR),
                .BANDWIDTH           (SENS_BANDWIDTH),
                .CLKFBOUT_MULT_F     (CLKFBOUT_MULT_SENSOR), // 4
                .DIVCLK_DIVIDE       (SENS_DIVCLK_DIVIDE),
                .CLKFBOUT_PHASE      (CLKFBOUT_PHASE_SENSOR),
                .CLKOUT0_PHASE       (IPCLK_PHASE),
                .CLKOUT1_PHASE       (IPCLK2X_PHASE),
                .CLKFBOUT_USE_FINE_PS("FALSE"),
                .CLKOUT0_USE_FINE_PS ("TRUE"),
                .CLKOUT1_USE_FINE_PS ("TRUE"),
                .CLKOUT0_DIVIDE_F    (CLKFBOUT_MULT_SENSOR * 2),  // 6  // 8.000),
                .CLKOUT1_DIVIDE      (CLKFBOUT_MULT_SENSOR ), // 3 // 4),
                .COMPENSATION        ("ZHOLD"),
                .REF_JITTER1         (SENS_REF_JITTER1),
                .REF_JITTER2         (SENS_REF_JITTER2),
                .SS_EN               (SENS_SS_EN),
                .SS_MODE             (SENS_SS_MODE),
                .SS_MOD_PERIOD       (SENS_SS_MOD_PERIOD),
                .STARTUP_WAIT        ("FALSE")
            ) mmcm_or_pll_i (
                .clkin1              (clk_in),          // input
                .clkin2              (1'b0),            // input
                .sel_clk2            (1'b0),            // input
                .clkfbin             (clk_fb),          // input
                .rst                 (rst_mmcm),        // input
                .pwrdwn              (1'b0),            // input
                
                .psclk               (mclk),            // input
                .ps_we               (set_phase_w),     // input
                .ps_din              (phase_w),         // input[7:0] 
                .ps_ready            (ps_rdy_w),        // output
                .ps_dout             (ps_out_w),        // output[7:0] reg 
                
                .clkout0             (ipclk_pre),       // output
                .clkout1             (ipclk2x_pre),     // output
                .clkout2(), // output
                .clkout3(), // output
                .clkout4(), // output
                .clkout5(), // output
                .clkout6(), // output
                .clkout0b(), // output
                .clkout1b(), // output
                .clkout2b(), // output
                .clkout3b(), // output
                .clkfbout            (clk_fb), // output
                .clkfboutb(), // output
                .locked              (locked_pxd_mmcm),
                .clkin_stopped       (clkin_pxd_stopped_mmcm), // output
                .clkfb_stopped       (clkfb_pxd_stopped_mmcm) // output
                 // output
            );
        end else begin
            pll_base #(
                .CLKIN_PERIOD        (CLKIN_PERIOD_SENSOR),
                .BANDWIDTH           (SENS_BANDWIDTH),
                .CLKFBOUT_MULT       (CLKFBOUT_MULT_SENSOR), // 4
                .DIVCLK_DIVIDE       (SENS_DIVCLK_DIVIDE),
                .CLKFBOUT_PHASE      (CLKFBOUT_PHASE_SENSOR),
                .CLKOUT0_PHASE       (IPCLK_PHASE),
                .CLKOUT1_PHASE       (IPCLK2X_PHASE),
                .CLKOUT0_DIVIDE      (CLKFBOUT_MULT_SENSOR * 2),  // 6  // 8.000),
                .CLKOUT1_DIVIDE      (CLKFBOUT_MULT_SENSOR ), // 3 // 4),
                .REF_JITTER1         (SENS_REF_JITTER1),
                .STARTUP_WAIT        ("FALSE")
            ) mmcm_or_pll_i (
                .clkin               (clk_in),          // input
                .clkfbin             (clk_fb),          // input
                .rst                 (rst_mmcm),        // input
                .pwrdwn              (1'b0),            // input
                .clkout0             (ipclk_pre),       // output
                .clkout1             (ipclk2x_pre),     // output
                .clkout2(), // output
                .clkout3(), // output
                .clkout4(), // output
                .clkout5(), // output
                .clkfbout            (clk_fb), // output
                .locked              (locked_pxd_mmcm)
                 // output
            );
            assign clkin_pxd_stopped_mmcm = 0;
            assign clkfb_pxd_stopped_mmcm = 0;
            assign ps_rdy_w = 1;
            assign ps_out_w = 0; // alternatively - register delay written
        end
    endgenerate
    
    generate
        if      (BUF_IPCLK == "BUFR2") BUFR  #(.BUFR_DIVIDE(2)) clk1x_i (.O(ipclk), .I(ipclk2x_pre), .CE(1'b1), .CLR(rst_mmcm));
        else if (BUF_IPCLK == "BUFG")  BUFG  clk1x_i (.O(ipclk),   .I(ipclk_pre));
        else if (BUF_IPCLK == "BUFH")  BUFH  clk1x_i (.O(ipclk),   .I(ipclk_pre));
        else if (BUF_IPCLK == "BUFR")  BUFR  clk1x_i (.O(ipclk),   .I(ipclk_pre), .CE(1'b1), .CLR(prst));
        else if (BUF_IPCLK == "BUFMR") BUFMR clk1x_i (.O(ipclk),   .I(ipclk_pre));
        else if (BUF_IPCLK == "BUFIO") BUFIO clk1x_i (.O(ipclk),   .I(ipclk_pre));
        else assign ipclk = ipclk_pre;
    endgenerate

    generate
        if      (BUF_IPCLK2X == "BUFG")  BUFG  clk2x_i (.O(ipclk2x), .I(ipclk2x_pre));
        else if (BUF_IPCLK2X == "BUFH")  BUFH  clk2x_i (.O(ipclk2x), .I(ipclk2x_pre));
        else if (BUF_IPCLK2X == "BUFR")  BUFR  clk2x_i (.O(ipclk2x), .I(ipclk2x_pre), .CE(1'b1), .CLR(prst));
        else if (BUF_IPCLK2X == "BUFMR") BUFMR clk2x_i (.O(ipclk2x), .I(ipclk2x_pre));
        else if (BUF_IPCLK2X == "BUFIO") BUFIO clk2x_i (.O(ipclk2x), .I(ipclk2x_pre));
        else assign ipclk2x = ipclk2x_pre;
    endgenerate





endmodule

