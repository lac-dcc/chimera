// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcontr_sequencer
 * @file mcontr_sequencer.v
 * @date 2014-05-16  
 * @author Andrey Filippov
 *
 * @brief ddr3 sequnecer
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcontr_sequencer.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcontr_sequencer.v is distributed in the hope that it will be useful,
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

module  mcontr_sequencer   #(
//command interface parameters
//0x1080..10ff - 8- bit data - to set various delay values
    parameter DLY_LD =            'h080,  // address to generate delay load 
    parameter DLY_LD_MASK =       'h780,  // address mask to generate delay load
//  0x1080..109f - set delay for SDD0-SDD7
//  0x10a0..10bf - set delay for SDD8-SDD15
//  0x10c0..10df - set delay for SD_CMDA
//  0x10e0       - set delay for MMCM
//0x1000..103f - 0- bit data (set/reset)
    parameter MCONTR_PHY_0BIT_ADDR =           'h020,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter MCONTR_PHY_0BIT_ADDR_MASK =      'h7f0,  // address mask to generate sequencer channel/run
//  0x1024..1025 - CMDA_EN      // 0 bits - enable/disable command/address outputs 
//  0x1026..1027 - SDRST_ACT    // 0 bits - enable/disable active-low reset signal to DDR3 memory
//  0x1028..1029 - CKE_EN       // 0 bits - enable/disable CKE signal to memory 
//  0x102a..102b - DCI_RST      // 0 bits - enable/disable CKE signal to memory 
//  0x102c..102d - DLY_RST      // 0 bits - enable/disable CKE signal to memory 
    parameter MCONTR_PHY_0BIT_DLY_SET =        'h0,    // set pre-programmed delays 

    parameter MCONTR_PHY_0BIT_CMDA_EN =        'h4,    // enable/disable command/address outputs 
    parameter MCONTR_PHY_0BIT_SDRST_ACT =      'h6,    // enable/disable active-low reset signal to DDR3 memory
    parameter MCONTR_PHY_0BIT_CKE_EN =         'h8,    // enable/disable CKE signal to memory 
    parameter MCONTR_PHY_0BIT_DCI_RST =        'ha,    // enable/disable CKE signal to memory 
    parameter MCONTR_PHY_0BIT_DLY_RST =        'hc,    // enable/disable CKE signal to memory 
    parameter MCONTR_PHY_STATUS_REG_ADDR=      'h0,    // status register address to use for memory controller phy
