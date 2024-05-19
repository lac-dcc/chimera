// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>camsync393
 * @file camsync393.v
 * @date 2015-07-03  
 * @author Andrey Filippov     
 *
 * @brief Synchronization between cameras using GPIO lines:
 *  - triggering from selected line(s) with filter;
 *  - programmable delay to actual trigger (in pixel clock periods)
 *  - Generating trigger output to selected GPIO line (and polarity)
 *    or directly to the input delay generator (see bove)
 *  - single/repetitive output with specified period in pixel clocks
 *
 * @copyright Copyright (C) 2007-2015 Elphel, Inc
 *
 * <b>License:</b>
 *
 * jp_channel.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  jp_channel.v is distributed in the hope that it will be useful,
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
 
 // TODO: make a separate clock for transmission (program counters too?) and/or for the period timer?
 // TODO: change timestamp to serial message
 // TODO: see what depends on pclk and if can be made independent of the sensor clock.
//`define GENERATE_TRIG_OVERDUE 1
`undef GENERATE_TRIG_OVERDUE
module camsync393       #(
    parameter CAMSYNC_ADDR =               'h160, //TODO: assign valid address
    parameter CAMSYNC_MASK =               'h7f8,
    parameter CAMSYNC_MODE =               'h0,
    parameter CAMSYNC_TRIG_SRC =           'h1, // setup trigger source
    parameter CAMSYNC_TRIG_DST =           'h2, // setup trigger destination line(s)
    parameter CAMSYNC_TRIG_PERIOD =        'h3, // setup output trigger period
    parameter CAMSYNC_TRIG_DELAY0 =        'h4, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY1 =        'h5, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY2 =        'h6, // setup input trigger delay
    parameter CAMSYNC_TRIG_DELAY3 =        'h7, // setup input trigger delay
    
    parameter CAMSYNC_EN_BIT =             'h1, // enable module (0 - reset)
    parameter CAMSYNC_SNDEN_BIT =          'h3, // enable writing ts_snd_en
    parameter CAMSYNC_EXTERNAL_BIT =       'h5, // enable writing ts_external (0 - local timestamp in the frame header)
    parameter CAMSYNC_TRIGGERED_BIT =      'h7, // triggered mode ( 0- async)
    parameter CAMSYNC_MASTER_BIT =         'ha, // select a 2-bit master channel (master delay may be used as a flash delay)
    parameter CAMSYNC_CHN_EN_BIT =         'h12, // per-channel enable timestamp generation (4 bits themselves, then for enables for them)
    
    parameter CAMSYNC_PRE_MAGIC =          6'b110100,
    parameter CAMSYNC_POST_MAGIC =         6'b001101,

    // GPIO bits used for camera synchronization
    parameter CAMSYNC_GPIO_EXT_IN =        9,
    parameter CAMSYNC_GPIO_INT_IN =        7,
    parameter CAMSYNC_GPIO_EXT_OUT =       6,
    parameter CAMSYNC_GPIO_INT_OUT =       8

    )(
//    input                         rst,  // global reset
    input                         mclk, // @posedge (was negedge) AF2015: check external inversion - make it @posedge mclk
    input                         mrst,        // @ posedge mclk - sync reset
    input                   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,     // strobe (with first byte) for the command a/d
                           // 0 - mode: [1:0] - 3 - enable module, 2 - reset 0,1 - NOP
                           //           [3:2] +8 - reset ts_snd_en, +'hc - set ts_snd_en - enable sending timestamp over sync line
                           //           [5:4] +0x20 - reset ts_external, +'h30 - set ts_external:
                           //                  1 - use external timestamp, if available. 0 - always use local ts
                           //           [6:5] +'h40 - reset triggered mode (free running sensor), +'h30 - set sensor triggered mode
                           //           [10:8] +'h400 - set master channel (zero delay in internal trigger mode, delay used for flash output)
                           //         [15:11] +'h8000 - set which channels to generate timestamp messages
                           // UPDATE now di-bit "01" means "keep" (00 - do not use, 01 - keep, 10 set active 0, 11 - set active 1)
                           // 1 - source of trigger (10 bit pairs, LSB - level to trigger, MSB - use this bit). All 0 - internal trigger
                           //     in internal mode output has variable delay from the internal trigger (relative to sensor trigger)
                           // 2 - 10 bit pairs: MSB - enable selected line, LSB - level to send when trigger active
                           //     bit 25==1 some of the bits use test mode signals:
                           // 3 - output trigger period (duration constant of 256 pixel clocks). 
                           //     d == 0 - disable (stop periodic mode)
                           //     d == 1 - single trigger
                           //     d == 2..255 - set output pulse / input-output serial bit duration (no start generated)
                           //     d >= 256 - repetitive trigger
                           
                           // 4..7 - input trigger delay (in pclk periods) 
    input                         pclk,           // pixel clock (global) - switch it to 100MHz (mclk/2)?
    input                         prst,           // @ posedge pclk - sync reset
    input                  [9:0]  gpio_in,        // 10-bit input from GPIO pins -> 10 bit
    output                 [9:0]  gpio_out,       // 10-bit output to GPIO pins
    output                 [9:0]  gpio_out_en,    // 10-bit output enable to GPIO pins

    output                        triggered_mode, // use triggered mode (0 - sensors are free-running) @mclk

    input                         frsync_chn0,   // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn0,     // @mclk 1 cycle-long trigger output
`ifdef GENERATE_TRIG_OVERDUE    
    output                        trigger_chn0,  // @mclk active high trigger to the sensor (reset by vacts)
    output                        overdue_chn0,  // @mclk prevents lock-up when no vact was detected during one period and trigger was toggled
`endif
    input                         frsync_chn1,   // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn1,     // 1 cycle-long trigger output
`ifdef GENERATE_TRIG_OVERDUE    
    output                        trigger_chn1,  // active high trigger to the sensor (reset by vacts)
    output                        overdue_chn1,  // prevents lock-up when no vact was detected during one period and trigger was toggled
`endif
    input                         frsync_chn2,  // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn2,    // 1 cycle-long trigger output
`ifdef GENERATE_TRIG_OVERDUE    
    output                        trigger_chn2, // active high trigger to the sensor (reset by vacts)
    output                        overdue_chn2, // prevents lock-up when no vact was detected during one period and trigger was toggled
`endif
    input                         frsync_chn3,  // @mclk trigrst,   // single-clock start of frame input (resets trigger output) posedge (@pclk)
    output                        trig_chn3,    // 1 cycle-long trigger output
`ifdef GENERATE_TRIG_OVERDUE    
    output                        trigger_chn3, // active high trigger to the sensor (reset by vacts)
    output                        overdue_chn3, // prevents lock-up when no vact was detected during one period and trigger was toggled
