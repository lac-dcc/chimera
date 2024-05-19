// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensors393
 * @file sensors393.v
 * @date 2015-07-12  
 * @author Andrey Filippov     
 *
 * @brief 4-channel sensor subsystem
 *  Uniform, assuming the same sensors/multiplexers, common pixel clock
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sensors393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensors393.v is distributed in the hope that it will be useful,
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

module  sensors393 #(
    // parameters, individual to sensor channels and those likely to be modified
    parameter SENSOR_GROUP_ADDR =         'h400, // sensor registers base address
    parameter SENSOR_BASE_INC =           'h040, // increment for sesor channel
    
    parameter HIST_SAXI_ADDR_REL =         'h100, // histograms control addresses (16 locations) relative to SENSOR_GROUP_ADDR
    parameter HIST_SAXI_MODE_ADDR_REL =    'h110, // histograms mode address (1 locations) relative to SENSOR_GROUP_ADDR
    
    // Sesnors use 8 status registers, 'h20..'h27
    parameter SENSI2C_STATUS_REG_BASE =   'h20,  // 4 locations" x20, x22, x24, x26
    parameter SENSI2C_STATUS_REG_INC =    2,     // increment to the next sensor
    parameter SENSI2C_STATUS_REG_REL =    0,     // 4 locations" 'h20, 'h22, 'h24, 'h26
    parameter SENSIO_STATUS_REG_REL =     1,     // 4 locations" 'h21, 'h23, 'h25, 'h27
    parameter SENSOR_NUM_HISTOGRAM=       3,     // number of histogram channels
    parameter HISTOGRAM_RAM_MODE =        "BUF32", // "NOBUF", // valid: "NOBUF" (32-bits, no buffering), "BUF18", "BUF32"
    parameter SENS_NUM_SUBCHN =           3,     // number of subchannels for his sensor ports (1..4)
    parameter SENS_GAMMA_BUFFER =         0,     // 1 - use "shadow" table for clean switching, 0 - single table per channel
    
    // parameters defining address map
    parameter SENSOR_CTRL_RADDR =         0, // relative to SENSOR_GROUP_ADDR 
    parameter SENSOR_CTRL_ADDR_MASK =    'h7ff, //
        // bits of the SENSOR mode register
        parameter SENSOR_HIST_EN_BITS =    0,  // 0..3 1 - enable histogram modules, disable after processing the started frame
        parameter SENSOR_HIST_NRST_BITS =  4,  // 0 - immediately reset all histogram modules
        parameter SENSOR_HIST_BITS_SET  =  8,  // 1 - set bits 0..7 (en and nrst)
        parameter SENSOR_CHN_EN_BIT =      9,  // 1 - this enable channel
        parameter SENSOR_CHN_EN_BIT_SET = 10,  // set SENSOR_CHN_EN_BIT bit
        parameter SENSOR_16BIT_BIT =      11,  // 0 - 8 bpp mode, 1 - 16 bpp (bypass gamma). Gamma-processed data is still used for histograms
        parameter SENSOR_16BIT_BIT_SET =  12,  // set 8/16 bit mode
//        parameter SENSOR_MODE_WIDTH =     13,
    
    parameter SENSI2C_CTRL_RADDR =        2, // 302..'h303
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
    
    parameter SENS_SYNC_RADDR  =        'h4,
    parameter SENS_SYNC_MASK  =         'h7fc,
      // 2 locations reserved for control/status (if they will be needed)
      parameter SENS_SYNC_MULT  =       'h2,   // relative register address to write number of frames to combine in one (minus 1, '0' - each farme)
      parameter SENS_SYNC_LATE  =       'h3,    // number of lines to delay late frame sync
    
    
    
    parameter SENS_GAMMA_RADDR =        'h38, // 'h38..'h3b was 4,
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

    parameter SENSIO_RADDR =          8,  //'h408  .. 'h40f
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
    // sensor_i2c_io command/data write registers s (relative to SENSOR_GROUP_ADDR)
    parameter SENSI2C_ABS_RADDR =       'h10, // 'h410..'h41f
    parameter SENSI2C_REL_RADDR =       'h20, // 'h420..'h42f
    parameter SENSI2C_ADDR_MASK =       'h7f0, // both for SENSI2C_ABS_ADDR and SENSI2C_REL_ADDR

    // sens_hist registers (relative to SENSOR_GROUP_ADDR)
    parameter HISTOGRAM_RADDR0 =        'h30, //
    parameter HISTOGRAM_RADDR1 =        'h32, //
    parameter HISTOGRAM_RADDR2 =        'h34, //
    parameter HISTOGRAM_RADDR3 =        'h36, //
    parameter HISTOGRAM_ADDR_MASK =     'h7fe, // for each channel
      // sens_hist registers
      parameter HISTOGRAM_LEFT_TOP =     'h0,
      parameter HISTOGRAM_WIDTH_HEIGHT = 'h1, // 1.. 2^16, 0 - use HACT
    
    parameter [1:0] XOR_HIST_BAYER =  2'b00,// 11 // invert bayer setting    
    //sensor_i2c_io other parameters
    parameter integer SENSI2C_DRIVE=     12,
    parameter SENSI2C_IBUF_LOW_PWR=      "TRUE",
    parameter SENSI2C_SLEW =             "SLOW",
    
