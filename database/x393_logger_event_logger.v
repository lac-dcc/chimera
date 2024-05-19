// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>event_logger
 * @file event_logger.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief top module of the event logger (ported from imu_logger)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * event_logger.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  event_logger.v is distributed in the hope that it will be useful,
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

module  event_logger#(
    parameter LOGGER_ADDR =                    'h720, //..'h721
    parameter LOGGER_STATUS =                  'h722, // .. 'h722
    parameter LOGGER_STATUS_REG_ADDR =         'h39, // just 1 location)
    parameter LOGGER_MASK =                    'h7fe,
    parameter LOGGER_STATUS_MASK =             'h7ff,
//First 4 registers are not used (it is when time stamps are sent)
    parameter LOGGER_PAGE_IMU =                 0, // 'h04..'h1f - overlaps with period/duration/halfperiod/config? (was so in x353)
    parameter LOGGER_PAGE_GPS =                 1, // 'h20..'h3f
    parameter LOGGER_PAGE_MSG =                 2, // 'h40..'h5f
    
    parameter LOGGER_PERIOD =                   0,
    parameter LOGGER_BIT_DURATION =             1,
    parameter LOGGER_BIT_HALF_PERIOD =          2, //rs232 half bit period
    parameter LOGGER_CONFIG =                   3,

    parameter LOGGER_CONF_IMU =                 2,
    parameter LOGGER_CONF_IMU_BITS =            2,
    parameter LOGGER_CONF_GPS =                 7,
    parameter LOGGER_CONF_GPS_BITS =            4,
    parameter LOGGER_CONF_MSG =                13,
    parameter LOGGER_CONF_MSG_BITS =            5,
    parameter LOGGER_CONF_SYN =                18, // 15,
    parameter LOGGER_CONF_SYN_BITS =            4, // 1,
    parameter LOGGER_CONF_EN =                 20, // 17,
    parameter LOGGER_CONF_EN_BITS =             1,
    parameter LOGGER_CONF_DBG =                25, // 22,
    parameter LOGGER_CONF_DBG_BITS =            4,

    parameter GPIO_N =                     10 // number of GPIO bits to control
)(
//    input                         rst,
    input                         mclk,        // system clock
    input                         xclk,        // was in 353: half frequency (80 MHz nominal)
    input                         mrst,        // @ posedge mclk - sync reset
    input                         xrst,        // @ posedge xclk - sync reset
    // programming interface
    input                   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,     // strobe (with first byte) for the command a/d
    output                  [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,    // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)

    output                        ts_local_snap, // @posedge xclk request to take a local time snapshot
    input                         ts_local_stb,  // @posedge xclk one clock pulse before receiving a local TS data
    input                   [7:0] ts_local_data, // @posedge xclk local timestamp data (s0,s1,s2,s3,u0,u1,u2,u3==0)

    input            [GPIO_N-1:0] ext_di,
    output           [GPIO_N-1:0] ext_do,
    output           [GPIO_N-1:0] ext_en,
    

    // byte-parallel timestamps from 4 sensors channels (in triggered mode all are the same, different only in free running mode)
    // each may generate logger event, channel number encoded in bits 25:24 of the external microseconds
    input                   [3:0] sof_mclk,     // start of frame (per-channel) to filter out non-first timestamps
    
    input                         ts_stb_chn0,  // @mclk 1 clock before ts_rcv_data is valid
    input                   [7:0] ts_data_chn0, // @mclk byte-wide serialized timestamp message received or local

    input                         ts_stb_chn1,  // @mclk 1 clock before ts_rcv_data is valid
    input                   [7:0] ts_data_chn1, // @mclk byte-wide serialized timestamp message received or local

    input                         ts_stb_chn2,  // @mclk 1 clock before ts_rcv_data is valid
    input                   [7:0] ts_data_chn2, // @mclk byte-wide serialized timestamp message received or local

    input                         ts_stb_chn3,  // @mclk 1 clock before ts_rcv_data is valid
    input                   [7:0] ts_data_chn3, // @mclk byte-wide serialized timestamp message received or local
    
    
// TODO: Convert to 32-bit?    
    output                 [15:0] data_out,    // 16-bit data out to DMA1 (@posdge mclk)
    output                        data_out_stb,// data out valid (@posedge mclk)
//                       sample_counter, // could be DMA latency, safe to use sample_counter-1
    output                 [31:0] debug_state);
                       

    wire   [23:0] sample_counter; // TODO: read with status! could be DMA latency, safe to use sample_counter-1


    wire         ser_di;      // gps serial data in
    wire         gps_pulse1sec;
    wire         mosi;  // to IMU, bit 2 in J9
    wire         miso;  // from IMU, bit 3 on J9 
    wire         sda, sda_en, scl, scl_en;

    reg    [6:0] ctrl_addr=7'h0; // 0 - period, 1 - reserved, 2..31 - registers to log, >32 - gps parameters, >64 - odometer message
    reg          we_d = 0; // only if wa was 0
    reg          we_imu = 0;
    reg          we_gps = 0;
    reg          we_period = 0;
    reg          we_bit_duration = 0;
    reg          we_message = 0;
    reg          we_config_imu = 0; // bits 1:0, 2 - enable slot[1:0]
    reg          we_config_gps = 0; // bits 6:3, 7 - enable - {ext,invert, slot[1:0]} slot==0 - disable
    reg          we_config_msg = 0; // bits 12:8,13 - enable - {invert,extinp[3:0]} extinp[3:0]=='hf' - disable
    reg          we_config_syn = 0; // bit  14,  15 - enable  - enable logging external timestamps
    reg          we_config_rst = 0; // bit  14,  15 - enable  - reset
    reg          we_config_debug = 0; // bit  14,  15 - enable  - debug bits set
    reg          we_bitHalfPeriod = 0;


    reg    [1:0] config_imu;
    reg    [3:0] config_gps;
    reg    [4:0] config_msg;
    reg          config_rst;
    reg    [3:0] config_debug;
    reg   [15:0] bitHalfPeriod;//  serial gps speed - number of xclk pulses in half bit period


    wire         we_config_imu_xclk; // copy config_imu_mclk (@mclk) to config_imu (@xclk)
    wire         we_config_gps_xclk;
    wire         we_config_msg_xclk;
    wire         we_config_rst_xclk;
    wire         we_config_debug_xclk;
    wire         we_bitHalfPeriod_xclk;



    reg    [1:0] config_imu_mclk;
    reg    [3:0] config_gps_mclk;
    reg    [4:0] config_msg_mclk;
    reg    [3:0] config_syn_mclk;
    reg          config_rst_mclk = 0;
    reg    [3:0] config_debug_mclk;
    reg   [15:0] bitHalfPeriod_mclk;

    reg          enable_gps;
    reg          enable_msg;
    wire    [3:0] enable_syn_mclk;

    reg          enable_timestamps;
    wire         message_trig;

    wire         gps_ts_stb, ser_do,ser_do_stb;
    wire  [15:0] imu_data;
    wire  [15:0] nmea_data;
    wire  [15:0] extts_data;
    wire  [15:0] msg_data;

    wire  [15:0] timestamps_rdata; // multiplexed timestamp data

    reg    [2:0] gps_pulse1sec_d;
    reg    [1:0] gps_pulse1sec_denoise;
    reg    [7:0] gps_pulse1sec_denoise_count;
    reg          gps_pulse1sec_single;

    wire   [3:0] timestamp_request; // 0 - imu, 1 - gps, 2 - ext, 3 - msg
    wire   [3:0] timestamp_ackn;

    wire   [3:0] timestamp_request_long; //from sub-module ts request until reset by arbiter, to allow  timestamp_ackn
    wire   [3:0] channel_ready;  // 0 - imu, 1 - gps, 2 - ext, 3 - msg
    wire   [3:0] channel_next;   // 0 - imu, 1 - gps, 2 - ext, 3 - msg
    wire   [1:0] channel;        // currently logged channel number
    wire   [1:0] timestamp_sel;  // selected word in timestamp (0..3)
    wire         ts_en;          // log timestamp (when false - data)
    wire         mux_data_valid; // data valid from multiplexer (to xclk->mclk converter fifo)
    reg   [15:0] mux_data_source;// data multiplexed from 1 of the 4 channels
    reg          mux_rdy_source; // data ready multiplexed from 1of the 4 channels (to fill rest with zeros)
    reg   [15:0] mux_data_final; // data multiplexed between timestamps and channel data (or 0 if ~ready)

    wire         rs232_wait_pause;// may be used as reset for decoder
    wire         rs232_start;          // serial character start (single pulse)
    wire         nmea_sent_start;          // serial character start (single pulse)
    
 // reg  [1:0]  debug_reg;
    reg    [7:0] dbg_cntr;
    wire         pre_message_trig;
    wire  [15:0] ext_di16 ={{(16-GPIO_N){1'b0}},ext_di};
   
    wire         cmd_a; // single bit 
    wire  [31:0] cmd_data; 
    reg   [31:0] cmd_data_r; // valid next after cmd_we; 
    wire         cmd_we;
    wire         cmd_status;
    
    reg    [3:0] timestamps_en;  // enable timestamp to go through (first after sof)

    assign ext_en = {{(GPIO_N-5){1'b0}},
                   (config_imu[1:0]==2'h2)?1'b1:1'b0,
                   1'b0,
                   (config_imu[1:0]==2'h1)?1'b1:1'b0,
                   (config_imu[1:0]!=2'h0)?{sda_en,scl_en}:2'h0};
                   
    assign ext_do= {{(GPIO_N-5){1'b0}},
                   (config_imu[1:0]==2'h2)?mosi:1'b0,
                   1'b0,
                   (config_imu[1:0]==2'h1)?mosi:1'b0,
                   (config_imu[1:0]!=2'h0)?{sda,scl}:2'h0};

    assign miso=         config_imu[1]?
                              (config_imu[0]?1'b0 :ext_di[5]):
                              (config_imu[0]?ext_di[3]:1'b0);
    assign ser_di=       config_gps[1]?
                              (config_gps[0]?1'b0 :ext_di[4]):
                              (config_gps[0]?ext_di[2]:1'b0);
                              
    assign gps_pulse1sec=config_gps[2]^(config_gps[1]?
                                      (config_gps[0]?1'b0 :ext_di[5]):
                                      (config_gps[0]?ext_di[3]:1'b0));

    assign pre_message_trig = ext_di16[config_msg[3:0]];

    assign message_trig= config_msg[4] ^ pre_message_trig;

    assign timestamp_request[1]=config_gps[3]? (config_gps[2]?nmea_sent_start:gps_ts_stb):gps_pulse1sec_single;
 
    always @ (posedge mclk) begin
        timestamps_en <= enable_syn_mclk & (sof_mclk | (timestamps_en & ~{ts_stb_chn3, ts_stb_chn2,ts_stb_chn1, ts_stb_chn0}));
    end

// filter gps_pulse1sec
    always @ (posedge xclk) begin
        if  (config_rst) gps_pulse1sec_d[2:0] <= 3'h0;
        else      gps_pulse1sec_d[2:0] <= {gps_pulse1sec_d[1:0], gps_pulse1sec};
        
        if      (config_rst)                      gps_pulse1sec_denoise[0] <= 1'b0;
        else if (gps_pulse1sec_denoise_count[7:0]==8'h0) gps_pulse1sec_denoise[0] <= gps_pulse1sec_d[2];
        
        if (gps_pulse1sec_d[2]==gps_pulse1sec_denoise[0]) gps_pulse1sec_denoise_count[7:0] <= 8'hff;
        else                            gps_pulse1sec_denoise_count[7:0] <= gps_pulse1sec_denoise_count[7:0] - 1;
        
        gps_pulse1sec_denoise[1] <= gps_pulse1sec_denoise[0];
        gps_pulse1sec_single <= !gps_pulse1sec_denoise[1] && gps_pulse1sec_denoise[0];
    end

//    always @ (posedge mclk or posedge mrst) begin // was negedge
    always @ (posedge mclk) begin // was negedge
        we_d            <= !mrst && cmd_we && !cmd_a;
        we_imu          <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_IMU);
        we_gps          <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_GPS);
        we_message      <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_MSG);
        we_period       <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_PERIOD);
        we_bit_duration <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_BIT_DURATION);
        we_bitHalfPeriod<= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_BIT_HALF_PERIOD);
        we_config_imu   <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_IMU];
        we_config_gps   <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_GPS];
        we_config_msg   <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_MSG];
        we_config_syn   <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_SYN];
        we_config_rst   <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_EN];
        we_config_debug <= !mrst && cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_DBG];
    end
    always @ (posedge mclk) begin // was negedge
        if (cmd_we)  cmd_data_r <= cmd_data; // valid next after cmd_we;
        /* 
        we_d            <= cmd_we && !cmd_a;
        we_imu          <= cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_IMU);
        we_gps          <= cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_GPS);
        we_message      <= cmd_we && !cmd_a && (ctrl_addr[6:5] == LOGGER_PAGE_MSG);
        we_period       <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_PERIOD);
        we_bit_duration <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_BIT_DURATION);
        we_bitHalfPeriod<= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_BIT_HALF_PERIOD);
        we_config_imu   <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_IMU];
        we_config_gps   <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_GPS];
        we_config_msg   <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_MSG];
        we_config_syn   <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_SYN];
        we_config_rst   <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_EN];
        we_config_debug <= cmd_we && !cmd_a && (ctrl_addr[6:0] == LOGGER_CONFIG) && cmd_data[LOGGER_CONF_DBG];
        */
    
        if (we_config_imu)   config_imu_mclk[1:0] <=   cmd_data_r[LOGGER_CONF_IMU - 1 -: LOGGER_CONF_IMU_BITS]; // bits 1:0, 2 - enable slot[1:0]
        if (we_config_gps)   config_gps_mclk[3:0] <=   cmd_data_r[LOGGER_CONF_GPS - 1 -: LOGGER_CONF_GPS_BITS]; // bits 6:3, 7 - enable - {ext,inver, slot[1:0]} slot==0 - disable
        if (we_config_msg)   config_msg_mclk[4:0] <=   cmd_data_r[LOGGER_CONF_MSG - 1 -: LOGGER_CONF_MSG_BITS]; // bits 12:8,13 - enable - {invert,extinp[3:0]} extinp[3:0]=='hf' - disable
        if (we_config_syn)   config_syn_mclk      <=   cmd_data_r[LOGGER_CONF_SYN - 1 -: LOGGER_CONF_SYN_BITS]; // bit  14,  15 - enable
        if (we_config_rst)   config_rst_mclk <=        cmd_data_r[LOGGER_CONF_EN -1   -: LOGGER_CONF_EN_BITS]; // bit  16,  17 - enable
        if (we_config_debug) config_debug_mclk[3:0] <= cmd_data_r[LOGGER_CONF_DBG - 1 -: LOGGER_CONF_DBG_BITS]; // bit  21:18,  22 - enable
        
        if (we_bitHalfPeriod)            bitHalfPeriod_mclk[15:0] <= cmd_data_r[15:0];
    
        if      (cmd_we && cmd_a) ctrl_addr[6:5] <= cmd_data[6:5];
        if      (cmd_we && cmd_a) ctrl_addr[4:0] <= cmd_data[4:0];
        else if (we_d &&  (ctrl_addr[4:0]!=5'h1f)) ctrl_addr[4:0] <=ctrl_addr[4:0]+1; // no roll over, 
    end

    assign enable_syn_mclk= config_rst_mclk? 4'b0 : config_syn_mclk;
    always @ (posedge xclk) begin
        if (we_bitHalfPeriod_xclk) bitHalfPeriod[15:0] <= bitHalfPeriod_mclk[15:0];
        if (we_config_imu_xclk)    config_imu <=          config_imu_mclk;
        if (we_config_gps_xclk)    config_gps <=          config_gps_mclk;
        if (we_config_msg_xclk)    config_msg <=          config_msg_mclk;
        if (we_config_rst_xclk)    config_rst <=          config_rst_mclk;
        if (we_config_debug_xclk)  config_debug <=        config_debug_mclk;
        enable_gps         <= (^config_gps[1:0]) && !config_rst;  // both 00 and 11 - disable
        enable_msg         <= (config_gps[3:0] != 4'hf) && !config_rst;
        enable_timestamps  <= !config_rst;
    end

    always @ (posedge xclk) begin
        mux_data_source[15:0] <= channel[1]?
                                 (channel[0]?msg_data[15:0]:extts_data[15:0]):
                                 (channel[0]?nmea_data[15:0]:imu_data[15:0]);
        mux_rdy_source        <= channel[1]?
                                 (channel[0]?channel_ready[3]:channel_ready[2]):
                                 (channel[0]?channel_ready[1]:channel_ready[0]);
        mux_data_final[15:0]  <= ts_en?
                                 timestamps_rdata[15:0]:
                                (mux_rdy_source?
                                         mux_data_source[15:0]:
                                         16'h0); // replace 16'h0 with some pattern to debug output
    end

// generate strobes to copy configuration data from mclk to xclk domain    
    pulse_cross_clock i_we_config_imu_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_config_imu), .out_pulse(we_config_imu_xclk),.busy());
    pulse_cross_clock i_we_config_gps_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_config_gps), .out_pulse(we_config_gps_xclk),.busy());
    pulse_cross_clock i_we_config_msg_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_config_msg), .out_pulse(we_config_msg_xclk),.busy());
    pulse_cross_clock i_we_config_rst_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_config_rst), .out_pulse(we_config_rst_xclk),.busy());
    pulse_cross_clock i_we_config_debug_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_config_debug), .out_pulse(we_config_debug_xclk),.busy());
    pulse_cross_clock i_we_bitHalfPeriod_xclk (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(we_bitHalfPeriod), .out_pulse(we_bitHalfPeriod_xclk),.busy());

    cmd_deser #(
        .ADDR       (LOGGER_ADDR),
        .ADDR_MASK  (LOGGER_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (1),
        .DATA_WIDTH (32),
        .ADDR1      (LOGGER_STATUS),
        .ADDR_MASK1 (LOGGER_STATUS_MASK)
        
    ) cmd_deser_32bit_i (
        .rst        (1'b0),         //rst),         // input
        .clk        (mclk),        // input
        .srst       (mrst),        // input
        .ad         (cmd_ad),      // input[7:0] 
        .stb        (cmd_stb),     // input
        .addr       (cmd_a),       // output[3:0] 
        .data       (cmd_data),    // output[31:0] 
        .we         ({cmd_status,cmd_we})       // output
    );

    status_generate #(
        .STATUS_REG_ADDR     (LOGGER_STATUS_REG_ADDR),
        .PAYLOAD_BITS        (26),
        .REGISTER_STATUS     (1)
    ) status_generate_i (
        .rst           (1'b0),                  //  rst),                   // input
        .clk           (mclk),                  // input
        .srst          (mrst),                  // input
        .we            (cmd_status),            // input
        .wd            (cmd_data[7:0]),         // input[7:0] 
        .status        ({sample_counter,2'b0}), // input[25:0] // 2 LSBs - may add "real" status 
        .ad            (status_ad),             // output[7:0] 
        .rq            (status_rq),             // output
        .start         (status_start)           // input
    );

    imu_spi393 i_imu_spi (
//                    .rst(rst),
                        .mclk             (mclk),                 // system clock, negedge
                        .xclk             (xclk),                 // half frequency (80 MHz nominal)
                        .we_ra            (we_imu),               // write enable for registers to log (@negedge mclk)
                        .we_div           (we_bit_duration),      // write enable for clock dividing(@negedge mclk)
                        .we_period        (we_period),            // write enable for IMU cycle period(@negedge mclk) 0 - disable, 1 - single, >1 - half bit periods
                        .wa               (ctrl_addr[4:0]),       // write address for register (5 bits, @negedge mclk)
                        .din              (cmd_data_r[31:0]),     // 16?-bit data in  (di, not di_d)
                        .mosi             (mosi),                 // to IMU, bit 2 in J9
                        .miso             (miso),                 // from IMU, bit 3 on J9 
                        .config_debug     (config_debug[3:0]),
                        .sda              (sda),                  // sda, shared with i2c, bit 1
                        .sda_en           (sda_en),               // enable sda output (when sda==0 and 1 cycle after sda 0->1)
                        .scl              (scl),                  // scl, shared with i2c, bit 0
                        .scl_en           (scl_en),               // enable scl output (when scl==0 and 1 cycle after sda 0->1)
                        .ts               (timestamp_request[0]), // timestamop request
                        .rdy              (channel_ready[0]),     // data ready
                        .rd_stb           (channel_next[0]),      // data read strobe (increment address)
                        .rdata            (imu_data[15:0]));      // data out (16 bits)
/*
logs events from odometer (can be software triggered), includes 56-byte message written to the buffer
So it is possible to assert trig input (will request timestamp), write message by software, then
de-assert the trig input - message with the timestamp will be logged
fixed-length de-noise circuitry with latency 256*T(xclk) (~3usec)
*/
    imu_message393 i_imu_message(
                        .mclk             (mclk),                // system clock, negedge
                        .xclk             (xclk),                // half frequency (80 MHz nominal)
                        .we               (we_message),          // write enable for registers to log (@negedge sclk), with lower data half
                        .wa               (ctrl_addr[3:0]),      // write address for register (4 bits, @negedge sclk)
                        .din              (cmd_data_r[31:0]),    // 16-bit data in  multiplexed 
                        .en               (enable_msg),          // enable module operation, if 0 - reset
                        .trig             (message_trig),        // leading edge - sample time, trailing set rdy
                        .ts               (timestamp_request[3]),// timestamop request
                        .rdy              (channel_ready[3]),    // data ready
                        .rd_stb           (channel_next[3]),     // data read strobe (increment address)
                        .rdata            (msg_data[15:0]));     // data out (16 bits)
/* logs frame synchronization data from other camera (same as frame sync) */
// ts_stb (mclk) -> trig)
    imu_exttime393 i_imu_exttime(
//                        .rst              (rst),                           // input global reset
                        .mclk             (mclk),                            // system clock, negedge
                        .xclk             (xclk),                            // half frequency (80 MHz nominal)
                        .mrst             (mrst),                            // @mclk - sync reset
                        .xrst             (xrst),                            // @xclk - sync reset
                        .en_chn_mclk      (enable_syn_mclk),                 // input[3:0] enable module operation, if 0 - reset
                        .ts_stb_chn0      (ts_stb_chn0 && timestamps_en[0]), // input
                        .ts_data_chn0     (ts_data_chn0),                    // input[7:0] 
                        .ts_stb_chn1      (ts_stb_chn1 && timestamps_en[1]), // input
                        .ts_data_chn1     (ts_data_chn1),                    // input[7:0] 
                        .ts_stb_chn2      (ts_stb_chn2 && timestamps_en[2]), // input
                        .ts_data_chn2     (ts_data_chn2),                    // input[7:0] 
                        .ts_stb_chn3      (ts_stb_chn3 && timestamps_en[3]), // input
                        .ts_data_chn3     (ts_data_chn3),                    // input[7:0] 
                        .ts               (timestamp_request[2]),            // timestamop request
                        .rdy              (channel_ready[2]),                // data ready
                        .rd_stb           (channel_next[2]),                 // data read strobe (increment address)
                        .rdata            (extts_data[15:0]));               // data out (16 bits)

    imu_timestamps393 i_imu_timestamps (
                        .xclk             (xclk),                              // 80 MHz, posedge
                        .rst              (!enable_timestamps),                // reset (@posedge xclk)
                        .ts_snap          (ts_local_snap),                     // output (@posedge xclk) - get local TS snapshot
                        .ts_stb           (ts_local_stb),                      // input (@posedge xclk) - 1 xclk before local ts data
                        .ts_data          (ts_local_data),                     // input[7:0] (@posedge xclk) - local TS data
                        .ts_rq            (timestamp_request_long[3:0]),       // input[3:0] requests to create timestamps (4 channels), @posedge xclk
                        .ts_ackn          (timestamp_ackn[3:0]),               // output[3:0] timestamp for this channel is stored
                        .ra               ({channel[1:0],timestamp_sel[1:0]}), // input[3:0]read address (2 MSBs - channel number, 2 LSBs - usec_low, (usec_high ORed with channel <<24), sec_low, sec_high
                        .dout             (timestamps_rdata[15:0]));           // output[15:0] output data
                        
    wire debug_unused_a;   // SuppressThisWarning Veditor (unused)                     
    rs232_rcv393 i_rs232_rcv (
                        .xclk             (xclk),                  // half frequency (80 MHz nominal)
                        .bitHalfPeriod    (bitHalfPeriod[15:0]),   // half of the serial bit duration, in xclk cycles
                        .ser_di           (ser_di),                // rs232 (ttl) serial data in
                        .ser_rst          (!enable_gps),           // reset (force re-sync)
                        .ts_stb           (gps_ts_stb),            // strobe timestamp (start of message) (reset bit counters in nmea decoder)
                        .wait_just_pause  (rs232_wait_pause),      // may be used as reset for decoder
                        .start            (rs232_start),           // serial character start (single pulse)
                        .ser_do           (ser_do),                // serial data out(@posedge xclk) LSB first!
                        .ser_do_stb       (ser_do_stb),            // output data strobe (@posedge xclk), first cycle after ser_do becomes valid
                        .debug            ({debug_unused_a, debug_state[15:12]}),
                        .bit_dur_cntr     (debug_state[31:16]),
                        .bit_cntr         (debug_state[11:7])
                        );
    assign debug_state[6:0] = dbg_cntr [6:0];

    always @ (posedge xclk) begin
        if (!enable_gps) dbg_cntr[7:0] <= 8'h0;
        else if (rs232_start) dbg_cntr[7:0] <= dbg_cntr[7:0]+1;
    end
    
    nmea_decoder393 i_nmea_decoder (
                        .mclk             (mclk),             // system clock, @posedge
                        .xclk             (xclk),             // 80MHz, posedge
                        .we               (we_gps),           // registers write enable
                        .wa               (ctrl_addr[4:0]),   // registers write address
                        .wd               (cmd_data_r[7:0]),  // write data
                        .start            (gps_ts_stb),       // start of the serial message
                        .rs232_wait_pause (rs232_wait_pause), // may be used as reset for decoder
                        .start_char       (rs232_start),      // serial character start (single pulse)
                        .nmea_sent_start  (nmea_sent_start),  // serial character start (single pulse)
                        .ser_di           (ser_do),           // serial data in (LSB first)
                        .ser_stb          (ser_do_stb),       // serial data strobe, single-cycle, first cycle after ser_di valid
                        .rdy              (channel_ready[1]), // encoded nmea data ready
                        .rd_stb           (channel_next[1]),  // encoded nmea data read strobe (increment address)
                        .rdata            (nmea_data[15:0]),  // encoded data (16 bits)
                        .ser_rst          (!enable_gps),      // reset (now only debug register)
                        .debug()
                        );
                             
// Logger handshakes timestamps through request/grant, so it is OK to make slow serial communication with RTC)
    logger_arbiter393 i_logger_arbiter(
                        .xclk             (xclk),                       // 80 MHz, posedge
                        .rst              (config_rst),                 // module reset
                        .ts_rq_in         (timestamp_request[3:0]),     // in requests for timestamp (single-cycle - just leading edge )
                        .ts_rq            (timestamp_request_long[3:0]),// out request for timestamp, to timestmp module
                        .ts_grant         (timestamp_ackn[3:0]),        // granted ts requests from timestamping module
                        .rdy              (channel_ready[3:0]),         // channels ready (leading edge - became ready, trailing - no more data, use zero)
                        .nxt              (channel_next[3:0]),          // pulses to modules to output next word
                        .channel          (channel[1:0]),               // decoded channel number (2 bits)
                        .ts_sel           (timestamp_sel[1:0]),         // select timestamp word to be output (0..3)
                        .ts_en            (ts_en),                      // 1 - use timestamp, 0 - channel data (or 16'h0 if !ready)
                        .dv               (mux_data_valid),             // output data valid (from registered mux - 2 stage - first selects data and ready, second ts/data/zero)
                        .sample_counter   (sample_counter));            // number of 64-byte samples logged

    buf_xclk_mclk16_393 i_buf_xclk_mclk16(
                        .mclk             (mclk),                  // posedge
                        .xclk             (xclk),                  // posedge
                        .rst              (config_rst),            // @posedge xclk
                        .din              (mux_data_final[15:0]),
                        .din_stb          (mux_data_valid),
                        .dout             (data_out[15:0]),
                        .dout_stb         (data_out_stb));

endmodule

