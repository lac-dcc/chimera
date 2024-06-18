// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>gpio393
 * @file gpio393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief Control of the 10 GPIO signals of the 10393 board
 * Converted from twelve_ios.v of the x353 project (2005)
 *
 * @copyright Copyright (c) 2005-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * gpio393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  gpio393.v is distributed in the hope that it will be useful,
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


// update to eliminate need for a shadow register
// each pair of data bits at write cycle control the data and enable in the following way:
// bit 1 bit 0  dibit  enable data
//   0     0      0    - no change -
//   0     1      1      1      0
//   1     0      2      1      1
//   1     1      3      0      0


//Unified IO control for the 6 pins that are connected from the FPGA to the inter-board 16-pin connector
// those pins were controlled (in models 303, 313, 323 and earlier 333) by the control register, status was
// read through the status register.

// Now each pin will be controlled by 2 bits (data+enable), total 12 bits that will come from one of 4 sources 
// selected by bits [13:12] of the new control word:
// 0 - use bits [11:0] of the control word
// 1 - use channel A (camsync)
// 2 - use channel B (tbd)
// 3 - use channel C (tbd)
// Updating logic
// global enable signals (disabled channel will not compete for per-biot access)
// next 4 enable signals are controlled by bit pairs (0X - don't change, 10 - disable, 11 - enable)
// bit [25:24] - enable software bits (contolled by bits [23:0] (on at powerup)
// bit [27:26] - enable chn. A
// bit [29:28] - enable chn. B
// bit [31:30] - enable chn. C
// Enabled bits will be priority encoded (C - highest, software - lowest)
module  gpio393  #(
        parameter GPIO_ADDR =                 'h700, //TODO: assign valid address
        parameter GPIO_MASK =                 'h7fe,
        parameter GPIO_STATUS_REG_ADDR =      'h30,  // address where status can be read out (10 GPIO inputs)
        
        parameter integer GPIO_DRIVE =        12,
        parameter GPIO_IBUF_LOW_PWR =         "TRUE",
        parameter GPIO_IOSTANDARD =           "DEFAULT", // power is 1.5V
        parameter GPIO_SLEW =                 "SLOW",
        
        parameter GPIO_SET_PINS =              0,  // Set GPIO output state, give control for some bits to other modules 
        parameter GPIO_SET_STATUS =            1,   // set status mode
        parameter GPIO_N =                     10, // number of GPIO bits to control
        parameter GPIO_PORTEN =                24  // bit number to control port enables (up from this) 

     )  (
//    input                         rst,          // global reset
    input                         mclk,         // system clock
    input                         mrst,         // @posedge mclk, sync reset
    input                   [7:0] cmd_ad,       // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,      // strobe (with first byte) for the command a/d
    
    output                  [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,    // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)
    
    inout            [GPIO_N-1:0] ext_pins,     // GPIO pins (1.5V): assigned in 10389: [1:0] - i2c, [5:2] - gpio, [GPIO_N-1:6] - sync i/o
    output           [GPIO_N-1:0] io_pins,      // values on the gpio pins (to use by other modules on ports A,B,C)
    
    input            [GPIO_N-1:0] da,           // port A data
    input            [GPIO_N-1:0] da_en,        // port A data enable

    input            [GPIO_N-1:0] db,           // port A data
    input            [GPIO_N-1:0] db_en,        // port A data enable

    input            [GPIO_N-1:0] dc,           // port A data
    input            [GPIO_N-1:0] dc_en);        // port A data enable
         
    wire   [GPIO_N-1:0] ds;        // "software" data (programmed by lower 24 bits)
    wire   [GPIO_N-1:0] ds_en;     // "software" data enable (programmed by lower 24 bits)
    reg           [3:0] ch_en = 0; // channel enable

    wire         [31:0] cmd_data;
    wire                cmd_a; // just 1 bit
    wire                cmd_we; 

    wire                set_mode_w;
    wire                set_status_w;
    
    wire   [ GPIO_N-1:0] ds_en_m;
    wire   [ GPIO_N-1:0] da_en_m;
    wire   [ GPIO_N-1:0] db_en_m;
    wire   [ GPIO_N-1:0] dc_en_m;
    
    wire   [ GPIO_N-1:0] io_t; // tri-state for the I/Os
    wire   [ GPIO_N-1:0] io_do; // data out for the I/Os

    assign set_mode_w =   cmd_we && (cmd_a == GPIO_SET_PINS);
    assign set_status_w = cmd_we && (cmd_a == GPIO_SET_STATUS);

     
    assign dc_en_m = dc_en & {GPIO_N{ch_en[3]}};
    assign db_en_m = db_en & {GPIO_N{ch_en[2]}} & ~dc_en_m;
    assign da_en_m = da_en & {GPIO_N{ch_en[1]}} & ~dc_en_m & ~db_en_m;
    assign ds_en_m = ds_en & {GPIO_N{ch_en[0]}} & ~dc_en_m & ~db_en_m & ~da_en_m;
    assign io_do = (dc_en_m & dc) |
                   (db_en_m & db) |
                   (da_en_m & da) |
                   (ds_en_m & ds);
    assign io_t = ~(dc_en_m | db_en_m | da_en_m | ds_en_m);
  
//   0     0      0    - no change -
//   0     1      1      1      0
//   1     0      2      1      1
//   1     1      3      0      0

    always @ (posedge mclk) begin
        if (mrst)                                         ch_en[0] <= 0;
        else if (set_mode_w && cmd_data[GPIO_PORTEN + 1]) ch_en[0] <= cmd_data[GPIO_PORTEN + 0]; 

        if (mrst)                                         ch_en[1] <= 0;
        else if (set_mode_w && cmd_data[GPIO_PORTEN + 3]) ch_en[1] <= cmd_data[GPIO_PORTEN + 2]; 

        if (mrst)                                         ch_en[2] <= 0;
        else if (set_mode_w && cmd_data[GPIO_PORTEN + 5]) ch_en[2] <= cmd_data[GPIO_PORTEN + 4]; 

        if (mrst)                                         ch_en[3] <= 0;
        else if (set_mode_w && cmd_data[GPIO_PORTEN + 7]) ch_en[3] <= cmd_data[GPIO_PORTEN + 6]; 

    end
 
    generate
        genvar i;
        for (i=0; i < GPIO_N; i=i+1) begin: gpio_block
            gpio_bit gpio_bit_i (
//                .rst     (rst),                // input
                .clk     (mclk),               // input
                .srst    (mrst),               // input
                .we      (set_mode_w),         // input
                .d_in    (cmd_data[2*i +: 2]), // input[1:0] 
                .d_out   (ds[i]),              // output
                .en_out  (ds_en[i])            // output
            );
            iobuf #(
                .DRIVE        (GPIO_DRIVE),
                .IBUF_LOW_PWR (GPIO_IBUF_LOW_PWR),
                .IOSTANDARD   (GPIO_IOSTANDARD),
                .SLEW         (GPIO_SLEW)
            ) iobuf_gpio_i (
                .O     (io_pins[i]),  // output
                .IO    (ext_pins[i]), // inout
                .I     (io_do[i]),    // input
                .T     (io_t[i])      // input
            );
        
        end
        
    endgenerate
    
    cmd_deser #(
        .ADDR       (GPIO_ADDR),
        .ADDR_MASK  (GPIO_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (1),
        .DATA_WIDTH (32)
    ) cmd_deser_32bit_i (
        .rst        (1'b0),     //rst),      // input
        .clk        (mclk),     // input
        .srst       (mrst),     // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[0:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );
 
    status_generate #(
        .STATUS_REG_ADDR     (GPIO_STATUS_REG_ADDR),
        .PAYLOAD_BITS        (12),
        .REGISTER_STATUS     (1)
    ) status_generate_i (
        .rst           (1'b0),           // rst), // input
        .clk           (mclk),           // input
        .srst          (mrst),           // input
        .we            (set_status_w),   // input
        .wd            (cmd_data[7:0]),  // input[7:0] 
        .status        ({io_pins,2'b0}), // input[11:0] 
        .ad            (status_ad),      // output[7:0] 
        .rq            (status_rq),      // output
        .start         (status_start)    // input
    );
    
    
endmodule

module gpio_bit (
//    input         rst,          // global reset
    input         clk,          // system clock
    input         srst,         // @posedge clk - sync reset
    input         we,
    input   [1:0] d_in,         // input bits
    output        d_out,        // output data
    output        en_out);      // enable output
    
    reg d_r = 0;
    reg en_r = 0;
    
    assign d_out = d_r;
    assign en_out = en_r;
    always @ (posedge clk) begin
        if (srst)               d_r <= 0;
        else if (we && (|d_in)) d_r <= !d_in[0];

        if (srst)               en_r <= 0;
        else if (we && (|d_in)) en_r <= !(&d_in);
    end 
    
endmodule
