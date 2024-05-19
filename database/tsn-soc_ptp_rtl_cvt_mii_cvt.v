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
 * convert mii to/from gmii-like interface
-*/

`include "ptpv2_defines.v"

module mii_cvt (
    input                clk  ,
    input                rst_n,

    input                mii_mode_i,  //0:ge, 1: 100m/10m ethernet
    output               clk_en_o  ,

    //mii input (muxed with gmii input)
    input                mii_en_i,
    input                mii_er_i,
    input  [7:0]         mii_d_i ,
    
    //gmii-like output converted from mii input
    output               gmii_en_o,
    output               gmii_er_o,
    output [7:0]         gmii_d_o ,

    //gmii-like input
    input                gmii_en_i, 
    input                gmii_er_i,
    input  [7:0]         gmii_d_i ,

    //mii output converted from gmii-like input (muxed with gmii output)
    output               mii_en_o,
    output               mii_er_o,
    output [7:0]         mii_d_o ,   

    output               nibble_slide_o      //for latency correction in mii mode conversion   
);
    //generate clock enable signal
    reg  clk_en;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) 
            clk_en <= 0;
        else 
            clk_en <= ~clk_en;
    end
    assign clk_en_o = (mii_mode_i == 0) ? 1 : clk_en;

    //++
    //convert mii signal to gmii-like signal
    //--
    reg         mii_en_d1;
    reg         mii_er_d1;
    reg [7:0]   mii_d_d1;

    wire frm_start = mii_en_i &  (~mii_en_d1);
    wire frm_end   = mii_en_d1 & (~mii_en_i);
    
    reg frm_start_d1, frm_end_d1;

    always @(posedge clk) begin
        mii_en_d1 <= mii_en_i;   
        mii_er_d1 <= mii_er_i;
        mii_d_d1  <= mii_d_i ;

        frm_start_d1 <= frm_start;
        frm_end_d1 <= frm_end;
    end

    //mii to gmii-like conversion
    reg [7:0]     fe_oct, fe_oct_d1;
    reg           fe_en , fe_en_d1 ;
    reg           fe_er , fe_er_d1 ;

    reg  nibble_align;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) 
            nibble_align <= 0;
        else if(mii_en_i == 1)
            nibble_align <= ~nibble_align;
        else if(frm_end == 1)
            nibble_align <= 0;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fe_oct_d1 <= 8'h0;
            fe_en_d1  <= 0;
            fe_er_d1  <= 0;
        end
        else begin
            fe_oct_d1 <= fe_oct;
            fe_en_d1  <= fe_en;
            fe_er_d1  <= fe_er;
        end
    end

    always @(*) begin 
      if((mii_er_i == 1 || mii_er_d1 == 1) && nibble_align == 1) begin
          fe_oct = {mii_d_i[3:0], mii_d_d1[3:0]};
          fe_en  = mii_en_i;
          fe_er  = 1;
      end
      else if(mii_en_i == 1 && nibble_align == 1) begin
          fe_oct = {mii_d_i[3:0], mii_d_d1[3:0]};
          fe_en  = 1;
          fe_er  = 0;
      end
      else if (mii_en_i == 1)begin
          fe_oct = fe_oct_d1; 
          fe_en  = fe_en_d1 ;
          fe_er  = fe_er_d1 ;
      end
      else begin
          fe_oct = mii_d_i; 
          fe_en  = mii_en_i;
          fe_er  = mii_er_i;
      end
    end

    //generate gmii-like output
    reg         gmii_en_out;
    reg         gmii_er_out;
    reg [7:0]   gmii_d_out ;  
    reg    use_d1;

    always @(posedge clk or negedge rst_n) begin
      if(!rst_n) 
          use_d1 <= 0;
      else if(frm_start == 1 && clk_en == 0) 
          use_d1 <= 1;
      else if((frm_start == 1 && clk_en == 1) || frm_end_d1 == 1) 
          use_d1 <= 0;
    end
    
    assign nibble_slide_o = use_d1;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            gmii_en_out <= 0;
            gmii_er_out <= 0;
            gmii_d_out  <= 8'h0;
        end
        else if(use_d1 == 1) begin
            gmii_en_out <= fe_en_d1;
            gmii_er_out <= fe_er_d1;
            gmii_d_out  <= fe_oct_d1;
        end
        else  begin
            gmii_en_out <= fe_en;
            gmii_er_out <= fe_er;
            gmii_d_out  <= fe_oct;
        end
    end

    assign gmii_en_o = (mii_mode_i == 0) ? mii_en_i : gmii_en_out; 
    assign gmii_er_o = (mii_mode_i == 0) ? mii_er_i : gmii_er_out; 
    assign gmii_d_o  = (mii_mode_i == 0) ? mii_d_i  : gmii_d_out ;   

    //++
    //convert gmii-like signals to mii
    //--
    reg          gmii_en_d1; 
    reg          gmii_er_d1;
    reg [7:0]    gmii_d_d1 ;

    always @(posedge clk) begin
        gmii_en_d1 <= gmii_en_i;
        gmii_er_d1 <= gmii_er_i;
        gmii_d_d1  <= gmii_d_i ;
    end

    reg          mii_en_out;
    reg          mii_er_out;
    reg [7:0]    mii_d_out ;   

    //gmii-like to mii conversion
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            mii_en_out <= 0;
            mii_er_out <= 0;
            mii_d_out  <= 8'h0;   
        end
        else if(clk_en == 1 && gmii_en_i == 1) begin
            mii_en_out <= gmii_en_i;
            mii_er_out <= gmii_er_i;
            mii_d_out  <= {4'h0, gmii_d_i[3:0]};   
        end
        else if(clk_en == 0 && gmii_en_d1 == 1)begin
            mii_en_out <= gmii_en_d1;
            mii_er_out <= gmii_er_d1;
            mii_d_out  <= {4'h0, gmii_d_d1[7:4]};   
        end
        else begin
            mii_en_out <= gmii_en_i;
            mii_er_out <= gmii_er_i;
            mii_d_out  <= gmii_d_i ;   
        end
    end

    assign mii_en_o = (mii_mode_i == 0) ? gmii_en_i : mii_en_out; 
    assign mii_er_o = (mii_mode_i == 0) ? gmii_er_i : mii_er_out; 
    assign mii_d_o  = (mii_mode_i == 0) ? gmii_d_i  : mii_d_out ;   

endmodule
