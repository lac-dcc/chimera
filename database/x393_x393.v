// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>  x393
 * @file x393.v
 * @date 2015-01-13  
 * @author Andrey Filippov
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *      
 * @brief Elphel NC393 camera FPGA top module
 *
 * <b>License:</b>
 *
 * x393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  x393.v is distributed in the hope that it will be useful,
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
//`define DEBUG_SAXI1 1
`timescale 1ns/1ps
`include "system_defines.vh" 
module  x393 #(
`include "includes/x393_parameters.vh" // SuppressThisWarning VEditor - some not used
)(
    // Sensors interface: I/O pads, pin names match circuit diagram (each sensor)
`ifdef HISPI
    input                  [3:0] sns1_dp,
    input                  [3:0] sns1_dn,
    inout                  [7:4] sns1_dp74, // other non-diff signals
    inout                  [7:4] sns1_dn74, // other non-diff signals
    input                        sns1_clkp,
    input                        sns1_clkn,
    inout                        sns1_scl,
    inout                        sns1_sda,
    inout                        sns1_ctl,
    inout                        sns1_pg,
    
    input                  [3:0] sns2_dp,
    input                  [3:0] sns2_dn,
    inout                  [7:4] sns2_dp74, // other non-diff signals
    inout                  [7:4] sns2_dn74, // other non-diff signals
    input                        sns2_clkp,
    input                        sns2_clkn,
    inout                        sns2_scl,
    inout                        sns2_sda,
    inout                        sns2_ctl,
    inout                        sns2_pg,

    input                  [3:0] sns3_dp,
    input                  [3:0] sns3_dn,
    inout                  [7:4] sns3_dp74, // other non-diff signals
    inout                  [7:4] sns3_dn74, // other non-diff signals
    input                        sns3_clkp,
    input                        sns3_clkn,
    inout                        sns3_scl,
    inout                        sns3_sda,
    inout                        sns3_ctl,
    inout                        sns3_pg,

    input                  [3:0] sns4_dp,
    input                  [3:0] sns4_dn,
    inout                  [7:4] sns4_dp74, // other non-diff signals
    inout                  [7:4] sns4_dn74, // other non-diff signals
    input                        sns4_clkp,
    input                        sns4_clkn,
    inout                        sns4_scl,
    inout                        sns4_sda,
    inout                        sns4_ctl,
    inout                        sns4_pg,
`else
    inout                  [7:0] sns1_dp,
    inout                  [7:0] sns1_dn,
    inout                        sns1_clkp,
    inout                        sns1_clkn,
    inout                        sns1_scl,
    inout                        sns1_sda,
    inout                        sns1_ctl,
    inout                        sns1_pg,
    
    inout                  [7:0] sns2_dp,
    inout                  [7:0] sns2_dn,
    inout                        sns2_clkp,
    inout                        sns2_clkn,
    inout                        sns2_scl,
    inout                        sns2_sda,
    inout                        sns2_ctl,
    inout                        sns2_pg,
    
    inout                  [7:0] sns3_dp,
    inout                  [7:0] sns3_dn,
    inout                        sns3_clkp,
    inout                        sns3_clkn,
    inout                        sns3_scl,
    inout                        sns3_sda,
    inout                        sns3_ctl,
    inout                        sns3_pg,
    
    inout                  [7:0] sns4_dp,
    inout                  [7:0] sns4_dn,
    inout                        sns4_clkp,
    inout                        sns4_clkn,
    inout                        sns4_scl,
    inout                        sns4_sda,
    inout                        sns4_ctl,
    inout                        sns4_pg,
`endif    
    // GPIO pins (1.5V): assigned in 10389: [1:0] - i2c, [5:2] - gpio, [GPIO_N-1:6] - sync i/o
    inout           [GPIO_N-1:0] gpio_pins,
    // DDR3 interface
    output                       SDRST, // DDR3 reset (active low)
    output                       SDCLK, // DDR3 clock differential output, positive
    output                       SDNCLK,// DDR3 clock differential output, negative
    output  [ADDRESS_NUMBER-1:0] SDA,   // output address ports (14:0) for 4Gb device
    output                 [2:0] SDBA,  // output bank address ports
    output                       SDWE,  // output WE port
    output                       SDRAS, // output RAS port
    output                       SDCAS, // output CAS port
    output                       SDCKE, // output Clock Enable port
    output                       SDODT, // output ODT port

    inout                 [15:0] SDD,   // DQ  I/O pads
    output                       SDDML, // LDM  I/O pad (actually only output)
    inout                        DQSL,  // LDQS I/O pad
    inout                        NDQSL, // ~LDQS I/O pad
    output                       SDDMU, // UDM  I/O pad (actually only output)
    inout                        DQSU,  // UDQS I/O pad
    inout                        NDQSU,
    // Clock inputs
    input                        memclk,  // M5
    input                        ffclk0p, // Y12
    input                        ffclk0n, // Y11
    input                        ffclk1p, // W14
    input                        ffclk1n,  // W13
    
// SATA data interface
    input                        RXN, 
    input                        RXP,
    output                       TXN,
    output                       TXP,
// sata clocking iface
    input                        EXTCLK_P,
    input                        EXTCLK_N
    
);
`include "fpga_version.vh"
// Source for reset and clock
`ifndef IGNORE_ATTR
    (* KEEP = "TRUE" *)
`endif    
    wire    [3:0]     fclk;           // PL Clocks [3:0], output
`ifndef IGNORE_ATTR
    (* KEEP = "TRUE" *)
`endif    
    wire    [3:0]     frst;           // PL Clocks [3:0], output
    
// AXI write interface signals
    wire           axi_aclk;          // clock - should be buffered
    wire           axi_grst;          // reset, active high, global (try to get rid of) - trying, removed BUFG
// AXI Write Address
    wire   [31:0]  maxi0_awaddr;      // AWADDR[31:0], input
    wire           maxi0_awvalid;     // AWVALID, input
    wire           maxi0_awready;     // AWREADY, output
    wire   [11:0]  maxi0_awid;        // AWID[11:0], input
    wire   [ 3:0]  maxi0_awlen;       // AWLEN[3:0], input
    wire   [ 1:0]  maxi0_awsize;      // AWSIZE[1:0], input
    wire   [ 1:0]  maxi0_awburst;     // AWBURST[1:0], input
// AXI PS Master GP0: Write Data
    wire   [31:0]  maxi0_wdata;       // WDATA[31:0], input
    wire           maxi0_wvalid;      // WVALID, input
    wire           maxi0_wready;      // WREADY, output
    wire   [11:0]  maxi0_wid;         // WID[11:0], input
    wire           maxi0_wlast;       // WLAST, input
    wire   [ 3:0]  maxi0_wstb;        // WSTRB[3:0], input
// AXI PS Master GP0: Write response
    wire           maxi0_bvalid;      // BVALID, output
    wire           maxi0_bready;      // BREADY, input
    wire   [11:0]  maxi0_bid;         // BID[11:0], output
    wire   [ 1:0]  maxi0_bresp;       // BRESP[1:0], output
   
// BRAM (and other write modules) interface from AXI write
    wire [AXI_WR_ADDR_BITS-1:0] axiwr_pre_awaddr; // same as awaddr_out, early address to decode and return dev_ready
    wire           axiwr_start_burst; // start of write burst, valid pre_awaddr, save externally to control ext. dev_ready multiplexer
    wire           axiwr_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_awaddr@start_burst
    wire           axiwr_wclk;
    wire  [AXI_WR_ADDR_BITS-1:0] axiwr_waddr;
    wire           axiwr_wen;         // external memory write enable, (internally combined with registered dev_ready
// SuppressWarnings VEditor unused (yet?) 
    wire    [3:0]  axiwr_bram_wstb; 
    wire   [31:0]  axiwr_wdata;

 // AXI Read Address   
    wire   [31:0]  maxi0_araddr;  // ARADDR[31:0], input 
    wire           maxi0_arvalid; // ARVALID, input
    wire           maxi0_arready; // ARREADY, output
    wire   [11:0]  maxi0_arid;    // ARID[11:0], input
    wire   [ 3:0]  maxi0_arlen;   // ARLEN[3:0], input
    wire   [ 1:0]  maxi0_arsize;  // ARSIZE[1:0], input
    wire   [ 1:0]  maxi0_arburst; // ARBURST[1:0], input
// AXI Read Data
    wire   [31:0]  maxi0_rdata;   // RDATA[31:0], output
    wire           maxi0_rvalid;  // RVALID, output
    wire           maxi0_rready;  // RREADY, input
    wire   [11:0]  maxi0_rid;     // RID[11:0], output
    wire           maxi0_rlast;   // RLAST, output
    wire   [ 1:0]  maxi0_rresp;

// External memory synchronization
    wire [AXI_RD_ADDR_BITS-1:0] axird_pre_araddr; // same as awaddr_out, early address to decode and return dev_ready
    wire           axird_start_burst; // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
    wire           axird_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_araddr@start_burst
// External memory interface   
// SuppressWarnings VEditor unused (yet?) - use mclk 
    wire           axird_bram_rclk;  // == axi_aclk      .rclk(aclk),                  // clock for read port
   // while only status provides read data, the next signals are not used (relies on axird_pre_araddr, axird_start_burst)
    wire  [AXI_RD_ADDR_BITS-1:0] axird_raddr; //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
    wire           axird_ren;   //      .ren(bram_reg_re_w) ,      // read port enable
    wire           axird_regen; //   .regen(bram_reg_re_w),        // output register enable
    wire  [31:0]   axird_rdata;  //      .data_out(rdata[31:0]),       // data out
//   wire  [31:0]   port0_rdata;  //
    wire  [31:0]   status_rdata;  //
    wire           status_selected;
    wire  [31:0]   readback_rdata;  //
    wire           readback_selected;
    wire  [31:0]   mcntrl_axird_rdata; // read data from the memory controller 


   
    wire           mcntrl_axird_selected; // memory controller has valid data output on mcntrl_axird_rdata 
    reg            status_selected_ren;         // status_selected (set at axird_start_burst) delayed when ren is active
    reg            readback_selected_ren;
    reg            mcntrl_axird_selected_ren;   // mcntrl_axird_selected (set at axird_start_burst) delayed when ren is active
    reg            status_selected_regen;       // status_selected (set at axird_start_burst) delayed when ren is active, then when regen (normally 2 cycles)
    reg            readback_selected_regen;
    reg            mcntrl_axird_selected_regen; // mcntrl_axird_selected (set at axird_start_burst) delayed when ren is active, then when regen (normally 2 cycles)

   // global clocks
    wire           mclk; // global clock, memory controller, command/status network (currently 200MHz)
    wire           mcntrl_locked; // to generate syn resets
    wire           ref_clk; // global clock for idelay_ctrl calibration
    wire           hclk; // global clock, axi_hp (150MHz) derived from aclk_in = 50MHz
   
    // sensor pixel rate clock likely to originate from the external clock
 //TODO: Create missing clocks   
    
    wire           pclk;   // global clock, sensor pixel rate (96 MHz)
`ifdef USE_PCLK2X    
    wire           pclk2x; // global clock, sensor double pixel rate (192 MHz)
`endif
   // compressor pixel rate can be adjusted independently
    wire           xclk;   // global clock, compressor pixel rate (100 MHz)?
`ifdef  USE_XCLK2X     
    wire           xclk2x; // global clock, compressor double pixel rate (200 MHz)
`endif   
    wire           camsync_clk; // global clock used for external synchronization. 96MHz in x353.
                               //  Make it independent of pixel, compressor and mclk so it can be frozen
    wire           logger_clk;  // global clock for the event logger. Use 100 MHz, shared with camsync_clk
    assign logger_clk = camsync_clk;
    
    wire           mrst; // @ posedge mclk
    wire           prst; // @ posedge pclk
    wire           xrst; // @ posedge xclk
    wire           crst; // @ posedge camsync_clk
    wire           lrst; // @ posedge logger_clk;
    wire           arst; // @ posedge axi_aclk;
    wire           hrst; // @ posedge hclk;
    
    wire           locked_sync_clk;
    wire           locked_xclk;
    wire           locked_pclk;
    wire           locked_hclk;
    
    wire           idelay_ctrl_reset; // to reset idelay_cntrl
    
    
   
    wire           time_ref; // RTC reference: integer number of microseconds, less than mclk/2. Not a global clock

    wire [11:0] tmp_debug; 
   
//   reg    select_port0; // May be used later!
    wire axiwr_dev_busy;
    wire axird_dev_busy;
   
   //TODO: The following is the interface to the frame-based command sequencer (not yet implemnted)        
    wire [AXI_WR_ADDR_BITS-1:0] cseq_waddr;   // command sequencer write address (output to command multiplexer)
    wire                        cseq_wr_en;   // command sequencer write enable (output to command multiplexer) - keep until cseq_ackn received
    wire                 [31:0] cseq_wdata;   // command sequencer write data (output to command multiplexer) 
    wire                        cseq_ackn;    // ackn to command sequencer, command sequencer should de-assert cseq_wr_en
    
   // Signals for the frame sequnecer/mux
    wire [4 * AXI_WR_ADDR_BITS-1:0] frseq_waddr; 
    wire                      [3:0] frseq_valid;
    wire                    [127:0] frseq_wdata; 
    wire                      [3:0] frseq_ackn;
    wire                      [3:0] frseq_is;
    wire                      [3:0] frseq_im;
    wire                      [3:0] frseq_irq = frseq_is & frseq_im; // frame interrupts
    
// parallel address/data - where higher bandwidth (single-cycle) is needed        
    wire [AXI_WR_ADDR_BITS-1:0] par_waddr; 
    wire                 [31:0] par_data; 



    wire                  [7:0] cmd_root_ad;       // multiplexed byte-wide serialized address/data to slave devices (AL-AH-D0-D1-D2-D3), may contain less cycles 
    wire                        cmd_root_stb;      // strobe marking the first of 1-6 a/d bytes and also data valid for par_waddr and par_data

    wire                  [7:0] status_root_ad;    // Root status byte-wide address/data 
    wire                        status_root_rq;    // Root status request  
    wire                        status_root_start; // Root status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_mcontr_ad;    // Memory controller status byte-wide address/data 
    wire                        status_mcontr_rq;    // Memory controller status request  
    wire                        status_mcontr_start; // Memory controller status packet transfer start (currently with 0 latency from status_root_rq)
// Not yet connected
    wire                  [7:0] status_membridge_ad;    // membridge (afi to ddr3) status byte-wide address/data 
    wire                        status_membridge_rq;    // membridge (afi to ddr3) status request  
    wire                        status_membridge_start; //membridge (afi to ddr3) status packet transfer start (currently with 0 latency from status_root_rq)

//    wire                  [7:0] status_other_ad = 0; // Other status byte-wide address/data
//    wire                        status_other_rq = 0; // Other status request   
//    wire                        status_other_start;  //


    wire                  [7:0] status_test01_ad;    // Test module status byte-wide address/data 
    wire                        status_test01_rq;    // Test module status request  
    wire                        status_test01_start; // Test module status packet transfer start (currently with 0 latency from status_root_rq)


    wire                  [7:0] status_sensor_ad;     // Other status byte-wide address/data
    wire                        status_sensor_rq;     // Other status request   
    wire                        status_sensor_start;  //

    wire                  [7:0] status_compressor_ad; // Other status byte-wide address/data
    wire                        status_compressor_rq; // Other status request   
    wire                        status_compressor_start;  //


// TODO: Add sequencer status (16+2) bits of current frame number. Ose 'h31 as the address, 'h702 (701..703 were empty) to program
    wire                  [7:0] status_sequencer_ad; // Other status byte-wide address/data
    wire                        status_sequencer_rq; // Other status request   
    wire                        status_sequencer_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)
    

    wire                  [7:0] status_logger_ad; // Other status byte-wide address/data
    wire                        status_logger_rq; // Other status request   
    wire                        status_logger_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_timing_ad; // Other status byte-wide address/data
    wire                        status_timing_rq; // Other status request   
    wire                        status_timing_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_gpio_ad; // Other status byte-wide address/data
    wire                        status_gpio_rq; // Other status request   
    wire                        status_gpio_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_saxi1wr_ad; // saxi1 - logger data Other status byte-wide address/data
    wire                        status_saxi1wr_rq; // Other status request   
    wire                        status_saxi1wr_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_clocks_ad; // saxi1 - logger data Other status byte-wide address/data
    wire                        status_clocks_rq; // Other status request   
    wire                        status_clocks_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)

`ifdef DEBUG_SENS_MEM_PAGES
    wire                  [7:0] dbg_rpage;   
    wire                  [7:0] dbg_wpage;   
`endif              


`ifdef DEBUG_RING
    wire                  [7:0] status_debug_ad; // saxi1 - logger data Other status byte-wide address/data
    wire                        status_debug_rq; // Other status request   
    wire                        status_debug_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)
    
    localparam DEBUG_RING_LENGTH = 3; // increase here, insert new after master 
    
    wire [DEBUG_RING_LENGTH:0]    debug_ring; // TODO: adjust number of bits
    wire                          debug_sl;   // debug shift/load:  0 - idle, (1,0) - shift, (1,1) - load
`endif

`ifdef DEBUG_SAXI1
    wire                  [7:0] status_debug_saxi_ad; // saxi1 - logger data Other status byte-wide address/data
    wire                        status_debug_saxi_rq; // Other status request   
    wire                        status_debug_saxi_start;  // S uppressThisWarning VEditor ****** Other status packet transfer start (currently with 0 latency from status_root_rq)
`endif

    
    // Insert register layer if needed
    reg  [7:0] cmd_mcontr_ad;
    reg        cmd_mcontr_stb;
    
    reg  [7:0] cmd_test01_ad;
    reg        cmd_test01_stb;
    
    reg  [7:0] cmd_membridge_ad;
    reg        cmd_membridge_stb;

    reg  [7:0] cmd_sensor_ad;
    reg        cmd_sensor_stb;

    reg  [7:0] cmd_compressor_ad;
    reg        cmd_compressor_stb;

    reg  [7:0] cmd_sequencer_ad;
    reg        cmd_sequencer_stb;

    reg  [7:0] cmd_logger_ad;
    reg        cmd_logger_stb;

    reg  [7:0] cmd_timing_ad;
    reg        cmd_timing_stb;

    reg  [7:0] cmd_gpio_ad;
    reg        cmd_gpio_stb;

    reg  [7:0] cmd_saxi1wr_ad;
    reg        cmd_saxi1wr_stb;

    reg  [7:0] cmd_clocks_ad;
    reg        cmd_clocks_stb;

`ifdef DEBUG_RING
    reg  [7:0] cmd_debug_ad;
    reg        cmd_debug_stb;
`endif
`ifdef DEBUG_SAXI1
    reg  [7:0] cmd_debug_saxi1_ad;
    reg        cmd_debug_saxi1_stb;
`endif


// membridge
    wire                        frame_start_chn1; // input
    wire                        next_page_chn1; // input
    wire                        cmd_wrmem_chn1;
    wire                        page_ready_chn1; // output
    wire                        frame_done_chn1; // output
    wire[FRAME_HEIGHT_BITS-1:0] line_unfinished_chn1; // output[15:0] 
    wire                        suspend_chn1; // input
    wire                        xfer_reset_page1_rd;
    wire                        buf_wpage_nxt_chn1;
    wire                        buf_wr_chn1;
    wire                 [63:0] buf_wdata_chn1; 
    wire                        xfer_reset_page1_wr;
    wire                        rpage_nxt_chn1;
    wire                        buf_rd_chn1;
    wire                 [63:0] buf_rdata_chn1; 
    
    
    
    
//mcntrl393_test01
    wire                        frame_start_chn2;  // input
    wire                        next_page_chn2;    // input
    wire                        page_ready_chn2; // output
    wire                        frame_done_chn2; // output
    wire[FRAME_HEIGHT_BITS-1:0] line_unfinished_chn2; // output[15:0] 
 //   wire  [LAST_FRAME_BITS-1:0] frame_number_chn2; // output[15:0] 
    wire                        suspend_chn2; // input
    wire                        frame_start_chn3; // input
    wire                        next_page_chn3; // input
    wire                        page_ready_chn3; // output
    wire                        frame_done_chn3; // output
    wire[FRAME_HEIGHT_BITS-1:0] line_unfinished_chn3; // output[15:0] 
//    wire  [LAST_FRAME_BITS-1:0] frame_number_chn3; // output[15:0] 
    wire                        suspend_chn3; // input
    wire                        frame_start_chn4; // input
    wire                        next_page_chn4; // input
    wire                        page_ready_chn4; // output
    wire                        frame_done_chn4; // output
    wire[FRAME_HEIGHT_BITS-1:0] line_unfinished_chn4; // output[15:0]
//    wire  [LAST_FRAME_BITS-1:0] frame_number_chn4; // output[15:0] 
    wire                        suspend_chn4; // input
   
    reg                         axi_rst_pre=1'b1;
    wire                        comb_rst; //=~frst[0] | frst[1];

    wire                 [63:0] gpio_in;
    
    // signals for sensor393 (in/outs as seen for the sensor393)
    wire                  [3:0] sens_rpage_set;  //    (), // input
    wire                  [3:0] sens_frame_run;  // @mclk from mcntrl393 - enable data to memory buffer
    wire                  [3:0] sens_rpage_next; //    (), // input
    wire                  [3:0] sens_buf_rd;     //    (), // input
    wire                [255:0] sens_buf_dout;   //    (), // output[63:0] 
    wire                  [3:0] sens_page_written;     //   single mclk pulse: buffer page (full or partial) is written to the memory buffer 
// TODO: Add counter(s) to count sens_xfer_skipped pulses    
    wire                  [3:0] sens_xfer_skipped;         // single mclk pulse on every skipped (not written) block to record error statistics // SuppressThisWarning VEditor - unused
    wire                  [3:0] sens_first_wr_in_frame;    // single mclk pulse on first write block in each frame
    
    wire                        trigger_mode; //       (), // input
    wire                  [3:0] trig_in;                  // input[3:0] 
        
    wire                  [3:0] sof_out_pclk; //       (), // output[3:0] // SuppressThisWarning VEditor - (yet) unused
    wire                  [3:0] eof_out_pclk; //       (), // output[3:0] // SuppressThisWarning VEditor - (yet) unused
    wire                  [3:0] sof_out_mclk; // Use for sequencer and to start memory write
// if sof_out_mclk is applied to both sequencer and memory controller (as it is now) reprogramming of the sensor->memory
// parameters will be applied to the next frame TODO: Verify that sequencer will always be later than memory controller
// handling this pulse (should be so). Make sure parameters are applied in ASAP in single-trigger mode
    wire                  [3:0] sof_late_mclk; //      (), // output[3:0] 
        
    wire [4 * NUM_FRAME_BITS - 1:0] frame_num;            //       (), // input[15:0] 
    wire [4 * NUM_FRAME_BITS - 1:0] frame_num_compressed; //      (), // input[15:0] 
    // signals for compressor393 (in/outs as seen for the sensor393)
    // per-channel memory buffers interface

    wire   [3:0] cmprs_xfer_reset_page_rd;  // input
    wire   [3:0] cmprs_buf_wpage_nxt;       // input
    wire   [3:0] cmprs_buf_we;              // input
    wire [255:0] cmprs_buf_din;             // input[63:0] 
    wire   [3:0] cmprs_page_ready;          // input
    wire   [3:0] cmprs_next_page;           // output

// per-channel master (sensor)/slave (compressor) synchronization (compressor wait until sensor provided data)
    wire                     [3:0] cmprs_frame_start_dst; // output - trigger receive (tiledc) memory channel (it will take care of single/repetitive
                                                          // these output either follows vsync_late (reclocks it) or generated in non-bonded mode
                                                          // (compress from memory)
    wire                     [3:0] cmprs_frame_start_conf; // memory controller confirmed cmprs_frame_start_dst - normally delayed by 1 clock,
                                                           // or more if there were outstanding memory transactions.                                                           
    wire [4*FRAME_HEIGHT_BITS-1:0] cmprs_line_unfinished_src; // input[15:0] number of the current (unfinished ) line, in the source (sensor)
                                                          //  channel (RELATIVE TO FRAME, NOT WINDOW?)
    wire   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_src;// input[15:0] current frame number (for multi-frame ranges) in the source (sensor) channel
    wire                     [3:0] cmprs_frame_done_src;  // input single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory 
                                                          // frame_done_src is later than line_unfinished_src/ frame_number_src changes
                                                          // Used withe a single-frame buffers
    wire [4*FRAME_HEIGHT_BITS-1:0] cmprs_line_unfinished_dst; // input[15:0] number of the current (unfinished ) line in this (compressor) channel
    wire   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_dst; // input[15:0] current frame number (for multi-frame ranges) in this (compressor channel
    wire                     [3:0] cmprs_frames_in_sync;   // cmprs_frame_number_dst is valid (in bonded mode) 
    wire                     [3:0] cmprs_frame_done_dst;   // input single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
                                                           // use as 'eot_real' in 353 
    wire                     [3:0] cmprs_suspend;          // output suspend reading data for this channel - waiting for the source data
//    wire                     [3:0] cmprs_master_follow;    // compressor memory is in dependent mode, frame number should be copied from sesnor, not reset to 0
    wire   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_finished;  // frame numbers compressed
    

// Timestamp messages (@mclk) - combine to a single ts_data?    
    wire                      [3:0] ts_pre_stb; // input[ 3:0] 4 compressor channels
    wire                     [31:0] ts_data;    // input[31:0] 4 compressor channels

// Timestamp messages (@mclk) - combine to a single ts_data?    
    wire                            ts_pre_logger_stb; // input logger timestamp sync (@logger_clk)
    wire                      [7:0] ts_logegr_data;    // input[7:0] loger timestamp data (@logger_clk) 
   
// Compressor signals for interrupts generation    
    wire                      [3:0] eof_written_mclk;  // output // SuppressThisWarning VEditor - (yet) unused
    wire                      [3:0] stuffer_done_mclk; // output// SuppressThisWarning VEditor - (yet) unused
   
    wire                      [3:0] cmprs_irq;         // compressor done, data confirmed written to memory)
    wire                      [3:0] mult_saxi_irq;     // interrupts from mult_saxi channels
    wire                            membridge_irq;     // interrupt from membridge done
   
// Compressor frame synchronization
  
// GPIO internal signals (for camera GPIOs, not Zynq PS GPIO)
    wire               [GPIO_N-1:0] gpio_rd;          // data read from the external GPIO pins 
    wire               [GPIO_N-1:0] gpio_camsync;     // data out from the camsync module 
    wire               [GPIO_N-1:0] gpio_camsync_en;  // output enable from the camsync module 
    wire               [GPIO_N-1:0] gpio_db;          // data out from the port B (unused,  Motors in x353)
    wire               [GPIO_N-1:0] gpio_db_en;       // output enable from the port B (unused,  Motors in x353)  
    wire               [GPIO_N-1:0] gpio_logger;      // data out from the event_logger module 
    wire               [GPIO_N-1:0] gpio_logger_en;   // output enable from the event_logger module 
    
   // Internal signal for toming393 (camsync) modules
    wire               logger_snap;
   
   // event_logger intermediate signals
    wire        [15:0] logger_out;          // output[15:0] 
    wire               logger_stb;          // output
   // event_logger intermediate signals (after mult_saxi_wr_inbuf - converted to 32 bit wide)
   
    wire               logger_saxi_en;
    wire               logger_has_burst; 
    wire               logger_read_burst;
    wire        [31:0] logger_data32; 
    wire               logger_pre_valid_chn;
    wire               idelay_ctrl_rdy;// just to keep idelay_ctrl instances

// Top level signals for SATA
// MAXIGP1 - interface with SATA controller register memory
    wire       [31:0]  maxi1_araddr;
    wire               maxi1_arvalid;
    wire               maxi1_arready;
    wire       [11:0]  maxi1_arid;
    wire       [3:0]   maxi1_arlen;
    wire       [1:0]   maxi1_arsize;
    wire       [1:0]   maxi1_arburst;
    wire       [31:0]  maxi1_rdata;
    wire               maxi1_rvalid;
    wire               maxi1_rready;
    wire       [11:0]  maxi1_rid;
    wire               maxi1_rlast;
    wire       [1:0]   maxi1_rresp;
    wire       [31:0]  maxi1_awaddr;
    wire               maxi1_awvalid;
    wire               maxi1_awready;
    wire       [11:0]  maxi1_awid;
    wire       [3:0]   maxi1_awlen;
    wire       [1:0]   maxi1_awsize;
    wire       [1:0]   maxi1_awburst;
    wire       [31:0]  maxi1_wdata;
    wire               maxi1_wvalid;
    wire               maxi1_wready;
    wire       [11:0]  maxi1_wid;
    wire               maxi1_wlast;
    wire       [3:0]   maxi1_wstb;
    wire               maxi1_bvalid;
    wire               maxi1_bready;
    wire       [11:0]  maxi1_bid;
    wire       [1:0]   maxi1_bresp;

// SAXIGP3 - SATA comntroller DMA interface with system memory
    wire        [31:0] afi3_awaddr;       // output[31:0]
    wire               afi3_awvalid;      // output
    wire               afi3_awready;      // input
    wire        [ 5:0] afi3_awid;         // output[5:0]
    wire        [ 1:0] afi3_awlock;       // output[1:0]
    wire        [ 3:0] afi3_awcache;      // output[3:0]
    wire        [ 2:0] afi3_awprot;       // output[2:0]
    wire        [ 3:0] afi3_awlen;        // output[3:0]
    wire        [ 1:0] afi3_awsize;       // output[2:0]
    wire        [ 1:0] afi3_awburst;      // output[1:0]
    wire        [ 3:0] afi3_awqos;        // output[3:0]
    wire        [63:0] afi3_wdata;        // output[63:0]
    wire               afi3_wvalid;       // output
    wire               afi3_wready;       // input
    wire        [ 5:0] afi3_wid;          // output[5:0]
    wire               afi3_wlast;        // output
    wire        [ 7:0] afi3_wstrb;        // output[7:0]
    wire               afi3_bvalid;       // input
    wire               afi3_bready;       // output
    wire        [ 5:0] afi3_bid;          // input[5:0]
    wire        [ 1:0] afi3_bresp;        // input[1:0]
    wire        [ 7:0] afi3_wcount;       // input[7:0]
    wire        [ 5:0] afi3_wacount;      // input[5:0]
    wire               afi3_wrissuecap1en;// output
    wire        [31:0] afi3_araddr;       // output[31:0]
    wire               afi3_arvalid;      // output
    wire               afi3_arready;      // input
    wire        [ 5:0] afi3_arid;         // output[5:0]
    wire        [ 1:0] afi3_arlock;       // output[1:0]
    wire        [ 3:0] afi3_arcache;      // output[3:0]
    wire        [ 2:0] afi3_arprot;       // output[2:0]
    wire        [ 3:0] afi3_arlen;        // output[3:0]
    wire        [ 1:0] afi3_arsize;       // output[2:0]
    wire        [ 1:0] afi3_arburst;      // output[1:0]
    wire        [ 3:0] afi3_arqos;        // output[3:0]
    wire        [63:0] afi3_rdata;        // input[63:0]
    wire               afi3_rvalid;       // input
    wire               afi3_rready;       // output
    wire        [ 5:0] afi3_rid;          // input[5:0]
    wire               afi3_rlast;        // input
    wire        [ 1:0] afi3_rresp;        // input[2:0]
    wire        [ 7:0] afi3_rcount;       // input[7:0]
    wire        [ 2:0] afi3_racount;      // input[2:0]
    wire               afi3_rdissuecap1en;// output

    wire               sata_irq;          // ps7 IRQ

    wire               sata_clk    ; // Just output from SATA subsystem SuppressThisWarning VEditor Not used
   
    assign gpio_db = 0;    // unused,  Motors in x353
    assign gpio_db_en = 0; // unused,  Motors in x353
    assign gpio_in= {48'h0,frst,tmp_debug}; // these are PS GPIO pins
   
    assign axird_dev_ready = ~axird_dev_busy; //may combine (AND) multiple sources if needed
    assign axird_dev_busy = 1'b0; // always for now
// Use this later    
    assign axird_rdata= ({32{status_selected_regen}} & status_rdata[31:0]) |
                       ({32{readback_selected_regen}} & readback_rdata[31:0]) |
                       ({32{mcntrl_axird_selected_regen}} & mcntrl_axird_rdata[31:0]);
   
//Debug with this (to show 'x)   
//   assign axird_rdata= status_selected_regen?status_rdata[31:0] : (mcntrl_axird_selected_regen? mcntrl_axird_rdata[31:0]:'bx);

// temporary for Vivado debugging
//   assign axird_rdata= status_rdata[31:0] |  mcntrl_axird_rdata[31:0];

   
   assign axiwr_dev_ready = ~axiwr_dev_busy; //may combine (AND) multiple sources if needed

// Clock and reset from PS
   assign comb_rst=~frst[0] | frst[1];

    // insert register layers if needed
    always @ (posedge mclk) begin
        cmd_mcontr_ad <=      cmd_root_ad;
        cmd_mcontr_stb <=     cmd_root_stb;
        
        cmd_test01_ad <=      cmd_root_ad;
        cmd_test01_stb <=     cmd_root_stb;
        
        cmd_membridge_ad <=   cmd_root_ad;
        cmd_membridge_stb <=  cmd_root_stb;
        
        cmd_sensor_ad <=      cmd_root_ad;
        cmd_sensor_stb <=     cmd_root_stb;
        
        cmd_compressor_ad <=  cmd_root_ad;
        cmd_compressor_stb <= cmd_root_stb;
        
        cmd_sequencer_ad <=   cmd_root_ad;
        cmd_sequencer_stb <=  cmd_root_stb;
        
        cmd_logger_ad <=      cmd_root_ad;
        cmd_logger_stb <=     cmd_root_stb;
        
        cmd_timing_ad <=      cmd_root_ad;
        cmd_timing_stb <=     cmd_root_stb;

        cmd_gpio_ad <=        cmd_root_ad;
        cmd_gpio_stb <=       cmd_root_stb;
        
        cmd_saxi1wr_ad <=     cmd_root_ad;
        cmd_saxi1wr_stb <=    cmd_root_stb;
        
        cmd_clocks_ad <=      cmd_root_ad;
        cmd_clocks_stb <=     cmd_root_stb;

`ifdef DEBUG_RING
        cmd_debug_ad <=      cmd_root_ad;
        cmd_debug_stb <=     cmd_root_stb;