`endif    
    // getting timestamp from rtc module, all @posedge mclk (from timestmp_snapshot)
    // this timestmp is used either to send local timestamp for synchronization, or
    // to acquire local timestamp of sync pulse for logging
    output                        ts_snap_mclk_chn0,     // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    input                         ts_snd_stb_chn0,  // 1 clk before ts_snd_data is valid
    input                   [7:0] ts_snd_data_chn0, // byte-wide serialized timestamp message  

    output                        ts_snap_mclk_chn1,     // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    input                         ts_snd_stb_chn1,  // 1 clk before ts_snd_data is valid
    input                   [7:0] ts_snd_data_chn1, // byte-wide serialized timestamp message  

    output                        ts_snap_mclk_chn2,     // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    input                         ts_snd_stb_chn2,  // 1 clk before ts_snd_data is valid
    input                   [7:0] ts_snd_data_chn2, // byte-wide serialized timestamp message  

    output                        ts_snap_mclk_chn3,     // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    input                         ts_snd_stb_chn3,  // 1 clk before ts_snd_data is valid
    input                   [7:0] ts_snd_data_chn3, // byte-wide serialized timestamp message  
    
// Timestamps to be sent over the network (or provided internally)    
    output                        ts_master_snap,   // ts_snap_mclk make a timestamp pulse  single @(posedge pclk)
    input                         ts_master_stb,    // 1 clk before ts_snd_data is valid
    input                   [7:0] ts_master_data,   // byte-wide serialized timestamp message  
    
    
    //ts_rcv_*sec (@mclk) goes to the following receivers:
                //ts_sync_*sec (synchronized to sensor clock) -> timestamp353 REMOVED
                //ts_sync_*sec (synchronized to sensor clock) -> compressor
                //ts_sync_*sec (synchronized to sensor clock) -> imu_logger
    // This timestamp is either received, got from internal timer (both common to all 4 channels)
    // or it is a free-running timestamp
    output                        ts_rcv_stb_chn0, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_rcv_data_chn0, // byte-wide serialized timestamp message received or local

    output                        ts_rcv_stb_chn1, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_rcv_data_chn1, // byte-wide serialized timestamp message received or local

    output                        ts_rcv_stb_chn2, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_rcv_data_chn2, // byte-wide serialized timestamp message received or local

    output                        ts_rcv_stb_chn3, // 1 clock before ts_rcv_data is valid
    output                  [7:0] ts_rcv_data_chn3 // byte-wide serialized timestamp message received or local
);
    reg           en = 0;       // enable camsync module
//    wire          rst = mrst || !en;
    wire          en_pclk;
    wire          eprst = prst || !en_pclk;
    reg           ts_snd_en;   // enable sending timestamp over sync line
    reg           ts_external;   // Combined bit  1 - use external timestamp, if available. 0 - always use local ts
    reg           ts_external_m; // 1 - use external timestamp, if available. 0 - always use local ts (mode bit)
    reg           triggered_mode_r;

//    reg    [31:0] ts_snd_sec;  // [31:0] timestamp seconds to be sent over the sync line - multiplexed from master channel
//    reg    [19:0] ts_snd_usec; // [19:0] timestamp microseconds to be sent over the sync line

    wire   [31:0] ts_snd_sec;  // [31:0] timestamp seconds to be sent over the sync line - multiplexed from master channel
    wire   [19:0] ts_snd_usec; // [19:0] timestamp microseconds to be sent over the sync line


    wire   [31:0] ts_snd_sec_chn0;  // [31:0] timestamp seconds to be sent over the sync line
    wire   [19:0] ts_snd_usec_chn0; // [19:0] timestamp microseconds to be sent over the sync line

    reg    [31:0] ts_rcv_sec_chn0;  // [31:0] timestamp seconds received over the sync line
    reg    [19:0] ts_rcv_usec_chn0;// [19:0] timestamp microseconds received over the sync line
    wire    [3:0] ts_stb;    // strobe when received timestamp is valid

    wire   [31:0] ts_snd_sec_chn1;  // [31:0] timestamp seconds to be sent over the sync line
    wire   [19:0] ts_snd_usec_chn1; // [19:0] timestamp microseconds to be sent over the sync line

    reg    [31:0] ts_rcv_sec_chn1;  // [31:0] timestamp seconds received over the sync line
    reg    [19:0] ts_rcv_usec_chn1;// [19:0] timestamp microseconds received over the sync line

    wire   [31:0] ts_snd_sec_chn2;  // [31:0] timestamp seconds to be sent over the sync line
    wire   [19:0] ts_snd_usec_chn2; // [19:0] timestamp microseconds to be sent over the sync line

    reg    [31:0] ts_rcv_sec_chn2;  // [31:0] timestamp seconds received over the sync line
    reg    [19:0] ts_rcv_usec_chn2;// [19:0] timestamp microseconds received over the sync line

    wire   [31:0] ts_snd_sec_chn3;  // [31:0] timestamp seconds to be sent over the sync line
    wire   [19:0] ts_snd_usec_chn3; // [19:0] timestamp microseconds to be sent over the sync line

    reg    [31:0] ts_rcv_sec_chn3;  // [31:0] timestamp seconds received over the sync line
    reg    [19:0] ts_rcv_usec_chn3;// [19:0] timestamp microseconds received over the sync line

    
    
    wire    [2:0] cmd_a;       // command address
    wire   [31:0] cmd_data;    // command data TODO: trim  
    wire          cmd_we;      // command write enable
    
    wire          set_mode_reg_w;
    wire          set_trig_src_w;
    wire          set_trig_delay0_w;
    wire          set_trig_delay1_w;
    wire          set_trig_delay2_w;
    wire          set_trig_delay3_w;
    wire          set_trig_dst_w;
    wire          set_trig_period_w;
    wire    [9:0] pre_input_use;
    wire    [9:0] pre_input_pattern;        

// delaying everything by 1 clock to reduce data fan in
    reg           high_zero;       // 24 MSBs are zero 
    reg     [9:0] input_use;       // 1 - use this bit
    reg     [9:0] input_pattern;   // data to be compared for trigger event to take place
    reg     [9:0] gpio_out_en_r;
    reg           pre_input_use_intern = 1;// @(posedge mclk) Use internal trigger generator, 0 - use external trigger (also switches delay from input to output)
    reg           input_use_intern;//  @(posedge clk) 
    reg    [31:0] input_dly_chn0;  // delay value for the trigger
    reg    [31:0] input_dly_chn1;  // delay value for the trigger
    reg    [31:0] input_dly_chn2;  // delay value for the trigger
    reg    [31:0] input_dly_chn3;  // delay value for the trigger
    reg     [3:0] chn_en_r;
    wire    [3:0] chn_en = chn_en_r & {4{en}};  // enable channels
    
    reg     [3:0] chn_en_pclk;     // enable channels
    reg     [1:0] master_chn;      // master channel (internal mode - delay used for flash) 
    reg     [9:0] gpio_active;     // output levels on the selected GPIO lines during output pulse (will be negated when inactive)
    reg           testmode;        // drive some internal signals to GPIO bits
    reg           outsync;         // during output active
    reg           out_data;        // output data (modulated with timestamp if enabled)
    reg    [31:0] repeat_period;    // restart period in repetitive mode
    reg           start,start_d;   // start single/repetitive output pulse(s)
    reg           rep_en;          // enable repetitive mode
    reg           rep_en_pclk;
    reg           start_en;
    wire          start_to_pclk;
    reg    [2:0]  start_pclk; // start and restart
    reg   [31:0]  restart_cntr; // restart period counter
    reg    [1:0]  restart_cntr_run; // restart counter running
    wire          restart;          // restart out sync
    wire   [9:0]  trigger_condition_mask_w; // which bits to watch for the trigger condition
    reg           trigger_condition; // GPIO input trigger condition met
    reg    [1:0]  trigger_condition_d; // GPIO input trigger condition met, delayed (for edge detection)
    reg           trigger_condition_filtered; // trigger condition filtered
    reg           trigger_condition_filtered_d; // trigger condition filtered delayed (to detect leading edge)
    reg    [6:0]  trigger_filter_cntr;
    reg    [3:0]  trig_r;
    wire   [3:0]  trig_r_mclk;
//    wire          trig_dly16; // trigger1 delayed by 16 clk cycles to get local timestamp
`ifdef GENERATE_TRIG_OVERDUE    
    reg    [3:0]  trigger_r=0;       // for happy simulator
    reg     [3:0] overdue;
