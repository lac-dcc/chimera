// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>timing393
 * @file timing393.v
 * @date 2015-07-05  
 * @author Andrey Filippov     
 *
 * @brief timestamp realrted functionality, extrenal synchronization
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * timing393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  timing393.v is distributed in the hope that it will be useful,
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

module  timing393       #(
    parameter RTC_ADDR=                         'h704, // 'h707
    parameter CAMSYNC_ADDR =                    'h708, // 'h70f
    parameter RTC_STATUS_REG_ADDR =             'h31,   // (1 loc) address where status can be read out (currently just sequence # and alternating bit) 
    parameter RTC_SEC_USEC_ADDR =               'h32,  // ..'h33 address where seconds of the snapshot can be read (microseconds - next address)
    parameter RTC_MASK =                        'h7fc,
    parameter CAMSYNC_MASK =                    'h7f8,
    parameter CAMSYNC_MODE =                    'h0,
    parameter CAMSYNC_TRIG_SRC =                'h1, // setup trigger source
    parameter CAMSYNC_TRIG_DST =                'h2, // setup trigger destination line(s)
    parameter CAMSYNC_TRIG_PERIOD =             'h3, // setup output trigger period
    parameter CAMSYNC_TRIG_DELAY0 =             'h4, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY1 =             'h5, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY2 =             'h6, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY3 =             'h7, // setup input trigger delay
    parameter CAMSYNC_EN_BIT =                  'h1, // enable module (0 - reset)
    parameter CAMSYNC_SNDEN_BIT =               'h3, // enable writing ts_snd_en
    parameter CAMSYNC_EXTERNAL_BIT =            'h5, // enable writing ts_external (0 - local timestamp in the frame header)
    parameter CAMSYNC_TRIGGERED_BIT =           'h7, // triggered mode ( 0- async)
    parameter CAMSYNC_MASTER_BIT =              'ha, // select a 2-bit master channel (master delay may be used as a flash delay)