`endif

`ifdef DEBUG_SAXI1
    cmd_debug_saxi1_ad <=      cmd_root_ad;
    cmd_debug_saxi1_stb <=     cmd_root_stb;
`endif

        
    end

// For now - connect status_test01 to status_other, if needed - increase number of multiplexer inputs)
//   assign status_other_ad = status_test01_ad;
//   assign status_other_rq = status_test01_rq;
//   assign status_test01_start = status_other_start;



// delay status_selected and mcntrl_axird_selected to match data for multiplexing

//    always @(posedge axi_grst or posedge axird_bram_rclk) begin // axird_bram_rclk==axi_aclk
    always @(posedge axird_bram_rclk) begin // axird_bram_rclk==axi_aclk

        if      (arst)        status_selected_ren <= 1'b0;
        else if (axird_ren)   status_selected_ren <= status_selected;
        
        if      (arst)        status_selected_regen <= 1'b0;
        else if (axird_regen) status_selected_regen <= status_selected_ren;

        if      (arst)        readback_selected_ren <= 1'b0;
        else if (axird_ren)   readback_selected_ren <= readback_selected;
        
        if      (arst)        readback_selected_regen <= 1'b0;
        else if (axird_regen) readback_selected_regen <= readback_selected_ren;

        if      (arst)        mcntrl_axird_selected_ren <= 1'b0;
        else if (axird_ren)   mcntrl_axird_selected_ren <=  mcntrl_axird_selected;
        
        if      (arst)        mcntrl_axird_selected_regen <= 1'b0;
        else if (axird_regen) mcntrl_axird_selected_regen <= mcntrl_axird_selected_ren;
    end



    always @(posedge comb_rst or posedge axi_aclk) begin 
        if (comb_rst) axi_rst_pre <= 1'b1;
        else          axi_rst_pre <= 1'b0;
    end
     

`ifdef DEBUG_FIFO
        wire    waddr_under, wdata_under, wresp_under; 
        wire    waddr_over, wdata_over, wresp_over;
        reg     waddr_under_r, wdata_under_r, wresp_under_r;
        reg     waddr_over_r, wdata_over_r, wresp_over_r;
        wire    fifo_rst= frst[2];
        wire [3:0]   waddr_wcount; 
        wire [3:0]   waddr_rcount; 
        wire [3:0]   waddr_num_in_fifo; 
        
        wire [3:0]   wdata_wcount; 
        wire [3:0]   wdata_rcount; 
        wire [3:0]   wdata_num_in_fifo; 
        
        wire [3:0]   wresp_wcount; 
        wire [3:0]   wresp_rcount; 
        wire [3:0]   wresp_num_in_fifo; 
        wire [3:0]   wleft;
        wire [3:0]   wlength; // output[3:0] 
        wire [3:0]   wlen_in_dbg; // output[3:0] reg 
        
           
    always @(posedge fifo_rst or posedge axi_aclk) begin
     if (fifo_rst) {waddr_under_r, wdata_under_r, wresp_under_r,waddr_over_r, wdata_over_r, wresp_over_r} <= 0;
     else {waddr_under_r, wdata_under_r, wresp_under_r, waddr_over_r, wdata_over_r, wresp_over_r} <=
          {waddr_under_r, wdata_under_r, wresp_under_r, waddr_over_r, wdata_over_r, wresp_over_r} | 
          {waddr_under,   wdata_under,   wresp_under,   waddr_over,   wdata_over,   wresp_over};
    end         
`endif

// Checking if global axi_grst is not needed anymore:
//BUFG bufg_axi_rst_i   (.O(axi_grst),.I(axi_rst_pre)); // will go only to memory controller (to minimize changes), later - remove from there too
assign axi_grst = axi_rst_pre;


// channel test module
    mcntrl393_test01 #(
        .MCNTRL_TEST01_ADDR                 (MCNTRL_TEST01_ADDR),
        .MCNTRL_TEST01_MASK                 (MCNTRL_TEST01_MASK),
        .FRAME_HEIGHT_BITS                  (FRAME_HEIGHT_BITS),
        .MCNTRL_TEST01_CHN1_MODE            (MCNTRL_TEST01_CHN1_MODE),
        .MCNTRL_TEST01_CHN1_STATUS_CNTRL    (MCNTRL_TEST01_CHN1_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN2_MODE            (MCNTRL_TEST01_CHN2_MODE),
        .MCNTRL_TEST01_CHN2_STATUS_CNTRL    (MCNTRL_TEST01_CHN2_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN3_MODE            (MCNTRL_TEST01_CHN3_MODE),
        .MCNTRL_TEST01_CHN3_STATUS_CNTRL    (MCNTRL_TEST01_CHN3_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN4_MODE            (MCNTRL_TEST01_CHN4_MODE),
        .MCNTRL_TEST01_CHN4_STATUS_CNTRL    (MCNTRL_TEST01_CHN4_STATUS_CNTRL),
        .MCNTRL_TEST01_STATUS_REG_CHN1_ADDR (MCNTRL_TEST01_STATUS_REG_CHN1_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN2_ADDR (MCNTRL_TEST01_STATUS_REG_CHN2_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN3_ADDR (MCNTRL_TEST01_STATUS_REG_CHN3_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN4_ADDR (MCNTRL_TEST01_STATUS_REG_CHN4_ADDR)
    ) mcntrl393_test01_i (
        .mrst                 (mrst),                 // input
        .mclk                 (mclk),                 // input
        .cmd_ad               (cmd_test01_ad),        // input[7:0] 
        .cmd_stb              (cmd_test01_stb),       // input
        .status_ad            (status_test01_ad),     // output[7:0] 
        .status_rq            (status_test01_rq),     // output
        .status_start         (status_test01_start),  // input
        .frame_start_chn1     (),                     //frame_start_chn1), // output
        .next_page_chn1       (),                     //next_page_chn1), // output
        .page_ready_chn1      (1'b0),                 // page_ready_chn1), // input
        .frame_done_chn1      (1'b0),                 //frame_done_chn1), // input
        .line_unfinished_chn1 (16'b0),                //line_unfinished_chn1), // input[15:0] 
        .suspend_chn1         (),                     //suspend_chn1), // output
        .frame_start_chn2     (frame_start_chn2),     // output
        .next_page_chn2       (next_page_chn2),       // output
        .page_ready_chn2      (page_ready_chn2),      // input
        .frame_done_chn2      (frame_done_chn2),      // input
        .line_unfinished_chn2 (line_unfinished_chn2), // input[15:0] 
        .suspend_chn2         (suspend_chn2),         // output
        .frame_start_chn3     (frame_start_chn3),     // output
        .next_page_chn3       (next_page_chn3),       // output
        .page_ready_chn3      (page_ready_chn3),      // input
        .frame_done_chn3      (frame_done_chn3),      // input
        .line_unfinished_chn3 (line_unfinished_chn3), // input[15:0] 
        .suspend_chn3         (suspend_chn3),         // output
        .frame_start_chn4     (frame_start_chn4),     // output
        .next_page_chn4       (next_page_chn4),       // output
        .page_ready_chn4      (page_ready_chn4),      // input
        .frame_done_chn4      (frame_done_chn4),      // input
        .line_unfinished_chn4 (line_unfinished_chn4), // input[15:0] 
        .suspend_chn4         (suspend_chn4)          // output
    );

// Interface to channels to read/write memory (including 4 page BRAM buffers)
// TODO:increase depth, number of NUM_CYCLES - twice?
    cmd_mux #(
        .AXI_WR_ADDR_BITS  (AXI_WR_ADDR_BITS),
        .CONTROL_ADDR      (CONTROL_ADDR),
        .CONTROL_ADDR_MASK (CONTROL_ADDR_MASK),
// TODO: Put correct numcycles!        
        .NUM_CYCLES_LOW_BIT(NUM_CYCLES_LOW_BIT),
        .NUM_CYCLES_00     (NUM_CYCLES_00),
        .NUM_CYCLES_01     (NUM_CYCLES_01),
        .NUM_CYCLES_02     (NUM_CYCLES_02),
        .NUM_CYCLES_03     (NUM_CYCLES_03),
        .NUM_CYCLES_04     (NUM_CYCLES_04),
        .NUM_CYCLES_05     (NUM_CYCLES_05),
        .NUM_CYCLES_06     (NUM_CYCLES_06),
        .NUM_CYCLES_07     (NUM_CYCLES_07),
        .NUM_CYCLES_08     (NUM_CYCLES_08),
        .NUM_CYCLES_09     (NUM_CYCLES_09),
        .NUM_CYCLES_10     (NUM_CYCLES_10),
        .NUM_CYCLES_11     (NUM_CYCLES_11),
        .NUM_CYCLES_12     (NUM_CYCLES_12),
        .NUM_CYCLES_13     (NUM_CYCLES_13),
        .NUM_CYCLES_14     (NUM_CYCLES_14),
        .NUM_CYCLES_15     (NUM_CYCLES_15),
        .NUM_CYCLES_16     (NUM_CYCLES_16),
        .NUM_CYCLES_17     (NUM_CYCLES_17),
        .NUM_CYCLES_18     (NUM_CYCLES_18),
        .NUM_CYCLES_19     (NUM_CYCLES_19),
        .NUM_CYCLES_20     (NUM_CYCLES_20),
        .NUM_CYCLES_21     (NUM_CYCLES_21),
        .NUM_CYCLES_22     (NUM_CYCLES_22),
        .NUM_CYCLES_23     (NUM_CYCLES_23),
        .NUM_CYCLES_24     (NUM_CYCLES_24),
        .NUM_CYCLES_25     (NUM_CYCLES_25),
        .NUM_CYCLES_26     (NUM_CYCLES_26),
        .NUM_CYCLES_27     (NUM_CYCLES_27),
        .NUM_CYCLES_28     (NUM_CYCLES_28),
        .NUM_CYCLES_29     (NUM_CYCLES_29),
        .NUM_CYCLES_30     (NUM_CYCLES_30),
        .NUM_CYCLES_31     (NUM_CYCLES_31)
    ) cmd_mux_i ( // SuppressThisWarning ISExst: Output port <par_data>,<par_waddr>, <cseq_ackn> of the instance <cmd_mux_i> is unconnected or connected to loadless signal.
        .axi_clk      (axiwr_wclk), // input
        .mclk         (mclk), // input
        .mrst         (mrst), // input
        .arst         (arst), // input
        .pre_waddr    (axiwr_pre_awaddr[AXI_WR_ADDR_BITS-1:0]), // input[12:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #cmd_mux_i:pre_waddr[9:0] to constant 0
        .start_wburst (axiwr_start_burst), // input
        .waddr        (axiwr_waddr[AXI_WR_ADDR_BITS-1:0]), // input[12:0] 
        .wr_en        (axiwr_wen), // input
        .wdata        (axiwr_wdata[31:0]), // input[31:0] 
        .busy         (axiwr_dev_busy), // output // assign axiwr_dev_ready = ~axiwr_dev_busy; //may combine (AND) multiple sources if needed
//TODO: The following is the interface to the command sequencer       
        .cseq_waddr   (cseq_waddr), // input[12:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #cmd_mux_i:cseq_waddr[13:0] to constant 0 (command sequencer not yet implemented)
        .cseq_wr_en   (cseq_wr_en), // input // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #cmd_mux_i:cseq_wr_en to constant 0 (command sequencer not yet implemented)
        .cseq_wdata   (cseq_wdata), // input[31:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #cmd_mux_i:cseq_wdata[31:0] to constant 0 (command sequencer not yet implemented)
        .cseq_ackn    (cseq_ackn), // output // SuppressThisWarning ISExst: Assignment to cseq_ackn ignored, since the identifier is never used (command sequencer not yet implemented)
// parallel address/data - where higher bandwidth (single-cycle) is needed        
        .par_waddr    (par_waddr), // output[12:0] // SuppressThisWarning ISExst: Assignment to par_waddr ignored, since the identifier is never used (not yet used)
        .par_data     (par_data), // output[31:0] // SuppressThisWarning ISExst: Assignment to par_data ignored, since the identifier is never used (not yet used)
        // registers may be inserted before byte_ad and ad_stb  
        .byte_ad      (cmd_root_ad), // output[7:0] 
        .ad_stb       (cmd_root_stb) // output
    );

    generate
        genvar i;
            for (i = 0; i < 4; i = i+1) begin: frame_sequencer_block
            cmd_frame_sequencer #(
                .CMDFRAMESEQ_ADDR     (CMDFRAMESEQ_ADDR_BASE + i * CMDFRAMESEQ_ADDR_INC),
                .CMDFRAMESEQ_MASK     (CMDFRAMESEQ_MASK),
                .AXI_WR_ADDR_BITS     (AXI_WR_ADDR_BITS),
                .CMDFRAMESEQ_DEPTH    (CMDFRAMESEQ_DEPTH),
                .CMDFRAMESEQ_ABS      (CMDFRAMESEQ_ABS),
                .CMDFRAMESEQ_REL      (CMDFRAMESEQ_REL),
                .CMDFRAMESEQ_CTRL     (CMDFRAMESEQ_CTRL),
                .CMDFRAMESEQ_RST_BIT  (CMDFRAMESEQ_RST_BIT),
                .CMDFRAMESEQ_RUN_BIT  (CMDFRAMESEQ_RUN_BIT),
                .CMDFRAMESEQ_IRQ_BIT  (CMDFRAMESEQ_IRQ_BIT)
            ) cmd_frame_sequencer_i (
                .mrst        (mrst),                       // input
                .mclk        (mclk),                       // input
                .cmd_ad      (cmd_sequencer_ad),           // input[7:0] 
                .cmd_stb     (cmd_sequencer_stb),          // input
                .frame_sync  (sof_out_mclk[i]),            // input
                .frame_no    (frame_num[i * NUM_FRAME_BITS +: NUM_FRAME_BITS]), // output[3:0] 
                .waddr       (frseq_waddr[i * AXI_WR_ADDR_BITS +: AXI_WR_ADDR_BITS]), // output[13:0] 
                .valid       (frseq_valid[i]),             // output
                .wdata       (frseq_wdata[i * 32 +: 32]),  // output[31:0] 
                .ackn        (frseq_ackn[i]),              // input
                .is          (frseq_is[i]),                // output
                .im          (frseq_im[i])                 // output
                
            );
        end
    endgenerate

    frame_num_sync #(
        .NUM_FRAME_BITS(NUM_FRAME_BITS),
        .LAST_FRAME_BITS(LAST_FRAME_BITS),
        .FRAME_BITS_KEEP(NUM_FRAME_BITS)
    ) frame_num_sync_i (
        .mrst                     (mrst),                        // input
        .mclk                     (mclk),                        // input
        .absolute_frames          (frame_num),                   // input[15:0] 
        .first_wr_in_frame        (sens_first_wr_in_frame),      // input[3:0] 
//        .first_rd_in_frame        (), // input[3:0] 
        .memory_frames_sensor     (cmprs_frame_number_src),      // input[63:0] 
        .memory_frames_compressor (cmprs_frame_number_finished), // input[63:0] 
        .compressed_frames        (frame_num_compressed)         // output[15:0] 
    );


    cmd_seq_mux #(
        .CMDSEQMUX_ADDR      (CMDSEQMUX_ADDR),
        .CMDSEQMUX_MASK      (CMDSEQMUX_MASK),
        .CMDSEQMUX_STATUS    (CMDSEQMUX_STATUS),
        .AXI_WR_ADDR_BITS    (AXI_WR_ADDR_BITS)
    ) cmd_seq_mux_i (
        .mrst         (mrst),                               // input
        .mclk         (mclk),                               // input
        .cmd_ad       (cmd_sequencer_ad),                   // input[7:0] 
        .cmd_stb      (cmd_sequencer_stb),                  // input
        .status_ad    (status_sequencer_ad),                // output[7:0] 
        .status_rq    (status_sequencer_rq),                // output
        .status_start (status_sequencer_start),             // input
        
        .frame_num0   (frame_num[0 * NUM_FRAME_BITS +: 4]), // input[3:0] Use 4 bits even if NUM_FRAME_BITS > 4
        .waddr0       (frseq_waddr[0 * AXI_WR_ADDR_BITS +: AXI_WR_ADDR_BITS]), // input[13:0] 
        .wr_en0       (frseq_valid[0]),                     // input
        .wdata0       (frseq_wdata[0 * 32 +: 32]),          // input[31:0] 
        .ackn0        (frseq_ackn[0]),                      // output
        .is0          (frseq_is[0]),                        // input
        .im0          (frseq_im[0]),                        // input
        
        .frame_num1   (frame_num[1 * NUM_FRAME_BITS +: 4]), // input[3:0] Use 4 bits even if NUM_FRAME_BITS > 4
        .waddr1       (frseq_waddr[1 * AXI_WR_ADDR_BITS +: AXI_WR_ADDR_BITS]), // input[13:0] 
        .wr_en1       (frseq_valid[1]),                     // input
        .wdata1       (frseq_wdata[1 * 32 +: 32]),          // input[31:0] 
        .ackn1        (frseq_ackn[1]),                      // output
        .is1          (frseq_is[1]),                        // input
        .im1          (frseq_im[1]),                        // input
        
        .frame_num2   (frame_num[2 * NUM_FRAME_BITS +: 4]), // input[3:0] Use 4 bits even if NUM_FRAME_BITS > 4
        .waddr2       (frseq_waddr[2 * AXI_WR_ADDR_BITS +: AXI_WR_ADDR_BITS]), // input[13:0] 
        .wr_en2       (frseq_valid[2]),                     // input
        .wdata2       (frseq_wdata[2 * 32 +: 32]),          // input[31:0] 
        .ackn2        (frseq_ackn[2]),                      // output
        .is2          (frseq_is[2]),                        // input
        .im2          (frseq_im[2]),                        // input
        
        .frame_num3   (frame_num[3 * NUM_FRAME_BITS +: 4]), // input[3:0] Use 4 bits even if NUM_FRAME_BITS > 4
        .waddr3       (frseq_waddr[3 * AXI_WR_ADDR_BITS +: AXI_WR_ADDR_BITS]), // input[13:0] 
        .wr_en3       (frseq_valid[3]),                     // input
        .wdata3       (frseq_wdata[3 * 32 +: 32]),          // input[31:0] 
        .ackn3        (frseq_ackn[3]),                      // output
        .is3          (frseq_is[3]),                        // input
        .im3          (frseq_im[3]),                        // input

        .waddr_out    (cseq_waddr),                         // output[13:0] reg 
        .wr_en_out    (cseq_wr_en),                         // output
        .wdata_out    (cseq_wdata),                         // output[31:0] reg 
        .ackn_out     (cseq_ackn)                           // input
    );

    // Mirror control register data for readback (registers can be written both from the PS and from the command sequencer)
    cmd_readback #(
        .AXI_WR_ADDR_BITS        (AXI_WR_ADDR_BITS),
        .AXI_RD_ADDR_BITS        (AXI_RD_ADDR_BITS),
        .CONTROL_RBACK_DEPTH     (CONTROL_RBACK_DEPTH),
        .CONTROL_ADDR            (CONTROL_ADDR),
        .CONTROL_ADDR_MASK       (CONTROL_ADDR_MASK),
        .CONTROL_RBACK_ADDR      (CONTROL_RBACK_ADDR),
        .CONTROL_RBACK_ADDR_MASK (CONTROL_RBACK_ADDR_MASK)
    ) cmd_readback_i (
        .mrst                    (mrst),                                 // input
        .arst                    (arst),                                 // input
        .mclk                    (mclk),                                 // input
        .axi_clk                 (axird_bram_rclk),                      // input
        .par_waddr               (par_waddr),                            // input[13:0] 
        .par_data                (par_data),                             // input[31:0] 
        .ad_stb                  (cmd_root_stb),                         // input
        .axird_pre_araddr        (axird_pre_araddr),                     // input[13:0] 
        .axird_start_burst       (axird_start_burst),                    // input
        .axird_raddr             (axird_raddr[CONTROL_RBACK_DEPTH-1:0]), // input[9:0] 
        .axird_ren               (axird_ren),                            // input
        .axird_rdata             (readback_rdata),                       // output[31:0] 
        .axird_selected          (readback_selected)                     // output
    );

    status_read #(
        .STATUS_ADDR      (STATUS_ADDR),
        .STATUS_ADDR_MASK (STATUS_ADDR_MASK),
        .AXI_RD_ADDR_BITS (AXI_RD_ADDR_BITS),
        .STATUS_DEPTH     (STATUS_DEPTH),
        .FPGA_VERSION     (FPGA_VERSION)
    ) status_read_i (
        .mrst             (mrst),                          // input
        .arst             (arst),                          // input
        .clk              (mclk),                          // input
        .axi_clk          (axird_bram_rclk),               // input == axi_aclk
        .axird_pre_araddr (axird_pre_araddr),              // input[7:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #status_read_i:axird_pre_araddr[9:0] to constant 0
        .axird_start_burst(axird_start_burst),             // input
        .axird_raddr      (axird_raddr[STATUS_DEPTH-1:0]), // input[7:0] 
        .axird_ren        (axird_ren),                     // input
        .axird_regen      (axird_regen),                   // input
        .axird_rdata      (status_rdata),                  // output[31:0] 
        .axird_selected   (status_selected),               // output
        .ad               (status_root_ad),                // input[7:0] 
        .rq               (status_root_rq),                // input
        .start            (status_root_start)              // output
    );

// mux status info from the memory controller and other modules    
    status_router16 status_router16_top_i (
        .rst       (1'b0),                    //axi_rst), // input
        .clk       (mclk),                    // input
        .srst      (mrst),                    // input
        .db_in0    (status_mcontr_ad),        // input[7:0] 
        .rq_in0    (status_mcontr_rq),        // input
        .start_in0 (status_mcontr_start),     // output
        
        .db_in1    (status_test01_ad),        // input[7:0] 
        .rq_in1    (status_test01_rq),        // input
        .start_in1 (status_test01_start),     // output
        
        .db_in2    (status_membridge_ad),     // input[7:0] 
        .rq_in2    (status_membridge_rq),     // input
        .start_in2 (status_membridge_start),  // output

        .db_in3    (status_sensor_ad),        // input[7:0] 
        .rq_in3    (status_sensor_rq),        // input
        .start_in3 (status_sensor_start),     // output
        
        .db_in4    (status_compressor_ad),    // input[7:0] 
        .rq_in4    (status_compressor_rq),    // input
        .start_in4 (status_compressor_start), // output
        
        .db_in5    (status_sequencer_ad),     // input[7:0] 
        .rq_in5    (status_sequencer_rq),     // input
        .start_in5 (status_sequencer_start),  // output
        
        .db_in6    (status_logger_ad),        // input[7:0] 
        .rq_in6    (status_logger_rq),        // input
        .start_in6 (status_logger_start),     // output
        
        .db_in7    (status_timing_ad),        // input[7:0] 
        .rq_in7    (status_timing_rq),        // input
        .start_in7 (status_timing_start),     // output
        
        .db_in8    (status_gpio_ad),          // input[7:0] 
        .rq_in8    (status_gpio_rq),          // input
        .start_in8 (status_gpio_start),       // output
        
        .db_in9    (status_saxi1wr_ad),       // input[7:0] 
        .rq_in9    (status_saxi1wr_rq),       // input
        .start_in9 (status_saxi1wr_start),    // output
        
        .db_in10   (status_clocks_ad),        // input[7:0] 
        .rq_in10   (status_clocks_rq),        // input
        .start_in10(status_clocks_start),     // output
`ifdef DEBUG_RING
        .db_in11   (status_debug_ad),         // input[7:0] 
        .rq_in11   (status_debug_rq),         // input
        .start_in11(status_debug_start),      // output
`else
        .db_in11   (8'b0),                    // input[7:0] 
        .rq_in11   (1'b0),                    // input
        .start_in11(),                        // output
`endif

