// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensor_i2c_scl_sda
 * @file sensor_i2c_scl_sda.v
 * @date 2015-10-06  
 * @author Andrey Filippov     
 *
 * @brief Generation of i2c signals
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sensor_i2c_scl_sda.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensor_i2c_scl_sda.v is distributed in the hope that it will be useful,
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

module  sensor_i2c_scl_sda#
(parameter I2C_REDUCE_SPEED_BITS = 1 // reduce i2c speed , 0: min = 200kHz, 1: 100kHz
)(
    input         mrst,           // @ posedge mclk
    input         mclk,           // global clock
    input         i2c_rst,
    input  [ 7:0] i2c_dly,        // bit duration-1 (>=2?), 1 unit - 4 mclk periods
    input         active_sda,     // active pull SDA 
    input         early_release_0,// release SDA immediately after end of SCL if next bit is 1 (for ACKN). Data hold time by slow 0->1 
    input         snd_start,
    input         snd_stop,
    input         snd9,
    input         rcv,         // receive mode (valid with snd9) - master receives, slave - sends
    input  [ 8:0] din,
    output reg [ 8:0] dout,        //
    output reg    dout_stb,    // dout contains valid data
    output reg    scl,         // i2c SCL signal
    input         sda_in,      // i2c SDA signal form I/O pad           
    output reg    sda,         // i2c SDA signal
    output reg    sda_en,      // drive SDA when SDA=0 and during second half of SCL = 0 interval (also during stop) 
    output        ready,       // ready to accept commands
    output reg    bus_busy,    // i2c bus busy (1 cycle behind !ready)
    output        is_open      // i2c channel is open (started, no stop yet)
);
    wire         rst = mrst || i2c_rst;
    reg          is_open_r;
    reg    [8:0] sr;
    reg  [I2C_REDUCE_SPEED_BITS + 7:0] dly_cntr;
    wire [I2C_REDUCE_SPEED_BITS + 8:0] dly_cntr_w = {i2c_dly,{I2C_REDUCE_SPEED_BITS+1{1'b0}}}; // to handle 0-lengths
    
    reg          busy_r;
    wire         snd_start_w =  snd_start && ready; //!busy_r;
    wire         snd_stop_w =   snd_stop && ready; // !busy_r;
    wire         snd9_w =       snd9 && ready; //!busy_r;
    wire         start_w =      (snd_start || snd_stop || snd9_w) && ready; //!busy_r;
    reg          pre_dly_over;
    reg          dly_over;
//    reg          dly_over_d;
    reg    [3:0] seq_start_restart;
    reg    [2:0] seq_stop;
    reg    [3:0] seq_bit;
    reg    [3:0] bits_left;
    reg          done_r;
    reg          sda_r;
    reg          first_cyc; // first clock cycle for the delay interval - update SCL/SDA outputs
    reg          active_sda_r; // registered @ snd9, disable in rcv mode
    reg          active_sda_was_0; // only use active SDA if previous bit was 0 or it is receive mode
    reg          early_release_r;  // to enable it only for LSB before ACKN during send
    reg          rcv_r;
    wire         busy_w = busy_r && ! done_r;
//    wire         pre_dout_stb = dly_over && seq_bit[0] && (bits_left == 0); 
//    assign ready = !busy_r;
    assign ready = !busy_w;
    
    assign is_open =  is_open_r;
//    assign dout =     sr;
    always @ (posedge mclk) begin
        active_sda_was_0 <= !sda || rcv_r;
        if (snd9_w) rcv_r <= rcv;
        
        early_release_r <= early_release_0 && !rcv_r && (bits_left == 1); // only before ACN during master send

        // disable active_sda in send messages for the last (ACKN) bit, for the receive - all but ACKN
        if      (snd9_w)                    active_sda_r <= active_sda && !rcv;
        else if (snd_start_w || snd_stop_w) active_sda_r <= active_sda;
        else if (dly_over && seq_bit[0])    active_sda_r <= active_sda && ((bits_left != 1) ^ rcv_r);
//active_sda_r && !sda    
        if      (rst)         seq_start_restart <= 0;
        else if (snd_start_w) seq_start_restart <= (is_open_r && !seq_stop[0]) ? 4'h8 : 4'h4;
        else if (dly_over)    seq_start_restart <= {1'b0,seq_start_restart[3:1]};
    
        if      (rst)         seq_stop <= 0;
        else if (snd_stop_w)  seq_stop <= 3'h4;
        else if (dly_over)    seq_stop <= {1'b0,seq_stop[2:1]};

        if      (rst)                                                    seq_bit <= 0;
        else if (snd9_w || (seq_bit[0] && (bits_left != 0) && dly_over)) seq_bit <= 4'h8;
        else if (dly_over)                                               seq_bit <= {1'b0,seq_bit[3:1]};
        
        if      (rst)                                             bits_left <= 4'h0;
        else if (snd9_w)                                          bits_left <= 4'h8;
        else if (dly_over && seq_bit[0] && (|bits_left))          bits_left <= bits_left - 1;


        if      (rst)     busy_r <= 0;
        else if (start_w) busy_r <= 1;
        else if (done_r)  busy_r <= 0;
        
//        pre_dly_over <=  (dly_cntr == 3);
        pre_dly_over <=  (dly_cntr == 2);
        
        dly_over <=      pre_dly_over;
//        dly_over_d <=    dly_over;
        if      (rst)     done_r <= 0;
        else              done_r <= pre_dly_over &&
                                   (bits_left == 0) &&
                                   (seq_start_restart[3:1] == 0) &&
                                   (seq_stop[2:1] == 0) &&
                                   (seq_bit[3:1] == 0);
                                   
//        if (!busy_r || dly_over_d) dly_cntr <= i2c_dly;
//        else                       dly_cntr <= dly_cntr - 1;
        
//        if (!busy_w || dly_over) dly_cntr <= i2c_dly << I2C_REDUCE_SPEED_BITS;
        if (!busy_w || dly_over) dly_cntr <= dly_cntr_w[I2C_REDUCE_SPEED_BITS+8 :1]; // top 8 bits
        //
        else                     dly_cntr <= dly_cntr - 1;
        
        if (dly_over && seq_bit[1]) sda_r <= sda_in; // just before the end of SCL pulse - delay it by a few clocks to match external latencies?
        
        if      (snd9_w)                 sr <= din;
        else if (dly_over && seq_bit[0]) sr <= {sr[7:0], sda_r};
        
        dout_stb <= dly_over && seq_bit[0] && (bits_left == 0) && rcv_r;
//        dout_stb <= pre_dout_stb;
//        if (pre_dout_stb) dout <= {sr[7:0],sda_r};
        if (done_r) dout <= {sr[7:0],sda_r};
        
        if      (rst)                              is_open_r <= 0;
        else if (dly_over && seq_start_restart[0]) is_open_r <= 1;                       
        else if (dly_over && seq_stop[0])          is_open_r <= 0;
        
        first_cyc <= start_w || dly_over;

        if      (rst)        scl <= 1;
//        else if (first_cyc)  scl <= !busy_r || // Wrong whe "open"?
        else if (first_cyc)  scl <= (scl && !busy_w) || // Wrong whe "open"?
                                     seq_start_restart[2] ||  seq_start_restart[1] ||
                                     seq_stop[1] || seq_stop[0] ||
                                     seq_bit[2] || seq_bit[1];
                                                       
        if      (rst)        sda <= 1;
//        else if (first_cyc)  sda <= !busy_r ||
        else if (first_cyc)  sda <= (sda && !busy_w) ||
                                     seq_start_restart[3] ||  seq_start_restart[2] ||
                                     seq_stop[0] ||
                                     (sr[8] && (|seq_bit));

        if      (rst)        sda_en <= 1;
//        else if (first_cyc)  sda_en <= busy_r && (
// TODO: no active SDA if previous SDA was 1
        else if (first_cyc)  sda_en <= busy_w && (
                                     (active_sda_r && active_sda_was_0 && (seq_start_restart[3] || seq_stop[0] || (sr[8] && seq_bit[3]))) || // !sda uses output reg
                                     (|seq_start_restart[1:0]) ||
                                     (|seq_stop[2:1]) ||
                                     (!sr[8] && (|seq_bit[3:1])) ||
//                                     (!sr[8] && seq_bit[0] && (!early_release_0 || !sr[7])));
                                     (!sr[8] && seq_bit[0] && (!early_release_r || !sr[7])));
       bus_busy <= busy_r;
    end

endmodule