`ifndef HISPI
    //sensor_fifo parameters
    parameter SENSOR_DATA_WIDTH =      12,
    parameter SENSOR_FIFO_2DEPTH =     4,
    parameter [3:0] SENSOR_FIFO_DELAY =      5, // 7,
`endif    
    // other parameters for histogram_saxi module
    parameter HIST_SAXI_ADDR_MASK =      'h7f0,
      parameter HIST_SAXI_MODE_WIDTH =   8,
      parameter HIST_SAXI_EN =           0,
      parameter HIST_SAXI_NRESET =       1,
      parameter HIST_CONFIRM_WRITE =     2, // wait write confirmation for each block
      parameter HIST_SAXI_AWCACHE =      4'h3, //..7 cache mode (4 bits, default 4'h3)
      
    parameter HIST_SAXI_MODE_ADDR_MASK = 'h7ff,
    parameter NUM_FRAME_BITS =           4, // number of bits use for frame number 
    
    // Other parameters
    parameter SENS_SYNC_FBITS =          16,    // number of bits in a frame counter for linescan mode
    parameter SENS_SYNC_LBITS =          16,    // number of bits in a line counter for sof_late output (limited by eof) 
    parameter SENS_SYNC_LATE_DFLT =      4, // 15,    // number of lines to delay late frame sync
    parameter SENS_SYNC_MINBITS =        8,    // number of bits to enforce minimal frame period 
    parameter SENS_SYNC_MINPER =         130,    // minimal frame period (in pclk/mclk?) 
    
    
    // sens_parallel12 other parameters
    
//    parameter IODELAY_GRP ="IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE =     0,
    parameter integer PXD_DRIVE =        12,
    parameter PXD_IBUF_LOW_PWR =         "TRUE",
    parameter PXD_SLEW =                 "SLOW",
    parameter real SENS_REFCLK_FREQUENCY =    300.0,
    parameter SENS_HIGH_PERFORMANCE_MODE =    "FALSE",
`ifdef HISPI
    parameter PXD_CAPACITANCE =          "DONT_CARE",
    parameter PXD_CLK_DIV =              10, // 220MHz -> 22MHz
    parameter PXD_CLK_DIV_BITS =          4,
`endif    
    parameter SENS_PHASE_WIDTH=           8,      // number of bits for te phase counter (depends on divisors)
//    parameter SENS_PCLK_PERIOD =          10.000,  // input period in ns, 0..100.000 - MANDATORY, resolution down to 1 ps
    parameter SENS_BANDWIDTH =            "OPTIMIZED",  //"OPTIMIZED", "HIGH","LOW"

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
//    parameter BUF_IPCLK =                "BUFR",
//    parameter BUF_IPCLK2X =              "BUFR",  
    parameter BUF_IPCLK_SENS0 =          "BUFR", //G", // "BUFR", // BUFR fails for both clocks for sensors1 and 3
    parameter BUF_IPCLK2X_SENS0 =        "BUFR", //G", // "BUFR",  

    parameter BUF_IPCLK_SENS1 =          "BUFG", // "BUFR", // BUFR fails for both clocks for sensors1 and 3
    parameter BUF_IPCLK2X_SENS1 =        "BUFG", // "BUFR",  

    parameter BUF_IPCLK_SENS2 =          "BUFR", //G", // "BUFR", // BUFR fails for both clocks for sensors1 and 3
    parameter BUF_IPCLK2X_SENS2 =        "BUFR", //G", // "BUFR",  

    parameter BUF_IPCLK_SENS3 =          "BUFG", // "BUFR", // BUFR fails for both clocks for sensors1 and 3
    parameter BUF_IPCLK2X_SENS3 =        "BUFG", // "BUFR",  
    

    parameter SENS_DIVCLK_DIVIDE =       1,            // Integer 1..106. Divides all outputs with respect to CLKIN
    parameter SENS_REF_JITTER1   =       0.010,        // Expected jitter on CLKIN1 (0.000..0.999)
    parameter SENS_REF_JITTER2   =       0.010,
    parameter SENS_SS_EN         =       "FALSE",      // Enables Spread Spectrum mode
    parameter SENS_SS_MODE       =       "CENTER_HIGH",//"CENTER_HIGH","CENTER_LOW","DOWN_HIGH","DOWN_LOW"
    parameter SENS_SS_MOD_PERIOD =       10000        // integer 4000-40000 - SS modulation period in ns
`ifdef HISPI
   ,parameter HISPI_MSB_FIRST =            0,
    parameter HISPI_NUMLANES =             4,
    parameter HISPI_DELAY_CLK0=           "FALSE",      
    parameter HISPI_DELAY_CLK1=           "FALSE",      
    parameter HISPI_DELAY_CLK2=           "FALSE",      
    parameter HISPI_DELAY_CLK3=           "FALSE",      
    parameter HISPI_MMCM0 =               "TRUE",
    parameter HISPI_MMCM1 =               "TRUE",
    parameter HISPI_MMCM2 =               "TRUE",
    parameter HISPI_MMCM3 =               "TRUE",
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
//    input         rst,
// will generate it here
    input         pclk,    // global clock input, pixel rate (96MHz for MT9P006)
`ifdef USE_PCLK2X    
    input         pclk2x,  // global clock input, double pixel rate (192MHz for MT9P006)
`endif
    input         ref_clk, // IODELAY calibration 
    input         dly_rst,       
    input         mrst,      // @posedge mclk, sync reset
    input         prst,      // @posedge pclk, sync reset
    input         arst,      // @posedge aclk, sync reset
    
    // programming interface
    input         mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input   [7:0] cmd_ad_in,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input         cmd_stb_in,     // strobe (with first byte) for the command a/d
    output  [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output        status_rq,   // input request to send status downstream
    input         status_start, // Acknowledge of the first status packet byte (address)
    
    // I/O pads, pin names match circuit diagram (each sensor)
`ifdef HISPI    
    input  [15:0] sns_dp,
    input  [15:0] sns_dn,
    inout  [15:0] sns_dp74, // SuppressThisWarning all - unused yet
    inout  [15:0] sns_dn74, // SuppressThisWarning all - unused yet
    input   [3:0] sns_clkp, // SuppressThisWarning all - input-only in HiSPi mode
    input   [3:0] sns_clkn, // SuppressThisWarning all - input-only in HiSPi mode
