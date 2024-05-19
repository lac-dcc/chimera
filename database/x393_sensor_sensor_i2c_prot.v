// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensor_i2c_prot
 * @file sensor_i2c_prot.v
 * @date 2015-10-05  
 * @author Andrey Filippov     
 *
 * @brief Generate i2c R/W sequence from a 32-bit word and LUT
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sensor_i2c_prot.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensor_i2c_prot.v is distributed in the hope that it will be useful,
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

module  sensor_i2c_prot#(
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
    parameter SENSI2C_TBL_DLY_BITS=      8
)(
    input            mrst,         // @ posedge mclk
    input            mclk,         // global clock
    input            i2c_rst,
    input            i2c_start,
    input            active_sda,     // global config bit: active pull SDA
    input            early_release_0,// global config bit: release SDA immediately after end of SCL if next bit is 1 (for ACKN). Data hold time by slow 0->1 
    // setup LUT to translate address page into SA, actual address MSB and number of bytes to write (second word bypasses translation)
    input            tand,         // table address/not data
    input     [27:0] td,           // table address/data in            
    input            twe,          // table write enable
    input            sda_in,       // data from sda pad
    output           sda,
    output           sda_en,
    output           scl,
    output reg       i2c_run,      // released as soon as the last command (usually STOP) gets to the i2c start/stop/shift module
    output reg       i2c_busy,     // released when !i2c_run and all i2c activity is over 
    output reg [1:0] seq_mem_ra, // number of byte to read from the sequencer memory
    output    [ 1:0] seq_mem_re, // [0] - re, [1] - regen to the sequencer memory
    input     [ 7:0] seq_rd,     // data from the sequencer memory 
    output    [ 7:0] rdata,
    output           rvalid
);
/*
    Sequencer provides 4 bytes per command, read one byte at a time as seq_rd[7:0] with byte address provided by seq_mem_ra[1:0],
    seq_mem_re[0] external memory re, seq_mem_re[1] - regen
    MSB (byte 3) is used as index in the table that provides for register writes (tdout[8] == 0):
        high byte of the register address (if used) - tdout[7:0]
        slave address - tdout[15:9],
        number of bytes to send after SA - tdout[19:16] (includes both adderss and data bytes, aligned to the MSB)
        bit delay - tdout[27:20] (periods of mclk for 1/4 of the SCL period), should be >2(?)
        
        if number of bytes to send (including address) >4, there will be no stop and the next command will bypass MSB decoding through table
        and be sent out as data bytes (MSB first, aligned to the LSB (byte[0]), so if only one byte is to be sent bytes[3:1] will be skipped.
   In read mode (tdout[8] == 1) it is possible to use 1 or 2 byte register address and read 1..8 bytes
        bit delay - tdout[27:20] (same as for register writes - see above)
        Slave address in the read mode is provided as byte[2], register adderss in bytes[1:0] (byte[1] is skipped for 1-byte addresses)
        Number of data bytes to read is provided as tdout[18:16], with 0 meaning 8 bytes
        Nuber of register address bytes is defined by tdout[19]: 0 - one byte, 1 - 2 bytes address
   "active_sda" (configuration bit enables active pull-up on SDA line by the master for faster communication, it is active during second
        half of the SCL=0 for the data bits and also for the first interval of the RESTART sequence and for the last of the STOP one.
   "early_release_0" - when sending data bit "0" over the SDA line, release SDA=0 immediately after SCL: 1->0 if the next bit to send is "1".
        This is OK as the SDA 0->1 transition will be slower than SCL 1->0 (only pulled up by a resistor), so there will be positive hold time
        on SDA line. This is done so for communications with 10359 (or similar) board where FPGA can also actively drive SDA line for faster
        communication.
   Active driving of the SDA line increases only master send communication, so ACKN may be missed, but it is not used in this implementation.
   Reading registers is less used operation than write and can use slower communication spped (provided through the table)      
*/
    reg    [ 7:0] twa;
    wire   [31:0] tdout;
    reg    [ 7:0] reg_ah;   // MSB of the register address (instead of the byte 2)
    reg    [ 7:0] slave_a_rah;    // 8-bit slave address , used instead of the byte 3, later replaced with reg_ah
    reg    [ 3:0] num_bytes_send; // number of bytes to send (if more than 4 will skip stop and continue with next data
    reg    [ 7:0] i2c_dly;      // bit duration-1 (>=2?), 1 unit - 4 mclk periods
    
    
    reg    [ 3:0] bytes_left_send; // Number of bytes left in register write sequence (not counting sa?)
    reg    [ 6:0] run_reg_wr;      // run register write [6] - start, [5] - send sa, [4] - send high byte (from table),..[0] - send stop 
    reg    [ 4:0] run_extra_wr;    // continue register write (if more than sa + 4bytes) [4] - byte 3, .. [1]- byte0,  [0] - stop
    reg    [ 7:0] run_reg_rd; // [7] - start, [6] SA (byte 3), [5] (optional) - RA_msb, [4] - RA_lsb, [3] - restart, [2] - SA, [1] - read bytes, [0] - stop
    reg           run_extra_wr_d;  // any of run_extra_wr bits, delayed by 1
    reg           run_any_d;       // any of command states, delayed by 1
    reg    [1:0]  pre_cmd;         // from i2c_start until run_any_d will be active
    reg           first_mem_re;