`endif    
    reg           start_dly;      // start delay (external input filtered or from internal single/rep)
//    reg           start_early;    // start (external input filtered or from internal single/rep - early)
    reg   [31:0]  dly_cntr_chn0;       // trigger delay counter
    reg   [31:0]  dly_cntr_chn1;       // trigger delay counter
    reg   [31:0]  dly_cntr_chn2;       // trigger delay counter
    reg   [31:0]  dly_cntr_chn3;       // trigger delay counter
    reg    [3:0]  dly_cntr_run=0;   // trigger delay counter running (to use FD for simulation)
    reg    [3:0]  dly_cntr_run_d=0; // trigger delay counter running - delayed by 1
    wire   [3:0]  dly_cntr_end;
    wire          pre_start_out_pulse;
    reg           start_out_pulse; /// start generation of output pulse. In internal trigger mode uses delay counter, in external - no delay
    reg   [31:0]  pre_period;
    reg   [ 7:0]  bit_length='hff; /// Output pulse duration or bit duration in timestamp mode
                                   /// input will be filtered with (bit_length>>2) duration
    wire  [ 7:0]  bit_length_plus1; // bit_length+1
    reg   [ 7:0]  bit_length_short; /// 3/4 bit duration, delay for input strobe from the leading edge.
                                   
    wire          pre_start0;
    reg           start0;
    wire          pre_set_bit;
    reg           set_bit;
    wire          pre_set_period;
    reg           set_period;
    wire          start_late ;// delayed start to wait for time stamp to be available
    wire          start_late_first; // do not restart

    reg   [31:0]  sr_snd_first;
    reg   [31:0]  sr_snd_second;

    reg   [31:0]  sr_rcv_first;
    reg   [31:0]  sr_rcv_second;
    reg   [ 7:0]  bit_snd_duration;
    reg   [ 5:0]  bit_snd_counter;
    reg   [ 7:0]  bit_rcv_duration;
    reg           bit_rcv_duration_zero; // to make it faster, duration always >=2
    reg   [ 6:0]  bit_rcv_counter; // includes "deaf" period ater receving
    reg           bit_snd_duration_zero; //    
    reg           ts_snd_en_pclk;
    
    reg           rcv_run_or_deaf; // counters active
    wire          rcv_run;     // receive in progress, will always last for 64 bit_length+1 intervals before ready for the new input pulse
    reg           rcv_run_d;
    reg           rcv_done_rq; // request to copy time stamp (if it is not ready yet)
    reg           rcv_done_rq_d;
    reg           rcv_done;  // rcv_run ended, copy timestamp if requested
//    wire          rcv_done_mclk; // rcv_done re-clocked @mclk 
    wire          pre_rcv_error;  // pre/post magic does not match, set ts to all ff-s
    reg           rcv_error;

    reg           ts_external_pclk; // 1 - use external timestamp (combines ts_external and input_use_intern)
    reg           triggered_mode_pclk;
    reg           armed_internal_trigger; // to prevent re-start as in internal trigger mode timestamp
                                          // over for master channel triggers the sequence
                                          // and that timestmp is acquired for each delayed channel (including master) again
                                          // Is it still needed after mods or should be removed (likely)
    
    wire    [3:0] local_got; // received local timestamp (@ posedge mclk)
    wire    [3:0] local_got_pclk; // local_got reclocked @pclk
    wire          master_got;
    wire          master_got_pclk;
    wire    [3:0] frame_sync;
    reg     [3:0] ts_snap_triggered;     // make a timestamp pulse  single @(posedge pclk)
    reg           ts_master_snap_pclk;       // make a timestamp pulse  single @(posedge pclk)
    
    wire    [3:0] ts_snap_triggered_mclk;     // make a timestamp pulse  single @(posedge pclk)
    
    reg           ext_int_mode_mclk;    // triggered from external (no TS instead of the FPGA timer), generate internal network
                                        // sync+ts. Used for External trigger of Eyesis
                                        // Activated when CAMSYNC_GPIO_EXT_IN & !CAMSYNC_GPIO_EXT_OUT &
                                        //                 CAMSYNC_GPIO_INT_IN & CAMSYNC_GPIO_INT_OUT
    reg           ext_int_mode_pclk;     
    
    reg           ext_int_trigger_condition; // GPIO input trigger condition met
    reg    [1:0]  ext_int_trigger_condition_d; // GPIO input trigger condition met, delayed (for edge detection)
    reg           ext_int_trigger_condition_filtered; // trigger condition filtered
    reg           ext_int_trigger_condition_filtered_d; // trigger condition filtered - delayed version
    reg    [6:0]  ext_int_trigger_filter_cntr;
    reg           ext_int_pre_pause;   // when repeat counter is < 6 - to speed up decoding
    reg    [1:0]  ext_int_arm;         // 0 - when repeat counter =
    reg           ts_incoming;         // expect incoming timestamps (ts_snd_en && !input_use_intern)
    reg           received_or_master;  // either received timestamp or master

    wire   [31:0] ts_sec_received_or_master =  ts_incoming? {sr_rcv_first[25:0],  sr_rcv_second[31:26]} : ts_snd_sec[31:0];
    wire   [19:0] ts_usec_received_or_master = ts_incoming? {rcv_error?20'hfffff:  sr_rcv_second[25:6]} : ts_snd_usec[19:0];
    
    reg    [3:0]  frsync_pend;                // from start_dly->start_early to frsync_pclk[i]; (start_dly too late in internal trigger mode)
    reg           received_or_master_pending; // from start_dly->start_early to received_or_master;
    wire   [3:0]  pending_latest = frsync_pend | {4{received_or_master_pending}};
    reg    [3:0]  pending_latest_d;
    reg    [3:0]  ts_stb_pclk_r;
    reg           start_early;
    
    reg           suppress_immediate_set_mclk; // even single after repetitive will be suppressed (0 should be written first)
    wire          suppress_immediate_set_pclk;
    reg           suppress_immediate; // suppress first trigger if period was not 0 (to avoid re-started frames)
     
    wire          start_pclk2_masked= start_pclk[2] && !suppress_immediate; 
     
//    reg 

    
    
    wire   [3:0] frsync_pclk; // time to copy timestamps from master/received to channels (will always be after it is available)  
//    assign  chn_en = ch_en_r & {4{en}};  // enable channels
    
    assign gpio_out_en = gpio_out_en_r;
    
//    reg    [3:0]  ts_to_send; // per-channel discrimination between (first) timestamp to send and the second (individual, captured at frame sync)
    
    
//! in testmode GPIO[9] and GPIO[8] use internal signals instead of the outsync:
//! bit 11 - same as TRIGGER output to the sensor (signal to the sensor may be disabled externally)
//!          then that bit will be still from internall trigger to frame valid
//! bit 10 - dly_cntr_run (delay counter run) - active during trigger delay
    assign rcv_run=rcv_run_or_deaf && bit_rcv_counter[6];
    assign bit_length_plus1 [ 7:0] =bit_length[7:0]+1;
    assign dly_cntr_end= dly_cntr_run_d & ~dly_cntr_run;
    
    assign pre_start_out_pulse=input_use_intern?dly_cntr_end[master_chn]:start_late;


    assign  gpio_out[7: 0] = out_data? gpio_active[7: 0]: ~gpio_active[7: 0];
    assign  gpio_out[8] = (testmode? dly_cntr_run[0]:  out_data)? gpio_active[8]: ~gpio_active[8];
`ifdef GENERATE_TRIG_OVERDUE    
    assign  gpio_out[9] = (testmode? trigger_r[0]:  out_data)? gpio_active[9]: ~gpio_active[9];
