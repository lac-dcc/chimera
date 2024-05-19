// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mult_saxi_wr_inbuf
 * @file mult_saxi_wr_inbuf.v
 * @date 2015-07-11  
 * @author Andrey Filippov     
 *
 * @brief Channel buffer with width conversion to 32 to use with mult_saxi_wr
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * mult_saxi_wr_inbuf.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mult_saxi_wr_inbuf.v is distributed in the hope that it will be useful,
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

module  mult_saxi_wr_inbuf#(
    parameter MULT_SAXI_HALF_BRAM_IN =      1,     // 0 - use full 36Kb BRAM for the buffer, 1 - use just half
    parameter MULT_SAXI_BSLOG =             4,     // number of bits to represent burst size (4 - b.s. = 16, 0 - b.s = 1)
    parameter MULT_SAXI_WLOG =              4      // number of bits for the input data ( 3 - 8 bit, 4 - 16-bit, 5 - 32-bit
)(
    input                               mclk,        // system clock
    input                               en,          // enable channel,  0 - reset FIFO @mclk

    // Input data port. No check on buffer overflow
    input                               iclk,        // input data clock
    input [(1 << MULT_SAXI_WLOG) - 1:0] data_in,     // @posedge iclk input data
    input                               valid,       // @posedge iclk input data valid

    output reg                          has_burst,    // channel has at least 1 burst (should go down immediately after read_burst if no more data)
    input                               read_burst,   // request to read a burst of data from this channel
    output                       [31:0] data_out,     // data read from this channel
    output                              pre_valid_chn // data valid

);
    localparam INA_WIDTH =  (MULT_SAXI_HALF_BRAM_IN ? 14 : 15) - MULT_SAXI_WLOG;
    localparam OUTA_WIDTH = (MULT_SAXI_HALF_BRAM_IN ? 14 : 15) - 5;
    localparam INW_CNTR_WIDTH =  MULT_SAXI_BSLOG + 5 -MULT_SAXI_WLOG; // width of the input word counter (in a burst)
    localparam OUTW_CNTR_WIDTH = MULT_SAXI_BSLOG; // width of the output word counter (in a burst)
    localparam BURST_WIDTH = OUTA_WIDTH - OUTW_CNTR_WIDTH;
    
    reg                          en_iclk;
    reg     [INW_CNTR_WIDTH-1:0] inw_cntr;
    reg        [BURST_WIDTH-1:0] in_burst;
    reg    [OUTW_CNTR_WIDTH-1:0] outw_cntr;
    reg        [BURST_WIDTH-1:0] out_burst;
    reg          [BURST_WIDTH:0] num_out_bursts;
    
    wire         [INA_WIDTH-1:0] waddr = {in_burst,inw_cntr};
    wire        [OUTA_WIDTH-1:0] raddr = {out_burst,outw_cntr};
    
    wire                         put_burst_mclk;
    wire                         wr_last_word = valid && (&inw_cntr);
    
    wire                         re_last_word = buf_re[0] && (&outw_cntr);
    reg                    [1:0] buf_re;
    
    assign pre_valid_chn = buf_re[1];
    always @ (posedge iclk) begin
        en_iclk <= en;

        if   (!en_iclk) inw_cntr <= 0;
        else if (valid) inw_cntr <= inw_cntr + 1;
         
        if      (!en_iclk)     in_burst <= 0;
        else if (wr_last_word) in_burst <= in_burst + 1;
    end
    
    always @ (posedge mclk) begin
        if (!en) buf_re <= 0;
        else buf_re <= {buf_re[0], read_burst | (buf_re[0] & ~(&outw_cntr))};
        
        if      (!en)       outw_cntr <= 0;
        else if (buf_re[0]) outw_cntr <= outw_cntr + 1;
        
        if      (!en)          out_burst <= 0;
        else if (re_last_word) out_burst <= out_burst + 1;
        
        if      (!en)                            num_out_bursts <= 0;
        else if ( put_burst_mclk && !read_burst) num_out_bursts <= num_out_bursts + 1;
        else if (!put_burst_mclk &&  read_burst) num_out_bursts <= num_out_bursts - 1;
        
        if (!en)  has_burst <= 0;
        else has_burst <= (|num_out_bursts[BURST_WIDTH:1]) || (num_out_bursts[0] && !read_burst);
        
    end

    pulse_cross_clock #(.EXTRA_DLY(1)) put_burst_mclk_i (
            .rst(!en_iclk),
            .src_clk(iclk),
            .dst_clk(mclk),
            .in_pulse(wr_last_word),
            .out_pulse(put_burst_mclk),
            .busy());
    
    generate
        if (MULT_SAXI_HALF_BRAM_IN)
            ram18_var_w_var_r #(
                .COMMENT("mult_saxi_wr_inbuf_MULT_SAXI_HALF_BRAM_IN"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(MULT_SAXI_WLOG),
                .LOG2WIDTH_RD(5),
                .DUMMY(0)
            ) ram_var_w_var_r_i (
                .rclk      (mclk), // input
                .raddr     (raddr[8:0]), // input[9:0] 
                .ren       (buf_re[0]), // input
                .regen     (buf_re[1]), // input
                .data_out  (data_out), // output[31:0] 
                .wclk      (iclk), // input
                .waddr     (waddr[13-MULT_SAXI_WLOG:0]), // input[9:0] 
                .we        (valid), // input
                .web       (4'hf), // input[7:0] 
                .data_in   (data_in) // input[31:0] 
            );
        else
            ram_var_w_var_r #(
                .COMMENT("mult_saxi_wr_inbuf_not_MULT_SAXI_HALF_BRAM_IN"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(MULT_SAXI_WLOG),
                .LOG2WIDTH_RD(5),
                .DUMMY(0)
            ) ram_var_w_var_r_i (
                .rclk      (mclk), // input
                .raddr     ({raddr[OUTA_WIDTH-1],raddr[8:0]}), // {buf_ra[BRAM_A_WDTH-1],buf_ra[8:0]}), // input[9:0] 
                .ren       (buf_re[0]), // input
                .regen     (buf_re[1]), // input
                .data_out  (data_out), // output[31:0] 
                .wclk      (iclk), // input
                .waddr     ({waddr[INA_WIDTH-1],waddr[13-MULT_SAXI_WLOG:0]}), // {buf_wa[BRAM_A_WDTH-1],buf_wa[8:0]}), // input[9:0] 
                .we        (valid), // input
                .web       (8'hff), // input[7:0] 
                .data_in   (data_in) // input[31:0] 
            );
    endgenerate


endmodule