`else
    inout  [31:0] sns_dp,
    inout  [31:0] sns_dn,
    inout   [3:0] sns_clkp,
    inout   [3:0] sns_clkn,
`endif    
    inout   [3:0] sns_scl,
    inout   [3:0] sns_sda,
    
`ifdef HISPI    
    inout   [3:0] sns_ctl, // SuppressThisWarning all - output-only in HiSPi mode
`else    
    inout   [3:0] sns_ctl,
`endif    
    inout   [3:0] sns_pg,
    
    // Memory interface (4 channels)
    input    [3:0] frame_run_mclk, // input [3:0] - enable sensor data to memory buffer
    input    [3:0] rpage_set,    // set internal read page to rpage_in (reset pointers)
    input    [3:0] rpage_next,   // advance to next page (and reset lower bits to 0)
    input    [3:0] buf_rd,       // read buffer to memory, increment read address (register enable will be delayed)
    output [255:0] buf_dout,     // data out 
    output   [3:0] page_written, // single mclk pulse: buffer page (full or partial) is written to the memory buffer 
    
    // Lower bits of frame numbers to use with the histograms, get from the sequencers
    // trigger inputs
    input         trigger_mode, // common to all sensors - running in triggered mode (0 - free running mode)
    input   [3:0] trig_in,      // per-sensor trigger input
    output  [3:0] sof_out_pclk, // @ pclk start of frame 
    output  [3:0] eof_out_pclk, // @ pclk end of frame
    output  [3:0] sof_out_mclk, // @ mclk start of frame - use to run sequencer, so register writes should be before compressor start
    output  [3:0] sof_late_mclk,// @ mclk start of frame, delayed (use to start compressor and interrupts)
    
    
    input  [NUM_FRAME_BITS-1:0] frame_num0,
    input  [NUM_FRAME_BITS-1:0] frame_num1, 
    input  [NUM_FRAME_BITS-1:0] frame_num2, 
    input  [NUM_FRAME_BITS-1:0] frame_num3, 
    
    output                     idelay_rdy, // need to connect outputs to prevent optimizing out
    
    // S_AXI interface write only (histograms out)
    // write address
    input                      aclk,                   // global clock for S_AXI0 (150 MHz)    
    output              [31:0] saxi_awaddr,            // AXI PS Slave GP0 AWADDR[31:0], input
    output                     saxi_awvalid,           // AXI PS Slave GP0 AWVALID, input
    input                      saxi_awready,           // AXI PS Slave GP0 AWREADY, output
    output               [5:0] saxi_awid,              // AXI PS Slave GP0 AWID[5:0], input
    output               [1:0] saxi_awlock,            // AXI PS Slave GP0 AWLOCK[1:0], input
    output              [ 3:0] saxi_awcache,           // AXI PS Slave GP0 AWCACHE[3:0], input
    output              [ 2:0] saxi_awprot,            // AXI PS Slave GP0 AWPROT[2:0], input
    output              [ 3:0] saxi_awlen,             // AXI PS Slave GP0 AWLEN[3:0], input
    output              [ 1:0] saxi_awsize,            // AXI PS Slave GP0 AWSIZE[1:0], input
    output              [ 1:0] saxi_awburst,           // AXI PS Slave GP0 AWBURST[1:0], input
    output              [ 3:0] saxi_awqos,             // AXI PS Slave GP0 AWQOS[3:0], input
    // write data
    output              [31:0] saxi_wdata,             // AXI PS Slave GP0 WDATA[31:0], input
    output                     saxi_wvalid,            // AXI PS Slave GP0 WVALID, input
    input                      saxi_wready,            // AXI PS Slave GP0 WREADY, output
    output              [ 5:0] saxi_wid,               // AXI PS Slave GP0 WID[5:0], input
    output                     saxi_wlast,             // AXI PS Slave GP0 WLAST, input
    output              [ 3:0] saxi_wstrb,             // AXI PS Slave GP0 WSTRB[3:0], input
    // write response
    input                      saxi_bvalid,            // AXI PS Slave GP0 BVALID, output
    output                     saxi_bready,            // AXI PS Slave GP0 BREADY, input
    input               [ 5:0] saxi_bid,               // AXI PS Slave GP0 BID[5:0], output
    input               [ 1:0] saxi_bresp              // AXI PS Slave GP0 BRESP[1:0], output
`ifdef DEBUG_SENS_MEM_PAGES
    ,output [2 * 4 - 1 : 0] dbg_rpage   
    ,output [2 * 4 - 1 : 0] dbg_wpage   
`endif              
    
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load
     input                        debug_di  // input from the debug ring
`endif         
    
);

