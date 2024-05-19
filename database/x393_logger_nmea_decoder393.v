// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>nmea_decoder393
 * @file nmea_decoder393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief Decode some of the NMEA sentences (to compress them)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * nmea_decoder393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  nmea_decoder393.v is distributed in the hope that it will be useful,
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

module  nmea_decoder393(
    input                         mclk,    // system clock, posedge
    input                         xclk,    // half frequency (80 MHz nominal)
    input                         we,     // registers write enable (@negedge mclk)
    input                   [4:0] wa,     // registers write address
    input                   [7:0] wd,     // write data
    input                         start,  // start of the serail message
    input                         rs232_wait_pause,// may be used as reset for decoder
    input                         start_char,           // serial character start (single pulse)
    output reg                    nmea_sent_start,  // serial character start (single pulse)
    input                         ser_di, // serial data in (LSB first)
    input                         ser_stb,// serial data strobe, single-cycle, first cycle after ser_di valid
    output                        rdy,    // encoded nmea data ready
    input                         rd_stb, // encoded nmea data read strobe (increment address)
    output                 [15:0] rdata,   // encoded data (16 bits)
    input                         ser_rst,
    output                 [23:0] debug);

    reg    [ 9:0] bitnum;
    reg           gp_exp_bit;                   
    reg           valid;              // so far it is a valid sentence
    reg     [3:0] sentence1hot;       // one-hot sentence, matching first 6 bytes ($GPxxx)
    reg           restart;            // reset byte number if the first byte was not "$"
    reg           start_d;
    reg     [3:0] stb;                // ser_stb delayed
    reg           msb,bits37,bit3;
    reg           vfy_dollar;
    reg           vfy_gp;
    reg           vfy_sel_sent;
    reg           vfy_first_comma;    // first comma after $GPxxx
    reg           proc_fields;
    reg           last_vfy_gp;        // delayed by 1 cycle from bit counters
    reg           last_vfy_sent;      // delayed by 1 cycle from bit counters
    reg           lsbs5;              // 5 LSBs during reading 3 last letters in $GPxxx
    reg     [3:0] gpxxx_addr;
    wire    [3:1] sentence1hot_pri;   // sentence1hot made really one-hot
    reg     [1:0] sentence;           // decoded sentence number (0..3)
    reg     [4:0] format_length;      // number of fields in the sentence
    reg     [4:0] format_length_plus_7;
    reg     [4:0] format_field;       // current number of the field in the sentence
    wire          start_format;
    reg           read_format_length; //, read_format_length_d;
    reg           read_format_byte;
    reg           shift_format_byte;
    reg           format_over;
    reg           sentence_over;
    reg     [7:0] format_byte;
    reg     [7:1] last_byte;
    wire          wcomma;             // comma
    wire          weof;               //asterisk, or cr/lf (<0x10)
    wire          wsep;               //any separator 
    reg     [3:0] nibble;
    reg     [3:0] nibble_pre;
    wire    [7:0] wbyte;
    reg           nibble_stb;
    reg           first_byte_in_field;
    reg     [1:0] extra_nibble;       // empty byte field - send two 4'hf nibbles
    reg     [6:0] nibble_count;
    reg     [4:0] raddr;
    wire    [3:0] gpxxx_w_one;
    wire    [7:0] format_data;
    wire          w_sentence_over;
    reg     [4:0] last_word_written;  // number of the last word (4 nibbles) written - used ro deassert rdy (garbage after)
    reg           rdy_r=1'b0;
    reg           save_sent_number;
    reg    [ 7:0] debug0;
    reg    [15:0] debug1;
    reg    [15:0] debug1_or;

    assign debug[23:0] =  {1'b0,
                           proc_fields,
                           vfy_first_comma,
                           vfy_sel_sent,
                           vfy_gp,
                           vfy_dollar,
                           bitnum[9:0],
                           debug0[7:0]};

    assign sentence1hot_pri[3:1] = {sentence1hot[3]& ~|sentence1hot[2:0],
                                    sentence1hot[2]& ~|sentence1hot[1:0],
                                    sentence1hot[1]&  ~sentence1hot[0]};
    assign start_format=           (vfy_first_comma && (sentence1hot[3:0]!=4'h0) && (stb[3] && msb));
  
    assign wbyte[7:0] =            {ser_di,last_byte[7:1]}; // valid up to stb[3];
    assign wcomma =                proc_fields && msb && (wbyte[7:0]==8'h2c);
    assign weof =                  proc_fields && msb && ((wbyte[7:0]==8'h2a) || (wbyte[7:4]==4'h0)); // 0x2a or 0x0? (<0x10)
    assign wsep =                  wcomma || weof;
    assign w_sentence_over =       wsep && (format_field[4:0]==format_length_plus_7[4:0]);
    assign rdy =                   rdy_r;
    
//format_length_plus_7
    always @ (posedge xclk) begin
        if (ser_rst) debug0 [7:0] <= 8'b0;
        else debug0 [7:0] <=debug0 [7:0] | {rdy_r,
                                          proc_fields,
                                          shift_format_byte,
                                          start_format,
                                          vfy_first_comma,
                                          vfy_sel_sent,
                                          vfy_gp,
                                          vfy_dollar};
    
        if (ser_rst) debug1 [15:0] <= 16'b0;
        else if (stb[1] && vfy_sel_sent && lsbs5) debug1 [15:0] <= debug1 [15:0] | debug1_or [15:0];
    
        case (gpxxx_addr[3:0])
            4'h0:  debug1_or[15:0] <= 16'h0001;
            4'h1:  debug1_or[15:0] <= 16'h0002;
            4'h2:  debug1_or[15:0] <= 16'h0004;
            4'h3:  debug1_or[15:0] <= 16'h0008;
            4'h4:  debug1_or[15:0] <= 16'h0010;
            4'h5:  debug1_or[15:0] <= 16'h0020;
            4'h6:  debug1_or[15:0] <= 16'h0040;
            4'h7:  debug1_or[15:0] <= 16'h0080;
            4'h8:  debug1_or[15:0] <= 16'h0100;
            4'h9:  debug1_or[15:0] <= 16'h0200;
            4'ha:  debug1_or[15:0] <= 16'h0400;
            4'hb:  debug1_or[15:0] <= 16'h0800;
            4'hc:  debug1_or[15:0] <= 16'h1000;
            4'hd:  debug1_or[15:0] <= 16'h2000;
            4'he:  debug1_or[15:0] <= 16'h4000;
            4'hf:  debug1_or[15:0] <= 16'h8000;
        endcase
                                          
        stb[3:0] <= {stb[2:0], ser_stb};
        start_d <= start;
        restart <= start || sentence_over || stb[2] && msb && ((!valid && (vfy_dollar || last_vfy_gp || vfy_first_comma)) || // may abort earlier (use vfy_gp)
                                              ((sentence1hot==4'h0) &&  last_vfy_sent)); // may abort earlier (use vfy_sel_sent)
     
        if      (start_d)  bitnum[2:0] <= 3'h0;
        else if (stb[3]) bitnum[2:0] <= bitnum[2:0] + 1;
    
        if      (start_d)  msb <= 1'b0;
        else if (stb[3])   msb <= (bitnum[2:0] ==3'h6);
    
        if      (start_d)  bit3  <= 1'b0;
        else if (stb[3])   bit3 <= (bitnum[2:0] ==3'h2);
    
        if      (start_d)  bits37 <= 1'b0;
        else if (stb[3])   bits37 <= (bitnum[1:0] ==2'h2);
    
        if      (start_d)  lsbs5 <= 1'b1;
        else if (stb[3])   lsbs5 <= !bitnum[2] || (bitnum[2:0] ==3'h7);
        
        if      (restart)       bitnum[9:3] <= 'h0;
        else if (stb[3] && msb) bitnum[9:3] <=  bitnum[9:3] + 1;
        
        if      (restart || rs232_wait_pause)  vfy_dollar <= 1'b1;  // byte 0
        else if (stb[3] && msb)                vfy_dollar <= 1'b0;
    
        last_vfy_gp <= vfy_gp && !bitnum[3];

        if      (restart)       vfy_gp <= 1'b0;
        else if (stb[3] && msb) vfy_gp <= (valid && vfy_dollar) || (vfy_gp && !last_vfy_gp); // bytes 1-2
    
        last_vfy_sent <= vfy_sel_sent && (bitnum[3] && bitnum[5]);

        if      (restart)       vfy_sel_sent <= 1'b0;
        else if (stb[3] && msb) vfy_sel_sent <= (valid && last_vfy_gp) || (vfy_sel_sent && !last_vfy_sent); // bytes 3,4,5
    
        if      (restart)       vfy_first_comma <= 1'b0;
        else if (stb[3] && msb) vfy_first_comma <= last_vfy_sent;
        
        if (restart)                                                                              valid <= 1'b1; // ready @ stb[2]
        else if (stb[1] && (ser_di!=gp_exp_bit) &&
                           (vfy_dollar || vfy_gp || vfy_first_comma || (vfy_sel_sent && !lsbs5))) valid <= 1'b0;
    
     
        if       (!vfy_sel_sent) gpxxx_addr[3:0] <= 4'h0;
        else if (lsbs5 &&stb[3]) gpxxx_addr[3:0] <= gpxxx_addr[3:0] + 1;
        
        if (vfy_gp)                                sentence1hot[3:0] <= 4'hf;
        else if (stb[1] && vfy_sel_sent && lsbs5)  sentence1hot[3:0] <= sentence1hot & (ser_di?(gpxxx_w_one[3:0]): (~gpxxx_w_one[3:0]));
    
        if (last_vfy_sent && stb[3] && msb) sentence[1:0] <= {sentence1hot_pri[3] | sentence1hot_pri[2], sentence1hot_pri[3] | sentence1hot_pri[1]};
        
        if (restart || sentence_over) proc_fields <=1'b0;
        else if (start_format)        proc_fields <=1'b1;
        
        if (!proc_fields)            format_field[4:0] <= 5'h0;
        else if (read_format_length) format_field[4:0] <= 5'h8;
        else if (format_over)        format_field[4:0] <= format_field[4:0] + 1;

        format_length_plus_7[4:0] <= format_length[4:0]+7;

        if      (start_format)  first_byte_in_field <=1'b1;
        else if (stb[3] && msb) first_byte_in_field <=  format_over;
        
        read_format_length <= start_format;
        
        if (read_format_length) format_length[4:0] <= format_data[4:0];
        
        read_format_byte <= read_format_length || (format_over && format_field[2:0]==3'h7); // @stb[4]

        shift_format_byte <= format_over; // @stb[4]

        if       (read_format_byte) format_byte[7:0] <= format_data[7:0];
        else if (shift_format_byte) format_byte[7:0] <= {1'b0,format_byte[7:1]};

    //     format_byte[0] - current format
        if (stb[3]) last_byte[7:1] <= {ser_di,last_byte[7:2]};

        format_over   <=  stb[2] && wsep;

        sentence_over <=  stb[2] && (weof || w_sentence_over);
    
        if (bits37 && stb[3]) nibble_pre[3:0] <= last_byte[4:1]; // always OK
    
        if      (stb[3] && bit3)                             nibble[3:0] <= nibble_pre[3:0];
        else if (stb[3] && msb &&  wsep && (first_byte_in_field || !format_byte[0]))  nibble[3:0] <= 4'hf;
        else if (stb[3] && msb &&           format_byte[0])   nibble[3:0] <= {wsep,nibble_pre[2:0]};
        else if (save_sent_number) nibble[3:0] <= {2'b0,sentence[1:0]};
        
    //first_byte_in_field   
    
        extra_nibble[1:0] <= {extra_nibble[0],
                              msb &&  wsep && first_byte_in_field & proc_fields & stb[3] & format_byte[0]};// active at stb[4], stb[5]

        save_sent_number <= start_format; // valid at stb[4]

        nibble_stb <= save_sent_number ||
                        (proc_fields && ((stb[3] && bit3 && !first_byte_in_field) ||
                        (stb[3] && msb  && !first_byte_in_field && format_byte[0]) ||
                        (stb[3] && msb  && wsep))) || extra_nibble[1]; // extra_nibble[1] will repeat 4'hf
    
        if    (start_format) nibble_count[6:0] <= 7'h0;
        else if (nibble_stb) nibble_count[6:0] <= nibble_count[6:0] + 1;
        
        if (sentence_over) raddr[4:0] <= 5'h0;
        else if (rd_stb)    raddr[4:0] <= raddr[4:0] + 1;

        if (nibble_stb) last_word_written[4:0]<=nibble_count[6:2];

        if      (start || vfy_first_comma || (rd_stb && ((raddr[4:0]==5'h1b) ||(raddr[4:0]==last_word_written[4:0])))) rdy_r <= 1'b0;
        else if (sentence_over)   rdy_r <= 1'b1;

        nmea_sent_start <= start_char && vfy_dollar;
    end
// output buffer to hold up to 32 16-bit words. Written 1 nibble at a time
    // replaced 6 RAM modules with inferred ones
    reg     [3:0] odbuf0_ram[0:31];
    reg     [3:0] odbuf1_ram[0:31];
    reg     [3:0] odbuf2_ram[0:31];
    reg     [3:0] odbuf3_ram[0:31];
    always @ (posedge xclk) if (nibble_stb && (nibble_count[1:0] == 2'h0)) odbuf0_ram[nibble_count[6:2]] <= nibble[3:0];
    always @ (posedge xclk) if (nibble_stb && (nibble_count[1:0] == 2'h1)) odbuf1_ram[nibble_count[6:2]] <= nibble[3:0];
    always @ (posedge xclk) if (nibble_stb && (nibble_count[1:0] == 2'h2)) odbuf2_ram[nibble_count[6:2]] <= nibble[3:0];
    always @ (posedge xclk) if (nibble_stb && (nibble_count[1:0] == 2'h3)) odbuf3_ram[nibble_count[6:2]] <= nibble[3:0];

    assign rdata[ 3: 0] = odbuf0_ram[raddr[4:0]];
    assign rdata[ 7: 4] = odbuf1_ram[raddr[4:0]];
    assign rdata[11: 8] = odbuf2_ram[raddr[4:0]];
    assign rdata[15:12] = odbuf3_ram[raddr[4:0]];

    reg     [3:0] gpxxx_ram[0:15];
    always @ (posedge mclk) if (we &  ~wa[4]) gpxxx_ram[wa[3:0]] <= wd[3:0];
    assign gpxxx_w_one[3:0] =                 gpxxx_ram[gpxxx_addr[3:0]];
// for each of the four sentences first byte - number of field (<=24), next 3 bytes - formats for each nmea field (LSB first):
// 0 - nibble ("-" -> 0xd, "." -> 0xe), terminated with 0xf
// 1 - byte (2 nibbles), all bytes but last have MSB clear, last - set.
// No padding of nibbles to byte borders, bytes are encoded as 2 nibbles
    reg     [7:0] format_ram[0:15];
    always @ (posedge mclk) if (we & wa[4]) format_ram[wa[3:0]] <= wd[7:0];
    assign format_data[7:0] =               format_ram[{sentence[1:0],format_field[4:3]}];

// ROM to decode "$GP"                     
  always @ (posedge xclk) begin
    if (ser_stb) case ({(bitnum[4] & ~ vfy_sel_sent) | vfy_first_comma, bitnum[3] | vfy_sel_sent | vfy_first_comma, bitnum[2:0]}) // during vfy_sel_sent will point to 1 ('G')
      5'h00:  gp_exp_bit <= 1'b0; //$
      5'h01:  gp_exp_bit <= 1'b0;
      5'h02:  gp_exp_bit <= 1'b1;
      5'h03:  gp_exp_bit <= 1'b0;
      5'h04:  gp_exp_bit <= 1'b0;
      5'h05:  gp_exp_bit <= 1'b1;
      5'h06:  gp_exp_bit <= 1'b0;
      5'h07:  gp_exp_bit <= 1'b0;
      5'h08:  gp_exp_bit <= 1'b1; //G
      5'h09:  gp_exp_bit <= 1'b1;
      5'h0a:  gp_exp_bit <= 1'b1;
      5'h0b:  gp_exp_bit <= 1'b0;
      5'h0c:  gp_exp_bit <= 1'b0;
      5'h0d:  gp_exp_bit <= 1'b0;
      5'h0e:  gp_exp_bit <= 1'b1;
      5'h0f:  gp_exp_bit <= 1'b0;
      5'h10:  gp_exp_bit <= 1'b0; //P
      5'h11:  gp_exp_bit <= 1'b0;
      5'h12:  gp_exp_bit <= 1'b0;
      5'h13:  gp_exp_bit <= 1'b0;
      5'h14:  gp_exp_bit <= 1'b1;
      5'h15:  gp_exp_bit <= 1'b0;
      5'h16:  gp_exp_bit <= 1'b1;
      5'h17:  gp_exp_bit <= 1'b0;
      5'h18:  gp_exp_bit <= 1'b0; //'h2c: "," - will use later - attach first comma to $GPxxx,
      5'h19:  gp_exp_bit <= 1'b0;
      5'h1a:  gp_exp_bit <= 1'b1;
      5'h1b:  gp_exp_bit <= 1'b1;
      5'h1c:  gp_exp_bit <= 1'b0;
      5'h1d:  gp_exp_bit <= 1'b1;
      5'h1e:  gp_exp_bit <= 1'b0;
      5'h1f:  gp_exp_bit <= 1'b0;
      default:gp_exp_bit <= 1'bX;
    endcase
  end
endmodule
