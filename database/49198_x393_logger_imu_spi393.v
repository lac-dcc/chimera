// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>imu_spi393
 * @file imu_spi393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief SPI interface for the IMU
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * imu_spi393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  imu_spi393.v is distributed in the hope that it will be useful,
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

module  imu_spi393(
//    input                         rst,
    input                         mclk,         // system clock, negedge TODO:COnvert to posedge!
    input                         xclk,         // half frequency (80 MHz nominal)
    input                         we_ra,        // write enable for registers to log (@negedge clk)
    input                         we_div,       // write enable for clock dividing(@negedge clk)
    input                         we_period,    // write enable for IMU cycle period(@negedge clk) 0 - disable, 1 - single, >1 - half bit periods
    input                  [ 4:0] wa,           // write address for register (5 bits, @negedge clk)
    input                  [31:0] din,          //
    output                        mosi,         // to IMU, bit 2 in J9
    input                         miso,         // from IMU, bit 3 on J9
    input                  [ 3:0] config_debug, // bit 0 - long sda_en
    output                        sda,          // sda, shared with i2c, bit 1
    output                        sda_en,       // enable sda output (when sda==0 and 1 cycle after sda 0->1)
    output                        scl,          // scl, shared with i2c, bit 0
    output                        scl_en,       // enable scl output (when scl==0 and 1 cycle after sda 0->1)
    output                        ts,           // timestamp request
    output                        rdy,          // data ready
    input                         rd_stb,       // data read strobe (increment address)
    output                 [15:0] rdata);       // data out (16 bits)
 /*
  input         mclk;   // system clock, negedge
  input         xclk;  // half frequency (80 MHz nominal)
  input         we_ra; // write enable for registers to log (@negedge mclk)
  input         we_div;// write enable for clock dividing(@negedge mclk)
  input         we_period;// write enable for IMU cycle period(@negedge clk)
  input  [4:0]  wa;    // write address for register (5 bits, @negedge mclk)
  input  [15:0] di;    // 16-bit data in
  output        mosi;  // to IMU, bit 2 in J9
  input         miso;  // from IMU, bit 3 on J9 
  input [3:0]   config_debug;
  output        sda;   // sda, shared with i2c, bit 1
  output        sda_en; // enable sda output (when sda==0 and 1 cycle after sda 0->1)
  output        scl;   // scl, shared with i2c, bit 0
  output        scl_en; // enable scl output (when scl==0 and 1 cycle after sda 0->1)
  output        ts;    // timestamp request

  output        rdy;    // encoded nmea data ready
  input         rd_stb; // encoded nmea data read strobe (increment address)
  output [15:0] rdata;  // encoded data (16 bits)
//  output        sngl_wire; // combined clock/data
 */ 
    reg    [ 7:0] bit_duration_mclk=8'h0; 
    reg    [ 7:0] bit_duration; 
    reg    [ 7:0] bit_duration_cntr=8'h0; 
    reg           bit_duration_zero; // just for simulation

    reg    [ 3:0] clk_en=4'h0;
    reg    [ 1:0] clk_div;
    reg    [ 4:0] imu_in_word=   5'b0; // number of IMU output word in a sample (0..31), 0..3 - timestamp
    reg           pre_imu_wr_buf,imu_wr_buf;
    wire   [15:0] imu_in_buf;

    reg     [4:0] reg_seq_number; // number of register in a sequence
    wire    [6:1] imu_reg_number; // register numer to read 
  
    reg     [1:0] seq_state; // 0 - idle, 1 - prepare spi(4?), 2 - spi-comm(32*29), 3 - finish (2)
    reg     [9:0] seq_counter;
    reg           end_spi, end_prepare;
    reg           set_mosi_prepare, set_mosi_spi;
    reg           seq_counter_zero, pre_seq_counter_zero;
    reg    [15:0] mosi_reg;
//    wire          mosi;
    reg     [1:0] sda_r;
    reg     [1:0] scl_r;