`ifdef DEBUG_RING
    localparam DEBUG_RING_LENGTH = 5;
    wire [DEBUG_RING_LENGTH:0] debug_ring; // TODO: adjust number of bits
    assign debug_do = debug_ring[0];
    assign debug_ring[DEBUG_RING_LENGTH] = debug_di;
`endif    


    wire               [1:0] idelay_ctrl_rdy;   // need to connect outputs to prevent optimizing out
    assign idelay_rdy = &idelay_ctrl_rdy;
    reg              [7:0] cmd_ad;    
    reg                    cmd_stb;
    wire            [31:0] status_ad_chn;
    wire             [3:0] status_rq_chn;
    wire             [3:0] status_start_chn;

    wire            [63:0] px_data;
    wire             [3:0] px_valid;
    wire             [3:0] last_in_line;
    wire             [3:0] hist_request;
    wire             [3:0] hist_grant;
    wire             [7:0] hist_chn; 
    wire             [3:0] hist_dvalid;
    wire           [127:0] hist_data;
    
    wire  [4*NUM_FRAME_BITS-1:0] frame_num = {frame_num3, frame_num2, frame_num1, frame_num0};
    wire  [4*NUM_FRAME_BITS-1:0] hist_frame; // frame numbers of the histogram outputs
     
     
     
    
    always @ (posedge mclk) begin
        cmd_ad <= cmd_ad_in;
        cmd_stb <= cmd_stb_in;
    end    

    generate
        genvar i;
        for (i=0; i < 4; i=i+1) begin: sensor_channel_block
            sensor_channel #(
                .SENSOR_NUMBER                 (i),
                .SENSOR_GROUP_ADDR             (SENSOR_GROUP_ADDR),
                .SENSOR_BASE_INC               (SENSOR_BASE_INC),
                .SENSI2C_STATUS_REG_BASE       (SENSI2C_STATUS_REG_BASE),
                .SENSI2C_STATUS_REG_INC        (SENSI2C_STATUS_REG_INC),
                .SENSI2C_STATUS_REG_REL        (SENSI2C_STATUS_REG_REL),
                .SENSIO_STATUS_REG_REL         (SENSIO_STATUS_REG_REL),
                .SENS_SYNC_RADDR               (SENS_SYNC_RADDR),
                .SENS_SYNC_MASK                (SENS_SYNC_MASK),
                .SENS_SYNC_MULT                (SENS_SYNC_MULT),
                .SENS_SYNC_LATE                (SENS_SYNC_LATE),
                .SENS_SYNC_FBITS               (SENS_SYNC_FBITS),
                .SENS_SYNC_LBITS               (SENS_SYNC_LBITS),
                .SENS_SYNC_LATE_DFLT           (SENS_SYNC_LATE_DFLT),
                .SENS_SYNC_MINBITS             (SENS_SYNC_MINBITS),
                .SENS_SYNC_MINPER              (SENS_SYNC_MINPER),
                .SENSOR_NUM_HISTOGRAM          (SENSOR_NUM_HISTOGRAM),
                .HISTOGRAM_RAM_MODE            (HISTOGRAM_RAM_MODE),
                .SENS_NUM_SUBCHN               (SENS_NUM_SUBCHN),
                .SENS_GAMMA_BUFFER             (SENS_GAMMA_BUFFER),
                .SENSOR_CTRL_RADDR             (SENSOR_CTRL_RADDR),
                .SENSOR_CTRL_ADDR_MASK         (SENSOR_CTRL_ADDR_MASK),
                .SENSOR_HIST_EN_BITS           (SENSOR_HIST_EN_BITS),
                .SENSOR_HIST_NRST_BITS         (SENSOR_HIST_NRST_BITS),
                .SENSOR_HIST_BITS_SET          (SENSOR_HIST_BITS_SET),
                .SENSOR_CHN_EN_BIT             (SENSOR_CHN_EN_BIT),
                .SENSOR_CHN_EN_BIT_SET         (SENSOR_CHN_EN_BIT_SET),
                .SENSOR_16BIT_BIT              (SENSOR_16BIT_BIT),
                .SENSOR_16BIT_BIT_SET          (SENSOR_16BIT_BIT_SET),
                .SENSI2C_CTRL_RADDR            (SENSI2C_CTRL_RADDR),
                .SENSI2C_CTRL_MASK             (SENSI2C_CTRL_MASK),
                .SENSI2C_CTRL                  (SENSI2C_CTRL),
                .SENSI2C_CMD_TABLE             (SENSI2C_CMD_TABLE),
                .SENSI2C_CMD_TAND              (SENSI2C_CMD_TAND),
                .SENSI2C_CMD_RESET             (SENSI2C_CMD_RESET),
                .SENSI2C_CMD_RUN               (SENSI2C_CMD_RUN),
                .SENSI2C_CMD_RUN_PBITS         (SENSI2C_CMD_RUN_PBITS),
                .SENSI2C_CMD_USE_EOF           (SENSI2C_CMD_USE_EOF),
                .SENSI2C_CMD_SOFT_SDA          (SENSI2C_CMD_SOFT_SDA),
                .SENSI2C_CMD_SOFT_SCL          (SENSI2C_CMD_SOFT_SCL),
                .SENSI2C_CMD_FIFO_RD           (SENSI2C_CMD_FIFO_RD),
                .SENSI2C_CMD_ACIVE             (SENSI2C_CMD_ACIVE),
                .SENSI2C_CMD_ACIVE_EARLY0      (SENSI2C_CMD_ACIVE_EARLY0),
                .SENSI2C_CMD_ACIVE_SDA         (SENSI2C_CMD_ACIVE_SDA),
                .SENSI2C_TBL_RAH               (SENSI2C_TBL_RAH), // high byte of the register address 
                .SENSI2C_TBL_RAH_BITS          (SENSI2C_TBL_RAH_BITS),
                .SENSI2C_TBL_RNWREG            (SENSI2C_TBL_RNWREG), // read register (when 0 - write register
                .SENSI2C_TBL_SA                (SENSI2C_TBL_SA), // Slave address in write mode
                .SENSI2C_TBL_SA_BITS           (SENSI2C_TBL_SA_BITS),
                .SENSI2C_TBL_NBWR              (SENSI2C_TBL_NBWR), // number of bytes to write (1..10)
                .SENSI2C_TBL_NBWR_BITS         (SENSI2C_TBL_NBWR_BITS),
                .SENSI2C_TBL_NBRD              (SENSI2C_TBL_NBRD), // number of bytes to read (1 - 8) "0" means "8"
                .SENSI2C_TBL_NBRD_BITS         (SENSI2C_TBL_NBRD_BITS),
                .SENSI2C_TBL_NABRD             (SENSI2C_TBL_NABRD), // number of address bytes for read (0 - 1 byte, 1 - 2 bytes)
                .SENSI2C_TBL_DLY               (SENSI2C_TBL_DLY),   // bit delay (number of mclk periods in 1/4 of SCL period)
                .SENSI2C_TBL_DLY_BITS          (SENSI2C_TBL_DLY_BITS),
                .SENSI2C_STATUS                (SENSI2C_STATUS),
                .SENS_GAMMA_RADDR              (SENS_GAMMA_RADDR),
                .SENS_GAMMA_ADDR_MASK          (SENS_GAMMA_ADDR_MASK),
                .SENS_GAMMA_CTRL               (SENS_GAMMA_CTRL),
                .SENS_GAMMA_ADDR_DATA          (SENS_GAMMA_ADDR_DATA),
                .SENS_GAMMA_HEIGHT01           (SENS_GAMMA_HEIGHT01),
                .SENS_GAMMA_HEIGHT2            (SENS_GAMMA_HEIGHT2),
                .SENS_GAMMA_MODE_BAYER         (SENS_GAMMA_MODE_BAYER),
                .SENS_GAMMA_MODE_BAYER_SET     (SENS_GAMMA_MODE_BAYER_SET),
                .SENS_GAMMA_MODE_PAGE          (SENS_GAMMA_MODE_PAGE),
                .SENS_GAMMA_MODE_PAGE_SET      (SENS_GAMMA_MODE_PAGE_SET),
                .SENS_GAMMA_MODE_EN            (SENS_GAMMA_MODE_EN),
                .SENS_GAMMA_MODE_EN_SET        (SENS_GAMMA_MODE_EN_SET),
                .SENS_GAMMA_MODE_REPET         (SENS_GAMMA_MODE_REPET),
                .SENS_GAMMA_MODE_REPET_SET     (SENS_GAMMA_MODE_REPET_SET),
                .SENS_GAMMA_MODE_TRIG          (SENS_GAMMA_MODE_TRIG),
                .SENS_LENS_RADDR               (SENS_LENS_RADDR),
                .SENS_LENS_ADDR_MASK           (SENS_LENS_ADDR_MASK),
                .SENS_LENS_COEFF               (SENS_LENS_COEFF),
                .SENS_LENS_AX                  (SENS_LENS_AX),
                .SENS_LENS_AX_MASK             (SENS_LENS_AX_MASK),
                .SENS_LENS_AY                  (SENS_LENS_AY),
                .SENS_LENS_AY_MASK             (SENS_LENS_AY_MASK),
                .SENS_LENS_C                   (SENS_LENS_C),
                .SENS_LENS_C_MASK              (SENS_LENS_C_MASK),
                .SENS_LENS_BX                  (SENS_LENS_BX),
                .SENS_LENS_BX_MASK             (SENS_LENS_BX_MASK),
                .SENS_LENS_BY                  (SENS_LENS_BY),
                .SENS_LENS_BY_MASK             (SENS_LENS_BY_MASK),
                .SENS_LENS_SCALES              (SENS_LENS_SCALES),
                .SENS_LENS_SCALES_MASK         (SENS_LENS_SCALES_MASK),
                .SENS_LENS_FAT0_IN             (SENS_LENS_FAT0_IN),
                .SENS_LENS_FAT0_IN_MASK        (SENS_LENS_FAT0_IN_MASK),
                .SENS_LENS_FAT0_OUT            (SENS_LENS_FAT0_OUT),
                .SENS_LENS_FAT0_OUT_MASK       (SENS_LENS_FAT0_OUT_MASK),
                .SENS_LENS_POST_SCALE          (SENS_LENS_POST_SCALE),
                .SENS_LENS_POST_SCALE_MASK     (SENS_LENS_POST_SCALE_MASK),
                .SENSIO_RADDR                  (SENSIO_RADDR),
                .SENSIO_ADDR_MASK              (SENSIO_ADDR_MASK),
                .SENSIO_CTRL                   (SENSIO_CTRL),
                .SENS_CTRL_MRST                (SENS_CTRL_MRST),
                .SENS_CTRL_ARST                (SENS_CTRL_ARST),
                .SENS_CTRL_ARO                 (SENS_CTRL_ARO),
                .SENS_CTRL_RST_MMCM            (SENS_CTRL_RST_MMCM),
