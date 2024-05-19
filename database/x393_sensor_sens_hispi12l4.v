// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_hispi12l4
 * @file sens_hispi12l4.v
 * @date 2015-10-13  
 * @author Andrey Filippov     
 *
 * @brief Decode HiSPi 4-lane, 12 bits Packetized-SP data from the sensor
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_hispi12l4.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_hispi12l4.v is distributed in the hope that it will be useful,
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
//`define MON_HISPI // moved to system_defines
module  sens_hispi12l4#(
    parameter IODELAY_GRP =               "IODELAY_SENSOR",
    parameter integer IDELAY_VALUE =       0,
    parameter real REFCLK_FREQUENCY =      200.0,
    parameter HIGH_PERFORMANCE_MODE =     "FALSE",
    parameter SENS_PHASE_WIDTH=            8,      // number of bits for te phase counter (depends on divisors)
//    parameter SENS_PCLK_PERIOD =           3.000,  // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
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

    parameter DEFAULT_LANE_MAP =           8'b11100100, // one-to-one map (or make it 8'b00111001 ?)
    parameter HISPI_MSB_FIRST =            0,
    parameter HISPI_NUMLANES =             4,
    parameter HISPI_DELAY_CLK =           "FALSE",      
    parameter HISPI_MMCM =                "TRUE",
    parameter HISPI_KEEP_IRST =           5,   // number of cycles to keep irst on after release of prst (small number - use 1 hot)
    parameter HISPI_WAIT_ALL_LANES =      4'h8, // number of output pixel cycles to wait after the earliest lane
    parameter HISPI_FIFO_DEPTH =          4,
    parameter HISPI_FIFO_START =          7,
    parameter HISPI_CAPACITANCE =         "DONT_CARE",
    parameter HISPI_DIFF_TERM =           "TRUE",
    parameter HISPI_UNTUNED_SPLIT =       "FALSE", // Very power-hungry
    parameter HISPI_DQS_BIAS =            "TRUE",
    parameter HISPI_IBUF_DELAY_VALUE =    "0",
    parameter HISPI_IBUF_LOW_PWR =        "TRUE",
    parameter HISPI_IFD_DELAY_VALUE =     "AUTO",
    parameter HISPI_IOSTANDARD =          "DIFF_SSTL18_I" //"DIFF_SSTL18_II" for high current (13.4mA vs 8mA),
    `ifdef MON_HISPI
        , parameter TIM_BITS =              24 // number of bits in HISPI timing counter
    `endif
)(
    input             pclk,   // global clock input, pixel rate (220MHz for MT9F002)
    input             prst,   // reset @pclk (add sensor reset here)
    // I/O pads
    input [HISPI_NUMLANES-1:0] sns_dp,
    input [HISPI_NUMLANES-1:0] sns_dn,
    input                      sns_clkp,
    input                      sns_clkn,
    // output
//    output reg          [11:0] pxd_out,
    output              [11:0] pxd_out,
//    output reg                 vact_out, 
    output                     hact_out,
    output                     sof, // @pclk
    output reg                 eof, // @pclk
    
    // delay control inputs
    input                           mclk,
    input                           mrst,
    input  [HISPI_NUMLANES * 8-1:0] dly_data,        // delay value (3 LSB - fine delay) - @posedge mclk
    input                           set_lanes_map,   // set number of physical lane for each logical one
    input                           set_fifo_dly,
    input      [HISPI_NUMLANES-1:0] set_idelay,      // mclk synchronous load idelay value
    input                           ld_idelay,       // mclk synchronous set idealy value
    input                           set_clk_phase,   // mclk synchronous set idealy value
    input                           rst_mmcm,
    input                           ignore_embedded, // ignore lines with embedded data
//    input                           wait_all_lanes,  // when 0 allow some lanes missing sync (for easier phase adjustment)
    // MMCP output status
    output                         ps_rdy,          // output
    output                   [7:0] ps_out,          // output[7:0] reg 
    output                         locked_pxd_mmcm,
    output                         clkin_pxd_stopped_mmcm, // output
    output                         clkfb_pxd_stopped_mmcm, // output
    output reg [HISPI_NUMLANES-1:0] monitor_pclk,       // for monitoring: each bit contains single cycle @pclk line starts    
    output reg [HISPI_NUMLANES-2:0] monitor_diff,       // for monitoring: when SOL active on the last lane @ipclk, latches all other lanes SOL,
    output   [HISPI_NUMLANES*2-1:0] mon_barrel          // @ipclk per-lane monitor barrel shifter
    
`ifdef MON_HISPI
    ,input                          tim_start,
    input                     [1:0] tim_lane,
    input                     [1:0] tim_from, // 0 - sof, 1 - eof, 2 - sol, 3 eol
    input                     [1:0] tim_to,   // 0 - sof, 1 - eof, 2 - sol, 3 eol
    output                          tim_busy,
    output reg       [TIM_BITS-1:0] tim_cntr                                       
`endif    
);