//    wire          scl_en;
    reg           shift_miso;
    reg    [15:0] miso_reg;
    reg           last_bit; // last clk _/~ in spi word (but first one)
    reg           last_bit_ext=1'b0; // from last bit till buffer write
    reg           last_buf_wr;
    reg    [ 4:0] raddr;
    reg           rdy_r=1'b0;
    reg           imu_start;
    reg           ts_r; // delay imu_start by one cycle, so it will be after rdy is reset

    reg    [31:0] period=0; // 0 - disable, 1 - single, >1 - period in 50 ns steps
//  reg    [15:0] di_d;

    reg           imu_enabled_mclk = 0;
    reg     [1:0] imu_enabled=2'h0;
    reg           imu_run_mclk = 0;
    reg     [1:0] imu_run;
    reg           imu_when_ready_mclk = 0;
    reg     [1:0] imu_when_ready;
  
    reg           imu_run_confirmed;
    reg           imu_start_mclk;
    reg     [1:0] imu_start_grant;
    reg           imu_start_first;
    reg           imu_start_first_was;
    reg    [31:0] period_counter;
    wire          en;
    reg    [4:01] we_timer;
    reg           first_prepare;
    reg     [1:0] first_prepare_d;
    wire          config_long_sda_en;
    wire          config_late_clk;
    reg     [7:0] stall_dur_mclk;  
    reg     [7:0] stall_dur;
    reg           stall;       // stall between words to satisfy SPI stall time
    reg     [7:0] stall_cntr;  // stall counter (in half mclk periods)
    reg           set_stall;
    reg           skip_stall; // first word after CS -\_
    wire          shift_mosi;
  
    reg           imu_ready_reset; 
    reg     [6:0] imu_ready_denoise_count;
    reg     [2:0] imu_data_ready_d; 
    reg     [5:0] imu_data_ready;
    reg     [1:0] seq_state_zero;  

    reg           pre_scl;
    reg     [2:0] sngl_wire_stb;
    reg     [1:0] sngl_wire_r;
    wire          sngl_wire;
    wire          config_single_wire; // used in 103695 rev A
  
    assign sngl_wire =          ~|sngl_wire_r[1:0];
  
    assign shift_mosi =         (clk_en[3] && seq_counter[0] && !stall);
    assign mosi =               config_single_wire?sngl_wire: mosi_reg[15];
  
    assign config_long_sda_en = config_debug[0];
    assign config_late_clk =    config_debug[1];
    assign config_single_wire = config_debug[2];
  
    assign en=                  imu_enabled[1];
    assign sda_en=              !config_single_wire && (!sda_r[0] || !sda_r[1] || (config_long_sda_en && (seq_state[1:0]!=2'b0)));
    assign scl_en=              !config_single_wire && (!scl_r[0] || !scl_r[1]);
  
    assign sda =                sda_r[0];
    assign scl =                scl_r[0];
    assign rdy =                rdy_r;
    assign ts =                 ts_r;
  
  
    always @ (posedge mclk) begin
    //    di_d[15:0] <= di[15:0];
        if (we_div) bit_duration_mclk[7:0] <=    din[7:0];
        if (we_div) stall_dur_mclk[7:0] <=       din[15:8];
        we_timer[4:1] <= {we_timer[3:1], we_period};
    
        if (we_period)   period[31:0] <=        din[31:0];
        if (we_timer[2]) imu_run_mclk <=        (period[31:1]!=31'b0); // double-cycle
        if (we_timer[3]) imu_enabled_mclk <=    imu_run_mclk | period[0]; // NC393: Why period[0]?
        
        if (we_timer[2]) imu_when_ready_mclk <= &period[31:16]; // double-cycle
        
        if (!imu_enabled_mclk || imu_start_grant[1]) imu_start_mclk <= 1'b0;
        else if (we_timer[4])imu_start_mclk <= imu_enabled_mclk;
    end

// debounce imu_data_ready
    always @ (posedge xclk) begin
        seq_state_zero[1:0] <= {seq_state_zero[0], ~|seq_state[1:0]};
        imu_ready_reset <= !imu_enabled[1] || (seq_state[1:0]!=2'b0) || !imu_when_ready[1];
        if (imu_ready_reset) imu_data_ready_d[2:0] <=3'b0;
        else                 imu_data_ready_d[2:0] <= {imu_data_ready_d[1:0], miso};
        
        if (imu_ready_reset)                         imu_data_ready[0] <= 1'b0;
        else if (imu_ready_denoise_count[6:0]==7'h0) imu_data_ready[0] <= imu_data_ready_d[2];
        
        if (imu_data_ready_d[2]==imu_data_ready[0]) imu_ready_denoise_count[6:0] <= 7'h7f; // use period LSBs?
        else                                        imu_ready_denoise_count[6:0] <= imu_ready_denoise_count[6:0] - 1;
        
        if (imu_ready_reset)                              imu_data_ready[1] <= 1'b0;
        else if (imu_data_ready[0])                       imu_data_ready[1] <= 1'b1;
        
        if (imu_ready_reset)                              imu_data_ready[2] <= 1'b0;
        else if (imu_data_ready[1] && !imu_data_ready[0]) imu_data_ready[2] <= 1'b1;
        
        if (imu_ready_reset)                              imu_data_ready[3] <= 1'b0;
        else if (imu_data_ready[2] &&  imu_data_ready[0]) imu_data_ready[3] <= 1'b1;
        
        if (clk_en[1]) imu_data_ready[4] <= imu_data_ready[3] ;
        
        imu_data_ready[5] <=clk_en[1] && imu_data_ready[3] && !imu_data_ready[4]; // single pulse @clk_en[2]
    end

    always @ (posedge xclk) begin
        imu_enabled[1:0]     <= {imu_enabled[0],imu_enabled_mclk}; 
        imu_run[1:0]         <= {imu_run[0],imu_run_mclk};
    
        imu_when_ready[1:0]         <= {imu_when_ready[0],imu_when_ready_mclk};
    
        if        (~imu_run[1:0]) imu_run_confirmed <= 1'b0;
        else if (imu_start_first) imu_run_confirmed <= imu_run[1];
        imu_start_grant[1:0] <= {imu_enabled_mclk && (imu_start_grant[0] || (imu_start_grant[1] && !imu_start)),imu_start_mclk};
        imu_start_first_was <= imu_start_grant[1] && (imu_start_first || imu_start_first_was);
        
        imu_start_first<=clk_en[1] && imu_start_grant[1] && !imu_start_first_was; // single xclk at clk_en[2] time slot
        imu_start            <=(!imu_when_ready[1] && imu_start_first)||
                               (!imu_when_ready[1] && imu_run_confirmed && (period_counter[31:0]==32'h1) && clk_en[2]) ||
                               imu_data_ready[5]; // single pulses at clk_en[3]
    
        if (imu_start || imu_when_ready[1]) period_counter[31:0] <= period[31:0];
        else if (clk_en[3]) period_counter[31:0] <= period_counter[31:0] - 1;
    end


    always @ (posedge xclk) begin
        bit_duration[7:0] <= bit_duration_mclk[7:0];
        stall_dur[7:0]       <= stall_dur_mclk[7:0];
    
        bit_duration_zero <= (bit_duration[7:0] == 8'h0);
        clk_div[1:0] <=      en ? (clk_div[1:0] + 1) : 2'b0;
        clk_en[3:0] <=       {clk_en[2:0], clk_div[1:0] == 2'h3};
        if (bit_duration_zero || (bit_duration_cntr[7:0]==8'h0)) bit_duration_cntr[7:0]<=bit_duration[7:0];
        else bit_duration_cntr[7:0] <= bit_duration_cntr[7:0]-1;
        clk_en[3:0]  <=      {clk_en[2:0], bit_duration_cntr[7:0] == 8'h3 };  // change 9'h3 to enforce frequency limit
    end  
  
    always @ (posedge xclk) begin
        pre_seq_counter_zero  <= clk_en[1] && (seq_counter[9:0]==10'h0) && (seq_state[1:0]!=2'h0); // active at clk_en[2]
        seq_counter_zero      <= pre_seq_counter_zero; // active at clk_en[3]
        if (!en)       seq_state[1:0] <= 2'h0;
        else if (imu_start)                                  seq_state[1:0] <= 2'h1;
        else if (seq_counter_zero ) seq_state[1:0] <= seq_state[1:0] + 1; // will not count from 0 as seq_counter_zero will be disabled
        
        if            (!en) first_prepare <=1'b0;
        else if (imu_start) first_prepare <=1'b1;
        else if (clk_en[3]) first_prepare <=1'b0;
        
        if            (!en) first_prepare_d[1:0] <= 2'b0;
        else if (clk_en[3]) first_prepare_d[1:0] <= {first_prepare_d[0],first_prepare};
        
        end_prepare <= pre_seq_counter_zero && (seq_state[1:0]==2'h1);
        end_spi       <= pre_seq_counter_zero && (seq_state[1:0]==2'h2);
        
        if      (!en)                                           seq_counter[9:0] <= 10'h000;
        else if (imu_start)                                     seq_counter[9:0] <= config_late_clk?10'h005:10'h003; // should be odd
        else if (end_prepare)                                   seq_counter[9:0] <= 10'h39f;
        else if (end_spi)                                       seq_counter[9:0] <= 10'h001;
        else if (clk_en[3] && (seq_state[1:0]!=2'h0) && !stall) seq_counter[9:0] <= seq_counter[9:0] - 1;
        set_mosi_prepare <= clk_en[2] && first_prepare;
//        set_mosi_spi       <= clk_en[2] && (seq_state[1:0]==2'h2) && (seq_counter[4:0]==5'h1f) && (seq_counter[9:5]!=6'h0) && !stall; // last word use zero
        set_mosi_spi       <= clk_en[2] && (seq_state[1:0]==2'h2) && (seq_counter[4:0]==5'h1f) && (seq_counter[9:5] != 0) && !stall; // last word use zero
        
    // no stall before the first word
        if      (!en)                          skip_stall <= 1'b0;
        else if (end_prepare)                  skip_stall <= 1'b1;
        else if (clk_en[3])                    skip_stall <= 1'b0;
         
        set_stall          <= clk_en[0] && (seq_state[1:0]==2'h2) && (seq_counter[4:0]==5'h1f) && !skip_stall && !stall; // @ clk_en[1]
    
        if      (!en)               mosi_reg[15:0] <= 16'h0;
        else if (set_mosi_prepare)  mosi_reg[15:0] <= 16'h7fff;
        else if (set_mosi_spi)      mosi_reg[15:0] <= {1'b0,imu_reg_number[6:1],9'b0};
        else if (shift_mosi)        mosi_reg[15:0] <= {mosi_reg[14:0],1'b0};
    
    // stall switches at clk_en[2]
    // stall switches at clk_en[1]
        if      (!en)                         stall_cntr[7:0] <= 8'h0;
        else if (set_stall)                   stall_cntr[7:0] <= stall_dur[7:0];
        else if (clk_en[1])                   stall_cntr[7:0] <= stall?(stall_cntr[7:0]-1):8'h0;
    
    
        if      (!en)                               stall <= 1'b0;
        else if (set_stall)                         stall <= (stall_dur[7:0]!=0);
        else if (clk_en[1] && (stall_cntr[7:1]==0)) stall <= 1'b0;
        
    
    
        if      (!en)        sda_r <=2'b11;
        else if (clk_en[3])  sda_r <= {sda_r[0], !(first_prepare_d[1] || (seq_counter[0] && (seq_state[1:0]==2'h3)))} ;
    
    
        if      (!en) pre_scl <=1'b1;
        else if (clk_en[2])       pre_scl <= (seq_state[1:0]!=2'h2) || !seq_counter[0] || stall;
        
        scl_r[0] <= pre_scl;
        if      (!en) scl_r[1] <=1'b1;
        else if (clk_en[3])       scl_r[1] <= scl_r[0];
    
        
        sngl_wire_stb[2:0] <={sngl_wire_stb[1:0], en & ((scl_r[0] ^ pre_scl) | end_prepare)};
    
        if      (!en)                                           sngl_wire_r[0]<=1'b0;
        else if ((pre_scl ^scl_r[0]) | end_prepare)             sngl_wire_r[0]<=1'b1;
        else if (!mosi_reg[15] || sngl_wire_stb[2] || scl_r[0]) sngl_wire_r[0]<=1'b0;
        
       
        
        if      (imu_start)     reg_seq_number[4:0] <= 5'h04;
        else if (set_mosi_spi)  reg_seq_number[4:0] <= reg_seq_number[4:0] + 1;
    
        shift_miso <= !scl_r[1] && clk_en[2]; // active at clk_en[3]
    
        if (shift_miso)     miso_reg[15:0] <= {miso_reg[14:0], miso};
    
        last_bit <= clk_en[2] && (seq_state[1:0]==2'h2) && (seq_counter[4:0]==5'h0) && (seq_counter[9:5]!=5'h1c);
        last_bit_ext <= en && (last_bit || (last_bit_ext && !(clk_en[2] && !seq_counter[0])));
    
        pre_imu_wr_buf <=clk_en[1] && last_bit_ext && !seq_counter[0]; 
        imu_wr_buf <= pre_imu_wr_buf;
        if    (imu_start) imu_in_word[4:0] <= 5'h0;
        else if (imu_wr_buf) imu_in_word[4:0] <= imu_in_word[4:0] + 1;
    
        last_buf_wr <= (pre_imu_wr_buf && (seq_state[1:0]==2'h3));
    
    end  

    always @ (negedge xclk) begin
        sngl_wire_r[1] <= sngl_wire_stb[0];
    end

    always @ (posedge xclk) begin

        if (!en || imu_start) raddr[4:0] <= 5'h0;
        else if (rd_stb)      raddr[4:0] <= raddr[4:0] + 1;

        if      (imu_start || (rd_stb && (raddr[4:0]==5'h1b)) || !en) rdy_r <= 1'b0; // only 28 words, not 32
        else if (last_buf_wr)                                         rdy_r <= 1'b1;

        ts_r <=imu_start;

    end  
  
    assign imu_in_buf[15:0]= miso_reg[15:0];
   
/*   
  myRAM_WxD_D #( .DATA_WIDTH(6),.DATA_DEPTH(5))
            i_registers2log   (.D(di_d[6:1]),
                             .WE(we_ra),
                             .clk(!mclk),
                             .AW(wa[4:0]),
                             .AR(reg_seq_number[4:0]),
                             .QW(),
                             .QR(imu_reg_number[6:1]));
*/
    reg     [5:0] registers2log_ram[0:31];
    always @ (posedge mclk) if (we_ra) begin
        registers2log_ram[wa[4:0]] <= din[6:1];
    end
    assign imu_reg_number[6:1] = registers2log_ram[reg_seq_number[4:0]];
/*
  myRAM_WxD_D #( .DATA_WIDTH(16),.DATA_DEPTH(5))
            i_odbuf0    (.D(imu_in_buf[15:0]),
                        .WE(imu_wr_buf),
                        .clk(xclk),
                        .AW(imu_in_word[4:0]),
                        .AR(raddr[4:0]),
                        .QW(),
                        .QR(rdata[15:0]));
*/
    reg     [15:0] odbuf0_ram[0:31];
    always @ (posedge xclk) if (imu_wr_buf) begin
        odbuf0_ram[imu_in_word[4:0]] <= imu_in_buf[15:0];
    end
    assign rdata[15:0] = odbuf0_ram[raddr[4:0]];


endmodule

