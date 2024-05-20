// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl393
 * @file mcntrl393.v
 * @date 2015-01-31  
 * @author Andrey Filippov     
 *
 * @brief Top level memory controller for 393 camera, includes channel buffers
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl393.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" 
module  mcntrl393 #(
// MAXI address space, in 32-bit words
    parameter MCONTR_SENS_BASE =         'h680, // .. 'h6bf
    parameter MCONTR_SENS_INC =          'h10,
    parameter MCONTR_CMPRS_BASE =        'h6c0, // .. 'h6ff
    parameter MCONTR_CMPRS_INC =         'h10,
    parameter MCONTR_SENS_STATUS_BASE =  'h28, // .. 'h2b
    parameter MCONTR_SENS_STATUS_INC =   'h1,
    parameter MCONTR_CMPRS_STATUS_BASE = 'h2c, // .. 'h2f
    parameter MCONTR_CMPRS_STATUS_INC =  'h1,
    
    parameter MCONTR_WR_MASK =          'h3c00, // AXI write address mask for the 1Kx32 buffers command sequence memory
    parameter MCONTR_RD_MASK =          'h3c00, // AXI read address mask to generate busy
    
    parameter MCONTR_CMD_WR_ADDR =      'h0c00, // AXI write to command sequence memory
    parameter MCONTR_BUF0_RD_ADDR =     'h1000, // AXI read address from buffer 0 (PS sequence, memory read) (was 'h400)
    parameter MCONTR_BUF0_WR_ADDR =     'h1000, // AXI write address to buffer 0 (PS sequence, memory write) (was 'h400)
    // MCONTR_BUF[2-4]_* - temporary, will be removed in the futire
    parameter MCONTR_BUF2_RD_ADDR =     'h1400, // AXI read address from buffer 2 (PL sequence, tiles, memory read)
    parameter MCONTR_BUF2_WR_ADDR =     'h1400, // AXI write address to buffer 2 (PL sequence, tiles, memory write)
    parameter MCONTR_BUF3_RD_ADDR =     'h1800, // AXI read address from buffer 3 (PL sequence, scanline, memory read)
    parameter MCONTR_BUF3_WR_ADDR =     'h1800, // AXI write address to buffer 3 (PL sequence, scanline, memory write)
    parameter MCONTR_BUF4_RD_ADDR =     'h1c00, // AXI read address from buffer 4 (PL sequence, tiles, memory read)
    parameter MCONTR_BUF4_WR_ADDR =     'h1c00, // AXI write address to buffer 4 (PL sequence, tiles, memory write)
    parameter AXI_WR_ADDR_BITS =        14,
    parameter AXI_RD_ADDR_BITS =        14,

    
//command interface parameters
    parameter DLY_LD =            'h080,  // address to generate delay load
    parameter DLY_LD_MASK =       'h780,  // address mask to generate delay load
//0x1000..103f - 0- bit data (set/reset)
    parameter MCONTR_PHY_0BIT_ADDR =           'h020,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter MCONTR_PHY_0BIT_ADDR_MASK =      'h7f0,  // address mask to generate sequencer channel/run
//  0x1020       - DLY_SET      // 0 bits -set pre-programmed delays 
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
//0x1030..1037 - 0-bit memory cotroller (set/reset)
    parameter MCONTR_TOP_0BIT_ADDR =           'h030,  // address to turn on/off memory controller features
    parameter MCONTR_TOP_0BIT_ADDR_MASK =      'h7f8,  // address mask to generate sequencer channel/run
//  0x1030..1031 - MCONTR_EN  // 0 bits, disable/enable memory controller
//  0x1032..1033 - REFRESH_EN // 0 bits, disable/enable memory refresh
//  0x1034..1037 - reserved
    parameter MCONTR_TOP_0BIT_MCONTR_EN =      'h0,    // set pre-programmed delays 
    parameter MCONTR_TOP_0BIT_REFRESH_EN =     'h2,    // disable/enable command/address outputs 
//0x1040..107f - 16-bit data
//  0x1040..104f - RUN_CHN      // address to set sequncer channel and  run (4 LSB-s - channel) - bits? 
//    parameter RUN_CHN_REL =           'h040,  // address to set sequnecer channel and  run (4 LSB-s - channel)
//   parameter RUN_CHN_REL_MASK =      'h7f0,  // address mask to generate sequencer channel/run
//  0x1050..1057: MCONTR_PHY16
    parameter MCONTR_PHY_16BIT_ADDR =           'h050,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter MCONTR_PHY_16BIT_ADDR_MASK =      'h7f8,  // address mask to generate sequencer channel/run
//  0x1050       - PATTERNS     // 16 bits
//  0x1051       - PATTERNS_TRI // 16-bit address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each 
//  0x1052       - WBUF_DELAY   // 4 bits - extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
//  0x1053       - EXTRA_REL    // 1 bit - set extra parameters (currently just inv_clk_div)
//  0x1054       - STATUS_CNTRL // 8 bits - write to status control
    parameter MCONTR_PHY_16BIT_PATTERNS =       'h0,    // set DQM and DQS patterns (16'h0055)
    parameter MCONTR_PHY_16BIT_PATTERNS_TRI =   'h1,    // 16-bit address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each 
    parameter MCONTR_PHY_16BIT_WBUF_DELAY =     'h2,    // 4? bits - extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
    parameter MCONTR_PHY_16BIT_EXTRA =          'h3,    // ? bits - set extra parameters (currently just inv_clk_div)
    parameter MCONTR_PHY_STATUS_CNTRL =         'h4,    // write to status control (8-bit)
   
//0x1060..106f: arbiter priority data
    parameter MCONTR_ARBIT_ADDR =               'h060,   // Address to set channel priorities
    parameter MCONTR_ARBIT_ADDR_MASK =          'h7f0,   // Address mask to set channel priorities
//0x1070..1077 - 16-bit top memory controller:
    parameter MCONTR_TOP_16BIT_ADDR =           'h070,  // address to set mcontr top control registers
    parameter MCONTR_TOP_16BIT_ADDR_MASK =      'h7f8,  // address mask to set mcontr top control registers
//  0x1070       - MCONTR_CHN_EN     // 16 bits per-channel enable (want/need requests)
//  0x1071       - REFRESH_PERIOD    // 8-bit refresh period
//  0x1072       - REFRESH_ADDRESS   // 10 bits
//  0x1073       - STATUS_CNTRL      // 8 bits - write to status control (and debug?)
    parameter MCONTR_TOP_16BIT_CHN_EN =         'h0,    // 16 bits per-channel enable (want/need requests)
    parameter MCONTR_TOP_16BIT_REFRESH_PERIOD = 'h1,    // 8-bit refresh period
    parameter MCONTR_TOP_16BIT_REFRESH_ADDRESS= 'h2,    // 10 bits refresh address in the sequencer (PL) memory
    parameter MCONTR_TOP_16BIT_STATUS_CNTRL=    'h3,    // 8 bits - write to status control (and debug?)
    
// Status read address
    parameter MCONTR_PHY_STATUS_REG_ADDR=      'h0,    // 8 or less bits: status register address to use for memory controller phy
    parameter MCONTR_TOP_STATUS_REG_ADDR=      'h1,    // 8 or less bits: status register address to use for memory controller
    
    
    parameter CHNBUF_READ_LATENCY =             2, //1,     // external channel buffer extra read latency ( 0 - data available next cycle after re (but prev. data))
    
    parameter DFLT_DQS_PATTERN=        8'h55,
    parameter DFLT_DQM_PATTERN=        8'h00, // 8'h00
    parameter DFLT_DQ_TRI_ON_PATTERN=  4'h7,  // DQ tri-state control word, first when enabling output
    parameter DFLT_DQ_TRI_OFF_PATTERN= 4'he,  // DQ tri-state control word, first after disabling output
    parameter DFLT_DQS_TRI_ON_PATTERN= 4'h3,  // DQS tri-state control word, first when enabling output
    parameter DFLT_DQS_TRI_OFF_PATTERN=4'hc,  // DQS tri-state control word, first after disabling output
    parameter DFLT_WBUF_DELAY=         4'h8,  // write levelling - 7!
    parameter DFLT_INV_CLK_DIV=        1'b0,
    
    parameter DFLT_CHN_EN=            16'h0,  // channel mask to be enabled at reset
    parameter DFLT_REFRESH_ADDR=      10'h0,  // refresh sequence address in command memory
    parameter DFLT_REFRESH_PERIOD=     8'h0,  // default 8-bit refresh period (scale?)


    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10,
     
    parameter PHASE_WIDTH =     8,
    parameter SLEW_DQ =         "SLOW",
    parameter SLEW_DQS =        "SLOW",
    parameter SLEW_CMDA =       "SLOW",
    parameter SLEW_CLK =        "SLOW",
    parameter IBUF_LOW_PWR =    "TRUE",
`ifdef use200Mhz
    parameter real REFCLK_FREQUENCY = 200.0, // 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter CLKIN_PERIOD          = 20, // 10, //ns >1.25, 600<Fvco<1200 // Hardware 150MHz , change to             | 6.667
    parameter CLKFBOUT_MULT =       16,   // 8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE  | 16
`else
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter CLKIN_PERIOD          = 10, //ns >1.25, 600<Fvco<1200
    parameter CLKFBOUT_MULT =       8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
`endif    
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
    parameter CMD_DONE_BIT=         10,
//    
    parameter MCNTRL_PS_ADDR=                    'h100,
    parameter MCNTRL_PS_MASK=                    'h7e0, // both channels 0 and 1
    parameter MCNTRL_PS_STATUS_REG_ADDR=         'h2,
    parameter MCNTRL_PS_EN_RST=                  'h0,
    parameter MCNTRL_PS_CMD=                     'h1,
    parameter MCNTRL_PS_STATUS_CNTRL=            'h2,

    parameter NUM_XFER_BITS=                       6,    // number of bits to specify transfer length
    parameter FRAME_WIDTH_BITS=                   13,    // Maximal frame width - 8-word (16 bytes) bursts 
    parameter FRAME_HEIGHT_BITS=                  16,    // Maximal frame height
    parameter LAST_FRAME_BITS=                    16,     // number of bits in frame counter (before rolls over)
    parameter MCNTRL_SCANLINE_CHN1_ADDR=         'h120,
    parameter MCNTRL_SCANLINE_CHN3_ADDR=         'h130,
    parameter MCNTRL_SCANLINE_MASK=              'h7f0, // both channels 0 and 1
    parameter MCNTRL_SCANLINE_MODE=              'h0,   // set mode register: {extra_pages[1:0],enable,!reset}
    parameter MCNTRL_SCANLINE_STATUS_CNTRL=      'h1,   // control status reporting
    parameter MCNTRL_SCANLINE_STARTADDR=         'h2,   // 22-bit frame start address (3 CA LSBs==0. BA==0)
    parameter MCNTRL_SCANLINE_FRAME_SIZE=        'h3,   // 22-bit frame start address increment (3 CA LSBs==0. BA==0)
    parameter MCNTRL_SCANLINE_FRAME_LAST=        'h4,   // 16-bit last frame number in the buffer
    parameter MCNTRL_SCANLINE_FRAME_FULL_WIDTH=  'h5,   // Padded line length (8-row increment), in 8-bursts (16 bytes)
    parameter MCNTRL_SCANLINE_WINDOW_WH=         'h6,   // low word - 13-bit window width (0->'h4000), high word - 16-bit frame height (0->'h10000)
    parameter MCNTRL_SCANLINE_WINDOW_X0Y0=       'h7,   // low word - 13-bit window left, high word - 16-bit window top
    parameter MCNTRL_SCANLINE_WINDOW_STARTXY=    'h8,   // low word - 13-bit start X (relative to window), high word - 16-bit start y
                                                        // Start XY can be used when read command to start from the middle
                                                        // TODO: Add number of blocks to R/W? (blocks can be different) - total length?
                                                        // Read back current address (for debugging)?
    parameter MCNTRL_SCANLINE_START_DELAY =       'ha,    // Set start delay (to accommodate for the command sequencer                                                       
                                                        
//    parameter MCNTRL_SCANLINE_STATUS_REG_ADDR=   'h4,
    parameter MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR=   'h4,
    parameter MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR=   'h6,

    parameter MCNTRL_SCANLINE_PENDING_CNTR_BITS=   2,    // Number of bits to count pending trasfers, currently 2 is enough, but may increase
                                                        // if memory controller will allow programming several sequences in advance to
                                                        // spread long-programming (tiled) over fast-programming (linear) requests.
                                                        // But that should not be too big to maintain 2-level priorities
    
    parameter MCNTRL_SCANLINE_FRAME_PAGE_RESET =1'b0, // reset internal page number to zero at the frame start (false - only when hard/soft reset)                                                     
    parameter MAX_TILE_WIDTH=                   6,     // number of bits to specify maximal tile (width-1) (6 -> 64)
    parameter MAX_TILE_HEIGHT=                  6,     // number of bits to specify maximal tile (height-1) (6 -> 64)
    parameter MCNTRL_TILED_CHN2_ADDR=       'h140,
    parameter MCNTRL_TILED_CHN4_ADDR=       'h150,
    parameter MCNTRL_TILED_MASK=            'h7f0, // both channels 0 and 1
    parameter MCNTRL_TILED_MODE=            'h0,   // set mode register: {extra_pages[1:0],write_mode,enable,!reset}
    parameter MCNTRL_TILED_STATUS_CNTRL=    'h1,   // control status reporting
    parameter MCNTRL_TILED_STARTADDR=       'h2,   // 22-bit frame start address (3 CA LSBs==0. BA==0)
    parameter MCNTRL_TILED_FRAME_SIZE=      'h3,   // 22-bit frame start address increment (3 CA LSBs==0. BA==0)
    parameter MCNTRL_TILED_FRAME_LAST=      'h4,   // 16-bit last frame number in the buffer
    parameter MCNTRL_TILED_FRAME_FULL_WIDTH='h5,   // Padded line length (8-row increment), in 8-bursts (16 bytes)
    parameter MCNTRL_TILED_WINDOW_WH=       'h6,   // low word - 13-bit window width (0->'h4000), high word - 16-bit frame height (0->'h10000)
    parameter MCNTRL_TILED_WINDOW_X0Y0=     'h7,   // low word - 13-bit window left, high word - 16-bit window top
    parameter MCNTRL_TILED_WINDOW_STARTXY=  'h8,   // low word - 13-bit start X (relative to window), high word - 16-bit start y
                                                      // Start XY can be used when read command to start from the middle
                                                      // TODO: Add number of blocks to R/W? (blocks can be different) - total length?
                                                      // Read back current address (for debugging)?
    parameter MCNTRL_TILED_TILE_WHS=        'h9,   // low byte - 6-bit tile width in 8-bursts, second byte - tile height (0 - > 64),
                                                   // 3-rd byte - vertical step (to control tile vertical overlap)
                                                   
    parameter MCNTRL_TILED_STATUS_REG_CHN2_ADDR= 'h5,
    parameter MCNTRL_TILED_STATUS_REG_CHN4_ADDR= 'h7,
    parameter MCNTRL_TILED_PENDING_CNTR_BITS=2,    // Number of bits to count pending trasfers, currently 2 is enough, but may increase
                                                   // if memory controller will allow programming several sequences in advance to
                                                   // spread long-programming (tiled) over fast-programming (linear) requests.
                                                   // But that should not be too big to maintain 2-level priorities
    parameter MCNTRL_TILED_FRAME_PAGE_RESET =1'b0, // reset internal page number to zero at the frame start (false - only when hard/soft reset)                                                     
    parameter BUFFER_DEPTH32=                10,    // Block RAM buffer depth on a 32-bit port
    parameter RSEL=                          1'b1, // late/early READ commands (to adjust timing by 1 SDCLK period)
    parameter WSEL=                          1'b0,  // late/early WRITE commands (to adjust timing by 1 SDCLK period)
    // bits in mode control word
    parameter MCONTR_LINTILE_NRESET =          0, // reset if 0
    parameter MCONTR_LINTILE_EN =              1, // enable requests 
    parameter MCONTR_LINTILE_WRITE =           2, // write to memory mode
    parameter MCONTR_LINTILE_EXTRAPG =         3, // extra pages (over 1) needed by the client simultaneously
    parameter MCONTR_LINTILE_EXTRAPG_BITS =    2, // number of bits to use for extra pages
    parameter MCONTR_LINTILE_KEEP_OPEN =       5, // keep banks open (will be used only if number of rows <= 8)
    parameter MCONTR_LINTILE_BYTE32 =          6, // use 32-byte wide columns in each tile (false - 16-byte)
    parameter MCONTR_LINTILE_LINEAR =          7, // Use linear mode instead of tiled
    parameter MCONTR_LINTILE_RST_FRAME =       8, // reset frame number 
    parameter MCONTR_LINTILE_SINGLE =          9, // read/write a single page 
    parameter MCONTR_LINTILE_REPEAT =         10,  // read/write pages until disabled 
    parameter MCONTR_LINTILE_DIS_NEED =       11,   // disable 'need' request 
    parameter MCONTR_LINTILE_SKIP_LATE =      12,  // skip actual R/W operation when it is too late, advance pointers
    parameter MCONTR_LINTILE_COPY_FRAME =     13,  // copy frame number from the master channel (single event, not a persistent mode)
    parameter MCONTR_LINTILE_ABORT_LATE =     14,  // abort frame if not finished by the new frame sync (wait pending memory)
    parameter MCNTRL_SCANLINE_DLY_WIDTH =     12,  // delay start pulse by 1..64 mclk
    parameter MCNTRL_SCANLINE_DLY_DEFAULT = 1024  // initial delay value for start pulse
    
    ) (
    input                        rst_in,
    input                        clk_in,
    output                       mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input                        mrst,     // @posedge mclk synchronous reset - should not interrupt mclk generation
    output                       locked,   // to generate sync reset
    input                        ref_clk,  // global clock for idelay_ctrl calibration
    output                       idelay_ctrl_reset,
    // programming interface
    input                  [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                        cmd_stb,     // strobe (with first byte) for the command a/d
    output                 [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                       status_rq,   // input request to send status downstream
    input                        status_start, // Acknowledge of the first status packet byte (address)
    

// interface to PIO RD/WR, sync to axi_clk
    input                        axi_clk,   // common for read and write channels

    input [AXI_WR_ADDR_BITS-1:0] axiwr_pre_awaddr, // same as awaddr_out, early address to decode and return dev_ready
    input                        axiwr_start_burst, // start of write burst, valid pre_awaddr, save externally to control ext. dev_ready multiplexer
//   wire           axiwr_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_awaddr@start_burst
//   wire           axiwr_bram_wclk;
//   wire  [AXI_WR_ADDR_BITS-1:0] axiwr_bram_waddr;
    input   [BUFFER_DEPTH32-1:0] axiwr_waddr,
//    wire                         axiwr_bram_wen;    // external memory write enable, (internally combined with registered dev_ready
    input                        axiwr_wen,    // external memory write enable, (internally combined with registered dev_ready
// SuppressWarnings VEditor unused (yet?) 
//   wire    [3:0]  axiwr_bram_wstb; 
//   wire   [31:0]  axiwr_bram_wdata;
    input                [31:0]  axiwr_data,
        
// External memory synchronization
    input [AXI_RD_ADDR_BITS-1:0] axird_pre_araddr, // same as awaddr_out, early address to decode and return dev_ready
    input                        axird_start_burst, // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
//   wire           axird_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_araddr@start_burst
// External memory interface   
// SuppressWarnings VEditor unused (yet?) - use mclk 
//   wire           axird_bram_rclk;  //      .rclk(aclk),                  // clock for read port
//    wire [AXI_RD_ADDR_BITS-1:0] axird_bram_raddr, //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
    input   [BUFFER_DEPTH32-1:0] axird_raddr, //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
//    wire                        axird_bram_ren,   //      .ren(bram_reg_re_w) ,      // read port enable
    input                        axird_ren,   //      .ren(bram_reg_re_w) ,      // read port enable
//   wire           axird_bram_regen; //   .regen(bram_reg_re_w),        // output register enable
    input                        axird_regen, //==axird_ren?? - remove?   .regen(bram_reg_re_w),        // output register enable
//   wire  [31:0]   axird_bram_rdata;  //      .data_out(rdata[31:0]),       // data out
    output              [31:0]   axird_rdata,  // combinatorial multiplexed (add external register layer, modify axibram_read?)     .data_out(rdata[31:0]),       // data out
    output                       axird_selected, // axird_rdata contains valid data from this module 

    // sensor subsystem interface
    input                      [3:0] sens_sof, //     // single mclk pulse, start of frame (early)
    output                     [3:0] sens_frame_run,  // output @ mclk - enable data to memory buffer
    output                     [3:0] sens_rpage_set,  //    (), // input
    output                     [3:0] sens_rpage_next, // output to control memory side of the buffer during write to memory
    output                     [3:0] sens_buf_rd,     //    (), // input
    input                    [255:0] sens_buf_dout,   //    (), // output[63:0]
    input                      [3:0] sens_page_written, //  single mclk pulse: buffer page (full or partial) is written to the memory buffer 
    output                     [3:0] sens_xfer_skipped, // single mclk pulse on each bit indicating one skipped (not written) block.
    output reg                 [3:0] sens_first_wr_in_frame, // single mclk pulse on first write block in each frame
`ifdef DEBUG_SENS_MEM_PAGES
    input            [2 * 4 - 1 : 0] dbg_rpage,
    input            [2 * 4 - 1 : 0] dbg_wpage,
