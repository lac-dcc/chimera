// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_seq_mux
 * @file cmd_seq_mux.v
 * @date 2015-06-29  
 * @author Andrey Filippov     
 *
 * @brief Command multiplexer from 4 channels of frame-based command
 * sequencers.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_seq_mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_seq_mux.v is distributed in the hope that it will be useful,
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

module  cmd_seq_mux#(
    parameter CMDSEQMUX_ADDR =   'h702, // only status control
    parameter CMDSEQMUX_MASK =   'h7ff,
    parameter CMDSEQMUX_STATUS = 'h38,
    parameter AXI_WR_ADDR_BITS=14
)(
    input                             mrst,         // global system reset
    input                             mclk,         // global system clock
    // programming interface
    input                       [7:0] cmd_ad,       // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                             cmd_stb,      // strobe (with first byte) for the command a/d
    output                      [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                            status_rq,    // input request to send status downstream
    input                             status_start, // Acknowledge of the first status packet byte (address)
    
    // Sensor channel 0
    input                      [ 3:0] frame_num0,   // @posedge mclk
    input      [AXI_WR_ADDR_BITS-1:0] waddr0,       // write address, valid with wr_en_out
    input                             wr_en0,       // write enable 
    input                      [31:0] wdata0,       // write data, valid with waddr_out and wr_en_out
    output                            ackn0,        // command sequencer address/data accepted
    input                             is0,          // interrupt status (not masked) 
    input                             im0,          // interrupt mask 
    // Sensor channel 1
    input                      [ 3:0] frame_num1,   // @posedge mclk
    input      [AXI_WR_ADDR_BITS-1:0] waddr1,       // write address, valid with wr_en_out
    input                             wr_en1,       // write enable 
    input                      [31:0] wdata1,       // write data, valid with waddr_out and wr_en_out
    output                            ackn1,        // command sequencer address/data accepted
    input                             is1,          // interrupt status (not masked) 
    input                             im1,          // interrupt mask 
    // Sensor channel 2
    input                      [ 3:0] frame_num2,   // @posedge mclk
    input      [AXI_WR_ADDR_BITS-1:0] waddr2,       // write address, valid with wr_en_out
    input                             wr_en2,       // write enable 
    input                      [31:0] wdata2,       // write data, valid with waddr_out and wr_en_out
    output                            ackn2,        // command sequencer address/data accepted
    input                             is2,          // interrupt status (not masked) 
    input                             im2,          // interrupt mask 
    // Sensor channel 3
    input                      [ 3:0] frame_num3,   // @posedge mclk
    input      [AXI_WR_ADDR_BITS-1:0] waddr3,       // write address, valid with wr_en_out
    input                             wr_en3,       // write enable 
    input                      [31:0] wdata3,       // write data, valid with waddr_out and wr_en_out
    output                            ackn3,        // command sequencer address/data accepted
    input                             is3,          // interrupt status (not masked) 
    input                             im3,          // interrupt mask 
    // mux output
    output reg [AXI_WR_ADDR_BITS-1:0] waddr_out,    // write address, valid with wr_en_out
    output                            wr_en_out,    // write enable 
    output reg                 [31:0] wdata_out,    // write data, valid with waddr_out and wr_en_out
    input                             ackn_out      // command sequencer address/data accepted
);
    wire  [3:0] wr_rq = {wr_en3, wr_en2, wr_en1, wr_en0};
//    wire  [3:0] wr_en = {wr_en3 & ~ackn3, wr_en2 & ~ackn2, wr_en1 & ~ackn1, wr_en0 & ~ackn0};
    wire  [3:0] wr_en = wr_rq & ~ackn_r; // write enable antil acknowledged?
    //ackn_r
    wire [15:0] pri_one_rr; // round robin priority
    wire  [3:0] pri_one;
    reg   [1:0] chn_r = 0; // last served channel
    wire        rq_any;
    wire  [1:0] pri_enc_w;
    reg         full_r;
    wire        ackn_w;  //pre-acknowledge of one of the channels
    reg   [3:0] ackn_r;
    
    wire  [3:0] is = {is3, is2, is1, is0};
    wire  [3:0] im = {im3, im2, im1, im0};
    
    assign pri_one_rr = {wr_en[3] & ~(|wr_en[2:0]), wr_en[2]&~(|wr_en[1:0]),          wr_en[1] &                  wr_en[0],  wr_en[0],
                         wr_en[3],                  wr_en[2]&~(|wr_en[1:0])&wr_en[3], wr_en[1] & ~  wr_en[3]    & wr_en[0],  wr_en[0] & ~  wr_en[3],
                         wr_en[3] & ~  wr_en[2],    wr_en[2],                         wr_en[1] & ~(|wr_en[3:2]) & wr_en[0],  wr_en[0] & ~(|wr_en[3:2]),
                         wr_en[3] & ~(|wr_en[2:1]), wr_en[2] & ~wr_en[1],             wr_en[1],                              wr_en[0] & ~(|wr_en[3:1])};


    assign pri_one = pri_one_rr[chn_r * 4 +: 4];
    assign rq_any= |wr_en; // Loop?
//    assign rq_any= |wr_rq;
    assign pri_enc_w ={pri_one[3] | pri_one[2],
                       pri_one[3] | pri_one[1]};
    assign wr_en_out = full_r;
    assign {ackn3, ackn2, ackn1, ackn0} = ackn_r;               
    assign ackn_w = rq_any && (!full_r || ackn_out);
    
    always @(posedge mclk) begin
        if (mrst)           full_r <= 0;
        else if (rq_any)    full_r <= 1;
        else if (ackn_out)  full_r <= 0;
        
        if (mrst)           ackn_r <=0;
        else                ackn_r <= {4{ackn_w}} & { pri_enc_w[1] &  pri_enc_w[0],
                                                      pri_enc_w[1] & ~pri_enc_w[0],
                                                     ~pri_enc_w[1] &  pri_enc_w[0],
                                                     ~pri_enc_w[1] & ~pri_enc_w[0]};
    end
        
    always @(posedge mclk) begin
    
        if      (mrst)   chn_r <= 0;        // let it always start from 0
        else if (ackn_w) chn_r <= pri_enc_w;
            
        if (ackn_w) begin
            case (pri_enc_w)
                2'h0:begin
                    waddr_out <= waddr0;
                    wdata_out <= wdata0;
                end 
                2'h1:begin
                    waddr_out <= waddr1;
                    wdata_out <= wdata1;
                end 
                2'h2:begin
                    waddr_out <= waddr2;
                    wdata_out <= wdata2;
                end 
                2'h3:begin
                    waddr_out <= waddr3;
                    wdata_out <= wdata3;
                end 
            endcase
        
        end
    end
    
    // Only command is to program status, status combines frame numbers (4 bit each)
    wire [7:0] cmd_data;
    wire       cmd_status;
    cmd_deser #(
        .ADDR       (CMDSEQMUX_ADDR),
        .ADDR_MASK  (CMDSEQMUX_MASK),
        .NUM_CYCLES (3), // 6), // TODO: Is it OK to specify less bits than on transmit side? Seems yes 
        .ADDR_WIDTH (1),
        .DATA_WIDTH (8) //,32)
        
    ) cmd_deser_32bit_i (
        .rst        (1'b0),        //rst),         // input
        .clk        (mclk),        // input
        .srst       (mrst),        // input
        .ad         (cmd_ad),      // input[7:0] 
        .stb        (cmd_stb),     // input
        .addr       (),            // output[0:0] 
        .data       (cmd_data),    // output[31:0] 
        .we         (cmd_status)   // output
    );
                      
    status_generate #(
        .STATUS_REG_ADDR     (CMDSEQMUX_STATUS),
        .PAYLOAD_BITS        (26),
        .REGISTER_STATUS     (1)
    ) status_generate_cmd_seq_mux_i (
        .rst           (1'b0),               //rst),         // input
        .clk           (mclk),               // input
        .srst          (mrst),               // input
        .we            (cmd_status),         // input
        .wd            (cmd_data[7:0]),      // input[7:0] 
        .status        ({im, is, frame_num3, frame_num2, frame_num1, frame_num0, 2'b0}), // input[18:0] // 2 LSBs - may add "real" status 
        .ad            (status_ad),          // output[7:0] 
        .rq            (status_rq),          // output
        .start         (status_start)        // input
    );



endmodule

