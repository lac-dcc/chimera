/*******************************************************************************
 * Module: ddrc_control
 * Date:2014-05-19  
 * Author: Andrey Filippov
 * Description: Temporary module with DDRC control / command registers
 *
 * Copyright (c) 2014 Elphel, Inc.
 * ddrc_control.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ddrc_control.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  ddrc_control #(
    parameter AXI_WR_ADDR_BITS=    12,
    parameter CONTROL_ADDR =        'h1000, // AXI write address of control write registers
    parameter CONTROL_ADDR_MASK =   'h1400, // AXI write address of control registers
    parameter BUSY_WR_ADDR =        'h1800, // AXI write address to generate busy
    parameter BUSY_WR_ADDR_MASK =   'h1c00, // AXI write address mask to generate busy

    parameter DLY_LD_REL =            'h080,  // address to generate delay load
    parameter DLY_LD_REL_MASK =       'h380,  // address mask to generate delay load
    parameter DLY_SET_REL =           'h070,  // address to generate delay set
    parameter DLY_SET_REL_MASK =      'h3ff,  // address mask to generate delay set
    parameter RUN_CHN_REL =           'h000,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter RUN_CHN_REL_MASK =      'h3f0,  // address mask to generate sequencer channel/run
    parameter PATTERNS_REL =          'h020,  // address to set DQM and DQS patterns (16'h0055)
    parameter PATTERNS_REL_MASK =     'h3ff,  // address mask to set DQM and DQS patterns
    parameter PATTERNS_TRI_REL =      'h021,  // address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each
    parameter PATTERNS_TRI_REL_MASK = 'h3ff,  // address mask to set DQM and DQS tristate patterns
    parameter WBUF_DELAY_REL =        'h022,  // extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
    parameter WBUF_DELAY_REL_MASK =   'h3ff,  // address mask to set extra delay
    parameter PAGES_REL =             'h023,  // address to set buffer pages {port1_page[1:0],port1_int_page[1:0],port0_page[1:0],port0_int_page[1:0]}
    parameter PAGES_REL_MASK =        'h3ff,  // address mask to set DQM and DQS patterns
    parameter CMDA_EN_REL =           'h024,  // address to enable('h825)/disable('h824) command/address outputs  
    parameter CMDA_EN_REL_MASK =      'h3fe,  // address mask for command/address outputs
    parameter SDRST_ACT_REL =         'h026,  // address to activate('h827)/deactivate('h826) active-low reset signal to DDR3 memory  
    parameter SDRST_ACT_REL_MASK =    'h3fe,  // address mask for reset DDR3
    parameter CKE_EN_REL =            'h028,  // address to enable('h829)/disable('h828) CKE signal to memory   
    parameter CKE_EN_REL_MASK =       'h3fe,  // address mask for command/address outputs
    parameter DCI_RST_REL =           'h02a,  // address to activate('h82b)/deactivate('h82a) Zynq DCI calibrate circuitry  
    parameter DCI_RST_REL_MASK =      'h3fe,  // address mask for DCI calibrate circuitry
    parameter DLY_RST_REL =           'h02c,  // address to activate('h82d)/deactivate('h82c) delay calibration circuitry  
    parameter DLY_RST_REL_MASK =      'h3fe,  // address mask for delay calibration circuitry
    parameter EXTRA_REL =             'h02e,  // address to set extra parameters (currently just inv_clk_div)
    parameter EXTRA_REL_MASK =        'h3ff,  // address mask for extra parameters
    parameter REFRESH_EN_REL =        'h030,  // address to enable('h31) and disable ('h30) DDR refresh
    parameter REFRESH_EN_REL_MASK =   'h3fe,  // address mask to enable/disable DDR refresh
    parameter REFRESH_PER_REL =       'h032,  // address to set refresh period in 32 x tCK
    parameter REFRESH_PER_REL_MASK =  'h3ff,  // address mask set refresh period
    parameter REFRESH_ADDR_REL =      'h033,  // address to set sequencer start address for DDR refresh
    parameter REFRESH_ADDR_REL_MASK = 'h3ff   // address mask set refresh sequencer address
)(
    input                         clk,
    input                         mclk,
    input                         rst,
    input  [AXI_WR_ADDR_BITS-1:0] pre_waddr,     // AXI write address, before actual writes (to generate busy), valid@start_burst
    input                         start_wburst, // burst start - should generate ~ready (should be AND-ed with !busy internally) 
    input  [AXI_WR_ADDR_BITS-1:0] waddr,        // write address, valid with wr_en
    input                         wr_en,        // write enable 
    input                  [31:0] wdata,        // write data, valid with waddr and wr_en
    output                        busy,         // interface busy (combinatorial delay from start_wburst and pre_addr
// control signals
// control: sequencer run    
    output                 [10:0] run_addr, // Start address of the physical sequencer (MSB = 0 - "manual", 1 -"auto")
    output                 [ 3:0] run_chn,  // channel number to use for I/O buffers
    output                        run_seq,  // single mclk pulse to start sequencer
// simple arbitration (should not start if higher priority, busy or run_seq)
    input                         run_seq_rq_in, // higher priority request to run sequence
    output                        run_seq_rq_gen,// this wants to run sequencer
    input                         run_seq_busy,  // sequencer is busy or access granted to other master (should be on staring nearest cycle)
    output                 [10:0] refresh_address,
    output                 [ 7:0] refresh_period,
    output                        refresh_set,
    output                        refresh_en,                   
    
//    output                        run_seq_granted, // this module got sequencer access granted
    
//    input                        run_done; // output - will go through other channel - sequencer done (add busy?)
// control: delays and mmcm setup    
    output                 [ 7:0] dly_data, // 8-bit IDELAY/ODELAY (fine) and MMCM phase shift
    output                 [ 6:0] dly_addr, // address to select delay register
    output                        ld_delay, // write dly_data to dly_address, one mclk active pulse
    output                        dly_set,      // transfer (activate) all delays simultaneosly, 1 mclk pulse 
// control: additional signals
    output                        cmda_en,  // tri-state all command and address lines to DDR chip
    output                        ddr_rst,  // generate DDR3 memory reset signal
    output                        dci_rst,  // active high - reset DCI circuitry
    output                        dly_rst,  // active high - delay calibration circuitry
    output                        ddr_cke,  // control DDR3 memory CKE signal
    
    output                        inv_clk_div, // invert clk_div to ISERDES
    output                 [ 7:0] dqs_pattern, // DQS pattern during write (normally 8'h55)
    output                 [ 7:0] dqm_pattern, // DQM pattern (just for testing, should be 8'h0)
    output                 [ 3:0] dq_tri_on_pattern,
    output                 [ 3:0] dq_tri_off_pattern,
    output                 [ 3:0] dqs_tri_on_pattern,
    output                 [ 3:0] dqs_tri_off_pattern,
    output                 [ 3:0] wbuf_delay,
// control: buffers pages
    output                 [ 1:0] port0_page,     // port 0 buffer read page (to be controlled by arbiter later, set to 2'b0)
    output                 [ 1:0] port0_int_page, // port 0 PHY-side write to buffer page (to be controlled by arbiter later, set to 2'b0)
    output                 [ 1:0] port1_page,     // port 1 buffer write page (to be controlled by arbiter later, set to 2'b0)
    output                 [ 1:0] port1_int_page  // port 1 PHY-side buffer read page (to be controlled by arbiter later, set to 2'b0) 

);
    localparam DQSTRI_FIRST=    4'h3; // DQS tri-state control word, first when enabling output 
    localparam DQSTRI_LAST=     4'hc; // DQS tri-state control word, first after disabling output
    localparam DQTRI_FIRST=     4'h7; // DQ tri-state control word, first when enabling output 
    localparam DQTRI_LAST=      4'he; // DQ tri-state control word, first after disabling output
    localparam WBUF_DLY_DFLT=   4'h6; // extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)


    localparam DLY_LD_ADDR =        CONTROL_ADDR |      DLY_LD_REL;       // address to generate delay load
    localparam DLY_LD_ADDR_MASK =   CONTROL_ADDR_MASK | DLY_LD_REL_MASK;  // address mask to generate delay load
    localparam DLY_SET_ADDR =       CONTROL_ADDR |      DLY_SET_REL;      // address to generate delay set
    localparam DLY_SET_ADDR_MASK =  CONTROL_ADDR_MASK | DLY_SET_REL_MASK; // address mask to generate delay set
    localparam RUN_CHN_ADDR =       CONTROL_ADDR |      RUN_CHN_REL;      // address to set sequnecer channel and  run (4 LSB-s - channel)
    localparam RUN_CHN_ADDR_MASK =  CONTROL_ADDR_MASK | RUN_CHN_REL_MASK; // address mask to generate sequencer channel/run
    localparam PATTERNS_ADDR =      CONTROL_ADDR |      PATTERNS_REL;     // address to set DQM and DQS patterns (16'h0055)
    localparam PATTERNS_ADDR_MASK = CONTROL_ADDR_MASK | PATTERNS_REL_MASK;// address mask to set DQM and DQS patterns
    
    localparam PATTERNS_TRI_ADDR =      CONTROL_ADDR |      PATTERNS_TRI_REL;     //address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each
    localparam PATTERNS_TRI_ADDR_MASK = CONTROL_ADDR_MASK | PATTERNS_TRI_REL_MASK;// address mask to set DQM and DQS tristate patterns
    localparam WBUF_DELAY_ADDR =        CONTROL_ADDR |      WBUF_DELAY_REL;        // extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
    localparam WBUF_DELAY_ADDR_MASK =   CONTROL_ADDR_MASK | WBUF_DELAY_REL_MASK;   // address mask to set extra delay
    
    localparam PAGES_ADDR =         CONTROL_ADDR |      PAGES_REL;        // address to set buffer pages {port1_page[1:0],port1_int_page[1:0],port0_page[1:0],port0_int_page[1:0]}
    localparam PAGES_ADDR_MASK =    CONTROL_ADDR_MASK | PAGES_REL_MASK;   // address mask to set DQM and DQS patterns
    localparam CMDA_EN_ADDR =       CONTROL_ADDR |      CMDA_EN_REL;      // address to enable('h823)/disable('h822) command/address outputs  
    localparam CMDA_EN_ADDR_MASK =  CONTROL_ADDR_MASK | CMDA_EN_REL_MASK; // address mask for command/address outputs

    localparam SDRST_ACT_ADDR =     CONTROL_ADDR |      SDRST_ACT_REL;      // address to activate('h825)/deactivate('h8242) active-low reset signal to DDR3 memory    
    localparam SDRST_ACT_ADDR_MASK =CONTROL_ADDR_MASK | SDRST_ACT_REL_MASK; // address mask for reset DDR3
    
    localparam DCI_RST_ADDR =       CONTROL_ADDR |      DCI_RST_REL;      // address to activate/deactivate Zynq DCI calibrate circuitry    
    localparam DCI_RST_ADDR_MASK =  CONTROL_ADDR_MASK | DCI_RST_REL_MASK; // address mask for DCI calibrate circuitry
    localparam DLY_RST_ADDR =       CONTROL_ADDR |      DLY_RST_REL;      // address to activate/deactivate delay calibration circuitry    
    localparam DLY_RST_ADDR_MASK =  CONTROL_ADDR_MASK | DLY_RST_REL_MASK; // address mask for delay calibration circuitry
    
    
    localparam CKE_EN_ADDR =        CONTROL_ADDR |      CKE_EN_REL;       // address to enable('h827)/disable('h826) CKE signal to memory  
    localparam CKE_EN_ADDR_MASK =   CONTROL_ADDR_MASK | CKE_EN_REL_MASK;  // address mask for CKE

    localparam EXTRA_ADDR =         CONTROL_ADDR |      EXTRA_REL;        // address to set extra parameters (currently just inv_clk_div)
    localparam EXTRA_ADDR_MASK =    CONTROL_ADDR_MASK | EXTRA_REL_MASK;   // address mask for extra parameters

    localparam REFRESH_EN_ADDR =      CONTROL_ADDR |      REFRESH_EN_REL;        // address to enable('h31) and disable ('h30) DDR refresh
    localparam REFRESH_EN_ADDR_MASK = CONTROL_ADDR_MASK | REFRESH_EN_REL_MASK;   // address mask to enable/disable DDR refresh

    localparam REFRESH_PER_ADDR =      CONTROL_ADDR |      REFRESH_PER_REL;        // address to set refresh period in 32 x tCK
    localparam REFRESH_PER_ADDR_MASK = CONTROL_ADDR_MASK | REFRESH_PER_REL_MASK;   // address mask set refresh period

    localparam REFRESH_ADDR_ADDR =      CONTROL_ADDR |      REFRESH_ADDR_REL;        // address to set sequencer start address for DDR refresh
    localparam REFRESH_ADDR_ADDR_MASK = CONTROL_ADDR_MASK | REFRESH_ADDR_REL_MASK;   // address mask set refresh sequencer address

    reg                 [10:0] refresh_address_r;
    reg                 [ 7:0] refresh_period_r;
    reg                        refresh_set_r, refresh_set_r0;                   
    reg                        refresh_ld_addr;                   
    reg                        refresh_en_r;                   
    wire                       refresh_set_w; // just decoded                    

    assign refresh_address = refresh_address_r;
    assign refresh_period =  refresh_period_r;
    assign refresh_set =     refresh_set_r;
    assign refresh_en =      refresh_en_r;

    reg busy_r=0;
    reg selected=0;
    reg selected_busy=0;

    wire fifo_half_empty; // just debugging with (* keep = "true" *)
    wire [AXI_WR_ADDR_BITS-1:0] waddr_fifo_out;
    wire                 [31:0] wdata_fifo_out;
//    reg                         fifo_re; // wrong, need to have (fifo!=1) || !re 
    wire                        fifo_nempty;
    wire                        fifo_re;
    reg  [AXI_WR_ADDR_BITS-1:0] waddr_fifo_out_r;
    reg                  [31:0] wdata_fifo_out_r;
    reg                         dly_ld_r=0;
    reg                         dly_set_r=0;
    reg                         run_seq_r=0;
    reg                  [ 7:0] dqs_pattern_r;    // DQS pattern during write (normally 8'h55)
    reg                  [ 7:0] dqm_pattern_r;    // DQM pattern (just for testing, should be 8'h0)
    reg                  [ 1:0] port0_page_r;     // port 0 buffer read page (to be controlled by arbiter later, set to 2'b0)
    reg                  [ 1:0] port0_int_page_r; // port 0 PHY-side write to buffer page (to be controlled by arbiter later, set to 2'b0)
    reg                  [ 1:0] port1_page_r;     // port 1 buffer write page (to be controlled by arbiter later, set to 2'b0)
    reg                  [ 1:0] port1_int_page_r; // port 1 PHY-side buffer read page (to be controlled by arbiter later, set to 2'b0) 
    reg                         cmda_en_r;        // enable (tri-state off) all command and address lines to DDR chip
    reg                         ddr_rst_r;        // generate DDR3 memory reset
    reg                         dci_rst_r;  // active high - reset DCI circuitry
    reg                         dly_rst_r;  // active high - reset delay calibration circuitry
    reg                         ddr_cke_r;         // enable CKE to memory

    reg                         inv_clk_div_r;    // invert clk_div to ISERDES
    
    reg                  [15:0] dqs_tri_pattern_r;
    reg                  [ 3:0] wbuf_delay_r;
    
    wire                        decoded_run_seq;
    
    assign refresh_set_w= fifo_re && (((waddr_fifo_out ^ REFRESH_PER_ADDR) & REFRESH_PER_ADDR_MASK)==0);
//    reg                         this_granted;
//    assign run_seq_granted=this_granted;
    assign decoded_run_seq= (((waddr_fifo_out ^ RUN_CHN_ADDR) & RUN_CHN_ADDR_MASK)==0) && !ddr_rst; // without ddr_rst 'bx
    assign run_seq_rq_gen=decoded_run_seq  && fifo_nempty ; // 
//    assign                      fifo_re=fifo_nempty; // try simpler
// need a way to reset if run_seq_busy is forever busy? Will it work to just repeat the same command w/o busy to overrun fifo?
// ddr_rst_r should reset seqencer?

// watch higher priority and busy for run_seq command, always ready - for others
    assign                      fifo_re= fifo_nempty  && (decoded_run_seq? (!run_seq_rq_in && !run_seq_busy && !run_seq_r): 1'b1);
    
    assign wbuf_delay= wbuf_delay_r;
    assign {
        dqs_tri_off_pattern[3:0],
        dqs_tri_on_pattern[3:0],
        dq_tri_off_pattern[3:0],
        dq_tri_on_pattern[3:0]
    } = dqs_tri_pattern_r;

    assign ld_delay = dly_ld_r;
    assign dly_set =  dly_set_r;
    assign dly_data = wdata_fifo_out_r[ 7:0]; // IgnoreThisWarning  VivadoSynthesis WARNING: [Synth 8-3936] Found unconnected internal register 'wdata_fifo_out_r_reg' and it is trimmed from '32' to '11' bits. [ddrc_control.v:100]
    assign dly_addr = waddr_fifo_out_r[ 6:0]; // IgnoreThisWarning  VivadoSynthesis WARNING: [Synth 8-3936] Found unconnected internal register 'waddr_fifo_out_r_reg' and it is trimmed from '12' to '7' bits. [ddrc_control.v:101]
    assign run_addr = wdata_fifo_out_r[10:0];
    assign run_chn =  waddr_fifo_out_r[3:0];
    assign run_seq =  run_seq_r && !ddr_rst;

    assign busy=busy_r && (start_wburst?(((pre_waddr ^ BUSY_WR_ADDR) & BUSY_WR_ADDR_MASK)==0): selected_busy);

    assign dqs_pattern =    dqs_pattern_r[7:0];
    assign dqm_pattern =    dqm_pattern_r[7:0];
    assign port0_page =     port0_page_r[1:0];
    assign port0_int_page = port0_int_page_r[1:0];
    assign port1_page =     port1_page_r[1:0];
    assign port1_int_page = port1_int_page_r[1:0];
    assign cmda_en =        cmda_en_r;
    assign ddr_rst =        ddr_rst_r;
    assign dci_rst =        dci_rst_r;
    assign dly_rst =        dly_rst_r;
    
    assign ddr_cke=         ddr_cke_r;
    assign inv_clk_div =    inv_clk_div_r;

    always @ (posedge clk or posedge rst) begin
        if (rst)               selected <= 1'b0;
        else if (start_wburst) selected <= ((pre_waddr ^ CONTROL_ADDR) & CONTROL_ADDR_MASK)==0;
        if (rst)               selected_busy <= 1'b0;
        else if (start_wburst) selected_busy <= ((pre_waddr ^ BUSY_WR_ADDR) & BUSY_WR_ADDR_MASK)==0;
        if (rst)               busy_r <= 1'b0;
//        else if (start_wburst) busy_r <= !fifo_half_empty;
        else                   busy_r <= !fifo_half_empty;
        
    end

    /* FIFO to cross clock boundary */
    fifo_cross_clocks #(
        .DATA_WIDTH  (AXI_WR_ADDR_BITS+32),
        .DATA_DEPTH  (4)
    ) fifo_cross_clocks_i (
        .rst         (rst), // input
        .rclk        (mclk), // input
        .wclk        (clk), // input
        .we          (wr_en && selected), // input
        .re          (fifo_re), // input
        .data_in     ({waddr[AXI_WR_ADDR_BITS-1:0],wdata[31:0]}), // input[15:0] 
        .data_out    ({waddr_fifo_out[AXI_WR_ADDR_BITS-1:0],wdata_fifo_out[31:0]}), // output[15:0] 
        .nempty      (fifo_nempty), // output
        .half_empty  (fifo_half_empty) // output
    );
    always @ (posedge rst or posedge mclk) begin
  //      if (rst) fifo_re <= 1'b0;
  //      else     fifo_re <= fifo_nempty;
        if (rst) dly_ld_r <= 1'b0;
        else     dly_ld_r <= fifo_re && (((waddr_fifo_out ^ DLY_LD_ADDR) & DLY_LD_ADDR_MASK)==0);
        if (rst) dly_set_r <= 1'b0;
        else     dly_set_r <= fifo_re && (((waddr_fifo_out ^ DLY_SET_ADDR) & DLY_SET_ADDR_MASK)==0);
        if (rst) run_seq_r <= 1'b0;