`endif
    
    // compressor subsystem interface
    // Buffer interfaces, combined for 4 channels 
    output                     [3:0] cmprs_xfer_reset_page_rd, // from mcntrl_tiled_rw (
    output                     [3:0] cmprs_buf_wpage_nxt,      // advance to next page memory interface writes to
    output                     [3:0] cmprs_buf_we,             // @!mclk write buffer from memory, increment write
    output                   [255:0] cmprs_buf_din,            // data out 
    output                     [3:0] cmprs_page_ready,         // single mclk (posedge)
    input                      [3:0] cmprs_next_page,          // single mclk (posedge): Done with the page in the  buffer, memory controller may read more data 
    output reg                 [3:0] cmprs_first_rd_in_frame,  // single mclk pulse on first read block in each frame

    // master (sensor) with slave (compressor) synchronization I/Os
    input                      [3:0] cmprs_frame_start_dst,    // @mclk - trigger receive (tiledc) memory channel (it will take care of single/repetitive
                                                               // these output either follows vsync_late (reclocks it) or generated in non-bonded mode
                                                               // (compress from memory)
    output                     [3:0] cmprs_frame_start_conf,   // @mclk lags by 1 from cmprs_frame_start_dst, more if there are outstanding memory transactions
    output [4*FRAME_HEIGHT_BITS-1:0] cmprs_line_unfinished_src,// number of the current (unfinished ) line, in the source (sensor) channel (RELATIVE TO FRAME, NOT WINDOW?)
    output   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_src,   // current frame number (for multi-frame ranges) in the source (sensor) channel
    output                     [3:0] cmprs_frame_done_src,     // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory 
                                                               // frame_done_src is later than line_unfinished_src/ frame_number_src changes
                                                               // Used withe a single-frame buffers
    output [4*FRAME_HEIGHT_BITS-1:0] cmprs_line_unfinished_dst,// number of the current (unfinished ) line in this (compressor) channel
    output   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_dst,   // current frame number (for multi-frame ranges) in this (compressor channel
    output                     [3:0] cmprs_frames_in_sync,           // cmprs_frame_number_dst is valid (in bonded mode) 
    
    output                     [3:0] cmprs_frame_done_dst,     // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
                                                               // use as 'eot_real' in 353 
    input                      [3:0] cmprs_suspend,            // suspend reading data for this channel - waiting for the source data
//    input                      [3:0] master_follow,            // compressor memory frame should follow that of the sensor channel, instead of reset
// TODO: move line_unfinished and suspend to internals of this module (and control comparator modes)
    // Channel 1 - AFI read/write to system memory with scanline linear mode
    input                          frame_start_chn1,   // resets page, x,y, and initiates transfer requests (in write mode will wait for next_page)
    input                          next_page_chn1,     // page was read/written from/to 4*1kB on-chip buffer
    output                         cmd_wrmem_chn1,     // channel1 in write mode
    output                         page_ready_chn1,    // == xfer_done, connect externally | Single-cycle pulse indicating that a page was read/written from/to DDR3 memory
    output                         frame_done_chn1,    // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
// optional I/O for channel synchronization
    output [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn1, // number of the current (unfinished ) line, RELATIVE TO FRAME, NOT WINDOW?. 
    input                          suspend_chn1,       // suspend transfers (from external line number comparator)

    // chn1 buffer interface, DDR3 memory read
    output                         xfer_reset_page1_rd, // input
    output                         buf_wpage_nxt_chn1,     // input
    output                         buf_wr_chn1, // input
    output                  [63:0] buf_wdata_chn1,

    // chn1 buffer interface, DDR3 memory write
    output                         xfer_reset_page1_wr, // input  @ posedge mclk
    output                         rpage_nxt_chn1,
    output                         buf_rd_chn1,
    input                  [63:0]  buf_rdata_chn1, 

// Channels 2 and 3 control signals
    input                          frame_start_chn2,   // resets page, x,y, and initiates transfer requests (in write mode will wait for next_page)
    input                          next_page_chn2,     // page was read/written from/to 4*1kB on-chip buffer
    output                         page_ready_chn2,    // == xfer_done, connect externally | Single-cycle pulse indicating that a page was read/written from/to DDR3 memory
    output                         frame_done_chn2,    // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
// optional I/O for channel synchronization
    output [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn2, // number of the current (unfinished ) line, RELATIVE TO FRAME, NOT WINDOW?.
    output [LAST_FRAME_BITS-1:0]   frame_number_chn2,  // current frame number (for multi-frame ranges)                        
    input                          suspend_chn2,       // suspend transfers (from external line number comparator)

    input                          frame_start_chn3,   // resets page, x,y, and initiates transfer requests (in write mode will wait for next_page)
    input                          next_page_chn3,     // page was read/written from/to 4*1kB on-chip buffer
    output                         page_ready_chn3,    // == xfer_done, connect externally | Single-cycle pulse indicating that a page was read/written from/to DDR3 memory
    output                         frame_done_chn3,    // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
// optional I/O for channel synchronization
    output [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn3, // number of the current (unfinished ) line, RELATIVE TO FRAME, NOT WINDOW?. 
    output [LAST_FRAME_BITS-1:0]   frame_number_chn3,  // current frame number (for multi-frame ranges)                        
    input                          suspend_chn3,       // suspend transfers (from external line number comparator)
// Channel 4 (tiled read)
    input                          frame_start_chn4,   // resets page, x,y, and initiates transfer requests (in write mode will wait for next_page)
    input                          next_page_chn4,     // page was read/written from/to 4*1kB on-chip buffer
    output                         page_ready_chn4,    // == xfer_done, connect externally | Single-cycle pulse indicating that a page was read/written from/to DDR3 memory
    output                         frame_done_chn4,    // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
// optional I/O for channel synchronization
    output [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn4, // number of the current (unfinished ) line, RELATIVE TO FRAME, NOT WINDOW?. 
    output [LAST_FRAME_BITS-1:0]   frame_number_chn4,  // current frame number (for multi-frame ranges)                        
    input                          suspend_chn4,       // suspend transfers (from external line number comparator)






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
    inout                        NDQSU //,
       
    ,output                [11:0] tmp_debug // add some signals generated here?
);
    localparam COL_WDTH = COLADDR_NUMBER-3; // number of column address bits in bursts
    localparam FRAME_WBP1 = FRAME_WIDTH_BITS + 1;

// Interface to channels to read/write memory (including 4 page BRAM buffers)

    wire        want_rq0;
    wire        need_rq0;
    wire        channel_pgm_en0;
    wire        reject0 = 1'b0; 
    wire  [9:0] seq_data0; // only 10 bits used
//    wire        seq_wr0; // not used
    wire        seq_set0;
    wire        seq_done0;
    wire        buf_wr_chn0;
    wire        buf_wpage_nxt_chn0;
    wire        buf_run0;
    wire [63:0] buf_wdata_chn0;
    wire        buf_wrun0;
    wire        buf_rd_chn0;
    wire        buf_rpage_nxt_chn0;
    wire [63:0] buf_rdata_chn0;

    wire        want_rq1;
    wire        need_rq1;
    wire        channel_pgm_en1; 
    wire        reject1; // = 1'b0; 
    wire        seq_done1;
// routed outside to membredge module    
/*
    wire        buf_wr_chn1;
    wire        buf_wpage_nxt_chn1;
    wire [63:0] buf_wdata_chn1;
    wire        buf_rd_chn1;
    wire        rpage_nxt_chn1;
    wire [63:0] buf_rdata_chn1;
*/
    wire        want_rq2;
    wire        need_rq2;
    wire        channel_pgm_en2; 
    wire        reject2 = 1'b0; 
    wire        seq_done2;
    wire        buf_wr_chn2;
    wire        buf_wpage_nxt_chn2;
    wire [63:0] buf_wdata_chn2;
    wire        buf_rd_chn2;
    wire        rpage_nxt_chn2;
    wire [63:0] buf_rdata_chn2;

    wire        want_rq3;
    wire        need_rq3;
    wire        channel_pgm_en3; 
    wire        reject3; // = 1'b0; 
    wire        seq_done3;
    wire        buf_wr_chn3;
    wire        buf_wpage_nxt_chn3;
    wire [63:0] buf_wdata_chn3;
    wire        buf_rd_chn3;
    wire        rpage_nxt_chn3;
    wire [63:0] buf_rdata_chn3;

    wire        want_rq4;
    wire        need_rq4;
    wire        channel_pgm_en4;
    wire        reject4 = 1'b0; 
    wire        seq_done4;
    wire        buf_wr_chn4;
    wire        buf_wpage_nxt_chn4;
    wire [63:0] buf_wdata_chn4;
    wire        buf_rd_chn4;
    wire        rpage_nxt_chn4;
    wire [63:0] buf_rdata_chn4;


     

    // Command tree - insert register layer if needed
    wire [7:0] cmd_mcontr_ad;
    wire       cmd_mcontr_stb;
    wire [7:0] cmd_ps_pio_ad;
    wire       cmd_ps_pio_stb;
    wire [7:0] cmd_scanline_chn1_ad;
    wire       cmd_scanline_chn1_stb;
    wire [7:0] cmd_scanline_chn3_ad;
    wire       cmd_scanline_chn3_stb;
    wire [7:0] cmd_tiled_chn2_ad;
    wire       cmd_tiled_chn2_stb;
    
    wire [7:0] cmd_tiled_chn4_ad;
    wire       cmd_tiled_chn4_stb;

    wire [7:0] cmd_sens_ad;
    wire       cmd_sens_stb;

    wire [7:0] cmd_cmprs_ad;
    wire       cmd_cmprs_stb;

// Status tree:
    wire                  [7:0] status_mcontr_ad;    // Memory controller status byte-wide address/data 
    wire                        status_mcontr_rq;    // Memory controller status request  
    wire                        status_mcontr_start; // Memory controller status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_ps_pio_ad;    // PS PIO channels status byte-wide address/data 
    wire                        status_ps_pio_rq;    // PS PIO channels status request  
    wire                        status_ps_pio_start; // PS PIO channels status packet transfer start (currently with 0 latency from status_root_rq)
    
    wire                  [7:0] status_scanline_chn1_ad;    // PL scanline channel1 (memory read) status byte-wide address/data 
    wire                        status_scanline_chn1_rq;    // PL scanline channel1 (memory read) channels status request  
    wire                        status_scanline_chn1_start; // PL scanline channel1 (memory read) channels status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_scanline_chn3_ad;    // PL scanline channel3 (memory read) status byte-wide address/data 
    wire                        status_scanline_chn3_rq;    // PL scanline channel3 (memory read) channels status request  
    wire                        status_scanline_chn3_start; // PL scanline channel3 (memory read) channels status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_tiled_chn2_ad;    // PL tiled channel2 (memory read) status byte-wide address/data 
    wire                        status_tiled_chn2_rq;    // PL tiled channel2 (memory read) channels status request  
    wire                        status_tiled_chn2_start; // PL tiled channel2 (memory read) channels status packet transfer start (currently with 0 latency from status_root_rq)

    wire                  [7:0] status_tiled_chn4_ad;    // PL tiled channel4 (memory read) status byte-wide address/data 
    wire                        status_tiled_chn4_rq;    // PL tiled channel4 (memory read) channels status request  
    wire                        status_tiled_chn4_start; // PL tiled channel4 (memory read) channels status packet transfer start (currently with 0 latency from status_root_rq)

 // status control for scanline sensor access, 4 channels
    wire                 [31:0] status_sens_ad; 
    wire                  [3:0] status_sens_rq;  
    wire                  [3:0] status_sens_start;


 // status control for tiled compressor access, 4 channels
    wire                 [31:0] status_cmprs_ad; 
    wire                  [3:0] status_cmprs_rq;  
    wire                  [3:0] status_cmprs_start;

// Sensor and compressor signals
    wire                   [3:0] sens_frame_set; // sensor memory controller has just set frame number (slave can use to sync)
    wire                   [3:0] sens_want;
    wire                   [3:0] sens_need;
    wire                   [3:0] cmprs_want;
    wire                   [3:0] cmprs_need;

    wire                   [3:0] sens_channel_pgm_en;
    wire                   [3:0] sens_reject; 
    wire                   [3:0] sens_start_wr;
    wire                  [11:0] sens_bank;   // output[2:0] 
    wire  [4*ADDRESS_NUMBER-1:0] sens_row;    // output[14:0] 
    wire        [4*COL_WDTH-1:0] sens_col;    // output[6:0] 
    wire               [4*6-1:0] sens_num128; // output[5:0]
    wire                   [3:0] sens_partial; // output
    wire                   [3:0] sens_seq_done; // input : sequence over

    wire                   [3:0] cmprs_channel_pgm_en;
    wire                   [3:0] cmprs_reject = 4'h0; 
    wire                   [3:0] cmprs_start_rdlin;
    wire                   [3:0] cmprs_start_rd16;
    wire                   [3:0] cmprs_start_rd32;
    wire                  [11:0] cmprs_bank;   // output[2:0] 
    wire  [4*ADDRESS_NUMBER-1:0] cmprs_row;    // output[14:0] 
    wire        [4*COL_WDTH-1:0] cmprs_col;    // output[6:0] 
    wire      [4*FRAME_WBP1-1:0] cmprs_rowcol_inc;  // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire  [4*MAX_TILE_WIDTH-1:0] cmprs_num_rows_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire [4*MAX_TILE_HEIGHT-1:0] cmprs_num_cols_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                   [3:0] cmprs_keep_open;   // start generating commands
    wire               [4*6-1:0] cmprs_num128; // output[5:0]
    wire                   [3:0] cmprs_partial; // output
    wire                   [3:0] cmprs_seq_done; // input : sequence over
//    assign cmprs_page_ready = cmprs_seq_done;// mcntrl_tiled_rw does not generate page_ready pulse as it is the same as xfer_done input

// combinatorial early signals
    wire                         select_cmd0_w;
    wire                         select_buf0rd_w;
    wire                         select_buf0wr_w;
//    wire                         select_buf1rd_w;  // not used - replaced with membridge
//    wire                         select_buf1wr_w;  // not used - replaced with membridge
    wire                         select_buf2rd_w;
    wire                         select_buf2wr_w;
    wire                         select_buf3rd_w;
    wire                         select_buf3wr_w;
    wire                         select_buf4rd_w;
    wire                         select_buf4wr_w;
// registered selects
    reg                         select_cmd0;
    reg                         select_buf0rd;
    reg                         select_buf0wr;
//    reg                         select_buf1rd;  // not used - replaced with membridge
//    reg                         select_buf1wr;  // not used - replaced with membridge
    reg                         select_buf2rd;
    reg                         select_buf2wr;
    reg                         select_buf3rd;
    reg                         select_buf3wr;
    reg                         select_buf4rd;
    reg                         select_buf4wr;

    reg                         select_buf0rd_d; // delayed by 1 clock, for combining with regen?
//    reg                         select_buf1rd_d;  // not used - replaced with membridge
    reg                         select_buf2rd_d;
    reg                         select_buf3rd_d;
    reg                         select_buf4rd_d;

    reg                         axird_selected_r; // this module provides output
    
// Buffers R/W from AXI
    reg   [BUFFER_DEPTH32-1:0]  buf_waddr;
    reg                 [31:0]  buf_wdata;
    reg                         cmd_we;
    reg                         buf0wr_we;
//    reg                         buf1wr_we; // not used - replaced with membridge
    reg                         buf2wr_we;
    reg                         buf3wr_we;
    reg                         buf4wr_we;
    wire  [BUFFER_DEPTH32-1:0]  buf_raddr;
    
    wire                [31:0]  buf0_data;
//    wire                [31:0]  buf1rd_data; // not used - replaced with membridge
    wire                [31:0]  buf2rd_data;
    wire                [31:0]  buf3rd_data;
    wire                [31:0]  buf4rd_data;
    
    wire                        buf0_rd;
    wire                        buf0_regen;
//    wire                        buf1rd_rd; // not used - replaced with membridge
//    wire                        buf1rd_regen; // not used - replaced with membridge
    wire                        buf2rd_rd;
    wire                        buf2rd_regen;
    wire                        buf3rd_rd;
    wire                        buf3rd_regen;
    wire                        buf4rd_rd;
    wire                        buf4rd_regen;

// common for channels 1 and 3
    wire                  [2:0] lin_rw_bank;     // memory bank
    wire   [ADDRESS_NUMBER-1:0] lin_rw_row;      // memory row
    wire         [COL_WDTH-1:0] lin_rw_col;      // start memory column in 8-bursts
    wire                  [5:0] lin_rw_num128;   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        lin_rw_xfer_partial; // do not increment page in the end, continue current
    wire                        lin_rw_start_rd;    // start generating commands for read sequence
    wire                        lin_rw_start_wr;    // start generating commands for write sequence

    wire                  [2:0] lin_rw_chn1_bank;   // bank address
    wire   [ADDRESS_NUMBER-1:0] lin_rw_chn1_row;    // memory row
    wire         [COL_WDTH-1:0] lin_rw_chn1_col;    // start memory column in 8-bursts
    wire                  [5:0] lin_rw_chn1_num128; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        lin_rw_chn1_partial;  // do not increment page in the end, continue current
    wire                        lin_rw_chn1_start_rd;  // start generating commands
    wire                        lin_rw_chn1_start_wr;  // start generating commands
//    wire                        xfer_reset_page1_wr;   // not used - replaced with membridge
//    wire                        xfer_reset_page1_rd;    // not used - replaced with membridge
    
    wire                  [2:0] lin_rw_chn3_bank;   // bank address
    wire   [ADDRESS_NUMBER-1:0] lin_rw_chn3_row;    // memory row
    wire         [COL_WDTH-1:0] lin_rw_chn3_col;    // start memory column in 8-bursts
    wire                  [5:0] lin_rw_chn3_num128; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        lin_rw_chn3_partial; // do not increment page in the end, continue current
    wire                        lin_rw_chn3_start_rd;  // start generating commands
    wire                        lin_rw_chn3_start_wr;  // start generating commands
    wire                        xfer_reset_page3_wr;         // "internal" buffer page reset, @posedge mclk
    wire                        xfer_reset_page3_rd;         // "internal" buffer page reset, @negedge mclk

// common for tiled r/w - channels 2 and 4
    wire                  [2:0] tiled_rw_bank;   // bank address
    wire   [ADDRESS_NUMBER-1:0] tiled_rw_row;    // memory row
    wire         [COL_WDTH-1:0] tiled_rw_col;    // start memory column in 8-bursts
    wire   [FRAME_WIDTH_BITS:0] tiled_rw_rowcol_inc; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire   [MAX_TILE_WIDTH-1:0] tiled_rw_num_rows_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire  [MAX_TILE_HEIGHT-1:0] tiled_rw_num_cols_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        tiled_rw_keep_open;  // start generating commands
    wire                        tiled_rw_xfer_partial;  // start generating commands

    wire                  [2:0] tiled_rw_chn2_bank;   // bank address
    wire   [ADDRESS_NUMBER-1:0] tiled_rw_chn2_row;    // memory row
    wire         [COL_WDTH-1:0] tiled_rw_chn2_col;    // start memory column in 8-bursts
    wire   [FRAME_WIDTH_BITS:0] tiled_rw_chn2_rowcol_inc; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire   [MAX_TILE_WIDTH-1:0] tiled_rw_chn2_num_rows_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire  [MAX_TILE_HEIGHT-1:0] tiled_rw_chn2_num_cols_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        tiled_rw_chn2_keep_open;  // start generating commands
    wire                        tiled_rw_chn2_xfer_partial;  // start generating commands
    wire                        tiled_rw_chn2_start_rd16;  // start generating commands, read,  16-byte column tiles 
    wire                        tiled_rw_chn2_start_wr16;  // start generating commands, write, 16-byte column tiles

    wire                        tiled_rw_chn2_start_rd32;  // start generating commands, read,  32-byte column tiles
    wire                        tiled_rw_chn2_start_wr32;  // start generating commands, write, 32-byte column tiles
    
    wire                        xfer_reset_page2_wr;         // "internal" buffer page reset, @posedge mclk
    wire                        xfer_reset_page2_rd;         // "internal" buffer page reset, @negedge mclk

    wire                  [2:0] tiled_rw_chn4_bank;   // bank address
    wire   [ADDRESS_NUMBER-1:0] tiled_rw_chn4_row;    // memory row
    wire         [COL_WDTH-1:0] tiled_rw_chn4_col;    // start memory column in 8-bursts
    wire   [FRAME_WIDTH_BITS:0] tiled_rw_chn4_rowcol_inc; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire   [MAX_TILE_WIDTH-1:0] tiled_rw_chn4_num_rows_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire  [MAX_TILE_HEIGHT-1:0] tiled_rw_chn4_num_cols_m1; // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                        tiled_rw_chn4_keep_open;  // start generating commands
    wire                        tiled_rw_chn4_xfer_partial;  // start generating commands
    wire                        tiled_rw_chn4_start_rd16;  // start generating commands
    wire                        tiled_rw_chn4_start_wr16;  // start generating commands
    wire                        tiled_rw_chn4_start_rd32;  // start generating commands
    wire                        tiled_rw_chn4_start_wr32;  // start generating commands
    wire                        xfer_reset_page4_wr;         // "internal" buffer page reset, @posedge mclk
    wire                        xfer_reset_page4_rd;         // "internal" buffer page reset, @negedge mclk

  
  //====================== new signals ==============================
    wire                 [31:0] seq_data; // combine data to be written to the memory controller sequencer 
    wire                        seq_wr;   // strobe to write seq_data
    wire                        seq_set;  // finalize write to command sequencer (or PS data address if no seq_wr was present
 
        // from encod_linear_rw
    wire                        encod_linear_start_out; // pulse before encod_linear_rw outputs any data
    wire                 [31:0] encod_linear_cmd; // command sequencer data
    wire                        encod_linear_wr;  // command sequencer data strobe
    wire                        encod_linear_done;// end of command sequnece
        // from encod_tiled_rw
    wire                        encod_tiled16_start_out; // pulse before encod_tiled_rw outputs any data
    wire                 [31:0] encod_tiled16_cmd; 
    wire                        encod_tiled16_wr;
    wire                        encod_tiled16_done;
        // from encod_tiled_32_rw
    wire                        encod_tiled32_start_out; // pulse before encod_tiled_32_rw outputs any data
    wire                 [31:0] encod_tiled32_cmd; 
    wire                        encod_tiled32_wr;
    wire                        encod_tiled32_done;
 
    wire                        tiled_rw_start_rd16; // start cmd_encod_tiled_32_rw generating command sequence in read mode
    wire                        tiled_rw_start_wr16; // start cmd_encod_tiled_32_rw generating command sequence in write mode
    wire                        tiled_rw_start_rd32; // start cmd_encod_tiled_32_rw generating command sequence in read mode
    wire                        tiled_rw_start_wr32; // start cmd_encod_tiled_32_rw generating command sequence in write mode
    // for propagating absolute frame number:
    reg                   [3:0] sens_first_wr_pending_r;
    reg                   [3:0] cmprs_first_rd_pending_r;
     

    // Command tree - insert register layer(s) if needed, now just direct assignments
    assign cmd_mcontr_ad=        cmd_ad;
    assign cmd_mcontr_stb=       cmd_stb;
    assign cmd_ps_pio_ad=        cmd_ad;
    assign cmd_ps_pio_stb=       cmd_stb;
    assign cmd_scanline_chn1_ad= cmd_ad;
    assign cmd_scanline_chn1_stb=cmd_stb;
    assign cmd_scanline_chn3_ad= cmd_ad;
    assign cmd_scanline_chn3_stb=cmd_stb;
    assign cmd_tiled_chn2_ad=    cmd_ad;
    assign cmd_tiled_chn2_stb=   cmd_stb;
    assign cmd_tiled_chn4_ad=    cmd_ad;
    assign cmd_tiled_chn4_stb=   cmd_stb;

    assign cmd_sens_ad=    cmd_ad;
    assign cmd_sens_stb=   cmd_stb;
    assign cmd_cmprs_ad=    cmd_ad;
    assign cmd_cmprs_stb=   cmd_stb;
    
// For now - combinatorial, maybe add registers (modify axibram_read)
    assign buf_raddr=axird_raddr;    
    assign axird_rdata = (select_buf0rd ? buf0_data :   32'b0) |
//                         (select_buf1rd ? buf1rd_data : 32'b0) |  // not used - replaced with membridge
                         (select_buf2rd ? buf2rd_data : 32'b0) |
                         (select_buf3rd ? buf3rd_data : 32'b0) |
                         (select_buf4rd ? buf4rd_data : 32'b0); 
    
    assign buf0_rd=      axird_ren   && select_buf0rd;
    assign buf0_regen=   axird_regen && select_buf0rd_d;
//    assign buf1rd_rd=    axird_ren   && select_buf1rd;    // not used - replaced with membridge
//    assign buf1rd_regen= axird_regen && select_buf1rd_d;  // not used - replaced with membridge
    assign buf2rd_rd=    axird_ren   && select_buf2rd;
    assign buf2rd_regen= axird_regen && select_buf2rd_d;
    assign buf3rd_rd=    axird_ren   && select_buf3rd;
    assign buf3rd_regen= axird_regen && select_buf3rd_d;
    assign buf4rd_rd=    axird_ren   && select_buf4rd;
    assign buf4rd_regen= axird_regen && select_buf4rd_d;
    
    assign axird_selected=axird_selected_r;
    assign select_cmd0_w = ((axiwr_pre_awaddr ^ MCONTR_CMD_WR_ADDR) & MCONTR_WR_MASK)==0;
    assign select_buf0rd_w = ((axird_pre_araddr ^ MCONTR_BUF0_RD_ADDR) & MCONTR_RD_MASK)==0;
    assign select_buf0wr_w = ((axiwr_pre_awaddr ^ MCONTR_BUF0_WR_ADDR) & MCONTR_WR_MASK)==0;
    assign select_buf2rd_w = ((axird_pre_araddr ^ MCONTR_BUF2_RD_ADDR) & MCONTR_RD_MASK)==0;
    assign select_buf2wr_w = ((axiwr_pre_awaddr ^ MCONTR_BUF2_WR_ADDR) & MCONTR_WR_MASK)==0;
    assign select_buf3rd_w = ((axird_pre_araddr ^ MCONTR_BUF3_RD_ADDR) & MCONTR_RD_MASK)==0;
    assign select_buf3wr_w = ((axiwr_pre_awaddr ^ MCONTR_BUF3_WR_ADDR) & MCONTR_WR_MASK)==0;
    assign select_buf4rd_w = ((axird_pre_araddr ^ MCONTR_BUF4_RD_ADDR) & MCONTR_RD_MASK)==0;
    assign select_buf4wr_w = ((axiwr_pre_awaddr ^ MCONTR_BUF4_WR_ADDR) & MCONTR_WR_MASK)==0;
    
    always @ (posedge mclk) begin
        if (mrst) sens_first_wr_pending_r <= 0;
        else      sens_first_wr_pending_r <= sens_sof | (sens_first_wr_pending_r & ~sens_start_wr);

//cmprs_first_rd_pending_r        
        sens_first_wr_in_frame <= sens_first_wr_pending_r & sens_start_wr;

        if (mrst) cmprs_first_rd_pending_r <= 0;
        else      cmprs_first_rd_pending_r <= cmprs_frame_start_dst | (cmprs_first_rd_pending_r & ~cmprs_channel_pgm_en);

        cmprs_first_rd_in_frame <= cmprs_first_rd_pending_r & cmprs_channel_pgm_en;
    end

    always @ (posedge axi_clk) begin
        if      (mrst)              select_cmd0 <= 0;
        else if (axiwr_start_burst) select_cmd0 <= select_cmd0_w;
        
        if      (mrst)              select_buf0rd <= 0;
        else if (axird_start_burst) select_buf0rd <= select_buf0rd_w;
        
        if      (mrst)              select_buf0wr <= 0;
        else if (axiwr_start_burst) select_buf0wr <= select_buf0wr_w;

        if      (mrst)              select_buf2rd <= 0;
        else if (axird_start_burst) select_buf2rd <= select_buf2rd_w;
        if      (mrst)              select_buf2wr <= 0;
        else if (axiwr_start_burst) select_buf2wr <= select_buf2wr_w;

        if      (mrst)              select_buf3rd <= 0;
        else if (axird_start_burst) select_buf3rd <= select_buf3rd_w;
        if      (mrst)              select_buf3wr <= 0;
        else if (axiwr_start_burst) select_buf3wr <= select_buf3wr_w;

        if      (mrst)              select_buf4rd <= 0;
        else if (axird_start_burst) select_buf4rd <= select_buf4rd_w;
        if      (mrst)              select_buf4wr <= 0;
        else if (axiwr_start_burst) select_buf4wr <= select_buf4wr_w;


        if      (mrst)              axird_selected_r <= 0;
        else if (axird_start_burst) axird_selected_r <= select_buf0rd_w || //select_buf1rd_w ||  // not used - replaced with membridge
                                                        select_buf2rd_w  || select_buf3rd_w || select_buf4rd_w;
    end
    always @ (posedge axi_clk) begin
        if (axiwr_wen) buf_wdata  <= axiwr_data;
        if (axiwr_wen) buf_waddr <= axiwr_waddr;
        cmd_we <=  axiwr_wen && select_cmd0;
        buf0wr_we <= axiwr_wen && select_buf0wr;
//        buf1wr_we <= axiwr_wen && select_buf1wr;  // not used - replaced with membridge
        buf2wr_we <= axiwr_wen && select_buf2wr;
        buf3wr_we <= axiwr_wen && select_buf3wr;
        buf4wr_we <= axiwr_wen && select_buf4wr;
        
        select_buf0rd_d <= select_buf0rd;
//        select_buf1rd_d <= select_buf1rd;  // not used - replaced with membridge
        select_buf2rd_d <= select_buf2rd;
        select_buf3rd_d <= select_buf3rd;
        select_buf4rd_d <= select_buf4rd;
    end
   //axiwr_waddr 
    status_router16 status_router16_mctrl_top_i (
        .rst       (1'b0),                         // input
        .clk       (mclk),                         // input
        .srst      (mrst),                         // input
        .db_in0    (status_mcontr_ad),             // input[7:0] 
        .rq_in0    (status_mcontr_rq),             // input
        .start_in0 (status_mcontr_start),          // output
        .db_in1    (status_ps_pio_ad),             // input[7:0] 
        .rq_in1    (status_ps_pio_rq),             // input
        .start_in1 (status_ps_pio_start),          // output
        .db_in2    (status_scanline_chn1_ad),      // input[7:0] 
        .rq_in2    (status_scanline_chn1_rq),      // input
        .start_in2 (status_scanline_chn1_start),   // output
        .db_in3    (status_scanline_chn3_ad),      // input[7:0] 
        .rq_in3    (status_scanline_chn3_rq),      // input
        .start_in3 (status_scanline_chn3_start),   // output
        .db_in4    (status_tiled_chn2_ad),         // input[7:0] 
        .rq_in4    (status_tiled_chn2_rq),         // input
        .start_in4 (status_tiled_chn2_start),      // output
        .db_in5    (status_tiled_chn4_ad),         // input[7:0] 
        .rq_in5    (status_tiled_chn4_rq),         // input
        .start_in5 (status_tiled_chn4_start),      // output
        // spare
        .db_in6    (8'b0), // input[7:0] 
        .rq_in6    (1'b0), // input
        .start_in6 (), // output
        .db_in7    (8'b0), // input[7:0] 
        .rq_in7    (1'b0), // input
        .start_in7 (), // output
        
        .db_in8     (status_sens_ad[0 * 8 +: 8]),  // input[7:0] 
        .rq_in8     (status_sens_rq[0]),           // input
        .start_in8  (status_sens_start[0]),        // output
        .db_in9     (status_sens_ad[1 * 8 +: 8]),  // input[7:0] 
        .rq_in9     (status_sens_rq[1]),           // input
        .start_in9  (status_sens_start[1]),        // output
        .db_in10    (status_sens_ad[2 * 8 +: 8]),  // input[7:0] 
        .rq_in10    (status_sens_rq[2]),           // input
        .start_in10 (status_sens_start[2]),        // output
        .db_in11    (status_sens_ad[3 * 8 +: 8]),  // input[7:0] 
        .rq_in11    (status_sens_rq[3]),           // input
        .start_in11 (status_sens_start[3]),        // output
        .db_in12    (status_cmprs_ad[0 * 8 +: 8]), // input[7:0] 
        .rq_in12    (status_cmprs_rq[0]),          // input
        .start_in12 (status_cmprs_start[0]),       // output
        .db_in13    (status_cmprs_ad[1 * 8 +: 8]), // input[7:0] 
        .rq_in13    (status_cmprs_rq[1]),          // input
        .start_in13 (status_cmprs_start[1]),       // output
        .db_in14    (status_cmprs_ad[2 * 8 +: 8]), // input[7:0] 
        .rq_in14    (status_cmprs_rq[2]),          // input
        .start_in14 (status_cmprs_start[2]),       // output
        .db_in15    (status_cmprs_ad[3 * 8 +: 8]), // input[7:0] 
        .rq_in15    (status_cmprs_rq[3]),          // input
        .start_in15 (status_cmprs_start[3]),       // output
        
        .db_out    (status_ad), // output[7:0] 
        .rq_out    (status_rq), // output
        .start_out (status_start) // input
    );


// with external defines, does not search module definition when creating closure for iverilog
// TODO: fix

//
// Port memory buffer (4 pages each, R/W fixed, port 0 - AXI read from DDR, port 1 - AXI write to DDR
// Routing out to membridge module
/*
// Port 1rd (read DDR to AXI) buffer, linear
    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(5)
    ) chn1rd_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_raddr    (buf_raddr), // input[9:0] 
        .ext_rd       (buf1rd_rd), // input
        .ext_regen    (buf1rd_regen), // input
        .ext_data_out (buf1rd_data), // output[31:0] 
        .wclk         (!mclk), // input
        .wpage_in     (2'b0), // input[1:0] 
        .wpage_set    (xfer_reset_page1_rd), // input  TODO: Generate @ negedge mclk on frame start
        .page_next    (buf_wpage_nxt_chn1), // input
        .page         (), // output[1:0]
        .we           (buf_wr_chn1), // input
        .data_in      (buf_wdata_chn1) // input[63:0] 
    );

// Port 1wr (write DDR from AXI) buffer, linear
    mcntrl_buf_wr #(
         .LOG2WIDTH_WR(5)
    ) chn1wr_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_waddr    (buf_waddr), // input[9:0] 
        .ext_we       (buf1wr_we), // input
        .ext_data_in  (buf_wdata), // input[31:0] buf_wdata - from AXI
        .rclk         (mclk), // input
        .rpage_in     (2'b0), // input[1:0] 
        .rpage_set    (xfer_reset_page1_wr), // input  @ posedge mclk
        .page_next    (rpage_nxt_chn1), // input
        .page         (), // output[1:0]
        .rd           (buf_rd_chn1), // input
        .data_out     (buf_rdata_chn1) // output[63:0] 
    );
*/
// Port 2rd (read DDR to AXI) buffer, tiled
    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(5)
    ) chn2rd_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_raddr    (buf_raddr), // input[9:0] 
        .ext_rd       (buf2rd_rd), // input
        .ext_regen    (buf2rd_regen), // input
        .ext_data_out (buf2rd_data), // output[31:0] 
//        .emul64       (1'b0),                           // input Modify buffer addresses (used for JP4 until a 64-wide mode is implemented)
        .wclk         (!mclk), // input
        .wpage_in     (2'b0), // input[1:0] 
        .wpage_set    (xfer_reset_page2_rd), // input  TODO: Generate @ negedge mclk on frame start
        .page_next    (buf_wpage_nxt_chn2), // input
        .page         (), // output[1:0]
        .we           (buf_wr_chn2), // input
        .data_in      (buf_wdata_chn2) // input[63:0] 
    );

// Port 2wr (write DDR from AXI) buffer, tiled
    mcntrl_buf_wr #(
         .LOG2WIDTH_WR(5)
    ) chn2wr_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_waddr    (buf_waddr), // input[9:0] 
        .ext_we       (buf2wr_we), // input
        .ext_data_in  (buf_wdata), // input[31:0] buf_wdata - from AXI
        .rclk         (mclk), // input
        .rpage_in     (2'b0), // input[1:0] 
        .rpage_set    (xfer_reset_page2_wr), // input @ posedge mclk
        .page_next    (rpage_nxt_chn2), // input
        .page         (), // output[1:0]
        .rd           (buf_rd_chn2), // input
        .data_out     (buf_rdata_chn2) // output[63:0] 
    );
//-----------
// Port 3rd (read DDR to AXI) buffer, linear
    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(5)
    ) chn3rd_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_raddr    (buf_raddr), // input[9:0] 
        .ext_rd       (buf3rd_rd), // input
        .ext_regen    (buf3rd_regen), // input
        .ext_data_out (buf3rd_data), // output[31:0] 
//        .emul64       (1'b0),                // input Modify buffer addresses (used for JP4 until a 64-wide mode is implemented)
        .wclk         (!mclk), // input
        .wpage_in     (2'b0), // input[1:0] 
        .wpage_set    (xfer_reset_page3_rd), // input @ negedge mclk
        .page_next    (buf_wpage_nxt_chn3), // input
        .page         (), // output[1:0]
        .we           (buf_wr_chn3), // input
        .data_in      (buf_wdata_chn3) // input[63:0] 
    );

// Port 3wr (write DDR from AXI) buffer, linear
    mcntrl_buf_wr #(
        .LOG2WIDTH_WR(5)
    ) chn3wr_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_waddr    (buf_waddr), // input[9:0] 
        .ext_we       (buf3wr_we), // input
        .ext_data_in  (buf_wdata), // input[31:0] buf_wdata - from AXI
        .rclk         (mclk), // input
        .rpage_in     (2'b0), // input[1:0] 
        .rpage_set    (xfer_reset_page3_wr), // input  @ posedge mclk
        .page_next    (rpage_nxt_chn3), // input
        .page         (), // output[1:0]
        .rd           (buf_rd_chn3), // input
        .data_out     (buf_rdata_chn3) // output[63:0] 
    );

// Port 4rd (read DDR to AXI) buffer, tiled
    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(5)
    ) chn4rd_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_raddr    (buf_raddr), // input[9:0] 
        .ext_rd       (buf4rd_rd), // input
        .ext_regen    (buf4rd_regen), // input
        .ext_data_out (buf4rd_data), // output[31:0] 
//        .emul64       (1'b0),                // input Modify buffer addresses (used for JP4 until a 64-wide mode is implemented)
        .wclk         (!mclk), // input
        .wpage_in     (2'b0), // input[1:0] 
        .wpage_set    (xfer_reset_page4_rd), // input  @ negedge mclk
        .page_next    (buf_wpage_nxt_chn4), // input
        .page         (), // output[1:0]
        .we           (buf_wr_chn4), // input
        .data_in      (buf_wdata_chn4) // input[63:0] 
    );

// Port 4wr (write DDR from AXI) buffer, tiled
    mcntrl_buf_wr #(
        .LOG2WIDTH_WR(5)
    ) chn4wr_buf_i (
        .ext_clk      (axi_clk), // input
        .ext_waddr    (buf_waddr), // input[9:0] 
        .ext_we       (buf4wr_we), // input
        .ext_data_in  (buf_wdata), // input[31:0] buf_wdata - from AXI
        .rclk         (mclk), // input
        .rpage_in     (2'b0), // input[1:0] 
        .rpage_set    (xfer_reset_page4_wr), // input  @ posedge mclk 
        .page_next    (rpage_nxt_chn4), // input
        .page         (), // output[1:0]
        .rd           (buf_rd_chn4), // input
        .data_out     (buf_rdata_chn4) // output[63:0] 
    );
    
    generate
        genvar i;
        for (i = 0; i < 4; i = i+1) begin:sens_comp_block
            mcntrl_linear_rw #(
                .ADDRESS_NUMBER                    (ADDRESS_NUMBER),
                .COLADDR_NUMBER                    (COLADDR_NUMBER),
                .NUM_XFER_BITS                     (NUM_XFER_BITS),
                .FRAME_WIDTH_BITS                  (FRAME_WIDTH_BITS),
                .FRAME_HEIGHT_BITS                 (FRAME_HEIGHT_BITS),
                .LAST_FRAME_BITS                   (LAST_FRAME_BITS),
                .MCNTRL_SCANLINE_ADDR              (MCONTR_SENS_BASE + MCONTR_SENS_INC * i),
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
                .MCNTRL_SCANLINE_STATUS_REG_ADDR   (MCONTR_SENS_STATUS_BASE + MCONTR_SENS_STATUS_INC * i),
                .MCNTRL_SCANLINE_PENDING_CNTR_BITS (MCNTRL_SCANLINE_PENDING_CNTR_BITS),
                .MCNTRL_SCANLINE_FRAME_PAGE_RESET  (MCNTRL_SCANLINE_FRAME_PAGE_RESET),
                .MCONTR_LINTILE_NRESET             (MCONTR_LINTILE_NRESET),
                .MCONTR_LINTILE_EN                 (MCONTR_LINTILE_EN),
                .MCONTR_LINTILE_WRITE              (MCONTR_LINTILE_WRITE),
                .MCONTR_LINTILE_EXTRAPG            (MCONTR_LINTILE_EXTRAPG),
                .MCONTR_LINTILE_EXTRAPG_BITS       (MCONTR_LINTILE_EXTRAPG_BITS),
                .MCONTR_LINTILE_RST_FRAME          (MCONTR_LINTILE_RST_FRAME),
                .MCONTR_LINTILE_SINGLE             (MCONTR_LINTILE_SINGLE),
                .MCONTR_LINTILE_REPEAT             (MCONTR_LINTILE_REPEAT),
                .MCONTR_LINTILE_DIS_NEED           (MCONTR_LINTILE_DIS_NEED),
                .MCONTR_LINTILE_SKIP_LATE          (MCONTR_LINTILE_SKIP_LATE),
                .MCONTR_LINTILE_ABORT_LATE         (MCONTR_LINTILE_ABORT_LATE),
                .MCNTRL_SCANLINE_DLY_WIDTH         (MCNTRL_SCANLINE_DLY_WIDTH),
                .MCNTRL_SCANLINE_DLY_DEFAULT       (MCNTRL_SCANLINE_DLY_DEFAULT)
            ) mcntrl_linear_wr_sensor_i (
                .mrst             (mrst),                       // input
                .mclk             (mclk),                       // input
                .cmd_ad           (cmd_sens_ad),                // input[7:0] 
                .cmd_stb          (cmd_sens_stb),               // input
                .status_ad        (status_sens_ad[i * 8 +: 8]), // output[7:0] 
                .status_rq        (status_sens_rq[i]),          // output
                .status_start     (status_sens_start[i]),       // input
                .frame_start      (sens_sof[i]),                // input
                .frame_run        (sens_frame_run[i]),          // output
                .next_page        (sens_page_written[i]) ,      // Sensor has written next buffer page (full or partial)
                .frame_done       (cmprs_frame_done_src[i]),    // output
                .frame_finished       (), // output
                .line_unfinished  (cmprs_line_unfinished_src[i * FRAME_HEIGHT_BITS +: FRAME_HEIGHT_BITS]), // output[15:0] 
                .suspend          (1'b0), // input
                .frame_number     (cmprs_frame_number_src[i * LAST_FRAME_BITS +: LAST_FRAME_BITS]), //output[15:0]
                .frame_set        (sens_frame_set[i]),          // output
                .xfer_want        (sens_want[i]),               // output
                .xfer_need        (sens_need[i]),               // output
                .xfer_grant       (sens_channel_pgm_en[i]),     // input
                .xfer_reject      (sens_reject[i]),             // output
                .xfer_start_rd    (),                           // output
                .xfer_start_wr    (sens_start_wr[i]),           // output
                .xfer_bank        (sens_bank[3 * i +: 3]),      // output[2:0] 
                .xfer_row         (sens_row[ADDRESS_NUMBER * i +: ADDRESS_NUMBER]), // output[14:0] 
                .xfer_col         (sens_col[COL_WDTH * i +: COL_WDTH]), // output[6:0] 
                .xfer_num128      (sens_num128[i * 6 +: 6]),    // output[5:0]
                .xfer_partial     (sens_partial[i]),            // output
                .xfer_done        (sens_seq_done[i]),           // input : page sequence over
                .xfer_page_rst_wr (sens_rpage_set[i]),          // output @ posedge mclk
                .xfer_page_rst_rd (), // output @ negedge mclk
                .xfer_skipped     (sens_xfer_skipped[i]),       // output reg
                .cmd_wrmem        () // output
`ifdef DEBUG_SENS_MEM_PAGES
                ,.dbg_rpage        (dbg_rpage[2*i +:2])         // input[1:0]   
                ,.dbg_wpage        (dbg_wpage[2*i +:2])         // input[1:0]   