`else
    assign  gpio_out[9] = (out_data)? gpio_active[9]: ~gpio_active[9];
`endif
    assign  restart= restart_cntr_run[1] && !restart_cntr_run[0];
    
    assign  pre_set_bit=     (|cmd_data[31:8]==0) && |cmd_data[7:1]; // 2..255
    assign  pre_start0=       |cmd_data[31:0] && !pre_set_bit; //  1, 256...
    assign  pre_set_period = !pre_set_bit; 

    assign {trig_chn3, trig_chn2, trig_chn1, trig_chn0} =  trig_r_mclk;

`ifdef GENERATE_TRIG_OVERDUE    
    assign {trigger_chn3,  trigger_chn2,  trigger_chn1,  trigger_chn0} =   trigger_r;
    assign {overdue_chn3,  overdue_chn2,  overdue_chn1,  overdue_chn0} =   overdue;
`endif    
    assign frame_sync = {frsync_chn3, frsync_chn2, frsync_chn1, frsync_chn0}; 
    
    assign set_mode_reg_w =     cmd_we && (cmd_a == CAMSYNC_MODE);
    assign set_trig_src_w =     cmd_we && (cmd_a == CAMSYNC_TRIG_SRC);
    assign set_trig_dst_w =     cmd_we && (cmd_a == CAMSYNC_TRIG_DST);
    assign set_trig_period_w =  cmd_we && (cmd_a == CAMSYNC_TRIG_PERIOD);
    assign set_trig_delay0_w =  cmd_we && (cmd_a == CAMSYNC_TRIG_DELAY0);
    assign set_trig_delay1_w =  cmd_we && (cmd_a == CAMSYNC_TRIG_DELAY1);
    assign set_trig_delay2_w =  cmd_we && (cmd_a == CAMSYNC_TRIG_DELAY2);
    assign set_trig_delay3_w =  cmd_we && (cmd_a == CAMSYNC_TRIG_DELAY3);
    
    assign pre_input_use = {cmd_data[19],cmd_data[17],cmd_data[15],cmd_data[13],cmd_data[11],
                            cmd_data[9],cmd_data[7],cmd_data[5],cmd_data[3],cmd_data[1]};
    assign pre_input_pattern = {cmd_data[18],cmd_data[16],cmd_data[14],cmd_data[12],cmd_data[10],
                                cmd_data[8],cmd_data[6],cmd_data[4],cmd_data[2],cmd_data[0]};
    assign triggered_mode = triggered_mode_r;
    assign {ts_snap_mclk_chn3, ts_snap_mclk_chn2, ts_snap_mclk_chn1, ts_snap_mclk_chn0 } = {4{en}} & (triggered_mode? ts_snap_triggered_mclk: frame_sync);
     // keep previous value if 2'b01
//    assign input_use_w = pre_input_use | (~pre_input_use & pre_input_pattern & input_use);
//    wire [9:0] input_mask = pre_input_pattern | ~pre_input_use;
    wire [9:0] input_mask = ~pre_input_pattern | pre_input_use;
    wire [9:0] input_use_w =     ((input_use     ^ pre_input_use)     & input_mask) ^ input_use;
    wire [9:0] input_pattern_w = ((input_pattern ^ pre_input_pattern) & input_mask) ^ input_pattern;

    wire [9:0] pre_gpio_out_en = {cmd_data[19],cmd_data[17],cmd_data[15],cmd_data[13],cmd_data[11],
                                 cmd_data[9],  cmd_data[7],  cmd_data[5], cmd_data[3], cmd_data[1]};
    wire [9:0] pre_gpio_active = {cmd_data[18],cmd_data[16],cmd_data[14],cmd_data[12],cmd_data[10],
                                  cmd_data[8], cmd_data[6], cmd_data[4], cmd_data[2], cmd_data[0]};

    wire [9:0] output_mask = pre_gpio_out_en | ~pre_gpio_active;
    wire [9:0] gpio_out_en_w =    ((gpio_out_en_r ^ pre_gpio_out_en) & output_mask) ^ gpio_out_en_r;
    wire [9:0] gpio_active_w =    ((gpio_active ^ pre_gpio_active) & output_mask) ^ gpio_active;

    always @(posedge mclk) begin
        if (set_mode_reg_w) begin
            if (cmd_data[CAMSYNC_EN_BIT])        en <=               cmd_data[CAMSYNC_EN_BIT - 1];
            if (cmd_data[CAMSYNC_SNDEN_BIT])     ts_snd_en <=        cmd_data[CAMSYNC_SNDEN_BIT - 1];
            if (cmd_data[CAMSYNC_EXTERNAL_BIT])  ts_external_m <=    cmd_data[CAMSYNC_EXTERNAL_BIT - 1];
            if (cmd_data[CAMSYNC_TRIGGERED_BIT]) triggered_mode_r <= cmd_data[CAMSYNC_TRIGGERED_BIT - 1];
            if (cmd_data[CAMSYNC_MASTER_BIT])    master_chn <=       cmd_data[CAMSYNC_MASTER_BIT - 1 -: 2];
// Making separate enables for each channel, so channel software will not disturb other channels
            if (cmd_data[CAMSYNC_CHN_EN_BIT-3])  chn_en_r[0] <= cmd_data[CAMSYNC_CHN_EN_BIT - 7];
            if (cmd_data[CAMSYNC_CHN_EN_BIT-2])  chn_en_r[1] <= cmd_data[CAMSYNC_CHN_EN_BIT - 6];
            if (cmd_data[CAMSYNC_CHN_EN_BIT-1])  chn_en_r[2] <= cmd_data[CAMSYNC_CHN_EN_BIT - 5];
            if (cmd_data[CAMSYNC_CHN_EN_BIT-0])  chn_en_r[3] <= cmd_data[CAMSYNC_CHN_EN_BIT - 4];
        end
        
        // Do not try to use external timestamp in free run or internally triggered mode
///        ts_external <= ts_external_m && !input_use_intern && triggered_mode_r;
        ts_external <= ts_external_m && triggered_mode_r; // internal will still use common timestamp made for sending
         
        if (mrst) input_use <= 0;
        if (!en) begin
            input_use <= 0;
            input_pattern <= 0;        
            pre_input_use_intern <= 1; // use internal source for triggering
        end else if (set_trig_src_w) begin
            input_use <= input_use_w;
            input_pattern <= input_pattern_w;        
            pre_input_use_intern <= (input_use_w == 0); // use internal source for triggering
        end

        if (set_trig_delay0_w) begin 
            input_dly_chn0[31:0] <= cmd_data[31:0];
        end

        if (set_trig_delay1_w) begin 
            input_dly_chn1[31:0] <= cmd_data[31:0];
        end

        if (set_trig_delay2_w) begin 
            input_dly_chn2[31:0] <= cmd_data[31:0];
        end

        if (set_trig_delay3_w) begin 
            input_dly_chn3[31:0] <= cmd_data[31:0];
        end

        if (!en) begin
            gpio_out_en_r[9:0] <= 0;
            gpio_active[9:0] <= 0;
            testmode <= 0;
        end else  if (set_trig_dst_w) begin
            gpio_out_en_r[9:0] <= gpio_out_en_w;
            gpio_active[9:0] <= gpio_active_w;
            testmode <= cmd_data[24];
        end

        if (set_trig_period_w) begin
            pre_period[31:0] <= cmd_data[31:0];
            high_zero        <= cmd_data[31:8]==24'b0;
        end

        start0     <= set_trig_period_w && pre_start0;
        set_bit    <= set_trig_period_w && pre_set_bit;
        set_period <= set_trig_period_w && pre_set_period;
        
        if (set_period) repeat_period[31:0] <= pre_period[31:0];
        if (set_bit)        bit_length[7:0] <= pre_period[ 7:0];
     
        start  <= start0;
        start_d <= start;

        start_en <= en && (repeat_period[31:0]!=0);
        
