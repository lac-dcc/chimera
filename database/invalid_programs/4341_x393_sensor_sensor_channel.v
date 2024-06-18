// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensor_channel
 * @file sensor_channel.v
 * @date 2015-05-10  
 * @author Andrey Filippov     
 *
 * @brief Top module for a sensor channel
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sensor_channel.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensor_channel.v is distributed in the hope that it will be useful,
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

module  sensor_channel#(
    // parameters, individual to sensor channels and those likely to be modified
    parameter SENSOR_NUMBER =             0,     // sensor number (0..3)
    parameter SENSOR_GROUP_ADDR =         'h400, // sensor registers base address
    parameter SENSOR_BASE_INC =           'h040, // increment for sesor channel
    parameter SENSI2C_STATUS_REG_BASE =   'h20,  // 4 locations" x30, x32, x34, x36
    parameter SENSI2C_STATUS_REG_INC =    2,     // increment to the next sensor
    parameter SENSI2C_STATUS_REG_REL =    0,     // 4 locations" 'h30, 'h32, 'h34, 'h36
    parameter SENSIO_STATUS_REG_REL =     1,     // 4 locations" 'h31, 'h33, 'h35, 'h37

    parameter SENS_SYNC_RADDR  =          'h4,
    parameter SENS_SYNC_MASK  =           'h7fc,
    // 2 locations reserved for control/status (if they will be needed)
    parameter SENS_SYNC_MULT  =           'h2,   // relative register address to write number of frames to combine in one (minus 1, '0' - each farme)
    parameter SENS_SYNC_LATE  =           'h3,    // number of lines to delay late frame sync
    parameter SENS_SYNC_FBITS =           16,    // number of bits in a frame counter for linescan mode
    parameter SENS_SYNC_LBITS =           16,    // number of bits in a line counter for sof_late output (limited by eof) 
    parameter SENS_SYNC_LATE_DFLT =       4, // 15,    // number of lines to delay late frame sync
    parameter SENS_SYNC_MINBITS =         8,    // number of bits to enforce minimal frame period 
    parameter SENS_SYNC_MINPER =          130,    // minimal frame period (in pclk/mclk?) 
    

    parameter SENSOR_NUM_HISTOGRAM=       3, // number of histogram channels
    parameter HISTOGRAM_RAM_MODE =        "BUF32", // "NOBUF", // valid: "NOBUF" (32-bits, no buffering), "BUF18", "BUF32"
    parameter SENS_NUM_SUBCHN =        3, // number of subchannels for his sensor ports (1..4)
    parameter SENS_GAMMA_BUFFER =         0, // 1 - use "shadow" table for clean switching, 0 - single table per channel
    
    // parameters defining address map
    parameter SENSOR_CTRL_RADDR =     0, //'h00
    parameter SENSOR_CTRL_ADDR_MASK = 'h7ff, //
        // bits of the SENSOR mode register
        parameter SENSOR_HIST_EN_BITS =    0,  // 0..3 1 - enable histogram modules, disable after processing the started frame
        parameter SENSOR_HIST_NRST_BITS =  4,  // 0 - immediately reset all histogram modules
        parameter SENSOR_HIST_BITS_SET  =  8,  // 1 - set bits 0..7 (en and nrst)
        parameter SENSOR_CHN_EN_BIT =      9,  // 1 - this enable channel
        parameter SENSOR_CHN_EN_BIT_SET = 10,  // set SENSOR_CHN_EN_BIT bit
        parameter SENSOR_16BIT_BIT =      11,  // 0 - 8 bpp mode, 1 - 16 bpp (bypass gamma). Gamma-processed data is still used for histograms
        parameter SENSOR_16BIT_BIT_SET =  12,  // set 8/16 bit mode
//        parameter SENSOR_MODE_WIDTH =     13,
    
    parameter SENSI2C_CTRL_RADDR =    2, // 'h02..'h03
    parameter SENSI2C_CTRL_MASK =     'h7fe,
      // sensor_i2c_io relative control register addresses
      parameter SENSI2C_CTRL =          'h0,
    // Control register bits
        parameter SENSI2C_CMD_TABLE =       29, // [29]: 1 - write to translation table (ignore any other fields), 0 - write other fields
        parameter SENSI2C_CMD_TAND =        28, // [28]: 1 - write table address (8 bits), 0 - write table data (28 bits)
    
        parameter SENSI2C_CMD_RESET =       14, // [14]   reset all FIFO (takes 16 clock pulses), also - stops i2c until run command
        parameter SENSI2C_CMD_RUN =         13, // [13:12]3 - run i2c, 2 - stop i2c (needed before software i2c), 1,0 - no change to run state
        parameter SENSI2C_CMD_RUN_PBITS =    1,
        parameter SENSI2C_CMD_USE_EOF =      8, // [9:8] - 0: advance sequencer at SOF, 1 - advance sequencer at EOF 
        parameter SENSI2C_CMD_SOFT_SDA =     6, // [7:6] - SDA software control: 0 - nop, 1 - low, 2 - active high, 3 - float
        parameter SENSI2C_CMD_SOFT_SCL =     4, // [5:4] - SCL software control: 0 - nop, 1 - low, 2 - active high, 3 - float
        parameter SENSI2C_CMD_FIFO_RD =      3, // advance I2C read data FIFO by 1  
        parameter SENSI2C_CMD_ACIVE =        2, // [2] - SENSI2C_CMD_ACIVE_EARLY0, SENSI2C_CMD_ACIVE_SDA
        parameter SENSI2C_CMD_ACIVE_EARLY0 = 1, // release SDA==0 early if next bit ==1
        parameter SENSI2C_CMD_ACIVE_SDA =    0,  // drive SDA=1 during the second half of SCL=1
        
    //i2c page table bit fields
        parameter SENSI2C_TBL_RAH =          0, // high byte of the register address 
        parameter SENSI2C_TBL_RAH_BITS =     8,
        parameter SENSI2C_TBL_RNWREG =       8, // read register (when 0 - write register
        parameter SENSI2C_TBL_SA =           9, // Slave address in write mode
        parameter SENSI2C_TBL_SA_BITS =      7,
        parameter SENSI2C_TBL_NBWR =        16, // number of bytes to write (1..10)
        parameter SENSI2C_TBL_NBWR_BITS =    4,
        parameter SENSI2C_TBL_NBRD =        16, // number of bytes to read (1 - 8) "0" means "8"
        parameter SENSI2C_TBL_NBRD_BITS =    3,
        parameter SENSI2C_TBL_NABRD =       19, // number of address bytes for read (0 - 1 byte, 1 - 2 bytes)
        parameter SENSI2C_TBL_DLY =         20, // bit delay (number of mclk periods in 1/4 of SCL period)
        parameter SENSI2C_TBL_DLY_BITS=      8,
      
      parameter SENSI2C_STATUS =        'h1,
    
    parameter SENS_GAMMA_RADDR =       'h38, //4,  'h38..'h3b
    parameter SENS_GAMMA_ADDR_MASK =   'h7fc,
      // sens_gamma registers
      parameter SENS_GAMMA_CTRL =        'h0,
      parameter SENS_GAMMA_ADDR_DATA =   'h1, // bit 20 ==1 - table address, bit 20==0 - table data (18 bits)
      parameter SENS_GAMMA_HEIGHT01 =    'h2, // bits [15:0] - height minus 1 of image 0, [31:16] - height-1 of image1
      parameter SENS_GAMMA_HEIGHT2 =     'h3, // bits [15:0] - height minus 1 of image 2 ( no need for image 3)
        // bits of the SENS_GAMMA_CTRL mode register
        parameter SENS_GAMMA_MODE_BAYER =      0,
        parameter SENS_GAMMA_MODE_BAYER_SET =  2,
        parameter SENS_GAMMA_MODE_PAGE =       3,
        parameter SENS_GAMMA_MODE_PAGE_SET =   4,
        parameter SENS_GAMMA_MODE_EN =         5,
        parameter SENS_GAMMA_MODE_EN_SET =     6,
        parameter SENS_GAMMA_MODE_REPET =      7,
        parameter SENS_GAMMA_MODE_REPET_SET =  8,
        parameter SENS_GAMMA_MODE_TRIG =       9,
// Vignetting correction / pixel value scaling - controlled via single data word (same as in 252), some of bits [23:16]
// are used to select register, bits 25:24 - select sub-frame
    parameter SENS_LENS_RADDR =             'h3c, 
    parameter SENS_LENS_ADDR_MASK =         'h7fc,
    parameter SENS_LENS_COEFF =             'h3, // set vignetting/scale coefficients (
      parameter SENS_LENS_AX =              'h00, // 00000...
      parameter SENS_LENS_AX_MASK =         'hf8,
      parameter SENS_LENS_AY =              'h08, // 00001...
      parameter SENS_LENS_AY_MASK =         'hf8,
      parameter SENS_LENS_C =               'h10, // 00010...
      parameter SENS_LENS_C_MASK =          'hf8,
      parameter SENS_LENS_BX =              'h20, // 001.....
      parameter SENS_LENS_BX_MASK =         'he0,
      parameter SENS_LENS_BY =              'h40, // 010.....
      parameter SENS_LENS_BY_MASK =         'he0,
      parameter SENS_LENS_SCALES =          'h60, // 01100...
      parameter SENS_LENS_SCALES_MASK =     'hf8,
      parameter SENS_LENS_FAT0_IN =         'h68, // 01101000
      parameter SENS_LENS_FAT0_IN_MASK =    'hff,
      parameter SENS_LENS_FAT0_OUT =        'h69, // 01101001
      parameter SENS_LENS_FAT0_OUT_MASK =   'hff,
      parameter SENS_LENS_POST_SCALE =      'h6a, // 01101010
      parameter SENS_LENS_POST_SCALE_MASK = 'hff,
    
    parameter SENSIO_RADDR =          8, //'h408  .. 'h40f
    parameter SENSIO_ADDR_MASK =      'h7f8,
      // sens_parallel12 registers
      parameter SENSIO_CTRL =           'h0,
        // SENSIO_CTRL register bits
        parameter SENS_CTRL_MRST =        0,  //  1: 0
        parameter SENS_CTRL_ARST =        2,  //  3: 2
        parameter SENS_CTRL_ARO =         4,  //  5: 4
        parameter SENS_CTRL_RST_MMCM =    6,  //  7: 6