//    reg           i2c_done;
//    wire          i2c_next_byte;
    reg    [ 2:0] mem_re;
    reg           mem_valid;
    reg    [ 2:0] table_re;
    
//    reg           read_mem_msb;
//    wire          decode_reg_rd = &seq_rd[7:4];
//    wire          start_wr_seq_w = !run_extra_wr_d && !decode_reg_rd && read_mem_msb;
    wire          start_wr_seq_w = table_re[2] && !tdout[SENSI2C_TBL_RNWREG];
    wire          start_rd_seq_w = table_re[2] &&  tdout[SENSI2C_TBL_RNWREG];
    wire          start_extra_seq_w = i2c_start && (bytes_left_send !=0);
    
 //   wire          snd_start_w = run_reg_wr[6] || 1'b0; // add start & restart of read
 //   wire          snd_stop_w =  run_reg_wr[0] || 1'b0; // add stop of read
 //   wire          snd9_w     =  (|run_reg_wr[5:1]) || 1'b0; // add for read and extra write;

    reg           snd_start;
    reg           snd_stop;
    reg           snd9;
    // the following signals are mutually exclusive, can be encoded to 2 bits. Invaluid during next_cmd_d
    reg           send_seq_data; // including first SA for read
    reg           send_rd_sa;    // from the table
    reg           send_sa_rah;   // send slave address/ high address from the table
    reg           send_rd;       // send 1fe/1ff to read data
    reg     [6:0] rd_sa;         // 7-bit slave address for reading
    wire    [1:0] sel_sr_in = {  // select source for the shift register
                  send_sa_rah | send_rd,
                  send_rd_sa | send_rd};
    reg     [8:0] sr_in;         // input data for the shift register
    wire          bus_busy;      // i2c bus is active
    wire          bus_open;      // i2c bus is "open" (START-ed but not STOP-ed) - between multi-byte write if it spans >1 32-bit comands

    wire          i2c_rdy;
    reg           next_cmd; // i2c command (start/stop/data) accepted, proceed to the next stage
    reg           next_cmd_d; // next cycle after next_cmd (first at new state)
    wire          pre_next_cmd = (snd_start || snd_stop || snd9) && i2c_rdy;
    reg           next_byte_wr;
    
    reg           read_address_bytes; // 0 - single-byte register adderss, 1 - two-byte register address
    reg    [ 2:0] read_data_bytes;    // 1..8 bytes to read from the i2c slave (0 is 8!)
    
    reg    [ 1:0] initial_address; // initial data byte to read: usually 3  but for extra write may be different
    wire   [ 3:0] initial_address_w =  bytes_left_send - 1; // if bytes left to send == 0 - will be 3                      
    wire          unused;            // unused ackn signal SuppressThisWarning VEditor
    
    wire          pre_table_re = !run_extra_wr_d && first_mem_re && mem_re[1];
    reg           rnw;  // last command was read (not write) - do not increment bytes_left_send
    
