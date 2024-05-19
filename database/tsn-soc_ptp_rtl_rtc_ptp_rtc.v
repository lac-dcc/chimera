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
 *  real time counter for ptpv2
-*/

`include "ptpv2_defines.v"

module ptp_rtc (
    input                rtc_clk,
    input                rtc_rst_n,          //async. reset, active low
                         
    input  [31:0]        tick_inc_i,         //tick increment value, default to 6.26 format unsigned nano seconds
    input  signed [31:0] ns_offset_i,        //nanoseconds offset
    input  signed [47:0] sc_offset_i,        //seconds offset
    input                offset_valid_i,     //offset value is valid, one clock pulse
    input                clear_rtc_i,        //clear rtc to 0, active high pulse
                         
    output [79:0]        rtc_std_o,          //48 bits seconds + 32 bits nanoseconds
    output [15:0]        rtc_fns_o           //fractional nanoseconds of current time
);  
    wire  [63:0] zero_dword = 64'b0;
                         
    //counter for nanosecond including fractional nanosecond
    reg  [`NSC_W-1:0]     ns_counter;
    //wire [`NSC_W-1:0]     ns_counter_p1;
    wire [`NSC_W-1:0]     ns_contrled_rtc;
    wire [`NSC_W-1:0]     ns_synced_rtc; 
    wire signed [32:0]    tmp_ns, tmp_ns1;
    reg  signed [32:0]    tmp_ns_d1;
             
    //counter for seconds
    reg  [47:0]          sc_counter;
    wire [47:0]          sc_counter_p1;
    wire [47:0]          sc_contrled_rtc;
    wire [47:0]          sc_synced_rtc;
    wire signed [47:0]   tmp_sc;

    reg                  offset_adjust;
    reg  [31:0]          tick_inc_d1;  

    //synchronize related control signals to rtc_clk domain
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            tick_inc_d1  <= 32'h0;
        else
            tick_inc_d1  <= tick_inc_i; 
    end

    //++
    //counter operation for nanosecond
    //--
    reg    ns_wrap_around_flag, ns_wrap_around_flag_d1, ns_wrap_around_flag_d2;
    wire   ns_wrap_around_flag_p1 = (ns_contrled_rtc[`NSC_W-1:`FNS_W] > $unsigned(`SC2NS-1));

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            ns_wrap_around_flag <= 0;
        else if(ns_wrap_around_flag == 1'b1 || ns_wrap_around_flag_d1 == 1'b1) //do not toggle wrap-around conditions.
            ns_wrap_around_flag <= 0;
        else
            ns_wrap_around_flag <= ns_wrap_around_flag_p1;
    end

    //generate offset adjust signals, make sure that do not adjust offset when wrap around occurs 
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            {ns_wrap_around_flag_d1, ns_wrap_around_flag_d2} <= 2'b0;
        end
        else begin
            {ns_wrap_around_flag_d1, ns_wrap_around_flag_d2} <= {ns_wrap_around_flag, ns_wrap_around_flag_d1} ;
        end
    end

    reg  adjust_retain;
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            adjust_retain <= 1'b0;
        else if((ns_wrap_around_flag_p1 | ns_wrap_around_flag | ns_wrap_around_flag_d1 | ns_wrap_around_flag_d2) & offset_valid_i)
            adjust_retain <= 1'b1;
        else if(offset_adjust == 1'b1)
            adjust_retain <= 1'b0;
    end

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            offset_adjust <= 1'b0;
        else if(ns_wrap_around_flag_p1 | ns_wrap_around_flag | ns_wrap_around_flag_d1 | ns_wrap_around_flag_d2)
            offset_adjust <= 1'b0;
        else if(offset_adjust == 1'b1) //do not toggle offset adjust signal
            offset_adjust <= 1'b0;
        else if(adjust_retain == 1'b1)
            offset_adjust <= 1'b1;
        else
            offset_adjust <= offset_valid_i;
    end

    //controlled nanosecond increment
    assign ns_contrled_rtc = ns_counter + {zero_dword[`NSC_W-33:0], tick_inc_i};
    
    reg [`NSC_W-1:0]   ns_contrled_reg;
    //if no wrap-around occur,  ns_contrled_reg = ns_contrled_rtc
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            ns_contrled_reg <= 0;
        else
            ns_contrled_reg <= ns_counter + {zero_dword[`NSC_W-34:0], tick_inc_i, 1'b0};  //+ 2*tick_inc
    end
    
    assign tmp_ns = $signed({1'b0, ns_contrled_reg[`NSC_W-1:`FNS_W]})+ $signed({ns_offset_i[31], ns_offset_i});

    //to solve timing problems
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n)
            tmp_ns_d1    <= 0;
        else
            tmp_ns_d1    <= tmp_ns;
    end
  
    //negative wrap around occurred?
    assign tmp_ns1 = tmp_ns_d1[32] ? tmp_ns_d1 + $signed({1'b0, `SC2NS}) : tmp_ns_d1;

    wire [`NSC_W-1:0] tmp_ns1_shift;
    assign tmp_ns1_shift[`NSC_W-1:`FNS_W] = tmp_ns1[31:0];
    assign tmp_ns1_shift[`FNS_W-1:0] = 0;
    
    assign ns_synced_rtc   = tmp_ns1_shift + {zero_dword[`NSC_W-33:0], tick_inc_i};  
    
    wire [`NSC_W-1:0] SC2NS_shift;
    assign SC2NS_shift[`NSC_W-1:`FNS_W] = `SC2NS;
    assign SC2NS_shift[`FNS_W-1:0] = 0;

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if (!rtc_rst_n)
            ns_counter <= 0; 
        else if(clear_rtc_i == 1'b1)
            ns_counter <= 0;
        else if(offset_adjust == 1'b1)
            ns_counter <= ns_synced_rtc;
        else if(ns_wrap_around_flag == 1'b1)
            ns_counter <= ns_contrled_reg - SC2NS_shift;
        else
            ns_counter <= ns_contrled_rtc;
        //else
        //    ns_counter <= ns_counter_p1;
    end

    //this cause Verilator command failed (return code=Segmentation fault)
    //assign ns_counter_p1 = (offset_adjust == 1'b1) ? ns_synced_rtc : 
    //                         ((ns_wrap_around_flag == 1'b1) ? ns_contrled_reg - SC2NS_shift :
    //                          ns_contrled_rtc);

    //++
    //counter operation for seconds
    //--
    wire  sc_inc = ns_wrap_around_flag;
    wire  sc_dec = tmp_ns_d1[32];
    wire  signed [47:0] synced_sc_dec = (sc_dec == 1'b1) ? -1 : 0;  

    assign sc_contrled_rtc = sc_counter + {47'b0, sc_inc};
    
    reg signed [47:0] sc_counter_sub1;
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if (!rtc_rst_n)
            sc_counter_sub1 <= 48'd0;
        else
            sc_counter_sub1 <= $signed(sc_counter[47:0]) + synced_sc_dec;
    end

    assign tmp_sc = sc_counter_sub1 + $signed(sc_offset_i);  

    assign sc_synced_rtc   = tmp_sc[47:0];
  
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if (!rtc_rst_n)
            sc_counter <= 48'd0;  
        else if(clear_rtc_i == 1'b1)
            sc_counter <= 48'd0;
        else
            sc_counter <= sc_counter_p1;
    end
 
    assign sc_counter_p1 = (offset_adjust == 1'b1) ? sc_synced_rtc : sc_contrled_rtc ;
    
    //output of real time counter 
    assign rtc_std_o = {sc_counter[47:0], ns_counter[`NSC_W-1:`FNS_W]};
    assign rtc_fns_o = ns_counter[`FNS_W-1:`FNS_W-16];
  
endmodule