`ifdef MON_HISPI
    reg                      [1:0] tim_busy_r;
    reg             [TIM_BITS-1:0] tim_icntr;
    wire                           tim_istart;
    reg                      [1:0] tim_ilane;
    reg                      [1:0] tim_ifrom; // 0 - sof, 1 - eof, 2 - sol, 3 eol
    reg                      [1:0] tim_ito;   // 0 - sof, 1 - eof, 2 - sol, 3 eol
    reg                      [1:0] tim_ibusy;
    reg                      [3:0] tim_sefl;
    reg                            tim_f;
    reg                            tim_t;
    
    assign tim_busy = |tim_busy_r; 
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) pulse_cross_clock_tim_start_i (
        .rst       (mrst),                      // input
        .src_clk   (mclk),                      // input
        .dst_clk   (ipclk),                     // input
        .in_pulse  (tim_start),                 // input
        .out_pulse (tim_istart),                // output
        .busy() // output
    );
    always @(posedge ipclk) begin
        tim_ifrom <= tim_from;
        tim_ilane <= tim_lane;
        tim_ito <=   tim_to;
        tim_sefl <= tim_ilane[1]?
                         (tim_ilane[0]?{hispi_eol[3],hispi_sol[3],hispi_eof[3],hispi_sof[3]}:
                                       {hispi_eol[2],hispi_sol[2],hispi_eof[2],hispi_sof[2]}):
                         (tim_ilane[0]?{hispi_eol[1],hispi_sol[1],hispi_eof[1],hispi_sof[1]}:
                                       {hispi_eol[0],hispi_sol[0],hispi_eof[0],hispi_sof[0]});
        tim_f <= tim_ifrom[1]?
                         (tim_ifrom[0]?tim_sefl[3]:tim_sefl[2]):
                         (tim_ifrom[0]?tim_sefl[1]:tim_sefl[0]);
        
        tim_t <= tim_ito[1]?
                         (tim_ito[0]?tim_sefl[3]:tim_sefl[2]):
                         (tim_ito[0]?tim_sefl[1]:tim_sefl[0]);
        if      (irst)                   tim_ibusy <= 0;
        else if (tim_istart)             tim_ibusy <= 1;
        else if (tim_ibusy[0] && tim_f)  tim_ibusy <= 2;
        else if (tim_ibusy[1] && tim_t)  tim_ibusy <= 0;
        
        if      (tim_ibusy[0] || (tim_f && !tim_t))  tim_icntr <= 0; // reset if repeated start (e.g. to measure last sol to eof)
        else if (tim_ibusy[1])                       tim_icntr <= tim_icntr + 1;
    end
    always @ (posedge mclk) begin
        tim_busy_r <= {tim_busy_r[0], |tim_ibusy};
        if (!tim_busy_r[0]) tim_cntr <= tim_icntr;
    end
      
`endif


    wire                          ipclk;  // re-generated half HiSPi clock (165 MHz) 
    wire                          ipclk2x;// re-generated HiSPi clock (330 MHz)
    wire [HISPI_NUMLANES * 4-1:0] sns_d;