//    wire          dout_stb; // rvalid
      
    assign seq_mem_re = mem_re[1:0];
//    assign rvalid = dout_stb && run_reg_rd[1];
    always @ (posedge mclk) begin
        if (mrst || i2c_rst || start_wr_seq_w) rnw <= 0;
        else if (start_rd_seq_w)               rnw <= 1;
        run_extra_wr_d <= |run_extra_wr;
        
        run_any_d <= (|run_reg_wr) || (|run_extra_wr) || (|run_reg_rd);
        
        if (mrst || i2c_rst)  first_mem_re <= 0;
        else if (i2c_start)   first_mem_re <= 1;
        else if (mem_re[2])   first_mem_re <= 0;
        
        if (mrst || i2c_rst) pre_cmd <= 0;
        else if (i2c_start)  pre_cmd <= 1;
        else if (run_any_d)  pre_cmd <= 0;

        if (mrst || i2c_rst) i2c_run <= 0;
        else                 i2c_run <=  i2c_start || pre_cmd || run_any_d;

        if (mrst || i2c_rst) i2c_busy <= 0;
        else                 i2c_busy <= i2c_start || pre_cmd || run_any_d || bus_busy || bus_open;
        
        
        table_re <= {table_re[1:0], pre_table_re}; // start_wr_seq_w};
        
        if (table_re[2]) begin
            reg_ah <=         tdout[SENSI2C_TBL_RAH +: SENSI2C_TBL_RAH_BITS]; //[ 7:0];   // MSB of the register address (instead of the byte 2)
            num_bytes_send <= tdout[SENSI2C_TBL_NBWR +: SENSI2C_TBL_NBWR_BITS] ; // [19:16]; // number of bytes to send (if more than 4 will skip stop and continue with next data
            i2c_dly <=        tdout[SENSI2C_TBL_DLY +: SENSI2C_TBL_DLY_BITS]; //[27:20];
        end
        if      (table_re[2])               slave_a_rah <= {tdout[SENSI2C_TBL_SA +: SENSI2C_TBL_SA_BITS], 1'b0}; // {tdout[15:9], 1'b0};
        else if (next_cmd && run_reg_wr[5]) slave_a_rah <= reg_ah; // will copy even if not used
 //    wire          pre_next_cmd = (snd_start || snd_stop || snd9) && i2c_rdy;
        next_cmd <= pre_next_cmd;
        
        next_cmd_d <= next_cmd;
        
        next_byte_wr <= snd9 && i2c_rdy && !run_reg_wr[5] && !rnw; // (|run_reg_rd); // same time as next_cmd, no pulse when sending SA during write