`endif              
            );
            
            
               mcntrl_tiled_linear_rw #(
                .ADDRESS_NUMBER                (ADDRESS_NUMBER),
                .COLADDR_NUMBER                (COLADDR_NUMBER),
                .NUM_XFER_BITS                 (NUM_XFER_BITS),
                .FRAME_WIDTH_BITS              (FRAME_WIDTH_BITS),
                .FRAME_HEIGHT_BITS             (FRAME_HEIGHT_BITS),
                .MAX_TILE_WIDTH                (MAX_TILE_WIDTH),
                .MAX_TILE_HEIGHT               (MAX_TILE_HEIGHT),
                .LAST_FRAME_BITS               (LAST_FRAME_BITS),
                .MCNTRL_TILED_ADDR             (MCONTR_CMPRS_BASE + MCONTR_CMPRS_INC * i),
                .MCNTRL_TILED_MASK             (MCNTRL_TILED_MASK),
                .MCNTRL_TILED_MODE             (MCNTRL_TILED_MODE),
                .MCNTRL_TILED_STATUS_CNTRL     (MCNTRL_TILED_STATUS_CNTRL),
                .MCNTRL_TILED_STARTADDR        (MCNTRL_TILED_STARTADDR),
                .MCNTRL_TILED_FRAME_SIZE       (MCNTRL_TILED_FRAME_SIZE),
                .MCNTRL_TILED_FRAME_LAST       (MCNTRL_TILED_FRAME_LAST),
                .MCNTRL_TILED_FRAME_FULL_WIDTH (MCNTRL_TILED_FRAME_FULL_WIDTH),
                .MCNTRL_TILED_WINDOW_WH        (MCNTRL_TILED_WINDOW_WH),
                .MCNTRL_TILED_WINDOW_X0Y0      (MCNTRL_TILED_WINDOW_X0Y0),
                .MCNTRL_TILED_WINDOW_STARTXY   (MCNTRL_TILED_WINDOW_STARTXY),
                .MCNTRL_TILED_TILE_WHS         (MCNTRL_TILED_TILE_WHS),
                .MCNTRL_TILED_STATUS_REG_ADDR  (MCONTR_CMPRS_STATUS_BASE + MCONTR_CMPRS_STATUS_INC * i),
                .MCNTRL_TILED_PENDING_CNTR_BITS(MCNTRL_TILED_PENDING_CNTR_BITS),
                .MCNTRL_TILED_FRAME_PAGE_RESET (MCNTRL_TILED_FRAME_PAGE_RESET),
                .MCONTR_LINTILE_NRESET         (MCONTR_LINTILE_NRESET),
                .MCONTR_LINTILE_EN             (MCONTR_LINTILE_EN),
                .MCONTR_LINTILE_WRITE          (MCONTR_LINTILE_WRITE),
                .MCONTR_LINTILE_EXTRAPG        (MCONTR_LINTILE_EXTRAPG),
                .MCONTR_LINTILE_EXTRAPG_BITS   (MCONTR_LINTILE_EXTRAPG_BITS),
                .MCONTR_LINTILE_KEEP_OPEN      (MCONTR_LINTILE_KEEP_OPEN),
                .MCONTR_LINTILE_BYTE32         (MCONTR_LINTILE_BYTE32),
                .MCONTR_LINTILE_LINEAR         (MCONTR_LINTILE_LINEAR), // Use linear mode instead of tiled
                .MCONTR_LINTILE_RST_FRAME      (MCONTR_LINTILE_RST_FRAME),
                .MCONTR_LINTILE_SINGLE         (MCONTR_LINTILE_SINGLE),
                .MCONTR_LINTILE_REPEAT         (MCONTR_LINTILE_REPEAT),
                .MCONTR_LINTILE_DIS_NEED       (MCONTR_LINTILE_DIS_NEED),
                .MCONTR_LINTILE_COPY_FRAME     (MCONTR_LINTILE_COPY_FRAME),
                .MCONTR_LINTILE_ABORT_LATE     (MCONTR_LINTILE_ABORT_LATE)
            ) mcntrl_tiled_rd_compressor_i ( 
                .mrst                 (mrst),                         // input
                .mclk                 (mclk),                        // input
                .cmd_ad               (cmd_cmprs_ad),                // input[7:0] 
                .cmd_stb              (cmd_cmprs_stb),               // input
                .status_ad            (status_cmprs_ad[i * 8 +: 8]), // output[7:0] 
                .status_rq            (status_cmprs_rq[i]),          // output
                .status_start         (status_cmprs_start[i]),       // input
                .frame_start          (cmprs_frame_start_dst[i]),    // input
                .frame_start_conf     (cmprs_frame_start_conf[i]),   // output
                .next_page            (cmprs_next_page[i]),          // input compressor consumed page cmprs_buf_wpage_nxt?
                .frame_done           (cmprs_frame_done_dst[i]),     // output
                .frame_finished       (),                            // output
                .line_unfinished      (cmprs_line_unfinished_dst[i * FRAME_HEIGHT_BITS +: FRAME_HEIGHT_BITS]), // output[15:0] 
                .suspend              (cmprs_suspend[i]),            // input
                .frame_number         (cmprs_frame_number_dst[i * LAST_FRAME_BITS +: LAST_FRAME_BITS]), // output[15:0]
                .frames_in_sync       (cmprs_frames_in_sync[i]),     // output
                .master_frame         (cmprs_frame_number_src[i * LAST_FRAME_BITS +: LAST_FRAME_BITS]), // input[15:0] 
                .master_set           (sens_frame_set[i]),           // input
                .xfer_want            (cmprs_want[i]),               // output
                .xfer_need            (cmprs_need[i]),               // output
                .xfer_grant           (cmprs_channel_pgm_en[i]),     // input
                .xfer_start_lin_rd    (cmprs_start_rdlin[i]), // output
                .xfer_start_lin_wr    (), // output
                .xfer_start_rd        (cmprs_start_rd16[i]),         // output // TODO: start rd (wr too?) linear
                .xfer_start_wr        (),                            // output
                .xfer_start32_rd      (cmprs_start_rd32[i]),         // output
                .xfer_start32_wr      (),                            // output
                .xfer_bank            (cmprs_bank[i * 3 +: 3]), // output[2:0] 
                .xfer_row             (cmprs_row[ADDRESS_NUMBER * i +: ADDRESS_NUMBER]), // output[14:0] 
                .xfer_col             (cmprs_col[COL_WDTH * i +: COL_WDTH]), // output[6:0]
                // 5:0: add xfer_num128[5:0] 
                .rowcol_inc           (cmprs_rowcol_inc[i * FRAME_WBP1 +: FRAME_WBP1]), // output[13:0] 
                .num_rows_m1          (cmprs_num_rows_m1[i * MAX_TILE_WIDTH +: MAX_TILE_WIDTH]), // output[5:0] 
                .num_cols_m1          (cmprs_num_cols_m1[i * MAX_TILE_HEIGHT +: MAX_TILE_HEIGHT]), // output[5:0] 
                .keep_open            (cmprs_keep_open[i]),          // output
                .xfer_num128          (cmprs_num128[i * 6 +: 6]),    // output[5:0] //** new**
                .xfer_partial         (cmprs_partial[i]),            // output
                .xfer_page_done       (cmprs_seq_done[i]),           // input
                .xfer_page_rst_wr     (),                            // output
                .xfer_page_rst_rd     (cmprs_xfer_reset_page_rd[i])  // output @negedge
            );
        
        end
    endgenerate

    mcntrl_linear_rw #(
        .ADDRESS_NUMBER                    (ADDRESS_NUMBER),
        .COLADDR_NUMBER                    (COLADDR_NUMBER),
        .NUM_XFER_BITS                     (NUM_XFER_BITS),
        .FRAME_WIDTH_BITS                  (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS                 (FRAME_HEIGHT_BITS),
        .LAST_FRAME_BITS                   (LAST_FRAME_BITS),
        .MCNTRL_SCANLINE_ADDR              (MCNTRL_SCANLINE_CHN1_ADDR),
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
        .MCNTRL_SCANLINE_STATUS_REG_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR),
        .MCNTRL_SCANLINE_PENDING_CNTR_BITS (MCNTRL_SCANLINE_PENDING_CNTR_BITS),
        .MCNTRL_SCANLINE_FRAME_PAGE_RESET  (MCNTRL_SCANLINE_FRAME_PAGE_RESET),
        .MCONTR_LINTILE_NRESET             (MCONTR_LINTILE_NRESET),
        .MCONTR_LINTILE_EN                 (MCONTR_LINTILE_EN),
        .MCONTR_LINTILE_WRITE              (MCONTR_LINTILE_WRITE),
        .MCONTR_LINTILE_EXTRAPG            (MCONTR_LINTILE_EXTRAPG),
        .MCONTR_LINTILE_EXTRAPG_BITS       (MCONTR_LINTILE_EXTRAPG_BITS),
        .MCONTR_LINTILE_RST_FRAME          (MCONTR_LINTILE_RST_FRAME),
        .MCONTR_LINTILE_SINGLE             (MCONTR_LINTILE_SINGLE),
        .MCONTR_LINTILE_REPEAT             (MCONTR_LINTILE_REPEAT),
        .MCONTR_LINTILE_DIS_NEED           (MCONTR_LINTILE_DIS_NEED),
        .MCONTR_LINTILE_SKIP_LATE          (MCONTR_LINTILE_SKIP_LATE),
        .MCONTR_LINTILE_ABORT_LATE         (MCONTR_LINTILE_ABORT_LATE),
        .MCNTRL_SCANLINE_DLY_WIDTH         (MCNTRL_SCANLINE_DLY_WIDTH),
        .MCNTRL_SCANLINE_DLY_DEFAULT       (MCNTRL_SCANLINE_DLY_DEFAULT)
         
    ) mcntrl_linear_rw_chn1_i (
        .mrst             (mrst), // input
        .mclk             (mclk), // input
        .cmd_ad           (cmd_scanline_chn1_ad), // input[7:0] 
        .cmd_stb          (cmd_scanline_chn1_stb), // input
        .status_ad        (status_scanline_chn1_ad), // output[7:0] 
        .status_rq        (status_scanline_chn1_rq), // output
        .status_start     (status_scanline_chn1_start), // input
        .frame_start      (frame_start_chn1), // input
        .frame_run        (),                           // output
        .next_page        (next_page_chn1), // input
        .frame_done       (frame_done_chn1), // output
        .frame_finished     (), // output
        .line_unfinished  (line_unfinished_chn1), // output[15:0] 
        .suspend          (suspend_chn1), // input
        .frame_number     (), // output[15:0] - not used for this channel
        .frame_set        (),          // output
        .xfer_want        (want_rq1), // output
        .xfer_need        (need_rq1), // output
        .xfer_grant       (channel_pgm_en1), // input
        .xfer_reject      (reject1),              //input
        .xfer_start_rd    (lin_rw_chn1_start_rd), // output
        .xfer_start_wr    (lin_rw_chn1_start_wr), // output
        .xfer_bank        (lin_rw_chn1_bank), // output[2:0] 
        .xfer_row         (lin_rw_chn1_row), // output[14:0] 
        .xfer_col         (lin_rw_chn1_col), // output[6:0] 
        .xfer_num128      (lin_rw_chn1_num128), // output[5:0]
        .xfer_partial     (lin_rw_chn1_partial), // output
        .xfer_done        (seq_done1), // input : sequence over
        .xfer_page_rst_wr (xfer_reset_page1_wr), // output
        .xfer_page_rst_rd (xfer_reset_page1_rd), // output
        .xfer_skipped     (), // output reg
        .cmd_wrmem        (cmd_wrmem_chn1) // output
`ifdef DEBUG_SENS_MEM_PAGES
        ,.dbg_rpage        ()         // input[1:0]   
        ,.dbg_wpage        ()         // input[1:0]   
