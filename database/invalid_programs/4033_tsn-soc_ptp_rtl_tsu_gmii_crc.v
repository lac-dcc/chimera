// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 *  crc recalculation for gmii-like interface.
-*/

`include "ptpv2_defines.v"

module gmii_crc (
    input               clk,                    //data clock
    input               rst_n,
    input               clk_en_i,               //for adapting to gmii/mii

    input               data_en_i, 
    input               data_er_i,
    input  [7:0]        data_i   ,  
    
    output reg          data_en_o,
    output reg          data_er_o,
    output reg [7:0]    data_o   ,

    input               efd_p4_i,               //end of frame, 4 samples before
    input  [10:0]       eth_count_i,
    input               rpl_flag_i              //replace original crc or not
);
`include "utils.v"

    reg efd_p3, efd_p2, efd_p1, efd;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            {efd_p3, efd_p2, efd_p1, efd} <= 4'b0;
        else if(clk_en_i)
            {efd_p3, efd_p2, efd_p1, efd} <= {efd_p4_i, efd_p3, efd_p2, efd_p1}; 
    end

    reg       calc_valid;
    reg       init;

    always @(*) begin
        calc_valid = data_en_i;
        init       = 0;
        
        if(eth_count_i < 11'd8) begin
            calc_valid = 0;
            init       = 1;
        end
        else if(efd_p4_i || efd_p3 || efd_p2 || efd_p1 || efd)  
            calc_valid = 0;  
    end

    //calculate crc
    reg [31:0]     current_crc;
    reg [31:0]     next_crc;
    reg [31:0]     crc_out;
    
    always @(*) begin
      next_crc = (calc_valid == 1) ? nextCRC32_D8(reverse_8b(data_i[7:0]), current_crc) : current_crc;
      crc_out = ~reverse_32b(next_crc);
    end
    
    always @(posedge clk or negedge rst_n) begin
      if(!rst_n)
        current_crc <= 32'hffff_ffff;
      else if(clk_en_i) begin
        if(init)
          current_crc <= 32'hffff_ffff;
        else
          current_crc <= next_crc;
      end
    end

    //replace crc, generate output gmii data
    reg          data_en_out;
    reg          data_er_out;
    reg [7:0]    data_out   ;

    always @(*) begin
        data_en_out = data_en_i;
        data_er_out = data_er_i;
        data_out    = data_i   ;

        if(rpl_flag_i == 1) begin
            if(efd_p4_i == 1'b1)
                data_out = crc_out[7:0];
            else if(efd_p3 == 1'b1)
                data_out = crc_out[15:8];
            else if(efd_p2 == 1'b1)
                data_out = crc_out[23:16];
            else if(efd_p1 == 1'b1)
                data_out = crc_out[31:24];
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_en_o <= 0;
            data_er_o <= 0;
            data_o    <= 8'h0;
        end
        else if(clk_en_i) begin
            data_en_o <= data_en_out;
            data_er_o <= data_er_out;
            data_o    <= data_out   ;
        end
    end
endmodule