//        snd_start <= snd_start_w; // add & i2c_ready? Not really needed as any i2c stage will be busy for long enough
//        snd_stop <=  snd_stop_w;
//        snd9 <=      snd9_w;
        
        if     (mrst || i2c_rst) bytes_left_send <= 0;
        else if (start_wr_seq_w) bytes_left_send <= tdout[SENSI2C_TBL_NBWR +: SENSI2C_TBL_NBWR_BITS]; // num_bytes_send;
        else if (next_byte_wr)   bytes_left_send <= bytes_left_send - 1;

        // calculate stages for each type of commands
        // start and write sa and some bytes, stop if number of bytes <= 4 at the end        
        if      (mrst || i2c_rst) run_reg_wr <= 0;
        else if (start_wr_seq_w)  run_reg_wr <= 7'h40;
        else if (next_cmd)        run_reg_wr <= {1'b0,         // first "start"
                                                run_reg_wr[6], // slave_addr - always after start
                                                run_reg_wr[5] & (|num_bytes_send[3:2]), // MSB (from the table)
                                                run_reg_wr[4] | (run_reg_wr[5] & (num_bytes_send == 4'h3)), // byte 2 (from input)
                                                run_reg_wr[3] | (run_reg_wr[5] & (num_bytes_send == 4'h2)), // byte 1 (from input)
                                                run_reg_wr[2] | (run_reg_wr[5] & (num_bytes_send == 4'h1)), // byte 0 (from input)
                                                run_reg_wr[1] & (bytes_left_send == 4'h1)
                                                };
        // send just bytes (up to 4), stop if nothing left 
        if      (mrst || i2c_rst)               run_extra_wr <= 0;
        else if (start_extra_seq_w)             run_extra_wr <= {
                                                        |bytes_left_send[3:2], // >= 4 bytes left
                                                        (bytes_left_send == 3), // exactly 3 bytes left
                                                        (bytes_left_send == 2), // exactly 2 bytes left
                                                        (bytes_left_send == 1), // exactly 1 bytes left (zero should never be left)
                                                        1'b0
                                                     };
        else if (next_cmd)                      run_extra_wr <= {
                                                        1'b0,
                                                        run_extra_wr[4],
                                                        run_extra_wr[3],
                                                        run_extra_wr[2],
                                                        run_extra_wr[1] & (bytes_left_send == 4'h1)
                                                };

//     reg    [ 7:0] run_reg_rd; // [7] - start, [6] SA (byte 3), [5] (optional) - RA_msb, [4] - RA_lsb, [3] - restart, [2] - SA, [1] - read bytes, [0] - stop

//        if      (table_re[2] &&  tdout[8])  read_address_bytes <= tdout[19];
        if      (table_re[2] &&  tdout[SENSI2C_TBL_RNWREG])  read_address_bytes <= tdout[SENSI2C_TBL_NABRD]; // [19];
        
//        if      (table_re[2] &&  tdout[8])  read_data_bytes <= tdout[18:16];
        if      (table_re[2] &&  tdout[SENSI2C_TBL_RNWREG])  read_data_bytes <= tdout[SENSI2C_TBL_NBRD +: SENSI2C_TBL_NBRD_BITS];
        else if (run_reg_rd[1] && next_cmd) read_data_bytes <= read_data_bytes - 1;
        
        // read i2c data
        if      (mrst || i2c_rst) run_reg_rd <= 0;
//        else if (!run_extra_wr_d &&  decode_reg_rd && read_mem_msb)  run_reg_rd <= 8'h80;
        else if (start_rd_seq_w)  run_reg_rd <= 8'h80;
        else if (next_cmd)        run_reg_rd <= {1'b0,         // first "start"
                                                run_reg_rd[7], // slave_addr - always after start (bit0 = 0)
                                                run_reg_rd[6] & read_address_bytes, // optional MSB of the register address
                                                run_reg_rd[5] | (run_reg_rd[6] & ~read_address_bytes), // LSB of the register address
                                                run_reg_rd[4], // restart
                                                run_reg_rd[3], // send slave address with 1 in bit[0]
                                                run_reg_rd[2] | (run_reg_rd[1] & (read_data_bytes != 3'h1)), // repeat reading bytes
                                                run_reg_rd[1] & (read_data_bytes == 3'h1)
                                                };
        // read sequencer memory byte (for the current word)
        mem_re <= {mem_re[1:0], i2c_start | next_cmd_d & (
                               (|run_reg_wr[3:1]) |
                               (|run_extra_wr[4:1]) |
                               (|run_reg_rd[6:4]))};
        initial_address <=  initial_address_w[1:0]; // if bytes left to send is 0 mod 4 - will be 3 (read MSB)
        seq_mem_ra <= i2c_start ? initial_address : { // run_extra_wr[4] is not needed - it will be read by i2c_start
                                                       run_reg_wr[3] | run_extra_wr[3] | run_reg_rd[6],
                                                       run_reg_wr[2] | run_extra_wr[2] | run_reg_rd[5]
                                                    };
        if (mrst || i2c_rst || i2c_start || next_cmd ) mem_valid <= 0;
        else if (mem_re[2])                            mem_valid <= 1;
        
        // calculate snd9 and delay it if waiting for memory using mem_valid, set din[8:0] 
        if (run_reg_rd[6] && mem_re[2]) rd_sa <= seq_rd[7:1]; // store sa to use with read
        
        send_seq_data <= !next_cmd && mem_valid && ((|run_reg_wr[3:1]) || (|run_extra_wr[4:1]) || (|run_reg_rd[6:4])); 
        send_rd_sa <=    !next_cmd && run_reg_rd[2];
        send_sa_rah <=   !next_cmd && (|run_reg_wr[5:4]);
        send_rd <=       !next_cmd && run_reg_rd[1];
        
        if (mrst || i2c_rst || next_cmd) snd9 <= 0;
        else                             snd9 <= snd9 ? (!i2c_rdy) : ((send_seq_data || send_rd_sa || send_sa_rah || send_rd) && !next_cmd);

        if (mrst || i2c_rst || next_cmd) snd_start <= 0;
        else                             snd_start <= snd_start? (!i2c_rdy) : (run_reg_wr[6] || run_reg_rd[7] || run_reg_rd[3]);

        if (mrst || i2c_rst || next_cmd) snd_stop <= 0;
        else                             snd_stop <= snd_stop? (!i2c_rdy) : (run_reg_wr[0] || run_extra_wr[0] || run_reg_rd[0]);
        
        case (sel_sr_in)
            2'h0: sr_in <= {seq_rd, 1'b1};
            2'h1: sr_in <= {rd_sa, 2'b11};
            2'h2: sr_in <= {slave_a_rah, 1'b1};
            2'h3: sr_in <= {8'hff,(read_data_bytes == 3'h1)}; 
        endcase
        
    end    

    sensor_i2c_scl_sda sensor_i2c_scl_sda_i (
        .mrst            (mrst),          // input
        .mclk            (mclk),          // input
        .i2c_rst         (i2c_rst),       // input
        .i2c_dly         (i2c_dly),       // input[7:0] 
        .active_sda      (active_sda), // input
        .early_release_0 (early_release_0), // input
        .snd_start       (snd_start),     // input
        .snd_stop        (snd_stop),      // input
        .snd9            (snd9),          // input
        .rcv             (run_reg_rd[1]), // input       
        .din             (sr_in),         // input[8:0] 
        .dout            ({rdata,unused}),// output[8:0] 
        .dout_stb        (rvalid),        // output reg 
        .scl             (scl),           // output reg 
        .sda_in          (sda_in),        // input
        .sda             (sda),           // output reg 
        .sda_en          (sda_en),        // output reg 
        .ready           (i2c_rdy),       // output register
        .bus_busy        (bus_busy),      // output reg 
        .is_open         (bus_open)       // output
    );
     
    // table write  
    always @ (posedge mclk) begin
        if      (mrst) twa <= 0;
        else if (twe)  twa <= tand ? td[7:0] : (twa + 1);  
    end
    
    ram18_var_w_var_r #(
        .COMMENT("sensor_i2c_prot"),
        .REGISTERS    (1),
        .LOG2WIDTH_WR (5),
        .LOG2WIDTH_RD (5),
        .DUMMY        (0)
    ) ram18_var_w_var_r_i (
        .rclk        (mclk), // input
        .raddr       ({1'b0, seq_rd}), // input[8:0] 
        .ren         (table_re[0]), // input
        .regen       (table_re[1]), // input
        .data_out    (tdout), // output[31:0] 
        .wclk        (mclk), // input
        .waddr       ({1'b0, twa}), // input[8:0] 
        .we          (twe && !tand), // input
        .web         (4'hf), // input[3:0] 
        .data_in     ({4'b0, td}) // input[31:0] 
    );


endmodule