`endif              
        
    );

    mcntrl_linear_rw #(
        .ADDRESS_NUMBER                    (ADDRESS_NUMBER),
        .COLADDR_NUMBER                    (COLADDR_NUMBER),
        .NUM_XFER_BITS                     (NUM_XFER_BITS),
        .FRAME_WIDTH_BITS                  (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS                 (FRAME_HEIGHT_BITS),
        .LAST_FRAME_BITS                   (LAST_FRAME_BITS),
        .MCNTRL_SCANLINE_ADDR              (MCNTRL_SCANLINE_CHN3_ADDR),
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
        .MCNTRL_SCANLINE_STATUS_REG_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR),
        .MCNTRL_SCANLINE_PENDING_CNTR_BITS (MCNTRL_SCANLINE_PENDING_CNTR_BITS),
        .MCNTRL_SCANLINE_FRAME_PAGE_RESET  (MCNTRL_SCANLINE_FRAME_PAGE_RESET),
        .MCONTR_LINTILE_NRESET             (MCONTR_LINTILE_NRESET),
        .MCONTR_LINTILE_EN                 (MCONTR_LINTILE_EN),
        .MCONTR_LINTILE_WRITE              (MCONTR_LINTILE_WRITE),
        .MCONTR_LINTILE_EXTRAPG            (MCONTR_LINTILE_EXTRAPG),
        .MCONTR_LINTILE_EXTRAPG_BITS       (MCONTR_LINTILE_EXTRAPG_BITS),
        .MCONTR_LINTILE_RST_FRAME          (MCONTR_LINTILE_RST_FRAME),
        .MCONTR_LINTILE_SINGLE             (MCONTR_LINTILE_SINGLE),
        .MCONTR_LINTILE_REPEAT             (MCONTR_LINTILE_REPEAT),
        .MCONTR_LINTILE_DIS_NEED           (MCONTR_LINTILE_DIS_NEED),
        .MCONTR_LINTILE_SKIP_LATE          (MCONTR_LINTILE_SKIP_LATE),
        .MCONTR_LINTILE_ABORT_LATE         (MCONTR_LINTILE_ABORT_LATE),
        .MCNTRL_SCANLINE_DLY_WIDTH         (MCNTRL_SCANLINE_DLY_WIDTH),
        .MCNTRL_SCANLINE_DLY_DEFAULT       (MCNTRL_SCANLINE_DLY_DEFAULT)
    ) mcntrl_linear_rw_chn3_i (
        .mrst             (mrst), // input
        .mclk             (mclk), // input
        .cmd_ad           (cmd_scanline_chn3_ad), // input[7:0] 
        .cmd_stb          (cmd_scanline_chn3_stb), // input
        .status_ad        (status_scanline_chn3_ad), // output[7:0] 
        .status_rq        (status_scanline_chn3_rq), // output
        .status_start     (status_scanline_chn3_start), // input
        .frame_start      (frame_start_chn3), // input
        .frame_run        (),                           // output
        .next_page        (next_page_chn3), // input
        .frame_done       (frame_done_chn3), // output
        .frame_finished       (), // output
        .line_unfinished  (line_unfinished_chn3), // output[15:0] 
        .suspend          (suspend_chn3), // input
        .frame_number     (frame_number_chn3),
        .frame_set        (),          // output
        .xfer_want        (want_rq3), // output
        .xfer_need        (need_rq3), // output
        .xfer_grant       (channel_pgm_en3), // input
        .xfer_reject      (reject3),              //input
        .xfer_start_rd    (lin_rw_chn3_start_rd), // output
        .xfer_start_wr    (lin_rw_chn3_start_wr), // output
        .xfer_bank        (lin_rw_chn3_bank), // output[2:0] 
        .xfer_row         (lin_rw_chn3_row), // output[14:0] 
        .xfer_col         (lin_rw_chn3_col), // output[6:0] 
        .xfer_num128      (lin_rw_chn3_num128), // output[5:0]
        .xfer_partial     (lin_rw_chn3_partial), // output
        .xfer_done        (seq_done3), // input : sequence over
        .xfer_page_rst_wr (xfer_reset_page3_wr), // output
        .xfer_page_rst_rd (xfer_reset_page3_rd), // output
        .xfer_skipped     (), // output reg
        .cmd_wrmem        () // output
`ifdef DEBUG_SENS_MEM_PAGES
        ,.dbg_rpage        ()         // input[1:0]   
        ,.dbg_wpage        ()         // input[1:0]   