`ifdef HISPI                
                .SENS_CTRL_IGNORE_EMBED        (SENS_CTRL_IGNORE_EMBED),
`else                
                .SENS_CTRL_EXT_CLK             (SENS_CTRL_EXT_CLK),
`endif                
                .SENS_CTRL_LD_DLY              (SENS_CTRL_LD_DLY),
`ifdef HISPI
                .SENS_CTRL_GP0                 (SENS_CTRL_GP0),
                .SENS_CTRL_GP1                 (SENS_CTRL_GP1),
`else        
                .SENS_CTRL_QUADRANTS           (SENS_CTRL_QUADRANTS),
                .SENS_CTRL_ODD                 (SENS_CTRL_ODD),
                .SENS_CTRL_QUADRANTS_WIDTH     (SENS_CTRL_QUADRANTS_WIDTH),
                .SENS_CTRL_QUADRANTS_EN        (SENS_CTRL_QUADRANTS_EN),
`endif                
                .SENSIO_STATUS                 (SENSIO_STATUS),
                .SENSIO_JTAG                   (SENSIO_JTAG),
                .SENS_JTAG_PGMEN               (SENS_JTAG_PGMEN),
                .SENS_JTAG_PROG                (SENS_JTAG_PROG),
                .SENS_JTAG_TCK                 (SENS_JTAG_TCK),
                .SENS_JTAG_TMS                 (SENS_JTAG_TMS),
                .SENS_JTAG_TDI                 (SENS_JTAG_TDI),
`ifndef HISPI
                .SENSIO_WIDTH                  (SENSIO_WIDTH),
`endif                
                .SENSIO_DELAYS                 (SENSIO_DELAYS),
                