`ifdef HISPI
        parameter SENS_CTRL_IGNORE_EMBED =8,  //  9: 8
`else        
        parameter SENS_CTRL_EXT_CLK =     8,  //  9: 8
`endif        
        parameter SENS_CTRL_LD_DLY =     10,  // 10
`ifdef HISPI
        parameter SENS_CTRL_GP0=      12,  // 14:12
        parameter SENS_CTRL_GP1=      15,  // 17:15
`else        
        parameter SENS_CTRL_QUADRANTS =      12,  // 17:12, enable - 20
        parameter SENS_CTRL_QUADRANTS_WIDTH = 7, // 6,
        parameter SENS_CTRL_ODD =             6, //
        parameter SENS_CTRL_QUADRANTS_EN =   20,  // 18:12, enable - 20 (1 bits reserved)
`endif        
      parameter SENSIO_STATUS =         'h1,
      parameter SENSIO_JTAG =           'h2,
        // SENSIO_JTAG register bits
        parameter SENS_JTAG_PGMEN =       8,
        parameter SENS_JTAG_PROG =        6,
        parameter SENS_JTAG_TCK =         4,
        parameter SENS_JTAG_TMS =         2,
        parameter SENS_JTAG_TDI =         0,
`ifndef HISPI
      parameter SENSIO_WIDTH =          'h3, // 1.. 2^16, 0 - use HACT
`endif      
      parameter SENSIO_DELAYS =         'h4, // 'h4..'h7
`ifdef MON_HISPI
        parameter SENSOR_TIMING_STATUS_REG_BASE =   'h40,  // 4 locations" x40, x41, x42, x43
        parameter SENSOR_TIMING_STATUS_REG_INC =      1,   // increment to the next sensor
        parameter SENSOR_TIMING_BITS =               24,   // increment to the next sensor
        parameter SENSOR_TIMING_START =              16,   // bit # in JTAB control word to start timing measurement (now f = 660/4 = 165) 
        parameter SENSOR_TIMING_LANE =               14,   // 15:14 - select lane
        parameter SENSOR_TIMING_FROM =               12,   // select from 0 - sof, 1 - sol, 2 - eof, 3 eol
        parameter SENSOR_TIMING_TO =                 10,   // select to   0 - sof, 1 - sol, 2 - eof, 3 eol
`endif            
      
        // 4 of 8-bit delays per register
    // sensor_i2c_io command/data write registers s (relative to SENSOR_BASE_ADDR)
    parameter SENSI2C_ABS_RADDR =       'h10, // 'h410..'h41f
    parameter SENSI2C_REL_RADDR =       'h20, // 'h420..'h42f
    parameter SENSI2C_ADDR_MASK =     'h7f0, // both for SENSI2C_ABS_ADDR and SENSI2C_REL_ADDR

    // sens_hist registers (relative to SENSOR_BASE_ADDR)
    parameter HISTOGRAM_RADDR0 =      'h30, //
    parameter HISTOGRAM_RADDR1 =      'h32, //
    parameter HISTOGRAM_RADDR2 =      'h34, //
    parameter HISTOGRAM_RADDR3 =      'h36, //
    parameter HISTOGRAM_ADDR_MASK =   'h7fe, // for each channel
      // sens_hist registers
      parameter HISTOGRAM_LEFT_TOP =     'h0,
      parameter HISTOGRAM_WIDTH_HEIGHT = 'h1, // 1.. 2^16, 0 - use HACT
      
    parameter [1:0] XOR_HIST_BAYER =  2'b00,// invert bayer setting    
    //sensor_i2c_io other parameters
    parameter integer SENSI2C_DRIVE=  12,
    parameter SENSI2C_IBUF_LOW_PWR=   "TRUE",
    parameter SENSI2C_SLEW =          "SLOW",
    
    parameter NUM_FRAME_BITS =        4,
    
`ifndef HISPI
    //sensor_fifo parameters
    parameter SENSOR_DATA_WIDTH =      12,
    parameter SENSOR_FIFO_2DEPTH =     4,
    parameter [3:0] SENSOR_FIFO_DELAY =      5, // 7,
`endif    
    
    // sens_parallel12 other parameters
    
    parameter IODELAY_GRP ="IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE = 0,
    parameter integer PXD_DRIVE = 12,
    parameter PXD_IBUF_LOW_PWR = "TRUE",
    parameter PXD_SLEW = "SLOW",
    parameter real SENS_REFCLK_FREQUENCY =    300.0,
    parameter SENS_HIGH_PERFORMANCE_MODE =    "FALSE",
`ifdef HISPI
    parameter PXD_CAPACITANCE =          "DONT_CARE",
    parameter PXD_CLK_DIV =              10, // 220MHz -> 22MHz
    parameter PXD_CLK_DIV_BITS =          4,
//`else    
//    parameter SENS_PCLK_PERIOD =        10.000,  // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
`endif    
    
    parameter SENS_PHASE_WIDTH=        8,      // number of bits for te phase counter (depends on divisors)
    parameter SENS_BANDWIDTH =         "OPTIMIZED",  //"OPTIMIZED", "HIGH","LOW"

    // parameters for the sensor-synchronous clock PLL
`ifdef HISPI    
    parameter CLKIN_PERIOD_SENSOR =      3.000,  // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter CLKFBOUT_MULT_SENSOR =     3,      // 330 MHz --> 990 MHz
    parameter CLKFBOUT_PHASE_SENSOR =    0.000,  // CLOCK FEEDBACK phase in degrees (3 significant digits, -360.000...+360.000)
    parameter IPCLK_PHASE =              0.000,
    parameter IPCLK2X_PHASE =            0.000,
    parameter PXD_IOSTANDARD =           "LVCMOS18",
    parameter SENSI2C_IOSTANDARD =       "LVCMOS18",
`else    
    parameter CLKIN_PERIOD_SENSOR =      10.000, // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter CLKFBOUT_MULT_SENSOR =     8,      // 100 MHz --> 800 MHz
    parameter CLKFBOUT_PHASE_SENSOR =    0.000,  // CLOCK FEEDBACK phase in degrees (3 significant digits, -360.000...+360.000)
    parameter IPCLK_PHASE =              0.000,
    parameter IPCLK2X_PHASE =            0.000,
    parameter PXD_IOSTANDARD =           "LVCMOS25",
    parameter SENSI2C_IOSTANDARD =       "LVCMOS25",
`endif
    
    parameter BUF_IPCLK =             "BUFR",
    parameter BUF_IPCLK2X =           "BUFR",  

    parameter SENS_DIVCLK_DIVIDE =     1,            // Integer 1..106. Divides all outputs with respect to CLKIN
    parameter SENS_REF_JITTER1   =     0.010,        // Expected jitter on CLKIN1 (0.000..0.999)
    parameter SENS_REF_JITTER2   =     0.010,
    parameter SENS_SS_EN         =     "FALSE",      // Enables Spread Spectrum mode
    parameter SENS_SS_MODE       =     "CENTER_HIGH",//"CENTER_HIGH","CENTER_LOW","DOWN_HIGH","DOWN_LOW"
    parameter SENS_SS_MOD_PERIOD =     10000        // integer 4000-40000 - SS modulation period in ns
    
`ifdef HISPI
   ,parameter HISPI_MSB_FIRST =            0,
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
    parameter HISPI_IOSTANDARD =          "DIFF_SSTL18_I" //"DIFF_SSTL18_II" for high current (13.4mA vs 8mA)
`endif    
    
