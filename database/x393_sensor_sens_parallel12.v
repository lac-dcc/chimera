// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_parallel12
 * @file sens_parallel12.v
 * @date 2015-05-10  
 * @author Andrey Filippov     
 *
 * @brief Sensor interface with 12-bit for parallel bus
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sens_parallel12.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_parallel12.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" // just for debugging histograms 
module  sens_parallel12 #(
    parameter SENSIO_ADDR =        'h330,
    parameter SENSIO_ADDR_MASK =   'h7f8,
    parameter SENSIO_CTRL =        'h0,
    parameter SENSIO_STATUS =      'h1,
    parameter SENSIO_JTAG =        'h2,
    parameter SENSIO_WIDTH =       'h3, // set line width (1.. 2^16) if 0 - use HACT
    parameter SENSIO_DELAYS =      'h4, // 'h4..'h7 - each address sets 4 delays through 4 bytes of 32-bit data
    parameter SENSIO_STATUS_REG =  'h21,

    parameter SENS_JTAG_PGMEN =    8,
    parameter SENS_JTAG_PROG =     6,
    parameter SENS_JTAG_TCK =      4,
    parameter SENS_JTAG_TMS =      2,
    parameter SENS_JTAG_TDI =      0,
    
    parameter SENS_CTRL_MRST=      0,  //  1: 0
    parameter SENS_CTRL_ARST=      2,  //  3: 2
    parameter SENS_CTRL_ARO=       4,  //  5: 4
    parameter SENS_CTRL_RST_MMCM=  6,  //  7: 6
    parameter SENS_CTRL_EXT_CLK=   8,  //  9: 8
    parameter SENS_CTRL_LD_DLY=   10,  // 10
    parameter SENS_CTRL_QUADRANTS =      12,  // 17:12, enable - 20
    parameter SENS_CTRL_QUADRANTS_WIDTH = 7, // 6,
    parameter SENS_CTRL_ODD =             6, //
    parameter SENS_CTRL_QUADRANTS_EN =   20,  // 18:12, enable - 20 (1 bits reserved)
     
    
    parameter LINE_WIDTH_BITS =   16,
    
    parameter IODELAY_GRP ="IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE = 0,
    parameter integer PXD_DRIVE = 12,
    parameter PXD_IBUF_LOW_PWR = "TRUE",
    parameter PXD_IOSTANDARD = "DEFAULT",
    parameter PXD_SLEW = "SLOW",
    parameter real SENS_REFCLK_FREQUENCY =    300.0,
    parameter SENS_HIGH_PERFORMANCE_MODE =    "FALSE",
    
    parameter SENS_PHASE_WIDTH=               8,      // number of bits for te phase counter (depends on divisors)