//        if      (!en)        rep_en <= 0;
        if      (mrst)       rep_en <= 0;
        else if (set_period) rep_en <= !high_zero;
        
        suppress_immediate_set_mclk <= set_period && rep_en && en; // even single will be suppressed if not after stopped/single  
        
        ext_int_mode_mclk <= input_use[CAMSYNC_GPIO_EXT_IN] && !gpio_out_en_r[CAMSYNC_GPIO_EXT_OUT] &&
                             input_use[CAMSYNC_GPIO_INT_IN] &&  gpio_out_en_r[CAMSYNC_GPIO_INT_OUT]; 
        
        
    end
    
    always @ (posedge pclk) begin
        chn_en_pclk <= chn_en;
        rep_en_pclk <= rep_en && en;
        
        if      (!en_pclk || start_pclk[2])    suppress_immediate <= 0;
        else if (suppress_immediate_set_pclk)  suppress_immediate <= 1;
    
        if (!input_use_intern || start_late) armed_internal_trigger <= 0;
        else if (start_pclk[2])              armed_internal_trigger <= 1;
        // now only at frame sync, others are handled by master timestamp
        ts_snap_triggered <=  chn_en_pclk & trig_r;  // get local timestamp of the trigger (ext/int). Non-trigger-mode will use frame sync instead
                              
// request master timestamp at start if it is sent out or at receive (if it is not).  ts_snd_en_pclk should be 0 if incoming sync does not have timestamps                              
                              
///        ts_master_snap_pclk <=  ts_snd_en_pclk? start_pclk[2]: rcv_done;
        ts_master_snap_pclk <=  ts_snd_en_pclk? start_pclk2_masked: rcv_done;
                            
        ts_snd_en_pclk<=ts_snd_en;
        input_use_intern <= pre_input_use_intern;
        ts_external_pclk<= ts_external; //  && !input_use_intern;
     
        start_pclk[2:0] <= {(restart && rep_en_pclk) || 
                            (start_pclk[1]  && !start_pclk[2]), // allows to restart running or armed counter
                            start_pclk[0],
                            start_to_pclk && !start_pclk[0]};
                            
        restart_cntr_run[1:0] <= {restart_cntr_run[0],start_en && (start_pclk[2] || (restart_cntr_run[0] && !ext_int_arm[1] && !start_pclk[0]))};
        
        if (restart_cntr_run[0]) begin
            if (!ext_int_arm[0])  restart_cntr[31:0] <= restart_cntr[31:0] - 1;
//        end else if (!restart_cntr_run[0])  restart_cntr[31:0] <= repeat_period[31:0];
        end else                  restart_cntr[31:0] <= repeat_period[31:0];

        ext_int_pre_pause <= !(|restart_cntr[31:3]);
        
        if (ext_int_arm[1] || !start_en)                 ext_int_arm[0] <= 0;
        if (ext_int_pre_pause && (restart_cntr[2:0]==5)) ext_int_arm[0] <= 1;
        
        ext_int_arm[1] <= !ext_int_arm[1] && (start_pclk[0] || (ext_int_arm[0] &&
         (!ext_int_mode_pclk || (ext_int_trigger_condition_filtered && !ext_int_trigger_condition_filtered_d))));

      
        start_out_pulse <= pre_start_out_pulse;