`ifdef DEBUG_RING
        ,parameter DEBUG_CMD_LATENCY = 2 
`endif        
    
) (

    input                       pclk,   // global clock input, pixel rate (96MHz for MT9P006)
    // TODO: get rid of pclk2x in histograms by doubling memories (making 1 write port and 2 read ones)
    // How to erase?
    // Alternative: copy/erase to a separate buffer in the beginning/end of a frame?
`ifdef USE_PCLK2X    
    input                       pclk2x, // global clock input, double pixel rate (192MHz for MT9P006)
`endif    
    input                       mrst,      // @posedge mclk, sync reset
    input                       prst,      // @posedge pclk, sync reset
    
    // I/O pads, pin names match circuit diagram
`ifdef HISPI   
    input                 [3:0] sns_dp,
    input                 [3:0] sns_dn,
    inout                 [7:4] sns_dp74,
    inout                 [7:4] sns_dn74,
    input                       sns_clkp,
    input                       sns_clkn,
`else
    inout                 [7:0] sns_dp,
    inout                 [7:0] sns_dn,
    inout                       sns_clkp,
    inout                       sns_clkn,
`endif    
    inout                       sns_scl,
    inout                       sns_sda,
`ifdef HISPI   
    output                      sns_ctl,
`else    
    inout                       sns_ctl,
`endif    
    inout                       sns_pg,
    // programming interface
    input                       mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input                 [7:0] cmd_ad_in,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                       cmd_stb_in,     // strobe (with first byte) for the command a/d
    output                [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                      status_rq,   // input request to send status downstream
    input                       status_start, // Acknowledge of the first status packet byte (address)

    input                       trigger_mode, // running in triggered mode (0 - free running mode)
    input                       trig_in,      // per-sensor trigger input
    
    input  [NUM_FRAME_BITS-1:0] frame_num_seq, // frame number from the command sequencer (to sync i2c)
    // 16/8-bit mode data to memory (8-bits are packed by 2 in 16 mode @posedge pclk
    output               [15:0] dout,         // @posedge pclk
    output                      dout_valid,   // in 8-bit mode continues pixel flow have dout_valid alternating on/off
    output                      last_in_line, // valid with dout_valid - last in line dout
     
    output                      sof_out,       // @pclk start of frame 1-clk pulse with the same delays as output data
    output                      eof_out,       // @pclk end of frame 1-clk pulse with the same delays as output data
    output                      sof_out_mclk,  // @mclk filtered, possibly decimated  start of frame 
    output                      sof_late_mclk, // @mclk filtered, possibly decimated  start of frame, delayed by specified number of lines

    // histogram interface to S_AXI, 256x32bit continuous bursts @posedge mclk, each histogram having 4 bursts
    output                      hist_request, // request to transfer a burst
    output [NUM_FRAME_BITS-1:0] hist_frame,
    input                       hist_grant,   // request to transfer over S_AXI granted
    output                [1:0] hist_chn,     // output[1:0] histogram (sub) channel, valid with request and transfer
    output                      hist_dvalid,  // output data valid - active when sending a burst
    output               [31:0] hist_data     // output[31:0] histogram data
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load
     input                        debug_di  // input from the debug ring
`endif         
    
);
`ifdef DEBUG_RING
    localparam DEBUG_RING_LENGTH = 5; // for now - just connect the histogram(s) module(s)
    wire [DEBUG_RING_LENGTH:0] debug_ring; // TODO: adjust number of bits
    assign debug_do = debug_ring[0];
    assign debug_ring[DEBUG_RING_LENGTH] = debug_di;
`endif    

`ifdef USE_PCLK2X    
    localparam    HIST_MONOCHROME = 1'b0; // TODO:make it configurable (at expense of extra hardware). 
                                          // No, will not use it - monochrome is rare, can combine
                                          // 4 (color) histograms by the software.  
`endif

    localparam SENSOR_BASE_ADDR =   (SENSOR_GROUP_ADDR + SENSOR_NUMBER * SENSOR_BASE_INC);
    localparam SENSI2C_STATUS_REG = (SENSI2C_STATUS_REG_BASE + SENSOR_NUMBER * SENSI2C_STATUS_REG_INC + SENSI2C_STATUS_REG_REL);
    localparam SENSIO_STATUS_REG =  (SENSI2C_STATUS_REG_BASE + SENSOR_NUMBER * SENSI2C_STATUS_REG_INC + SENSIO_STATUS_REG_REL);

//        parameter SENSOR_TIMING_STATUS_REG_BASE =   'h40,  // 4 locations" x40, x41, x42, x43
//        parameter SENSOR_TIMING_STATUS_REG_INC =      1,   // increment to the next sensor
`ifdef MON_HISPI    
    localparam SENSOR_TIMING_STATUS_REG = (SENSOR_TIMING_STATUS_REG_BASE + SENSOR_NUMBER * SENSOR_TIMING_STATUS_REG_INC);
`endif    
    localparam SENS_SYNC_ADDR =     SENSOR_BASE_ADDR + SENS_SYNC_RADDR;
//    parameter SENSOR_BASE_ADDR =    'h300; // sensor registers base address
    localparam SENSOR_CTRL_ADDR =  SENSOR_BASE_ADDR + SENSOR_CTRL_RADDR;
    localparam SENSI2C_CTRL_ADDR = SENSOR_BASE_ADDR + SENSI2C_CTRL_RADDR;
    localparam SENS_GAMMA_ADDR =   SENSOR_BASE_ADDR + SENS_GAMMA_RADDR;
    localparam SENSIO_ADDR =       SENSOR_BASE_ADDR + SENSIO_RADDR; 
    localparam SENS_LENS_ADDR =    SENSOR_BASE_ADDR + SENS_LENS_RADDR; 
    localparam SENSI2C_ABS_ADDR =  SENSOR_BASE_ADDR + SENSI2C_ABS_RADDR;
    localparam SENSI2C_REL_ADDR =  SENSOR_BASE_ADDR + SENSI2C_REL_RADDR;
    localparam HISTOGRAM_ADDR0 =   (SENSOR_NUM_HISTOGRAM > 0)?(SENSOR_BASE_ADDR + HISTOGRAM_RADDR0):-1; //
    localparam HISTOGRAM_ADDR1 =   (SENSOR_NUM_HISTOGRAM > 1)?(SENSOR_BASE_ADDR + HISTOGRAM_RADDR1):-1; //
    localparam HISTOGRAM_ADDR2 =   (SENSOR_NUM_HISTOGRAM > 2)?(SENSOR_BASE_ADDR + HISTOGRAM_RADDR2):-1; //
    localparam HISTOGRAM_ADDR3 =   (SENSOR_NUM_HISTOGRAM > 3)?(SENSOR_BASE_ADDR + HISTOGRAM_RADDR3):-1; //

    reg                 [7:0] cmd_ad;      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    reg                       cmd_stb;     // strobe (with first byte) for the command a/d


    wire                [7:0] sens_i2c_status_ad;
    wire                      sens_i2c_status_rq;
    wire                      sens_i2c_status_start;
    wire                [7:0] sens_phys_status_ad;
    wire                      sens_phys_status_rq;
    wire                      sens_phys_status_start;
    
`ifndef HISPI        
    wire                      ipclk;   // Use in FIFO
    wire               [11:0] pxd_to_fifo;
    wire                      vact_to_fifo;    // frame active @posedge  ipclk
    wire                      hact_to_fifo;    // line active @posedge  ipclk
`endif    
    // data from FIFO
    wire               [11:0] pxd;     // TODO: align MSB? parallel data, @posedge  ipclk
    wire                      hact;    // line active @posedge  ipclk
    wire                      sof; // start of frame
    wire                      eof; // end of frame
    wire                      eof_mclk; // to be used by i2c sequencer
    
    wire                      sof_out_sync; // sof filtetred, optionally decimated (for linescan mode)
    
    wire               [15:0] lens_pxd_in; 
    wire                      lens_hact_in;
    wire                      lens_sof_in;
    wire                      lens_eof_in;



    wire               [15:0] gamma_pxd_in; 
    wire                      gamma_hact_in;
    wire                      gamma_sof_in;
    wire                      gamma_eof_in;
    wire                [1:0] gamma_bayer; // gamma module mode register bits -> lens_flat module
    
    wire                [7:0] gamma_pxd_out; 
    wire                      gamma_hact_out;
    wire                      gamma_sof_out;
    wire                      gamma_eof_out;
    
    wire               [31:0] sensor_ctrl_data;
    wire                      sensor_ctrl_we;
    reg                 [3:0] hist_en;
    reg                       en_mclk; // enable this channel
    wire                      en_pclk; // enable in pclk domain   
    reg                [3:0] hist_nrst;
    reg                       bit16; // 16-bit mode, 0 - 8 bit mode
    wire [NUM_FRAME_BITS-1:0] hist_frame0;
    wire [NUM_FRAME_BITS-1:0] hist_frame1;
    wire [NUM_FRAME_BITS-1:0] hist_frame2;
    wire [NUM_FRAME_BITS-1:0] hist_frame3;
    wire                [3:0] hist_rq;
    wire                [3:0] hist_gr;
    wire                [3:0] hist_dv;
    wire               [31:0] hist_do0;
    wire               [31:0] hist_do1;
    wire              [31:0] hist_do2;
    wire               [31:0] hist_do3;
    reg                 [7:0] gamma_data_r;
    reg                [15:0] dout_r;
    reg                       dav_8bit;
    reg                       dav_r;       
    wire               [15:0] dout_w;
    wire                      dav_w;
    wire                      trig;
    reg                       sof_out_r;       
    reg                       eof_out_r;       
    wire                      prsts;  // @pclk - includes sensor reset and sensor PLL reset
    
    // TODO: insert vignetting and/or flat field, pixel defects before gamma_*_in
    assign lens_pxd_in = {pxd[11:0],4'b0};
    assign lens_hact_in = hact;
    assign lens_sof_in =  sof_out_sync; // sof;
    assign lens_eof_in =  eof;
    
    assign dout = dout_r;
    assign dout_valid = dav_r;
    assign sof_out = sof_out_r;       
    assign eof_out = eof_out_r;       
    
//    assign dout_w = bit16 ? gamma_pxd_in :  {gamma_data_r,gamma_pxd_out};
    assign dout_w = bit16 ? gamma_pxd_in :  {gamma_pxd_out,gamma_data_r}; // earlier data in LSB, later - MSB
    assign dav_w =  bit16 ? gamma_hact_in : dav_8bit;
    assign last_in_line = ! ( bit16 ? gamma_hact_in : gamma_hact_out);
     
//    assign en_mclk =   mode[SENSOR_CHN_EN_BIT];
//    assign hist_en =   mode[SENSOR_HIST_EN_BITS +: 4];
//    assign hist_nrst = mode[SENSOR_HIST_NRST_BITS +: 4];
//    assign bit16 =     mode[SENSOR_16BIT_BIT];
    
    
`ifdef DEBUG_RING
    `ifdef HISPI
    `else
        reg vact_to_fifo_r;    
    `endif
    reg hact_to_fifo_r;
    reg [15:0] debug_line_cntr;
    reg [15:0] debug_lines;
    reg [15:0] hact_cntr;
    reg [15:0] vact_cntr;
`ifdef HISPI
    always @(posedge pclk) begin
//        vact_to_fifo_r <= vact_to_fifo;
        hact_to_fifo_r <= hact;

        if      (sof)  debug_line_cntr <=           0;
        else if (hact && !hact_to_fifo_r)           debug_line_cntr <= debug_line_cntr + 1;

        if      (sof)   debug_lines <=              debug_line_cntr;
        
        if      (prst)                              hact_cntr <= 0;
        else if (hact && !hact_to_fifo_r)           hact_cntr <= hact_cntr + 1;

        if      (prst)                              vact_cntr <= 0;
        else if (sof)   vact_cntr <= vact_cntr + 1;
        
    end
`else    
    always @(posedge ipclk) begin
        vact_to_fifo_r <= vact_to_fifo;
        hact_to_fifo_r <= hact_to_fifo;

        if      (vact_to_fifo && !vact_to_fifo_r)  debug_line_cntr <= 0;
        else if (hact_to_fifo && !hact_to_fifo_r)  debug_line_cntr <= debug_line_cntr + 1;

        if      (vact_to_fifo && !vact_to_fifo_r)   debug_lines <= debug_line_cntr;
        
        if      (irst)                              hact_cntr <= 0;
        else if (hact_to_fifo && !hact_to_fifo_r)   hact_cntr <= hact_cntr + 1;

        if      (irst)                              vact_cntr <= 0;
        else if (vact_to_fifo && !vact_to_fifo_r)   vact_cntr <= vact_cntr + 1;
        
    end
`endif    
    debug_slave #(
        .SHIFT_WIDTH       (128),
        .READ_WIDTH        (128),
        .WRITE_WIDTH       (32),
        .DEBUG_CMD_LATENCY (DEBUG_CMD_LATENCY)
    ) debug_slave_i (
        .mclk       (mclk),          // input
        .mrst       (mrst),          // input
        .debug_di   (debug_ring[5]), // input
        .debug_sl   (debug_sl),      // input
        .debug_do   (debug_ring[4]), // output
//        .rd_data   ({height_m1[15:0], vcntr[15:0], width_m1[15:0],  hcntr[15:0]}), // input[31:0] 
//        .rd_data   ({vact_cntr[15:0], hact_cntr[15:0], debug_lines[15:0], debug_line_cntr[15:0]}), // input[31:0]
//        .rd_data   ({6'b0,hist_grant,hist_request, hist_gr[3:0], hist_rq[3:0], hact_cntr[15:0], debug_lines[15:0], debug_line_cntr[15:0]}), // input[31:0]
        .rd_data   ({
        lens_pxd_in, gamma_pxd_in[15:0],
`ifdef HISPI
        12'b0,
`else        
        pxd_to_fifo[11:0],
`endif        
        pxd[11:0],gamma_pxd_out[7:0],
        6'b0,hist_grant,hist_request, hist_gr[3:0], hist_rq[3:0], hact_cntr[15:0],
        debug_lines[15:0], debug_line_cntr[15:0]}), // input[31:0]
         
//debug_lines <= debug_line_cntr        
        .wr_data    (), // output[31:0]  - not used
        .stb        () // output  - not used
    );
`endif    
    
    
    always @ (posedge mclk) begin
        cmd_ad  <= cmd_ad_in; 
        cmd_stb <= cmd_stb_in;
    end

    always @ (posedge mclk) begin
//        if      (mrst)           mode <= 0;
//        else if (sensor_ctrl_we) mode <= sensor_ctrl_data[SENSOR_MODE_WIDTH-1:0];
        if      (mrst)                                                      hist_en <=   0;
        else if (sensor_ctrl_we && sensor_ctrl_data[SENSOR_HIST_BITS_SET])  hist_en <=   sensor_ctrl_data[SENSOR_HIST_EN_BITS +:4];
        if      (mrst)                                                      hist_nrst <= 0;
        else if (sensor_ctrl_we && sensor_ctrl_data[SENSOR_HIST_BITS_SET])  hist_nrst <= sensor_ctrl_data[SENSOR_HIST_NRST_BITS +:4];
        if      (mrst)                                                      en_mclk <=   0;
        else if (sensor_ctrl_we && sensor_ctrl_data[SENSOR_CHN_EN_BIT_SET]) en_mclk <=   sensor_ctrl_data[SENSOR_CHN_EN_BIT];
        if      (mrst)                                                      bit16 <=     0;
        else if (sensor_ctrl_we && sensor_ctrl_data[SENSOR_16BIT_BIT_SET])  bit16 <=     sensor_ctrl_data[SENSOR_16BIT_BIT];
    end
    
    always @ (posedge pclk) begin
        if (dav_w) dout_r <= dout_w;

        dav_r <= dav_w;

        dav_8bit <= gamma_hact_out && !dav_8bit;
        
        if (gamma_hact_out && !dav_8bit) gamma_data_r <= gamma_pxd_out;
        
        sof_out_r <= bit16 ? gamma_sof_in : gamma_sof_out;
        eof_out_r <= bit16 ? gamma_eof_in : gamma_eof_out;
    end

    level_cross_clocks  level_cross_clocks_en_pclk_i (.clk(pclk), .d_in(en_mclk), .d_out(en_pclk));
    
    status_router2 status_router2_sensor_i (
        .rst       (1'b0), //rst),                     // input
        .clk       (mclk),                    // input
        .srst      (mrst),                    // input
        .db_in0    (sens_i2c_status_ad),      // input[7:0] 
        .rq_in0    (sens_i2c_status_rq),      // input
        .start_in0 (sens_i2c_status_start),   // output
        .db_in1    (sens_phys_status_ad),    // input[7:0] 
        .rq_in1    (sens_phys_status_rq),    // input
        .start_in1 (sens_phys_status_start), // output
        .db_out    (status_ad),               // output[7:0] 
        .rq_out    (status_rq),               // output
        .start_out (status_start)             // input
    );

    cmd_deser #(
        .ADDR        (SENSOR_CTRL_ADDR),
        .ADDR_MASK   (SENSOR_CTRL_ADDR_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (1),
        .DATA_WIDTH  (32)
    ) cmd_deser_sens_channel_i (
        .rst         (1'b0), // rst),               // input
        .clk         (mclk),              // input
        .srst        (mrst),                    // input
        .ad          (cmd_ad),            // input[7:0] 
        .stb         (cmd_stb),           // input
        .addr      (),                    // output[0:0] - not used
        .data        (sensor_ctrl_data),  // output[31:0] 
        .we          (sensor_ctrl_we)     // output
    );

    sensor_i2c_io #(
        .SENSI2C_ABS_ADDR        (SENSI2C_ABS_ADDR),
        .SENSI2C_REL_ADDR        (SENSI2C_REL_ADDR),
        .SENSI2C_ADDR_MASK       (SENSI2C_ADDR_MASK),
        .SENSI2C_CTRL_ADDR       (SENSI2C_CTRL_ADDR),
        .SENSI2C_CTRL_MASK       (SENSI2C_CTRL_MASK),
        .SENSI2C_CTRL            (SENSI2C_CTRL),
        .SENSI2C_STATUS          (SENSI2C_STATUS),
        .SENSI2C_STATUS_REG      (SENSI2C_STATUS_REG),
        .SENSI2C_CMD_TABLE       (SENSI2C_CMD_TABLE),
        .SENSI2C_CMD_TAND        (SENSI2C_CMD_TAND),
        .SENSI2C_CMD_RESET       (SENSI2C_CMD_RESET),
        .SENSI2C_CMD_RUN         (SENSI2C_CMD_RUN),
        .SENSI2C_CMD_RUN_PBITS   (SENSI2C_CMD_RUN_PBITS),
        .SENSI2C_CMD_USE_EOF     (SENSI2C_CMD_USE_EOF),
        .SENSI2C_CMD_SOFT_SDA    (SENSI2C_CMD_SOFT_SDA),
        .SENSI2C_CMD_SOFT_SCL    (SENSI2C_CMD_SOFT_SCL),
        .SENSI2C_CMD_FIFO_RD     (SENSI2C_CMD_FIFO_RD),
        .SENSI2C_CMD_ACIVE       (SENSI2C_CMD_ACIVE),
        .SENSI2C_CMD_ACIVE_EARLY0(SENSI2C_CMD_ACIVE_EARLY0),
        .SENSI2C_CMD_ACIVE_SDA   (SENSI2C_CMD_ACIVE_SDA),
        .SENSI2C_TBL_RAH         (SENSI2C_TBL_RAH), // high byte of the register address 
        .SENSI2C_TBL_RAH_BITS    (SENSI2C_TBL_RAH_BITS),
        .SENSI2C_TBL_RNWREG      (SENSI2C_TBL_RNWREG), // read register (when 0 - write register
        .SENSI2C_TBL_SA          (SENSI2C_TBL_SA), // Slave address in write mode
        .SENSI2C_TBL_SA_BITS     (SENSI2C_TBL_SA_BITS),
        .SENSI2C_TBL_NBWR        (SENSI2C_TBL_NBWR), // number of bytes to write (1..10)
        .SENSI2C_TBL_NBWR_BITS   (SENSI2C_TBL_NBWR_BITS),
        .SENSI2C_TBL_NBRD        (SENSI2C_TBL_NBRD), // number of bytes to read (1 - 8) "0" means "8"
        .SENSI2C_TBL_NBRD_BITS   (SENSI2C_TBL_NBRD_BITS),
        .SENSI2C_TBL_NABRD       (SENSI2C_TBL_NABRD), // number of address bytes for read (0 - 1 byte, 1 - 2 bytes)
        .SENSI2C_TBL_DLY         (SENSI2C_TBL_DLY),   // bit delay (number of mclk periods in 1/4 of SCL period)
        .SENSI2C_TBL_DLY_BITS    (SENSI2C_TBL_DLY_BITS),
        .SENSI2C_DRIVE           (SENSI2C_DRIVE),
        .SENSI2C_IBUF_LOW_PWR    (SENSI2C_IBUF_LOW_PWR),
        .SENSI2C_IOSTANDARD      (SENSI2C_IOSTANDARD),
        .SENSI2C_SLEW            (SENSI2C_SLEW),
        .NUM_FRAME_BITS          (NUM_FRAME_BITS)
    ) sensor_i2c_io_i (
        .mrst                  (mrst),                  // input
        .mclk                  (mclk),                  // input
        .cmd_ad                (cmd_ad),                // input[7:0] 
        .cmd_stb               (cmd_stb),               // input
        .status_ad             (sens_i2c_status_ad),    // output[7:0] 
        .status_rq             (sens_i2c_status_rq),    // output
        .status_start          (sens_i2c_status_start), // input
        .frame_sync            (sof_out_mclk),          // input
        .eof_mclk              (eof_mclk),              // End of frame for i2c sequencer (will not work for linescan mode: either disable or make
                                                        // division as in sof_out_mclk
        .frame_num_seq         (frame_num_seq),         // input[3:0] 
        .scl                   (sns_scl),               // inout
        .sda                   (sns_sda)                // inout
    );

// debug_hist_mclk is never active, alive_hist0_rq == 0
//    assign status_alive = {last_in_line_1cyc_mclk, dout_valid_1cyc_mclk, alive_hist0_gr, alive_hist0_rq, sof_out_mclk, eof_mclk, sof_mclk, sol_mclk};
//    assign status_alive = {last_in_line_1cyc_mclk, dout_valid_1cyc_mclk, debug_hist_mclk[0], alive_hist0_rq, sof_out_mclk, eof_mclk, sof_mclk, sol_mclk};
`ifndef HISPI    
    reg  hact_r; // hact delayed by 1 cycle to generate start pulse
    reg dout_valid_d_pclk; //@ pclk - delayed by 1 clk from dout_valid to detect edge
    reg last_in_line_d_pclk; //@ pclk - delayed by 1 clk from last_in_line to detect edge
    reg hist_rq0_r;
    reg hist_gr0_r;
    wire sol_mclk;
    wire sof_mclk;
//    wire eof_mclk;
    wire alive_hist0_rq = hist_rq[0] && !hist_rq0_r;
    wire alive_hist0_gr = hist_gr[0] && !hist_gr0_r;
    // sof_out_mclk - already exists
    wire dout_valid_1cyc_mclk;
    wire last_in_line_1cyc_mclk;
//    wire [3:0] debug_hist_mclk;
    wire irst; // @ posedge ipclk
    localparam STATUS_ALIVE_WIDTH = 8;
    wire [STATUS_ALIVE_WIDTH - 1 : 0] status_alive;
    assign status_alive = {last_in_line_1cyc_mclk, dout_valid_1cyc_mclk, alive_hist0_gr, alive_hist0_rq,
                            sof_out_mclk, eof_mclk, sof_mclk, sol_mclk};
    always @ (posedge mclk) begin
        hist_rq0_r <= hist_rq[0];
        hist_gr0_r <= hist_gr[0];
    end

    always @ (posedge pclk) begin
        hact_r <= gamma_hact_out;
        dout_valid_d_pclk <= dout_valid;
        last_in_line_d_pclk <= last_in_line;
    end
    

    // for debug/test alive   
        pulse_cross_clock pulse_cross_clock_sol_mclk_i (
//            .rst         (prst),                  // input
            .rst         (prsts),                  // input extended to include sensor reset and rst_mmcm
            .src_clk     (pclk),                  // input
            .dst_clk     (mclk),                  // input
    //        .in_pulse    (hact && !hact_r),       // input
            .in_pulse    (gamma_hact_out && !hact_r),       // input
            .out_pulse   (sol_mclk),              // output
            .busy() // output
        );
    
        pulse_cross_clock pulse_cross_clock_sof_mclk_i (
//            .rst         (prst),                  // input
            .rst         (prsts),                  // input extended to include sensor reset and rst_mmcm
            .src_clk     (pclk),                  // input
            .dst_clk     (mclk),                  // input
    //        .in_pulse    (sof),                   // input
            .in_pulse    (gamma_sof_out),         // input
            .out_pulse   (sof_mclk),              // output
            .busy() // output
        );
    
    
        pulse_cross_clock pulse_cross_clock_dout_valid_1cyc_mclk_i (
//            .rst         (prst),                  // input
            .rst         (prsts),                  // input extended to include sensor reset and rst_mmcm
            .src_clk     (pclk),                             // input
            .dst_clk     (mclk),                             // input
            .in_pulse    (dout_valid && !dout_valid_d_pclk), // input
            .out_pulse   (dout_valid_1cyc_mclk),             // output
            .busy() // output
        );
    
        pulse_cross_clock pulse_cross_clock_last_in_line_1cyc_mclk_i (
//            .rst         (prst),                  // input
            .rst         (prsts),                  // input extended to include sensor reset and rst_mmcm
            .src_clk     (pclk),                                 // input
            .dst_clk     (mclk),                                 // input
            .in_pulse    (last_in_line && !last_in_line_d_pclk), // input
            .out_pulse   (last_in_line_1cyc_mclk),               // output
            .busy() // output
        );
    
`endif    

        pulse_cross_clock pulse_cross_clock_eof_mclk_i (
            .rst         (prsts),                  // input extended to include sensor reset and rst_mmcm
            .src_clk     (pclk),                  // input
            .dst_clk     (mclk),                  // input
            .in_pulse    (eof),                   // input
            .out_pulse   (eof_mclk),              // output
            .busy() // output
        );
    


`ifdef HISPI
        sens_10398 #(
            .SENSIO_ADDR            (SENSIO_ADDR),
            .SENSIO_ADDR_MASK       (SENSIO_ADDR_MASK),
            .SENSIO_CTRL            (SENSIO_CTRL),
            .SENSIO_STATUS          (SENSIO_STATUS),
            .SENSIO_JTAG            (SENSIO_JTAG),
            .SENSIO_DELAYS          (SENSIO_DELAYS),
            .SENSIO_STATUS_REG      (SENSIO_STATUS_REG),
`ifdef MON_HISPI
            .SENSOR_TIMING_BITS      (SENSOR_TIMING_BITS),
            .TIM_START               (SENSOR_TIMING_START),
            .TIM_LANE                (SENSOR_TIMING_LANE),
            .TIM_FROM                (SENSOR_TIMING_FROM),
            .TIM_TO                  (SENSOR_TIMING_TO),
            .SENSOR_TIMING_STATUS_REG(SENSOR_TIMING_STATUS_REG), // localparam
`endif            
            .SENS_JTAG_PGMEN        (SENS_JTAG_PGMEN),
            .SENS_JTAG_PROG         (SENS_JTAG_PROG),
            .SENS_JTAG_TCK          (SENS_JTAG_TCK),
            .SENS_JTAG_TMS          (SENS_JTAG_TMS),
            .SENS_JTAG_TDI          (SENS_JTAG_TDI),
            .SENS_CTRL_MRST         (SENS_CTRL_MRST),
            .SENS_CTRL_ARST         (SENS_CTRL_ARST),
            .SENS_CTRL_ARO          (SENS_CTRL_ARO),
            .SENS_CTRL_RST_MMCM     (SENS_CTRL_RST_MMCM),
            .SENS_CTRL_IGNORE_EMBED (SENS_CTRL_IGNORE_EMBED),
            .SENS_CTRL_LD_DLY       (SENS_CTRL_LD_DLY),
            .SENS_CTRL_GP0          (SENS_CTRL_GP0),
            .SENS_CTRL_GP1          (SENS_CTRL_GP1),
            .IODELAY_GRP            (IODELAY_GRP),
            .IDELAY_VALUE           (IDELAY_VALUE),
            .REFCLK_FREQUENCY       (SENS_REFCLK_FREQUENCY),
            .HIGH_PERFORMANCE_MODE  (SENS_HIGH_PERFORMANCE_MODE),
            .SENS_PHASE_WIDTH       (SENS_PHASE_WIDTH),
//            .SENS_PCLK_PERIOD       (SENS_PCLK_PERIOD),
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
            .HISPI_MSB_FIRST        (HISPI_MSB_FIRST),
            .HISPI_NUMLANES         (HISPI_NUMLANES),
            .HISPI_DELAY_CLK        (HISPI_DELAY_CLK),
            .HISPI_MMCM             (HISPI_MMCM),
            .HISPI_KEEP_IRST        (HISPI_KEEP_IRST),
            .HISPI_WAIT_ALL_LANES   (HISPI_WAIT_ALL_LANES),
            .HISPI_FIFO_DEPTH       (HISPI_FIFO_DEPTH),
            .HISPI_FIFO_START       (HISPI_FIFO_START),
            .HISPI_CAPACITANCE      (HISPI_CAPACITANCE),
            .HISPI_DIFF_TERM        (HISPI_DIFF_TERM),
            .HISPI_UNTUNED_SPLIT    (HISPI_UNTUNED_SPLIT),        
            .HISPI_DQS_BIAS         (HISPI_DQS_BIAS),
            .HISPI_IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
            .HISPI_IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
            .HISPI_IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
            .HISPI_IOSTANDARD       (HISPI_IOSTANDARD),
            .PXD_DRIVE              (PXD_DRIVE),
            .PXD_IBUF_LOW_PWR       (PXD_IBUF_LOW_PWR),
            .PXD_IOSTANDARD         (PXD_IOSTANDARD),
            .PXD_SLEW               (PXD_SLEW),
            .PXD_CAPACITANCE        (PXD_CAPACITANCE),
            .PXD_CLK_DIV            (PXD_CLK_DIV),
            .PXD_CLK_DIV_BITS       (PXD_CLK_DIV_BITS)
        ) sens_10398_i (
            .pclk             (pclk),                   // input
            .prst             (prst),                   // input
            .prsts            (prsts),                  // output
            .mclk             (mclk),                   // input
            .mrst             (mrst),                   // input
            .cmd_ad           (cmd_ad),                 // input[7:0] 
            .cmd_stb          (cmd_stb),                // input
            .status_ad        (sens_phys_status_ad),    // output[7:0] 
            .status_rq        (sens_phys_status_rq),    // output
            .status_start     (sens_phys_status_start), // input
            .trigger_mode     (trigger_mode),           // input
            .trig             (trig),                   // input
            .sns_dp           (sns_dp[3:0]),            // input[3:0] 
            .sns_dn           (sns_dn[3:0]),            // input[3:0] 
            .sns_clkp         (sns_clkp),               // input
            .sns_clkn         (sns_clkn),               // input
            .sens_ext_clk_p   (sns_dp74[6]),            // output
            .sens_ext_clk_n   (sns_dn74[6]),            // output
            .sns_pgm          (sns_pg),                 // inout
            .sns_ctl_tck      (sns_ctl),                // output
            .sns_mrst         (sns_dp74[7]),            // output
            .sns_arst_tms     (sns_dn74[7]),            // output
            .sns_gp0_tdi      (sns_dp74[5]),            // output
            .sns_gp1          (sns_dn74[5]),            // output
            .sns_flash_tdo    (sns_dp74[4]),            // input
            .sns_shutter_done (sns_dn74[4]),            // input
            .pxd              (pxd),                    // output[11:0] 
            .hact             (hact),                   // output
            .sof              (sof),                    // output
            .eof              (eof)                     // output
        );

`else    
        sens_parallel12 #(
            .SENSIO_ADDR           (SENSIO_ADDR),
            .SENSIO_ADDR_MASK      (SENSIO_ADDR_MASK),
            .SENSIO_CTRL           (SENSIO_CTRL),
            .SENSIO_STATUS         (SENSIO_STATUS),
            .SENSIO_JTAG           (SENSIO_JTAG),
            .SENSIO_WIDTH          (SENSIO_WIDTH),
            .SENSIO_DELAYS         (SENSIO_DELAYS),
            .SENSIO_STATUS_REG     (SENSIO_STATUS_REG),
            .SENS_JTAG_PGMEN       (SENS_JTAG_PGMEN),
            .SENS_JTAG_PROG        (SENS_JTAG_PROG),
            .SENS_JTAG_TCK         (SENS_JTAG_TCK),
            .SENS_JTAG_TMS         (SENS_JTAG_TMS),
            .SENS_JTAG_TDI         (SENS_JTAG_TDI),
            .SENS_CTRL_MRST        (SENS_CTRL_MRST),
            .SENS_CTRL_ARST        (SENS_CTRL_ARST),
            .SENS_CTRL_ARO         (SENS_CTRL_ARO),
            .SENS_CTRL_RST_MMCM    (SENS_CTRL_RST_MMCM),
            .SENS_CTRL_EXT_CLK     (SENS_CTRL_EXT_CLK),
            .SENS_CTRL_LD_DLY      (SENS_CTRL_LD_DLY),
            .SENS_CTRL_QUADRANTS   (SENS_CTRL_QUADRANTS),
            .SENS_CTRL_ODD         (SENS_CTRL_ODD),
            .SENS_CTRL_QUADRANTS_WIDTH  (SENS_CTRL_QUADRANTS_WIDTH),
            .SENS_CTRL_QUADRANTS_EN     (SENS_CTRL_QUADRANTS_EN),
            .IODELAY_GRP           (IODELAY_GRP),
            .IDELAY_VALUE          (IDELAY_VALUE),
            .PXD_DRIVE             (PXD_DRIVE),
            .PXD_IOSTANDARD        (PXD_IOSTANDARD),
            .PXD_SLEW              (PXD_SLEW),
            .SENS_REFCLK_FREQUENCY (SENS_REFCLK_FREQUENCY),
            .SENS_HIGH_PERFORMANCE_MODE (SENS_HIGH_PERFORMANCE_MODE),
            .SENS_PHASE_WIDTH      (SENS_PHASE_WIDTH),
//            .SENS_PCLK_PERIOD      (SENS_PCLK_PERIOD),
            .SENS_BANDWIDTH        (SENS_BANDWIDTH),
            .CLKIN_PERIOD_SENSOR   (CLKIN_PERIOD_SENSOR),
            .CLKFBOUT_MULT_SENSOR  (CLKFBOUT_MULT_SENSOR),
            .CLKFBOUT_PHASE_SENSOR (CLKFBOUT_PHASE_SENSOR),
            .IPCLK_PHASE           (IPCLK_PHASE),
            .IPCLK2X_PHASE         (IPCLK2X_PHASE),
            .PXD_IBUF_LOW_PWR      (PXD_IBUF_LOW_PWR),
            .BUF_IPCLK             (BUF_IPCLK),
            .BUF_IPCLK2X           (BUF_IPCLK2X),
            .SENS_DIVCLK_DIVIDE    (SENS_DIVCLK_DIVIDE),
            .SENS_REF_JITTER1      (SENS_REF_JITTER1),
            .SENS_REF_JITTER2      (SENS_REF_JITTER2),
            .SENS_SS_EN            (SENS_SS_EN),
            .SENS_SS_MODE          (SENS_SS_MODE),
            .SENS_SS_MOD_PERIOD    (SENS_SS_MOD_PERIOD),
            .STATUS_ALIVE_WIDTH    (STATUS_ALIVE_WIDTH)
        ) sens_parallel12_i (
//            .rst                  (rst),                    // input
            .pclk                 (pclk),                   // input
            .mclk_rst             (mrst),                   // input
            .prst                 (prst),                   // input
            .prsts                (prsts),                  // output
            .irst                 (irst),                   // output
            .ipclk                (ipclk),                  // output
            .ipclk2x              (), // ipclk2x),          // output
            .trigger_mode         (trigger_mode), // input
            .trig                 (trig),                   // input
            .vact                 (sns_dn[1]),              // input
            .hact                 (sns_dp[1]),              // input
            .bpf                  (sns_dn[0]),              // inout
            .pxd                  ({sns_dn[6],sns_dp[6],sns_dn[5],sns_dp[5],sns_dn[4],sns_dp[4],sns_dn[3],sns_dp[3],sns_dn[2],sns_dp[2],sns_clkp,sns_clkn}), // inout[11:0] 
            .mrst                 (sns_dp[7]),              // inout
            .senspgm              (sns_pg),                 // inout
            .arst                 (sns_dn[7]),              // inout
            .aro                  (sns_ctl),                // inout
            .dclk                 (sns_dp[0]),              // output
            .pxd_out              (pxd_to_fifo[11:0]),      // output[11:0] @posedge ipclk
            .vact_out             (vact_to_fifo),           // output @posedge ipclk
            .hact_out             (hact_to_fifo),           // output @posedge ipclk: either delayed input, or regenerated from the leading edge and programmable duration
            .status_alive_1cyc    (status_alive),           // input [3:0] @ posedge mclk, each bit single cycle pulse
            .mclk                 (mclk),                   // input
            .cmd_ad               (cmd_ad),                 // input[7:0] 
            .cmd_stb              (cmd_stb),                // input
            .status_ad            (sens_phys_status_ad),   // output[7:0] 
            .status_rq            (sens_phys_status_rq),   // output
            .status_start         (sens_phys_status_start) // input
        );

// TODO NC393: This delay may be too long for serail sensors. Make them always start to fill the
// first buffer page, waiting for the request from mcntrl_linear during that first page. And if it will arrive - 
// just continue.    
    
        sensor_fifo #(
            .SENSOR_DATA_WIDTH  (SENSOR_DATA_WIDTH),
            .SENSOR_FIFO_2DEPTH (SENSOR_FIFO_2DEPTH),
            .SENSOR_FIFO_DELAY  (SENSOR_FIFO_DELAY)
        ) sensor_fifo_i (
    //        .rst         (rst),        // input
            .iclk        (ipclk),        // input
            .pclk        (pclk),         // input
//            .prst        (prst),                  // input
            .prst        (prsts),                  // input extended to include sensor reset and rst_mmcm
            
            .irst        (irst),         // input
            .pxd_in      (pxd_to_fifo),  // input[11:0] 
            .vact        (vact_to_fifo), // input
            .hact        (hact_to_fifo), // input
            .pxd_out     (pxd),          // output[11:0]  @posedge pclk
            .data_valid  (hact),         // output @posedge pclk
            .sof         (sof),          // output @posedge pclk
            .eof         (eof)           // output @posedge pclk
        );
`endif
    sens_sync #(
        .SENS_SYNC_ADDR       (SENS_SYNC_ADDR),
        .SENS_SYNC_MASK       (SENS_SYNC_MASK),
        .SENS_SYNC_MULT       (SENS_SYNC_MULT),
        .SENS_SYNC_LATE       (SENS_SYNC_LATE),
        .SENS_SYNC_FBITS      (SENS_SYNC_FBITS),
        .SENS_SYNC_LBITS      (SENS_SYNC_LBITS),
        .SENS_SYNC_LATE_DFLT  (SENS_SYNC_LATE_DFLT),
        .SENS_SYNC_MINBITS    (SENS_SYNC_MINBITS),
        .SENS_SYNC_MINPER     (SENS_SYNC_MINPER)
    ) sens_sync_i (
        .pclk         (pclk),          // input
        .mclk         (mclk),          // input
        .mrst         (mrst),          // input
//        .prst         (prst),          // input
        .prst         (prsts),         // input extended to include sensor reset and rst_mmcm
        .en           (en_pclk),       // input @pclk
        .sof_in       (sof),           // input
        .eof_in       (eof),           // input
        .hact         (hact),          // input
        .trigger_mode (trigger_mode),  // input
        .trig_in      (trig_in),       // input
        .trig         (trig),          // output      @pclk
        .sof_out_pclk (sof_out_sync),  // output reg  @pclk
        .sof_out      (sof_out_mclk),  // output      @mclk
        .sof_late     (sof_late_mclk), // output      @mclk
        .cmd_ad       (cmd_ad),        // input[7:0] 
        .cmd_stb      (cmd_stb)        // input
    );

    lens_flat393 #(
        .SENS_LENS_ADDR            (SENS_LENS_ADDR),
        .SENS_LENS_ADDR_MASK       (SENS_LENS_ADDR_MASK),
        .SENS_LENS_COEFF           (SENS_LENS_COEFF),
        .SENS_LENS_AX              (SENS_LENS_AX),
        .SENS_LENS_AX_MASK         (SENS_LENS_AX_MASK),
        .SENS_LENS_AY              (SENS_LENS_AY),
        .SENS_LENS_AY_MASK         (SENS_LENS_AY_MASK),
        .SENS_LENS_C               (SENS_LENS_C),
        .SENS_LENS_C_MASK          (SENS_LENS_C_MASK),
        .SENS_LENS_BX              (SENS_LENS_BX),
        .SENS_LENS_BX_MASK         (SENS_LENS_BX_MASK),
        .SENS_LENS_BY              (SENS_LENS_BY),
        .SENS_LENS_BY_MASK         (SENS_LENS_BY_MASK),
        .SENS_LENS_SCALES          (SENS_LENS_SCALES),
        .SENS_LENS_SCALES_MASK     (SENS_LENS_SCALES_MASK),
        .SENS_LENS_FAT0_IN         (SENS_LENS_FAT0_IN),
        .SENS_LENS_FAT0_IN_MASK    (SENS_LENS_FAT0_IN_MASK),
        .SENS_LENS_FAT0_OUT        (SENS_LENS_FAT0_OUT),
        .SENS_LENS_FAT0_OUT_MASK   (SENS_LENS_FAT0_OUT_MASK),
        .SENS_LENS_POST_SCALE      (SENS_LENS_POST_SCALE),
        .SENS_LENS_POST_SCALE_MASK (SENS_LENS_POST_SCALE_MASK),
        .SENS_NUM_SUBCHN           (SENS_NUM_SUBCHN),
        .SENS_LENS_F_WIDTH         (19),
        .SENS_LENS_F_SHIFT         (22),
        .SENS_LENS_B_SHIFT         (12),
        .SENS_LENS_A_WIDTH         (19),
        .SENS_LENS_B_WIDTH         (21)
    ) lens_flat393_i (
//        .prst       (prst),          // input
        .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
        .pclk       (pclk),          // input
        .mrst       (mrst),          // input
        .mclk       (mclk),          // input
        .cmd_ad     (cmd_ad),        // input[7:0] 
        .cmd_stb    (cmd_stb),       // input
        .pxd_in     (lens_pxd_in),   // input[15:0] 
        .hact_in    (lens_hact_in),  // input
        .sof_in     (lens_sof_in),   // input
        .eof_in     (lens_eof_in),   // input
        .pxd_out    (gamma_pxd_in),  // output[15:0] reg 
        .hact_out   (gamma_hact_in), // output
        .sof_out    (gamma_sof_in),  // output
        .eof_out    (gamma_eof_in),  // output
        .bayer      (gamma_bayer), // input[1:0] // from gamma module
        .subchannel(), // output[1:0] - RFU 
        .last_in_sub() // output -    RFU
    );

    sens_gamma #(
        .SENS_NUM_SUBCHN            (SENS_NUM_SUBCHN),
        .SENS_GAMMA_BUFFER          (SENS_GAMMA_BUFFER),
        .SENS_GAMMA_ADDR            (SENS_GAMMA_ADDR),
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
        .SENS_GAMMA_MODE_TRIG       (SENS_GAMMA_MODE_TRIG)
    ) sens_gamma_i (
//        .rst         (rst),            // input
        .pclk        (pclk),           // input
        .mrst        (mrst),          // input
//        .prst        (prst),          // input
        .prst        (prsts),         // input extended to include sensor reset and rst_mmcm
        .pxd_in      (gamma_pxd_in),   // input[15:0] 
        .hact_in     (gamma_hact_in),  // input
        .sof_in      (gamma_sof_in),   // input
        .eof_in      (gamma_eof_in),   // input
        .trig_in  (1'b0),              // input (use trig_soft)
        .pxd_out     (gamma_pxd_out),  // output[7:0] 
        .hact_out    (gamma_hact_out), // output
        .sof_out     (gamma_sof_out),  // output
        .eof_out     (gamma_eof_out),  // output
        .mclk        (mclk),           // input
        .cmd_ad      (cmd_ad),         // input[7:0] 
        .cmd_stb     (cmd_stb),        // input
        .bayer_out   (gamma_bayer)     // output [1:0]
    );

    // TODO: Use generate to generate 1-4 histogram modules
    generate
        if (HISTOGRAM_ADDR0 != -1)
`ifdef USE_PCLK2X    
            sens_histogram #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR0),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER)
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_0_i (
                .mrst       (mrst),           // input
                .prst       (prsts),          // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .pclk2x     (pclk2x),         // input
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0] 
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[0]),     // input
                .hist_rst   (!hist_nrst[0]),     // input
                .hist_rq    (hist_rq[0]),     // output
                .hist_grant (hist_gr[0]),     // input
                .hist_do    (hist_do0),       // output[31:0] 
                .hist_dv    (hist_dv[0]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb),        // input
                .monochrome (HIST_MONOCHROME) // input
//                ,.debug_mclk(debug_hist_mclk[0])
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[0]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[1])        // input
    `endif         
                  
            );
        else
            sens_histogram_dummy sens_histogram_0_i (
                .hist_rq      (hist_rq[0]),         // output
                .hist_do      (hist_do0),           // output[31:0] 
                .hist_dv      (hist_dv[0])          // output
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[0]),         // output
                .debug_di     (debug_ring[1])          // input
    `endif         
            );