//    parameter SENS_PCLK_PERIOD =              10.000,  // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter SENS_BANDWIDTH =                "OPTIMIZED",  //"OPTIMIZED", "HIGH","LOW"

    parameter CLKIN_PERIOD_SENSOR =   10.000, // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter CLKFBOUT_MULT_SENSOR =   8,  // 100 MHz --> 800 MHz
    parameter CLKFBOUT_PHASE_SENSOR =  0.000,  // CLOCK FEEDBACK phase in degrees (3 significant digits, -360.000...+360.000)
    parameter IPCLK_PHASE =            0.000,
    parameter IPCLK2X_PHASE =          0.000,
    parameter BUF_IPCLK =             "BUFR",
    parameter BUF_IPCLK2X =           "BUFR",  
    

    parameter SENS_DIVCLK_DIVIDE =     1,            // Integer 1..106. Divides all outputs with respect to CLKIN
    parameter SENS_REF_JITTER1   =     0.010,        // Expected jitter on CLKIN1 (0.000..0.999)
    parameter SENS_REF_JITTER2   =     0.010,
    parameter SENS_SS_EN         =     "FALSE",      // Enables Spread Spectrum mode
    parameter SENS_SS_MODE       =     "CENTER_HIGH",//"CENTER_HIGH","CENTER_LOW","DOWN_HIGH","DOWN_LOW"
    parameter SENS_SS_MOD_PERIOD =     10000,        // integer 4000-40000 - SS modulation period in ns
    parameter STATUS_ALIVE_WIDTH =     4
)(
//    input         rst,
    input         pclk,   // global clock input, pixel rate (96MHz for MT9P006)
    input         mclk_rst,
    input         prst,
    output        prsts,  // @pclk - includes sensor reset and sensor PLL reset
    output        irst,
    
    output        ipclk,  // re-generated sensor output clock (regional clock to drive external fifo) 
    output        ipclk2x,// twice frequency regenerated sensor clock (possibly to run external fifo)
//    input         pclk2x, // maybe not needed here
    input         trigger_mode, // running in triggered mode (0 - free running mode)
    input         trig,      // per-sensor trigger input
    // sensor pads excluding i2c
    inout         vact,
    inout         hact, //output in fillfactory mode
    inout         bpf,  // output in fillfactory mode
    inout  [11:0] pxd, //actually only 2 LSBs are inouts
    inout         mrst,
    inout         senspgm,    // SENSPGM I/O pin
    
    inout         arst,
    inout         aro,
    output        dclk, // externally connected to inout port
    // output
    output reg [11:0] pxd_out,
    output reg        vact_out, 
    output            hact_out,
    
    input [STATUS_ALIVE_WIDTH-1:0] status_alive_1cyc, //extra toggle @mclk bits to report with status 

    // JTAG to program 10359
//    input          xpgmen,     // enable programming mode for external FPGA
//    input          xfpgaprog,  // PROG_B to be sent to an external FPGA
//    output         xfpgadone,  // state of the MRST pin ("DONE" pin on external FPGA)
//    input          xfpgatck,   // TCK to be sent to external FPGA
//    input          xfpgatms,   // TMS to be sent to external FPGA
//    input          xfpgatdi,   // TDI to be sent to external FPGA
//    output         xfpgatdo,   // TDO read from external FPGA
//    output         senspgmin,    
    
    // programming interface
    input         mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input         cmd_stb,     // strobe (with first byte) for the command a/d
    output  [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output        status_rq,   // input request to send status downstream
    input         status_start // Acknowledge of the first status packet byte (address)
);

    // delaying vact and pxd by one clock cycle to match hact register
    wire [11:0] pxd_out_pre;
    wire        vact_out_pre; 

    reg  [2:0] irst_r;
    wire ibpf;
    wire ipclk_pre, ipclk2x_pre;
    
    reg  [31:0] data_r; 
    reg   [3:0] set_idelay;
    reg         set_ctrl_r;
    reg         set_status_r;
    reg   [1:0] set_width_r; // to make double-cycle subtract
    wire        set_width_ipclk_w; //re-clocked to ipclk
    reg         set_width_ipclk_r; // copy from mclk domain when reset is off
    wire        set_width_ipclk = set_width_ipclk_w || set_width_ipclk_r; //re-clocked to ipclk
    reg         set_jtag_r;
    
    reg [LINE_WIDTH_BITS-1:0] line_width_m1;       // regenerated HACT duration;
    reg [LINE_WIDTH_BITS-1:0] line_width_m1_ipclk;  // regenerated HACT duration;
    
    reg                       line_width_internal; // use regenetrated ( 0 - use HACT as is)
    reg                       line_width_internal_ipclk;
    reg [LINE_WIDTH_BITS-1:0] hact_cntr;
    
//    reg         set_quad; // [1:0] - px, [3:2] - HACT, [5:4] - VACT,
    wire        clk_fb;
    
    wire  [2:0] set_pxd_delay;
    wire        set_other_delay;
    
    wire        ps_rdy;
    wire  [7:0] ps_out;      
    wire        locked_pxd_mmcm;
    wire        clkin_pxd_stopped_mmcm;
    wire        clkfb_pxd_stopped_mmcm;
    
    // programmed resets to the sensor 
    reg         iaro_soft  = 0;
    wire        iaro;
    reg         iarst = 0;
    reg         imrst = 0;
    reg         rst_mmcm=1; // rst and command - en/dis 
    reg  [SENS_CTRL_QUADRANTS_WIDTH-1:0]  quadrants=0; //90-degree shifts for data [1:0], hact [3:2] and vact [5:4], [6] odd/even
    reg         ld_idelay=0;
    reg         sel_ext_clk=0; // select clock source from the sensor (0 - use internal clock - to sensor)



//    wire [17:0] status;
//    wire [18:0] status;
//    wire [22:0] status;
    wire [25:0] status; // added byte-wide xfpgatdo
    
    wire        cmd_we;
    wire  [2:0] cmd_a;
    wire [31:0] cmd_data;
    
    wire           xfpgadone;  // state of the MRST pin ("DONE" pin on external FPGA)
    wire           xfpgatdo;   // TDO read from external FPGA
    reg      [7:0] xfpgatdo_byte; // tdo signal shifted left at each TCK _/~
    wire           senspgmin;    

    reg            xpgmen=0;     // enable programming mode for external FPGA
    reg            xfpgaprog=0;  // PROG_B to be sent to an external FPGA
    reg            xfpgatck=0;   // TCK to be sent to external FPGA
    reg            xfpgatms=0;   // TMS to be sent to external FPGA
    reg            xfpgatdi=0;   // TDI to be sent to external FPGA
    wire           hact_ext_direct;     // received hact signal
    reg            hact_ext_d;   // external hact delayed by 1 pixel    
    wire           hact_ext =  quadrants[SENS_CTRL_ODD]? hact_ext_d: hact_ext_direct;   // selected between     
    reg            hact_ext_r;   // received hact signal, delayed by 1 and 2 clocks
    reg            hact_r;       // received or regenerated hact 

// for debug/test alive    
    reg            vact_r;       
    reg            hact_r2;
    wire           vact_a_mclk;
    wire           hact_ext_a_mclk;
    wire           hact_a_mclk;
    reg            vact_alive;
    reg            hact_ext_alive;
    reg            hact_alive;
    reg  [STATUS_ALIVE_WIDTH-1:0] status_alive;    

    reg      [1:0] prst_with_sens_mrst = 2'h3; // prst extended to include sensor reset and rst_mmcm
    wire           async_prst_with_sens_mrst =  ~imrst | rst_mmcm; // mclk domain   

    assign  prsts = prst_with_sens_mrst[0];  // @pclk - includes sensor reset and sensor PLL reset
    
     
    assign set_pxd_delay =   set_idelay[2:0];
    assign set_other_delay = set_idelay[3];
//    assign status = {pxd_out_pre[1],vact_alive, hact_ext_alive, hact_alive, locked_pxd_mmcm, 
//                     clkin_pxd_stopped_mmcm, clkfb_pxd_stopped_mmcm, xfpgadone,
//                     ps_rdy, ps_out, xfpgatdo, senspgmin};
//    wire [25:0] status; // added byte-wide xfpgatdo

    assign status = {
///                  irst, async_prst_with_sens_mrst, imrst, rst_mmcm, pxd_out_pre[1],
                     xfpgatdo_byte[7:0],
                     vact_alive, hact_ext_alive, hact_alive, locked_pxd_mmcm, 
                     clkin_pxd_stopped_mmcm, clkfb_pxd_stopped_mmcm, xfpgadone,
                     ps_rdy, ps_out,
                     xfpgatdo, senspgmin};
                        
    assign hact_out = hact_r;
    assign iaro = trigger_mode?  ~trig : iaro_soft;
    
    assign     irst=irst_r[2];
    
    always @ (posedge ipclk) begin
//        irst_r <= {irst_r[1:0], prst};
        irst_r <= {irst_r[1:0], prsts}; // extended reset that includes sensor reset and rst_mmcm
        set_width_ipclk_r <= irst_r[2] && !irst_r[1];
    end

    always @(posedge pclk or posedge async_prst_with_sens_mrst) begin
        if (async_prst_with_sens_mrst) prst_with_sens_mrst <=  2'h3;
        else if (prst)                 prst_with_sens_mrst <=  2'h3;
        else                           prst_with_sens_mrst <= prst_with_sens_mrst >> 1;
    end
    
    always @(posedge mclk) begin
        if      (mclk_rst) data_r <= 0;
        else if (cmd_we)   data_r <= cmd_data;
        
        if      (mclk_rst) set_idelay <= 0;
        else               set_idelay <=  {4{cmd_we}} & {(cmd_a==(SENSIO_DELAYS+3)),
                                             (cmd_a==(SENSIO_DELAYS+2)),
                                             (cmd_a==(SENSIO_DELAYS+1)),
                                             (cmd_a==(SENSIO_DELAYS+0))};
        if (mclk_rst) set_status_r <=0;
        else          set_status_r <= cmd_we && (cmd_a== SENSIO_STATUS);                             
        
        if (mclk_rst) set_ctrl_r <=0;
        else          set_ctrl_r <= cmd_we && (cmd_a== SENSIO_CTRL);                             
        
        if (mclk_rst) set_jtag_r <=0;
        else          set_jtag_r <= cmd_we && (cmd_a== SENSIO_JTAG);
        
        if      (mclk_rst)                                  xpgmen <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_PGMEN + 1]) xpgmen <= data_r[SENS_JTAG_PGMEN]; 

        if      (mclk_rst)                                  xfpgaprog <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_PROG + 1])  xfpgaprog <= data_r[SENS_JTAG_PROG]; 
                                     
        if      (mclk_rst)                                  xfpgatck <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_TCK + 1])   xfpgatck <= data_r[SENS_JTAG_TCK];
        
        // shift xfpgatdo to xfpgatdo_byte each time xfpgatck is 0->1
        if      (mclk_rst)                                                                       xfpgatdo_byte <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_TCK + 1] && !xfpgatck &&  data_r[SENS_JTAG_TCK]) xfpgatdo_byte <= {xfpgatdo_byte[6:0], xfpgatdo}; 

        if      (mclk_rst)                                  xfpgatms <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_TMS + 1])   xfpgatms <= data_r[SENS_JTAG_TMS]; 

        if      (mclk_rst)                                  xfpgatdi <= 0;
        else if (set_jtag_r && data_r[SENS_JTAG_TDI + 1])   xfpgatdi <= data_r[SENS_JTAG_TDI];
        
        if      (mclk_rst)                                      imrst <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_MRST + 1])      imrst <= data_r[SENS_CTRL_MRST]; 
         
        if      (mclk_rst)                                      iarst <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_ARST + 1])      iarst <= data_r[SENS_CTRL_ARST]; 
         
        if      (mclk_rst)                                      iaro_soft <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_ARO + 1])       iaro_soft <= data_r[SENS_CTRL_ARO]; 
         
        if      (mclk_rst)                                      rst_mmcm <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_RST_MMCM + 1])  rst_mmcm <= data_r[SENS_CTRL_RST_MMCM]; 
         
        if      (mclk_rst)                                      sel_ext_clk <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_EXT_CLK + 1])   sel_ext_clk <= data_r[SENS_CTRL_EXT_CLK]; 
         
        if      (mclk_rst)                                      quadrants <= 0;
        else if (set_ctrl_r && data_r[SENS_CTRL_QUADRANTS_EN])  quadrants <= data_r[SENS_CTRL_QUADRANTS +: SENS_CTRL_QUADRANTS_WIDTH]; 

        if  (mclk_rst) ld_idelay <= 0;
        else           ld_idelay <= set_ctrl_r && data_r[SENS_CTRL_LD_DLY]; 
        
        if  (mclk_rst) set_width_r <= 0;
        else           set_width_r <= {set_width_r[0],cmd_we && (cmd_a== SENSIO_WIDTH)}; 
        
        if      (mclk_rst)       line_width_m1 <= 0;
        else if (set_width_r[1]) line_width_m1 <= data_r[LINE_WIDTH_BITS-1:0] -1;
        
        if      (mclk_rst)       line_width_internal <= 0;
        else if (set_width_r[1]) line_width_internal <= ~ (|data_r[LINE_WIDTH_BITS:0]); // line width is 0
    end

    always @(posedge ipclk) begin
        if (irst)                 line_width_m1_ipclk <= 0;
        else if (set_width_ipclk) line_width_m1_ipclk <= line_width_m1;
    
        if (irst)                 line_width_internal_ipclk <= 0;
        else if (set_width_ipclk) line_width_internal_ipclk <= line_width_internal;

        // generate delayed hact to switch between original/delayed
        if (irst) hact_ext_d <= 0;
        else      hact_ext_d <= hact_ext_direct;

        // regenerate/propagate  HACT
        if (irst) hact_ext_r <= 0;
        else      hact_ext_r <= hact_ext;
        
        if      (irst)                                                      hact_r <= 0;
        else if (hact_ext && !hact_ext_r)                                   hact_r <= 1;
        else if (line_width_internal_ipclk?(hact_ext ==0):(hact_cntr == 0)) hact_r <= 0; 
        
        if      (irst)                                 hact_cntr <= 0;
        else if (hact_ext && !hact_ext_r)              hact_cntr <= line_width_m1_ipclk; // from mclk
        else if (hact_r && !line_width_internal_ipclk) hact_cntr <= hact_cntr - 1;
        
        pxd_out <=  pxd_out_pre;
        vact_out <= vact_out_pre;
        
        // for debug/test alive  
        vact_r <= vact_out_pre;
        hact_r2 <= hact_r;
        
    end
    
    // for debug/test alive  
    always @(posedge mclk) begin
        if (mclk_rst || set_status_r) vact_alive     <= 0;
        else if (vact_a_mclk)         vact_alive     <= 1;
        
        if (mclk_rst || set_status_r) hact_ext_alive <= 0;
        else if (hact_ext_a_mclk)     hact_ext_alive <= 1;
        
        if (mclk_rst || set_status_r) hact_alive     <= 0;
        else if (hact_a_mclk)         hact_alive     <= 1;
        
        if (mclk_rst || set_status_r) status_alive     <= 0;
        else                          status_alive     <= status_alive | status_alive_1cyc;
        
    end
        