/// Generating output pulse - 64* bit_length if timestamp is disabled or
/// 64 bits with encoded timestamp, including pre/post magic for error detectrion
        outsync <= start_en && (start_out_pulse || (outsync && !((bit_snd_duration[7:0]==0) &&(bit_snd_counter[5:0]==0))));
        
        if (!outsync || (bit_snd_duration[7:0]==0)) bit_snd_duration[7:0] <= bit_length[7:0];
        else  bit_snd_duration[7:0] <= bit_snd_duration[7:0] - 1;
        
        bit_snd_duration_zero <= bit_snd_duration[7:0]==8'h1;

        if (!outsync) bit_snd_counter[5:0] <=ts_snd_en_pclk?63:3; /// when no ts serial, send pulse 4 periods long (max 1024 pclk)
      /// Same bit length (1/4) is used in input filter/de-glitcher
        else if (bit_snd_duration[7:0]==0)  bit_snd_counter[5:0] <=  bit_snd_counter[5:0] -1;

        if (!outsync)                       sr_snd_first[31:0]  <= {CAMSYNC_PRE_MAGIC,ts_snd_sec[31:6]};
        else if (bit_snd_duration_zero)     sr_snd_first[31:0]  <={sr_snd_first[30:0],sr_snd_second[31]};
        
        if (!outsync)                       sr_snd_second[31:0] <= {ts_snd_sec[5:0], ts_snd_usec[19:0],CAMSYNC_POST_MAGIC};
        else if (bit_snd_duration_zero)     sr_snd_second[31:0] <={sr_snd_second[30:0],1'b0};
        
        out_data <=outsync && (ts_snd_en_pclk?sr_snd_first[31]:1'b1);
        
        ext_int_mode_pclk <= ext_int_mode_mclk;
      
    end
 
    always @ (posedge pclk) begin
        if      (eprst)                dly_cntr_run <= 0;
        else if (!triggered_mode_pclk) dly_cntr_run <= 0;
        else if (start_dly)            dly_cntr_run <= 4'hf;
        else                           dly_cntr_run <= dly_cntr_run &
                 {(dly_cntr_chn3[31:0]!=0)?1'b1:1'b0,  
                  (dly_cntr_chn2[31:0]!=0)?1'b1:1'b0,
                  (dly_cntr_chn1[31:0]!=0)?1'b1:1'b0,
                  (dly_cntr_chn0[31:0]!=0)?1'b1:1'b0};
    end
 
 `ifdef GENERATE_TRIG_OVERDUE    
     always @ (posedge mclk) begin
        if      (rst)             trigger_r <= 0;
        else if (!triggered_mode) trigger_r <= 0;
        else                      trigger_r <= ~frame_sync & (trig_r_mclk ^ trigger_r);

        if      (rst)             overdue <= 0;
        else if (!triggered_mode) overdue <= 0;
        else                      overdue <= ((overdue ^ trigger_r) & trig_r_mclk) ^ overdue;
        
    end
 `endif   
     
// Detecting input sync pulse (filter - 64 pclk, pulse is 256 pclk)

/// Now trig_r toggles trigger output to prevent lock-up if no vacts
/// Lock-up could take place if:
/// 1 - Sensor is in snapshot mode
/// 2 - trigger was applied before end of previous frame.
/// With implemented toggling 1 extra pulse can be missed (2 with the original missed one), but the system will not lock-up 
/// if the trigger pulses continue to come.

    assign pre_rcv_error= (sr_rcv_first[31:26]!=CAMSYNC_PRE_MAGIC) || (sr_rcv_second[5:0]!=CAMSYNC_POST_MAGIC);
    assign trigger_condition_mask_w = input_use[9:0] &  ~(ext_int_mode_pclk?(10'b1 << CAMSYNC_GPIO_EXT_IN):10'b0);
    
    always @ (posedge pclk) begin

        triggered_mode_pclk<= triggered_mode_r;
        bit_length_short[7:0] <= bit_length[7:0]-bit_length_plus1[7:2]-1; // 3/4 of the duration

//        trigger_condition <= (((gpio_in[9:0] ^ input_pattern[9:0]) & input_use[9:0]) == 10'b0);
//        trigger_condition <= (((gpio_in[9:0] ^ input_pattern[9:0]) & input_use[9:0] &
//         ~(ext_int_mode_pclk?(10'b1 << CAMSYNC_GPIO_EXT_IN):10'b0)) == 10'b0); // disable external trigger in line

    // trigger_condition_mask_w is @ mclk, but input signal is asynchronous too, so filtering is needed anyway)
        trigger_condition <=  (|trigger_condition_mask_w) && (((gpio_in[9:0] ^ input_pattern[9:0]) & trigger_condition_mask_w) == 10'b0); // disable external trigger in line
        
        trigger_condition_d <= {trigger_condition_d[0], trigger_condition};
     
     
        if (!triggered_mode_pclk || (trigger_condition_d[0] !=trigger_condition_d[1])) trigger_filter_cntr <= {1'b0,bit_length[7:2]};
        else if (!trigger_filter_cntr[6]) trigger_filter_cntr<=trigger_filter_cntr-1;
     
        if      (input_use_intern)       trigger_condition_filtered <= 1'b0;
        else if (trigger_filter_cntr[6]) trigger_condition_filtered <= trigger_condition_d[1];
        
        trigger_condition_filtered_d <=trigger_condition_filtered;
      
                                     
        rcv_run_or_deaf <= start_en && ((trigger_condition_filtered && !trigger_condition_filtered_d)|| // Is it OK to use leading edge only here?
                                       (rcv_run_or_deaf && !(bit_rcv_duration_zero  && (bit_rcv_counter[6:0]==0))));

        ext_int_trigger_condition <= ext_int_mode_pclk && !(gpio_in[CAMSYNC_GPIO_EXT_IN] ^ input_pattern[CAMSYNC_GPIO_EXT_IN]); // disable external trigger in line
        ext_int_trigger_condition_d <= {ext_int_trigger_condition_d[0], ext_int_trigger_condition};
     
        if (!triggered_mode_pclk || (ext_int_trigger_condition_d[0] !=ext_int_trigger_condition_d[1])) ext_int_trigger_filter_cntr <= {1'b0,bit_length[7:2]};
        else if (!ext_int_trigger_filter_cntr[6]) ext_int_trigger_filter_cntr <= ext_int_trigger_filter_cntr-1;
     
        if      (input_use_intern)                ext_int_trigger_condition_filtered <= 1'b0;
        else if (ext_int_trigger_filter_cntr[6])  ext_int_trigger_condition_filtered <= ext_int_trigger_condition_d[1];
        
        ext_int_trigger_condition_filtered_d <= ext_int_trigger_condition_filtered;
        

        rcv_run_d <= rcv_run; 
        
        start_dly <= input_use_intern ?
                      (start_late_first && start_en) : // only use armed_internal_trigger with timestamps
                      (rcv_run && !rcv_run_d);  // all start at the same time - master/others
                      
                      
///        start_early <=input_use_intern ?
///                      (start_pclk[2] && start_en) :
///                      (rcv_run && !rcv_run_d);  // all start at the same time - master/others
        start_early <=input_use_intern ?
                      (start_pclk2_masked && start_en) :
                      (rcv_run && !rcv_run_d);  // all start at the same time - master/others
                      
//                      
// simulation problems w/o "start_en &&" ? 

        dly_cntr_run_d <= dly_cntr_run;
        if (dly_cntr_run[0]) dly_cntr_chn0[31:0] <= dly_cntr_chn0[31:0] -1;
        else                 dly_cntr_chn0[31:0] <= input_dly_chn0[31:0];
        
        if (dly_cntr_run[1]) dly_cntr_chn1[31:0] <= dly_cntr_chn1[31:0] -1;
        else                 dly_cntr_chn1[31:0] <= input_dly_chn1[31:0];
        
        if (dly_cntr_run[2]) dly_cntr_chn2[31:0] <= dly_cntr_chn2[31:0] -1;
        else                 dly_cntr_chn2[31:0] <= input_dly_chn2[31:0];
        
        if (dly_cntr_run[3]) dly_cntr_chn3[31:0] <= dly_cntr_chn3[31:0] -1;
        else                 dly_cntr_chn3[31:0] <= input_dly_chn3[31:0];
        
        /// bypass delay to trig_r in internal trigger mode
        trig_r[0] <= (input_use_intern && (master_chn ==0)) ? (start_late_first && start_en): dly_cntr_end[0];
        trig_r[1] <= (input_use_intern && (master_chn ==1)) ? (start_late_first && start_en): dly_cntr_end[1];
        trig_r[2] <= (input_use_intern && (master_chn ==2)) ? (start_late_first && start_en): dly_cntr_end[2];
        trig_r[3] <= (input_use_intern && (master_chn ==3)) ? (start_late_first && start_en): dly_cntr_end[3];
        
/// 64-bit serial receiver (52 bit payload, 6 pre magic and 6 bits post magic for error checking
        if      (!rcv_run_or_deaf)         bit_rcv_duration[7:0] <= bit_length_short[7:0]; // 3/4 bit length-1
        else if (bit_rcv_duration[7:0]==0) bit_rcv_duration[7:0] <= bit_length[7:0];       // bit length-1
        else                               bit_rcv_duration[7:0] <= bit_rcv_duration[7:0]-1;
        
        bit_rcv_duration_zero <= bit_rcv_duration[7:0]==8'h1;
        if      (!rcv_run_or_deaf)         bit_rcv_counter[6:0]  <= 127;
        else if (bit_rcv_duration_zero)    bit_rcv_counter[6:0]  <= bit_rcv_counter[6:0] -1;

        if (rcv_run && bit_rcv_duration_zero) begin
            sr_rcv_first[31:0]  <={sr_rcv_first[30:0],sr_rcv_second[31]}; 
            sr_rcv_second[31:0] <={sr_rcv_second[30:0],trigger_condition_filtered};
        end
// Why was it local_got_pclk? Also, it is a multi-bit vector
//        rcv_done_rq <= start_en && ((ts_external_pclk && local_got_pclk) || (rcv_done_rq && rcv_run));
// TODO: think of disabling receiving sync if sensor is not ready yet (not done with a previous frame)
        rcv_done_rq <= start_en && ((ts_external_pclk && (rcv_run && !rcv_run_d)) || (rcv_done_rq && rcv_run));
        //
        rcv_done_rq_d <= rcv_done_rq;
        rcv_done <= rcv_done_rq_d && !rcv_done_rq;
      
        rcv_error <= pre_rcv_error;

        ts_incoming <= ts_snd_en_pclk && !input_use_intern;
        received_or_master <= ts_incoming ? rcv_done: master_got_pclk;
        
        
        frsync_pend <=                chn_en_pclk & ({4{start_early}} | (frsync_pend & ~frsync_pclk));
        received_or_master_pending <= en_pclk & (start_early | (received_or_master_pending & ~received_or_master));
        pending_latest_d <=           pending_latest;                   // delayed version
        ts_stb_pclk_r <=              (triggered_mode_pclk && ts_external_pclk)? (pending_latest_d & ~pending_latest): local_got_pclk ; // trailing edge or just local
        
        if (triggered_mode_pclk && ts_external_pclk) begin
            if (received_or_master) begin
                ts_rcv_sec_chn0  [31:0] <= ts_sec_received_or_master;
                ts_rcv_usec_chn0 [19:0] <= ts_usec_received_or_master;
                ts_rcv_sec_chn1  [31:0] <= ts_sec_received_or_master;
                ts_rcv_usec_chn1 [19:0] <= ts_usec_received_or_master;
                ts_rcv_sec_chn2  [31:0] <= ts_sec_received_or_master;
                ts_rcv_usec_chn2 [19:0] <= ts_usec_received_or_master;
                ts_rcv_sec_chn3  [31:0] <= ts_sec_received_or_master;
                ts_rcv_usec_chn3 [19:0] <= ts_usec_received_or_master;
            end
        end else begin // use local timestamps
            if (local_got_pclk[0]) begin
                ts_rcv_sec_chn0[31:0] <=  ts_snd_sec_chn0 [31:0];
                ts_rcv_usec_chn0[19:0] <=  ts_snd_usec_chn0[19:0];
            end
            if (local_got_pclk[1]) begin
                ts_rcv_sec_chn1[31:0] <=  ts_snd_sec_chn1 [31:0];
                ts_rcv_usec_chn1[19:0] <=  ts_snd_usec_chn1[19:0];
            end
            if (local_got_pclk[2]) begin
                ts_rcv_sec_chn2[31:0] <=  ts_snd_sec_chn2 [31:0];
                ts_rcv_usec_chn2[19:0] <=  ts_snd_usec_chn2[19:0];
            end
            if (local_got_pclk[3]) begin
                ts_rcv_sec_chn3[31:0] <=  ts_snd_sec_chn3 [31:0];
                ts_rcv_usec_chn3[19:0] <=  ts_snd_usec_chn3[19:0];
            end
        end


/*
        if (rcv_done) begin
            ts_rcv_sec_chn0  [31:0] <= {sr_rcv_first[25:0],sr_rcv_second[31:26]};
            ts_rcv_usec_chn0 [19:0] <= rcv_error?20'hfffff:   sr_rcv_second[25:6];
        end else if (master_got_pclk && ts_external_pclk) begin
            ts_rcv_sec_chn0[31:0] <=   ts_snd_sec[31:0];
            ts_rcv_usec_chn0[19:0] <=  ts_snd_usec[19:0];
        end else if (!triggered_mode_pclk || (!ts_external_pclk && local_got_pclk[0])) begin
            ts_rcv_sec_chn0[31:0] <=  ts_snd_sec_chn0 [31:0];
            ts_rcv_usec_chn0[19:0] <=  ts_snd_usec_chn0[19:0];
        end


        ts_incoming <= ts_snd_en_pclk && !input_use_intern;

        if (triggered_mode_pclk && ts_external_pclk) begin
            if (frsync_pclk[0]) begin
                ts_rcv_sec_chn0  [31:0] <= ts_incoming? {sr_rcv_first[25:0],  sr_rcv_second[31:26]} : ts_snd_sec[31:0];
                ts_rcv_usec_chn0 [19:0] <= ts_incoming? {rcv_error?20'hfffff:  sr_rcv_second[25:6]} : ts_snd_usec[19:0];
            end
            if (frsync_pclk[1]) begin
                ts_rcv_sec_chn1  [31:0] <= ts_incoming? {sr_rcv_first[25:0],  sr_rcv_second[31:26]} : ts_snd_sec[31:0];
                ts_rcv_usec_chn1 [19:0] <= ts_incoming? {rcv_error?20'hfffff:  sr_rcv_second[25:6]} : ts_snd_usec[19:0];
            end
            if (frsync_pclk[2]) begin
                ts_rcv_sec_chn2  [31:0] <= ts_incoming? {sr_rcv_first[25:0],  sr_rcv_second[31:26]} : ts_snd_sec[31:0];
                ts_rcv_usec_chn2 [19:0] <= ts_incoming? {rcv_error?20'hfffff:  sr_rcv_second[25:6]} : ts_snd_usec[19:0];
            end
            if (frsync_pclk[3]) begin
                ts_rcv_sec_chn3  [31:0] <= ts_incoming? {sr_rcv_first[25:0],  sr_rcv_second[31:26]} : ts_snd_sec[31:0];
                ts_rcv_usec_chn3 [19:0] <= ts_incoming? {rcv_error?20'hfffff:  sr_rcv_second[25:6]} : ts_snd_usec[19:0];
            end
        end else begin
            if (local_got_pclk[0]) begin
                ts_rcv_sec_chn0[31:0] <=  ts_snd_sec_chn0 [31:0];
                ts_rcv_usec_chn0[19:0] <=  ts_snd_usec_chn0[19:0];
            end
            if (local_got_pclk[1]) begin
                ts_rcv_sec_chn1[31:0] <=  ts_snd_sec_chn1 [31:0];
                ts_rcv_usec_chn1[19:0] <=  ts_snd_usec_chn1[19:0];
            end
            if (local_got_pclk[2]) begin
                ts_rcv_sec_chn2[31:0] <=  ts_snd_sec_chn2 [31:0];
                ts_rcv_usec_chn2[19:0] <=  ts_snd_usec_chn2[19:0];
            end
            if (local_got_pclk[3]) begin
                ts_rcv_sec_chn3[31:0] <=  ts_snd_sec_chn3 [31:0];
                ts_rcv_usec_chn3[19:0] <=  ts_snd_usec_chn3[19:0];
            end
        end
*/        
    end

//    assign ts_stb = (!ts_external || pre_input_use_intern) ? local_got : {4{rcv_done_mclk}};
    
//  rcv_done_mclk - make it either really received or from FPGA if internal?   
    
    // Making delayed start that waits for timestamp use timestamp_got, otherwise - nothing to wait
///    assign start_late =    ts_snd_en_pclk?master_got_pclk :  start_pclk[2];   
    assign start_late =       ts_snd_en_pclk?master_got_pclk :  start_pclk2_masked;   
    assign start_late_first = start_late && (armed_internal_trigger|| !ts_snd_en_pclk);
    
    cmd_deser #(
        .ADDR       (CAMSYNC_ADDR),
        .ADDR_MASK  (CAMSYNC_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (3),
        .DATA_WIDTH (32)
    ) cmd_deser_32bit_i (
        .rst        (1'b0),        //rst),         // input
        .clk        (mclk),        // input
        .srst       (mrst),        // input
        .ad         (cmd_ad),      // input[7:0] 
        .stb        (cmd_stb),     // input
        .addr       (cmd_a),       // output[3:0] 
        .data       (cmd_data),    // output[31:0] 
        .we         (cmd_we)       // output
    );

    timestamp_to_parallel timestamp_to_parallel0_i (
        .clk        (mclk),        // input
        .pre_stb    (ts_snd_stb_chn0),  // input
        .tdata      (ts_snd_data_chn0), // input[7:0] 
        .sec        (ts_snd_sec_chn0),  // output[31:0] reg 
        .usec       (ts_snd_usec_chn0), // output[19:0] reg 
        .done       (local_got[0])    // output
    );

    timestamp_to_parallel timestamp_to_parallel1_i (
        .clk        (mclk),        // input
        .pre_stb    (ts_snd_stb_chn1),  // input
        .tdata      (ts_snd_data_chn1), // input[7:0] 
        .sec        (ts_snd_sec_chn1),  // output[31:0] reg 
        .usec       (ts_snd_usec_chn1), // output[19:0] reg 
        .done       (local_got[1])    // output
    );

    timestamp_to_parallel timestamp_to_parallel2_i (
        .clk        (mclk),        // input
        .pre_stb    (ts_snd_stb_chn2),  // input
        .tdata      (ts_snd_data_chn2), // input[7:0] 
        .sec        (ts_snd_sec_chn2),  // output[31:0] reg 
        .usec       (ts_snd_usec_chn2), // output[19:0] reg 
        .done       (local_got[2])    // output
    );

    timestamp_to_parallel timestamp_to_parallel3_i (
        .clk        (mclk),        // input
        .pre_stb    (ts_snd_stb_chn3),  // input
        .tdata      (ts_snd_data_chn3), // input[7:0] 
        .sec        (ts_snd_sec_chn3),  // output[31:0] reg 
        .usec       (ts_snd_usec_chn3), // output[19:0] reg 
        .done       (local_got[3])    // output
    );

    timestamp_to_parallel timestamp_to_parallel_master_i (
        .clk        (mclk),             // input
        .pre_stb    (ts_master_stb),    // input
        .tdata      (ts_master_data),   // input[7:0] 
        .sec        (ts_snd_sec),       // output[31:0] reg 
        .usec       (ts_snd_usec),      // output[19:0] reg 
        .done       (master_got)        // output
    );



    timestamp_to_serial timestamp_to_serial0_i (
        .clk        (mclk),             // input
        .stb        (ts_stb[0]),        // input
        .sec        (ts_rcv_sec_chn0),  // input[31:0] 
        .usec       (ts_rcv_usec_chn0), // input[19:0] 
        .tdata      (ts_rcv_data_chn0)  // output[7:0] reg 
    );

    timestamp_to_serial timestamp_to_serial1_i (
        .clk        (mclk),             // input
        .stb        (ts_stb[1]),        // input
        .sec        (ts_rcv_sec_chn1),  // input[31:0] 
        .usec       (ts_rcv_usec_chn1), // input[19:0] 
        .tdata      (ts_rcv_data_chn1)  // output[7:0] reg 
    );

    timestamp_to_serial timestamp_to_serial2_i (
        .clk        (mclk),             // input
        .stb        (ts_stb[2]),        // input
        .sec        (ts_rcv_sec_chn2),  // input[31:0] 
        .usec       (ts_rcv_usec_chn2), // input[19:0] 
        .tdata      (ts_rcv_data_chn2)  // output[7:0] reg 
    );

    timestamp_to_serial timestamp_to_serial3_i (
        .clk        (mclk),             // input
        .stb        (ts_stb[3]),        // input
        .sec        (ts_rcv_sec_chn3),  // input[31:0] 
        .usec       (ts_rcv_usec_chn3), // input[19:0] 
        .tdata      (ts_rcv_data_chn3)  // output[7:0] reg 
    );



    level_cross_clocks #(
        .WIDTH(1),
        .REGISTER(2)
    ) level_cross_clocks_en_pclki (
        .clk   (pclk),     // input
        .d_in  (en),      // input[0:0] 
        .d_out (en_pclk) // output[0:0] 
    );


    assign {ts_rcv_stb_chn3, ts_rcv_stb_chn2, ts_rcv_stb_chn1, ts_rcv_stb_chn0}= ts_stb;
    pulse_cross_clock i_start_to_pclk (.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(start_d && start_en), .out_pulse(start_to_pclk),.busy());

    pulse_cross_clock i_ts_snap_mclk0 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_snap_triggered[0]), .out_pulse(ts_snap_triggered_mclk[0]),.busy());
    pulse_cross_clock i_ts_snap_mclk1 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_snap_triggered[1]), .out_pulse(ts_snap_triggered_mclk[1]),.busy());
    pulse_cross_clock i_ts_snap_mclk2 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_snap_triggered[2]), .out_pulse(ts_snap_triggered_mclk[2]),.busy());
    pulse_cross_clock i_ts_snap_mclk3 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_snap_triggered[3]), .out_pulse(ts_snap_triggered_mclk[3]),.busy());

    pulse_cross_clock i_ts_snap_master(.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_master_snap_pclk),  .out_pulse(ts_master_snap),.busy());