// `ifdef USE_PCLK2X    
`else
            sens_histogram_snglclk #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR0),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER),
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_0_i (
                .mrst       (mrst),            // input
                .prst       (prsts),          // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .frame_num_seq (frame_num_seq), // input[3:0] 
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[0]),     // input
                .hist_rst   (!hist_nrst[0]),     // input
                .hist_rq    (hist_rq[0]),     // output
                .hist_frame (hist_frame0),    // output[3:0] reg 
                .hist_grant (hist_gr[0]),     // input
                .hist_do    (hist_do0),       // output[31:0] 
                .hist_dv    (hist_dv[0]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb)         // input
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[0]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[1])        // input
    `endif
                  
            );
        else
            sens_histogram_snglclk_dummy #(
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
            )  sens_histogram_0_i (
                .hist_rq      (hist_rq[0]),         // output
                .hist_frame   (hist_frame0), // output[3:0] reg 
                .hist_do      (hist_do0),           // output[31:0] 
                .hist_dv      (hist_dv[0])          // output
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[0]),         // output
                .debug_di     (debug_ring[1])          // input
    `endif         
            );
// `ifdef USE_PCLK2X    
`endif
    endgenerate
    
    
    generate
        if (HISTOGRAM_ADDR1  != -1)
`ifdef USE_PCLK2X    
            sens_histogram #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR1),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER)
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_1_i (
                .mrst        (mrst),          // input
                .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .pclk2x     (pclk2x),         // input
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[1]),     // input
                .hist_rst   (!hist_nrst[1]),     // input
                .hist_rq    (hist_rq[1]),     // output
                .hist_grant (hist_gr[1]),     // input
                .hist_do    (hist_do1),       // output[31:0] 
                .hist_dv    (hist_dv[1]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb),        // input
                .monochrome (HIST_MONOCHROME) // input 
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[1]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[2])        // input
    `endif         
            );
        else
            sens_histogram_dummy sens_histogram_1_i (
                .hist_rq      (hist_rq[1]),   // output
                .hist_do      (hist_do1),     // output[31:0] 
                .hist_dv      (hist_dv[1])    // output
            `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[1]),         // output
                .debug_di     (debug_ring[2])          // input
    `endif         
            );
// `ifdef USE_PCLK2X    
`else
            sens_histogram_snglclk #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR1),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER),
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
                
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_1_i (
                .mrst        (mrst),          // input
                .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .frame_num_seq (frame_num_seq), // input[3:0] 
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[1]),     // input
                .hist_rst   (!hist_nrst[1]),     // input
                .hist_rq    (hist_rq[1]),     // output
                .hist_frame (hist_frame1), // output[3:0] reg 
                .hist_grant (hist_gr[1]),     // input
                .hist_do    (hist_do1),       // output[31:0] 
                .hist_dv    (hist_dv[1]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb)        // input
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[1]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[2])        // input
    `endif         
            );
        else
            sens_histogram_snglclk_dummy #(
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
            )  sens_histogram_1_i (
                .hist_rq      (hist_rq[1]),   // output
                .hist_frame   (hist_frame1), // output[3:0] reg 
                .hist_do      (hist_do1),     // output[31:0] 
                .hist_dv      (hist_dv[1])    // output
            `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[1]),         // output
                .debug_di     (debug_ring[2])          // input
    `endif         
            );