//    parameter CAMSYNC_CHN_EN_BIT =              'hf, // per-channel enable timestamp generation
    parameter CAMSYNC_CHN_EN_BIT =              'h12, // per-channel enable timestamp generation (4 bits themselves, then for enables for them)
    parameter CAMSYNC_PRE_MAGIC =               6'b110100,
    parameter CAMSYNC_POST_MAGIC =              6'b001101,

    // GPIO bits used for camera synchronization
    parameter CAMSYNC_GPIO_EXT_IN =             9,
    parameter CAMSYNC_GPIO_INT_IN =             7,
    parameter CAMSYNC_GPIO_EXT_OUT =            6,
    parameter CAMSYNC_GPIO_INT_OUT =            8,
    
    parameter RTC_MHZ=                         25, // RTC input clock in MHz (should be interger number)
    parameter RTC_BITC_PREDIV =                 5, // number of bits to generate 2 MHz pulses counting refclk 
    parameter RTC_SET_USEC=                     0, // 20-bit number of microseconds
    parameter RTC_SET_SEC=                      1, // 32-bit full number of seconds (und actually update timer)
    parameter RTC_SET_CORR=                     2, // write correction 16-bit signed
    parameter RTC_SET_STATUS=                   3  // generate an output pulse to take a snapshot
    )(
//    input                         rst,          // global reset
    input                         mclk,         // system clock
    input                         pclk,         // was pixel clock in x353 clock (global) - switch it to 100MHz (mclk/2)?
    input                         mrst,        // @ posedge mclk - sync reset
    input                         prst,        // @ posedge pclk - sync reset
    
    input                         refclk,       // not a global clock, reference frequency < mclk/2    
    
    input                   [7:0] cmd_ad,       // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,      // strobe (with first byte) for the command a/d
    
    output                  [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,    // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)

    // connection to the general purpose I/O control    
    input                  [9:0]  gpio_in,        // 10-bit input from GPIO pins -> 10 bit
    output                 [9:0]  gpio_out,       // 10-bit output to GPIO pins
    output                 [9:0]  gpio_out_en,    // 10-bit output enable to GPIO pins

    // common for all sensors - use triggered mode (as opposed to a free-running mode)
    output                        triggered_mode, // use triggered mode (0 - sensors are free-running) @mclk - common to all sensors

    // per-channel frame sync inputs and trigger outputs. Both single-cycle mclk pulses
    input                         frsync_chn0,    // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn0,      // @mclk 1 cycle-long trigger output

    input                         frsync_chn1,  // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn1,    // 1 cycle-long trigger output

    input                         frsync_chn2,  // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn2,    // 1 cycle-long trigger output

    input                         frsync_chn3,  // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn3,    // 1 cycle-long trigger output
    
    // timestamps used by the compressor channel (to be included in the image file) and to the event logger (i.e. as a master timestamp)
    output                        ts_stb_chn0, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_data_chn0, // byte-wide serialized timestamp message received or local

    output                        ts_stb_chn1, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_data_chn1, // byte-wide serialized timestamp message received or local

    output                        ts_stb_chn2, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_data_chn2, // byte-wide serialized timestamp message received or local

    output                        ts_stb_chn3, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_data_chn3, // byte-wide serialized timestamp message received or local
    
    // timestamp for the event logger
    input                         lclk,           // clock used by the event logger 
    input                         lrst,           // @ posedge lclk - sync reset
    input                         ts_logger_snap, // request from the logger to take a snapshot
    output                        ts_logger_stb,  // one clock pulse before sending TS data
    output                  [7:0] ts_logger_data  // timestamp data (s0,s1,s2,s3,u0,u1,u2,u3==0)
    
);

    wire   [3:0] frame_sync;
    wire   [3:0] trig;
    wire   [3:0] ts_local_snap;  // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    wire   [3:0] ts_local_stb;   // 1 clk before ts_snd_data is valid
    wire  [31:0] ts_local_data;  // byte-wide serialized timestamp message  

    wire         ts_master_snap; // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    wire         ts_master_stb;  // 1 clk before ts_snd_data is valid
    wire   [7:0] ts_master_data; // byte-wide serialized timestamp message  



    wire   [3:0] ts_stb;        // 1 clk before ts_snd_data is valid
    wire  [31:0] ts_data;       // byte-wide serialized timestamp message (channels concatenated)
    
    wire  [31:0] live_sec;      // current time seconds, updated @ mclk  
    wire  [19:0] live_usec;     // current time microseconds, updated @ mclk


    assign {ts_stb_chn3, ts_stb_chn2, ts_stb_chn1, ts_stb_chn0} = ts_stb;
    assign {ts_data_chn3, ts_data_chn2, ts_data_chn1, ts_data_chn0} = ts_data; 
    assign {trig_chn3, trig_chn2, trig_chn1, trig_chn0} = trig;
    assign frame_sync = {frsync_chn3, frsync_chn2, frsync_chn1, frsync_chn0};

    rtc393 #(
        .RTC_ADDR               (RTC_ADDR),
        .RTC_STATUS_REG_ADDR    (RTC_STATUS_REG_ADDR),
        .RTC_SEC_USEC_ADDR      (RTC_SEC_USEC_ADDR),
        .RTC_MASK               (RTC_MASK),
        .RTC_MHZ                (RTC_MHZ),
        .RTC_BITC_PREDIV        (RTC_BITC_PREDIV),
        .RTC_SET_USEC           (RTC_SET_USEC),
        .RTC_SET_SEC            (RTC_SET_SEC),
        .RTC_SET_CORR           (RTC_SET_CORR),
        .RTC_SET_STATUS         (RTC_SET_STATUS)
    ) rtc393_i (
//        .rst                    (rst),          // input
        .mclk                   (mclk),         // input
        .mrst                   (mrst),          // input
        .refclk                 (refclk),       // input
        .cmd_ad                 (cmd_ad),       // input[7:0] 
        .cmd_stb                (cmd_stb),      // input
        .status_ad              (status_ad),    // output[7:0] 
        .status_rq              (status_rq),    // output
        .status_start           (status_start), // input
        .live_sec               (live_sec),     // output[31:0] 
        .live_usec              (live_usec)     // output[19:0] 
    );


    timestamp_snapshot timestamp_snapshot_logger_i (
//        .rst                   (rst),                      // input
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (lclk),                     // input
        .srst                  (lrst),                     // input
        .snap                  (ts_logger_snap),           // input
        .pre_stb               (ts_logger_stb),            // output
        .ts_data               (ts_logger_data)            // output[7:0] reg 
    );

    timestamp_snapshot timestamp_snapshot_chn0_i (
//        .rst                   (rst),                      // input
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (mclk),                     // input
        .srst                  (mrst),                     // input
        .snap                  (ts_local_snap[0]),         // input
        .pre_stb               (ts_local_stb[0]),          // output
        .ts_data               (ts_local_data[0 * 8 +: 8]) // output[7:0] reg 
    );

    timestamp_snapshot timestamp_snapshot_chn1_i (
//        .rst                   (rst),                      // input
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (mclk),                     // input
        .srst                  (mrst),                     // input
        .snap                  (ts_local_snap[1]),         // input
        .pre_stb               (ts_local_stb[1]),          // output
        .ts_data               (ts_local_data[1 * 8 +: 8]) // output[7:0] reg 
    );

    timestamp_snapshot timestamp_snapshot_chn2_i (
//        .rst                   (rst),                      // input
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (mclk),                     // input
        .srst                  (mrst),                     // input
        .snap                  (ts_local_snap[2]),         // input
        .pre_stb               (ts_local_stb[2]),          // output
        .ts_data               (ts_local_data[2 * 8 +: 8]) // output[7:0] reg 
    );

    timestamp_snapshot timestamp_snapshot_chn3_i (
//        .rst                   (rst),                      // input
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (mclk),                     // input
        .srst                  (mrst),                     // input
        .snap                  (ts_local_snap[3]),         // input
        .pre_stb               (ts_local_stb[3]),          // output
        .ts_data               (ts_local_data[3 * 8 +: 8]) // output[7:0] reg 
    );

    timestamp_snapshot timestamp_snapshot_master_i ( // timestamp to send over the sync network
        .tclk                  (mclk),                     // input
        .sec                   (live_sec),                 // input[31:0] 
        .usec                  (live_usec),                // input[19:0] 
        .sclk                  (mclk),                     // input
        .srst                  (mrst),                     // input
        .snap                  (ts_master_snap),           // input
        .pre_stb               (ts_master_stb),            // output
        .ts_data               (ts_master_data[7:0])       // output[7:0] reg 
    );


    camsync393 #(
        .CAMSYNC_ADDR           (CAMSYNC_ADDR),
        .CAMSYNC_MASK           (CAMSYNC_MASK),
        .CAMSYNC_MODE           (CAMSYNC_MODE),
        .CAMSYNC_TRIG_SRC       (CAMSYNC_TRIG_SRC),
        .CAMSYNC_TRIG_DST       (CAMSYNC_TRIG_DST),
        .CAMSYNC_TRIG_PERIOD    (CAMSYNC_TRIG_PERIOD),
        .CAMSYNC_TRIG_DELAY0    (CAMSYNC_TRIG_DELAY0),
        .CAMSYNC_TRIG_DELAY1    (CAMSYNC_TRIG_DELAY1),
        .CAMSYNC_TRIG_DELAY2    (CAMSYNC_TRIG_DELAY2),
        .CAMSYNC_TRIG_DELAY3    (CAMSYNC_TRIG_DELAY3),
        .CAMSYNC_EN_BIT         (CAMSYNC_EN_BIT),
        .CAMSYNC_SNDEN_BIT      (CAMSYNC_SNDEN_BIT),
        .CAMSYNC_EXTERNAL_BIT   (CAMSYNC_EXTERNAL_BIT),
        .CAMSYNC_TRIGGERED_BIT  (CAMSYNC_TRIGGERED_BIT),
        .CAMSYNC_MASTER_BIT     (CAMSYNC_MASTER_BIT),
        .CAMSYNC_CHN_EN_BIT     (CAMSYNC_CHN_EN_BIT),
        .CAMSYNC_PRE_MAGIC      (CAMSYNC_PRE_MAGIC),
        .CAMSYNC_POST_MAGIC     (CAMSYNC_POST_MAGIC),
        .CAMSYNC_GPIO_EXT_IN    (CAMSYNC_GPIO_EXT_IN),
        .CAMSYNC_GPIO_INT_IN    (CAMSYNC_GPIO_INT_IN),
        .CAMSYNC_GPIO_EXT_OUT   (CAMSYNC_GPIO_EXT_OUT),
        .CAMSYNC_GPIO_INT_OUT   (CAMSYNC_GPIO_INT_OUT)
    ) camsync393_i (
//        .rst               (rst),                       // input
        .mclk              (mclk),                      // input
        .mrst              (mrst),                      // input
        .cmd_ad            (cmd_ad),                    // input[7:0] 
        .cmd_stb           (cmd_stb),                   // input
        .pclk              (pclk),                      // input
        .prst              (prst),                      // input
        
        .gpio_in           (gpio_in),                   // input[9:0] 
        .gpio_out          (gpio_out),                  // output[9:0] 
        .gpio_out_en       (gpio_out_en),               // output[9:0] reg 
        .triggered_mode    (triggered_mode),            // output
        .frsync_chn0       (frame_sync[0]),             // input
        .trig_chn0         (trig[0]),                   // output
        .frsync_chn1       (frame_sync[1]),             // input
        .trig_chn1         (trig[1]),                   // output
        .frsync_chn2       (frame_sync[2]),             // input
        .trig_chn2         (trig[2]),                   // output
        .frsync_chn3       (frame_sync[3]),             // input
        .trig_chn3         (trig[3]),                   // output
        .ts_snap_mclk_chn0 (ts_local_snap[0]),          // output
        .ts_snd_stb_chn0   (ts_local_stb[0]),           // input
        .ts_snd_data_chn0  (ts_local_data[0 * 8 +: 8]), // input[7:0] 
        .ts_snap_mclk_chn1 (ts_local_snap[1]),          // output
        .ts_snd_stb_chn1   (ts_local_stb[1]),           // input
        .ts_snd_data_chn1  (ts_local_data[1 * 8 +: 8]), // input[7:0] 
        .ts_snap_mclk_chn2 (ts_local_snap[2]),          // output
        .ts_snd_stb_chn2   (ts_local_stb[2]),           // input
        .ts_snd_data_chn2  (ts_local_data[2 * 8 +: 8]), // input[7:0] 
        .ts_snap_mclk_chn3 (ts_local_snap[3]),          // output
        .ts_snd_stb_chn3   (ts_local_stb[3]),           // input
        .ts_snd_data_chn3  (ts_local_data[3 * 8 +: 8]), // input[7:0] 
        .ts_master_snap    (ts_master_snap),            // output
        .ts_master_stb     (ts_master_stb),             // input
        .ts_master_data    (ts_master_data),            // input[7:0] 
        .ts_rcv_stb_chn0   (ts_stb[0]),                 // output
        .ts_rcv_data_chn0  (ts_data[0 * 8 +: 8]),       // output[7:0] 
        .ts_rcv_stb_chn1   (ts_stb[1]),                 // output
        .ts_rcv_data_chn1  (ts_data[1 * 8 +: 8]),       // output[7:0] 
        .ts_rcv_stb_chn2   (ts_stb[2]),                 // output
        .ts_rcv_data_chn2  (ts_data[2 * 8 +: 8]),       // output[7:0] 
        .ts_rcv_stb_chn3   (ts_stb[3]),                 // output
        .ts_rcv_data_chn3  (ts_data[3 * 8 +: 8])        // output[7:0] 
    );

endmodule