//0x1040..107f - 16-bit data
//  0x1040..104f - RUN_CHN      // address to set sequncer channel and  run (4 LSB-s - channel) - bits? 
//    parameter RUN_CHN_REL =           'h040,  // address to set sequnecer channel and  run (4 LSB-s - channel)
//   parameter RUN_CHN_REL_MASK =      'h7f0,  // address mask to generate sequencer channel/run
//  0x1050..1057: MCONTR_PHY16
    parameter MCONTR_PHY_16BIT_ADDR =           'h050,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter MCONTR_PHY_16BIT_ADDR_MASK =      'h7f8,  // address mask to generate sequencer channel/run
    parameter MCONTR_PHY_16BIT_PATTERNS =       'h0,    // set DQM and DQS patterns (16'h0055)
    parameter MCONTR_PHY_16BIT_PATTERNS_TRI =   'h1,    // 16-bit address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each 
    parameter MCONTR_PHY_16BIT_WBUF_DELAY =     'h2,    // 4? bits - extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
    parameter MCONTR_PHY_16BIT_EXTRA =          'h3,    // ? bits - set extra parameters (currently just inv_clk_div)
    parameter MCONTR_PHY_STATUS_CNTRL =         'h4,    // write to status control (8-bit)

    parameter DFLT_DQS_PATTERN=        8'h55,
    parameter DFLT_DQM_PATTERN=        8'h00,  // 8'h00
    parameter DFLT_DQ_TRI_ON_PATTERN=  4'h7,  // DQ tri-state control word, first when enabling output
    parameter DFLT_DQ_TRI_OFF_PATTERN= 4'he, // DQ tri-state control word, first after disabling output
    parameter DFLT_DQS_TRI_ON_PATTERN= 4'h3, // DQS tri-state control word, first when enabling output
    parameter DFLT_DQS_TRI_OFF_PATTERN=4'hc,// DQS tri-state control word, first after disabling output
    parameter DFLT_WBUF_DELAY=         4'h8, // write levelling - 7!
    parameter DFLT_INV_CLK_DIV=        1'b0,

    parameter PHASE_WIDTH =     8,
    parameter SLEW_DQ =         "SLOW",
    parameter SLEW_DQS =        "SLOW",
    parameter SLEW_CMDA =       "SLOW",
    parameter SLEW_CLK =       "SLOW",
    parameter IBUF_LOW_PWR =    "TRUE",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter CLKIN_PERIOD          = 10, //ns >1.25, 600<Fvco<1200
    parameter CLKFBOUT_MULT =       8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
    parameter DIVCLK_DIVIDE=        1,
    parameter CLKFBOUT_USE_FINE_PS= 1, // 0 - old, 1 - new 
    parameter CLKFBOUT_PHASE =      0.000,
    parameter SDCLK_PHASE =         0.000,
    parameter CLK_PHASE =           0.000,
    parameter CLK_DIV_PHASE =       0.000,
    parameter MCLK_PHASE =          90.000,
    parameter REF_JITTER1 =         0.010,
    parameter SS_EN =              "FALSE",
    parameter SS_MODE =      "CENTER_HIGH",
    parameter SS_MOD_PERIOD =       10000,
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10
)(
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
    inout                        NDQSU, // ~UDQS I/O pad
// clocks, reset
    input                        clk_in,
    input                        rst_in,
    output                       mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input                        mrst,     // @posedge mclk, sync reset (should not interrupt mclk!)
    output                       locked,   // to generate sync reset
    input                        ref_clk,  // global clock for idelay_ctrl calibration
    output                       idelay_ctrl_reset,
// command port 0 (filled by software - 32w->32r) - used for mode set, refresh, write levelling, ...
    input                        cmd0_clk,
    input                        cmd0_we,
    input                [9:0]   cmd0_addr,
    input               [31:0]   cmd0_data,
// automatic command port1 , filled by the PL, 32w 32r, used for actual page R/W
    input                        cmd1_clk,
    input                        cmd1_we,
    input                [9:0]   cmd1_addr,
    input               [31:0]   cmd1_data,
// Controller run interface, posedge mclk
    input               [10:0]   run_addr, // controller sequencer start address (0..11'h3ff - cmd0, 11'h400..11'h7ff - cmd1)
    input                [3:0]   run_chn,  // data channel to use
    input                        run_refresh, // command is refresh (invalidates channel)
    input                        run_seq,  // start controller sequence (will end with !ddr_rst for stable mclk)
    output                       run_done, // controller sequence finished
    output                       run_busy, // controller sequence in progress
    output                       mcontr_reset, // == ddr_reset that also resets sequencer  
    // programming interface
    input                  [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                        cmd_stb,     // strobe (with first byte) for the command a/d
    output                 [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                       status_rq,   // input request to send status downstream
    input                        status_start, // Acknowledge of the first status packet byte (address)

// Interface to write-to-memory buffers (up to 16)
// There will be =1 cycle external latency in address/re and 1 cycle latency in read data (should match sequence programs)
// Address data is sync to posedge mclk
    output                       ext_buf_page_nxt, // Generated for both reads and writes, @posedge mclk
    output                       ext_buf_rd,
    output                       ext_buf_rpage_nxt, // increment external buffer read address to next page start
//    output                 [6:0] ext_buf_raddr, // valid with ext_buf_rd, 2 page MSB to be generated externally
    output                 [3:0] ext_buf_rchn,   // ==run_chn_d valid 1 cycle ahead opf ext_buf_rd!, maybe not needed - will be generated externally
    output                       ext_buf_rrefresh, // was refresh, invalidates ext_buf_rchn
    output                       ext_buf_rrun, // run read sequence (to be used with external buffer to set initial address
    input                 [63:0] ext_buf_rdata, // Latency of ram_1kx32w_512x64r plus 2
    
//  Interface to memory read channels (up to 16)   
// Address/data sync to negedge mclk!, any latency OK - just generate DONE appropriately (through the sequencer with delay?
// folowing a sync to negedge!
    output                       ext_buf_wr,
    output                       ext_buf_wpage_nxt, // increment external buffer write address to next page start
//    output                 [6:0] ext_buf_waddr,  // valid with ext_buf_wr
    output                 [3:0] ext_buf_wchn,   // external buffer channel with timing matching buffer writes
    output                       ext_buf_wrefresh, // was refresh, invalidates ext_buf_wchn
    output                       ext_buf_wrun,     // @negedge,first cycle of sequencer run matching write delay
    output                [63:0] ext_buf_wdata,   // valid with ext_buf_wr
// temporary debug data    
    output                [11:0] tmp_debug
);
    localparam ADDRESS_NUMBER = 15;
    wire                   [7:0] dly_data;
    wire                   [6:0] dly_addr;
    wire                         ld_delay;
    wire                         set;
    wire                   [3:0] phy_0bit_addr;
    wire                         phy_0bit_we;
    reg                          cmda_en;   // enable (!tristate) command and address lines // not likely to be used
    reg                          ddr_rst=1; // generate reset to DDR3 memory (active high)
    reg                          dci_rst;   // active high - reset DCI circuitry
    reg                          dly_rst;   // active high - delay calibration circuitry
    reg                          ddr_cke;  // DDR clock enable , XOR-ed with command bit
    
    reg                   [7:0]  dqs_pattern=DFLT_DQS_PATTERN; // 8'h55
    reg                   [7:0]  dqm_pattern=DFLT_DQM_PATTERN;  // 8'h00
    reg                   [ 3:0] dq_tri_on_pattern=DFLT_DQ_TRI_ON_PATTERN;  // DQ tri-state control word, first when enabling output
    reg                   [ 3:0] dq_tri_off_pattern=DFLT_DQ_TRI_OFF_PATTERN; // DQ tri-state control word, first after disabling output
    reg                   [ 3:0] dqs_tri_on_pattern=DFLT_DQS_TRI_ON_PATTERN; // DQS tri-state control word, first when enabling output
    reg                   [ 3:0] dqs_tri_off_pattern=DFLT_DQS_TRI_OFF_PATTERN;// DQS tri-state control word, first after disabling output
    reg                   [ 3:0] wbuf_delay=DFLT_WBUF_DELAY;
    wire                  [ 3:0] wbuf_delay_m1;

    wire                   [2:0] phy_16bit_addr;
    wire                  [15:0] phy_16bit_data;
    wire                         phy_16bit_we;
    
    reg                         inv_clk_div=0;

// Status data:

    wire                       locked_mmcm;
    wire                       locked_pll;
    wire                       dly_ready;
    wire                       dci_ready;


//    wire     [PHASE_WIDTH-1:0] ps_out;
    wire                 [7:0] ps_out;
    wire                       ps_rdy;
//    wire locked;
    wire                [14:0] status_data;
    
// temporary, debug
    wire                       phy_locked_mmcm; // before clock crossing
    wire                       phy_locked_pll; // before clock crossing
    wire                       phy_dly_ready; // before clock crossing
    wire                       phy_dci_ready; // before clock crossing
     
    
//    wire                 [35:0]  phy_cmd; // input[35:0] 
    wire                 [31:0]  phy_cmd_word;  // selected output from either cmd0 buffer or cmd1 buffer 
    wire                 [31:0]  phy_cmd0_word; // cmd0 buffer output
    wire                 [31:0]  phy_cmd1_word; // cmd1 buffer output
    reg                          buf_raddr_reset;
    reg                          buf_addr_reset; // generated regardless of read/write
    reg                          buf_waddr_reset_negedge;
    reg                          buf_wr_negedge; 
    wire                 [63:0]  buf_wdata; // output[63:0]
    reg                  [63:0]  buf_wdata_negedge; // output[63:0]
    wire                 [63:0]  buf_rdata; // multiplexed input from one of the write channels buffer
    wire                         buf_wr; // delayed by specified number of clock cycles
    wire                         buf_wr_ndly; // before dealy
    wire                         buf_rd; // read next 64 bits from the buffer, need one extra pre-read
    wire                         buf_rst; // reset buffer address to 
    wire                         buf_rst_d; //buf_rst delayed to match buf_wr 
    reg                  [ 9:0]  cmd_addr;      // command word address  
    reg                          cmd_sel;
    reg                  [ 2:0]  cmd_busy;      // bit 0 - immediately,
    wire                         phy_cmd_nop;   // decoded command (ras, cas, we) was NOP
    wire                         phy_cmd_add_pause; // decoded from the command word - add one pause command after the current one
    reg                          add_pause; // previos command had phy_cmd_add_pause set
    wire                         sequence_done;
    wire   [CMD_PAUSE_BITS-1:0]  pause_len;
    reg                          cmd_fetch;     // previous cycle command was read from the command memory, current: command valid
    wire                         pause;         // do not register new data from the command memory
    reg    [CMD_PAUSE_BITS-1:0]  pause_cntr;
    
    wire                  [3:0]  run_chn_w_d; // run chn delayed to match buf_wr delay
    wire                         run_refresh_w_d; // run refresh delayed to match buf_wr delay
    wire                         run_w_d;
    
    reg                   [3:0]  run_chn_d;
    reg                          run_refresh_d;
    
    reg                   [3:0]  run_chn_w_d_negedge;
    reg                          run_refresh_w_d_negedge;
    reg                          run_w_d_negedge;
    
    reg                        run_seq_d; 
    reg                        mem_read_mode; // last was buf_wr, not buf_rd
    
    wire [7:0] tmp_debug_a;
    assign tmp_debug[11:0] =
     {phy_locked_mmcm,
      phy_locked_pll,
      phy_dly_ready,
      phy_dci_ready,
      tmp_debug_a[7:0]};
    
    assign mcontr_reset=ddr_rst; // to reset controller
    assign run_done=sequence_done; //  & cmd_busy[2]; // limit done to 1 cycle only even if duration is non-zero - already set in pause_len
    assign run_busy=cmd_busy[0]; //earliest
    assign  pause=cmd_fetch? (phy_cmd_add_pause || (phy_cmd_nop && (pause_len != 0))): (cmd_busy[2] && (pause_cntr[CMD_PAUSE_BITS-1:1]!=0));
/// debugging
//    assign phy_cmd_word = cmd_sel?phy_cmd1_word:phy_cmd0_word; // TODO: hangs even with 0-s in phy_cmd
    assign phy_cmd_word = (cmd_sel?phy_cmd1_word:phy_cmd0_word) & {32{cmd_busy[2]}}; // TODO: hangs even with 0-s in phy_cmd


///    assign phy_cmd_word = phy_cmd_word?0:0;
     
//    assign buf_rdata[63:0] = ({64{buf_sel_1hot[1]}} & buf1_rdata[63:0]); // ORed with other read channels terms
    
// External buffers buffer related signals

//    assign buf_raddr_reset=  buf_rst & ~mem_read_mode; // run_seq_d;
    assign ext_buf_rd=       buf_rd;
    assign ext_buf_rpage_nxt=buf_raddr_reset;
    assign ext_buf_page_nxt= buf_addr_reset;
//    assign ext_buf_raddr=    buf_raddr;
    assign ext_buf_rchn=     run_chn_d;
    assign ext_buf_rrefresh= run_refresh_d;
    assign buf_rdata[63:0] = ext_buf_rdata;
    assign ext_buf_rrun=run_seq_d;
    
    assign ext_buf_wr=       buf_wr_negedge;
    assign ext_buf_wpage_nxt=buf_waddr_reset_negedge;
//    assign ext_buf_waddr=    buf_waddr_negedge;
    assign ext_buf_wchn=     run_chn_w_d_negedge;
    assign ext_buf_wrefresh= run_refresh_w_d_negedge;
    assign ext_buf_wdata=    buf_wdata_negedge;
   assign ext_buf_wrun=      run_w_d_negedge;
// generation of the control signals from byte-serial channel
// generate 8-bit delay data
    cmd_deser #(
        .ADDR       (DLY_LD),
        .ADDR_MASK  (DLY_LD_MASK),
        .NUM_CYCLES (3),
        .ADDR_WIDTH (7),
        .DATA_WIDTH (8)
    ) cmd_deser_dly_i (
        .rst        (1'b0),      // rst), // input
        .clk        (mclk),      // input
        .srst       (mrst),      // input
        .ad         (cmd_ad),    // input[7:0] 
        .stb        (cmd_stb),   // input
        .addr       (dly_addr),  // output[15:0] 
        .data       (dly_data),  // output[31:0] 
        .we(        ld_delay)    // output
    );
// generate on/off dependent on lsb and 0-bit commands
    cmd_deser #(
        .ADDR       (MCONTR_PHY_0BIT_ADDR),
        .ADDR_MASK  (MCONTR_PHY_0BIT_ADDR_MASK),
        .NUM_CYCLES (2),
        .ADDR_WIDTH (4),
        .DATA_WIDTH (0)
    ) cmd_deser_0bit_i (
        .rst        (1'b0),          // rst), // input
        .clk        (mclk),          // input
        .srst       (mrst),          // input
        .ad         (cmd_ad),        // input[7:0] 
        .stb        (cmd_stb),       // input
        .addr       (phy_0bit_addr), // output[15:0] 
        .data       (),              // output[31:0] 
        .we         (phy_0bit_we)    // output
    );

    assign   set= phy_0bit_we && (phy_0bit_addr==MCONTR_PHY_0BIT_DLY_SET);
    always @ (posedge mclk) begin
        if (mrst)                                                  cmda_en <= 0;
        else if (phy_0bit_we && (phy_0bit_addr[3:1]==(MCONTR_PHY_0BIT_CMDA_EN>>1))) cmda_en <= phy_0bit_addr[0];
        
        if (mrst)                                                  ddr_rst <= 1;
        else if (phy_0bit_we && (phy_0bit_addr[3:1]==(MCONTR_PHY_0BIT_SDRST_ACT>>1))) ddr_rst <= phy_0bit_addr[0];
        
        if (mrst)                                                  dci_rst <= 0;
        else if (phy_0bit_we && (phy_0bit_addr[3:1]==(MCONTR_PHY_0BIT_DCI_RST>>1))) dci_rst <= phy_0bit_addr[0];
        
        if (mrst)                                                  dly_rst <= 0;
        else if (phy_0bit_we && (phy_0bit_addr[3:1]==(MCONTR_PHY_0BIT_DLY_RST>>1))) dly_rst <= phy_0bit_addr[0];
        
        if (mrst)                                                  ddr_cke <= 0;
        else if (phy_0bit_we && (phy_0bit_addr[3:1]==(MCONTR_PHY_0BIT_CKE_EN>>1))) ddr_cke <= phy_0bit_addr[0];
    end
    
// generate 16-bit data commands (and set defaults to registers)
    cmd_deser #(
        .ADDR       (MCONTR_PHY_16BIT_ADDR),
        .ADDR_MASK  (MCONTR_PHY_16BIT_ADDR_MASK),
        .NUM_CYCLES (4),
        .ADDR_WIDTH (3),
        .DATA_WIDTH (16)
    ) cmd_deser_16bit_i (
        .rst        (1'b0),          // rst), // input
        .clk        (mclk),          // input
        .srst       (mrst),          // input
        .ad         (cmd_ad), // input[7:0] 
        .stb        (cmd_stb), // input
        .addr       (phy_16bit_addr), // output[15:0] 
        .data       (phy_16bit_data), // output[31:0] 
        .we         (phy_16bit_we) // output
    );
    wire set_patterns;
    wire set_patterns_tri;
    wire set_wbuf_delay;
    wire set_extra;
    
    wire                control_status_we; // share with write delay (8-but)?
    wire          [7:0] contral_status_data;
    
    assign set_patterns=       phy_16bit_we && (phy_16bit_addr[2:0]==MCONTR_PHY_16BIT_PATTERNS);
    assign set_patterns_tri=   phy_16bit_we && (phy_16bit_addr[2:0]==MCONTR_PHY_16BIT_PATTERNS_TRI);
    assign set_wbuf_delay=     phy_16bit_we && (phy_16bit_addr[2:0]==MCONTR_PHY_16BIT_WBUF_DELAY);
    assign set_extra=          phy_16bit_we && (phy_16bit_addr[2:0]==MCONTR_PHY_16BIT_EXTRA);
    assign control_status_we=  phy_16bit_we && (phy_16bit_addr[2:0]==MCONTR_PHY_STATUS_CNTRL);
    assign contral_status_data= phy_16bit_data[7:0];

    always @ (posedge mclk) begin
        if (mrst) begin
           dqm_pattern <=DFLT_DQM_PATTERN;
           dqs_pattern <=DFLT_DQS_PATTERN;
        end else if (set_patterns) begin
           dqm_pattern <= phy_16bit_data[15:8];
           dqs_pattern <= phy_16bit_data[7:0];
        end

        if (mrst)  begin
           dqs_tri_off_pattern[3:0] <= DFLT_DQS_TRI_OFF_PATTERN;
           dqs_tri_on_pattern[3:0]  <= DFLT_DQS_TRI_ON_PATTERN;
           dq_tri_off_pattern[3:0]  <= DFLT_DQ_TRI_OFF_PATTERN;
           dq_tri_on_pattern[3:0]   <= DFLT_DQ_TRI_ON_PATTERN;
        end else if (set_patterns_tri) begin
           dqs_tri_off_pattern[3:0] <= phy_16bit_data[15:12];
           dqs_tri_on_pattern[3:0]  <= phy_16bit_data[11: 8];
           dq_tri_off_pattern[3:0]  <= phy_16bit_data[ 7: 4];
           dq_tri_on_pattern[3:0]   <= phy_16bit_data[ 3: 0];
        end
        if (mrst)                wbuf_delay <= DFLT_WBUF_DELAY;
        else if (set_wbuf_delay) wbuf_delay <= phy_16bit_data[ 3: 0];

        if (mrst)           inv_clk_div <= DFLT_INV_CLK_DIV;
        else if (set_extra) inv_clk_div <= phy_16bit_data[0];
    end    

// TODO: status       
    assign locked=locked_mmcm && locked_pll;
//    assign status_data={dly_ready,dci_ready, locked_mmcm, locked_pll, run_busy,locked,ps_rdy,ps_out[7:0]};
    assign status_data={dly_ready,dci_ready, locked_mmcm, locked_pll, run_busy,ps_out[7:0],locked,ps_rdy};
    status_generate #(
        .STATUS_REG_ADDR  (MCONTR_PHY_STATUS_REG_ADDR),
        .PAYLOAD_BITS     (15)
    ) status_generate_i (
        .rst              (1'b0),                // rst), // input
        .clk              (mclk),                // input
        .srst             (mrst),                // input
        .we               (control_status_we),   // input
        .wd               (contral_status_data), // input[7:0] 
        .status           (status_data),         // input[25:0] 
        .ad               (status_ad),           // output[7:0] 
        .rq               (status_rq),           // output
        .start            (status_start)         // input
    );
    
    
    always @ (posedge mclk) begin
        if (mrst)         cmd_busy <= 0;
        else if (ddr_rst) cmd_busy <= 0; // *************** reset sequencer with DDR reset
        else if (sequence_done &&  cmd_busy[2]) cmd_busy <= 0;
        else cmd_busy <= {cmd_busy[1:0],run_seq | cmd_busy[0]}; 
        // Pause counter
        if (mrst)                          pause_cntr <= 0;
        else if (!cmd_busy[1])             pause_cntr <= 0; // not needed?
        else if (cmd_fetch && phy_cmd_nop) pause_cntr <= pause_len;
        else if (pause_cntr!=0)            pause_cntr <= pause_cntr-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 10-bit target.
        // Fetch - command data valid
        if (mrst) cmd_fetch <= 0;
        else      cmd_fetch <= cmd_busy[0] && !pause;

        if (mrst) add_pause <= 0;
        else      add_pause <= cmd_fetch && phy_cmd_add_pause;
         
        // Command read address
        if (mrst)                       cmd_addr <= 0;
        else  if (run_seq)              cmd_addr <= run_addr[9:0];
        else if (cmd_busy[0] && !pause) cmd_addr <= cmd_addr + 1; //SuppressThisWarning ISExst Result of 11-bit expression is truncated to fit in 10-bit target.
        // command bank select (0 - "manual" (software programmed sequences), 1 - "auto" (normal block r/w)
        if (mrst)           cmd_sel <= 0;
        else  if (run_seq)  cmd_sel <= run_addr[10];
   
//        if (rst)                   buf_raddr <= 7'h0;
//        else if (run_seq_d)        buf_raddr <= 7'h0;
//        else if (buf_wr || buf_rd) buf_raddr <= buf_raddr +1; // Separate read/write address? read address re-registered @ negedge //SuppressThisWarning ISExst Result of 10-bit expression is truncated to fit in 9-bit target.

        if (mrst)         run_chn_d <= 0;
        else if (run_seq) run_chn_d <= run_chn;
        
        if (mrst)         run_refresh_d <= 0;
        else if (run_seq) run_refresh_d <= run_refresh;
        
        if (mrst) run_seq_d <= 0;
        else      run_seq_d <= run_seq;

        if (mrst) buf_raddr_reset <= 0;
        else      buf_raddr_reset<= buf_rst & ~mem_read_mode;

        if (mrst) buf_addr_reset <= 0;
        else      buf_addr_reset<= buf_rst;
    end
    
    always @ (posedge mclk) begin
       
         if      (buf_wr_ndly)  mem_read_mode <= 1; // last was buf_wr, not buf_rd
         else if (buf_rd)  mem_read_mode <= 0;
        
    end
    // re-register buffer write address to match DDR3 data
    always @ (negedge mclk) begin
//        buf_waddr_negedge <= buf_raddr;
        buf_waddr_reset_negedge <= buf_rst_d; //buf_raddr_reset;
        buf_wr_negedge <= buf_wr;
        buf_wdata_negedge <= buf_wdata;
        run_chn_w_d_negedge <= run_chn_w_d; //run_chn_d;
        run_refresh_w_d_negedge <= run_refresh_w_d;
        run_w_d_negedge <= run_w_d;
        
    end
// Command sequence memories:
// Command sequence memory 0 ("manual"):
    wire ren0=!cmd_sel && cmd_busy[0] && !pause; // cmd_busy - multibit
    wire ren1= cmd_sel && cmd_busy[0] && !pause;
    ram_1kx32_1kx32 #(
        .REGISTERS(1) // (0) // register output
    ) cmd0_buf_i (
        .rclk     (mclk),          // input
        .raddr    (cmd_addr),      // input[9:0]
        .ren      (ren0),          // input TODO: verify cmd_busy[0] is correct (was cmd_busy ). TODO: make cleaner ren/regen
//        .ren      (ren0 && !sequence_done),  // input TODO: verify cmd_busy[0] is correct (was cmd_busy ). TODO: make cleaner ren/regen
        .regen    (ren0),          // input
        .data_out (phy_cmd0_word), // output[31:0] 
        .wclk     (cmd0_clk),      // input
        .waddr    (cmd0_addr),     // input[9:0] 
        .we       (cmd0_we),       // input
        .web      (4'hf),          // input[3:0] 
        .data_in  (cmd0_data)      // input[31:0] 
    );
// NOTE: Simulation sometimes may show:
// Memory Collision Error on RAMB36E1 : x393_testbench03.x393_i.mcntrl393_i.memctrl16_i.mcontr_sequencer_i.cmd1_buf_i.RAMB36E1_i.genblk1.INT_RAMB_TDP.chk_for_col_msg
// It is OK, as the sequencer reads 2 extra (unused) locations before it stops at the end of block (stop depends on the read memory that has latency)


// Command sequence memory 1
    ram_1kx32_1kx32 #(
        .REGISTERS (1) // (0) // register output
    ) cmd1_buf_i (
        .rclk     (mclk),          // input
        .raddr    (cmd_addr),      // input[9:0]
        .ren      ( ren1),         // input ???  TODO: make cleaner ren/regen
//        .ren      ( ren1 && !sequence_done),  // input ???  TODO: make cleaner ren/regen
        .regen    ( ren1),         // input ???
        .data_out (phy_cmd1_word), // output[31:0] 
        .wclk     (cmd1_clk),      // input
        .waddr    (cmd1_addr),     // input[9:0] 
        .we       (cmd1_we),       // input
        .web      (4'hf),          // input[3:0] 
        .data_in  (cmd1_data)      // input[31:0] 
    );
    
    phy_cmd #(
        .ADDRESS_NUMBER        (ADDRESS_NUMBER),
        .PHASE_WIDTH           (PHASE_WIDTH),
        .SLEW_DQ               (SLEW_DQ),
        .SLEW_DQS              (SLEW_DQS),
        .SLEW_CMDA             (SLEW_CMDA),
        .SLEW_CLK              (SLEW_CLK),
        .IBUF_LOW_PWR          (IBUF_LOW_PWR),
        .REFCLK_FREQUENCY      (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
        .CLKIN_PERIOD          (CLKIN_PERIOD),
        .CLKFBOUT_MULT         (CLKFBOUT_MULT),
        .DIVCLK_DIVIDE         (DIVCLK_DIVIDE),
        .CLKFBOUT_USE_FINE_PS (CLKFBOUT_USE_FINE_PS),
        .CLKFBOUT_PHASE        (CLKFBOUT_PHASE),
        .SDCLK_PHASE           (SDCLK_PHASE), /// debugging
        .CLK_PHASE             (CLK_PHASE),
        .CLK_DIV_PHASE         (CLK_DIV_PHASE),
        .MCLK_PHASE            (MCLK_PHASE),
        .REF_JITTER1           (REF_JITTER1),
        .SS_EN                 (SS_EN),
        .SS_MODE               (SS_MODE),
        .SS_MOD_PERIOD         (SS_MOD_PERIOD),
        .CMD_PAUSE_BITS        (CMD_PAUSE_BITS), // numer of (address) bits to encode pause
        .CMD_DONE_BIT          (CMD_DONE_BIT)    // bit number (address) to signal sequence done
    ) phy_cmd_i (
        .SDRST               (SDRST),                   // output
        .SDCLK               (SDCLK),                   // output
        .SDNCLK              (SDNCLK),                  // output
        .SDA                 (SDA[ADDRESS_NUMBER-1:0]), // output[14:0] 
        .SDBA                (SDBA[2:0]),               // output[2:0] 
        .SDWE                (SDWE),                    // output
        .SDRAS               (SDRAS),                   // output
        .SDCAS               (SDCAS),                   // output
        .SDCKE               (SDCKE),                   // output
        .SDODT               (SDODT),                   // output
        .SDD                 (SDD[15:0]),               // inout[15:0] 
        .SDDML               (SDDML),                   // inout
        .DQSL                (DQSL),                    // inout
        .NDQSL               (NDQSL),                   // inout
        .SDDMU               (SDDMU),                   // inout
        .DQSU                (DQSU),                    // inout
        .NDQSU               (NDQSU),                   // inout
        .clk_in              (clk_in),                  // input
        .rst_in              (rst_in),                  // input
        .mclk                (mclk),                    // output
        .mrst                (mrst),                    // input
        .ref_clk             (ref_clk),                 // input
        .idelay_ctrl_reset   (idelay_ctrl_reset),       // output
        .dly_data            (dly_data[7:0]),           // input[7:0] 
        .dly_addr            (dly_addr[6:0]),           // input[6:0] 
        .ld_delay            (ld_delay),                // input
        .set                 (set),                     // input
//        .locked              (locked), // output
        .locked_mmcm         (locked_mmcm),             // output
        .locked_pll          (locked_pll),              // output
        .dly_ready           (dly_ready),               // output
        .dci_ready           (dci_ready),               // output
        
        .phy_locked_mmcm     (phy_locked_mmcm),         // output
        .phy_locked_pll      (phy_locked_pll),          // output
        .phy_dly_ready       (phy_dly_ready),           // output
        .phy_dci_ready       (phy_dci_ready),           // output
        
        .tmp_debug           (tmp_debug_a[7:0]),
        
        .ps_rdy              (ps_rdy),                  // output
        .ps_out              (ps_out[7:0]),             // output[7:0]
        .phy_cmd_word        (phy_cmd_word[31:0]),      // input[31:0]
        .phy_cmd_nop         (phy_cmd_nop),             // output
        .phy_cmd_add_pause   (phy_cmd_add_pause),       // one pause cycle (for 8-bursts)
        .add_pause           (add_pause),               // input
        .pause_len           (pause_len),               // output  [CMD_PAUSE_BITS-1:0]
        .sequence_done       (sequence_done),           // output
        .buf_wdata           (buf_wdata[63:0]),         // output[63:0] 
        .buf_rdata           (buf_rdata[63:0]),         // input[63:0] 
        .buf_wr              (buf_wr_ndly),             // output
        .buf_rd              (buf_rd),                  // output
        .buf_rst             (buf_rst),                 // reset external buffer address to page start 
        .cmda_en             (cmda_en),                 // input
        .ddr_rst             (ddr_rst),                 // input
        .dci_rst             (dci_rst),                 // input
        .dly_rst             (dly_rst),                 // input
        .ddr_cke             (ddr_cke),                 // input
        .inv_clk_div         (inv_clk_div),             // input
        .dqs_pattern         (dqs_pattern),             // input[7:0] 
        .dqm_pattern         (dqm_pattern),             // input[7:0]
        .dq_tri_on_pattern   (dq_tri_on_pattern[3:0]),  // input[3:0] 
        .dq_tri_off_pattern  (dq_tri_off_pattern[3:0]), // input[3:0] 
        .dqs_tri_on_pattern  (dqs_tri_on_pattern[3:0]), // input[3:0] 
        .dqs_tri_off_pattern (dqs_tri_off_pattern[3:0]) // input[3:0] 
    );
    // delay buf_wr by 1-16 cycles to compensate for DDR and HDL code latency (~7 cycles?)
    dly_16 #(2) buf_wr_dly_i (
        .clk  (mclk),                                  // input
        .rst  (mrst),                                  // input
        .dly  (wbuf_delay[3:0]),                       // input[3:0] 
        .din  ({mem_read_mode & buf_rst,buf_wr_ndly}), // input
        .dout ({buf_rst_d, buf_wr})                    // output reg 
    );
    assign wbuf_delay_m1=wbuf_delay-1;

    dly_16 #(6) buf_wchn_dly_i (
        .clk  (mclk),                                    // input
        .rst  (mrst),                                    // input
        .dly  (wbuf_delay_m1), //wbuf_delay[3:0]-1),     // input[3:0] 
        .din  ({run_seq_d, run_refresh_d,   run_chn_d}), // input
        .dout ({run_w_d,run_refresh_w_d,run_chn_w_d})    // output reg 
    );

endmodule