//    localparam WAIT_ALL_LANES = 4'h8; // number of output pixel cycles to wait after the earliest lane
//    localparam FIFO_DEPTH = 4;
    reg      [HISPI_KEEP_IRST-1:0] irst_r;
    wire                          irst = irst_r[0];
    reg  [HISPI_NUMLANES * 2-1:0] lanes_map;
    reg  [HISPI_NUMLANES * 4-1:0] logical_lanes4;
    reg    [HISPI_FIFO_DEPTH-1:0] fifo_out_dly_mclk;                  
    reg    [HISPI_FIFO_DEPTH-1:0] fifo_out_dly;
                      
    always @ (posedge mclk) begin
        if      (mrst)          lanes_map <= DEFAULT_LANE_MAP; //{2'h3,2'h2,2'h1,2'h0}; // 1-to-1 default map
        else if (set_lanes_map) lanes_map <= dly_data[HISPI_NUMLANES * 2-1:0];

        if      (mrst)          fifo_out_dly_mclk <= HISPI_FIFO_START;
        else if (set_fifo_dly)  fifo_out_dly_mclk <= dly_data[HISPI_FIFO_DEPTH-1:0];
    end
    
//non-parametrized lane switch (4x4)
    always  @(posedge ipclk) begin
        logical_lanes4[ 3: 0] <= sns_d[{lanes_map[1:0],2'b0} +:4];
        logical_lanes4[ 7: 4] <= sns_d[{lanes_map[3:2],2'b0} +:4];
        logical_lanes4[11: 8] <= sns_d[{lanes_map[5:4],2'b0} +:4];
        logical_lanes4[15:12] <= sns_d[{lanes_map[7:6],2'b0} +:4];
    end   
    
    always  @(posedge ipclk) begin
        fifo_out_dly <= fifo_out_dly_mclk;
    end
    
    sens_hispi_clock #(
        .SENS_PHASE_WIDTH       (SENS_PHASE_WIDTH),
        .SENS_BANDWIDTH         (SENS_BANDWIDTH),
        .CLKIN_PERIOD_SENSOR    (CLKIN_PERIOD_SENSOR),
        .CLKFBOUT_MULT_SENSOR   (CLKFBOUT_MULT_SENSOR),
        .CLKFBOUT_PHASE_SENSOR  (CLKFBOUT_PHASE_SENSOR),
        .IPCLK_PHASE            (IPCLK_PHASE),
        .IPCLK2X_PHASE          (IPCLK2X_PHASE),
        .BUF_IPCLK              (BUF_IPCLK),
        .BUF_IPCLK2X            (BUF_IPCLK2X),
        .SENS_DIVCLK_DIVIDE     (SENS_DIVCLK_DIVIDE),
        .SENS_REF_JITTER1       (SENS_REF_JITTER1),
        .SENS_REF_JITTER2       (SENS_REF_JITTER2),
        .SENS_SS_EN             (SENS_SS_EN),
        .SENS_SS_MODE           (SENS_SS_MODE),
        .SENS_SS_MOD_PERIOD     (SENS_SS_MOD_PERIOD),
        .IODELAY_GRP            (IODELAY_GRP),
        .IDELAY_VALUE           (IDELAY_VALUE),
        .REFCLK_FREQUENCY       (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),

        .HISPI_DELAY_CLK        (HISPI_DELAY_CLK),
        .HISPI_MMCM             (HISPI_MMCM),
        
        .HISPI_CAPACITANCE      (HISPI_CAPACITANCE),
        .HISPI_DIFF_TERM        (HISPI_DIFF_TERM),
        .HISPI_DQS_BIAS         (HISPI_DQS_BIAS),
        .HISPI_IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
        .HISPI_IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
        .HISPI_IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
        .HISPI_IOSTANDARD       (HISPI_IOSTANDARD)
    ) sens_hispi_clock_i (
        .mclk                   (mclk),                   // input
        .mrst                   (mrst),                   // input
        .phase                  (dly_data[7:0]),          // input[7:0] 
        .set_phase              (set_clk_phase),          // input
        .load                   (ld_idelay),              // input
        .rst_mmcm               (rst_mmcm),               // input
        .clp_p                  (sns_clkp),               // input
        .clk_n                  (sns_clkn),               // input
        .ipclk                  (ipclk),                  // output
        .ipclk2x                (ipclk2x),                // output
        .ps_rdy                 (ps_rdy),                 // output
        .ps_out                 (ps_out),                 // output[7:0] 
        .locked_pxd_mmcm        (locked_pxd_mmcm),        // output
        .clkin_pxd_stopped_mmcm (clkin_pxd_stopped_mmcm), // output
        .clkfb_pxd_stopped_mmcm (clkfb_pxd_stopped_mmcm)  // output
    );

    sens_hispi_din #(
        .IODELAY_GRP            (IODELAY_GRP),
        .IDELAY_VALUE           (IDELAY_VALUE),
        .REFCLK_FREQUENCY       (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
        .HISPI_NUMLANES         (HISPI_NUMLANES),
        .HISPI_CAPACITANCE      (HISPI_CAPACITANCE),
        .HISPI_DIFF_TERM        (HISPI_DIFF_TERM),
        .HISPI_UNTUNED_SPLIT    (HISPI_UNTUNED_SPLIT),        
        .HISPI_DQS_BIAS         (HISPI_DQS_BIAS),
        .HISPI_IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
        .HISPI_IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
        .HISPI_IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
        .HISPI_IOSTANDARD       (HISPI_IOSTANDARD)
    ) sens_hispi_din_i (
        .mclk         (mclk),        // input
        .mrst         (mrst),        // input
        .dly_data     (dly_data),    // input[31:0] 
        .set_idelay   (set_idelay),  // input[3:0] 
        .ld_idelay    (ld_idelay),   // input
        .ipclk        (ipclk),       // input
        .ipclk2x      (ipclk2x),     // input
        .irst         (irst),        // input
        .din_p        (sns_dp),      // input[3:0] 
        .din_n        (sns_dn),      // input[3:0] 
        .dout         (sns_d)        // output[15:0] 
    );
    
    

    wire [HISPI_NUMLANES * 12-1:0] hispi_aligned;
    wire      [HISPI_NUMLANES-1:0] hispi_dv;
    wire      [HISPI_NUMLANES-1:0] hispi_embed;
    wire      [HISPI_NUMLANES-1:0] hispi_sof;
    wire      [HISPI_NUMLANES-1:0] hispi_eof;
    wire      [HISPI_NUMLANES-1:0] hispi_sol;
    wire      [HISPI_NUMLANES-1:0] hispi_eol;
//    wire    [HISPI_NUMLANES*2-1:0] mon_barrel; // per-lane monitor barrel shifter
   // TODO - try to make that something will be recorded even if some lanes are bad (to simplify phase adjust
   // possibly - extra control bit (wait_all_lanes)
   //    use earliest SOF
    reg                             vact_ipclk;
    reg                       [1:0] vact_pclk_strt;
    wire       [HISPI_NUMLANES-1:0] rd_run;
    reg                             rd_line; // combine all lanes
    reg                             rd_line_r;
    wire                            sol_all_dly;
    reg        [HISPI_NUMLANES-1:0] rd_run_d;
    reg                             sof_pclk;
//    wire       [HISPI_NUMLANES-1:0] sol_pclk = rd_run & ~rd_run_d;
    wire                            sol_pclk = |(rd_run & ~rd_run_d); // possibly multi-cycle
    reg                             start_fifo_re; // start reading FIFO - single-cycle
    reg        [HISPI_NUMLANES-1:0] good_lanes; // lanes that started active line OK   
    reg        [HISPI_NUMLANES-1:0] fifo_re;
    reg        [HISPI_NUMLANES-1:0] fifo_re_r;
    reg                             hact_r;
    wire  [HISPI_NUMLANES * 12-1:0] fifo_out;
    wire                            hact_on;
    wire                            hact_off;
    reg                             ignore_embedded_ipclk;
    reg                       [1:0] vact_pclk;
    wire                     [11:0] pxd_out_pre = ({12 {fifo_re_r[0] & rd_run[0]}} & fifo_out[0 * 12 +:12]) |
                                                  ({12 {fifo_re_r[1] & rd_run[1]}} & fifo_out[1 * 12 +:12]) |
                                                  ({12 {fifo_re_r[2] & rd_run[2]}} & fifo_out[2 * 12 +:12]) |
                                                  ({12 {fifo_re_r[3] & rd_run[3]}} & fifo_out[3 * 12 +:12]);
    reg                             start_only; // time window at the beginning of each line, can not end here                                              
       
    
    
    assign hact_out = hact_r;
    assign sof =      sof_pclk;
    
    // async reset
    always @ (posedge ipclk or posedge prst) begin
        if (prst) irst_r <= {HISPI_KEEP_IRST{1'b1}}; // HISPI_KEEP_IRST-1
        else      irst_r <= irst_r >> 1; 
    end
    
    
    
    always @(posedge ipclk) begin
    
        if (irst || (|hispi_eof)) vact_ipclk <= 0; // extend output if hact active
        else if (|hispi_sof)      vact_ipclk <= 1;
    
        ignore_embedded_ipclk <= ignore_embedded;
    end
    
    // monitoring relative phases
    always @(posedge ipclk) if (hispi_sol[HISPI_NUMLANES - 1]) begin
        monitor_diff[HISPI_NUMLANES-2:0] <= hispi_sol[HISPI_NUMLANES-2:0];
    end
    
    
    
    always @(posedge pclk) begin
        if (prst || !vact_ipclk) vact_pclk_strt <= 0;
        else                     vact_pclk_strt <= {vact_pclk_strt[0], 1'b1};

        rd_run_d <= rd_run;
        
        start_fifo_re <= sol_pclk && !rd_line; // sol_pclk may be multi-cycle
       
        sof_pclk <= vact_pclk_strt[0] && ! vact_pclk_strt[1];
        
        if (prst || sof_pclk || sol_all_dly) start_only <= 0;
        else if (sol_pclk)                   start_only <= 1;
        
       
        if      (prst || sof_pclk) rd_line <= 0;
        else if (sol_pclk)         rd_line <= 1;
        else                       rd_line <= rd_line & (start_only || (&(~good_lanes | rd_run))); // Off when first of the good lanes goes off      
       
        rd_line_r <= rd_line;
        
        if (sol_pclk && !rd_line) good_lanes <= ~rd_run_d;             // should be off before start
        else if (sol_all_dly)     good_lanes <= good_lanes & rd_run; // and now they should be on
        
        fifo_re_r <= fifo_re & rd_run; // when data out is ready, mask if not running
        
        // not using HISPI_NUMLANES here - fix? Will be 0 (not possible in hispi) when no data
/*        pxd_out <= ({12 {fifo_re_r[0] & rd_run[0]}} & fifo_out[0 * 12 +:12]) |
                   ({12 {fifo_re_r[1] & rd_run[1]}} & fifo_out[1 * 12 +:12]) |
                   ({12 {fifo_re_r[2] & rd_run[2]}} & fifo_out[2 * 12 +:12]) |
                   ({12 {fifo_re_r[3] & rd_run[3]}} & fifo_out[3 * 12 +:12]); */
       
       if      (prst)                                                      fifo_re <= 0;
//       else if (sol_pclk || (rd_line && fifo_re[HISPI_NUMLANES - 1])) fifo_re <= 1;
       else if (start_fifo_re || (rd_line && fifo_re[HISPI_NUMLANES - 1])) fifo_re <= 1;
       else                                                                fifo_re <= fifo_re << 1;
       
//       if (prst || (hact_off && (|(good_lanes & ~rd_run)))) hact_r <= 0;
       if (prst || (hact_off && (!rd_line || (good_lanes[3] & ~rd_run[3])))) hact_r <= 0;
       else if (hact_on)                                    hact_r <= 1;
       
       vact_pclk <= {vact_pclk[0],vact_pclk_strt [0] || hact_r};
       eof <= vact_pclk[1] && !vact_pclk[0]; 
//       vact_out <= vact_pclk_strt [0] || hact_r;

       monitor_pclk <= rd_run & ~rd_run_d;

    end

    dly_16 #(
        .WIDTH(1)
    ) dly_16_start_line_i (
        .clk  (pclk),                  // input
        .rst  (1'b0),                  // input
        .dly  (HISPI_WAIT_ALL_LANES),  // input[3:0] 
        .din  (rd_line && !rd_line_r), // input[0:0] 
        .dout (sol_all_dly)            // output[0:0] 
    );

    dly_16 #(
        .WIDTH(1)
    ) dly_16_hact_on_i (
        .clk  (pclk),                        // input
        .rst  (1'b0),                        // input
//        .dly  (4'h2),                      // input[3:0] 
//        .dly  (4'h3),                      // input[3:0] 
        .dly  (4'h1),                        // input[3:0] 
//        .dly  (4'h2),                      // input[3:0] 
        .din  (sol_pclk),                    // input[0:0] 
        .dout (hact_on)                      // output[0:0] 
    );

    dly_16 #(
        .WIDTH(1)
    ) dly_16_hact_off_i (
        .clk  (pclk),                        // input
        .rst  (1'b0),                        // input
//        .dly  (4'h2),                        // input[3:0] 
//        .dly  (4'h0),                        // input[3:0] 
        .dly  (4'h1),                        // input[3:0] 
//        .dly  (4'h2),                        // input[3:0] 
        .din  (fifo_re[HISPI_NUMLANES - 1]), // input[0:0] 
        .dout (hact_off)                     // output[0:0] 
    );

    dly_16 #(
        .WIDTH(12)
    ) dly_16_pxd_out_i (
        .clk  (pclk),                        // input
        .rst  (1'b0),                        // input
        .dly  (4'h0),                        // input[3:0] 
        .din  (pxd_out_pre),                 // input[0:0] 
        .dout (pxd_out)                      // output[0:0] 
    );
   
    generate
        genvar i;
        for (i=0; i < 4; i=i+1) begin: hispi_lane
            sens_hispi_lane #(
                .HISPI_MSB_FIRST(HISPI_MSB_FIRST)
            ) sens_hispi_lane_i (
                .ipclk    (ipclk),                     // input
                .irst     (irst),                      // input
                .din      (logical_lanes4[4*i +: 4]),           // input[3:0] 
                .dout     (hispi_aligned[12*i +: 12]), // output[3:0] reg 
                .dv       (hispi_dv[i]),               // output reg 
                .embed    (hispi_embed[i]),            // output reg 
                .sof      (hispi_sof[i]),              // output reg 
                .eof      (hispi_eof[i]),              // output reg 
                .sol      (hispi_sol[i]),              // output reg 
                .eol      (hispi_eol[i]),              // output reg
                .mon_barrel (mon_barrel[2*i +: 2])     // output reg 1:0 
            );
            sens_hispi_fifo #(
//                .COUNT_START  (HISPI_FIFO_START),
                .DATA_WIDTH  (12),
                .DATA_DEPTH  (HISPI_FIFO_DEPTH)
            ) sens_hispi_fifo_i (
                .ipclk    (ipclk),                     // input
                .irst     (irst),                      // input
                .we       (hispi_dv[i]),               // input
                .sol      (hispi_sol[i] && !(hispi_embed[i] && ignore_embedded_ipclk)), // input
                .eol      (hispi_eol[i]),              // input
                .din      (hispi_aligned[12*i +: 12]), // input[11:0]
                .out_dly  (fifo_out_dly),              // input[3:0] 
                .pclk     (pclk),                      // input
                .prst     (prst),                      // input
                .re       (fifo_re[i]),                // input
                .dout     (fifo_out[12*i +: 12]),      // output[11:0] reg 
                .run      (rd_run[i])                  // output
            );
        
        end
    endgenerate        

endmodule