`ifdef MON_HISPI
                .SENSOR_TIMING_STATUS_REG_BASE (SENSOR_TIMING_STATUS_REG_BASE),
                .SENSOR_TIMING_STATUS_REG_INC  (SENSOR_TIMING_STATUS_REG_INC),
                .SENSOR_TIMING_BITS            (SENSOR_TIMING_BITS),
                .SENSOR_TIMING_START           (SENSOR_TIMING_START),
                .SENSOR_TIMING_LANE            (SENSOR_TIMING_LANE),
                .SENSOR_TIMING_FROM            (SENSOR_TIMING_FROM),
                .SENSOR_TIMING_TO              (SENSOR_TIMING_TO),
`endif                
                .SENSI2C_ABS_RADDR             (SENSI2C_ABS_RADDR),
                .SENSI2C_REL_RADDR             (SENSI2C_REL_RADDR),
                .SENSI2C_ADDR_MASK             (SENSI2C_ADDR_MASK),
                .HISTOGRAM_RADDR0              (HISTOGRAM_RADDR0),
                .HISTOGRAM_RADDR1              (HISTOGRAM_RADDR1),
                .HISTOGRAM_RADDR2              (HISTOGRAM_RADDR2),
                .HISTOGRAM_RADDR3              (HISTOGRAM_RADDR3),
                .HISTOGRAM_ADDR_MASK           (HISTOGRAM_ADDR_MASK),
                .HISTOGRAM_LEFT_TOP            (HISTOGRAM_LEFT_TOP),
                .XOR_HIST_BAYER                (XOR_HIST_BAYER),
                .HISTOGRAM_WIDTH_HEIGHT        (HISTOGRAM_WIDTH_HEIGHT),
                .SENSI2C_DRIVE                 (SENSI2C_DRIVE),
                .SENSI2C_IBUF_LOW_PWR          (SENSI2C_IBUF_LOW_PWR),
                .SENSI2C_IOSTANDARD            (SENSI2C_IOSTANDARD),
                .SENSI2C_SLEW                  (SENSI2C_SLEW),
                .NUM_FRAME_BITS                (NUM_FRAME_BITS),
`ifndef HISPI
                .SENSOR_DATA_WIDTH             (SENSOR_DATA_WIDTH),
                .SENSOR_FIFO_2DEPTH            (SENSOR_FIFO_2DEPTH),
                .SENSOR_FIFO_DELAY             (SENSOR_FIFO_DELAY),
`endif                
                .IODELAY_GRP                   ((i & 2)?"IODELAY_SENSOR_34":"IODELAY_SENSOR_12"),
                .IDELAY_VALUE                  (IDELAY_VALUE),
                .PXD_DRIVE                     (PXD_DRIVE),
                .PXD_IBUF_LOW_PWR              (PXD_IBUF_LOW_PWR),
                .PXD_IOSTANDARD                (PXD_IOSTANDARD),
                .PXD_SLEW                      (PXD_SLEW),
                .SENS_REFCLK_FREQUENCY         (SENS_REFCLK_FREQUENCY),
                .SENS_HIGH_PERFORMANCE_MODE    (SENS_HIGH_PERFORMANCE_MODE),
`ifdef HISPI
                .PXD_CAPACITANCE               (PXD_CAPACITANCE),
                .PXD_CLK_DIV                   (PXD_CLK_DIV),
                .PXD_CLK_DIV_BITS              (PXD_CLK_DIV_BITS),
`endif
                .SENS_PHASE_WIDTH              (SENS_PHASE_WIDTH),
//                .SENS_PCLK_PERIOD              (SENS_PCLK_PERIOD),
                .SENS_BANDWIDTH                (SENS_BANDWIDTH),
                .CLKIN_PERIOD_SENSOR        (CLKIN_PERIOD_SENSOR),
                .CLKFBOUT_MULT_SENSOR          (CLKFBOUT_MULT_SENSOR),
                .CLKFBOUT_PHASE_SENSOR         (CLKFBOUT_PHASE_SENSOR),
                .IPCLK_PHASE                   (IPCLK_PHASE),
                .IPCLK2X_PHASE                 (IPCLK2X_PHASE),
                .BUF_IPCLK                     ((i & 2) ? ((i & 1) ? BUF_IPCLK_SENS3 :   BUF_IPCLK_SENS2)   : ((i & 1) ?BUF_IPCLK_SENS1   :BUF_IPCLK_SENS0 )),
                .BUF_IPCLK2X                   ((i & 2) ? ((i & 1) ? BUF_IPCLK2X_SENS3 : BUF_IPCLK2X_SENS2) : ((i & 1) ?BUF_IPCLK2X_SENS1 :BUF_IPCLK2X_SENS0 )),
                .SENS_DIVCLK_DIVIDE            (SENS_DIVCLK_DIVIDE),
                .SENS_REF_JITTER1              (SENS_REF_JITTER1),
                .SENS_REF_JITTER2              (SENS_REF_JITTER2),
                .SENS_SS_EN                    (SENS_SS_EN),
                .SENS_SS_MODE                  (SENS_SS_MODE),
                .SENS_SS_MOD_PERIOD            (SENS_SS_MOD_PERIOD)