`endif              
    );
    
       mcntrl_tiled_rw #(
        .ADDRESS_NUMBER                (ADDRESS_NUMBER),
        .COLADDR_NUMBER                (COLADDR_NUMBER),
        .FRAME_WIDTH_BITS              (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS             (FRAME_HEIGHT_BITS),
        .MAX_TILE_WIDTH                (MAX_TILE_WIDTH),
        .MAX_TILE_HEIGHT               (MAX_TILE_HEIGHT),
        .LAST_FRAME_BITS               (LAST_FRAME_BITS),
        .MCNTRL_TILED_ADDR             (MCNTRL_TILED_CHN2_ADDR),
        .MCNTRL_TILED_MASK             (MCNTRL_TILED_MASK),
        .MCNTRL_TILED_MODE             (MCNTRL_TILED_MODE),
        .MCNTRL_TILED_STATUS_CNTRL     (MCNTRL_TILED_STATUS_CNTRL),
        .MCNTRL_TILED_STARTADDR        (MCNTRL_TILED_STARTADDR),
        .MCNTRL_TILED_FRAME_SIZE       (MCNTRL_TILED_FRAME_SIZE),
        .MCNTRL_TILED_FRAME_LAST       (MCNTRL_TILED_FRAME_LAST),
        .MCNTRL_TILED_FRAME_FULL_WIDTH (MCNTRL_TILED_FRAME_FULL_WIDTH),
        .MCNTRL_TILED_WINDOW_WH        (MCNTRL_TILED_WINDOW_WH),
        .MCNTRL_TILED_WINDOW_X0Y0      (MCNTRL_TILED_WINDOW_X0Y0),
        .MCNTRL_TILED_WINDOW_STARTXY   (MCNTRL_TILED_WINDOW_STARTXY),
        .MCNTRL_TILED_TILE_WHS         (MCNTRL_TILED_TILE_WHS),
        .MCNTRL_TILED_STATUS_REG_ADDR  (MCNTRL_TILED_STATUS_REG_CHN2_ADDR),
        .MCNTRL_TILED_PENDING_CNTR_BITS(MCNTRL_TILED_PENDING_CNTR_BITS),
        .MCONTR_LINTILE_NRESET         (MCONTR_LINTILE_NRESET),
        .MCONTR_LINTILE_EN             (MCONTR_LINTILE_EN),
        .MCONTR_LINTILE_WRITE          (MCONTR_LINTILE_WRITE),
        .MCONTR_LINTILE_EXTRAPG        (MCONTR_LINTILE_EXTRAPG),
        .MCONTR_LINTILE_EXTRAPG_BITS   (MCONTR_LINTILE_EXTRAPG_BITS),
        .MCONTR_LINTILE_KEEP_OPEN      (MCONTR_LINTILE_KEEP_OPEN),
        .MCONTR_LINTILE_BYTE32         (MCONTR_LINTILE_BYTE32),
        .MCONTR_LINTILE_LINEAR         (MCONTR_LINTILE_LINEAR), // Use linear mode instead of tiled
        .MCONTR_LINTILE_RST_FRAME      (MCONTR_LINTILE_RST_FRAME),
        .MCONTR_LINTILE_SINGLE         (MCONTR_LINTILE_SINGLE),
        .MCONTR_LINTILE_REPEAT         (MCONTR_LINTILE_REPEAT),
        .MCONTR_LINTILE_DIS_NEED       (MCONTR_LINTILE_DIS_NEED),
        .MCONTR_LINTILE_ABORT_LATE     (MCONTR_LINTILE_ABORT_LATE)
    ) mcntrl_tiled_rw_chn2_i ( 
        .mrst                 (mrst),                       // input
        .mclk                 (mclk),                       // input
        .cmd_ad               (cmd_tiled_chn2_ad),          // input[7:0] 
        .cmd_stb              (cmd_tiled_chn2_stb),         // input
        .status_ad            (status_tiled_chn2_ad),       // output[7:0] 
        .status_rq            (status_tiled_chn2_rq),       // output
        .status_start         (status_tiled_chn2_start),    // input
        .frame_start          (frame_start_chn2),           // input
        .frame_start_conf     (),                           // output
        .next_page            (next_page_chn2),             // input
        .frame_done           (frame_done_chn2),            // output
        .frame_finished       (),                           // output
        .line_unfinished      (line_unfinished_chn2),       // output[15:0]  
        .suspend              (suspend_chn2),               // input
        .frame_number         (frame_number_chn2),          // output[15:0]
        .frames_in_sync(), // output
        .master_frame         (16'b0),                      // input[15:0]  // Set master frame number value
        .master_set           (1'b0),                       // input        // set master frame strobe   
//        .master_follow        (1'b0),                       // input
        .xfer_want            (want_rq2),                   // output
        .xfer_need            (need_rq2),                   // output
        .xfer_grant           (channel_pgm_en2),            // input
        .xfer_start_rd        (tiled_rw_chn2_start_rd16),   // output
        .xfer_start_wr        (tiled_rw_chn2_start_wr16),   // output
        .xfer_start32_rd      (tiled_rw_chn2_start_rd32),   // output
        .xfer_start32_wr      (tiled_rw_chn2_start_wr32),   // output
        .xfer_bank            (tiled_rw_chn2_bank),         // output[2:0] 
        .xfer_row             (tiled_rw_chn2_row),          // output[14:0] 
        .xfer_col             (tiled_rw_chn2_col),          // output[6:0] 
        .rowcol_inc           (tiled_rw_chn2_rowcol_inc),   // output[13:0] 
        .num_rows_m1          (tiled_rw_chn2_num_rows_m1),  // output[5:0] 
        .num_cols_m1          (tiled_rw_chn2_num_cols_m1),  // output[5:0] 
        .keep_open            (tiled_rw_chn2_keep_open),    // output
        .xfer_partial         (tiled_rw_chn2_xfer_partial), // output
        .xfer_page_done       (seq_done2), // input
        .xfer_page_rst_wr     (xfer_reset_page2_wr), // output
        .xfer_page_rst_rd     (xfer_reset_page2_rd) // output
    );

    mcntrl_tiled_rw #(
        .ADDRESS_NUMBER                (ADDRESS_NUMBER),
        .COLADDR_NUMBER                (COLADDR_NUMBER),
        .FRAME_WIDTH_BITS              (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS             (FRAME_HEIGHT_BITS),
        .MAX_TILE_WIDTH                (MAX_TILE_WIDTH),
        .MAX_TILE_HEIGHT               (MAX_TILE_HEIGHT),
        .LAST_FRAME_BITS               (LAST_FRAME_BITS),
        .MCNTRL_TILED_ADDR             (MCNTRL_TILED_CHN4_ADDR),
        .MCNTRL_TILED_MASK             (MCNTRL_TILED_MASK),
        .MCNTRL_TILED_MODE             (MCNTRL_TILED_MODE),
        .MCNTRL_TILED_STATUS_CNTRL     (MCNTRL_TILED_STATUS_CNTRL),
        .MCNTRL_TILED_STARTADDR        (MCNTRL_TILED_STARTADDR),
        .MCNTRL_TILED_FRAME_SIZE       (MCNTRL_TILED_FRAME_SIZE),
        .MCNTRL_TILED_FRAME_LAST       (MCNTRL_TILED_FRAME_LAST),
        .MCNTRL_TILED_FRAME_FULL_WIDTH (MCNTRL_TILED_FRAME_FULL_WIDTH),
        .MCNTRL_TILED_WINDOW_WH        (MCNTRL_TILED_WINDOW_WH),
        .MCNTRL_TILED_WINDOW_X0Y0      (MCNTRL_TILED_WINDOW_X0Y0),
        .MCNTRL_TILED_WINDOW_STARTXY   (MCNTRL_TILED_WINDOW_STARTXY),
        .MCNTRL_TILED_TILE_WHS         (MCNTRL_TILED_TILE_WHS),
        .MCNTRL_TILED_STATUS_REG_ADDR  (MCNTRL_TILED_STATUS_REG_CHN4_ADDR),
        .MCNTRL_TILED_PENDING_CNTR_BITS(MCNTRL_TILED_PENDING_CNTR_BITS),
        .MCONTR_LINTILE_NRESET         (MCONTR_LINTILE_NRESET),
        .MCONTR_LINTILE_EN             (MCONTR_LINTILE_EN),
        .MCONTR_LINTILE_WRITE          (MCONTR_LINTILE_WRITE),
        .MCONTR_LINTILE_EXTRAPG        (MCONTR_LINTILE_EXTRAPG),
        .MCONTR_LINTILE_EXTRAPG_BITS   (MCONTR_LINTILE_EXTRAPG_BITS),
        .MCONTR_LINTILE_KEEP_OPEN      (MCONTR_LINTILE_KEEP_OPEN),
        .MCONTR_LINTILE_BYTE32         (MCONTR_LINTILE_BYTE32),
        .MCONTR_LINTILE_LINEAR         (MCONTR_LINTILE_LINEAR), // Use linear mode instead of tiled
        .MCONTR_LINTILE_RST_FRAME      (MCONTR_LINTILE_RST_FRAME),
        .MCONTR_LINTILE_SINGLE         (MCONTR_LINTILE_SINGLE),
        .MCONTR_LINTILE_REPEAT         (MCONTR_LINTILE_REPEAT),
        .MCONTR_LINTILE_DIS_NEED       (MCONTR_LINTILE_DIS_NEED),
        .MCONTR_LINTILE_ABORT_LATE     (MCONTR_LINTILE_ABORT_LATE)
    ) mcntrl_tiled_rw_chn4_i ( 
        .mrst                 (mrst),                       // input
        .mclk                 (mclk),                       // input
        .cmd_ad               (cmd_tiled_chn4_ad),          // input[7:0] 
        .cmd_stb              (cmd_tiled_chn4_stb),         // input
        .status_ad            (status_tiled_chn4_ad),       // output[7:0] 
        .status_rq            (status_tiled_chn4_rq),       // output
        .status_start         (status_tiled_chn4_start),    // input
        .frame_start          (frame_start_chn4),           // input
        .frame_start_conf     (),                           // output
        .next_page            (next_page_chn4),             // input
        .frame_done           (frame_done_chn4),            // output
        .frame_finished       (),                           // output
        .line_unfinished      (line_unfinished_chn4),       // output[15:0] 
        .suspend              (suspend_chn4),               // input
        .frame_number         (frame_number_chn4),          // output  [15:0]
        .frames_in_sync       (),                           // output
        .master_frame         (16'b0),                      // input[15:0] 
        .master_set           (1'b0),                       // input
//        .master_follow        (1'b0),                     // input
        .xfer_want            (want_rq4),                   // output
        .xfer_need            (need_rq4),                   // output
        .xfer_grant           (channel_pgm_en4),            // input
        .xfer_start_rd        (tiled_rw_chn4_start_rd16),   // output
        .xfer_start_wr        (tiled_rw_chn4_start_wr16),   // output
        .xfer_start32_rd      (tiled_rw_chn4_start_rd32),   // output
        .xfer_start32_wr      (tiled_rw_chn4_start_wr32),   // output
        .xfer_bank            (tiled_rw_chn4_bank),         // output[2:0] 
        .xfer_row             (tiled_rw_chn4_row),          // output[14:0] 
        .xfer_col             (tiled_rw_chn4_col),          // output[6:0] 
        .rowcol_inc           (tiled_rw_chn4_rowcol_inc),   // output[13:0] 
        .num_rows_m1          (tiled_rw_chn4_num_rows_m1),  // output[5:0] 
        .num_cols_m1          (tiled_rw_chn4_num_cols_m1),  // output[5:0] 
        .keep_open            (tiled_rw_chn4_keep_open),    // output
        .xfer_partial         (tiled_rw_chn4_xfer_partial), // output
        .xfer_page_done       (seq_done4),                  // input
        .xfer_page_rst_wr     (xfer_reset_page4_wr),        // output
        .xfer_page_rst_rd     (xfer_reset_page4_rd)         // output
    ); 
    
    
// PS-controlled launch of the memory controller sequences
    mcntrl_ps_pio #( 
        .MCNTRL_PS_ADDR            (MCNTRL_PS_ADDR), //'h100),
        .MCNTRL_PS_MASK            (MCNTRL_PS_MASK), //'h3e0),
        .MCNTRL_PS_STATUS_REG_ADDR (MCNTRL_PS_STATUS_REG_ADDR), //'h2),
        .MCNTRL_PS_EN_RST          (MCNTRL_PS_EN_RST), //'h0),
        .MCNTRL_PS_CMD             (MCNTRL_PS_CMD), //'h1),
        .MCNTRL_PS_STATUS_CNTRL    (MCNTRL_PS_STATUS_CNTRL) //'h2)
    ) mcntrl_ps_pio_i (
        .mrst                      (mrst), // input
        .mclk                      (mclk), // input
        
        .cmd_ad                    (cmd_ps_pio_ad), // input[7:0] 
        .cmd_stb                   (cmd_ps_pio_stb), // input
        .status_ad                 (status_ps_pio_ad), // output[7:0] 
        .status_rq                 (status_ps_pio_rq), // output
        .status_start              (status_ps_pio_start), // input
        
        .port0_clk                 (axi_clk), // input
        .port0_re                  (buf0_rd), // input
        .port0_regen               (buf0_regen), // input
        .port0_addr                (buf_raddr), // input[9:0] 
        .port0_data                (buf0_data), // output[31:0]
         
        .port1_clk                 (axi_clk), // input
        .port1_we                  (buf0wr_we), // input
        .port1_addr                (buf_waddr), // input[9:0] 
        .port1_data                (buf_wdata), // input[31:0]
         
        .want_rq                   (want_rq0), // output reg 
        .need_rq                   (need_rq0), // output reg 
        .channel_pgm_en            (channel_pgm_en0), // input
        .seq_data                  (seq_data0), // output[9:0] 
        .seq_set                   (seq_set0), // output
        .seq_done                  (seq_done0), // input
        .buf_wr                    (buf_wr_chn0), // input         @negedge mclk
        .buf_wpage_nxt             (buf_wpage_nxt_chn0), // input @negedge mclk
        .buf_run                   (buf_run0), // input
        .buf_wrun                  (buf_wrun0), // input
        .buf_wdata                 (buf_wdata_chn0), // input[63:0]@negedge mclk
        .buf_rpage_nxt             (buf_rpage_nxt_chn0), // input @negedge mclk
        .buf_rd                    (buf_rd_chn0), // input
        .buf_rdata                 (buf_rdata_chn0) // output[63:0] 
    );
// multiplexer for scanline read/write (multiple channels can share it)
    cmd_encod_linear_mux #(
        .ADDRESS_NUMBER           (ADDRESS_NUMBER),
        .COLADDR_NUMBER           (COLADDR_NUMBER)
    ) cmd_encod_linear_mux_i (
        .clk                      (mclk), // input
        
        .bank1                    (lin_rw_chn1_bank), // input[2:0] 
        .row1                     (lin_rw_chn1_row), // input[14:0] 
        .start_col1               (lin_rw_chn1_col), // input[6:0] 
        .num128_1                 (lin_rw_chn1_num128), // input[5:0] 
        .partial1                 (lin_rw_chn1_partial), // input
        .start1_rd                (lin_rw_chn1_start_rd), // input
        .start1_wr                (lin_rw_chn1_start_wr), // input

        .bank3                    (lin_rw_chn3_bank), // input[2:0] 
        .row3                     (lin_rw_chn3_row), // input[14:0] 
        .start_col3               (lin_rw_chn3_col), // input[6:0] 
        .num128_3                 (lin_rw_chn3_num128), // input[5:0] 
        .partial3                 (lin_rw_chn3_partial), // input
        .start3_rd                (lin_rw_chn3_start_rd), // input
        .start3_wr                (lin_rw_chn3_start_wr), // input
        
        

        .bank8                    (sens_bank[0 * 3 +: 3]),                          // input[2:0] 
        .row8                     (sens_row[0 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col8               (sens_col[0 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_8                 (sens_num128[0 * 6 +: 6]),                        // input[5:0] 
        .partial8                 (sens_partial[0]),                                // input
        .start8_wr                (sens_start_wr[0]),                               // input
        
        .bank9                    (sens_bank[1 * 3 +: 3]),                          // input[2:0] 
        .row9                     (sens_row[1 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col9               (sens_col[1 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_9                 (sens_num128[1 * 6 +: 6]),                        // input[5:0] 
        .partial9                 (sens_partial[1]),                                // input
        .start9_wr                (sens_start_wr[1]),                               // input
        
        .bank10                   (sens_bank[2 * 3 +: 3]),                          // input[2:0] 
        .row10                    (sens_row[2 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col10              (sens_col[2 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_10                (sens_num128[2 * 6 +: 6]),                        // input[5:0] 
        .partial10                (sens_partial[2]),                                // input
        .start10_wr               (sens_start_wr[2]),                               // input
        
        .bank11                   (sens_bank[3 * 3 +: 3]),                          // input[2:0] 
        .row11                    (sens_row[3 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col11              (sens_col[3 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_11                (sens_num128[3 * 6 +: 6]),                        // input[5:0] 
        .partial11                (sens_partial[3]),                                // input
        .start11_wr               (sens_start_wr[3]),                               // input
        
        
        .bank12                   (cmprs_bank[0 * 3 +: 3]),                          // input[2:0] 
        .row12                    (cmprs_row[0 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col12              (cmprs_col[0 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_12                (cmprs_num128[0 * 6 +: 6]),                        // input[5:0] 
        .partial12                (cmprs_partial[0]),                                // input
        .start12_rd               (cmprs_start_rdlin[0]),                            // input
        .bank13                   (cmprs_bank[1 * 3 +: 3]),                          // input[2:0] 
        .row13                    (cmprs_row[1 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col13              (cmprs_col[1 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_13                (cmprs_num128[1 * 6 +: 6]),                        // input[5:0] 
        .partial13                (cmprs_partial[1]),                                // input
        .start13_rd               (cmprs_start_rdlin[1]),                            // input
        .bank14                   (cmprs_bank[2 * 3 +: 3]),                          // input[2:0] 
        .row14                    (cmprs_row[2 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col14              (cmprs_col[2 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_14                (cmprs_num128[2 * 6 +: 6]),                        // input[5:0] 
        .partial14                (cmprs_partial[2]),                                // input
        .start14_rd               (cmprs_start_rdlin[2]),                            // input
        .bank15                   (cmprs_bank[3 * 3 +: 3]),                          // input[2:0] 
        .row15                    (cmprs_row[3 * ADDRESS_NUMBER +: ADDRESS_NUMBER]), // input[14:0] 
        .start_col15              (cmprs_col[3 * COL_WDTH +: COL_WDTH]),             // input[6:0] 
        .num128_15                (cmprs_num128[3 * 6 +: 6]),                        // input[5:0] 
        .partial15                (cmprs_partial[3]),                                // input
        .start15_rd               (cmprs_start_rdlin[3]),                            // input
        
        .bank                     (lin_rw_bank),                                    // output[2:0] 
        .row                      (lin_rw_row),                                     // output[14:0] 
        .start_col                (lin_rw_col),                                     // output[6:0] 
        .num128                   (lin_rw_num128),                                  // output[5:0]
        .partial                  (lin_rw_xfer_partial),                            // output
        .start_rd                 (lin_rw_start_rd),                                // output
        .start_wr                 (lin_rw_start_wr)                                 // output
    );

// encoder for scanline read/write
    cmd_encod_linear_rw #(
        .ADDRESS_NUMBER    (ADDRESS_NUMBER),
        .COLADDR_NUMBER    (COLADDR_NUMBER),
        .NUM_XFER_BITS     (NUM_XFER_BITS),
        .CMD_PAUSE_BITS    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT      (CMD_DONE_BIT),
        .RSEL              (RSEL),
        .WSEL              (WSEL)
    ) cmd_encod_linear_rw_i (
        .mrst              (mrst), // input
        .clk               (mclk), // input
        .bank_in           (lin_rw_bank), // input[2:0] 
        .row_in            (lin_rw_row), // input[14:0] 
        .start_col         (lin_rw_col), // input[6:0] 
        .num128_in         (lin_rw_num128), // input[5:0] 
        .skip_next_page_in (lin_rw_xfer_partial), // input
        .start_rd          (lin_rw_start_rd), // input
        .start_wr          (lin_rw_start_wr), // input
        .start             (encod_linear_start_out), // output reg 
        .enc_cmd           (encod_linear_cmd), // output[31:0] reg 
        .enc_wr            (encod_linear_wr), // output reg 
        .enc_done          (encod_linear_done) // output reg 
    );

// multiplexer for tiles read/write (multiple channels can share it)
    cmd_encod_tiled_mux #(
        .ADDRESS_NUMBER          (ADDRESS_NUMBER),
        .COLADDR_NUMBER          (COLADDR_NUMBER),
        .FRAME_WIDTH_BITS        (FRAME_WIDTH_BITS),
        .MAX_TILE_WIDTH          (MAX_TILE_WIDTH),
        .MAX_TILE_HEIGHT         (MAX_TILE_HEIGHT)
    ) cmd_encod_tiled_mux_i (
        .clk                     (mclk), // input
        .bank2                   (tiled_rw_chn2_bank), // input[2:0] 
        .row2                    (tiled_rw_chn2_row), // input[14:0] 
        .col2                    (tiled_rw_chn2_col), // input[6:0] 
        .rowcol_inc2             (tiled_rw_chn2_rowcol_inc), // input[13:0] 
        .num_rows2               (tiled_rw_chn2_num_rows_m1), // input[5:0] 
        .num_cols2               (tiled_rw_chn2_num_cols_m1), // input[5:0] 
        .keep_open2              (tiled_rw_chn2_keep_open), // input
        .partial2                (tiled_rw_chn2_xfer_partial), // input
        .start2_rd               (tiled_rw_chn2_start_rd16), // input
        .start2_wr               (tiled_rw_chn2_start_wr16), // input
        .start2_rd32             (tiled_rw_chn2_start_rd32), // input
        .start2_wr32             (tiled_rw_chn2_start_wr32), // input
        
        .bank4                   (tiled_rw_chn4_bank), // input[2:0] 
        .row4                    (tiled_rw_chn4_row), // input[14:0] 
        .col4                    (tiled_rw_chn4_col), // input[6:0] 
        .rowcol_inc4             (tiled_rw_chn4_rowcol_inc), // input[13:0] 
        .num_rows4               (tiled_rw_chn4_num_rows_m1), // input[5:0] 
        .num_cols4               (tiled_rw_chn4_num_cols_m1), // input[5:0] 
        .keep_open4              (tiled_rw_chn4_keep_open), // input
        .partial4                (tiled_rw_chn4_xfer_partial), // input
        .start4_rd               (tiled_rw_chn4_start_rd16), // input
        .start4_wr               (tiled_rw_chn4_start_wr16), // input
        .start4_rd32             (tiled_rw_chn4_start_rd32), // input
        .start4_wr32             (tiled_rw_chn4_start_wr32), // input
        
        .bank12                  (cmprs_bank[0 * 3 +: 3]),                                    // input[2:0] 
        .row12                   (cmprs_row[0 * ADDRESS_NUMBER +: ADDRESS_NUMBER]),           // input[14:0] 
        .col12                   (cmprs_col[0 * COL_WDTH +: COL_WDTH]),                       // input[6:0] 
        .rowcol_inc12            (cmprs_rowcol_inc[0 * FRAME_WBP1 +: FRAME_WBP1]),            // input[13:0] 
        .num_rows12              (cmprs_num_rows_m1[0 * MAX_TILE_WIDTH +: MAX_TILE_WIDTH]),   // input[5:0] 
        .num_cols12              (cmprs_num_cols_m1[0 * MAX_TILE_HEIGHT +: MAX_TILE_HEIGHT]), // input[5:0] 
        .keep_open12             (cmprs_keep_open[0]),                                        // input
        .partial12               (cmprs_partial[0]),                                          // input
        .start12_rd              (cmprs_start_rd16[0]),                                       // input
        .start12_rd32            (cmprs_start_rd32[0]),                                       // input
        
        .bank13                  (cmprs_bank[1 * 3 +: 3]),                                    // input[2:0] 
        .row13                   (cmprs_row[1 * ADDRESS_NUMBER +: ADDRESS_NUMBER]),           // input[14:0] 
        .col13                   (cmprs_col[1 * COL_WDTH +: COL_WDTH]),                       // input[6:0] 
        .rowcol_inc13            (cmprs_rowcol_inc[1 * FRAME_WBP1 +: FRAME_WBP1]),            // input[13:0] 
        .num_rows13              (cmprs_num_rows_m1[1 * MAX_TILE_WIDTH +: MAX_TILE_WIDTH]),   // input[5:0] 
        .num_cols13              (cmprs_num_cols_m1[1 * MAX_TILE_HEIGHT +: MAX_TILE_HEIGHT]), // input[5:0] 
        .keep_open13             (cmprs_keep_open[1]),                                        // input
        .partial13               (cmprs_partial[1]),                                          // input
        .start13_rd              (cmprs_start_rd16[1]),                                       // input
        .start13_rd32            (cmprs_start_rd32[1]),                                       // input
        
        .bank14                  (cmprs_bank[2 * 3 +: 3]),                                    // input[2:0] 
        .row14                   (cmprs_row[2 * ADDRESS_NUMBER +: ADDRESS_NUMBER]),           // input[14:0] 
        .col14                   (cmprs_col[2 * COL_WDTH +: COL_WDTH]),                       // input[6:0] 
        .rowcol_inc14            (cmprs_rowcol_inc[2 * FRAME_WBP1 +: FRAME_WBP1]),            // input[13:0] 
        .num_rows14              (cmprs_num_rows_m1[2 * MAX_TILE_WIDTH +: MAX_TILE_WIDTH]),   // input[5:0] 
        .num_cols14              (cmprs_num_cols_m1[2 * MAX_TILE_HEIGHT +: MAX_TILE_HEIGHT]), // input[5:0] 
        .keep_open14             (cmprs_keep_open[2]),                                        // input
        .partial14               (cmprs_partial[2]),                                          // input
        .start14_rd              (cmprs_start_rd16[2]),                                       // input
        .start14_rd32            (cmprs_start_rd32[2]),                                       // input
        
        .bank15                  (cmprs_bank[3 * 3 +: 3]),                                    // input[2:0] 
        .row15                   (cmprs_row[3 * ADDRESS_NUMBER +: ADDRESS_NUMBER]),           // input[14:0] 
        .col15                   (cmprs_col[3 * COL_WDTH +: COL_WDTH]),                       // input[6:0] 
        .rowcol_inc15            (cmprs_rowcol_inc[3 * FRAME_WBP1 +: FRAME_WBP1]),            // input[13:0] 
        .num_rows15              (cmprs_num_rows_m1[3 * MAX_TILE_WIDTH +: MAX_TILE_WIDTH]),   // input[5:0] 
        .num_cols15              (cmprs_num_cols_m1[3 * MAX_TILE_HEIGHT +: MAX_TILE_HEIGHT]), // input[5:0] 
        .keep_open15             (cmprs_keep_open[3]),                                        // input
        .partial15               (cmprs_partial[3]),                                          // input
        .start15_rd              (cmprs_start_rd16[3]),                                       // input
        .start15_rd32            (cmprs_start_rd32[3]),                                       // input
        
        .bank                    (tiled_rw_bank), // output[2:0] 
        .row                     (tiled_rw_row), // output[14:0] 
        .col                     (tiled_rw_col), // output[6:0] 
        .rowcol_inc              (tiled_rw_rowcol_inc), // output[13:0] 
        .num_rows                (tiled_rw_num_rows_m1), // output[5:0] 
        .num_cols                (tiled_rw_num_cols_m1), // output[5:0] 
        .keep_open               (tiled_rw_keep_open), // output
        .partial                 (tiled_rw_xfer_partial), // output
        .start_rd                (tiled_rw_start_rd16), // output
        .start_wr                (tiled_rw_start_wr16), // output
        .start_rd32              (tiled_rw_start_rd32), // output
        .start_wr32              (tiled_rw_start_wr32) // output
    );
    
    
// encoder for tile read/write using 16-byte wide columns
    cmd_encod_tiled_rw #(
        .ADDRESS_NUMBER    (ADDRESS_NUMBER),
        .COLADDR_NUMBER    (COLADDR_NUMBER),
        .CMD_PAUSE_BITS    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT      (CMD_DONE_BIT),
        .FRAME_WIDTH_BITS  (FRAME_WIDTH_BITS),
        .RSEL              (RSEL),
        .WSEL              (WSEL)
    ) cmd_encod_tiled_16_rw_i (
        .mrst              (mrst),                 // input
        .clk               (mclk),                 // input
        .start_bank        (tiled_rw_bank),        // input[2:0] 
        .start_row         (tiled_rw_row), // input[14:0] 
        .start_col         (tiled_rw_col), // input[6:0] 
        .rowcol_inc_in     (tiled_rw_rowcol_inc), // input[13:0] // [21:0] 
        .num_rows_in_m1    (tiled_rw_num_rows_m1), // input[5:0] 
        .num_cols_in_m1    (tiled_rw_num_cols_m1), // input[5:0] 
        .keep_open_in      (tiled_rw_keep_open), // input
        .skip_next_page_in (tiled_rw_xfer_partial), // input
        .start_rd          (tiled_rw_start_rd16), // input
        .start_wr          (tiled_rw_start_wr16), // input
        .start             (encod_tiled16_start_out), // output reg 
        .enc_cmd           (encod_tiled16_cmd), // output[31:0] reg 
        .enc_wr            (encod_tiled16_wr), // output reg 
        .enc_done          (encod_tiled16_done) // output reg 
    );

// encoder for tile read/write using 32-byte wide columns
    cmd_encod_tiled_32_rw #(
        .ADDRESS_NUMBER    (ADDRESS_NUMBER),
        .COLADDR_NUMBER    (COLADDR_NUMBER),
        .CMD_PAUSE_BITS    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT      (CMD_DONE_BIT),
        .FRAME_WIDTH_BITS  (FRAME_WIDTH_BITS),
        .RSEL              (RSEL),
        .WSEL              (WSEL)
    ) cmd_encod_tiled_32_rw_i (
        .mrst              (mrst),                    // input
        .clk               (mclk),                    // input
        .start_bank        (tiled_rw_bank),           // input[2:0] 
        .start_row         (tiled_rw_row),            // input[14:0] 
        .start_col         (tiled_rw_col),            // input[6:0] 
        .rowcol_inc_in     (tiled_rw_rowcol_inc),     // input[13:0] // [21:0] 
        .num_rows_in_m1    (tiled_rw_num_rows_m1),    // input[5:0] 
        .num_cols_in_m1    (tiled_rw_num_cols_m1),    // input[5:0] 
        .keep_open_in      (tiled_rw_keep_open),      // input
        .skip_next_page_in (tiled_rw_xfer_partial),   // input
        .start_rd          (tiled_rw_start_rd32),     // input
        .start_wr          (tiled_rw_start_wr32),     // input
        .start             (encod_tiled32_start_out), // output reg 
        .enc_cmd           (encod_tiled32_cmd),       // output[31:0] reg 
        .enc_wr            (encod_tiled32_wr),        // output reg 
        .enc_done          (encod_tiled32_done)       // output reg 
    );

// Combine sequencer data from multiple sources
    cmd_encod_4mux cmd_encod_4mux_i (
        .mrst                           (mrst),                    // input
        .clk                            (mclk),                    // input
        // from ps pio
        .start0                         (channel_pgm_en0),         // start_seq_ps_pio), // input
        .enc_cmd0                       ({22'b0,seq_data0}),       // input[31:0] 
        .enc_wr0                        (1'b0),                    // input
        .enc_done0                      (seq_set0),                // input
        // from encod_linear_rw
        .start1                         (encod_linear_start_out) , // input
        .enc_cmd1                       (encod_linear_cmd),        // input[31:0] 
        .enc_wr1                        (encod_linear_wr),         // input
        .enc_done1                      (encod_linear_done),       // input
        // from encod_tiled_rw
        .start2                         (encod_tiled16_start_out), // input
        .enc_cmd2                       (encod_tiled16_cmd),       // input[31:0] 
        .enc_wr2                        (encod_tiled16_wr),        // input
        .enc_done2                      (encod_tiled16_done),      // input
        // from encod_tiled_32_rw
        .start3                         (encod_tiled32_start_out), // input
        .enc_cmd3                       (encod_tiled32_cmd),       // input[31:0] 
        .enc_wr3                        (encod_tiled32_wr),        // input
        .enc_done3                      (encod_tiled32_done),      // input

        .start                          (), // output reg  not used - may be needed for cascading. Pulse before any data output
        .enc_cmd                        (seq_data),                // output[31:0] reg 
        .enc_wr                         (seq_wr),                  // output reg 
        .enc_done                       (seq_set)                  // output reg 
    );


    memctrl16 #(
        .DLY_LD                           (DLY_LD),
        .DLY_LD_MASK                      (DLY_LD_MASK),
        .MCONTR_PHY_0BIT_ADDR             (MCONTR_PHY_0BIT_ADDR),
        .MCONTR_PHY_0BIT_ADDR_MASK        (MCONTR_PHY_0BIT_ADDR_MASK),
        .MCONTR_PHY_0BIT_DLY_SET          (MCONTR_PHY_0BIT_DLY_SET),
        .MCONTR_PHY_0BIT_CMDA_EN          (MCONTR_PHY_0BIT_CMDA_EN),
        .MCONTR_PHY_0BIT_SDRST_ACT        (MCONTR_PHY_0BIT_SDRST_ACT),
        .MCONTR_PHY_0BIT_CKE_EN           (MCONTR_PHY_0BIT_CKE_EN),
        .MCONTR_PHY_0BIT_DCI_RST          (MCONTR_PHY_0BIT_DCI_RST),
        .MCONTR_PHY_0BIT_DLY_RST(MCONTR_PHY_0BIT_DLY_RST),
        .MCONTR_TOP_0BIT_ADDR(MCONTR_TOP_0BIT_ADDR),
        .MCONTR_TOP_0BIT_ADDR_MASK(MCONTR_TOP_0BIT_ADDR_MASK),
        .MCONTR_TOP_0BIT_MCONTR_EN(MCONTR_TOP_0BIT_MCONTR_EN),
        .MCONTR_TOP_0BIT_REFRESH_EN(MCONTR_TOP_0BIT_REFRESH_EN),
        .MCONTR_PHY_16BIT_ADDR(MCONTR_PHY_16BIT_ADDR),
        .MCONTR_PHY_16BIT_ADDR_MASK(MCONTR_PHY_16BIT_ADDR_MASK),
        .MCONTR_PHY_16BIT_PATTERNS(MCONTR_PHY_16BIT_PATTERNS),
        .MCONTR_PHY_16BIT_PATTERNS_TRI(MCONTR_PHY_16BIT_PATTERNS_TRI),
        .MCONTR_PHY_16BIT_WBUF_DELAY(MCONTR_PHY_16BIT_WBUF_DELAY),
        .MCONTR_PHY_16BIT_EXTRA(MCONTR_PHY_16BIT_EXTRA),
        .MCONTR_PHY_STATUS_CNTRL(MCONTR_PHY_STATUS_CNTRL),
        .MCONTR_ARBIT_ADDR(MCONTR_ARBIT_ADDR),
        .MCONTR_ARBIT_ADDR_MASK(MCONTR_ARBIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_ADDR(MCONTR_TOP_16BIT_ADDR),
        .MCONTR_TOP_16BIT_ADDR_MASK(MCONTR_TOP_16BIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_CHN_EN(MCONTR_TOP_16BIT_CHN_EN),
        .MCONTR_TOP_16BIT_REFRESH_PERIOD(MCONTR_TOP_16BIT_REFRESH_PERIOD),
        .MCONTR_TOP_16BIT_REFRESH_ADDRESS(MCONTR_TOP_16BIT_REFRESH_ADDRESS),
        .MCONTR_TOP_16BIT_STATUS_CNTRL(MCONTR_TOP_16BIT_STATUS_CNTRL),
        .MCONTR_PHY_STATUS_REG_ADDR(MCONTR_PHY_STATUS_REG_ADDR),
        .MCONTR_TOP_STATUS_REG_ADDR(MCONTR_TOP_STATUS_REG_ADDR),
        .CHNBUF_READ_LATENCY(CHNBUF_READ_LATENCY),
        .DFLT_DQS_PATTERN(DFLT_DQS_PATTERN),
        .DFLT_DQM_PATTERN(DFLT_DQM_PATTERN),
        .DFLT_DQ_TRI_ON_PATTERN(DFLT_DQ_TRI_ON_PATTERN),
        .DFLT_DQ_TRI_OFF_PATTERN(DFLT_DQ_TRI_OFF_PATTERN),
        .DFLT_DQS_TRI_ON_PATTERN(DFLT_DQS_TRI_ON_PATTERN),
        .DFLT_DQS_TRI_OFF_PATTERN(DFLT_DQS_TRI_OFF_PATTERN),
        .DFLT_WBUF_DELAY(DFLT_WBUF_DELAY),
        .DFLT_INV_CLK_DIV(DFLT_INV_CLK_DIV),
        .DFLT_CHN_EN(DFLT_CHN_EN),
        .DFLT_REFRESH_ADDR(DFLT_REFRESH_ADDR),
        .DFLT_REFRESH_PERIOD(DFLT_REFRESH_PERIOD),
        
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
        .CLKFBOUT_USE_FINE_PS  (CLKFBOUT_USE_FINE_PS),
        .CLKFBOUT_PHASE        (CLKFBOUT_PHASE),
        .SDCLK_PHASE           (SDCLK_PHASE),
        .CLK_PHASE             (CLK_PHASE),
        .CLK_DIV_PHASE         (CLK_DIV_PHASE),
        .MCLK_PHASE            (MCLK_PHASE),
        .REF_JITTER1           (REF_JITTER1),
        .SS_EN                 (SS_EN),
        .SS_MODE               (SS_MODE),
        .SS_MOD_PERIOD         (SS_MOD_PERIOD),
        .CMD_PAUSE_BITS        (CMD_PAUSE_BITS),
        .CMD_DONE_BIT          (CMD_DONE_BIT)
    ) memctrl16_i (
        .rst_in             (rst_in),                     // input
        .clk_in             (clk_in),                     // input
        .mclk               (mclk),                       // output
        .mrst               (mrst),                       // input
        .locked             (locked),                     // output
        .ref_clk            (ref_clk),                    // input
        .idelay_ctrl_reset  (idelay_ctrl_reset),          // output
        .cmd_ad             (cmd_mcontr_ad),              // input[7:0] 
        .cmd_stb            (cmd_mcontr_stb),             // input
        .status_ad          (status_mcontr_ad[7:0]),      // output[7:0]
        .status_rq          (status_mcontr_rq),           // input request to send status downstream
        .status_start       (status_mcontr_start),        // Acknowledge of the first status packet byte (address)
        
        .cmd0_clk           (axi_clk),                    // input
        .cmd0_we            (cmd_we),                     // input
        .cmd0_addr          (buf_waddr),                  // input[9:0] 
        .cmd0_data          (buf_wdata),                  // input[31:0] 
        
        .seq_data           (seq_data),                   // input[31:0] 
        .seq_wr             (seq_wr),                     // not used: seq_wr0), // input
        .seq_set            (seq_set),                    // input
         
        .want_rq0           (want_rq0),                   // input
        .need_rq0           (need_rq0),                   // input
        .channel_pgm_en0    (channel_pgm_en0),            // output reg 
        .reject0            (reject0),                    // input
        .seq_done0          (seq_done0),                  // output
        .page_nxt_chn0      (),                           //rpage_nxt_chn0), not used
        .buf_run0           (buf_run0),                   // output
        .buf_wr_chn0        (buf_wr_chn0),                // output
        .buf_wpage_nxt_chn0 (buf_wpage_nxt_chn0),         // output
        .buf_wdata_chn0     (buf_wdata_chn0),             // output[63:0]
        .buf_wrun0          (buf_wrun0),                  // output
        .buf_rd_chn0        (buf_rd_chn0),                // output
        .buf_rpage_nxt_chn0 (buf_rpage_nxt_chn0),         // output
        .buf_rdata_chn0     (buf_rdata_chn0),             // input[63:0] 

        .want_rq1           (want_rq1),                   // input
        .need_rq1           (need_rq1),                   // input
        .channel_pgm_en1    (channel_pgm_en1),            // output reg 
        .reject1            (reject1),                    // input
        .seq_done1          (seq_done1),                  // output
        .page_nxt_chn1      (page_ready_chn1),            //rpage_nxt_chn0), not used
        .buf_run1           (),                           // output
        .buf_wr_chn1        (buf_wr_chn1),                // output
        .buf_wpage_nxt_chn1 (buf_wpage_nxt_chn1),         // output
        .buf_wdata_chn1     (buf_wdata_chn1),             // output[63:0]
        .buf_wrun1          (),                           // output//buf_wrun1),
        .buf_rd_chn1        (buf_rd_chn1),                // output
        .buf_rpage_nxt_chn1 (rpage_nxt_chn1),             // buf_rpage_nxt_chn1), // output
        .buf_rdata_chn1     (buf_rdata_chn1),             // input[63:0] 
        
        .want_rq2           (want_rq2),                   // input
        .need_rq2           (need_rq2),                   // input
        .channel_pgm_en2    (channel_pgm_en2),            // output reg 
        .reject2            (reject2),                    // input
        .seq_done2          (seq_done2),                  // output
        .page_nxt_chn2      (page_ready_chn2),            //rpage_nxt_chn0), not used
        .buf_run2           (),                           // output //buf_run2),
        .buf_wr_chn2        (buf_wr_chn2),                // output
        .buf_wpage_nxt_chn2 (buf_wpage_nxt_chn2),         // output
        .buf_wdata_chn2     (buf_wdata_chn2),             // output[63:0]
        .buf_wrun2          (),                           // output//buf_wrun2),
        .buf_rd_chn2        (buf_rd_chn2),                // output
        .buf_rpage_nxt_chn2 (rpage_nxt_chn2),             // buf_rpage_nxt_chn2), // output
        .buf_rdata_chn2     (buf_rdata_chn2),             // input[63:0] 

        .want_rq3           (want_rq3),                   // input
        .need_rq3           (need_rq3),                   // input
        .channel_pgm_en3    (channel_pgm_en3),            // output reg 
        .reject3            (reject3),                    // input
        .seq_done3          (seq_done3),                  // output
        .page_nxt_chn3      (page_ready_chn3),            //rpage_nxt_chn0), not used
        .buf_run3           (),                           // output//buf_run3),
        .buf_wr_chn3        (buf_wr_chn3),                // output
        .buf_wpage_nxt_chn3 (buf_wpage_nxt_chn3),         // output
        .buf_wdata_chn3     (buf_wdata_chn3),             // output[63:0]
        .buf_wrun3          (),                           // output //buf_wrun3),
        .buf_rd_chn3        (buf_rd_chn3),                // output
        .buf_rpage_nxt_chn3 (rpage_nxt_chn3),             // buf_rpage_nxt_chn3), // output
        .buf_rdata_chn3     (buf_rdata_chn3),             // input[63:0] 

        .want_rq4           (want_rq4),                   // input
        .need_rq4           (need_rq4),                   // input
        .channel_pgm_en4    (channel_pgm_en4),            // output reg 
        .reject4            (reject4),                    // input
        .seq_done4          (seq_done4),                  // output
        .page_nxt_chn4      (page_ready_chn4),            //rpage_nxt_chn0), not used
        .buf_run4           (),                           // output //buf_run4),
        .buf_wr_chn4        (buf_wr_chn4),                // output
        .buf_wpage_nxt_chn4 (buf_wpage_nxt_chn4),         // output
        .buf_wdata_chn4     (buf_wdata_chn4),             // output[63:0]
        .buf_wrun4          (),                           // output//buf_wrun4),
        .buf_rd_chn4        (buf_rd_chn4),                // output
        .buf_rpage_nxt_chn4 (rpage_nxt_chn4),             // buf_rpage_nxt_chn4), // output
        .buf_rdata_chn4     (buf_rdata_chn4),             // input[63:0] 
        
        .want_rq8           (sens_want[0]),                // input
        .need_rq8           (sens_need[0]),                // input
        .channel_pgm_en8    (sens_channel_pgm_en[0]),      // output reg 
        .reject8            (sens_reject[0]),              // input
        .seq_done8          (sens_seq_done[0]),            // output
        .page_nxt_chn8      (),                            // output ?
        .buf_run8           (),                            // output
        .buf_rd_chn8        (sens_buf_rd[0]),              // output
        .buf_rpage_nxt_chn8 (sens_rpage_next[0]),          // output
        .buf_rdata_chn8     (sens_buf_dout[0 * 64 +: 64]), // input[63:0] 
        
        .want_rq9           (sens_want[1]),                // input
        .need_rq9           (sens_need[1]),                // input
        .channel_pgm_en9    (sens_channel_pgm_en[1]),      // output reg 
        .reject9            (sens_reject[1]),              // input
        .seq_done9          (sens_seq_done[1]),            // output
        .page_nxt_chn9      (),                            // output ?
        .buf_run9           (),                            // output
        .buf_rd_chn9        (sens_buf_rd[1]),              // output
        .buf_rpage_nxt_chn9 (sens_rpage_next[1]),          // output
        .buf_rdata_chn9     (sens_buf_dout[1 * 64 +: 64]), // input[63:0] 
        
        .want_rq10          (sens_want[2]),                // input
        .need_rq10          (sens_need[2]),                // input
        .channel_pgm_en10   (sens_channel_pgm_en[2]),      // output reg 
        .reject10           (sens_reject[2]),              // input
        .seq_done10         (sens_seq_done[2]),            // output
        .page_nxt_chn10     (),                            // output
        .buf_run10          (),                            // output
        .buf_rd_chn10       (sens_buf_rd[2]),              // output
        .buf_rpage_nxt_chn10(sens_rpage_next[2]),          // output
        .buf_rdata_chn10    (sens_buf_dout[2 * 64 +: 64]), // input[63:0] 
        
        .want_rq11          (sens_want[3]),                // input
        .need_rq11          (sens_need[3]),                // input
        .channel_pgm_en11   (sens_channel_pgm_en[3]),      // output reg 
        .reject11           (sens_reject[3]),              // input
        .seq_done11         (sens_seq_done[3]),            // output
        .page_nxt_chn11     (),                            // output
        .buf_run11          (),                            // output
        .buf_rd_chn11       (sens_buf_rd[3]),              // output
        .buf_rpage_nxt_chn11(sens_rpage_next[3]),          // output
        .buf_rdata_chn11    (sens_buf_dout[3 * 64 +: 64]), // input[63:0] 
 
        .want_rq12          (cmprs_want[0]),               // input
        .need_rq12          (cmprs_need[0]),               // input
        .channel_pgm_en12   (cmprs_channel_pgm_en[0]),     // output reg 
        .reject12           (cmprs_reject[0]),             // input
        .seq_done12         (cmprs_seq_done[0]),           // output
        .page_nxt_chn12     (cmprs_page_ready[0]),         // output ???
        .buf_run12          (),                            // output
        .buf_wr_chn12       (cmprs_buf_we[0]),             // output
        .buf_wpage_nxt_chn12(cmprs_buf_wpage_nxt[0]),      // output
        .buf_wdata_chn12    (cmprs_buf_din[0 * 64 +: 64]), // output[63:0] 
        .buf_wrun12         (),                            // output
 
        .want_rq13          (cmprs_want[1]),               // input
        .need_rq13          (cmprs_need[1]),               // input
        .channel_pgm_en13   (cmprs_channel_pgm_en[1]),     // output reg 
        .reject13           (cmprs_reject[1]),             // input
        .seq_done13         (cmprs_seq_done[1]),           // output
        .page_nxt_chn13     (cmprs_page_ready[1]),         // output ???
        .buf_run13          (),                            // output
        .buf_wr_chn13       (cmprs_buf_we[1]),             // output
        .buf_wpage_nxt_chn13(cmprs_buf_wpage_nxt[1]),      // output
        .buf_wdata_chn13    (cmprs_buf_din[1 * 64 +: 64]), // output[63:0] 
        .buf_wrun13         (),                            // output
 
        .want_rq14          (cmprs_want[2]),               // input
        .need_rq14          (cmprs_need[2]),               // input
        .channel_pgm_en14   (cmprs_channel_pgm_en[2]),     // output reg 
        .reject14           (cmprs_reject[2]),             // input
        .seq_done14         (cmprs_seq_done[2]),           // output
        .page_nxt_chn14     (cmprs_page_ready[2]),         // output ???
        .buf_run14          (),                            // output
        .buf_wr_chn14       (cmprs_buf_we[2]),             // output
        .buf_wpage_nxt_chn14(cmprs_buf_wpage_nxt[2]),      // output
        .buf_wdata_chn14    (cmprs_buf_din[2 * 64 +: 64]), // output[63:0] 
        .buf_wrun14         (),                            // output
 
        .want_rq15          (cmprs_want[3]),               // input
        .need_rq15          (cmprs_need[3]),               // input
        .channel_pgm_en15   (cmprs_channel_pgm_en[3]),     // output reg 
        .reject15           (cmprs_reject[3]),             // input
        .seq_done15         (cmprs_seq_done[3]),           // output
        .page_nxt_chn15     (cmprs_page_ready[3]),         // output ???
        .buf_run15          (),                            // output
        .buf_wr_chn15       (cmprs_buf_we[3]),             // output
        .buf_wpage_nxt_chn15(cmprs_buf_wpage_nxt[3]),      // output
        .buf_wdata_chn15    (cmprs_buf_din[3 * 64 +: 64]), // output[63:0] 
        .buf_wrun15         (),                            // output
 
        .SDRST              (SDRST),                       // output
        .SDCLK              (SDCLK),                       // output
        .SDNCLK             (SDNCLK),                      // output
        .SDA                (SDA),                         // output[14:0] 
        .SDBA               (SDBA),                        // output[2:0] 
        .SDWE               (SDWE),                        // output
        .SDRAS              (SDRAS),                       // output
        .SDCAS              (SDCAS),                       // output
        .SDCKE              (SDCKE),                       // output
        .SDODT              (SDODT),                       // output
        .SDD                (SDD),                         // inout[15:0] 
        .SDDML              (SDDML),                       // output
        .DQSL               (DQSL),                        // inout
        .NDQSL              (NDQSL),                       // inout
        .SDDMU              (SDDMU),                       // output
        .DQSU               (DQSU),                        // inout
        .NDQSU              (NDQSU),                       // inout
        .tmp_debug          (tmp_debug)                    // output[11:0] 
    );

endmodule