//        else     run_seq_r <= fifo_re && (((waddr_fifo_out ^ RUN_CHN_ADDR) & RUN_CHN_ADDR_MASK)==0);
        else     run_seq_r <=  fifo_nempty  && decoded_run_seq && !run_seq_rq_in && !run_seq_busy && !run_seq_r;

        if (rst) {dqm_pattern_r,dqs_pattern_r} <= 16'h0055;
        else if (fifo_re && (((waddr_fifo_out ^ PATTERNS_ADDR) & PATTERNS_ADDR_MASK)==0))
                 {dqm_pattern_r,dqs_pattern_r} <= wdata_fifo_out[15:0];

        if (rst) {port1_page_r[1:0],port1_int_page_r[1:0],port0_page_r[1:0],port0_int_page_r[1:0]} <= 8'h00;
        else if (fifo_re && (((waddr_fifo_out ^ PAGES_ADDR) & PAGES_ADDR_MASK)==0))
                 {port1_page_r[1:0],port1_int_page_r[1:0],port0_page_r[1:0],port0_int_page_r[1:0]} <= wdata_fifo_out[7:0];
        
        if (rst) cmda_en_r <= 1'b0;
        else if (fifo_re && (((waddr_fifo_out ^ CMDA_EN_ADDR) & CMDA_EN_ADDR_MASK)==0))
                 cmda_en_r <= waddr_fifo_out[0];

        if (rst) ddr_rst_r <= 1'b1; // enable DDR3 reset at system reset
        else if (fifo_re && (((waddr_fifo_out ^ SDRST_ACT_ADDR) & SDRST_ACT_ADDR_MASK)==0))
                 ddr_rst_r <= waddr_fifo_out[0];

        if (rst) dci_rst_r <= 1'b0; // reset DCI circuitry off (it is ORed with rst later)
        else if (fifo_re && (((waddr_fifo_out ^ DCI_RST_ADDR) & DCI_RST_ADDR_MASK)==0))
                 dci_rst_r <= waddr_fifo_out[0];

        if (rst) dly_rst_r <= 1'b0; // reset DCI circuitry off (it is ORed with rst later)
        else if (fifo_re && (((waddr_fifo_out ^ DLY_RST_ADDR) & DLY_RST_ADDR_MASK)==0))
                 dly_rst_r <= waddr_fifo_out[0];



        if (rst) ddr_cke_r <= 1'b0;
        else if (fifo_re && (((waddr_fifo_out ^ CKE_EN_ADDR) & CKE_EN_ADDR_MASK)==0))
                 ddr_cke_r <= waddr_fifo_out[0];

        if (rst) inv_clk_div_r <= 1'b0;
        else if (fifo_re && (((waddr_fifo_out ^ EXTRA_ADDR) & EXTRA_ADDR_MASK)==0))
                 inv_clk_div_r <= wdata_fifo_out[0];
                 
        if (rst) dqs_tri_pattern_r <= {DQSTRI_LAST,DQSTRI_FIRST,DQTRI_LAST,DQTRI_FIRST};
        else if (fifo_re && (((waddr_fifo_out ^ PATTERNS_TRI_ADDR) & PATTERNS_TRI_ADDR_MASK)==0))
                 dqs_tri_pattern_r <= wdata_fifo_out[15:0];

        if (rst) wbuf_delay_r <= WBUF_DLY_DFLT;
        else if (fifo_re && (((waddr_fifo_out ^ WBUF_DELAY_ADDR) & WBUF_DELAY_ADDR_MASK)==0))
                 wbuf_delay_r <= wdata_fifo_out[3:0];
                 
        if (rst) refresh_en_r <= 1'b0;
        else if (fifo_re && (((waddr_fifo_out ^ REFRESH_EN_ADDR) & REFRESH_EN_ADDR_MASK)==0))
                 refresh_en_r <= waddr_fifo_out[0];

        if (rst) refresh_address_r <= 0;
        else if (refresh_ld_addr) refresh_address_r <= wdata_fifo_out_r[10:0];

        if (rst) refresh_period_r <= 0;
        else if (refresh_set_r0) refresh_period_r <= wdata_fifo_out_r[7:0];
        
        if (rst) refresh_set_r0 <= 0;
        else     refresh_set_r0 <= refresh_set_w;

        if (rst) refresh_set_r <= 0;
        else     refresh_set_r <= refresh_set_r0;
        
        if (rst) refresh_ld_addr <= 0;
        else     refresh_ld_addr <= fifo_re && (((waddr_fifo_out ^ REFRESH_ADDR_ADDR) & REFRESH_ADDR_ADDR_MASK)==0);
                 
    end
    always @ (posedge mclk) begin
        waddr_fifo_out_r <= waddr_fifo_out;
        wdata_fifo_out_r <= wdata_fifo_out;
    end
    


endmodule