`ifdef DEBUG_SAXI1
        .db_in12   (status_debug_saxi_ad),    // input[7:0] 
        .rq_in12   (status_debug_saxi_rq),    // input
        .start_in12(status_debug_saxi_start), // output
`else        
        .db_in12   (8'b0),                    // input[7:0] 
        .rq_in12   (1'b0),                    // input
        .start_in12(),                        // output
`endif        
        
        .db_in13   (8'b0),                    // input[7:0] 
        .rq_in13   (1'b0),                    // input
        .start_in13(),                        // output
        
        .db_in14   (8'b0),                    // input[7:0] 
        .rq_in14   (1'b0),                    // input
        .start_in14(),                        // output
        
        .db_in15   (8'b0),                    // input[7:0] 
        .rq_in15   (1'b0),                    // input
        .start_in15(),                        // output

        .db_out    (status_root_ad),          // output[7:0] 
        .rq_out    (status_root_rq),          // output
        .start_out (status_root_start)        // input
    );

    mcntrl393 #(
        .MCONTR_SENS_BASE                  (MCONTR_SENS_BASE),
        .MCONTR_SENS_INC                   (MCONTR_SENS_INC),
        .MCONTR_CMPRS_BASE                 (MCONTR_CMPRS_BASE),
        .MCONTR_CMPRS_INC                  (MCONTR_CMPRS_INC),
        .MCONTR_SENS_STATUS_BASE           (MCONTR_SENS_STATUS_BASE),
        .MCONTR_SENS_STATUS_INC            (MCONTR_SENS_STATUS_INC),
        .MCONTR_CMPRS_STATUS_BASE          (MCONTR_CMPRS_STATUS_BASE),
        .MCONTR_CMPRS_STATUS_INC           (MCONTR_CMPRS_STATUS_INC),
    
        .MCONTR_WR_MASK                    (MCONTR_WR_MASK),
        .MCONTR_RD_MASK                    (MCONTR_RD_MASK),
        .MCONTR_CMD_WR_ADDR                (MCONTR_CMD_WR_ADDR),
        .MCONTR_BUF0_RD_ADDR               (MCONTR_BUF0_RD_ADDR),
        .MCONTR_BUF0_WR_ADDR               (MCONTR_BUF0_WR_ADDR),
        .MCONTR_BUF2_RD_ADDR               (MCONTR_BUF2_RD_ADDR),
        .MCONTR_BUF2_WR_ADDR               (MCONTR_BUF2_WR_ADDR),
        .MCONTR_BUF3_RD_ADDR               (MCONTR_BUF3_RD_ADDR),
        .MCONTR_BUF3_WR_ADDR               (MCONTR_BUF3_WR_ADDR),
        .MCONTR_BUF4_RD_ADDR               (MCONTR_BUF4_RD_ADDR),
        .MCONTR_BUF4_WR_ADDR               (MCONTR_BUF4_WR_ADDR),
        .AXI_WR_ADDR_BITS                  (AXI_WR_ADDR_BITS),
        .AXI_RD_ADDR_BITS                  (AXI_RD_ADDR_BITS),
       
        .DLY_LD                            (DLY_LD),
        .DLY_LD_MASK                       (DLY_LD_MASK),
        .MCONTR_PHY_0BIT_ADDR              (MCONTR_PHY_0BIT_ADDR),
        .MCONTR_PHY_0BIT_ADDR_MASK         (MCONTR_PHY_0BIT_ADDR_MASK),
        .MCONTR_PHY_0BIT_DLY_SET           (MCONTR_PHY_0BIT_DLY_SET),
        .MCONTR_PHY_0BIT_CMDA_EN           (MCONTR_PHY_0BIT_CMDA_EN),
        .MCONTR_PHY_0BIT_SDRST_ACT         (MCONTR_PHY_0BIT_SDRST_ACT),
        .MCONTR_PHY_0BIT_CKE_EN            (MCONTR_PHY_0BIT_CKE_EN),
        .MCONTR_PHY_0BIT_DCI_RST           (MCONTR_PHY_0BIT_DCI_RST),
        .MCONTR_PHY_0BIT_DLY_RST           (MCONTR_PHY_0BIT_DLY_RST),
        .MCONTR_TOP_0BIT_ADDR              (MCONTR_TOP_0BIT_ADDR),
        .MCONTR_TOP_0BIT_ADDR_MASK         (MCONTR_TOP_0BIT_ADDR_MASK),
        .MCONTR_TOP_0BIT_MCONTR_EN         (MCONTR_TOP_0BIT_MCONTR_EN),
        .MCONTR_TOP_0BIT_REFRESH_EN        (MCONTR_TOP_0BIT_REFRESH_EN),
        .MCONTR_PHY_16BIT_ADDR             (MCONTR_PHY_16BIT_ADDR),
        .MCONTR_PHY_16BIT_ADDR_MASK        (MCONTR_PHY_16BIT_ADDR_MASK),
        .MCONTR_PHY_16BIT_PATTERNS         (MCONTR_PHY_16BIT_PATTERNS),
        .MCONTR_PHY_16BIT_PATTERNS_TRI     (MCONTR_PHY_16BIT_PATTERNS_TRI),
        .MCONTR_PHY_16BIT_WBUF_DELAY       (MCONTR_PHY_16BIT_WBUF_DELAY),
        .MCONTR_PHY_16BIT_EXTRA            (MCONTR_PHY_16BIT_EXTRA),
        .MCONTR_PHY_STATUS_CNTRL           (MCONTR_PHY_STATUS_CNTRL),
        .MCONTR_ARBIT_ADDR                 (MCONTR_ARBIT_ADDR),
        .MCONTR_ARBIT_ADDR_MASK            (MCONTR_ARBIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_ADDR             (MCONTR_TOP_16BIT_ADDR),
        .MCONTR_TOP_16BIT_ADDR_MASK        (MCONTR_TOP_16BIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_CHN_EN           (MCONTR_TOP_16BIT_CHN_EN),
        .MCONTR_TOP_16BIT_REFRESH_PERIOD   (MCONTR_TOP_16BIT_REFRESH_PERIOD),
        .MCONTR_TOP_16BIT_REFRESH_ADDRESS  (MCONTR_TOP_16BIT_REFRESH_ADDRESS),
        .MCONTR_TOP_16BIT_STATUS_CNTRL     (MCONTR_TOP_16BIT_STATUS_CNTRL),
        .MCONTR_PHY_STATUS_REG_ADDR        (MCONTR_PHY_STATUS_REG_ADDR),
        .MCONTR_TOP_STATUS_REG_ADDR        (MCONTR_TOP_STATUS_REG_ADDR),
        .CHNBUF_READ_LATENCY               (CHNBUF_READ_LATENCY),
        .DFLT_DQS_PATTERN                  (DFLT_DQS_PATTERN),
        .DFLT_DQM_PATTERN                  (DFLT_DQM_PATTERN),
        .DFLT_DQ_TRI_ON_PATTERN            (DFLT_DQ_TRI_ON_PATTERN),
        .DFLT_DQ_TRI_OFF_PATTERN           (DFLT_DQ_TRI_OFF_PATTERN),
        .DFLT_DQS_TRI_ON_PATTERN           (DFLT_DQS_TRI_ON_PATTERN),
        .DFLT_DQS_TRI_OFF_PATTERN          (DFLT_DQS_TRI_OFF_PATTERN),
        .DFLT_WBUF_DELAY                   (DFLT_WBUF_DELAY),
        .DFLT_INV_CLK_DIV                  (DFLT_INV_CLK_DIV),
        .DFLT_CHN_EN                       (DFLT_CHN_EN),
        .DFLT_REFRESH_ADDR                 (DFLT_REFRESH_ADDR),
        .DFLT_REFRESH_PERIOD               (DFLT_REFRESH_PERIOD),
        .ADDRESS_NUMBER                    (ADDRESS_NUMBER),
        .COLADDR_NUMBER                    (COLADDR_NUMBER),
        .PHASE_WIDTH                       (PHASE_WIDTH),
        .SLEW_DQ                           (SLEW_DQ),
        .SLEW_DQS                          (SLEW_DQS),
        .SLEW_CMDA                         (SLEW_CMDA),
        .SLEW_CLK                          (SLEW_CLK),
        .IBUF_LOW_PWR                      (IBUF_LOW_PWR),
        .REFCLK_FREQUENCY                  (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE             (HIGH_PERFORMANCE_MODE),
        .CLKIN_PERIOD                      (CLKIN_PERIOD),
        .CLKFBOUT_MULT                     (CLKFBOUT_MULT),
        .DIVCLK_DIVIDE                     (DIVCLK_DIVIDE),
        .CLKFBOUT_USE_FINE_PS              (CLKFBOUT_USE_FINE_PS),
        .CLKFBOUT_PHASE                    (CLKFBOUT_PHASE),
        .SDCLK_PHASE                       (SDCLK_PHASE),
        .CLK_PHASE                         (CLK_PHASE),
        .CLK_DIV_PHASE                     (CLK_DIV_PHASE),
        .MCLK_PHASE                        (MCLK_PHASE),
        .REF_JITTER1                       (REF_JITTER1),
        .SS_EN                             (SS_EN),
        .SS_MODE                           (SS_MODE),
        .SS_MOD_PERIOD                     (SS_MOD_PERIOD),
        .CMD_PAUSE_BITS                    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT                      (CMD_DONE_BIT),
        .MCNTRL_PS_ADDR                    (MCNTRL_PS_ADDR),
        .MCNTRL_PS_MASK                    (MCNTRL_PS_MASK),
        .MCNTRL_PS_STATUS_REG_ADDR         (MCNTRL_PS_STATUS_REG_ADDR),
        .MCNTRL_PS_EN_RST                  (MCNTRL_PS_EN_RST),
        .MCNTRL_PS_CMD                     (MCNTRL_PS_CMD),
        .MCNTRL_PS_STATUS_CNTRL            (MCNTRL_PS_STATUS_CNTRL),
        .NUM_XFER_BITS                     (NUM_XFER_BITS),
        .FRAME_WIDTH_BITS                  (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS                 (FRAME_HEIGHT_BITS),
        .LAST_FRAME_BITS                   (LAST_FRAME_BITS),
        .MCNTRL_SCANLINE_CHN1_ADDR         (MCNTRL_SCANLINE_CHN1_ADDR),
        .MCNTRL_SCANLINE_CHN3_ADDR         (MCNTRL_SCANLINE_CHN3_ADDR),
        .MCNTRL_SCANLINE_MASK              (MCNTRL_SCANLINE_MASK),
        .MCNTRL_SCANLINE_MODE              (MCNTRL_SCANLINE_MODE),
        .MCNTRL_SCANLINE_STATUS_CNTRL      (MCNTRL_SCANLINE_STATUS_CNTRL),
        .MCNTRL_SCANLINE_STARTADDR         (MCNTRL_SCANLINE_STARTADDR),
        .MCNTRL_SCANLINE_FRAME_SIZE        (MCNTRL_SCANLINE_FRAME_SIZE),
        .MCNTRL_SCANLINE_FRAME_LAST        (MCNTRL_SCANLINE_FRAME_LAST),
        .MCNTRL_SCANLINE_FRAME_FULL_WIDTH  (MCNTRL_SCANLINE_FRAME_FULL_WIDTH),
        .MCNTRL_SCANLINE_WINDOW_WH         (MCNTRL_SCANLINE_WINDOW_WH),
        .MCNTRL_SCANLINE_WINDOW_X0Y0       (MCNTRL_SCANLINE_WINDOW_X0Y0),
        .MCNTRL_SCANLINE_WINDOW_STARTXY    (MCNTRL_SCANLINE_WINDOW_STARTXY),
        .MCNTRL_SCANLINE_START_DELAY       (MCNTRL_SCANLINE_START_DELAY),
        .MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR),
        .MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR),
        .MCNTRL_SCANLINE_PENDING_CNTR_BITS (MCNTRL_SCANLINE_PENDING_CNTR_BITS),
        .MCNTRL_SCANLINE_FRAME_PAGE_RESET  (MCNTRL_SCANLINE_FRAME_PAGE_RESET),
        .MAX_TILE_WIDTH                    (MAX_TILE_WIDTH),
        .MAX_TILE_HEIGHT                   (MAX_TILE_HEIGHT),
        .MCNTRL_TILED_CHN2_ADDR            (MCNTRL_TILED_CHN2_ADDR),
        .MCNTRL_TILED_CHN4_ADDR            (MCNTRL_TILED_CHN4_ADDR),
        .MCNTRL_TILED_MASK                 (MCNTRL_TILED_MASK),
        .MCNTRL_TILED_MODE                 (MCNTRL_TILED_MODE),
        .MCNTRL_TILED_STATUS_CNTRL         (MCNTRL_TILED_STATUS_CNTRL),
        .MCNTRL_TILED_STARTADDR            (MCNTRL_TILED_STARTADDR),
        .MCNTRL_TILED_FRAME_SIZE           (MCNTRL_TILED_FRAME_SIZE),
        .MCNTRL_TILED_FRAME_LAST           (MCNTRL_TILED_FRAME_LAST),
        .MCNTRL_TILED_FRAME_FULL_WIDTH     (MCNTRL_TILED_FRAME_FULL_WIDTH),
        .MCNTRL_TILED_WINDOW_WH            (MCNTRL_TILED_WINDOW_WH),
        .MCNTRL_TILED_WINDOW_X0Y0          (MCNTRL_TILED_WINDOW_X0Y0),
        .MCNTRL_TILED_WINDOW_STARTXY       (MCNTRL_TILED_WINDOW_STARTXY),
        .MCNTRL_TILED_TILE_WHS             (MCNTRL_TILED_TILE_WHS),
        .MCNTRL_TILED_STATUS_REG_CHN2_ADDR (MCNTRL_TILED_STATUS_REG_CHN2_ADDR),
        .MCNTRL_TILED_STATUS_REG_CHN4_ADDR (MCNTRL_TILED_STATUS_REG_CHN4_ADDR),
        .MCNTRL_TILED_PENDING_CNTR_BITS    (MCNTRL_TILED_PENDING_CNTR_BITS),
        .MCNTRL_TILED_FRAME_PAGE_RESET     (MCNTRL_TILED_FRAME_PAGE_RESET),
        .MCONTR_LINTILE_NRESET             (MCONTR_LINTILE_NRESET),
        .MCONTR_LINTILE_EN                 (MCONTR_LINTILE_EN),
        .MCONTR_LINTILE_WRITE              (MCONTR_LINTILE_WRITE),
        .MCONTR_LINTILE_EXTRAPG            (MCONTR_LINTILE_EXTRAPG),
        .MCONTR_LINTILE_EXTRAPG_BITS       (MCONTR_LINTILE_EXTRAPG_BITS),
        .MCONTR_LINTILE_KEEP_OPEN          (MCONTR_LINTILE_KEEP_OPEN),
        .MCONTR_LINTILE_BYTE32             (MCONTR_LINTILE_BYTE32),
        .MCONTR_LINTILE_LINEAR             (MCONTR_LINTILE_LINEAR), // Use linear mode instead of tiled
        .MCONTR_LINTILE_RST_FRAME          (MCONTR_LINTILE_RST_FRAME),
        .MCONTR_LINTILE_SINGLE             (MCONTR_LINTILE_SINGLE),
        .MCONTR_LINTILE_REPEAT             (MCONTR_LINTILE_REPEAT),
        .MCONTR_LINTILE_DIS_NEED           (MCONTR_LINTILE_DIS_NEED),
        .MCONTR_LINTILE_SKIP_LATE          (MCONTR_LINTILE_SKIP_LATE),
        .MCNTRL_SCANLINE_DLY_WIDTH         (MCNTRL_SCANLINE_DLY_WIDTH),
        .MCNTRL_SCANLINE_DLY_DEFAULT       (MCNTRL_SCANLINE_DLY_DEFAULT),
        .BUFFER_DEPTH32                    (BUFFER_DEPTH32),
        .RSEL                              (RSEL),
        .WSEL                              (WSEL)
    ) mcntrl393_i (
        .rst_in                    (axi_grst), // input global reset, but does not need to be global
        .clk_in                    (axi_aclk), // == axird_bram_rclk SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #mcntrl393_i:clk_in to constant 0
        .mclk                      (mclk), // output
        .mrst                      (mrst),
        .locked                    (mcntrl_locked), // to generate sync reset
        .ref_clk                   (ref_clk), // input
        .idelay_ctrl_reset         (idelay_ctrl_reset), // output
        
        .cmd_ad                    (cmd_mcontr_ad), // input[7:0] 
        .cmd_stb                   (cmd_mcontr_stb), // input
        .status_ad                 (status_mcontr_ad[7:0]), // output[7:0]
        .status_rq                 (status_mcontr_rq),   // input request to send status downstream
        .status_start              (status_mcontr_start), // Acknowledge of the first status packet byte (address)
        
        .axi_clk                   (axird_bram_rclk), // ==axi_aclk, // input - same?
        .axiwr_pre_awaddr          (axiwr_pre_awaddr), // input[12:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #mcntrl393_i:axiwr_pre_awaddr[9:0] to constant 0
        .axiwr_start_burst         (axiwr_start_burst), // input
        .axiwr_waddr               (axiwr_waddr[BUFFER_DEPTH32-1:0]), // input[9:0] 
        .axiwr_wen                 (axiwr_wen), // input
        .axiwr_data                (axiwr_wdata), // input[31:0] 
        
        .axird_pre_araddr          (axird_pre_araddr), // input[12:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #mcntrl393_i:axird_pre_araddr[9:0] to constant 0 (seems to be unused, not undriven) 
        .axird_start_burst         (axird_start_burst), // input
        .axird_raddr               (axird_raddr[BUFFER_DEPTH32-1:0]), // input[9:0] 
        .axird_ren                 (axird_ren), // input
        .axird_regen               (axird_regen), // input
        .axird_rdata               (mcntrl_axird_rdata), // output[31:0]
        .axird_selected            (mcntrl_axird_selected), // output 

// sensors interface
        .sens_sof                  (sof_out_mclk),               // input[3:0]  // Early start of frame pulses (@mclk)
        .sens_frame_run            (sens_frame_run),             // output[3:0] @mclk - enable data to memory buffer
        .sens_rpage_set            (sens_rpage_set),             // output[3:0] 
        .sens_rpage_next           (sens_rpage_next),            // output[3:0] 
        .sens_buf_rd               (sens_buf_rd),                // output[3:0] 
        .sens_buf_dout             (sens_buf_dout),              // input[255:0] 
        .sens_page_written         (sens_page_written),          // input [3:0] single mclk pulse: buffer page (full or partial) is written to the memory buffer 
        .sens_xfer_skipped         (sens_xfer_skipped),          // output reg
        .sens_first_wr_in_frame    (sens_first_wr_in_frame),     // single mclk pulse on first write block in each frame
`ifdef DEBUG_SENS_MEM_PAGES
        .dbg_rpage                 (dbg_rpage[7:0]),             // input[7:0]   
        .dbg_wpage                 (dbg_wpage[7:0]),             // input[7:0]   
`endif              
        
// compressor interface
        .cmprs_xfer_reset_page_rd  (cmprs_xfer_reset_page_rd),   // output[3:0] 
        .cmprs_buf_wpage_nxt       (cmprs_buf_wpage_nxt),        // output[3:0] 
        .cmprs_buf_we              (cmprs_buf_we),               // output[3:0] 
        .cmprs_buf_din             (cmprs_buf_din),              // output[255:0] 
        .cmprs_page_ready          (cmprs_page_ready),           // output[3:0] 
        .cmprs_next_page           (cmprs_next_page),            // input[3:0] 
        .cmprs_first_rd_in_frame   (),                           // output[3:0] reg 
        .cmprs_frame_start_dst     (cmprs_frame_start_dst),      // input[3:0]
        .cmprs_frame_start_conf    (cmprs_frame_start_conf),     // output[3:0] 
        .cmprs_line_unfinished_src (cmprs_line_unfinished_src),  // output[63:0] 
        .cmprs_frame_number_src    (cmprs_frame_number_src),     // output[63:0] 
        .cmprs_frame_done_src      (cmprs_frame_done_src),       // output[3:0] 
        .cmprs_line_unfinished_dst (cmprs_line_unfinished_dst),  // output[63:0] 
        .cmprs_frame_number_dst    (cmprs_frame_number_dst),     // output[63:0]
        .cmprs_frames_in_sync      (cmprs_frames_in_sync),       // output[3:0] 
      
        .cmprs_frame_done_dst      (cmprs_frame_done_dst),       // output[3:0] 
        .cmprs_suspend             (cmprs_suspend),              // input[3:0] 
//        .master_follow             (cmprs_master_follow),        // input[3:0] 
        
 // Originally implemented channels, some are just for testing and may be replaced        
        .frame_start_chn1          (frame_start_chn1),           // input
        .next_page_chn1            (next_page_chn1),             // input
        .cmd_wrmem_chn1            (cmd_wrmem_chn1),             // output
        .page_ready_chn1           (page_ready_chn1),            // output
        .frame_done_chn1           (frame_done_chn1),            // output
        .line_unfinished_chn1      (line_unfinished_chn1),       // output[15:0]
        .suspend_chn1              (suspend_chn1),               // input
        .xfer_reset_page1_rd       (xfer_reset_page1_rd),        // output
        .buf_wpage_nxt_chn1        (buf_wpage_nxt_chn1),         // output
        .buf_wr_chn1               (buf_wr_chn1),                // output
        .buf_wdata_chn1            (buf_wdata_chn1[63:0]),       // output[63:0] 
        .xfer_reset_page1_wr       (xfer_reset_page1_wr),        // output
        .rpage_nxt_chn1            (rpage_nxt_chn1),             // output
        .buf_rd_chn1               (buf_rd_chn1),                // output
        .buf_rdata_chn1            (buf_rdata_chn1[63:0]),       // input[63:0]
        .frame_start_chn2          (frame_start_chn2),           // input
        .next_page_chn2            (next_page_chn2),             // input
        .page_ready_chn2           (page_ready_chn2),            // output
        .frame_done_chn2           (frame_done_chn2),            // output
        .line_unfinished_chn2      (line_unfinished_chn2),       // output[15:0]
        .frame_number_chn2         (), //frame_number_chn2),     // output[15:0]  
        .suspend_chn2              (suspend_chn2),               // input
        
        .frame_start_chn3          (frame_start_chn3),           // input
        .next_page_chn3            (next_page_chn3),             // input
        .page_ready_chn3           (page_ready_chn3),            // output
        .frame_done_chn3           (frame_done_chn3),            // output
        .line_unfinished_chn3      (line_unfinished_chn3),       // output[15:0] 
        .frame_number_chn3         (), //frame_number_chn3),     // output[15:0]  
        .suspend_chn3              (suspend_chn3),               // input
        
        .frame_start_chn4          (frame_start_chn4),           // input
        .next_page_chn4            (next_page_chn4),             // input
        .page_ready_chn4           (page_ready_chn4),            // output
        .frame_done_chn4           (frame_done_chn4),            // output
        .line_unfinished_chn4      (line_unfinished_chn4),       // output[15:0]
        .frame_number_chn4         (), //frame_number_chn4),     // output[15:0]  
        .suspend_chn4              (suspend_chn4),               // input

        .SDRST                     (SDRST),                      // output
        .SDCLK                     (SDCLK),                      // output
        .SDNCLK                    (SDNCLK),                     // output
        .SDA                       (SDA),                        // output[14:0] 
        .SDBA                      (SDBA),                       // output[2:0] 
        .SDWE                      (SDWE),                       // output
        .SDRAS                     (SDRAS),                      // output
        .SDCAS                     (SDCAS),                      // output
        .SDCKE                     (SDCKE),                      // output
        .SDODT                     (SDODT),                      // output
        .SDD                       (SDD),                        // inout[15:0] 
        .SDDML                     (SDDML),                      // output
        .DQSL                      (DQSL),                       // inout
        .NDQSL                     (NDQSL),                      // inout
        .SDDMU                     (SDDMU),                      // output
        .DQSU                      (DQSU),                       // inout
        .NDQSU                     (NDQSU),                      // inout
        .tmp_debug                 (tmp_debug)                   // output[11:0] 
    );
    // AFI0 (AXI_HP0) signals
    wire [31:0] afi0_awaddr;   // output[31:0]
    wire        afi0_awvalid;  // output
    wire        afi0_awready;     // input
    wire [ 5:0] afi0_awid;     // output[5:0] 
    wire [ 1:0] afi0_awlock;     // output[1:0] 
    wire [ 3:0] afi0_awcache;     // output[3:0] 
    wire [ 2:0] afi0_awprot;     // output[2:0] 
    wire [ 3:0] afi0_awlen;     // output[3:0] 
    wire [ 1:0] afi0_awsize;     // output[2:0] 
    wire [ 1:0] afi0_awburst;     // output[1:0] 
    wire [ 3:0] afi0_awqos;     // output[3:0] 
    wire [63:0] afi0_wdata;     // output[63:0] 
    wire        afi0_wvalid;     // output
    wire        afi0_wready;     // input
    wire [ 5:0] afi0_wid;     // output[5:0] 
    wire        afi0_wlast;     // output
    wire [ 7:0] afi0_wstrb;     // output[7:0] 
    wire        afi0_bvalid;     // input
    wire        afi0_bready;     // output
    wire [ 5:0] afi0_bid;     // input[5:0] 
    wire [ 1:0] afi0_bresp;     // input[1:0] 
    wire [ 7:0] afi0_wcount;     // input[7:0] 
    wire [ 5:0] afi0_wacount;     // input[5:0] 
    wire        afi0_wrissuecap1en;     // output
    wire [31:0] afi0_araddr;     // output[31:0] 
    wire        afi0_arvalid;     // output
    wire        afi0_arready;     // input
    wire [ 5:0] afi0_arid;     // output[5:0] 
    wire [ 1:0] afi0_arlock;     // output[1:0] 
    wire [ 3:0] afi0_arcache;     // output[3:0] 
    wire [ 2:0] afi0_arprot;     // output[2:0] 
    wire [ 3:0] afi0_arlen;     // output[3:0] 
    wire [ 1:0] afi0_arsize;     // output[2:0] 
    wire [ 1:0] afi0_arburst;     // output[1:0] 
    wire [ 3:0] afi0_arqos;     // output[3:0] 
    wire [63:0] afi0_rdata;     // input[63:0] 
    wire        afi0_rvalid;     // input
    wire        afi0_rready;     // output
    wire [ 5:0] afi0_rid;     // input[5:0] 
    wire        afi0_rlast;     // input
    wire [ 1:0] afi0_rresp;     // input[2:0] 
    wire [ 7:0] afi0_rcount;     // input[7:0] 
    wire [ 2:0] afi0_racount;     // input[2:0] 
    wire        afi0_rdissuecap1en; // output





    // DDR3 frame memory to system memory bridge over axi_hp
    membridge #(
        .MEMBRIDGE_ADDR         (MEMBRIDGE_ADDR),
        .MEMBRIDGE_MASK         (MEMBRIDGE_MASK),
        .MEMBRIDGE_CTRL         (MEMBRIDGE_CTRL),
        .MEMBRIDGE_STATUS_CNTRL (MEMBRIDGE_STATUS_CNTRL),
        .MEMBRIDGE_LO_ADDR64    (MEMBRIDGE_LO_ADDR64),
        .MEMBRIDGE_SIZE64       (MEMBRIDGE_SIZE64),
        .MEMBRIDGE_START64      (MEMBRIDGE_START64),
        .MEMBRIDGE_LEN64        (MEMBRIDGE_LEN64),
        .MEMBRIDGE_WIDTH64      (MEMBRIDGE_WIDTH64),
//        .MEMBRIDGE_MODE         (MEMBRIDGE_MODE),
        .MEMBRIDGE_CTRL_IRQ     (MEMBRIDGE_CTRL_IRQ),
        .MEMBRIDGE_STATUS_REG   (MEMBRIDGE_STATUS_REG),
        .FRAME_HEIGHT_BITS      (FRAME_HEIGHT_BITS),
        .FRAME_WIDTH_BITS       (FRAME_WIDTH_BITS)
`ifdef DEBUG_RING
        ,.DEBUG_CMD_LATENCY   (DEBUG_CMD_LATENCY) 
`endif        
    ) membridge_i (
        .mrst                   (mrst),                     // input
        .hrst                   (hrst),                     // input
        .mclk                   (mclk),                     // input
        .hclk                   (hclk),                     // input
        .cmd_ad                 (cmd_membridge_ad),         // input[7:0] 
        .cmd_stb                (cmd_membridge_stb),        // input
        .status_ad              (status_membridge_ad[7:0]), // output[7:0] 
        .status_rq              (status_membridge_rq),      // output
        .status_start           (status_membridge_start),   // input
        .irq                    (membridge_irq),            // output
        .frame_start_chn        (frame_start_chn1),         // output
        .next_page_chn          (next_page_chn1),           // output
        .cmd_wrmem              (cmd_wrmem_chn1),           // input
        .page_ready_chn         (page_ready_chn1),          // input
        .frame_done_chn         (frame_done_chn1),          // input
        .line_unfinished_chn1   (line_unfinished_chn1),     // input[15:0] 
        .suspend_chn1           (suspend_chn1),             // output
        .xfer_reset_page_rd     (xfer_reset_page1_rd),      // input
        .buf_wpage_nxt          (buf_wpage_nxt_chn1),       // input
        .buf_wr                 (buf_wr_chn1),              // input
        .buf_wdata              (buf_wdata_chn1[63:0]),     // input[63:0] 
        .xfer_reset_page_wr     (xfer_reset_page1_wr),      // input
        .buf_rpage_nxt          (rpage_nxt_chn1),           // input
        .buf_rd                 (buf_rd_chn1),              // input
        .buf_rdata              (buf_rdata_chn1[63:0]),     // output[63:0] 
        .afi_awaddr             (afi0_awaddr),              // output[31:0] 
        .afi_awvalid            (afi0_awvalid),             // output
        .afi_awready            (afi0_awready),             // input
        .afi_awid               (afi0_awid),                // output[5:0] 
        .afi_awlock             (afi0_awlock),              // output[1:0] 
        .afi_awcache            (afi0_awcache),             // output[3:0] 
        .afi_awprot             (afi0_awprot),              // output[2:0] 
        .afi_awlen              (afi0_awlen),               // output[3:0] 
        .afi_awsize             (afi0_awsize),              // output[2:0] 
        .afi_awburst            (afi0_awburst),             // output[1:0] 
        .afi_awqos              (afi0_awqos),               // output[3:0] 
        .afi_wdata              (afi0_wdata),               // output[63:0] 
        .afi_wvalid             (afi0_wvalid),              // output
        .afi_wready             (afi0_wready),              // input
        .afi_wid                (afi0_wid),                 // output[5:0] 
        .afi_wlast              (afi0_wlast),               // output
        .afi_wstrb              (afi0_wstrb),               // output[7:0] 
        .afi_bvalid             (afi0_bvalid),              // input
        .afi_bready             (afi0_bready),              // output
        .afi_bid                (afi0_bid),                 // input[5:0] 
        .afi_bresp              (afi0_bresp),               // input[1:0] 
        .afi_wcount             (afi0_wcount),              // input[7:0] 
        .afi_wacount            (afi0_wacount),             // input[5:0] 
        .afi_wrissuecap1en      (afi0_wrissuecap1en),       // output
        .afi_araddr             (afi0_araddr),              // output[31:0] 
        .afi_arvalid            (afi0_arvalid),             // output
        .afi_arready            (afi0_arready),             // input
        .afi_arid               (afi0_arid),                // output[5:0] 
        .afi_arlock             (afi0_arlock),              // output[1:0] 
        .afi_arcache            (afi0_arcache),             // output[3:0] 
        .afi_arprot             (afi0_arprot),              // output[2:0] 
        .afi_arlen              (afi0_arlen),               // output[3:0] 
        .afi_arsize             (afi0_arsize),              // output[2:0] 
        .afi_arburst            (afi0_arburst),             // output[1:0] 
        .afi_arqos              (afi0_arqos),               // output[3:0] 
        .afi_rdata              (afi0_rdata),               // input[63:0] 
        .afi_rvalid             (afi0_rvalid),              // input
        .afi_rready             (afi0_rready),              // output
        .afi_rid                (afi0_rid),                 // input[5:0] 
        .afi_rlast              (afi0_rlast),               // input
        .afi_rresp              (afi0_rresp),               // input[2:0] 
        .afi_rcount             (afi0_rcount),              // input[7:0] 
        .afi_racount            (afi0_racount),             // input[2:0] 
        .afi_rdissuecap1en      (afi0_rdissuecap1en)        // output
`ifdef DEBUG_RING       
        ,.debug_do                (debug_ring[2]),               // output
        .debug_sl                 (debug_sl),                    // input
        .debug_di                 (debug_ring[3])                // input
`endif         
    );
    
    // SAXIGP0 signals (read unused)  (for the histograms)
    wire        saxi0_aclk     = hclk; // 150KHz
    wire [31:0] saxi0_awaddr;
    wire        saxi0_awvalid;
    wire        saxi0_awready;
    wire [ 5:0] saxi0_awid; 
    wire [ 1:0] saxi0_awlock; 
    wire [ 3:0] saxi0_awcache; 
    wire [ 2:0] saxi0_awprot; 
    wire [ 3:0] saxi0_awlen; 
    wire [ 1:0] saxi0_awsize; 
    wire [ 1:0] saxi0_awburst; 
    wire [ 3:0] saxi0_awqos; 
    wire [31:0] saxi0_wdata; 
    wire        saxi0_wvalid;
    wire        saxi0_wready;
    wire [ 5:0] saxi0_wid; 
    wire        saxi0_wlast;
    wire [ 3:0] saxi0_wstrb; 
    wire        saxi0_bvalid;
    wire        saxi0_bready;
    wire [ 5:0] saxi0_bid; 
    wire [ 1:0] saxi0_bresp; 

    // SAXIGP1 signals (read unused) (for the event logger - has 3 spare channels for write)
    wire        saxi1_aclk     = hclk; // 150KHz
    wire [31:0] saxi1_awaddr;
    wire        saxi1_awvalid;
    wire        saxi1_awready;
    wire [ 5:0] saxi1_awid; 
    wire [ 1:0] saxi1_awlock; 
    wire [ 3:0] saxi1_awcache; 
    wire [ 2:0] saxi1_awprot; 
    wire [ 3:0] saxi1_awlen; 
    wire [ 1:0] saxi1_awsize; 
    wire [ 1:0] saxi1_awburst; 
    wire [ 3:0] saxi1_awqos; 
    wire [31:0] saxi1_wdata; 
    wire        saxi1_wvalid;
    wire        saxi1_wready;
    wire [ 5:0] saxi1_wid; 
    wire        saxi1_wlast;
    wire [ 3:0] saxi1_wstrb; 
    wire        saxi1_bvalid;
    wire        saxi1_bready;
    wire [ 5:0] saxi1_bid; 
    wire [ 1:0] saxi1_bresp; 

    sensors393 #(
        .SENSOR_GROUP_ADDR          (SENSOR_GROUP_ADDR),
        .SENSOR_BASE_INC            (SENSOR_BASE_INC),
        .HIST_SAXI_ADDR_REL         (HIST_SAXI_ADDR_REL),
        .HIST_SAXI_MODE_ADDR_REL    (HIST_SAXI_MODE_ADDR_REL),
        .SENSI2C_STATUS_REG_BASE    (SENSI2C_STATUS_REG_BASE),
        .SENSI2C_STATUS_REG_INC     (SENSI2C_STATUS_REG_INC),
        .SENSI2C_STATUS_REG_REL     (SENSI2C_STATUS_REG_REL),
        .SENSIO_STATUS_REG_REL      (SENSIO_STATUS_REG_REL),
        .SENSOR_NUM_HISTOGRAM       (SENSOR_NUM_HISTOGRAM),
        .HISTOGRAM_RAM_MODE         (HISTOGRAM_RAM_MODE),
        .SENS_NUM_SUBCHN            (SENS_NUM_SUBCHN),
        .SENS_GAMMA_BUFFER          (SENS_GAMMA_BUFFER),
        .SENSOR_CTRL_RADDR          (SENSOR_CTRL_RADDR),
        .SENSOR_CTRL_ADDR_MASK      (SENSOR_CTRL_ADDR_MASK),
        .SENSOR_HIST_EN_BITS        (SENSOR_HIST_EN_BITS),
        .SENSOR_HIST_NRST_BITS      (SENSOR_HIST_NRST_BITS),
        .SENSOR_HIST_BITS_SET       (SENSOR_HIST_BITS_SET),
        .SENSOR_CHN_EN_BIT          (SENSOR_CHN_EN_BIT),
        .SENSOR_CHN_EN_BIT_SET      (SENSOR_CHN_EN_BIT_SET),
        .SENSOR_16BIT_BIT           (SENSOR_16BIT_BIT),
        .SENSOR_16BIT_BIT_SET       (SENSOR_16BIT_BIT_SET),
        .SENSI2C_CTRL_RADDR         (SENSI2C_CTRL_RADDR),
        .SENSI2C_CTRL_MASK          (SENSI2C_CTRL_MASK),
        .SENSI2C_CTRL               (SENSI2C_CTRL),
        .SENSI2C_CMD_TABLE          (SENSI2C_CMD_TABLE),
        .SENSI2C_CMD_TAND           (SENSI2C_CMD_TAND),
        .SENSI2C_CMD_RESET          (SENSI2C_CMD_RESET),
        .SENSI2C_CMD_RUN            (SENSI2C_CMD_RUN),
        .SENSI2C_CMD_RUN_PBITS      (SENSI2C_CMD_RUN_PBITS),
        .SENSI2C_CMD_FIFO_RD        (SENSI2C_CMD_FIFO_RD),
        .SENSI2C_CMD_ACIVE          (SENSI2C_CMD_ACIVE),
        .SENSI2C_CMD_ACIVE_EARLY0   (SENSI2C_CMD_ACIVE_EARLY0),
        .SENSI2C_CMD_ACIVE_SDA      (SENSI2C_CMD_ACIVE_SDA),
        .SENSI2C_TBL_RAH            (SENSI2C_TBL_RAH),      // high byte of the register address 
        .SENSI2C_TBL_RAH_BITS       (SENSI2C_TBL_RAH_BITS),
        .SENSI2C_TBL_RNWREG         (SENSI2C_TBL_RNWREG),   // read register (when 0 - write register
        .SENSI2C_TBL_SA             (SENSI2C_TBL_SA),       // Slave address in write mode
        .SENSI2C_TBL_SA_BITS        (SENSI2C_TBL_SA_BITS),
        .SENSI2C_TBL_NBWR           (SENSI2C_TBL_NBWR),     // number of bytes to write (1..10)
        .SENSI2C_TBL_NBWR_BITS      (SENSI2C_TBL_NBWR_BITS),
        .SENSI2C_TBL_NBRD           (SENSI2C_TBL_NBRD),     // number of bytes to read (1 - 8) "0" means "8"
        .SENSI2C_TBL_NBRD_BITS      (SENSI2C_TBL_NBRD_BITS),
        .SENSI2C_TBL_NABRD          (SENSI2C_TBL_NABRD),    // number of address bytes for read (0 - 1 byte, 1 - 2 bytes)
        .SENSI2C_TBL_DLY            (SENSI2C_TBL_DLY),      // bit delay (number of mclk periods in 1/4 of SCL period)
        .SENSI2C_TBL_DLY_BITS       (SENSI2C_TBL_DLY_BITS),
        .SENSI2C_STATUS             (SENSI2C_STATUS),
        .SENS_SYNC_RADDR            (SENS_SYNC_RADDR),
        .SENS_SYNC_MASK             (SENS_SYNC_MASK),
        .SENS_SYNC_MULT             (SENS_SYNC_MULT),
        .SENS_SYNC_LATE             (SENS_SYNC_LATE),
        .SENS_GAMMA_RADDR           (SENS_GAMMA_RADDR),
        .SENS_GAMMA_ADDR_MASK       (SENS_GAMMA_ADDR_MASK),
        .SENS_GAMMA_CTRL            (SENS_GAMMA_CTRL),
        .SENS_GAMMA_ADDR_DATA       (SENS_GAMMA_ADDR_DATA),
        .SENS_GAMMA_HEIGHT01        (SENS_GAMMA_HEIGHT01),
        .SENS_GAMMA_HEIGHT2         (SENS_GAMMA_HEIGHT2),
        .SENS_GAMMA_MODE_BAYER      (SENS_GAMMA_MODE_BAYER),
        .SENS_GAMMA_MODE_BAYER_SET  (SENS_GAMMA_MODE_BAYER_SET),
        .SENS_GAMMA_MODE_PAGE       (SENS_GAMMA_MODE_PAGE),
        .SENS_GAMMA_MODE_PAGE_SET   (SENS_GAMMA_MODE_PAGE_SET),
        .SENS_GAMMA_MODE_EN         (SENS_GAMMA_MODE_EN),
        .SENS_GAMMA_MODE_EN_SET     (SENS_GAMMA_MODE_EN_SET),
        .SENS_GAMMA_MODE_REPET      (SENS_GAMMA_MODE_REPET),
        .SENS_GAMMA_MODE_REPET_SET  (SENS_GAMMA_MODE_REPET_SET),
        .SENS_GAMMA_MODE_TRIG       (SENS_GAMMA_MODE_TRIG),
        .SENS_LENS_RADDR            (SENS_LENS_RADDR),
        .SENS_LENS_ADDR_MASK        (SENS_LENS_ADDR_MASK),
        .SENS_LENS_AX               (SENS_LENS_AX),
        .SENS_LENS_AX_MASK          (SENS_LENS_AX_MASK),
        .SENS_LENS_AY               (SENS_LENS_AY),
        .SENS_LENS_AY_MASK          (SENS_LENS_AY_MASK),
        .SENS_LENS_C                (SENS_LENS_C),
        .SENS_LENS_C_MASK           (SENS_LENS_C_MASK),
        .SENS_LENS_BX               (SENS_LENS_BX),
        .SENS_LENS_BX_MASK          (SENS_LENS_BX_MASK),
        .SENS_LENS_BY               (SENS_LENS_BY),
        .SENS_LENS_BY_MASK          (SENS_LENS_BY_MASK),
        .SENS_LENS_SCALES           (SENS_LENS_SCALES),
        .SENS_LENS_SCALES_MASK      (SENS_LENS_SCALES_MASK),
        .SENS_LENS_FAT0_IN          (SENS_LENS_FAT0_IN),
        .SENS_LENS_FAT0_IN_MASK     (SENS_LENS_FAT0_IN_MASK),
        .SENS_LENS_FAT0_OUT         (SENS_LENS_FAT0_OUT),
        .SENS_LENS_FAT0_OUT_MASK    (SENS_LENS_FAT0_OUT_MASK),
        .SENS_LENS_POST_SCALE       (SENS_LENS_POST_SCALE),
        .SENS_LENS_POST_SCALE_MASK  (SENS_LENS_POST_SCALE_MASK),
        .SENSIO_RADDR               (SENSIO_RADDR),
        .SENSIO_ADDR_MASK           (SENSIO_ADDR_MASK),
        .SENSIO_CTRL                (SENSIO_CTRL),
        .SENS_CTRL_MRST             (SENS_CTRL_MRST),
        .SENS_CTRL_ARST             (SENS_CTRL_ARST),
        .SENS_CTRL_ARO              (SENS_CTRL_ARO),
        .SENS_CTRL_RST_MMCM         (SENS_CTRL_RST_MMCM),
`ifdef HISPI                
        .SENS_CTRL_IGNORE_EMBED     (SENS_CTRL_IGNORE_EMBED),
`else                
        .SENS_CTRL_EXT_CLK          (SENS_CTRL_EXT_CLK),
`endif                
        .SENS_CTRL_LD_DLY           (SENS_CTRL_LD_DLY),
`ifdef HISPI
        .SENS_CTRL_GP0              (SENS_CTRL_GP0),
        .SENS_CTRL_GP1              (SENS_CTRL_GP1),
`else        
        .SENS_CTRL_QUADRANTS        (SENS_CTRL_QUADRANTS),
        .SENS_CTRL_ODD              (SENS_CTRL_ODD),
        .SENS_CTRL_QUADRANTS_WIDTH  (SENS_CTRL_QUADRANTS_WIDTH),
        .SENS_CTRL_QUADRANTS_EN     (SENS_CTRL_QUADRANTS_EN),
`endif                
        .SENSIO_STATUS              (SENSIO_STATUS),
        .SENSIO_JTAG                (SENSIO_JTAG),
        .SENS_JTAG_PGMEN            (SENS_JTAG_PGMEN),
        .SENS_JTAG_PROG             (SENS_JTAG_PROG),
        .SENS_JTAG_TCK              (SENS_JTAG_TCK),
        .SENS_JTAG_TMS              (SENS_JTAG_TMS),
        .SENS_JTAG_TDI              (SENS_JTAG_TDI),
`ifndef HISPI
        .SENSIO_WIDTH               (SENSIO_WIDTH),
`endif        
        .SENSIO_DELAYS              (SENSIO_DELAYS),
        .SENSI2C_ABS_RADDR          (SENSI2C_ABS_RADDR),
        .SENSI2C_REL_RADDR          (SENSI2C_REL_RADDR),
        .SENSI2C_ADDR_MASK          (SENSI2C_ADDR_MASK),
        .HISTOGRAM_RADDR0           (HISTOGRAM_RADDR0),
        .HISTOGRAM_RADDR1           (HISTOGRAM_RADDR1),
        .HISTOGRAM_RADDR2           (HISTOGRAM_RADDR2),
        .HISTOGRAM_RADDR3           (HISTOGRAM_RADDR3),
        .HISTOGRAM_ADDR_MASK        (HISTOGRAM_ADDR_MASK),
        .HISTOGRAM_LEFT_TOP         (HISTOGRAM_LEFT_TOP),
        .HISTOGRAM_WIDTH_HEIGHT     (HISTOGRAM_WIDTH_HEIGHT),
        .XOR_HIST_BAYER             (XOR_HIST_BAYER),
        .SENSI2C_DRIVE              (SENSI2C_DRIVE),
        .SENSI2C_IBUF_LOW_PWR       (SENSI2C_IBUF_LOW_PWR),
        .SENSI2C_IOSTANDARD         (SENSI2C_IOSTANDARD),
        .SENSI2C_SLEW               (SENSI2C_SLEW),
`ifndef HISPI
        .SENSOR_DATA_WIDTH          (SENSOR_DATA_WIDTH),
        .SENSOR_FIFO_2DEPTH         (SENSOR_FIFO_2DEPTH),
        .SENSOR_FIFO_DELAY         (SENSOR_FIFO_DELAY),
`endif                
        .HIST_SAXI_ADDR_MASK        (HIST_SAXI_ADDR_MASK),
        .HIST_SAXI_MODE_WIDTH       (HIST_SAXI_MODE_WIDTH),
        .HIST_SAXI_EN               (HIST_SAXI_EN),
        .HIST_SAXI_NRESET           (HIST_SAXI_NRESET),
        .HIST_CONFIRM_WRITE         (HIST_CONFIRM_WRITE),
        .HIST_SAXI_AWCACHE          (HIST_SAXI_AWCACHE),
        .HIST_SAXI_MODE_ADDR_MASK   (HIST_SAXI_MODE_ADDR_MASK),
        .NUM_FRAME_BITS             (NUM_FRAME_BITS),
        .SENS_SYNC_FBITS            (SENS_SYNC_FBITS),
        .SENS_SYNC_LBITS            (SENS_SYNC_LBITS),
        .SENS_SYNC_LATE_DFLT        (SENS_SYNC_LATE_DFLT),
        .SENS_SYNC_MINBITS          (SENS_SYNC_MINBITS),
        .SENS_SYNC_MINPER           (SENS_SYNC_MINPER),
        .IDELAY_VALUE               (IDELAY_VALUE),
        .PXD_DRIVE                  (PXD_DRIVE),
        .PXD_IBUF_LOW_PWR           (PXD_IBUF_LOW_PWR),
        .PXD_SLEW                   (PXD_SLEW),
        .SENS_REFCLK_FREQUENCY      (SENS_REFCLK_FREQUENCY),
        .SENS_HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE),
`ifdef HISPI
        .PXD_CAPACITANCE            (PXD_CAPACITANCE),
        .PXD_CLK_DIV                (PXD_CLK_DIV),
        .PXD_CLK_DIV_BITS           (PXD_CLK_DIV_BITS),
`endif
        .SENS_PHASE_WIDTH           (SENS_PHASE_WIDTH),
//        .SENS_PCLK_PERIOD           (SENS_PCLK_PERIOD),
        .SENS_BANDWIDTH             (SENS_BANDWIDTH),
        .CLKIN_PERIOD_SENSOR        (CLKIN_PERIOD_SENSOR),
        .CLKFBOUT_MULT_SENSOR       (CLKFBOUT_MULT_SENSOR),
        .CLKFBOUT_PHASE_SENSOR      (CLKFBOUT_PHASE_SENSOR),
        .IPCLK_PHASE                (IPCLK_PHASE),
        .IPCLK2X_PHASE              (IPCLK2X_PHASE),
        .PXD_IOSTANDARD             (PXD_IOSTANDARD),
        .BUF_IPCLK_SENS0            (BUF_IPCLK_SENS0),
        .BUF_IPCLK2X_SENS0          (BUF_IPCLK2X_SENS0),
        .BUF_IPCLK_SENS1            (BUF_IPCLK_SENS1),
        .BUF_IPCLK2X_SENS1          (BUF_IPCLK2X_SENS1),
        .BUF_IPCLK_SENS2            (BUF_IPCLK_SENS2),
        .BUF_IPCLK2X_SENS2          (BUF_IPCLK2X_SENS2),
        .BUF_IPCLK_SENS3            (BUF_IPCLK_SENS3),
        .BUF_IPCLK2X_SENS3          (BUF_IPCLK2X_SENS3),
        .SENS_DIVCLK_DIVIDE         (SENS_DIVCLK_DIVIDE),
        .SENS_REF_JITTER1           (SENS_REF_JITTER1),
        .SENS_REF_JITTER2           (SENS_REF_JITTER2),
        .SENS_SS_EN                 (SENS_SS_EN),
        .SENS_SS_MODE               (SENS_SS_MODE),
        .SENS_SS_MOD_PERIOD         (SENS_SS_MOD_PERIOD)
`ifdef HISPI
       ,.HISPI_MSB_FIRST               (HISPI_MSB_FIRST),
        .HISPI_NUMLANES                (HISPI_NUMLANES),
        .HISPI_DELAY_CLK0              (HISPI_DELAY_CLK0),
        .HISPI_DELAY_CLK1              (HISPI_DELAY_CLK1),
        .HISPI_DELAY_CLK2              (HISPI_DELAY_CLK2),
        .HISPI_DELAY_CLK3              (HISPI_DELAY_CLK3),
        .HISPI_MMCM0                   (HISPI_MMCM0),
        .HISPI_MMCM1                   (HISPI_MMCM1),
        .HISPI_MMCM2                   (HISPI_MMCM2),
        .HISPI_MMCM3                   (HISPI_MMCM3),
        .HISPI_KEEP_IRST               (HISPI_KEEP_IRST),
        .HISPI_WAIT_ALL_LANES          (HISPI_WAIT_ALL_LANES),
        .HISPI_FIFO_DEPTH              (HISPI_FIFO_DEPTH),
        .HISPI_FIFO_START              (HISPI_FIFO_START),
        .HISPI_CAPACITANCE             (HISPI_CAPACITANCE),
        .HISPI_DIFF_TERM               (HISPI_DIFF_TERM),
        .HISPI_UNTUNED_SPLIT           (HISPI_UNTUNED_SPLIT),        
        .HISPI_DQS_BIAS                (HISPI_DQS_BIAS),
        .HISPI_IBUF_DELAY_VALUE        (HISPI_IBUF_DELAY_VALUE),
        .HISPI_IBUF_LOW_PWR            (HISPI_IBUF_LOW_PWR),
        .HISPI_IFD_DELAY_VALUE         (HISPI_IFD_DELAY_VALUE),
        .HISPI_IOSTANDARD              (HISPI_IOSTANDARD)
`endif    
`ifdef DEBUG_RING
        ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
`endif        
    ) sensors393_i (
//        .rst                (axi_rst),           // input
        .pclk               (pclk),                //  input
`ifdef USE_PCLK2X    
        .pclk2x             (pclk2x),              // input
`endif        
        .ref_clk            (ref_clk),             // input
        .dly_rst            (idelay_ctrl_reset),   // input 
        .mrst               (mrst),                // input
        .prst               (prst),                // input
        .arst               (arst),                // input
        
        .mclk               (mclk),                // input
        .cmd_ad_in          (cmd_sensor_ad),       // input[7:0] 
        .cmd_stb_in         (cmd_sensor_stb),      // input
        .status_ad          (status_sensor_ad),    // output[7:0] 
        .status_rq          (status_sensor_rq),    // output
        .status_start       (status_sensor_start), // input
`ifdef HISPI
        .sns_dp            ({sns4_dp, sns3_dp, sns2_dp, sns1_dp}),             // input[3:0] 
        .sns_dn            ({sns4_dn, sns3_dn, sns2_dn, sns1_dn}),             // input[3:0] 
        .sns_dp74          ({sns4_dp74, sns3_dp74, sns2_dp74, sns1_dp74}),     // inout[7:4] @SuppressThisWarning VEditor vdt-bug
        .sns_dn74          ({sns4_dn74, sns3_dn74, sns2_dn74, sns1_dn74}),     // inout[7:4] @SuppressThisWarning VEditor vdt-bug
        .sns_clkp          ({sns4_clkp, sns3_clkp, sns2_clkp, sns1_clkp}),     // input
        .sns_clkn          ({sns4_clkn, sns3_clkn, sns2_clkn, sns1_clkn}),     // input
        .sns_scl           ({sns4_scl, sns3_scl, sns2_scl, sns1_scl}),         // inout
        .sns_sda           ({sns4_sda, sns3_sda, sns2_sda, sns1_sda}),         // inout
        .sns_ctl           ({sns4_ctl, sns3_ctl, sns2_ctl, sns1_ctl}),         // inout
        .sns_pg            ({sns4_pg, sns3_pg, sns2_pg, sns1_pg}),             // inout
`else
        .sns_dp            ({sns4_dp, sns3_dp, sns2_dp, sns1_dp}),             // inout[7:0] 
        .sns_dn            ({sns4_dn, sns3_dn, sns2_dn, sns1_dn}),             // inout[7:0] 
        .sns_clkp          ({sns4_clkp, sns3_clkp, sns2_clkp, sns1_clkp}),     // inout
        .sns_clkn          ({sns4_clkn, sns3_clkn, sns2_clkn, sns1_clkn}),     // inout
        .sns_scl           ({sns4_scl, sns3_scl, sns2_scl, sns1_scl}),         // inout
        .sns_sda           ({sns4_sda, sns3_sda, sns2_sda, sns1_sda}),         // inout
        .sns_ctl           ({sns4_ctl, sns3_ctl, sns2_ctl, sns1_ctl}),         // inout
        .sns_pg            ({sns4_pg, sns3_pg, sns2_pg, sns1_pg}),             // inout
`endif
        .frame_run_mclk     (sens_frame_run),      // input [3:0] - enable sensor data to memory buffer
        .rpage_set          (sens_rpage_set),      // input
        .rpage_next         (sens_rpage_next),     // input
        .buf_rd             (sens_buf_rd),         // input
        .buf_dout           (sens_buf_dout),       // output[63:0]
        .page_written       (sens_page_written),   // output[3:0]
        
        .trigger_mode       (trigger_mode),        // input
        .trig_in            (trig_in),             // input[3:0] 
        
        .sof_out_pclk       (sof_out_pclk),        // output[3:0] 
        .eof_out_pclk       (eof_out_pclk),        // output[3:0] 
        .sof_out_mclk       (sof_out_mclk),        // output[3:0] 
        .sof_late_mclk      (sof_late_mclk),       // output[3:0] 
        
        .frame_num0         (frame_num[0 * NUM_FRAME_BITS +: NUM_FRAME_BITS]), // input[3:0] 
        .frame_num1         (frame_num[1 * NUM_FRAME_BITS +: NUM_FRAME_BITS]), // input[3:0] 
        .frame_num2         (frame_num[2 * NUM_FRAME_BITS +: NUM_FRAME_BITS]), // input[3:0] 
        .frame_num3         (frame_num[3 * NUM_FRAME_BITS +: NUM_FRAME_BITS]), // input[3:0] 
        .idelay_rdy         (idelay_ctrl_rdy), // output[1:0] // just to preserve iodelay_cntr
        
        .aclk               (saxi0_aclk),          // input
        .saxi_awaddr        (saxi0_awaddr),        // output[31:0] 
        .saxi_awvalid       (saxi0_awvalid),       // output
        .saxi_awready       (saxi0_awready),       // input
        .saxi_awid          (saxi0_awid),          // output[5:0] 
        .saxi_awlock        (saxi0_awlock),        // output[1:0] 
        .saxi_awcache       (saxi0_awcache),       // output[3:0] 
        .saxi_awprot        (saxi0_awprot),        // output[2:0] 
        .saxi_awlen         (saxi0_awlen),         // output[3:0] 
        .saxi_awsize        (saxi0_awsize),        // output[1:0] 
        .saxi_awburst       (saxi0_awburst),       // output[1:0] 
        .saxi_awqos         (saxi0_awqos),         // output[3:0] 
        .saxi_wdata         (saxi0_wdata),         // output[31:0] 
        .saxi_wvalid        (saxi0_wvalid),        // output
        .saxi_wready        (saxi0_wready),        // input
        .saxi_wid           (saxi0_wid),           // output[5:0] 
        .saxi_wlast         (saxi0_wlast),         // output
        .saxi_wstrb         (saxi0_wstrb),         // output[3:0] 
        .saxi_bvalid        (saxi0_bvalid),        // input
        .saxi_bready        (saxi0_bready),        // output
        .saxi_bid           (saxi0_bid),           // input[5:0] 
        .saxi_bresp         (saxi0_bresp)          // input[1:0]
`ifdef DEBUG_SENS_MEM_PAGES
       ,.dbg_rpage          (dbg_rpage[7:0])       // output[7:0]   
       ,.dbg_wpage          (dbg_wpage[7:0])       // output[7:0]   
`endif              
        
`ifdef DEBUG_RING       
        ,.debug_do          (debug_ring[0]),       // output
        .debug_sl           (debug_sl),            // input
        .debug_di           (debug_ring[1])        // input
`endif         
    );

    // AFI1 (AXI_HP1) signals - write channels only
    wire [31:0] afi1_awaddr;   // output[31:0]
    wire        afi1_awvalid;  // output
    wire        afi1_awready;     // input
    wire [ 5:0] afi1_awid;     // output[5:0] 
    wire [ 1:0] afi1_awlock;     // output[1:0] 
    wire [ 3:0] afi1_awcache;     // output[3:0] 
    wire [ 2:0] afi1_awprot;     // output[2:0] 
    wire [ 3:0] afi1_awlen;     // output[3:0] 
    wire [ 1:0] afi1_awsize;     // output[2:0] 
    wire [ 1:0] afi1_awburst;     // output[1:0] 
    wire [ 3:0] afi1_awqos;     // output[3:0] 
    wire [63:0] afi1_wdata;     // output[63:0] 
    wire        afi1_wvalid;     // output
    wire        afi1_wready;     // input
    wire [ 5:0] afi1_wid;     // output[5:0] 
    wire        afi1_wlast;     // output
    wire [ 7:0] afi1_wstrb;     // output[7:0] 
    wire        afi1_bvalid;     // input
    wire        afi1_bready;     // output
    wire [ 5:0] afi1_bid;     // input[5:0] 
    wire [ 1:0] afi1_bresp;     // input[1:0] 
    wire [ 7:0] afi1_wcount;     // input[7:0] 
    wire [ 5:0] afi1_wacount;     // input[5:0] 
    wire        afi1_wrissuecap1en;     // output
    wire        afi1_clk;               // same as hclk if the second compressor AXI HP channel is enabled, 1'b0 otherwise
    
    // AFI2 (AXI_HP2) signals - write channels only - used only if CMPRS_NUM_AFI_CHN == 2
    wire [31:0] afi2_awaddr;   // output[31:0]
    wire        afi2_awvalid;  // output
    wire        afi2_awready;     // input
    wire [ 5:0] afi2_awid;     // output[5:0] 
    wire [ 1:0] afi2_awlock;     // output[1:0] 
    wire [ 3:0] afi2_awcache;     // output[3:0] 
    wire [ 2:0] afi2_awprot;     // output[2:0] 
    wire [ 3:0] afi2_awlen;     // output[3:0] 
    wire [ 1:0] afi2_awsize;     // output[2:0] 
    wire [ 1:0] afi2_awburst;     // output[1:0] 
    wire [ 3:0] afi2_awqos;     // output[3:0] 
    wire [63:0] afi2_wdata;     // output[63:0] 
    wire        afi2_wvalid;     // output
    wire        afi2_wready;     // input
    wire [ 5:0] afi2_wid;     // output[5:0] 
    wire        afi2_wlast;     // output
    wire [ 7:0] afi2_wstrb;     // output[7:0] 
    wire        afi2_bvalid;     // input
    wire        afi2_bready;     // output
    wire [ 5:0] afi2_bid;     // input[5:0] 
    wire [ 1:0] afi2_bresp;     // input[1:0] 
    wire [ 7:0] afi2_wcount;     // input[7:0] 
    wire [ 5:0] afi2_wacount;     // input[5:0] 
    wire        afi2_wrissuecap1en;     // output

    compressor393 #(
        .CMPRS_NUM_AFI_CHN               (CMPRS_NUM_AFI_CHN),
        .CMPRS_GROUP_ADDR                (CMPRS_GROUP_ADDR),
        .CMPRS_BASE_INC                  (CMPRS_BASE_INC),
        .CMPRS_AFIMUX_RADDR0             (CMPRS_AFIMUX_RADDR0),
        .CMPRS_AFIMUX_RADDR1             (CMPRS_AFIMUX_RADDR1),
        .CMPRS_AFIMUX_MASK               (CMPRS_AFIMUX_MASK),
        .CMPRS_STATUS_REG_BASE           (CMPRS_STATUS_REG_BASE),
        .CMPRS_HIFREQ_REG_BASE           (CMPRS_HIFREQ_REG_BASE),
        .CMPRS_AFIMUX_REG_ADDR0          (CMPRS_AFIMUX_REG_ADDR0),
        .CMPRS_AFIMUX_REG_ADDR1          (CMPRS_AFIMUX_REG_ADDR1),
        .CMPRS_STATUS_REG_INC            (CMPRS_STATUS_REG_INC),
        .CMPRS_HIFREQ_REG_INC            (CMPRS_HIFREQ_REG_INC),
        .CMPRS_MASK                      (CMPRS_MASK),
        .CMPRS_CONTROL_REG               (CMPRS_CONTROL_REG),
        .CMPRS_STATUS_CNTRL              (CMPRS_STATUS_CNTRL),
        .CMPRS_FORMAT                    (CMPRS_FORMAT),
        .CMPRS_COLOR_SATURATION          (CMPRS_COLOR_SATURATION),
        .CMPRS_CORING_MODE               (CMPRS_CORING_MODE),
        .CMPRS_TABLES                    (CMPRS_TABLES),
        .TABLE_QUANTIZATION_INDEX        (TABLE_QUANTIZATION_INDEX),
        .TABLE_CORING_INDEX              (TABLE_CORING_INDEX),
        .TABLE_FOCUS_INDEX               (TABLE_FOCUS_INDEX),
        .TABLE_HUFFMAN_INDEX             (TABLE_HUFFMAN_INDEX),
        .FRAME_HEIGHT_BITS               (FRAME_HEIGHT_BITS),
        .LAST_FRAME_BITS                 (LAST_FRAME_BITS),
        .CMPRS_CBIT_RUN                  (CMPRS_CBIT_RUN),
        .CMPRS_CBIT_RUN_BITS             (CMPRS_CBIT_RUN_BITS),
        .CMPRS_CBIT_QBANK                (CMPRS_CBIT_QBANK),
        .CMPRS_CBIT_QBANK_BITS           (CMPRS_CBIT_QBANK_BITS),
        .CMPRS_CBIT_DCSUB                (CMPRS_CBIT_DCSUB),
        .CMPRS_CBIT_DCSUB_BITS           (CMPRS_CBIT_DCSUB_BITS),
        .CMPRS_CBIT_CMODE                (CMPRS_CBIT_CMODE),
        .CMPRS_CBIT_CMODE_BITS           (CMPRS_CBIT_CMODE_BITS),
        .CMPRS_CBIT_FRAMES               (CMPRS_CBIT_FRAMES),
        .CMPRS_CBIT_FRAMES_BITS          (CMPRS_CBIT_FRAMES_BITS),
        .CMPRS_CBIT_BE16                 (CMPRS_CBIT_BE16),
        .CMPRS_CBIT_BE16_BITS            (CMPRS_CBIT_BE16_BITS),        
        .CMPRS_CBIT_BAYER                (CMPRS_CBIT_BAYER),
        .CMPRS_CBIT_BAYER_BITS           (CMPRS_CBIT_BAYER_BITS),
        .CMPRS_CBIT_FOCUS                (CMPRS_CBIT_FOCUS),
        .CMPRS_CBIT_FOCUS_BITS           (CMPRS_CBIT_FOCUS_BITS),
        .CMPRS_CBIT_RUN_RST              (CMPRS_CBIT_RUN_RST),
        .CMPRS_CBIT_RUN_STANDALONE       (CMPRS_CBIT_RUN_STANDALONE),
        .CMPRS_CBIT_RUN_ENABLE           (CMPRS_CBIT_RUN_ENABLE),
        .CMPRS_CBIT_CMODE_JPEG18         (CMPRS_CBIT_CMODE_JPEG18),
        .CMPRS_CBIT_CMODE_MONO6          (CMPRS_CBIT_CMODE_MONO6),
        .CMPRS_CBIT_CMODE_JP46           (CMPRS_CBIT_CMODE_JP46),
        .CMPRS_CBIT_CMODE_JP46DC         (CMPRS_CBIT_CMODE_JP46DC),
        .CMPRS_CBIT_CMODE_JPEG20         (CMPRS_CBIT_CMODE_JPEG20),
        .CMPRS_CBIT_CMODE_JP4            (CMPRS_CBIT_CMODE_JP4),
        .CMPRS_CBIT_CMODE_JP4DC          (CMPRS_CBIT_CMODE_JP4DC),
        .CMPRS_CBIT_CMODE_JP4DIFF        (CMPRS_CBIT_CMODE_JP4DIFF),
        .CMPRS_CBIT_CMODE_JP4DIFFHDR     (CMPRS_CBIT_CMODE_JP4DIFFHDR),
        .CMPRS_CBIT_CMODE_JP4DIFFDIV2    (CMPRS_CBIT_CMODE_JP4DIFFDIV2),
        .CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2 (CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2),
        .CMPRS_CBIT_CMODE_MONO1          (CMPRS_CBIT_CMODE_MONO1),
        .CMPRS_CBIT_CMODE_MONO4          (CMPRS_CBIT_CMODE_MONO4),
        .CMPRS_CBIT_FRAMES_SINGLE        (CMPRS_CBIT_FRAMES_SINGLE),
        .CMPRS_COLOR18                   (CMPRS_COLOR18),
        .CMPRS_COLOR20                   (CMPRS_COLOR20),
        .CMPRS_MONO16                    (CMPRS_MONO16),
        .CMPRS_JP4                       (CMPRS_JP4),
        .CMPRS_JP4DIFF                   (CMPRS_JP4DIFF),
        .CMPRS_MONO8                     (CMPRS_MONO8),
        .CMPRS_FRMT_MBCM1                (CMPRS_FRMT_MBCM1),
        .CMPRS_FRMT_MBCM1_BITS           (CMPRS_FRMT_MBCM1_BITS),
        .CMPRS_FRMT_MBRM1                (CMPRS_FRMT_MBRM1),
        .CMPRS_FRMT_MBRM1_BITS           (CMPRS_FRMT_MBRM1_BITS),
        .CMPRS_FRMT_LMARG                (CMPRS_FRMT_LMARG),
        .CMPRS_FRMT_LMARG_BITS           (CMPRS_FRMT_LMARG_BITS),
        .CMPRS_CSAT_CB                   (CMPRS_CSAT_CB),
        .CMPRS_CSAT_CB_BITS              (CMPRS_CSAT_CB_BITS),
        .CMPRS_CSAT_CR                   (CMPRS_CSAT_CR),
        .CMPRS_CSAT_CR_BITS              (CMPRS_CSAT_CR_BITS),
        .CMPRS_CORING_BITS               (CMPRS_CORING_BITS),
        .CMPRS_TIMEOUT_BITS              (CMPRS_TIMEOUT_BITS),
        .CMPRS_TIMEOUT                   (CMPRS_TIMEOUT),
        .CMPRS_AFIMUX_EN                 (CMPRS_AFIMUX_EN),
        .CMPRS_AFIMUX_RST                (CMPRS_AFIMUX_RST),
        .CMPRS_AFIMUX_MODE               (CMPRS_AFIMUX_MODE),
        .CMPRS_AFIMUX_STATUS_CNTRL       (CMPRS_AFIMUX_STATUS_CNTRL),
        .CMPRS_AFIMUX_SA_LEN             (CMPRS_AFIMUX_SA_LEN),
        .CMPRS_AFIMUX_WIDTH              (CMPRS_AFIMUX_WIDTH),
        .CMPRS_AFIMUX_CYCBITS            (CMPRS_AFIMUX_CYCBITS),
        .AFI_MUX_BUF_LATENCY             (AFI_MUX_BUF_LATENCY),
        .NUM_FRAME_BITS                  (NUM_FRAME_BITS)
        
`ifdef DEBUG_RING
        ,.DEBUG_CMD_LATENCY   (DEBUG_CMD_LATENCY) 
`endif        
        
    ) compressor393_i (
        .xclk                      (xclk),                       // input
`ifdef  USE_XCLK2X     
        .xclk2x                    (xclk2x),                     // input
`endif        
        .mclk                      (mclk),                       // input
        .mrst                      (mrst),                       // input
        .xrst                      (xrst),                       // input
        .hrst                      (hrst),                       // input
        
        .cmd_ad                    (cmd_compressor_ad),          // input[7:0] 
        .cmd_stb                   (cmd_compressor_stb),         // input
        .status_ad                 (status_compressor_ad),       // output[7:0] 
        .status_rq                 (status_compressor_rq),       // output
        .status_start              (status_compressor_start),    // input
        .cmprs_irq                 (cmprs_irq[3:0]),             // output[3:0]

        .xfer_reset_page_rd        (cmprs_xfer_reset_page_rd),   // input[3:0]
        .buf_wpage_nxt             (cmprs_buf_wpage_nxt),        // input[3:0]
        .buf_we                    (cmprs_buf_we),               // input[3:0]
        .buf_din                   (cmprs_buf_din),              // input[255:0] 
        .page_ready                (cmprs_page_ready),           // input[3:0]
        .next_page                 (cmprs_next_page),            // output[3:0]
        
        .frame_start_dst           (cmprs_frame_start_dst),      // output[3:0]
        .frame_start_conf          (cmprs_frame_start_conf),     // input[3:0] 

        .line_unfinished_src       (cmprs_line_unfinished_src),  // input[63:0] 
        .frame_number_src          (cmprs_frame_number_src),     // input[63:0] 
        .frame_done_src            (cmprs_frame_done_src),       // input[3:0] 
        .line_unfinished_dst       (cmprs_line_unfinished_dst),  // input[63:0] 
        .frame_number_dst          (cmprs_frame_number_dst),     // input[63:0]
        .frames_in_sync            (cmprs_frames_in_sync),       // input[3:0]  
        .frame_done_dst            (cmprs_frame_done_dst),       // input[3:0] 
        .suspend                   (cmprs_suspend),              // output[3:0] 

        .frame_number_finished     (cmprs_frame_number_finished),// output[63:0] frame numbers compressed

        .ts_pre_stb                (ts_pre_stb),                 // input[3:0]
        .ts_data                   (ts_data),                    // input[31:0] 
        
        .eof_written_mclk          (eof_written_mclk),           // output[3:0]
        .stuffer_done_mclk         (stuffer_done_mclk),          // output[3:0]
        .vsync_late                (sof_late_mclk),                 // input[3:0]
        .frame_num_compressed      (frame_num_compressed[4 * NUM_FRAME_BITS -1 : 0]), // input[3:0] 

        .hclk                      (hclk),                       // input
        .afi0_awaddr               (afi1_awaddr),                // output[31:0] 
        .afi0_awvalid              (afi1_awvalid),               // output
        .afi0_awready              (afi1_awready),               // input
        .afi0_awid                 (afi1_awid),                  // output[5:0] 
        .afi0_awlock               (afi1_awlock),                // output[1:0] 
        .afi0_awcache              (afi1_awcache),               // output[3:0] 
        .afi0_awprot               (afi1_awprot),                // output[2:0] 
        .afi0_awlen                (afi1_awlen),                 // output[3:0] 
        .afi0_awsize               (afi1_awsize),                // output[2:0] 
        .afi0_awburst              (afi1_awburst),               // output[1:0] 
        .afi0_awqos                (afi1_awqos),                 // output[3:0] 
        .afi0_wdata                (afi1_wdata),                 // output[63:0] 
        .afi0_wvalid               (afi1_wvalid),                // output
        .afi0_wready               (afi1_wready),                // input
        .afi0_wid                  (afi1_wid),                   // output[5:0] 
        .afi0_wlast                (afi1_wlast),                 // output
        .afi0_wstrb                (afi1_wstrb),                 // output[7:0] 
        .afi0_bvalid               (afi1_bvalid),                // input
        .afi0_bready               (afi1_bready),                // output
        .afi0_bid                  (afi1_bid),                   // input[5:0] 
        .afi0_bresp                (afi1_bresp),                 // input[1:0] 
        .afi0_wcount               (afi1_wcount),                // input[7:0] 
        .afi0_wacount              (afi1_wacount),               // input[5:0] 
        .afi0_wrissuecap1en        (afi1_wrissuecap1en),         // output
        .afi1_clk                  (afi1_clk),                   // output same as hclk if the second channel is used
        
        .afi1_awaddr               (afi2_awaddr),                // output[31:0] 
        .afi1_awvalid              (afi2_awvalid),               // output
        .afi1_awready              (afi2_awready),               // input
        .afi1_awid                 (afi2_awid),                  // output[5:0] 
        .afi1_awlock               (afi2_awlock),                // output[1:0] 
        .afi1_awcache              (afi2_awcache),               // output[3:0] 
        .afi1_awprot               (afi2_awprot),                // output[2:0] 
        .afi1_awlen                (afi2_awlen),                 // output[3:0] 
        .afi1_awsize               (afi2_awsize),                // output[2:0] 
        .afi1_awburst              (afi2_awburst),               // output[1:0] 
        .afi1_awqos                (afi2_awqos),                 // output[3:0] 
        .afi1_wdata                (afi2_wdata),                 // output[63:0] 
        .afi1_wvalid               (afi2_wvalid),                // output
        .afi1_wready               (afi2_wready),                // input
        .afi1_wid                  (afi2_wid),                   // output[5:0] 
        .afi1_wlast                (afi2_wlast),                 // output
        .afi1_wstrb                (afi2_wstrb),                 // output[7:0] 
        .afi1_bvalid               (afi2_bvalid),                // input
        .afi1_bready               (afi2_bready),                // output
        .afi1_bid                  (afi2_bid),                   // input[5:0] 
        .afi1_bresp                (afi2_bresp),                 // input[1:0] 
        .afi1_wcount               (afi2_wcount),                // input[7:0] 
        .afi1_wacount              (afi2_wacount),               // input[5:0] 
        .afi1_wrissuecap1en        (afi2_wrissuecap1en)          // output
`ifdef DEBUG_RING       
        ,.debug_do                (debug_ring[1]),               // output
        .debug_sl                 (debug_sl),                    // input
        .debug_di                 (debug_ring[2])                // input
`endif         
        
    );

    // general purpose I/Os, connected to the 10389 boards
    gpio393 #(
        .GPIO_ADDR            (GPIO_ADDR),
        .GPIO_MASK            (GPIO_MASK),
        .GPIO_STATUS_REG_ADDR (GPIO_STATUS_REG_ADDR),
        .GPIO_DRIVE           (GPIO_DRIVE),
        .GPIO_IBUF_LOW_PWR    (GPIO_IBUF_LOW_PWR),
        .GPIO_IOSTANDARD      (GPIO_IOSTANDARD),
        .GPIO_SLEW            (GPIO_SLEW),
        .GPIO_SET_PINS        (GPIO_SET_PINS),
        .GPIO_SET_STATUS      (GPIO_SET_STATUS),
        .GPIO_N               (GPIO_N),
        .GPIO_PORTEN          (GPIO_PORTEN)
    ) gpio393_i (
//        .rst           (axi_rst),           // input
        .mclk          (mclk),              // input
        .mrst          (mrst),              // input
        .cmd_ad        (cmd_gpio_ad),       // input[7:0] 
        .cmd_stb       (cmd_gpio_stb),      // input
        .status_ad     (status_gpio_ad),    // output[7:0] 
        .status_rq     (status_gpio_rq),    // output
        .status_start  (status_gpio_start), // input
        .ext_pins      (gpio_pins),         // inout[9:0] 
        .io_pins       (gpio_rd),           // output[9:0] 
        .da            (gpio_camsync),      // input[9:0] 
        .da_en         (gpio_camsync_en),   // input[9:0] 
        .db            (gpio_db),           // input[9:0] Motors in x353
        .db_en         (gpio_db_en),        // input[9:0] Motors in x353 
        .dc            (gpio_logger),       // input[9:0] 
        .dc_en         (gpio_logger_en)     // input[9:0] 
    );

    timing393 #(
        .RTC_ADDR              (RTC_ADDR),
        .CAMSYNC_ADDR          (CAMSYNC_ADDR),
        .RTC_STATUS_REG_ADDR   (RTC_STATUS_REG_ADDR),
        .RTC_SEC_USEC_ADDR     (RTC_SEC_USEC_ADDR),
        .RTC_MASK              (RTC_MASK),
        .CAMSYNC_MASK          (CAMSYNC_MASK),
        .CAMSYNC_MODE          (CAMSYNC_MODE),
        .CAMSYNC_TRIG_SRC      (CAMSYNC_TRIG_SRC),
        .CAMSYNC_TRIG_DST      (CAMSYNC_TRIG_DST),
        .CAMSYNC_TRIG_PERIOD   (CAMSYNC_TRIG_PERIOD),
        .CAMSYNC_TRIG_DELAY0   (CAMSYNC_TRIG_DELAY0),
        .CAMSYNC_TRIG_DELAY1   (CAMSYNC_TRIG_DELAY1),
        .CAMSYNC_TRIG_DELAY2   (CAMSYNC_TRIG_DELAY2),
        .CAMSYNC_TRIG_DELAY3   (CAMSYNC_TRIG_DELAY3),
        .CAMSYNC_EN_BIT        (CAMSYNC_EN_BIT),
        .CAMSYNC_SNDEN_BIT     (CAMSYNC_SNDEN_BIT),
        .CAMSYNC_EXTERNAL_BIT  (CAMSYNC_EXTERNAL_BIT),
        .CAMSYNC_TRIGGERED_BIT (CAMSYNC_TRIGGERED_BIT),
        .CAMSYNC_MASTER_BIT    (CAMSYNC_MASTER_BIT),
        .CAMSYNC_CHN_EN_BIT    (CAMSYNC_CHN_EN_BIT),
        .CAMSYNC_PRE_MAGIC     (CAMSYNC_PRE_MAGIC),
        .CAMSYNC_POST_MAGIC    (CAMSYNC_POST_MAGIC),
        .CAMSYNC_GPIO_EXT_IN   (CAMSYNC_GPIO_EXT_IN),
        .CAMSYNC_GPIO_INT_IN   (CAMSYNC_GPIO_INT_IN),
        .CAMSYNC_GPIO_EXT_OUT  (CAMSYNC_GPIO_EXT_OUT),
        .CAMSYNC_GPIO_INT_OUT  (CAMSYNC_GPIO_INT_OUT),
        .RTC_MHZ               (RTC_MHZ),
        .RTC_BITC_PREDIV       (RTC_BITC_PREDIV),
        .RTC_SET_USEC          (RTC_SET_USEC),
        .RTC_SET_SEC           (RTC_SET_SEC),
        .RTC_SET_CORR          (RTC_SET_CORR),
        .RTC_SET_STATUS        (RTC_SET_STATUS)
    ) timing393_i (
//        .rst            (axi_rst),               // input
        .mclk           (mclk),                  // input
        .pclk           (camsync_clk),           // global clock used for external synchronization. 96MHz in x353.  Make it independent
        .mrst           (mrst),                  // input
        .prst           (crst),                  // input
        .refclk         (time_ref),              // RTC reference: integer number of microseconds, less than mclk/2. Not a global clock
        .cmd_ad         (cmd_timing_ad),         // input[7:0] 
        .cmd_stb        (cmd_timing_stb),        // input
        .status_ad      (status_timing_ad),      // output[7:0] 
        .status_rq      (status_timing_rq),      // output
        .status_start   (status_timing_start),   // input
        .gpio_in        (gpio_rd),               // input[9:0] 
        .gpio_out       (gpio_camsync),          // output[9:0] ([6]-synco0,[7]-syncio0,[8]-synco1,[9]-syncio1)
        .gpio_out_en    (gpio_camsync_en),       // output[9:0] 
        .triggered_mode (trigger_mode),          // output
        .frsync_chn0    (sof_out_mclk[0]),       // input
        .trig_chn0      (trig_in[0]),            // output
        .frsync_chn1    (sof_out_mclk[1]),       // input
        .trig_chn1      (trig_in[1]),            // output
        .frsync_chn2    (sof_out_mclk[2]),       // input
        .trig_chn2      (trig_in[2]),            // output
        .frsync_chn3    (sof_out_mclk[3]),       // input
        .trig_chn3      (trig_in[3]),            // output
        .ts_stb_chn0    (ts_pre_stb[0]),         // output
        .ts_data_chn0   (ts_data[0 * 8 +: 8]),   // output[7:0] 
        .ts_stb_chn1    (ts_pre_stb[1]),         // output
        .ts_data_chn1   (ts_data[1 * 8 +: 8]),   // output[7:0] 
        .ts_stb_chn2    (ts_pre_stb[2]),         // output
        .ts_data_chn2   (ts_data[2 * 8 +: 8]),   // output[7:0] 
        .ts_stb_chn3    (ts_pre_stb[3]),         // output
        .ts_data_chn3   (ts_data[3 * 8 +: 8]),   // output[7:0] 
        .lclk           (logger_clk),            // input global clock, common with the logger (use 100 MHz?)
        .lrst           (lrst),                  // input
        .ts_logger_snap (logger_snap),           // input
        .ts_logger_stb  (ts_pre_logger_stb),     // output
        .ts_logger_data (ts_logegr_data)         // output[7:0] 
    );

    event_logger #(
        .LOGGER_ADDR            (LOGGER_ADDR),
        .LOGGER_STATUS          (LOGGER_STATUS),
        .LOGGER_STATUS_REG_ADDR (LOGGER_STATUS_REG_ADDR),
        .LOGGER_MASK            (LOGGER_MASK),
        .LOGGER_STATUS_MASK     (LOGGER_STATUS_MASK),
        .LOGGER_PAGE_IMU        (LOGGER_PAGE_IMU),
        .LOGGER_PAGE_GPS        (LOGGER_PAGE_GPS),
        .LOGGER_PAGE_MSG        (LOGGER_PAGE_MSG),
        .LOGGER_PERIOD          (LOGGER_PERIOD),
        .LOGGER_BIT_DURATION    (LOGGER_BIT_DURATION),
        .LOGGER_BIT_HALF_PERIOD (LOGGER_BIT_HALF_PERIOD),
        .LOGGER_CONFIG          (LOGGER_CONFIG),
        .LOGGER_CONF_IMU        (LOGGER_CONF_IMU),
        .LOGGER_CONF_IMU_BITS   (LOGGER_CONF_IMU_BITS),
        .LOGGER_CONF_GPS        (LOGGER_CONF_GPS),
        .LOGGER_CONF_GPS_BITS   (LOGGER_CONF_GPS_BITS),
        .LOGGER_CONF_MSG        (LOGGER_CONF_MSG),
        .LOGGER_CONF_MSG_BITS   (LOGGER_CONF_MSG_BITS),
        .LOGGER_CONF_SYN        (LOGGER_CONF_SYN),
        .LOGGER_CONF_SYN_BITS   (LOGGER_CONF_SYN_BITS),
        .LOGGER_CONF_EN         (LOGGER_CONF_EN),
        .LOGGER_CONF_EN_BITS    (LOGGER_CONF_EN_BITS),
        .LOGGER_CONF_DBG        (LOGGER_CONF_DBG),
        .LOGGER_CONF_DBG_BITS   (LOGGER_CONF_DBG_BITS),
        .GPIO_N                 (GPIO_N)
    ) event_logger_i (
//        .rst           (axi_rst),            // input
        .mclk          (mclk),                // input
        .xclk          (logger_clk),          // input
        .mrst          (mrst),                // input
        .xrst          (lrst),                // input
        .cmd_ad        (cmd_logger_ad),       // input[7:0] 
        .cmd_stb       (cmd_logger_stb),      // input
        .status_ad     (status_logger_ad),    // output[7:0] 
        .status_rq     (status_logger_rq),    // output
        .status_start  (status_logger_start), // input
        .ts_local_snap (logger_snap),         // output
        .ts_local_stb  (ts_pre_logger_stb),   // input
        .ts_local_data (ts_logegr_data),      // input[7:0] 
        .ext_di        (gpio_rd),             // input[9:0] 
        .ext_do        (gpio_logger),         // output[9:0] 
        .ext_en        (gpio_logger_en),      // output[9:0]
        .sof_mclk      (sof_out_mclk),        // input[3:0] 
        .ts_stb_chn0   (ts_pre_stb[0]),       // input
        .ts_data_chn0  (ts_data[0 * 8 +: 8]), // input[7:0] 
        .ts_stb_chn1   (ts_pre_stb[1]),       // input
        .ts_data_chn1  (ts_data[1 * 8 +: 8]), // input[7:0] 
        .ts_stb_chn2   (ts_pre_stb[2]),       // input
        .ts_data_chn2  (ts_data[2 * 8 +: 8]), // input[7:0] 
        .ts_stb_chn3   (ts_pre_stb[3]),       // input
        .ts_data_chn3  (ts_data[3 * 8 +: 8]), // input[7:0] 
        
        .data_out      (logger_out),          // output[15:0] @mclk
        .data_out_stb  (logger_stb),          // output @mclk
        .debug_state() // output[31:0] 
    );

    mult_saxi_wr_inbuf #(
        .MULT_SAXI_HALF_BRAM_IN  (MULT_SAXI_HALF_BRAM_IN),
        .MULT_SAXI_BSLOG         (MULT_SAXI_BSLOG0),
        .MULT_SAXI_WLOG          (MULT_SAXI_WLOG)
    ) mult_saxi_wr_inbuf_i (
        .mclk                    (mclk),                // input
        .en                      (logger_saxi_en),      // input
        .iclk                    (mclk),                // input
        .data_in                 (logger_out),          // input[15:0] 
        .valid                   (logger_stb),          // input
        .has_burst               (logger_has_burst),    // output reg 
        .read_burst              (logger_read_burst),   // input
        .data_out                (logger_data32),       // output[31:0] 
        .pre_valid_chn           (logger_pre_valid_chn) // output
    );

    mult_saxi_wr #(
        .MULT_SAXI_ADDR          (MULT_SAXI_ADDR),
        .MULT_SAXI_IRQLEN_ADDR   (MULT_SAXI_IRQLEN_ADDR),
        .MULT_SAXI_CNTRL_ADDR    (MULT_SAXI_CNTRL_ADDR),
        .MULT_SAXI_CNTRL_MODE    (MULT_SAXI_CNTRL_MODE),
        .MULT_SAXI_CNTRL_STATUS  (MULT_SAXI_CNTRL_STATUS),
        .MULT_SAXI_CNTRL_IRQ     (MULT_SAXI_CNTRL_IRQ),
        .MULT_SAXI_POINTERS_REG  (MULT_SAXI_POINTERS_REG),
        .MULT_SAXI_STATUS_REG    (MULT_SAXI_STATUS_REG),
        .MULT_SAXI_HALF_BRAM     (MULT_SAXI_HALF_BRAM),
        .MULT_SAXI_BSLOG0        (MULT_SAXI_BSLOG0),
        .MULT_SAXI_BSLOG1        (MULT_SAXI_BSLOG1),
        .MULT_SAXI_BSLOG2        (MULT_SAXI_BSLOG2),
        .MULT_SAXI_BSLOG3        (MULT_SAXI_BSLOG3),
        .MULT_SAXI_MASK          (MULT_SAXI_MASK),
        .MULT_SAXI_IRQLEN_MASK   (MULT_SAXI_IRQLEN_MASK),
        .MULT_SAXI_CNTRL_MASK    (MULT_SAXI_CNTRL_MASK),
        .MULT_SAXI_AWCACHE       (MULT_SAXI_AWCACHE),
        .MULT_SAXI_ADV_WR        (MULT_SAXI_ADV_WR),
        .MULT_SAXI_ADV_RD        (MULT_SAXI_ADV_RD)
    ) mult_saxi_wr_i (
//        .rst                     (axi_rst),              // input
        .mclk                    (mclk),                 // input
        .aclk                    (saxi1_aclk),           // input == hclk
        .mrst                    (mrst),                 // input
        .arst                    (hrst),                 // input
        .cmd_ad                  (cmd_saxi1wr_ad),       // input[7:0] 
        .cmd_stb                 (cmd_saxi1wr_stb),      // input
        .status_ad               (status_saxi1wr_ad),    // output[7:0] 
        .status_rq               (status_saxi1wr_rq),    // output
        .status_start            (status_saxi1wr_start), // input
        .en_chn0                 (logger_saxi_en),       // output
        .has_burst0              (logger_has_burst),     // input
        .read_burst0             (logger_read_burst),    // output
        .data_in_chn0            (logger_data32),        // input[31:0] 
        .pre_valid_chn0          (logger_pre_valid_chn), // input
        // 3 spare channels for SAXI_GP 1
        .en_chn1                 (),                     // output
        .has_burst1              (1'b0),                 // input
        .read_burst1             (),                     // output
        .data_in_chn1            (32'b0),                // input[31:0] 
        .pre_valid_chn1          (1'b0),                 // input
        .en_chn2                 (),                     // output
        .has_burst2              (1'b0),                 // input
        .read_burst2             (),                     // output
        .data_in_chn2            (32'b0),                // input[31:0] 
        .pre_valid_chn2          (1'b0),                 // input
        .en_chn3                 (),                     // output
        .has_burst3              (1'b0),                 // input
        .read_burst3             (),                     // output
        .data_in_chn3            (32'b0),                // input[31:0] 
        .pre_valid_chn3          (1'b0),                 // input
        .irq                     (mult_saxi_irq[3:0]),   // output[3:0]
        
        .saxi_awaddr             (saxi1_awaddr),         // output[31:0] 
        .saxi_awvalid            (saxi1_awvalid),        // output
        .saxi_awready            (saxi1_awready),        // input
        .saxi_awid               (saxi1_awid),           // output[5:0] 
        .saxi_awlock             (saxi1_awlock),         // output[1:0] 
        .saxi_awcache            (saxi1_awcache),        // output[3:0] 
        .saxi_awprot             (saxi1_awprot),         // output[2:0] 
        .saxi_awlen              (saxi1_awlen),          // output[3:0] 
        .saxi_awsize             (saxi1_awsize),         // output[1:0] 
        .saxi_awburst            (saxi1_awburst),        // output[1:0] 
        .saxi_awqos              (saxi1_awqos),          // output[3:0] 
        .saxi_wdata              (saxi1_wdata),          // output[31:0] 
        .saxi_wvalid             (saxi1_wvalid),         // output
        .saxi_wready             (saxi1_wready),         // input
        .saxi_wid                (saxi1_wid),            // output[5:0] 
        .saxi_wlast              (saxi1_wlast),          // output
        .saxi_wstrb              (saxi1_wstrb),          // output[3:0] 
        .saxi_bvalid             (saxi1_bvalid),         // input
        .saxi_bready             (saxi1_bready),         // output
        .saxi_bid                (saxi1_bid),            // input[5:0] 
        .saxi_bresp              (saxi1_bresp)           // input[1:0] 
    );
    
    clocks393m #(
        .CLK_ADDR                (CLK_ADDR),
        .CLK_MASK                (CLK_MASK),
        .CLK_STATUS_REG_ADDR     (CLK_STATUS_REG_ADDR),
        .CLK_CNTRL               (CLK_CNTRL),
        .CLK_STATUS              (CLK_STATUS),
        .CLKIN_PERIOD_PCLK       (CLKIN_PERIOD_PCLK),
        .DIVCLK_DIVIDE_PCLK      (DIVCLK_DIVIDE_PCLK),
        .CLKFBOUT_MULT_PCLK      (CLKFBOUT_MULT_PCLK),
        .CLKOUT_DIV_PCLK         (CLKOUT_DIV_PCLK),
        .BUF_CLK1X_PCLK          (BUF_CLK1X_PCLK),
`ifdef USE_PCLK2X    
        .CLKOUT_DIV_PCLK2X       (CLKOUT_DIV_PCLK2X),
        .PHASE_CLK2X_PCLK        (PHASE_CLK2X_PCLK),
        .BUF_CLK1X_PCLK2X        (BUF_CLK1X_PCLK2X),
`endif
        .MULTICLK_IN_PERIOD      (MULTICLK_IN_PERIOD),
        .MULTICLK_DIVCLK         (MULTICLK_DIVCLK),
        .MULTICLK_MULT           (MULTICLK_MULT),
        .MULTICLK_DIV_DLYREF     (MULTICLK_DIV_DLYREF),
        .MULTICLK_DIV_AXIHP      (MULTICLK_DIV_AXIHP),
        .MULTICLK_DIV_XCLK       (MULTICLK_DIV_XCLK),
`ifdef  USE_XCLK2X
        .MULTICLK_DIV_XCLK2X     (MULTICLK_DIV_XCLK2X),
`endif        
        .MULTICLK_DIV_SYNC       (MULTICLK_DIV_SYNC),
        .MULTICLK_PHASE_FB       (MULTICLK_PHASE_FB),
        .MULTICLK_PHASE_DLYREF   (MULTICLK_PHASE_DLYREF),
        .MULTICLK_BUF_DLYREF     (MULTICLK_BUF_DLYREF),
        .MULTICLK_PHASE_AXIHP    (MULTICLK_PHASE_AXIHP),
        .MULTICLK_BUF_AXIHP      (MULTICLK_BUF_AXIHP),
        .MULTICLK_PHASE_XCLK     (MULTICLK_PHASE_XCLK),
        .MULTICLK_BUF_XCLK       (MULTICLK_BUF_XCLK),
`ifdef  USE_XCLK2X
        .MULTICLK_PHASE_XCLK2X   (MULTICLK_PHASE_XCLK2X),
        .MULTICLK_BUF_XCLK2X     (MULTICLK_BUF_XCLK2X),
`endif        
        .MULTICLK_PHASE_SYNC     (MULTICLK_PHASE_SYNC),
        .MULTICLK_BUF_SYNC       (MULTICLK_BUF_SYNC),
        
        .MEMCLK_CAPACITANCE      (MEMCLK_CAPACITANCE),
        .MEMCLK_IBUF_LOW_PWR     (MEMCLK_IBUF_LOW_PWR),
        .MEMCLK_IOSTANDARD       (MEMCLK_IOSTANDARD),
        .FFCLK0_CAPACITANCE      (FFCLK0_CAPACITANCE),
        .FFCLK0_DIFF_TERM        (FFCLK0_DIFF_TERM),
        .FFCLK0_IBUF_LOW_PWR     (FFCLK0_IBUF_LOW_PWR),
        .FFCLK0_IOSTANDARD       (FFCLK0_IOSTANDARD),
        .FFCLK1_CAPACITANCE      (FFCLK1_CAPACITANCE),
        .FFCLK1_DIFF_TERM        (FFCLK1_DIFF_TERM),
        .FFCLK1_IBUF_LOW_PWR     (FFCLK1_IBUF_LOW_PWR),
        .FFCLK1_IOSTANDARD       (FFCLK1_IOSTANDARD)
    ) clocks393_i (
        .async_rst       (axi_rst_pre),         
        .mclk            (mclk),                // input
        .mrst            (mrst),
        .cmd_ad          (cmd_clocks_ad),       // input[7:0] 
        .cmd_stb         (cmd_clocks_stb),      // input
        .status_ad       (status_clocks_ad),    // output[7:0] 
        .status_rq       (status_clocks_rq),    // output
        .status_start    (status_clocks_start), // input
        .fclk            (fclk),                // input[3:0] 
        .memclk_pad      (memclk),              // input
        .ffclk0p_pad     (ffclk0p),             // input
        .ffclk0n_pad     (ffclk0n),             // input
        .ffclk1p_pad     (ffclk1p),             // input
        .ffclk1n_pad     (ffclk1n),             // input
        .aclk            (axi_aclk),            // output
        .hclk            (hclk),                // output
        .pclk            (pclk),                // output
`ifdef USE_PCLK2X    
        .pclk2x          (pclk2x),              // output
`endif    
        .xclk            (xclk),                // output
`ifdef  USE_XCLK2X     
        .xclk2x          (xclk2x),              // output
`endif        
        .sync_clk        (camsync_clk),         // output
        .time_ref        (time_ref),            // output
        .dly_ref_clk     (ref_clk),             // output
        .extra_status    ({1'b0,idelay_ctrl_rdy}), // input[1:0] 
        .locked_sync_clk (locked_sync_clk),     // output // always 1
        .locked_xclk     (locked_xclk),         // output // always 1
        .locked_pclk     (locked_pclk),         // output 
        .locked_hclk     (locked_hclk)          // output
    );
    sync_resets #(
        .WIDTH(7),
        .REGISTER(4)
    ) sync_resets_i (
        .arst   (axi_rst_pre), // input
        .locked ({locked_hclk, 1'b1,     locked_sync_clk, locked_sync_clk, locked_xclk, locked_pclk, mcntrl_locked}), // input
        .clk    ({hclk,        axi_aclk, logger_clk,      camsync_clk,     xclk,        pclk,        mclk}),          // input[6:0] 
        .rst    ({hrst,        arst,     lrst,            crst,            xrst,        prst,        mrst})          // output[6:0] 
    );

// Changed aclk to master (it is the source of most orthers)
/*
    sync_resets #(
        .WIDTH(7),
        .REGISTER(4)
    ) sync_resets_i (
        .arst   (axi_rst_pre), // input
        .locked ({locked_hclk, locked_sync_clk, locked_sync_clk, locked_xclk, locked_pclk, mcntrl_locked, 1'b1  }), // input
        .clk    ({hclk,        logger_clk,      camsync_clk,     xclk,        pclk,        mclk,          axi_aclk}),          // input[6:0] 
        .rst    ({hrst,        lrst,            crst,            xrst,        prst,        mrst,          arst})          // output[6:0] 
    );
*/

`ifdef DEBUG_RING
    debug_master #(
        .DEBUG_ADDR            (DEBUG_ADDR),
        .DEBUG_MASK            (DEBUG_MASK),
        .DEBUG_STATUS_REG_ADDR (DEBUG_STATUS_REG_ADDR),
        .DEBUG_READ_REG_ADDR   (DEBUG_READ_REG_ADDR),
        .DEBUG_SHIFT_DATA      (DEBUG_SHIFT_DATA),
        .DEBUG_LOAD            (DEBUG_LOAD),
        .DEBUG_SET_STATUS      (DEBUG_SET_STATUS),
        .DEBUG_CMD_LATENCY     (DEBUG_CMD_LATENCY)
    ) debug_master_i (
        .mclk         (mclk),               // input
        .mrst         (mrst),               // input
        .cmd_ad       (cmd_debug_ad),       // input[7:0] 
        .cmd_stb      (cmd_debug_stb),      // input
        .status_ad    (status_debug_ad),    // output[7:0] 
        .status_rq    (status_debug_rq),    // output
        .status_start (status_debug_start), // input
        .debug_do     (debug_ring[3]),      // output
        .debug_sl     (debug_sl),           // output
        .debug_di     (debug_ring[0])       // DEBUG_RING_LENGTH-1]) // input
    );
`endif

    axibram_write #(
        .ADDRESS_BITS(AXI_WR_ADDR_BITS)
    ) axibram_write_i (  //SuppressThisWarning ISExst Output port <bram_wstb> of the instance <axibram_write_i> is unconnected or connected to loadless signal.
        .aclk        (axi_aclk), // input
        .arst        (arst), // input
        .awaddr      (maxi0_awaddr[31:0]), // input[31:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #axibram_write_i:awaddr[31:16,1:0] to constant 0
        .awvalid     (maxi0_awvalid), // input
        .awready     (maxi0_awready), // output
        .awid        (maxi0_awid[11:0]), // input[11:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #axibram_write_i:awid[11:2] to constant 0
        .awlen       (maxi0_awlen[3:0]), // input[3:0] 
        .awsize      (maxi0_awsize[1:0]), // input[1:0] 
        .awburst     (maxi0_awburst[1:0]), // input[1:0] 
        .wdata       (maxi0_wdata[31:0]), // input[31:0] 
        .wvalid      (maxi0_wvalid), // input
        .wready      (maxi0_wready), // output
        .wid         (maxi0_wid[11:0]), // input[11:0] 
        .wlast       (maxi0_wlast), // input
        .wstb        (maxi0_wstb[3:0]), // input[3:0] 
        .bvalid      (maxi0_bvalid), // output
        .bready      (maxi0_bready), // input
        .bid         (maxi0_bid[11:0]), // output[11:0] 
        .bresp       (maxi0_bresp[1:0]), // output[1:0] 
        .pre_awaddr  (axiwr_pre_awaddr[AXI_WR_ADDR_BITS-1:0]), // output[9:0] 
        .start_burst (axiwr_start_burst), // output
        .dev_ready   (axiwr_dev_ready), // input
        .bram_wclk   (axiwr_wclk), // output
        .bram_waddr  (axiwr_waddr[AXI_WR_ADDR_BITS-1:0]), // output[9:0] 
        .pre_bram_wen(),                               // 1 ahead of bram_wen, not masked by dev_ready
        .bram_wen    (axiwr_wen), // output
        .bram_wstb   (axiwr_bram_wstb[3:0]), // output[3:0] //SuppressThisWarning ISExst Assignment to axiwr_bram_wstb ignored, since the identifier is never used
        .bram_wdata  (axiwr_wdata[31:0]) // output[31:0]
`ifdef DEBUG_FIFO
        ,
        .waddr_under (waddr_under), // output
        .wdata_under (wdata_under), // output
        .wresp_under (wresp_under), // output
        .waddr_over  (waddr_over),  // output
        .wdata_over  (wdata_over),  // output
        .wresp_over  (wresp_over),   // output
        .waddr_wcount(waddr_wcount), // output[3:0] 
        .waddr_rcount(waddr_rcount), // output[3:0] 
        .waddr_num_in_fifo(waddr_num_in_fifo), // output[3:0] 
        .wdata_wcount(wdata_wcount), // output[3:0] 
        .wdata_rcount(wdata_rcount), // output[3:0] 
        .wdata_num_in_fifo(wdata_num_in_fifo), // output[3:0] 
        .wresp_wcount(wresp_wcount), // output[3:0] 
        .wresp_rcount(wresp_rcount), // output[3:0] 
        .wresp_num_in_fifo(wresp_num_in_fifo), // output[3:0]
        .wleft       (wleft[3:0]),
        .wlength     (wlength[3:0]), // output[3:0] 
        .wlen_in_dbg (wlen_in_dbg[3:0]) // output[3:0] reg 
                 
`endif         
    );

    axibram_read #(
        .ADDRESS_BITS(AXI_RD_ADDR_BITS)
    ) axibram_read_i ( //SuppressThisWarning ISExst Output port <bram_rclk> of the instance <axibram_read_i> is unconnected or connected to loadless signal.
        .aclk        (axi_aclk), // input
        .arst        (arst),
//        .rst         (axi_rst), // input
        .araddr      (maxi0_araddr[31:0]), // input[31:0] // SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #axibram_read_i:araddr[31:16,1:0] to constant 0
        .arvalid     (maxi0_arvalid), // input
        .arready     (maxi0_arready), // output
        .arid        (maxi0_arid[11:0]), // input[11:0] 
        .arlen       (maxi0_arlen[3:0]), // input[3:0] 
        .arsize      (maxi0_arsize[1:0]), // input[1:0] 
        .arburst     (maxi0_arburst[1:0]), // input[1:0] 
        .rdata       (maxi0_rdata[31:0]), // output[31:0] 
        .rvalid      (maxi0_rvalid), // output reg 
        .rready      (maxi0_rready), // input
        .rid         (maxi0_rid), // output[11:0] reg 
        .rlast       (maxi0_rlast), // output reg 
        .rresp       (maxi0_rresp[1:0]), // output[1:0] 
        .pre_araddr  (axird_pre_araddr[AXI_RD_ADDR_BITS-1:0]), // output[9:0] 
        .start_burst (axird_start_burst), // output
        .dev_ready   (axird_dev_ready), // input  SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #axibram_read_i:dev_ready to constant 0
        .bram_rclk   (axird_bram_rclk), // output //SuppressThisWarning ISExst Assignment to axird_bram_rclk ignored, since the identifier is never used
        .bram_raddr  (axird_raddr[AXI_RD_ADDR_BITS-1:0]), // output[9:0] 
        .bram_ren    (axird_ren), // output
        .bram_regen  (axird_regen), // output
        .bram_rdata  (axird_rdata ) // input[31:0] == axi_rdata[31:0], so SuppressThisWarning VivadoSynthesis: [Synth 8-3295] tying undriven pin #axibram_read_i:bram_rdata[31:0] to constant 0
    );

sata_ahci_top sata_top(
    .sata_clk                   (sata_clk), // output wire
    .sata_rst                   (),         // output wire
    .arst                       (hrst),     // extrst),   // input wire 
    // reliable clock to source drp and cpll lock det circuits
    .reliable_clk               (hclk),     // input wire// Use 150MHz hclk for MAXIGP1 axi_aclk0),
    .hclk                       (hclk),     // input wire
    .ACLK                       (hclk),     // input wire// Use 150MHz hclk for MAXIGP1 axi_aclk0),
    .ARESETN                    (1'b0),     // input wire not used inside module
// AXI PS Master GP1: Read Address
    .ARADDR                     (maxi1_araddr),
    .ARVALID                    (maxi1_arvalid),
    .ARREADY                    (maxi1_arready),
    .ARID                       (maxi1_arid),
    .ARLEN                      (maxi1_arlen),
    .ARSIZE                     (maxi1_arsize),
    .ARBURST                    (maxi1_arburst),
// AXI PS Master GP1: Read Data
    .RDATA                      (maxi1_rdata),
    .RVALID                     (maxi1_rvalid),
    .RREADY                     (maxi1_rready),
    .RID                        (maxi1_rid),
    .RLAST                      (maxi1_rlast),
    .RRESP                      (maxi1_rresp),
// AXI PS Master GP1: Write Address
    .AWADDR                     (maxi1_awaddr),
    .AWVALID                    (maxi1_awvalid),
    .AWREADY                    (maxi1_awready),
    .AWID                       (maxi1_awid),
    .AWLEN                      (maxi1_awlen),
    .AWSIZE                     (maxi1_awsize),
    .AWBURST                    (maxi1_awburst),
// AXI PS Master GP1: Write Data
    .WDATA                      (maxi1_wdata),
    .WVALID                     (maxi1_wvalid),
    .WREADY                     (maxi1_wready),
    .WID                        (maxi1_wid),
    .WLAST                      (maxi1_wlast),
    .WSTRB                      (maxi1_wstb),
// AXI PS Master GP1: Write response
    .BVALID                     (maxi1_bvalid),
    .BREADY                     (maxi1_bready),
    .BID                        (maxi1_bid),
    .BRESP                      (maxi1_bresp),
// Data interface
    .afi_awaddr                 (afi3_awaddr),
    .afi_awvalid                (afi3_awvalid),
    .afi_awready                (afi3_awready),
    .afi_awid                   (afi3_awid),
    .afi_awlock                 (afi3_awlock),
    .afi_awcache                (afi3_awcache),
    .afi_awprot                 (afi3_awprot),
    .afi_awlen                  (afi3_awlen),
    .afi_awsize                 (afi3_awsize),
    .afi_awburst                (afi3_awburst),
    .afi_awqos                  (afi3_awqos),
    // write data
    .afi_wdata                  (afi3_wdata),
    .afi_wvalid                 (afi3_wvalid),
    .afi_wready                 (afi3_wready),
    .afi_wid                    (afi3_wid),
    .afi_wlast                  (afi3_wlast),
    .afi_wstrb                  (afi3_wstrb),
    // write response
    .afi_bvalid                 (afi3_bvalid),
    .afi_bready                 (afi3_bready),
    .afi_bid                    (afi3_bid),
    .afi_bresp                  (afi3_bresp),
    // PL extra (non-AXI) signal
    .afi_wcount                 (afi3_wcount),
    .afi_wacount                (afi3_wacount),
    .afi_wrissuecap1en          (afi3_wrissuecap1en),
    // AXI_HP signals - read channel
    // read address
    .afi_araddr                 (afi3_araddr),
    .afi_arvalid                (afi3_arvalid),
    .afi_arready                (afi3_arready),
    .afi_arid                   (afi3_arid),
    .afi_arlock                 (afi3_arlock),
    .afi_arcache                (afi3_arcache),
    .afi_arprot                 (afi3_arprot),
    .afi_arlen                  (afi3_arlen),
    .afi_arsize                 (afi3_arsize),
    .afi_arburst                (afi3_arburst),
    .afi_arqos                  (afi3_arqos),
    // read data
    .afi_rdata                  (afi3_rdata),
    .afi_rvalid                 (afi3_rvalid),
    .afi_rready                 (afi3_rready),
    .afi_rid                    (afi3_rid),
    .afi_rlast                  (afi3_rlast),
    .afi_rresp                  (afi3_rresp),
    // PL extra (non-AXI) signal
    .afi_rcount                 (afi3_rcount),
    .afi_racount                (afi3_racount),
    .afi_rdissuecap1en          (afi3_rdissuecap1en),

    .irq                        (sata_irq), // output wire
// PHY
    .TXN                        (TXN),
    .TXP                        (TXP),
    .RXN                        (RXN),
    .RXP                        (RXP),

    .EXTCLK_P                   (EXTCLK_P),
    .EXTCLK_N                   (EXTCLK_N)
);


  PS7 ps7_i (
 // EMIO interface
 // CAN interface
    .EMIOCAN0PHYTX(),            // CAN 0 TX, output
    .EMIOCAN0PHYRX(),            // CAN 0 RX, input
    .EMIOCAN1PHYTX(),            // Can 1 TX, output
    .EMIOCAN1PHYRX(),            // CAN 1 RX, input
 // GMII 0
    .EMIOENET0GMIICRS(),         // GMII 0 Carrier sense, input
    .EMIOENET0GMIICOL(),         // GMII 0 Collision detect, input
    .EMIOENET0EXTINTIN(),        // GMII 0 Controller Interrupt input, input
    // GMII 0 TX signals
    .EMIOENET0GMIITXCLK(),       // GMII 0 TX clock, input
    .EMIOENET0GMIITXD(),         // GMII 0 Tx Data[7:0], output
    .EMIOENET0GMIITXEN(),        // GMII 0 Tx En, output
    .EMIOENET0GMIITXER(),        // GMII 0 Tx Err, output
    // GMII 0 TX timestamp signals
    .EMIOENET0SOFTX(),           // GMII 0 Tx Tx Start-of-Frame, output
    .EMIOENET0PTPDELAYREQTX(),   // GMII 0 Tx PTP delay req frame detected, output
    .EMIOENET0PTPPDELAYREQTX(),  // GMII 0 Tx PTP peer delay frame detect, output
    .EMIOENET0PTPPDELAYRESPTX(), // GMII 0 Tx PTP pear delay response frame detected, output
    .EMIOENET0PTPSYNCFRAMETX(),  // GMII 0 Tx PTP sync frame detected, output
    // GMII 0 RX signals
    .EMIOENET0GMIIRXCLK(),       // GMII 0 Rx Clock, input
    .EMIOENET0GMIIRXD(),         // GMII 0 Rx Data (7:0), input
    .EMIOENET0GMIIRXDV(),        // GMII 0 Rx Data valid, input
    .EMIOENET0GMIIRXER(),        // GMII 0 Rx Error, input
    // GMII 0 RX timestamp signals
    .EMIOENET0SOFRX(),           // GMII 0 Rx Start of Frame, output
    .EMIOENET0PTPDELAYREQRX(),   // GMII 0 Rx PTP delay req frame detected
    .EMIOENET0PTPPDELAYREQRX(),  // GMII 0 Rx PTP peer delay frame detected, output
    .EMIOENET0PTPPDELAYRESPRX(), // GMII 0 Rx PTP peer delay response frame detected, output
    .EMIOENET0PTPSYNCFRAMERX(),  // GMII 0 Rx PTP sync frame detected, output
    // MDIO 0
    .EMIOENET0MDIOMDC(),         // MDIO 0 MD clock output, output
    .EMIOENET0MDIOO(),           // MDIO 0 MD data output, output
    .EMIOENET0MDIOTN(),          // MDIO 0 MD data 3-state, output
    .EMIOENET0MDIOI(),           // MDIO 0 MD data input, input

 // GMII 1
    .EMIOENET1GMIICRS(),         // GMII 1 Carrier sense, input
    .EMIOENET1GMIICOL(),         // GMII 1 Collision detect, input
    .EMIOENET1EXTINTIN(),        // GMII 1 Controller Interrupt input, input
    // GMII 1 TX signals
    .EMIOENET1GMIITXCLK(),       // GMII 1 TX clock, input
    .EMIOENET1GMIITXD(),         // GMII 1 Tx Data[7:0], output
    .EMIOENET1GMIITXEN(),        // GMII 1 Tx En, output
    .EMIOENET1GMIITXER(),        // GMII 1 Tx Err, output
    // GMII 1 TX timestamp signals
    .EMIOENET1SOFTX(),           // GMII 1 Tx Tx Start-of-Frame, output
    .EMIOENET1PTPDELAYREQTX(),   // GMII 1 Tx PTP delay req frame detected, output
    .EMIOENET1PTPPDELAYREQTX(),  // GMII 1 Tx PTP peer delay frame detect, output
    .EMIOENET1PTPPDELAYRESPTX(), // GMII 1 Tx PTP pear delay response frame detected, output
    .EMIOENET1PTPSYNCFRAMETX(),  // GMII 1 Tx PTP sync frame detected, output
    // GMII 1 RX signals
    .EMIOENET1GMIIRXCLK(),       // GMII 1 Rx Clock, input
    .EMIOENET1GMIIRXD(),         // GMII 1 Rx Data (7:0), input
    .EMIOENET1GMIIRXDV(),        // GMII 1 Rx Data valid, input
    .EMIOENET1GMIIRXER(),        // GMII 1 Rx Error, input
    // GMII 1 RX timestamp signals
    .EMIOENET1SOFRX(),           // GMII 1 Rx Start of Frame, output
    .EMIOENET1PTPDELAYREQRX(),   // GMII 1 Rx PTP delay req frame detected
    .EMIOENET1PTPPDELAYREQRX(),  // GMII 1 Rx PTP peer delay frame detected, output
    .EMIOENET1PTPPDELAYRESPRX(), // GMII 1 Rx PTP peer delay response frame detected, output
    .EMIOENET1PTPSYNCFRAMERX(),  // GMII 1 Rx PTP sync frame detected, output
    // MDIO 1
    .EMIOENET1MDIOMDC(),         // MDIO 1 MD clock output, output
    .EMIOENET1MDIOO(),           // MDIO 1 MD data output, output
    .EMIOENET1MDIOTN(),          // MDIO 1 MD data 3-state, output
    .EMIOENET1MDIOI(),           // MDIO 1 MD data input, input
  // EMIO GPIO
    .EMIOGPIOO(),                // EMIO GPIO Data out[63:0], output
    .EMIOGPIOI(gpio_in[63:0]),   // EMIO GPIO Data in[63:0], input
    .EMIOGPIOTN(),               // EMIO GPIO OutputEnable[63:0], output
  // EMIO I2C 0  
    .EMIOI2C0SCLO(),             // I2C 0 SCL OUT, output // manual says input
    .EMIOI2C0SCLI(),             // I2C 0 SCL IN,  input  // manual says output
    .EMIOI2C0SCLTN(),            // I2C 0 SCL EN,  output // manual says input 
    .EMIOI2C0SDAO(),             // I2C 0 SDA OUT, output // manual says input
    .EMIOI2C0SDAI(),             // I2C 0 SDA IN,  input  // manual says output
    .EMIOI2C0SDATN(),            // I2C 0 SDA EN,  output // manual says input
  // EMIO I2C 1  
    .EMIOI2C1SCLO(),             // I2C 1 SCL OUT, output // manual says input
    .EMIOI2C1SCLI(),             // I2C 1 SCL IN,  input  // manual says output
    .EMIOI2C1SCLTN(),            // I2C 1 SCL EN,  output // manual says input 
    .EMIOI2C1SDAO(),             // I2C 1 SDA OUT, output // manual says input
    .EMIOI2C1SDAI(),             // I2C 1 SDA IN,  input  // manual says output
    .EMIOI2C1SDATN(),            // I2C 1 SDA EN,  output // manual says input
// JTAG
    .EMIOPJTAGTCK(),             // JTAG TCK, input
    .EMIOPJTAGTMS(),             // JTAG TMS, input
    .EMIOPJTAGTDI(),             // JTAG TDI, input
    .EMIOPJTAGTDO(),             // JTAG TDO, output
    .EMIOPJTAGTDTN(),            // JTAG TDO OE, output
 // SDIO 0  
    .EMIOSDIO0CLKFB(),           // SDIO 0 Clock feedback, input
    .EMIOSDIO0CLK(),             // SDIO 0 Clock, output
    .EMIOSDIO0CMDI(),            // SDIO 0 Command in, input
    .EMIOSDIO0CMDO(),            // SDIO 0 Command out, output
    .EMIOSDIO0CMDTN(),           // SDIO 0 command OE, output
    .EMIOSDIO0DATAI(),           // SDIO 0 Data in [3:0], input
    .EMIOSDIO0DATAO(),           // SDIO 0 Data out [3:0], output
    .EMIOSDIO0DATATN(),          // SDIO 0 Data OE [3:0], output
    .EMIOSDIO0CDN(),             // SDIO 0 Card detect, input
    .EMIOSDIO0WP(),              // SDIO 0 Write protect, input
    .EMIOSDIO0BUSPOW(),          // SDIO 0 Power control, output
    .EMIOSDIO0LED(),             // SDIO 0 LED control, output
    .EMIOSDIO0BUSVOLT(),         // SDIO 0 Bus voltage [2:0], output
 // SDIO 1  
    .EMIOSDIO1CLKFB(),           // SDIO 1 Clock feedback, input
    .EMIOSDIO1CLK(),             // SDIO 1 Clock, output
    .EMIOSDIO1CMDI(),            // SDIO 1 Command in, input
    .EMIOSDIO1CMDO(),            // SDIO 1 Command out, output
    .EMIOSDIO1CMDTN(),           // SDIO 1 command OE, output
    .EMIOSDIO1DATAI(),           // SDIO 1 Data in [3:0], input
    .EMIOSDIO1DATAO(),           // SDIO 1 Data out [3:0], output
    .EMIOSDIO1DATATN(),          // SDIO 1 Data OE [3:0], output
    .EMIOSDIO1CDN(),             // SDIO 1 Card detect, input
    .EMIOSDIO1WP(),              // SDIO 1 Write protect, input
    .EMIOSDIO1BUSPOW(),          // SDIO 1 Power control, output
    .EMIOSDIO1LED(),             // SDIO 1 LED control, output
    .EMIOSDIO1BUSVOLT(),         // SDIO 1 Bus voltage [2:0], output
  // SPI 0    
    .EMIOSPI0SCLKI(),            // SPI 0 CLK in , input
    .EMIOSPI0SCLKO(),            // SPI 0 CLK out, output
    .EMIOSPI0SCLKTN(),           // SPI 0 CLK OE, output
    .EMIOSPI0SI(),               // SPI 0 MOSI in , input
    .EMIOSPI0MO(),               // SPI 0 MOSI out , output
    .EMIOSPI0MOTN(),             // SPI 0 MOSI OE, output
    .EMIOSPI0MI(),               // SPI 0 MISO in, input
    .EMIOSPI0SO(),               // SPI 0 MISO out, output
    .EMIOSPI0STN(),              // SPI 0 MISO OE, output
    .EMIOSPI0SSIN(),             // SPI 0 Slave select 0 in, input
    .EMIOSPI0SSON(),             // SPI 0 Slave select [2:0] out, output
    .EMIOSPI0SSNTN(),            // SPI 0 Slave select OE, output
  // SPI 1    
    .EMIOSPI1SCLKI(),            // SPI 1 CLK in , input
    .EMIOSPI1SCLKO(),            // SPI 1 CLK out, output
    .EMIOSPI1SCLKTN(),           // SPI 1 CLK OE, output
    .EMIOSPI1SI(),               // SPI 1 MOSI in , input
    .EMIOSPI1MO(),               // SPI 1 MOSI out , output
    .EMIOSPI1MOTN(),             // SPI 1 MOSI OE, output
    .EMIOSPI1MI(),               // SPI 1 MISO in, input
    .EMIOSPI1SO(),               // SPI 1 MISO out, output
    .EMIOSPI1STN(),              // SPI 1 MISO OE, output
    .EMIOSPI1SSIN(),             // SPI 1 Slave select 0 in, input
    .EMIOSPI1SSON(),             // SPI 1 Slave select [2:0] out, output
    .EMIOSPI1SSNTN(),            // SPI 1 Slave select OE, output
// TPIU signals (Trace)    
    .EMIOTRACECTL(),             // Trace CTL, output
    .EMIOTRACEDATA(),            // Trace Data[31:0], output
    .EMIOTRACECLK(),             // Trace CLK, input
// Timers/counters    
    .EMIOTTC0CLKI(),             // Counter/Timer 0 clock in [2:0], input
    .EMIOTTC0WAVEO(),            // Counter/Timer 0 wave out[2:0], output
    .EMIOTTC1CLKI(),             // Counter/Timer 1 clock in [2:0], input
    .EMIOTTC1WAVEO(),            // Counter/Timer 1 wave out[2:0], output
 //UART 0
    .EMIOUART0TX(),              // UART 0 Transmit, output
    .EMIOUART0RX(),              // UART 0 Receive, input
    .EMIOUART0CTSN(),            // UART 0 Clear To Send, input
    .EMIOUART0RTSN(),            // UART 0 Ready to Send, output
    .EMIOUART0DSRN(),            // UART 0 Data Set Ready , input
    .EMIOUART0DCDN(),            // UART 0 Data Carrier Detect, input
    .EMIOUART0RIN(),             // UART 0 Ring Indicator, input
    .EMIOUART0DTRN(),            // UART 0 Data Terminal Ready, output
 //UART 1
    .EMIOUART1TX(),              // UART 1 Transmit, output
    .EMIOUART1RX(),              // UART 1 Receive, input
    .EMIOUART1CTSN(),            // UART 1 Clear To Send, input
    .EMIOUART1RTSN(),            // UART 1 Ready to Send, output
    .EMIOUART1DSRN(),            // UART 1 Data Set Ready , input
    .EMIOUART1DCDN(),            // UART 1 Data Carrier Detect, input
    .EMIOUART1RIN(),             // UART 1 Ring Indicator, input
    .EMIOUART1DTRN(),            // UART 1 Data Terminal Ready, output
 // USB 0    
    .EMIOUSB0PORTINDCTL(),       // USB 0 Port Indicator [1:0], output 
    .EMIOUSB0VBUSPWRFAULT(),     // USB 0 Power Fault, input
    .EMIOUSB0VBUSPWRSELECT(),    // USB 0 Power Select, output
 // USB 1    
    .EMIOUSB1PORTINDCTL(),       // USB 1 Port Indicator [1:0], output 
    .EMIOUSB1VBUSPWRFAULT(),     // USB 1 Power Fault, input
    .EMIOUSB1VBUSPWRSELECT(),    // USB 1 Power Select, output
 // Watchdog Timer    
    .EMIOWDTCLKI(),              // Watchdog Timer Clock in, input
    .EMIOWDTRSTO(),              // Watchdog Timer Reset out, output
 // DMAC 0  
    .DMA0ACLK(),                 // DMAC 0 Clock, input
    .DMA0DRVALID(),              // DMAC 0 DMA Request Valid, input
    .DMA0DRLAST(),               // DMAC 0 DMA Request Last, input
    .DMA0DRTYPE(),               // DMAC 0 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA0DRREADY(),              // DMAC 0 DMA Request Ready, output
    .DMA0DAVALID(),              // DMAC 0 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA0DAREADY(),              // DMAC 0 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA0DATYPE(),               // DMAC 0 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA0RSTN(),                 // DMAC 0 RESET output (reserved, do not use), output
 // DMAC 1 
    .DMA1ACLK(),                 // DMAC 1 Clock, input
    .DMA1DRVALID(),              // DMAC 1 DMA Request Valid, input
    .DMA1DRLAST(),               // DMAC 1 DMA Request Last, input
    .DMA1DRTYPE(),               // DMAC 1 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA1DRREADY(),              // DMAC 1 DMA Request Ready, output
    .DMA1DAVALID(),              // DMAC 1 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA1DAREADY(),              // DMAC 1 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA1DATYPE(),               // DMAC 1 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA1RSTN(),                 // DMAC 1 RESET output (reserved, do not use), output
 // DMAC 2  
    .DMA2ACLK(),                 // DMAC 2 Clock, input
    .DMA2DRVALID(),              // DMAC 2 DMA Request Valid, input
    .DMA2DRLAST(),               // DMAC 2 DMA Request Last, input
    .DMA2DRTYPE(),               // DMAC 2 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA2DRREADY(),              // DMAC 2 DMA Request Ready, output
    .DMA2DAVALID(),              // DMAC 2 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA2DAREADY(),              // DMAC 2 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA2DATYPE(),               // DMAC 2 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA2RSTN(),                 // DMAC 2 RESET output (reserved, do not use), output
 // DMAC 3  
    .DMA3ACLK(),                 // DMAC 3 Clock, input
    .DMA3DRVALID(),              // DMAC 3 DMA Request Valid, input
    .DMA3DRLAST(),               // DMAC 3 DMA Request Last, input
    .DMA3DRTYPE(),               // DMAC 3 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA3DRREADY(),              // DMAC 3 DMA Request Ready, output
    .DMA3DAVALID(),              // DMAC 3 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA3DAREADY(),              // DMAC 3 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA3DATYPE(),               // DMAC 3 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA3RSTN(),                 // DMAC 3 RESET output (reserved, do not use), output
 // Interrupt signals
    .IRQF2P({4'b0,               // [19:16] Reserved                            PPI: nFIQ, nIRQ (both CPUs)    
            cmprs_irq[3:0],      // [15:12] Compressor done interrupts          SPI: Numbers [91:88]
            frseq_irq[3:0],      // [11: 8] Frame sync interrupts               SPI: Numbers [87:84]
            mult_saxi_irq[3:0],  // [ 7: 4] interrupts from mult_saxi channels  SPI: Numbers [68:65]
            membridge_irq,       //     [3] interrupts from membridge module    SPI: Number     [64]    
            2'b0,                // [ 2: 1] Reserved                            SPI: Numbers [63:62]
            sata_irq             // [    0] AHCI (SATA ) interrupt              SPI: Number     [61]
            }),                  // Interrupts, PL to PS [19:0], input
    .IRQP2F(),                   // Interrupts, PL to PS [28:0], output
 // Event Signals
    .EVENTEVENTI(),              // EVENT Wake up one or both CPU from WFE state, input
    .EVENTEVENTO(),              // EVENT Asserted when one of the COUs executed SEV instruction, output
    .EVENTSTANDBYWFE(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an event, output
    .EVENTSTANDBYWFI(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an interrupt, output
 // PL Resets and clocks
    .FCLKCLK(fclk[3:0]),         // PL Clocks [3:0], output
    .FCLKCLKTRIGN(),             // PL Clock Throttle Control [3:0], input
    .FCLKRESETN(frst[3:0]),      // PL General purpose user reset [3:0], output (active low)
// Debug signals
    .FTMTP2FDEBUG(),             // Debug General purpose debug output [31:0], output
    .FTMTF2PDEBUG(),             // Debug General purpose debug input [31:0], input
    .FTMTP2FTRIG(),              // Debug Trigger PS to PL [3:0], output
    .FTMTP2FTRIGACK(),           // Debug Trigger PS to PL acknowledge[3:0], input
    .FTMTF2PTRIG(),              // Debug Trigger PL to PS [3:0], input
    .FTMTF2PTRIGACK(),           // Debug Trigger PL to PS acknowledge[3:0], output
    .FTMDTRACEINCLOCK(),         // Debug Trace PL to PS Clock, input
    .FTMDTRACEINVALID(),         // Debug Trace PL to PS Clock, data&id valid, input
    .FTMDTRACEINDATA(),          // Debug Trace PL to PS data [31:0], input
    .FTMDTRACEINATID(),          // Debug Trace PL to PS ID [3:0], input
// DDR Urgent
    .DDRARB(),                   // DDR Urgent[3:0], input
    
// SRAM interrupt (on rising edge)
    .EMIOSRAMINTIN(),             // SRAM interrupt #50 shared with NAND busy, input
// AXI interfaces
    .FPGAIDLEN(1'b1),             //Idle PL AXI interfaces (active low), input
// AXI PS Master GP0    
// AXI PS Master GP0: Clock, Reset
    .MAXIGP0ACLK(axi_aclk),       // AXI PS Master GP0 Clock , input
//    .MAXIGP0ACLK(fclk[0]),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(~fclk[0]),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(axi_naclk),       // AXI PS Master GP0 Clock , input
    //
    .MAXIGP0ARESETN(),            // AXI PS Master GP0 Reset, output
// AXI PS Master GP0: Read Address    
    .MAXIGP0ARADDR  (maxi0_araddr[31:0]), // AXI PS Master GP0 ARADDR[31:0], output  
    .MAXIGP0ARVALID (maxi0_arvalid),     // AXI PS Master GP0 ARVALID, output
    .MAXIGP0ARREADY (maxi0_arready),     // AXI PS Master GP0 ARREADY, input
    .MAXIGP0ARID    (maxi0_arid[11:0]),     // AXI PS Master GP0 ARID[11:0], output
    .MAXIGP0ARLOCK   (),  // AXI PS Master GP0 ARLOCK[1:0], output
    .MAXIGP0ARCACHE  (),// AXI PS Master GP0 ARCACHE[3:0], output
    .MAXIGP0ARPROT(),  // AXI PS Master GP0 ARPROT[2:0], output
    .MAXIGP0ARLEN   (maxi0_arlen[3:0]),    // AXI PS Master GP0 ARLEN[3:0], output
    .MAXIGP0ARSIZE  (maxi0_arsize[1:0]),  // AXI PS Master GP0 ARSIZE[1:0], output
    .MAXIGP0ARBURST (maxi0_arburst[1:0]),// AXI PS Master GP0 ARBURST[1:0], output
    .MAXIGP0ARQOS    (),    // AXI PS Master GP0 ARQOS[3:0], output
// AXI PS Master GP0: Read Data
    .MAXIGP0RDATA   (maxi0_rdata[31:0]),   // AXI PS Master GP0 RDATA[31:0], input
    .MAXIGP0RVALID  (maxi0_rvalid),       // AXI PS Master GP0 RVALID, input
    .MAXIGP0RREADY  (maxi0_rready),       // AXI PS Master GP0 RREADY, output
    .MAXIGP0RID     (maxi0_rid[11:0]),       // AXI PS Master GP0 RID[11:0], input
    .MAXIGP0RLAST   (maxi0_rlast),         // AXI PS Master GP0 RLAST, input
    .MAXIGP0RRESP   (maxi0_rresp[1:0]),    // AXI PS Master GP0 RRESP[1:0], input
    
// AXI PS Master GP0: Write Address    
    .MAXIGP0AWADDR  (maxi0_awaddr[31:0]), // AXI PS Master GP0 AWADDR[31:0], output
    .MAXIGP0AWVALID (maxi0_awvalid),     // AXI PS Master GP0 AWVALID, output
    .MAXIGP0AWREADY (maxi0_awready),     // AXI PS Master GP0 AWREADY, input
    .MAXIGP0AWID    (maxi0_awid[11:0]),     // AXI PS Master GP0 AWID[11:0], output
    .MAXIGP0AWLOCK   (),  // AXI PS Master GP0 AWLOCK[1:0], output
    .MAXIGP0AWCACHE  (),// AXI PS Master GP0 AWCACHE[3:0], output
    .MAXIGP0AWPROT   (),                  // AXI PS Master GP0 AWPROT[2:0], output
    .MAXIGP0AWLEN   (maxi0_awlen[3:0]),   // AXI PS Master GP0 AWLEN[3:0], output
    .MAXIGP0AWSIZE  (maxi0_awsize[1:0]),  // AXI PS Master GP0 AWSIZE[1:0], output
    .MAXIGP0AWBURST (maxi0_awburst[1:0]), // AXI PS Master GP0 AWBURST[1:0], output
    .MAXIGP0AWQOS    (),                  // AXI PS Master GP0 AWQOS[3:0], output
// AXI PS Master GP0: Write Data
    .MAXIGP0WDATA   (maxi0_wdata[31:0]),  // AXI PS Master GP0 WDATA[31:0], output
    .MAXIGP0WVALID  (maxi0_wvalid),       // AXI PS Master GP0 WVALID, output
    .MAXIGP0WREADY  (maxi0_wready),       // AXI PS Master GP0 WREADY, input
    .MAXIGP0WID     (maxi0_wid[11:0]),    // AXI PS Master GP0 WID[11:0], output
    .MAXIGP0WLAST   (maxi0_wlast),        // AXI PS Master GP0 WLAST, output
    .MAXIGP0WSTRB   (maxi0_wstb[3:0]),    // AXI PS Master GP0 WSTRB[3:0], output
// AXI PS Master GP0: Write response
    .MAXIGP0BVALID  (maxi0_bvalid),       // AXI PS Master GP0 BVALID, input
    .MAXIGP0BREADY  (maxi0_bready),       // AXI PS Master GP0 BREADY, output
    .MAXIGP0BID     (maxi0_bid[11:0]),    // AXI PS Master GP0 BID[11:0], input
    .MAXIGP0BRESP   (maxi0_bresp[1:0]),   // AXI PS Master GP0 BRESP[1:0], input

// AXI PS Master GP1    
// AXI PS Master GP1: Clock, Reset
    .MAXIGP1ACLK    (hclk),               // AXI PS Master GP1 Clock , input
    .MAXIGP1ARESETN(),                    // AXI PS Master GP1 Reset, output
// AXI PS Master GP1: Read Address    
    .MAXIGP1ARADDR  (maxi1_araddr),       // AXI PS Master GP1 ARADDR[31:0], output
    .MAXIGP1ARVALID (maxi1_arvalid),      // AXI PS Master GP1 ARVALID, output
    .MAXIGP1ARREADY (maxi1_arready),      // AXI PS Master GP1 ARREADY, input
    .MAXIGP1ARID    (maxi1_arid),         // AXI PS Master GP1 ARID[11:0], output
    .MAXIGP1ARLOCK  (),                   // AXI PS Master GP1 ARLOCK[1:0], output
    .MAXIGP1ARCACHE (),                   // AXI PS Master GP1 ARCACHE[3:0], output
    .MAXIGP1ARPROT  (),                   // AXI PS Master GP1 ARPROT[2:0], output
    .MAXIGP1ARLEN   (maxi1_arlen),        // AXI PS Master GP1 ARLEN[3:0], output
    .MAXIGP1ARSIZE  (maxi1_arsize),       // AXI PS Master GP1 ARSIZE[1:0], output
    .MAXIGP1ARBURST (maxi1_arburst),      // AXI PS Master GP1 ARBURST[1:0], output
    .MAXIGP1ARQOS   (),                   // AXI PS Master GP1 ARQOS[3:0], output
// AXI PS Master GP1: Read Data
    .MAXIGP1RDATA   (maxi1_rdata),        // AXI PS Master GP1 RDATA[31:0], input
    .MAXIGP1RVALID  (maxi1_rvalid),       // AXI PS Master GP1 RVALID, input
    .MAXIGP1RREADY  (maxi1_rready),       // AXI PS Master GP1 RREADY, output
    .MAXIGP1RID     (maxi1_rid),          // AXI PS Master GP1 RID[11:0], input
    .MAXIGP1RLAST   (maxi1_rlast),        // AXI PS Master GP1 RLAST, input
    .MAXIGP1RRESP   (maxi1_rresp),        // AXI PS Master GP1 RRESP[1:0], input
// AXI PS Master GP1: Write Address    
    .MAXIGP1AWADDR  (maxi1_awaddr),       // AXI PS Master GP1 AWADDR[31:0], output
    .MAXIGP1AWVALID (maxi1_awvalid),      // AXI PS Master GP1 AWVALID, output
    .MAXIGP1AWREADY (maxi1_awready),      // AXI PS Master GP1 AWREADY, input
    .MAXIGP1AWID    (maxi1_awid),         // AXI PS Master GP1 AWID[11:0], output
    .MAXIGP1AWLOCK  (),                   // AXI PS Master GP1 AWLOCK[1:0], output
    .MAXIGP1AWCACHE (),                   // AXI PS Master GP1 AWCACHE[3:0], output
    .MAXIGP1AWPROT  (),                   // AXI PS Master GP1 AWPROT[2:0], output
    .MAXIGP1AWLEN   (maxi1_awlen),        // AXI PS Master GP1 AWLEN[3:0], output
    .MAXIGP1AWSIZE  (maxi1_awsize),       // AXI PS Master GP1 AWSIZE[1:0], output
    .MAXIGP1AWBURST (maxi1_awburst),      // AXI PS Master GP1 AWBURST[1:0], output
    .MAXIGP1AWQOS   (),                   // AXI PS Master GP1 AWQOS[3:0], output
// AXI PS Master GP1: Write Data
    .MAXIGP1WDATA   (maxi1_wdata),        // AXI PS Master GP1 WDATA[31:0], output
    .MAXIGP1WVALID  (maxi1_wvalid),       // AXI PS Master GP1 WVALID, output
    .MAXIGP1WREADY  (maxi1_wready),       // AXI PS Master GP1 WREADY, input
    .MAXIGP1WID     (maxi1_wid),          // AXI PS Master GP1 WID[11:0], output
    .MAXIGP1WLAST   (maxi1_wlast),        // AXI PS Master GP1 WLAST, output
    .MAXIGP1WSTRB   (maxi1_wstb),         // AXI PS Master GP1 maxi1_wstb[3:0], output
// AXI PS Master GP1: Write response
    .MAXIGP1BVALID  (maxi1_bvalid),       // AXI PS Master GP1 BVALID, input
    .MAXIGP1BREADY  (maxi1_bready),       // AXI PS Master GP1 BREADY, output
    .MAXIGP1BID     (maxi1_bid),          // AXI PS Master GP1 BID[11:0], input
    .MAXIGP1BRESP   (maxi1_bresp),        // AXI PS Master GP1 BRESP[1:0], input

// AXI PS Slave GP0    
// AXI PS Slave GP0: Clock, Reset
    .SAXIGP0ACLK       (saxi0_aclk),      // AXI PS Slave GP0 Clock , input
    .SAXIGP0ARESETN(),                    // AXI PS Slave GP0 Reset, output
// AXI PS Slave GP0: Read Address    - Not used
    .SAXIGP0ARADDR(),                     // AXI PS Slave GP0 ARADDR[31:0], input  
    .SAXIGP0ARVALID(),                    // AXI PS Slave GP0 ARVALID, input
    .SAXIGP0ARREADY(),                    // AXI PS Slave GP0 ARREADY, output
    .SAXIGP0ARID(),                       // AXI PS Slave GP0 ARID[5:0], input
    .SAXIGP0ARLOCK(),                     // AXI PS Slave GP0 ARLOCK[1:0], input
    .SAXIGP0ARCACHE(),                    // AXI PS Slave GP0 ARCACHE[3:0], input
    .SAXIGP0ARPROT(),                     // AXI PS Slave GP0 ARPROT[2:0], input
    .SAXIGP0ARLEN(),                      // AXI PS Slave GP0 ARLEN[3:0], input
    .SAXIGP0ARSIZE(),                     // AXI PS Slave GP0 ARSIZE[1:0], input
    .SAXIGP0ARBURST(),                    // AXI PS Slave GP0 ARBURST[1:0], input
    .SAXIGP0ARQOS(),                      // AXI PS Slave GP0 ARQOS[3:0], input
// AXI PS Slave GP0: Read Data    - Not used
    .SAXIGP0RDATA(),                      // AXI PS Slave GP0 RDATA[31:0], output
    .SAXIGP0RVALID(),                     // AXI PS Slave GP0 RVALID, output
    .SAXIGP0RREADY(),                     // AXI PS Slave GP0 RREADY, input
    .SAXIGP0RID(),                        // AXI PS Slave GP0 RID[5:0], output
    .SAXIGP0RLAST(),                      // AXI PS Slave GP0 RLAST, output
    .SAXIGP0RRESP(),                      // AXI PS Slave GP0 RRESP[1:0], output
// AXI PS Slave GP0: Write Address    
    .SAXIGP0AWADDR     (saxi0_awaddr),    // AXI PS Slave GP0 AWADDR[31:0], input
    .SAXIGP0AWVALID    (saxi0_awvalid),   // AXI PS Slave GP0 AWVALID, input
    .SAXIGP0AWREADY    (saxi0_awready),   // AXI PS Slave GP0 AWREADY, output
    .SAXIGP0AWID       (saxi0_awid),      // AXI PS Slave GP0 AWID[5:0], input
    .SAXIGP0AWLOCK     (saxi0_awlock),    // AXI PS Slave GP0 AWLOCK[1:0], input
    .SAXIGP0AWCACHE    (saxi0_awcache),   // AXI PS Slave GP0 AWCACHE[3:0], input
    .SAXIGP0AWPROT     (saxi0_awprot),    // AXI PS Slave GP0 AWPROT[2:0], input
    .SAXIGP0AWLEN      (saxi0_awlen),     // AXI PS Slave GP0 AWLEN[3:0], input
    .SAXIGP0AWSIZE     (saxi0_awsize),    // AXI PS Slave GP0 AWSIZE[1:0], input
    .SAXIGP0AWBURST    (saxi0_awburst),   // AXI PS Slave GP0 AWBURST[1:0], input
    .SAXIGP0AWQOS      (saxi0_awqos),     // AXI PS Slave GP0 AWQOS[3:0], input
// AXI PS Slave GP0: Write Data
    .SAXIGP0WDATA      (saxi0_wdata),     // AXI PS Slave GP0 WDATA[31:0], input
    .SAXIGP0WVALID     (saxi0_wvalid),    // AXI PS Slave GP0 WVALID, input
    .SAXIGP0WREADY     (saxi0_wready),    // AXI PS Slave GP0 WREADY, output
    .SAXIGP0WID        (saxi0_wid),       // AXI PS Slave GP0 WID[5:0], input
    .SAXIGP0WLAST      (saxi0_wlast),     // AXI PS Slave GP0 WLAST, input
    .SAXIGP0WSTRB      (saxi0_wstrb),     // AXI PS Slave GP0 WSTRB[3:0], input
// AXI PS Slave GP0: Write response
    .SAXIGP0BVALID     (saxi0_bvalid),    // AXI PS Slave GP0 BVALID, output
    .SAXIGP0BREADY     (saxi0_bready),    // AXI PS Slave GP0 BREADY, input
    .SAXIGP0BID        (saxi0_bid),       // AXI PS Slave GP0 BID[5:0], output //TODO:  Update range !!!
    .SAXIGP0BRESP      (saxi0_bresp),     // AXI PS Slave GP0 BRESP[1:0], output

// AXI PS Slave GP1    
// AXI PS Slave GP1: Clock, Reset
    .SAXIGP1ACLK       (saxi1_aclk),      // AXI PS Slave GP1 Clock , input
    .SAXIGP1ARESETN(),                    // AXI PS Slave GP1 Reset, output
// AXI PS Slave GP1: Read Address    
    .SAXIGP1ARADDR(),                     // AXI PS Slave GP1 ARADDR[31:0], input  
    .SAXIGP1ARVALID(),                    // AXI PS Slave GP1 ARVALID, input
    .SAXIGP1ARREADY(),                    // AXI PS Slave GP1 ARREADY, output
    .SAXIGP1ARID(),                       // AXI PS Slave GP1 ARID[5:0], input
    .SAXIGP1ARLOCK(),                     // AXI PS Slave GP1 ARLOCK[1:0], input
    .SAXIGP1ARCACHE(),                    // AXI PS Slave GP1 ARCACHE[3:0], input
    .SAXIGP1ARPROT(),                     // AXI PS Slave GP1 ARPROT[2:0], input
    .SAXIGP1ARLEN(),                      // AXI PS Slave GP1 ARLEN[3:0], input
    .SAXIGP1ARSIZE(),                     // AXI PS Slave GP1 ARSIZE[1:0], input
    .SAXIGP1ARBURST(),                    // AXI PS Slave GP1 ARBURST[1:0], input
    .SAXIGP1ARQOS(),                      // AXI PS Slave GP1 ARQOS[3:0], input
// AXI PS Slave GP1: Read Data
    .SAXIGP1RDATA(),                      // AXI PS Slave GP1 RDATA[31:0], output
    .SAXIGP1RVALID(),                     // AXI PS Slave GP1 RVALID, output
    .SAXIGP1RREADY(),                     // AXI PS Slave GP1 RREADY, input
    .SAXIGP1RID(),                        // AXI PS Slave GP1 RID[5:0], output
    .SAXIGP1RLAST(),                      // AXI PS Slave GP1 RLAST, output
    .SAXIGP1RRESP(),                      // AXI PS Slave GP1 RRESP[1:0], output
// AXI PS Slave GP1: Write Address    
    .SAXIGP1AWADDR     (saxi1_awaddr),   // AXI PS Slave GP1 AWADDR[31:0], input
    .SAXIGP1AWVALID    (saxi1_awvalid),  // AXI PS Slave GP1 AWVALID, input
    .SAXIGP1AWREADY    (saxi1_awready),  // AXI PS Slave GP1 AWREADY, output
    .SAXIGP1AWID       (saxi1_awid),     // AXI PS Slave GP1 AWID[5:0], input
    .SAXIGP1AWLOCK     (saxi1_awlock),   // AXI PS Slave GP1 AWLOCK[1:0], input
    .SAXIGP1AWCACHE    (saxi1_awcache),  // AXI PS Slave GP1 AWCACHE[3:0], input
    .SAXIGP1AWPROT     (saxi1_awprot),   // AXI PS Slave GP1 AWPROT[2:0], input
    .SAXIGP1AWLEN      (saxi1_awlen),    // AXI PS Slave GP1 AWLEN[3:0], input
    .SAXIGP1AWSIZE     (saxi1_awsize),   // AXI PS Slave GP1 AWSIZE[1:0], input
    .SAXIGP1AWBURST    (saxi1_awburst),  // AXI PS Slave GP1 AWBURST[1:0], input
    .SAXIGP1AWQOS      (saxi1_awqos),    // AXI PS Slave GP1 AWQOS[3:0], input
// AXI PS Slave GP1: Write Data
    .SAXIGP1WDATA      (saxi1_wdata),    // AXI PS Slave GP1 WDATA[31:0], input
    .SAXIGP1WVALID     (saxi1_wvalid),   // AXI PS Slave GP1 WVALID, input
    .SAXIGP1WREADY     (saxi1_wready),   // AXI PS Slave GP1 WREADY, output
    .SAXIGP1WID        (saxi1_wid),      // AXI PS Slave GP1 WID[5:0], input
    .SAXIGP1WLAST      (saxi1_wlast),    // AXI PS Slave GP1 WLAST, input
    .SAXIGP1WSTRB      (saxi1_wstrb),    // AXI PS Slave GP1 WSTRB[3:0], input
// AXI PS Slave GP1: Write response
    .SAXIGP1BVALID     (saxi1_bvalid),   // AXI PS Slave GP1 BVALID, output
    .SAXIGP1BREADY     (saxi1_bready),   // AXI PS Slave GP1 BREADY, input
    .SAXIGP1BID        (saxi1_bid),      // AXI PS Slave GP1 BID[5:0], output //TODO:  Update range !!!
    .SAXIGP1BRESP      (saxi1_bresp),    // AXI PS Slave GP1 BRESP[1:0], output

// AXI PS Slave HP0    
// AXI PS Slave HP0: Clock, Reset
    .SAXIHP0ACLK          (hclk),                   // AXI PS Slave HP0 Clock , input
    .SAXIHP0ARESETN       (),                       // AXI PS Slave HP0 Reset, output
// AXI PS Slave HP0: Read Address    
    .SAXIHP0ARADDR        (afi0_araddr),            // AXI PS Slave HP0 ARADDR[31:0], input  
    .SAXIHP0ARVALID       (afi0_arvalid),           // AXI PS Slave HP0 ARVALID, input
    .SAXIHP0ARREADY       (afi0_arready),           // AXI PS Slave HP0 ARREADY, output
    .SAXIHP0ARID          (afi0_arid),              // AXI PS Slave HP0 ARID[5:0], input
    .SAXIHP0ARLOCK        (afi0_arlock),            // AXI PS Slave HP0 ARLOCK[1:0], input
    .SAXIHP0ARCACHE       (afi0_arcache),           // AXI PS Slave HP0 ARCACHE[3:0], input
    .SAXIHP0ARPROT        (afi0_arprot),            // AXI PS Slave HP0 ARPROT[2:0], input
    .SAXIHP0ARLEN         (afi0_arlen),             // AXI PS Slave HP0 ARLEN[3:0], input
    .SAXIHP0ARSIZE        (afi0_arsize),            // AXI PS Slave HP0 ARSIZE[2:0], input
    .SAXIHP0ARBURST       (afi0_arburst),           // AXI PS Slave HP0 ARBURST[1:0], input
    .SAXIHP0ARQOS         (afi0_arqos),             // AXI PS Slave HP0 ARQOS[3:0], input
// AXI PS Slave HP0: Read Data
    .SAXIHP0RDATA         (afi0_rdata),             // AXI PS Slave HP0 RDATA[63:0], output
    .SAXIHP0RVALID        (afi0_rvalid),            // AXI PS Slave HP0 RVALID, output
    .SAXIHP0RREADY        (afi0_rready),            // AXI PS Slave HP0 RREADY, input
    .SAXIHP0RID           (afi0_rid),               // AXI PS Slave HP0 RID[5:0], output
    .SAXIHP0RLAST         (afi0_rlast),             // AXI PS Slave HP0 RLAST, output
    .SAXIHP0RRESP         (afi0_rresp),             // AXI PS Slave HP0 RRESP[1:0], output
    .SAXIHP0RCOUNT        (afi0_rcount),            // AXI PS Slave HP0 RCOUNT[7:0], output
    .SAXIHP0RACOUNT       (afi0_racount),           // AXI PS Slave HP0 RACOUNT[2:0], output
    .SAXIHP0RDISSUECAP1EN (afi0_rdissuecap1en),     // AXI PS Slave HP0 RDISSUECAP1EN, input
// AXI PS Slave HP0: Write Address    
    .SAXIHP0AWADDR        (afi0_awaddr),            // AXI PS Slave HP0 AWADDR[31:0], input
    .SAXIHP0AWVALID       (afi0_awvalid),           // AXI PS Slave HP0 AWVALID, input
    .SAXIHP0AWREADY       (afi0_awready),           // AXI PS Slave HP0 AWREADY, output
    .SAXIHP0AWID          (afi0_awid),              // AXI PS Slave HP0 AWID[5:0], input
    .SAXIHP0AWLOCK        (afi0_awlock),            // AXI PS Slave HP0 AWLOCK[1:0], input
    .SAXIHP0AWCACHE       (afi0_awcache),           // AXI PS Slave HP0 AWCACHE[3:0], input
    .SAXIHP0AWPROT        (afi0_awprot),            // AXI PS Slave HP0 AWPROT[2:0], input
    .SAXIHP0AWLEN         (afi0_awlen),             // AXI PS Slave HP0 AWLEN[3:0], input
    .SAXIHP0AWSIZE        (afi0_awsize),            // AXI PS Slave HP0 AWSIZE[1:0], input
    .SAXIHP0AWBURST       (afi0_awburst),           // AXI PS Slave HP0 AWBURST[1:0], input
    .SAXIHP0AWQOS         (afi0_awqos),             // AXI PS Slave HP0 AWQOS[3:0], input
// AXI PS Slave HP0: Write Data
    .SAXIHP0WDATA         (afi0_wdata),             // AXI PS Slave HP0 WDATA[63:0], input
    .SAXIHP0WVALID        (afi0_wvalid),            // AXI PS Slave HP0 WVALID, input
    .SAXIHP0WREADY        (afi0_wready),            // AXI PS Slave HP0 WREADY, output
    .SAXIHP0WID           (afi0_wid),               // AXI PS Slave HP0 WID[5:0], input
    .SAXIHP0WLAST         (afi0_wlast),             // AXI PS Slave HP0 WLAST, input
    .SAXIHP0WSTRB         (afi0_wstrb),             // AXI PS Slave HP0 WSTRB[7:0], input
    .SAXIHP0WCOUNT        (afi0_wcount),            // AXI PS Slave HP0 WCOUNT[7:0], output
    .SAXIHP0WACOUNT       (afi0_wacount),           // AXI PS Slave HP0 WACOUNT[5:0], output
    .SAXIHP0WRISSUECAP1EN (afi0_wrissuecap1en),     // AXI PS Slave HP0 WRISSUECAP1EN, input
// AXI PS Slave HP0: Write response
    .SAXIHP0BVALID        (afi0_bvalid),            // AXI PS Slave HP0 BVALID, output
    .SAXIHP0BREADY        (afi0_bready),            // AXI PS Slave HP0 BREADY, input
    .SAXIHP0BID           (afi0_bid),               // AXI PS Slave HP0 BID[5:0], output
    .SAXIHP0BRESP         (afi0_bresp),             // AXI PS Slave HP0 BRESP[1:0], output

// AXI PS Slave HP1    
// AXI PS Slave 1: Clock, Reset
    .SAXIHP1ACLK          (hclk),                   // AXI PS Slave HP1 Clock , input
    .SAXIHP1ARESETN(),                              // AXI PS Slave HP1 Reset, output
// AXI PS Slave HP1: Read Address   - unused
    .SAXIHP1ARADDR(),                               // AXI PS Slave HP1 ARADDR[31:0], input  
    .SAXIHP1ARVALID(),                              // AXI PS Slave HP1 ARVALID, input
    .SAXIHP1ARREADY(),                              // AXI PS Slave HP1 ARREADY, output
    .SAXIHP1ARID(),                                 // AXI PS Slave HP1 ARID[5:0], input
    .SAXIHP1ARLOCK(),                               // AXI PS Slave HP1 ARLOCK[1:0], input
    .SAXIHP1ARCACHE(),                              // AXI PS Slave HP1 ARCACHE[3:0], input
    .SAXIHP1ARPROT(),                               // AXI PS Slave HP1 ARPROT[2:0], input
    .SAXIHP1ARLEN(),                                // AXI PS Slave HP1 ARLEN[3:0], input
    .SAXIHP1ARSIZE(),                               // AXI PS Slave HP1 ARSIZE[2:0], input
    .SAXIHP1ARBURST(),                              // AXI PS Slave HP1 ARBURST[1:0], input
    .SAXIHP1ARQOS(),                                // AXI PS Slave HP1 ARQOS[3:0], input
// AXI PS Slave HP1: Read Data
    .SAXIHP1RDATA(),                                // AXI PS Slave HP1 RDATA[63:0], output
    .SAXIHP1RVALID(),                               // AXI PS Slave HP1 RVALID, output
    .SAXIHP1RREADY(),                               // AXI PS Slave HP1 RREADY, input
    .SAXIHP1RID(),                                  // AXI PS Slave HP1 RID[5:0], output
    .SAXIHP1RLAST(),                                // AXI PS Slave HP1 RLAST, output
    .SAXIHP1RRESP(),                                // AXI PS Slave HP1 RRESP[1:0], output
    .SAXIHP1RCOUNT(),                               // AXI PS Slave HP1 RCOUNT[7:0], output
    .SAXIHP1RACOUNT(),                              // AXI PS Slave HP1 RACOUNT[2:0], output
    .SAXIHP1RDISSUECAP1EN(),                        // AXI PS Slave HP1 RDISSUECAP1EN, input
// AXI PS Slave HP1: Write Address    
    .SAXIHP1AWADDR        (afi1_awaddr),            // AXI PS Slave HP1 AWADDR[31:0], input
    .SAXIHP1AWVALID       (afi1_awvalid),           // AXI PS Slave HP1 AWVALID, input
    .SAXIHP1AWREADY       (afi1_awready),           // AXI PS Slave HP1 AWREADY, output
    .SAXIHP1AWID          (afi1_awid),              // AXI PS Slave HP1 AWID[5:0], input
    .SAXIHP1AWLOCK        (afi1_awlock),            // AXI PS Slave HP1 AWLOCK[1:0], input
    .SAXIHP1AWCACHE       (afi1_awcache),           // AXI PS Slave HP1 AWCACHE[3:0], input
    .SAXIHP1AWPROT        (afi1_awprot),            // AXI PS Slave HP1 AWPROT[2:0], input
    .SAXIHP1AWLEN         (afi1_awlen),             // AXI PS Slave HP1 AWLEN[3:0], input
    .SAXIHP1AWSIZE        (afi1_awsize),            // AXI PS Slave HP1 AWSIZE[1:0], input
    .SAXIHP1AWBURST       (afi1_awburst),           // AXI PS Slave HP1 AWBURST[1:0], input
    .SAXIHP1AWQOS         (afi1_awqos),             // AXI PS Slave HP1 AWQOS[3:0], input
// AXI PS Slave HP1: Write Data
    .SAXIHP1WDATA         (afi1_wdata),             // AXI PS Slave HP1 WDATA[63:0], input
    .SAXIHP1WVALID        (afi1_wvalid),            // AXI PS Slave HP1 WVALID, input
    .SAXIHP1WREADY        (afi1_wready),            // AXI PS Slave HP1 WREADY, output
    .SAXIHP1WID           (afi1_wid),               // AXI PS Slave HP1 WID[5:0], input
    .SAXIHP1WLAST         (afi1_wlast),             // AXI PS Slave HP1 WLAST, input
    .SAXIHP1WSTRB         (afi1_wstrb),             // AXI PS Slave HP1 WSTRB[7:0], input
    .SAXIHP1WCOUNT        (afi1_wcount),            // AXI PS Slave HP1 WCOUNT[7:0], output
    .SAXIHP1WACOUNT       (afi1_wacount),           // AXI PS Slave HP1 WACOUNT[5:0], output
    .SAXIHP1WRISSUECAP1EN (afi1_wrissuecap1en),     // AXI PS Slave HP1 WRISSUECAP1EN, input
// AXI PS Slave HP1: Write response
    .SAXIHP1BVALID        (afi1_bvalid),            // AXI PS Slave HP1 BVALID, output
    .SAXIHP1BREADY        (afi1_bready),            // AXI PS Slave HP1 BREADY, input
    .SAXIHP1BID           (afi1_bid),               // AXI PS Slave HP1 BID[5:0], output
    .SAXIHP1BRESP         (afi1_bresp),             // AXI PS Slave HP1 BRESP[1:0], output

// AXI PS Slave HP2    
// AXI PS Slave HP2: Clock, Reset
// TODO: Clock was not connected (currently this port is not used) - make it depend on parameters
    .SAXIHP2ACLK          (afi1_clk),               // AXI PS Slave HP2 Clock , input ==hclk or 1'b0 if not used
    .SAXIHP2ARESETN       (),                       // AXI PS Slave HP2 Reset, output
// AXI PS Slave HP2: Read Address   - not used
    .SAXIHP2ARADDR        (),                       // AXI PS Slave HP2 ARADDR[31:0], input  
    .SAXIHP2ARVALID       (),                       // AXI PS Slave HP2 ARVALID, input
    .SAXIHP2ARREADY       (),                       // AXI PS Slave HP2 ARREADY, output
    .SAXIHP2ARID          (),                       // AXI PS Slave HP2 ARID[5:0], input
    .SAXIHP2ARLOCK        (),                       // AXI PS Slave HP2 ARLOCK[1:0], input
    .SAXIHP2ARCACHE       (),                       // AXI PS Slave HP2 ARCACHE[3:0], input
    .SAXIHP2ARPROT        (),                       // AXI PS Slave HP2 ARPROT[2:0], input
    .SAXIHP2ARLEN         (),                       // AXI PS Slave HP2 ARLEN[3:0], input
    .SAXIHP2ARSIZE        (),                       // AXI PS Slave HP2 ARSIZE[2:0], input
    .SAXIHP2ARBURST       (),                       // AXI PS Slave HP2 ARBURST[1:0], input
    .SAXIHP2ARQOS         (),                       // AXI PS Slave HP2 ARQOS[3:0], input
// AXI PS Slave HP2: Read Data - not used
    .SAXIHP2RDATA         (),                       // AXI PS Slave HP2 RDATA[63:0], output
    .SAXIHP2RVALID        (),                       // AXI PS Slave HP2 RVALID, output
    .SAXIHP2RREADY        (),                       // AXI PS Slave HP2 RREADY, input
    .SAXIHP2RID           (),                       // AXI PS Slave HP2 RID[5:0], output
    .SAXIHP2RLAST         (),                       // AXI PS Slave HP2 RLAST, output
    .SAXIHP2RRESP         (),                       // AXI PS Slave HP2 RRESP[1:0], output
    .SAXIHP2RCOUNT        (),                       // AXI PS Slave HP2 RCOUNT[7:0], output
    .SAXIHP2RACOUNT       (),                       // AXI PS Slave HP2 RACOUNT[2:0], output
    .SAXIHP2RDISSUECAP1EN (),                       // AXI PS Slave HP2 RDISSUECAP1EN, input
// AXI PS Slave HP2: Write Address    
    .SAXIHP2AWADDR        (afi2_awaddr),            // AXI PS Slave HP2 AWADDR[31:0], input
    .SAXIHP2AWVALID       (afi2_awvalid),           // AXI PS Slave HP2 AWVALID, input
    .SAXIHP2AWREADY       (afi2_awready),           // AXI PS Slave HP2 AWREADY, output
    .SAXIHP2AWID          (afi2_awid),              // AXI PS Slave HP2 AWID[5:0], input
    .SAXIHP2AWLOCK        (afi2_awlock),            // AXI PS Slave HP2 AWLOCK[1:0], input
    .SAXIHP2AWCACHE       (afi2_awcache),           // AXI PS Slave HP2 AWCACHE[3:0], input
    .SAXIHP2AWPROT        (afi2_awprot),            // AXI PS Slave HP2 AWPROT[2:0], input
    .SAXIHP2AWLEN         (afi2_awlen),             // AXI PS Slave HP2 AWLEN[3:0], input
    .SAXIHP2AWSIZE        (afi2_awsize),            // AXI PS Slave HP2 AWSIZE[1:0], input
    .SAXIHP2AWBURST       (afi2_awburst),           // AXI PS Slave HP2 AWBURST[1:0], input
    .SAXIHP2AWQOS         (afi2_awqos),             // AXI PS Slave HP2 AWQOS[3:0], input
// AXI PS Slave HP2: Write Data
    .SAXIHP2WDATA         (afi2_wdata),             // AXI PS Slave HP2 WDATA[63:0], input
    .SAXIHP2WVALID        (afi2_wvalid),            // AXI PS Slave HP2 WVALID, input
    .SAXIHP2WREADY        (afi2_wready),            // AXI PS Slave HP2 WREADY, output
    .SAXIHP2WID           (afi2_wid),               // AXI PS Slave HP2 WID[5:0], input
    .SAXIHP2WLAST         (afi2_wlast),             // AXI PS Slave HP2 WLAST, input
    .SAXIHP2WSTRB         (afi2_wstrb),             // AXI PS Slave HP2 WSTRB[7:0], input
    .SAXIHP2WCOUNT        (afi2_wcount),            // AXI PS Slave HP2 WCOUNT[7:0], output
    .SAXIHP2WACOUNT       (afi2_wacount),           // AXI PS Slave HP2 WACOUNT[5:0], output
    .SAXIHP2WRISSUECAP1EN (afi2_wrissuecap1en),     // AXI PS Slave HP2 WRISSUECAP1EN, input
// AXI PS Slave HP2: Write response
    .SAXIHP2BVALID        (afi2_bvalid),            // AXI PS Slave HP2 BVALID, output
    .SAXIHP2BREADY        (afi2_bready),            // AXI PS Slave HP2 BREADY, input
    .SAXIHP2BID           (afi2_bid),               // AXI PS Slave HP2 BID[5:0], output
    .SAXIHP2BRESP         (afi2_bresp),             // AXI PS Slave HP2 BRESP[1:0], output

// AXI PS Slave HP3    
// AXI PS Slave HP3: Clock, Reset
    .SAXIHP3ACLK            (hclk),                 // AXI PS Slave HP3 Clock , input
    .SAXIHP3ARESETN(),           // AXI PS Slave HP3 Reset, output
// AXI PS Slave HP3: Read Address
    .SAXIHP3ARADDR          (afi3_araddr),          // AXI PS Slave HP3 ARADDR[31:0], input
    .SAXIHP3ARVALID         (afi3_arvalid),         // AXI PS Slave HP3 ARVALID, input
    .SAXIHP3ARREADY         (afi3_arready),         // AXI PS Slave HP3 ARREADY, output
    .SAXIHP3ARID            (afi3_arid),            // AXI PS Slave HP3 ARID[5:0], input
    .SAXIHP3ARLOCK          (afi3_arlock),          // AXI PS Slave HP3 ARLOCK[1:0], input
    .SAXIHP3ARCACHE         (afi3_arcache),         // AXI PS Slave HP3 ARCACHE[3:0], input
    .SAXIHP3ARPROT          (afi3_arprot),          // AXI PS Slave HP3 ARPROT[2:0], input
    .SAXIHP3ARLEN           (afi3_arlen),           // AXI PS Slave HP3 ARLEN[3:0], input
    .SAXIHP3ARSIZE          (afi3_arsize),          // AXI PS Slave HP3 ARSIZE[2:0], input
    .SAXIHP3ARBURST         (afi3_arburst),         // AXI PS Slave HP3 ARBURST[1:0], input
    .SAXIHP3ARQOS           (afi3_arqos),           // AXI PS Slave HP3 ARQOS[3:0], input
// AXI PS Slave HP3: Read Data
    .SAXIHP3RDATA           (afi3_rdata),           // AXI PS Slave HP3 RDATA[63:0], output
    .SAXIHP3RVALID          (afi3_rvalid),          // AXI PS Slave HP3 RVALID, output
    .SAXIHP3RREADY          (afi3_rready),          // AXI PS Slave HP3 RREADY, input
    .SAXIHP3RID             (afi3_rid),             // AXI PS Slave HP3 RID[5:0], output
    .SAXIHP3RLAST           (afi3_rlast),           // AXI PS Slave HP3 RLAST, output
    .SAXIHP3RRESP           (afi3_rresp),           // AXI PS Slave HP3 RRESP[1:0], output
    .SAXIHP3RCOUNT          (afi3_rcount),          // AXI PS Slave HP3 RCOUNT[7:0], output
    .SAXIHP3RACOUNT         (afi3_racount),         // AXI PS Slave HP3 RACOUNT[2:0], output
    .SAXIHP3RDISSUECAP1EN   (afi3_rdissuecap1en),   // AXI PS Slave HP3 RDISSUECAP1EN, input
// AXI PS Slave HP3: Write Address
    .SAXIHP3AWADDR          (afi3_awaddr),          // AXI PS Slave HP3 AWADDR[31:0], input
    .SAXIHP3AWVALID         (afi3_awvalid),         // AXI PS Slave HP3 AWVALID, input
    .SAXIHP3AWREADY         (afi3_awready),         // AXI PS Slave HP3 AWREADY, output
    .SAXIHP3AWID            (afi3_awid),            // AXI PS Slave HP3 AWID[5:0], input
    .SAXIHP3AWLOCK          (afi3_awlock),          // AXI PS Slave HP3 AWLOCK[1:0], input
    .SAXIHP3AWCACHE         (afi3_awcache),         // AXI PS Slave HP3 AWCACHE[3:0], input
    .SAXIHP3AWPROT          (afi3_awprot),          // AXI PS Slave HP3 AWPROT[2:0], input
    .SAXIHP3AWLEN           (afi3_awlen),           // AXI PS Slave HP3 AWLEN[3:0], input
    .SAXIHP3AWSIZE          (afi3_awsize),          // AXI PS Slave HP3 AWSIZE[1:0], input
    .SAXIHP3AWBURST         (afi3_awburst),         // AXI PS Slave HP3 AWBURST[1:0], input
    .SAXIHP3AWQOS           (afi3_awqos),           // AXI PS Slave HP3 AWQOS[3:0], input
// AXI PS Slave HP3: Write Data
    .SAXIHP3WDATA           (afi3_wdata),           // AXI PS Slave HP3 WDATA[63:0], input
    .SAXIHP3WVALID          (afi3_wvalid),          // AXI PS Slave HP3 WVALID, input
    .SAXIHP3WREADY          (afi3_wready),          // AXI PS Slave HP3 WREADY, output
    .SAXIHP3WID             (afi3_wid),             // AXI PS Slave HP3 WID[5:0], input
    .SAXIHP3WLAST           (afi3_wlast),           // AXI PS Slave HP3 WLAST, input
    .SAXIHP3WSTRB           (afi3_wstrb),           // AXI PS Slave HP3 WSTRB[7:0], input
    .SAXIHP3WCOUNT          (afi3_wcount),          // AXI PS Slave HP3 WCOUNT[7:0], output
    .SAXIHP3WACOUNT         (afi3_wacount),         // AXI PS Slave HP3 WACOUNT[5:0], output
    .SAXIHP3WRISSUECAP1EN   (afi3_wrissuecap1en),   // AXI PS Slave HP3 WRISSUECAP1EN, input
// AXI PS Slave HP3: Write response
    .SAXIHP3BVALID          (afi3_bvalid),          // AXI PS Slave HP3 BVALID, output
    .SAXIHP3BREADY          (afi3_bready),          // AXI PS Slave HP3 BREADY, input
    .SAXIHP3BID             (afi3_bid),             // AXI PS Slave HP3 BID[5:0], output
    .SAXIHP3BRESP           (afi3_bresp),           // AXI PS Slave HP3 BRESP[1:0], output

// AXI PS Slave ACP    
// AXI PS Slave ACP: Clock, Reset
    .SAXIACPACLK(),              // AXI PS Slave ACP Clock, input
    .SAXIACPARESETN(),           // AXI PS Slave ACP Reset, output
// AXI PS Slave ACP: Read Address    
    .SAXIACPARADDR(),            // AXI PS Slave ACP ARADDR[31:0], input  
    .SAXIACPARVALID(),           // AXI PS Slave ACP ARVALID, input
    .SAXIACPARREADY(),           // AXI PS Slave ACP ARREADY, output
    .SAXIACPARID(),              // AXI PS Slave ACP ARID[2:0], input
    .SAXIACPARLOCK(),            // AXI PS Slave ACP ARLOCK[1:0], input
    .SAXIACPARCACHE(),           // AXI PS Slave ACP ARCACHE[3:0], input
    .SAXIACPARPROT(),            // AXI PS Slave ACP ARPROT[2:0], input
    .SAXIACPARLEN(),             // AXI PS Slave ACP ARLEN[3:0], input
    .SAXIACPARSIZE(),            // AXI PS Slave ACP ARSIZE[2:0], input
    .SAXIACPARBURST(),           // AXI PS Slave ACP ARBURST[1:0], input
    .SAXIACPARQOS(),             // AXI PS Slave ACP ARQOS[3:0], input
    .SAXIACPARUSER(),            // AXI PS Slave ACP ARUSER[4:0], input
// AXI PS Slave ACP: Read Data
    .SAXIACPRDATA(),             // AXI PS Slave ACP RDATA[63:0], output
    .SAXIACPRVALID(),            // AXI PS Slave ACP RVALID, output
    .SAXIACPRREADY(),            // AXI PS Slave ACP RREADY, input
    .SAXIACPRID(),               // AXI PS Slave ACP RID[2:0], output
    .SAXIACPRLAST(),             // AXI PS Slave ACP RLAST, output
    .SAXIACPRRESP(),             // AXI PS Slave ACP RRESP[1:0], output
// AXI PS Slave ACP: Write Address    
    .SAXIACPAWADDR(),            // AXI PS Slave ACP AWADDR[31:0], input
    .SAXIACPAWVALID(),           // AXI PS Slave ACP AWVALID, input
    .SAXIACPAWREADY(),           // AXI PS Slave ACP AWREADY, output
    .SAXIACPAWID(),              // AXI PS Slave ACP AWID[2:0], input
    .SAXIACPAWLOCK(),            // AXI PS Slave ACP AWLOCK[1:0], input
    .SAXIACPAWCACHE(),           // AXI PS Slave ACP AWCACHE[3:0], input
    .SAXIACPAWPROT(),            // AXI PS Slave ACP AWPROT[2:0], input
    .SAXIACPAWLEN(),             // AXI PS Slave ACP AWLEN[3:0], input
    .SAXIACPAWSIZE(),            // AXI PS Slave ACP AWSIZE[1:0], input
    .SAXIACPAWBURST(),           // AXI PS Slave ACP AWBURST[1:0], input
    .SAXIACPAWQOS(),             // AXI PS Slave ACP AWQOS[3:0], input
    .SAXIACPAWUSER(),            // AXI PS Slave ACP AWUSER[4:0], input
    
// AXI PS Slave ACP: Write Data
    .SAXIACPWDATA(),             // AXI PS Slave ACP WDATA[63:0], input
    .SAXIACPWVALID(),            // AXI PS Slave ACP WVALID, input
    .SAXIACPWREADY(),            // AXI PS Slave ACP WREADY, output
    .SAXIACPWID(),               // AXI PS Slave ACP WID[2:0], input
    .SAXIACPWLAST(),             // AXI PS Slave ACP WLAST, input
    .SAXIACPWSTRB(),             // AXI PS Slave ACP WSTRB[7:0], input
// AXI PS Slave ACP: Write response
    .SAXIACPBVALID(),            // AXI PS Slave ACP BVALID, output
    .SAXIACPBREADY(),            // AXI PS Slave ACP BREADY, input
    .SAXIACPBID(),               // AXI PS Slave ACP BID[2:0], output
    .SAXIACPBRESP(),             // AXI PS Slave ACP BRESP[1:0], output
// Direct connection to PS package pads
    .DDRA(),                     // PS DDRA[14:0], inout
    .DDRBA(),                    // PS DDRBA[2:0], inout
    .DDRCASB(),                  // PS DDRCASB, inout
    .DDRCKE(),                   // PS DDRCKE, inout
    .DDRCKP(),                   // PS DDRCKP, inout
    .DDRCKN(),                   // PS DDRCKN, inout
    .DDRCSB(),                   // PS DDRCSB, inout
    .DDRDM(),                    // PS DDRDM[3:0], inout
    .DDRDQ(),                    // PS DDRDQ[31:0], inout
    .DDRDQSP(),                  // PS DDRDQSP[3:0], inout
    .DDRDQSN(),                  // PS DDRDQSN[3:0], inout
    .DDRDRSTB(),                 // PS DDRDRSTB, inout
    .DDRODT(),                   // PS DDRODT, inout
    .DDRRASB(),                  // PS DDRRASB, inout
    .DDRVRN(),                   // PS DDRVRN, inout
    .DDRVRP(),                   // PS DDRVRP, inout
    .DDRWEB(),                   // PS DDRWEB, inout
    .MIO(),                      // PS MIO[53:0], inout // clg225 has less
    .PSCLK(),                    // PS PSCLK, inout
    .PSPORB(),                   // PS PSPORB, inout
    .PSSRSTB()                  // PS PSSRSTB, inout
  );
  
`ifdef DEBUG_SAXI1
/* */
    debug_saxigp #(
        .DEBUG_STATUS              ('h714),
        .DEBUG_STATUS_MASK         ('h7ff),
        .DEBUG_STATUS_REG_ADDR     ('he5),// 1 dword
        .DEBUG_STATUS_PAYLOAD_ADDR ('he0) // 5 dwords
    ) debug_saxigp_i (
        .mclk                      (mclk),       // input
        .mrst                      (mrst),       // input
        .cmd_ad       (cmd_debug_saxi1_ad),      // input[7:0] 
        .cmd_stb      (cmd_debug_saxi1_stb),     // input
        .status_ad    (status_debug_saxi_ad),    // output[7:0] 
        .status_rq    (status_debug_saxi_rq),    // output
        .status_start (status_debug_saxi_start), // input
        .saxi_aclk    (hclk), // saxi1_aclk),              // input
        .saxi_awaddr  (32'b0), // saxi1_awaddr),            // input[31:0] 
        .saxi_awvalid (1'b0), // saxi1_awvalid),           // input
        .saxi_awready (1'b0), // saxi1_awready),           // input
        .saxi_awid    (6'b0), // saxi1_awid),              // input[5:0] 
        .saxi_awlock  (2'b0), // saxi1_awlock),            // input[1:0] 
        .saxi_awcache (4'b0), // saxi1_awcache),           // input[3:0] 
        .saxi_awprot  (3'b0), // saxi1_awprot),            // input[2:0] 
        .saxi_awlen   (4'b0), // saxi1_awlen),             // input[3:0] 
        .saxi_awsize  (2'b0), // saxi1_awsize),            // input[1:0] 
        .saxi_awburst (2'b0), // saxi1_awburst),           // input[1:0] 
        .saxi_awqos   (4'b0), // saxi1_awqos),             // input[3:0] 
        .saxi_wdata   (32'b0), // saxi1_wdata),             // input[31:0] 
        .saxi_wvalid  (1'b0), // saxi1_wvalid),            // input
        .saxi_wready  (1'b0), // saxi1_wready),            // input
        .saxi_wid     (6'b0), // saxi1_wid),               // input[5:0] 
        .saxi_wlast   (1'b0), // saxi1_wlast),             // input
        .saxi_wstrb   (4'b0), // saxi1_wstrb),             // input[3:0] 
        .saxi_bvalid  (1'b0), // saxi1_bvalid),            // input
        .saxi_bready  (1'b0), // saxi1_bready),            // input
        .saxi_bid     (6'b0), // saxi1_bid),               // input[5:0] 
        .saxi_bresp   (2'b0)  // saxi1_bresp)              // input[1:0] 
    );
/**/ /*
    debug_saxigp #(
        .DEBUG_STATUS              ('h714),
        .DEBUG_STATUS_MASK         ('h7ff),
        .DEBUG_STATUS_REG_ADDR     ('he5),// 1 dword
        .DEBUG_STATUS_PAYLOAD_ADDR ('he0) // 5 dwords
    ) debug_saxigp_i (
        .mclk                      (mclk),       // input
        .mrst                      (mrst),       // input
        .cmd_ad       (cmd_debug_saxi1_ad),      // input[7:0] 
        .cmd_stb      (cmd_debug_saxi1_stb),     // input
        .status_ad    (status_debug_saxi_ad),    // output[7:0] 
        .status_rq    (status_debug_saxi_rq),    // output
        .status_start (status_debug_saxi_start), // input
        .saxi_aclk    (saxi1_aclk), // hclk), // saxi1_aclk),              // input
        .saxi_awaddr  (saxi1_awaddr),            // input[31:0] 
        .saxi_awvalid (saxi1_awvalid),           // input
        .saxi_awready (saxi1_awready),           // input
        .saxi_awid    (saxi1_awid),              // input[5:0] 
        .saxi_awlock  (saxi1_awlock),            // input[1:0] 
        .saxi_awcache (saxi1_awcache),           // input[3:0] 
        .saxi_awprot  (saxi1_awprot),            // input[2:0] 
        .saxi_awlen   (saxi1_awlen),             // input[3:0] 
        .saxi_awsize  (saxi1_awsize),            // input[1:0] 
        .saxi_awburst (saxi1_awburst),           // input[1:0] 
        .saxi_awqos   (saxi1_awqos),             // input[3:0] 
        .saxi_wdata   (saxi1_wdata),             // input[31:0] 
        .saxi_wvalid  (saxi1_wvalid),            // input
        .saxi_wready  (saxi1_wready),            // input
        .saxi_wid     (saxi1_wid),               // input[5:0] 
        .saxi_wlast   (saxi1_wlast),             // input
        .saxi_wstrb   (saxi1_wstrb),             // input[3:0] 
        .saxi_bvalid  (saxi1_bvalid),            // input
        .saxi_bready  (saxi1_bready),            // input
        .saxi_bid     (saxi1_bid),               // input[5:0] 
        .saxi_bresp   (saxi1_bresp)              // input[1:0] 
    ); */
`endif        
  
  
  
endmodule