`ifdef HISPI
               ,.HISPI_MSB_FIRST               (HISPI_MSB_FIRST),
                .HISPI_NUMLANES                (HISPI_NUMLANES),

                .HISPI_DELAY_CLK               ((i & 2) ? ((i & 1) ? HISPI_DELAY_CLK3 : HISPI_DELAY_CLK2) : ((i & 1) ?HISPI_DELAY_CLK1 : HISPI_DELAY_CLK0 )),
                .HISPI_MMCM                    ((i & 2) ? ((i & 1) ? HISPI_MMCM3 :      HISPI_MMCM2) :      ((i & 1) ?HISPI_MMCM1 :      HISPI_MMCM0 )),
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
                ,.DEBUG_CMD_LATENCY   (DEBUG_CMD_LATENCY) 
`endif        
            ) sensor_channel_i (
                .pclk         (pclk),                  // input
`ifdef USE_PCLK2X    
                .pclk2x       (pclk2x),                // input
`endif                
                .mrst         (mrst),                  // input
                .prst         (prst),                  // input
`ifdef HISPI
                .sns_dp       (sns_dp[i * 4 +: 4]),    // input[3:0] 
                .sns_dn       (sns_dn[i * 4 +: 4]),    // input[3:0]
                .sns_dp74     (sns_dp74[i * 4 +: 4]),  // input[3:0] 
                .sns_dn74     (sns_dn74[i * 4 +: 4]),  // input[3:0] 
                .sns_clkp     (sns_clkp[i]),           // input
                .sns_clkn     (sns_clkn[i]),           // input
`else                
                .sns_dp       (sns_dp[i * 8 +: 8]),    // inout[7:0] 
                .sns_dn       (sns_dn[i * 8 +: 8]),    // inout[7:0] 
                .sns_clkp     (sns_clkp[i]),           // inout
                .sns_clkn     (sns_clkn[i]),           // inout
`endif                
                .sns_scl      (sns_scl[i]),            // inout
                .sns_sda      (sns_sda[i]),            // inout
                .sns_ctl      (sns_ctl[i]),            // inout
                .sns_pg       (sns_pg[i]),             // inout
                
                .mclk         (mclk),                  // input
                .cmd_ad_in    (cmd_ad),                // input[7:0] 
                .cmd_stb_in   (cmd_stb),               // input
                .status_ad    (status_ad_chn[i * 8 +: 8]), // output[7:0] 
                .status_rq    (status_rq_chn[i]),      // output
                .status_start (status_start_chn[i]),   // input
                .trigger_mode (trigger_mode),          // input
                .trig_in      (trig_in[i]),            // input
                .frame_num_seq(frame_num[NUM_FRAME_BITS*i +:NUM_FRAME_BITS]), // input[3:0] 
                .dout         (px_data[16 * i +: 16]), // output[15:0] 
                .dout_valid   (px_valid[i]),           // output
                .last_in_line (last_in_line[i]),       // output
                .sof_out      (sof_out_pclk[i]),       // output
                .eof_out      (eof_out_pclk[i]),       // output
                .sof_out_mclk (sof_out_mclk[i]),       // output
                .sof_late_mclk(sof_late_mclk[i]),      // output
                .hist_request (hist_request[i]),       // output
                .hist_frame   (hist_frame[NUM_FRAME_BITS*i +:NUM_FRAME_BITS]), // output[3:0] 
                
                .hist_grant   (hist_grant[i]),         // input
                .hist_chn     (hist_chn[2 * i +: 2]),  // output[1:0] 
                .hist_dvalid  (hist_dvalid[i]),        // output
                .hist_data    (hist_data[i * 32 +: 32])// output[31:0] 
`ifdef DEBUG_RING       
                ,.debug_do    (debug_ring[i]),         // output
                .debug_sl     (debug_sl),              // input
                .debug_di     (debug_ring[i+1])        // input
`endif         
            );

            sensor_membuf #(
                .WADDR_WIDTH(9)
            ) sensor_membuf_i (
                .pclk          (pclk),                    // input
                .prst          (prst),                    // input
                .mrst          (mrst),                    // input
                .frame_run_mclk(frame_run_mclk[i]),       // input    @mclk - memory channel is ready to accept data from the sensor
                .px_data       (px_data[16 * i +: 16]),   // input[15:0] 
                .px_valid      (px_valid[i]),             // input
                .last_in_line  (last_in_line[i]),         // input
                .mclk          (mclk),                    // input
                .rpage_set     (rpage_set[i]),            // input
                .rpage_next    (rpage_next[i]),           // input
                .buf_rd        (buf_rd[i]),               // input
                .buf_dout      (buf_dout[64*i +: 64]),    // output[63:0]
                .page_written (page_written[i]) // output reg  single mclk pulse: buffer page (full or partial) is written to the memory buffer 
`ifdef DEBUG_SENS_MEM_PAGES
               ,.dbg_rpage     (dbg_rpage[2 * i +: 2])   
               ,.dbg_wpage     (dbg_wpage[2 * i +: 2])   
`endif              
            );
        end
    endgenerate

    histogram_saxi #(
        .HIST_SAXI_ADDR           (SENSOR_GROUP_ADDR + HIST_SAXI_ADDR_REL),
        .HIST_SAXI_ADDR_MASK      (HIST_SAXI_ADDR_MASK),
        .HIST_SAXI_MODE_ADDR      (SENSOR_GROUP_ADDR + HIST_SAXI_MODE_ADDR_REL),
        .HIST_SAXI_MODE_WIDTH     (HIST_SAXI_MODE_WIDTH),
        .HIST_SAXI_EN             (HIST_SAXI_EN),
        .HIST_SAXI_NRESET         (HIST_SAXI_NRESET),
        .HIST_CONFIRM_WRITE       (HIST_CONFIRM_WRITE),
        .HIST_SAXI_AWCACHE        (HIST_SAXI_AWCACHE),
        .HIST_SAXI_MODE_ADDR_MASK (HIST_SAXI_MODE_ADDR_MASK),
        .NUM_FRAME_BITS           (NUM_FRAME_BITS)
`ifdef DEBUG_RING
                ,.DEBUG_CMD_LATENCY   (DEBUG_CMD_LATENCY) 
`endif        
    ) histogram_saxi_i (
        .mclk           (mclk),                                          // input
        .aclk           (aclk),                                          // input
        .mrst           (mrst),                                          // input
        .arst           (arst),                                          // input
        .frame0         (hist_frame[NUM_FRAME_BITS*0 +:NUM_FRAME_BITS]), // input[3:0] 
        .hist_request0  (hist_request[0]),                               // input
        .hist_grant0    (hist_grant[0]),                                 // output
        .hist_chn0      (hist_chn[0 * 2 +: 2]),                          // input[1:0] 
        .hist_dvalid0   (hist_dvalid[0]),                                // input
        .hist_data0     (hist_data[0 * 32 +: 32]),                       // input[31:0] 
        .frame1         (hist_frame[NUM_FRAME_BITS*1 +:NUM_FRAME_BITS]), // input[3:0] 
        .hist_request1  (hist_request[1]),                               // input
        .hist_grant1    (hist_grant[1]),                                 // output
        .hist_chn1      (hist_chn[1 * 2 +: 2]),                          // input[1:0] 
        .hist_dvalid1   (hist_dvalid[1]),                                // input
        .hist_data1     (hist_data[1 * 32 +: 32]),                       // input[31:0] 
        .frame2         (hist_frame[NUM_FRAME_BITS*2 +:NUM_FRAME_BITS]), // input[3:0] 
        .hist_request2  (hist_request[2]),                               // input
        .hist_grant2    (hist_grant[2]),                                 // output
        .hist_chn2      (hist_chn[2 * 2 +: 2]),                          // input[1:0]
        .hist_dvalid2   (hist_dvalid[2]),                                // input
        .hist_data2     (hist_data[2 * 32 +: 32]),                       // input[31:0] 
        .frame3         (hist_frame[NUM_FRAME_BITS*3 +:NUM_FRAME_BITS]), // input[3:0] 
        .hist_request3  (hist_request[3]),                               // input
        .hist_grant3    (hist_grant[3]),                                 // output
        .hist_chn3      (hist_chn[3 * 2 +: 2]),                          // input[1:0]
        .hist_dvalid3   (hist_dvalid[3]),                                // input
        .hist_data3     (hist_data[3 * 32 +: 32]),                       // input[31:0] 
        .cmd_ad         (cmd_ad),                                        // input[7:0] 
        .cmd_stb        (cmd_stb),                                       // input
        .saxi_awaddr    (saxi_awaddr),                                   // output[31:0] 
        .saxi_awvalid   (saxi_awvalid),                                  // output
        .saxi_awready   (saxi_awready),                                  // input
        .saxi_awid      (saxi_awid),                                     // output[5:0] 
        .saxi_awlock    (saxi_awlock),                                   // output[1:0] 
        .saxi_awcache   (saxi_awcache),                                  // output[3:0] 
        .saxi_awprot    (saxi_awprot),                                   // output[2:0] 
        .saxi_awlen     (saxi_awlen),                                    // output[3:0] 
        .saxi_awsize    (saxi_awsize),                                   // output[1:0] 
        .saxi_awburst   (saxi_awburst),                                  // output[1:0] 
        .saxi_awqos     (saxi_awqos),                                    // output[3:0] 
        .saxi_wdata     (saxi_wdata),                                    // output[31:0] 
        .saxi_wvalid    (saxi_wvalid),                                   // output
        .saxi_wready    (saxi_wready),                                   // input
        .saxi_wid       (saxi_wid),                                      // output[5:0] 
        .saxi_wlast     (saxi_wlast),                                    // output
        .saxi_wstrb     (saxi_wstrb),                                    // output[3:0] 
        .saxi_bvalid    (saxi_bvalid),                                   // input
        .saxi_bready    (saxi_bready),                                   // output
        .saxi_bid       (saxi_bid),                                      // input[5:0] 
        .saxi_bresp     (saxi_bresp)                                     // input[1:0] 
`ifdef DEBUG_RING       
       ,.debug_do       (debug_ring[4]),                                 // output
        .debug_sl       (debug_sl),                                      // input
        .debug_di       (debug_ring[5])                                  // input
`endif         
    );
    
    status_router4 status_router4_i (
        .rst           (1'b0),                   // input
        .clk           (mclk),                   // input
        .srst          (mrst),                    // input
        .db_in0        (status_ad_chn[0 +: 8]),  // input[7:0] 
        .rq_in0        (status_rq_chn[0]),       // input
        .start_in0     (status_start_chn[0]),    // output
        .db_in1        (status_ad_chn[8 +: 8]),  // input[7:0] 
        .rq_in1        (status_rq_chn[1]),       // input
        .start_in1     (status_start_chn[1]),    // output
        .db_in2        (status_ad_chn[16 +: 8]), // input[7:0] 
        .rq_in2        (status_rq_chn[2]),       // input
        .start_in2     (status_start_chn[2]),    // output
        .db_in3        (status_ad_chn[24 +: 8]), // input[7:0] 
        .rq_in3        (status_rq_chn[3]),       // input
        .start_in3     (status_start_chn[3]),    // output
        .db_out        (status_ad),              // output[7:0] 
        .rq_out        (status_rq),              // output
        .start_out     (status_start)            // input
    );
// TODO: connect idelay outputs to smth
    idelay_ctrl# (
        .IODELAY_GRP("IODELAY_SENSOR_12")
    ) idelay_ctrl_sensor12_i (
        .refclk(ref_clk),
        .rst(dly_rst), //rst || dly_rst
        .rdy(idelay_ctrl_rdy[0])
    );
    
    idelay_ctrl# (
        .IODELAY_GRP("IODELAY_SENSOR_34")
    ) idelay_ctrl_sensor34_i (
        .refclk(ref_clk),
        .rst(dly_rst), //rst || dly_rst
        .rdy(idelay_ctrl_rdy[1])
    );
    
    
endmodule