///    pulse_cross_clock i_rcv_done_mclk (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(rcv_done), .out_pulse(rcv_done_mclk),.busy());

    pulse_cross_clock i_local_got_pclk0(.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(local_got[0]), .out_pulse(local_got_pclk[0]),.busy());
    pulse_cross_clock i_local_got_pclk1(.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(local_got[1]), .out_pulse(local_got_pclk[1]),.busy());
    pulse_cross_clock i_local_got_pclk2(.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(local_got[2]), .out_pulse(local_got_pclk[2]),.busy());
    pulse_cross_clock i_local_got_pclk3(.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(local_got[3]), .out_pulse(local_got_pclk[3]),.busy());
    
    pulse_cross_clock i_master_got_pclk(.rst(mrst), .src_clk(mclk), .dst_clk(pclk), .in_pulse(master_got),   .out_pulse(master_got_pclk),.busy());

    pulse_cross_clock i_trig_r_mclk0 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(trig_r[0]), .out_pulse(trig_r_mclk[0]),.busy());
    pulse_cross_clock i_trig_r_mclk1 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(trig_r[1]), .out_pulse(trig_r_mclk[1]),.busy());
    pulse_cross_clock i_trig_r_mclk2 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(trig_r[2]), .out_pulse(trig_r_mclk[2]),.busy());
    pulse_cross_clock i_trig_r_mclk3 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(trig_r[3]), .out_pulse(trig_r_mclk[3]),.busy());
    
    pulse_cross_clock i_frsync_pclk0(.rst(!en),    .src_clk(mclk), .dst_clk(pclk), .in_pulse(frame_sync[0]), .out_pulse(frsync_pclk[0]),.busy());
    pulse_cross_clock i_frsync_pclk1(.rst(!en),    .src_clk(mclk), .dst_clk(pclk), .in_pulse(frame_sync[1]), .out_pulse(frsync_pclk[1]),.busy());
    pulse_cross_clock i_frsync_pclk2(.rst(!en),    .src_clk(mclk), .dst_clk(pclk), .in_pulse(frame_sync[2]), .out_pulse(frsync_pclk[2]),.busy());
    pulse_cross_clock i_frsync_pclk3(.rst(!en),    .src_clk(mclk), .dst_clk(pclk), .in_pulse(frame_sync[3]), .out_pulse(frsync_pclk[3]),.busy());
    
    pulse_cross_clock i_ts_stb_mclk0 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_stb_pclk_r[0]), .out_pulse(ts_stb[0]),.busy());
    pulse_cross_clock i_ts_stb_mclk1 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_stb_pclk_r[1]), .out_pulse(ts_stb[1]),.busy());
    pulse_cross_clock i_ts_stb_mclk2 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_stb_pclk_r[2]), .out_pulse(ts_stb[2]),.busy());
    pulse_cross_clock i_ts_stb_mclk3 (.rst(eprst), .src_clk(pclk), .dst_clk(mclk), .in_pulse(ts_stb_pclk_r[3]), .out_pulse(ts_stb[3]),.busy());

    pulse_cross_clock i_suppress_immediate_set_pclk(.rst(!en),    .src_clk(mclk), .dst_clk(pclk), .in_pulse(suppress_immediate_set_mclk), .out_pulse(suppress_immediate_set_pclk),.busy());

    
endmodule