// `ifdef USE_PCLK2X    
`endif
    endgenerate

    generate
        if (HISTOGRAM_ADDR2  != -1)
`ifdef USE_PCLK2X    
            sens_histogram #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR2),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER)
`ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
`endif        
            ) sens_histogram_2_i (
                .mrst        (mrst),          // input
                .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .pclk2x     (pclk2x),         // input
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[2]),     // input
                .hist_rst   (!hist_nrst[2]),     // input
                .hist_rq    (hist_rq[2]),     // output
                .hist_grant (hist_gr[2]),     // input
                .hist_do    (hist_do2),       // output[31:0] 
                .hist_dv    (hist_dv[2]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb),        // input
                .monochrome (HIST_MONOCHROME) // input  
`ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[2]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[3])        // input
`endif         
            );
        else
            sens_histogram_dummy sens_histogram_2_i (
                .hist_rq(hist_rq[2]),        // output
                .hist_do(hist_do2),          // output[31:0] 
                .hist_dv(hist_dv[2])         // output
`ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[2]),         // output
                .debug_di     (debug_ring[3])          // input
`endif         
            );
// `ifdef USE_PCLK2X    
`else
            sens_histogram_snglclk #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR2),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER),
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
`ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
`endif        
            ) sens_histogram_2_i (
                .mrst        (mrst),          // input
                .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .frame_num_seq (frame_num_seq), // input[3:0] 
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[2]),     // input
                .hist_rst   (!hist_nrst[2]),     // input
                .hist_rq    (hist_rq[2]),     // output
                .hist_frame (hist_frame2),    // output[3:0] reg 
                .hist_grant (hist_gr[2]),     // input
                .hist_do    (hist_do2),       // output[31:0] 
                .hist_dv    (hist_dv[2]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb)         // input
`ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[2]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[3])        // input
`endif         
            );
        else
            sens_histogram_snglclk_dummy #(
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
            )  sens_histogram_2_i (
                .hist_rq(hist_rq[2]),         // output
                .hist_frame    (hist_frame2), // output[3:0] reg 
                .hist_do(hist_do2),           // output[31:0] 
                .hist_dv(hist_dv[2])          // output
`ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[2]),         // output
                .debug_di     (debug_ring[3])          // input
