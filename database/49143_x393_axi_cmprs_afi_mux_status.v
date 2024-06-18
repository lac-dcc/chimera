// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_afi_mux_status
 * @file cmprs_afi_mux_status.v
 * @date 2015-06-28  
 * @author Andrey Filippov     
 *
 * @brief prepare and send per-channel chunk pointer information as status
 * Using 4 consecutive locations. Each channel can provide one of the 4 pointers:
 * frame pointer in the write channel, current chunk pointer in the write channel
 * and the same for the write response channel (confirmed written to the system
 * memory
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_afi_mux_status.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_afi_mux_status.v is distributed in the hope that it will be useful,
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

module  cmprs_afi_mux_status #(
    parameter CMPRS_AFIMUX_STATUS_REG_ADDR=     'h20,  //Uses 4 locations TODO: assign valid address
    parameter CMPRS_AFIMUX_WIDTH =              26, // maximal for status: currently only works with 26)
    parameter CMPRS_AFIMUX_CYCBITS =            3
 ) (
//    input                          rst,
    input                          hclk,         // global clock to run axi_hp @ 150MHz, shared by all compressor channels
    input                          mclk,         // for command/status
    input                          mrst,      // @posedge mclk, sync reset
    input                          hrst,      // @posedge xclk, sync reset
    // mclk domain
    input                   [15:0] cmd_data,     //  
    input                   [ 1:0] cmd_a,        //
    input                          status_we,    //
    input                          mode_we,      //
      
    output                   [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                         status_rq,    // input request to send status downstream
    input                          status_start, // Acknowledge of the first status packet byte (address)
    // hclk domain
    input                          en,           // 1- enable, 0 - reset
    output reg               [3:0] chunk_ptr_ra, // full pointer address - {eof,wresp,chn[1:0]}
    input [CMPRS_AFIMUX_WIDTH-1:0] chunk_ptr_rd  // pointer data
);
   localparam MODE_WIDTH = 15;
    reg             [MODE_WIDTH-1:0] mode_data_mclk; // some bits unused
    wire                             mode_we_hclk;
    reg                        [7:0] mode_hclk;
    reg                        [1:0] index;
    reg   [CMPRS_AFIMUX_CYCBITS-1:0] cntr;
    reg     [CMPRS_AFIMUX_WIDTH-1:0] chunk_ptr_hclk;  // pointer data
    reg                        [1:0] chunk_chn_hclk;  // pointer channel
    
    reg [4 * CMPRS_AFIMUX_WIDTH-1:0] status_data;
    
    wire stb_w;
    reg  stb_r;
    wire stb_mclk;
    
    wire [31:0] ad;
    wire  [3:0] rq;
    wire  [3:0] start;
    
    assign stb_w = en && (cntr==0);
    always @ (posedge mclk) begin
        if (mode_we) mode_data_mclk <= cmd_data[MODE_WIDTH-1:0];
    end

    always @ (posedge hclk) begin
        if (mode_we_hclk) begin 
            if (mode_data_mclk[ 2]) mode_hclk[1:0] <= mode_data_mclk[ 1: 0];
            if (mode_data_mclk[ 6]) mode_hclk[3:2] <= mode_data_mclk[ 5: 4];
            if (mode_data_mclk[10]) mode_hclk[5:4] <= mode_data_mclk[ 9: 8];
            if (mode_data_mclk[14]) mode_hclk[7:6] <= mode_data_mclk[13:12];
        end
            
       if (stb_mclk) status_data[chunk_chn_hclk * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH] <= chunk_ptr_hclk;
//       if (stb_mclk && (chunk_chn_hclk == 2'h0)) status_data[0 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH] <= chunk_ptr_hclk;
//       if (stb_mclk && (chunk_chn_hclk == 2'h1)) status_data[1 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH] <= chunk_ptr_hclk;
//       if (stb_mclk && (chunk_chn_hclk == 2'h2)) status_data[2 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH] <= chunk_ptr_hclk;
//       if (stb_mclk && (chunk_chn_hclk == 2'h3)) status_data[3 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH] <= chunk_ptr_hclk;
        
        if (!en) {index,cntr} <= 0;
        else     {index,cntr} <= {index,cntr} + 1;
        
        if (stb_w) begin
            chunk_ptr_ra[1:0] <= index;
            case (index) 
                2'h0: chunk_ptr_ra[3:2] <= mode_hclk[1:0] ^ 1; // so 0 will be eof, internal
                2'h1: chunk_ptr_ra[3:2] <= mode_hclk[3:2] ^ 1;
                2'h2: chunk_ptr_ra[3:2] <= mode_hclk[5:4] ^ 1;
                2'h3: chunk_ptr_ra[3:2] <= mode_hclk[7:6] ^ 1;
            endcase
        end
        stb_r <= stb_w;
        if (stb_r) begin
            chunk_ptr_hclk <= {chunk_ptr_rd[23:0],chunk_ptr_rd[25:24]}; // bits 0,1 are sent to 25:24
            chunk_chn_hclk <= index;
        end
        
    end
    
    pulse_cross_clock mode_we_hclk_i (.rst(mrst), .src_clk(mclk), .dst_clk(hclk), .in_pulse(mode_we), .out_pulse(mode_we_hclk),.busy());
    pulse_cross_clock stb_mclk_i     (.rst(hrst), .src_clk(hclk), .dst_clk(mclk), .in_pulse(stb_r),   .out_pulse(stb_mclk),    .busy());
    status_router4 status_router4_i (
        .rst       (1'b0), // rst),            // input
        .clk       (mclk),           // input
        .srst      (mrst),            // input
        .db_in0    (ad[0 * 8 +: 8]), // input[7:0] 
        .rq_in0    (rq[0]),          // input
        .start_in0 (start[0]),       // output

        .db_in1    (ad[1 * 8 +: 8]), // input[7:0] 
        .rq_in1    (rq[1]),          // input
        .start_in1 (start[1]),       // output
        .db_in2    (ad[2 * 8 +: 8]), // input[7:0] 
        .rq_in2    (rq[2]),          // input
        .start_in2 (start[2]),       // output
        .db_in3    (ad[3 * 8 +: 8]), // input[7:0] 
        .rq_in3    (rq[3]),          // input
        .start_in3 (start[3]),       // output
        .db_out    (status_ad),      // output[7:0] 
        .rq_out    (status_rq),      // output
        .start_out (status_start)    // input
    );

    status_generate #(
        .STATUS_REG_ADDR  (CMPRS_AFIMUX_STATUS_REG_ADDR+0),
        .PAYLOAD_BITS     (CMPRS_AFIMUX_WIDTH)
    ) status_generate0_i (
        .rst     (1'b0),             //rst),                                                       // input
        .clk     (mclk),                                                      // input
        .srst    (mrst),                                                      // input
        .we      (status_we && (cmd_a==0)),                                   // input
        .wd      (cmd_data[7:0]),                                             // input[7:0] 
        .status  (status_data[0 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH]), // input[25:0] 
        .ad      (ad[0 * 8 +: 8]),                                            // output[7:0] 
        .rq      (rq[0]),                                                     // output
        .start   (start[0])                                                   // input
    );

    status_generate #(
        .STATUS_REG_ADDR  (CMPRS_AFIMUX_STATUS_REG_ADDR+1),
        .PAYLOAD_BITS     (CMPRS_AFIMUX_WIDTH)
    ) status_generate1_i (
        .rst     (1'b0), //rst),                                                       // input
        .clk     (mclk),                                                      // input
        .srst    (mrst),                                                      // input
        .we      (status_we && (cmd_a==1)),                                   // input
        .wd      (cmd_data[7:0]),                                             // input[7:0] 
        .status  (status_data[1 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH]), // input[25:0] 
        .ad      (ad[1 * 8 +: 8]),                                            // output[7:0] 
        .rq      (rq[1]),                                                     // output
        .start   (start[1])                                                   // input
    );

    status_generate #(
        .STATUS_REG_ADDR  (CMPRS_AFIMUX_STATUS_REG_ADDR+2),
        .PAYLOAD_BITS     (CMPRS_AFIMUX_WIDTH)
    ) status_generate2_i (
        .rst     (1'b0), //rst),                                                       // input
        .clk     (mclk),                                                      // input
        .srst    (mrst),                                                      // input
        .we      (status_we && (cmd_a==2)),                                   // input
        .wd      (cmd_data[7:0]),                                             // input[7:0] 
        .status  (status_data[2 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH]), // input[25:0] 
        .ad      (ad[2 * 8 +: 8]),                                            // output[7:0] 
        .rq      (rq[2]),                                                     // output
        .start   (start[2])                                                   // input
    );

    status_generate #(
        .STATUS_REG_ADDR  (CMPRS_AFIMUX_STATUS_REG_ADDR+3),
        .PAYLOAD_BITS     (CMPRS_AFIMUX_WIDTH)
    ) status_generate3_i (
        .rst     (1'b0), // rst),                                                       // input
        .clk     (mclk),                                                      // input
        .srst    (mrst),                                                      // input
        .we      (status_we && (cmd_a==3)),                                   // input
        .wd      (cmd_data[7:0]),                                             // input[7:0] 
        .status  (status_data[3 * CMPRS_AFIMUX_WIDTH +: CMPRS_AFIMUX_WIDTH]), // input[25:0] 
        .ad      (ad[3 * 8 +: 8]),                                            // output[7:0] 
        .rq      (rq[3]),                                                     // output
        .start   (start[3])                                                   // input
    );

endmodule