/*
 Control programming of external FPGA on the sensor/sensor multiplexor board
 Mulptiplex status signals into a single line
 bits:
  9: 8 - 3 - set xpgmen,
       - 2 - reset xpgmen,  
       - 0, 1 - no changes to xpgmen
  7: 6 - 3 - set xfpgaprog,
       - 2 - reset xfpgaprog,  
       - 0, 1 - no changes to xfpgaprog
  5: 4 - 3 - set xfpgatck,
       - 2 - reset xfpgatck,  
       - 0, 1 - no changes to xfpgatck
  3: 2 - 3 - set xfpgatms,
       - 2 - reset xfpgatms,
       - 0, 1 - no changes to xfpgatms
  1: 0 - 3 - set xfpgatdi,
       - 2 - reset xfpgatdi,
       - 0, 1 - no changes to xfpgatdi
    parameter SENS_CTRL_MRST=      0,  //  1: 0
    parameter SENS_CTRL_ARST=      2,  //  3: 2
    parameter SENS_CTRL_ARO=       4,  //  5: 4
    parameter SENS_CTRL_RST_MMCM=  6,  //  7: 6
    parameter SENS_CTRL_EXT_CLK=   8,  //  9: 8
    parameter SENS_CTRL_LD_DLY=   10,  // 10
    parameter SENS_CTRL_QUADRANTS=12,  // 17:12, enable - 20
       
*/
    
    pulse_cross_clock pulse_cross_clock_set_width_ipclk_i (
        .rst         (mclk_rst),          // input
        .src_clk     (mclk),              // input
        .dst_clk     (ipclk),             // input
        .in_pulse    (set_width_r[1]),    // input
        .out_pulse   (set_width_ipclk_w), // output
        .busy() // output
    );
    
    
    
    cmd_deser #(
        .ADDR        (SENSIO_ADDR),
        .ADDR_MASK   (SENSIO_ADDR_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (3),
        .DATA_WIDTH  (32)
    ) cmd_deser_sens_io_i (
        .rst         (1'b0),     // rst), // input
        .clk         (mclk),     // input
        .srst        (mclk_rst), // input
        .ad          (cmd_ad),   // input[7:0] 
        .stb         (cmd_stb),  // input
        .addr        (cmd_a),    // output[15:0] 
        .data        (cmd_data), // output[31:0] 
        .we          (cmd_we)    // output
    );

    status_generate #(
        .STATUS_REG_ADDR(SENSIO_STATUS_REG),
//        .PAYLOAD_BITS(15+3+STATUS_ALIVE_WIDTH) // STATUS_PAYLOAD_BITS)
//        .PAYLOAD_BITS(15+3+STATUS_ALIVE_WIDTH+1) // STATUS_PAYLOAD_BITS)
        .PAYLOAD_BITS(26) // STATUS_PAYLOAD_BITS)
    ) status_generate_sens_io_i (
        .rst        (1'b0),         // rst), // input
        .clk        (mclk),         // input
        .srst       (mclk_rst),     // input
        .we         (set_status_r), // input
        .wd         (data_r[7:0]),  // input[7:0] 
//        .status     ({status_alive,status}),       // input[25:0] 
        .status     ({status}),       // input[25:0] 
        .ad         (status_ad),    // output[7:0] 
        .rq         (status_rq),    // output
        .start      (status_start)  // input
    );
    
    
    
    
    // 2 lower PXD bits are multifunction (used for JTAG), instance them individually
    pxd_single #(
        .IODELAY_GRP           (IODELAY_GRP),
        .IDELAY_VALUE          (IDELAY_VALUE),
        .PXD_DRIVE             (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
        .PXD_IOSTANDARD        (PXD_IOSTANDARD),
        .PXD_SLEW              (PXD_SLEW),
        .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
    ) pxd_pxd0_i (
        .pxd            (pxd[0]),          // inout
        .pxd_out        (xfpgatdi),        // input
        .pxd_en         (xpgmen),          // input
        .pxd_async      (),                // output
        .pxd_in         (pxd_out_pre[0]),  // output
        .ipclk          (ipclk),           // input
        .ipclk2x        (ipclk2x),         // input
        .mrst           (mclk_rst),        // input
        .irst           (irst),            // input
        .mclk           (mclk),            // input
        .dly_data       (data_r[7:0]),          // input[7:0] 
        .set_idelay     (set_pxd_delay[0]),// input
        .ld_idelay      (ld_idelay),       // input
        .quadrant       (quadrants[1:0])   // input[1:0] 
    );
    
// debugging implementation
//assign xfpgatdo = pxd_out[1];
    /* Instance template for module iobuf */
//`define DEBUF_JTAG 1
`ifdef DEBUF_JTAG    
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) pxd_pxd1_i (
        .O            (pxd_out_pre[1]), // output
        .IO           (pxd[1]), // inout
        .I            (1'b0), // input
        .T            (1'b1) // input
    );
    assign xfpgatdo = pxd_out_pre[1];
`else
    wire n_xfpgatdo;
    assign xfpgatdo = !n_xfpgatdo;
    pxd_single #(
        .IODELAY_GRP           (IODELAY_GRP),
        .IDELAY_VALUE          (IDELAY_VALUE),
        .PXD_DRIVE             (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
        .PXD_IOSTANDARD        (PXD_IOSTANDARD),
        .PXD_SLEW              (PXD_SLEW),
        .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
    ) pxd_pxd1_i (
        .pxd            (pxd[1]),          // inout
        .pxd_out        (1'b0),            // input
        .pxd_en         (1'b0),            // input
        .pxd_async      (n_xfpgatdo),      // output
        .pxd_in         (pxd_out_pre[1]),  // output
        .ipclk          (ipclk),           // input
        .ipclk2x        (ipclk2x),         // input
        .mrst           (mclk_rst),        // input
        .irst           (irst),            // input
        .mclk           (mclk),            // input
        .dly_data       (data_r[15:8]),    // input[7:0] 
        .set_idelay     (set_pxd_delay[0]),// input
        .ld_idelay      (ld_idelay),       // input
        .quadrant       (quadrants[1:0])   // input[1:0] 
    );
`endif    
    
    
    
    // bits 2..11 are just PXD inputs, instance them all together
    generate
        genvar i;
        for (i=2; i < 12; i=i+1) begin: pxd_block
            pxd_single #(
                .IODELAY_GRP           (IODELAY_GRP),
                .IDELAY_VALUE          (IDELAY_VALUE),
                .PXD_DRIVE             (PXD_DRIVE),
                .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
                .PXD_IOSTANDARD        (PXD_IOSTANDARD),
                .PXD_SLEW              (PXD_SLEW),
                .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
                .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
            ) pxd_pxd2_12_i (
                .pxd            (pxd[i]),          // inout
                .pxd_out        (1'b0),            // input
                .pxd_en         (1'b0),            // input
                .pxd_async      (),                // output
                .pxd_in         (pxd_out_pre[i]),  // output
                .ipclk          (ipclk),           // input
                .ipclk2x        (ipclk2x),         // input
                .mrst           (mclk_rst),        // input
                .irst           (irst),            // input
                .mclk           (mclk),            // input
//                .dly_data       (data_r[8*((i+2)&3)+:8]), // input[7:0] alternating bytes of 32-bit word
//                .set_idelay     (set_pxd_delay[(i+2)>>2]),// input 0 for pxd[3:2], 1 for pxd[7:4], 2 for pxd [11:8]
                .dly_data       (data_r[8 * (i & 3) +: 8]), // input[7:0] alternating bytes of 32-bit word
                .set_idelay     (set_pxd_delay[i >> 2]),// input 0 for pxd[3:2], 1 for pxd[7:4], 2 for pxd [11:8]
                .ld_idelay      (ld_idelay),       // input
                .quadrant       (quadrants[1:0])   // input[1:0] 
            );
        end
    endgenerate
    
    pxd_single #(
        .IODELAY_GRP           (IODELAY_GRP),
        .IDELAY_VALUE          (IDELAY_VALUE),
        .PXD_DRIVE             (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
        .PXD_IOSTANDARD        (PXD_IOSTANDARD),
        .PXD_SLEW              (PXD_SLEW),
        .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
    ) pxd_hact_i (
        .pxd            (hact),           // inout
        .pxd_out        (1'b0),           // input
        .pxd_en         (1'b0),           // input
        .pxd_async      (),               // output
        .pxd_in         (hact_ext_direct),// output
        .ipclk          (ipclk),          // input
        .ipclk2x        (ipclk2x),        // input
        .mrst           (mclk_rst),       // input
        .irst           (irst),           // input
        .mclk           (mclk),           // input
        .dly_data       (data_r[7:0]),    // input[7:0] 
        .set_idelay     (set_other_delay),// input
        .ld_idelay      (ld_idelay),      // input
        .quadrant       (quadrants[3:2])  // input[1:0] 
    );
    
    pxd_single #(
        .IODELAY_GRP           (IODELAY_GRP),
        .IDELAY_VALUE          (IDELAY_VALUE),
        .PXD_DRIVE             (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
        .PXD_IOSTANDARD        (PXD_IOSTANDARD),
        .PXD_SLEW              (PXD_SLEW),
        .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
    ) pxd_vact_i (
        .pxd            (vact),          // inout
        .pxd_out        (1'b0),          // input
        .pxd_en         (1'b0),          // input
        .pxd_async      (),              // output
        .pxd_in         (vact_out_pre),  // output
        .ipclk          (ipclk),         // input
        .ipclk2x        (ipclk2x),       // input
        .mrst           (mclk_rst),      // input
        .irst           (irst),            // input
        .mclk           (mclk),          // input
        .dly_data       (data_r[15:8]),  // input[7:0] 
        .set_idelay     (set_other_delay),// input
        .ld_idelay      (ld_idelay),     // input
        .quadrant       (quadrants[5:4]) // input[1:0] 
    );
    // receive clock from sensor
    pxd_clock #(
        .IODELAY_GRP           (IODELAY_GRP),
        .IDELAY_VALUE          (IDELAY_VALUE),
        .PXD_DRIVE             (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
        .PXD_IOSTANDARD        (PXD_IOSTANDARD),
        .PXD_SLEW              (PXD_SLEW),
        .REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE)
    ) pxd_clock_i (
        .pxclk      (bpf),             // inout
        .pxclk_out  (1'b0),            // input
        .pxclk_en   (1'b0),            // input
        .pxclk_in   (ibpf),            // output
        .rst        (mclk_rst),        // input
        .mclk       (mclk),            // input
        .dly_data   (data_r[23:16]),   // input[7:0] 
        .set_idelay (set_other_delay), // input
        .ld_idelay  (ld_idelay)        // input
    );
    // generate dclk output
    oddr_ss #(
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW),
        .DDR_CLK_EDGE ("OPPOSITE_EDGE"),
        .INIT         (1'b0),
        .SRTYPE       ("SYNC")
    ) dclk_i (
        .clk   (pclk), // input
        .ce    (1'b1), // input
        .rst   (prst), // input
        .set   (1'b0), // input
        .din   (2'b01), // input[1:0] 
        .tin   (1'b0), // input
        .dq    (dclk) // output
    );

    // generate ARO/TCK
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) aro_tck_i (
        .O  (),                        // output - currently not used
        .IO (aro),                     // inout I/O pad
        .I  (xpgmen? xfpgatck : iaro), // input
        .T  (1'b0)                     // input - always on
    );

    // generate ARST/TMS
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) arst_tms_i (
        .O  (),                         // output - currently not used
        .IO (arst),                     // inout I/O pad
        .I  (xpgmen? xfpgatms : iarst), // input
        .T  (1'b0)                      // input - always on
    );
    
    // generate MRST/ receive DONE
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) mrst_done_i (
        .O  (xfpgadone),  // output - done from external FPGA
        .IO (mrst),       // inout I/O pad
        .I  (imrst),      // input
        .T  (xpgmen)      // input - disable when reading DONE
    );
    
    // Probe programmable/ control PROGRAM pin
    reg [1:0] xpgmen_d;
    reg force_senspgm=0;
    
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) senspgm_i (
        .O  (senspgmin),                         // output -senspgm pin state
        .IO (senspgm),                           // inout I/O pad
        .I  (xpgmen?(~xfpgaprog):force_senspgm), // input
        .T  (~(xpgmen || force_senspgm))         // input - disable when reading DONE
    );
    // pullup for mrst (used as input for "DONE") and senspgm (grounded on sensor boards)
    mpullup i_mrst_pullup(mrst);
    mpullup i_senspgm_pullup(senspgm);
    always @ (posedge mclk) begin
        if      (mclk_rst)              force_senspgm <= 0;
        else if (xpgmen_d[1:0]==2'b10) force_senspgm <= senspgmin;
        if      (mclk_rst) xpgmen_d <= 0;
        else               xpgmen_d <= {xpgmen_d[0], xpgmen};
    end

    // generate phase-shifterd pixel clock (and 2x version) from either the internal clock (that is output to the sensor) or from the clock
    // received from the sensor (may need to reset MMCM after resetting sensor)
    mmcm_phase_cntr #(
        .PHASE_WIDTH         (SENS_PHASE_WIDTH),
        .CLKIN_PERIOD        (CLKIN_PERIOD_SENSOR), // SENS_PCLK_PERIOD), assuming both sources have the same frequency!
        .BANDWIDTH           (SENS_BANDWIDTH),
        .CLKFBOUT_MULT_F     (CLKFBOUT_MULT_SENSOR), //8
        .DIVCLK_DIVIDE       (SENS_DIVCLK_DIVIDE),
        .CLKFBOUT_PHASE      (CLKFBOUT_PHASE_SENSOR),
        .CLKOUT0_PHASE       (IPCLK_PHASE),
        .CLKOUT1_PHASE       (IPCLK2X_PHASE),
//        .CLKOUT2_PHASE          (0.000),
//        .CLKOUT3_PHASE          (0.000),
//        .CLKOUT4_PHASE          (0.000),
//        .CLKOUT5_PHASE          (0.000),
//        .CLKOUT6_PHASE          (0.000),
        .CLKFBOUT_USE_FINE_PS("FALSE"),
        .CLKOUT0_USE_FINE_PS ("TRUE"),
        .CLKOUT1_USE_FINE_PS ("TRUE"),
//        .CLKOUT2_USE_FINE_PS ("FALSE"),
//        .CLKOUT3_USE_FINE_PS ("FALSE"),
//        .CLKOUT4_USE_FINE_PS("FALSE"),
//        .CLKOUT5_USE_FINE_PS("FALSE"),
//        .CLKOUT6_USE_FINE_PS("FALSE"),
        .CLKOUT0_DIVIDE_F    (8.000),
        .CLKOUT1_DIVIDE      (4),
//        .CLKOUT2_DIVIDE      (1),
//        .CLKOUT3_DIVIDE      (1),
//        .CLKOUT4_DIVIDE(1),
//        .CLKOUT5_DIVIDE(1),
//        .CLKOUT6_DIVIDE(1),
        .COMPENSATION        ("ZHOLD"),
        .REF_JITTER1         (SENS_REF_JITTER1),
        .REF_JITTER2         (SENS_REF_JITTER2),
        .SS_EN               (SENS_SS_EN),
        .SS_MODE             (SENS_SS_MODE),
        .SS_MOD_PERIOD       (SENS_SS_MOD_PERIOD),
        .STARTUP_WAIT        ("FALSE")
    ) mmcm_phase_cntr_i (
        .clkin1              (pclk),            // input
        .clkin2              (ibpf),            // input
        .sel_clk2            (sel_ext_clk),     // input
        .clkfbin             (clk_fb),          // input
        .rst                 (rst_mmcm),        // input
        .pwrdwn              (1'b0),            // input
        .psclk               (mclk),            // input
        .ps_we               (set_other_delay), // input
        .ps_din              (data_r[31:24]),   // input[7:0] 
        .ps_ready            (ps_rdy),          // output
        .ps_dout             (ps_out),          // output[7:0] reg 
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
    generate
        if      (BUF_IPCLK == "BUFG")  BUFG  clk1x_i (.O(ipclk),   .I(ipclk_pre));
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

// BUFR ipclk_bufr_i   (.O(ipclk),   .CE(), .CLR(), .I(ipclk_pre));
// BUFR ipclk2x_bufr_i (.O(ipclk2x), .CE(), .CLR(), .I(ipclk2x_pre));

// for debug/test alive   
    pulse_cross_clock pulse_cross_clock_vact_a_mclk_i (
        .rst         (irst),                     // input
        .src_clk     (ipclk),                    // input
        .dst_clk     (mclk),                     // input
        .in_pulse    (vact_out_pre && !vact_r),  // input
        .out_pulse   (vact_a_mclk),              // output
        .busy() // output
    );

    pulse_cross_clock pulse_cross_clock_hact_ext_a_mclk_i (
        .rst         (irst),                     // input
        .src_clk     (ipclk),                    // input
        .dst_clk     (mclk),                     // input
        .in_pulse    (hact_ext && !hact_ext_r),  // input
        .out_pulse   (hact_ext_a_mclk),          // output
        .busy() // output
    );

    pulse_cross_clock pulse_cross_clock_hact_a_mclk_i (
        .rst         (irst),                     // input
        .src_clk     (ipclk),                    // input
        .dst_clk     (mclk),                     // input
        .in_pulse    (hact_r && !hact_r2),       // input
        .out_pulse   (hact_a_mclk),              // output
        .busy() // output
    );


endmodule