`endif         
            );
// `ifdef USE_PCLK2X    
`endif
    endgenerate

    generate
        if (HISTOGRAM_ADDR3  != -1)
`ifdef USE_PCLK2X    
            sens_histogram #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR3),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER)
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_3_i (
                .mrst        (mrst),          // input
                .prst       (prsts),         // input extended to include sensor reset and rst_mmcm
                .pclk       (pclk),           // input
                .pclk2x     (pclk2x),         // input
                .sof        (gamma_sof_out),  // input
                .eof        (gamma_eof_out),  // input
                .hact       (gamma_hact_out), // input
                .hist_di    (gamma_pxd_out),  // input[7:0]
                .bayer      (gamma_bayer),    // input[1:0] 
                .mclk       (mclk),           // input
                .hist_en    (hist_en[3]),     // input
                .hist_rst   (!hist_nrst[3]),  // input
                .hist_rq    (hist_rq[3]),     // output
                .hist_grant (hist_gr[3]),     // input
                .hist_do    (hist_do3),       // output[31:0] 
                .hist_dv    (hist_dv[3]),     // output
                .cmd_ad     (cmd_ad),         // input[7:0] 
                .cmd_stb    (cmd_stb),        // input
                .monochrome (HIST_MONOCHROME) // input  
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[3]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[4])        // input
    `endif         
            );
        else
            sens_histogram_dummy sens_histogram_3_i (
                .hist_rq(hist_rq[3]),  // output
                .hist_do(hist_do3),    // output[31:0] 
                .hist_dv(hist_dv[3])   // output
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[3]),         // output
                .debug_di     (debug_ring[4])          // input
    `endif         
            );
// `ifdef USE_PCLK2X    
`else
// `ifdef USE_PCLK2X    
            sens_histogram_snglclk #(
                .HISTOGRAM_RAM_MODE     (HISTOGRAM_RAM_MODE),
                .HISTOGRAM_ADDR         (HISTOGRAM_ADDR3),
                .HISTOGRAM_ADDR_MASK    (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP     (HISTOGRAM_LEFT_TOP),
                .HISTOGRAM_WIDTH_HEIGHT (HISTOGRAM_WIDTH_HEIGHT),
                .XOR_HIST_BAYER         (XOR_HIST_BAYER),
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
    `ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY         (DEBUG_CMD_LATENCY) 
    `endif        
            ) sens_histogram_3_i (
                .mrst          (mrst),           // input
                .prst          (prsts),          // input extended to include sensor reset and rst_mmcm
                .pclk          (pclk),           // input
                .sof           (gamma_sof_out),  // input
                .eof           (gamma_eof_out),  // input
                .hact          (gamma_hact_out), // input
                .frame_num_seq (frame_num_seq),  // input[3:0] 
                .hist_di       (gamma_pxd_out),  // input[7:0]
                .bayer         (gamma_bayer),    // input[1:0] 
                .mclk          (mclk),           // input
                .hist_en       (hist_en[3]),     // input
                .hist_rst      (!hist_nrst[3]),  // input
                .hist_rq       (hist_rq[3]),     // output
                .hist_frame    (hist_frame3),    // output[3:0] reg 
                .hist_grant    (hist_gr[3]),     // input
                .hist_do       (hist_do3),       // output[31:0] 
                .hist_dv       (hist_dv[3]),     // output
                .cmd_ad        (cmd_ad),         // input[7:0] 
                .cmd_stb       (cmd_stb)         // input
    `ifdef DEBUG_RING       
                ,.debug_do     (debug_ring[3]),         // output
                .debug_sl      (debug_sl),              // input
                .debug_di      (debug_ring[4])        // input
    `endif         
            );
        else
            sens_histogram_snglclk_dummy #(
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
            ) sens_histogram_3_i (
                .hist_rq(hist_rq[3]),  // output
                .hist_frame    (hist_frame3), // output[3:0] reg 
                .hist_do(hist_do3),    // output[31:0] 
                .hist_dv(hist_dv[3])   // output
    `ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[3]),         // output
                .debug_di     (debug_ring[4])          // input
    `endif         
            );
`endif
    endgenerate
    
    sens_histogram_mux  #(
                .NUM_FRAME_BITS         (NUM_FRAME_BITS)
            ) sens_histogram_mux_i (
        .mclk        (mclk),          // input
        .en          (|hist_nrst),    // input
        .rq0         (hist_rq[0]),    // input
        .hist_frame0 (hist_frame0),   // input[3:0] 
        .grant0      (hist_gr[0]),    // output
        .dav0        (hist_dv[0]),    // input
        .din0        (hist_do0),      // input[31:0] 
        .rq1         (hist_rq[1]),    // input
        .hist_frame1 (hist_frame1),   // input[3:0] 
        .grant1      (hist_gr[1]),    // output
        .dav1        (hist_dv[1]),    // input
        .din1        (hist_do1),      // input[31:0] 
        .rq2         (hist_rq[2]),    // input
        .hist_frame2 (hist_frame2),   // input[3:0] 
        .grant2      (hist_gr[2]),    // output
        .dav2        (hist_dv[2]),    // input
        .din2        (hist_do2),      // input[31:0] 
        .rq3         (hist_rq[3]),    // input
        .hist_frame3 (hist_frame3),   // input[3:0] 
        .grant3      (hist_gr[3]),    // output
        .dav3        (hist_dv[3]),    // input
        .din3        (hist_do3),      // input[31:0] 
        .rq          (hist_request),  // output
        .hist_frame  (hist_frame),    // input[3:0] 
        .grant       (hist_grant),    // input
        .chn         (hist_chn),      // output[1:0]
        .dv          (hist_dvalid),   // output
        .dout        (hist_data)      // output[31:0] 
    );


endmodule

