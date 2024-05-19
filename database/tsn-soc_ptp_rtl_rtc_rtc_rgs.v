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
 * rtc register interface for software
-*/

`include "ptpv2_defines.v"

module rtc_rgs (
    //32 bits on chip bus access interface
    input               bus2ip_clk    ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,    //active high
    input               bus2ip_wr_ce_i ,    //active high
    output reg [31:0]   ip2bus_data_o  ,  

    //register i/f
    input  [79:0]       rtc_std_i,          //current time (48 bits seconds + 32 bits nanoseconds)
    input  [15:0]       rtc_fns_i,          //fractional nanoseconds of current time
    input  [79:0]       pts_std_i,          //timestamp of pps input (second+nanosecond)
    input  [15:0]       pts_fns_i,          //timestamp of pps input (fractional nanosecond) 

    output reg [31:0]   tick_inc_o,         //tick increment value, default to 6.26 format unsigned nano seconds
    output reg [31:0]   ns_offset_o,        //nanoseconds offset
    output reg [47:0]   sc_offset_o,        //seconds offset
    output reg          offset_valid_o,     //offset value is valid, one clock pulse
    output reg          clear_rtc_o,        //clear rtc to 0, active high pulse
    
    output reg [31:0]   pps_width_o,
    output reg          intxms_sel_o        //0: 10ms; 1: 7.8125ms=1/128ms
);

    parameter BLK_ADDR = `RTC_BLK_ADDR;

    //++
    //bus read operation
    //--

    reg [31:0] ip2bus_data;

    always @(*) begin
        ip2bus_data = 32'h0;

        if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i[31:8] == BLK_ADDR) begin   //base address to rtc
            case(bus2ip_addr_i[7:0])    //deal with offset address
                `RTC_CTL_ADDR:      ip2bus_data = {29'h0, intxms_sel_o, clear_rtc_o, offset_valid_o};
                `TICK_INC_ADDR:     ip2bus_data = tick_inc_o[31:0];
                `NS_OFST_ADDR:      ip2bus_data = ns_offset_o[31:0];
                `SC_OFST_ADDR0:     ip2bus_data = {16'b0, sc_offset_o[47:32]};
                `SC_OFST_ADDR1:     ip2bus_data = sc_offset_o[31:0];         

                `CUR_TM_ADDR0:      ip2bus_data = rtc_std_i[79:48];         
                `CUR_TM_ADDR1:      ip2bus_data = rtc_std_i[47:16];  
                `CUR_TM_ADDR2:      ip2bus_data = {rtc_std_i[15:0], rtc_fns_i};  

                `PTS_ADDR0:         ip2bus_data = pts_std_i[79:48]; 
                `PTS_ADDR1:         ip2bus_data = pts_std_i[47:16]; 
                `PTS_ADDR2:         ip2bus_data = {pts_std_i[15:0], pts_fns_i}; 
        
                `PPS_W_ADDR:        ip2bus_data = pps_width_o[31:0];  
                default:            ip2bus_data = 32'h0;
            endcase                        
        end   
    end

    //registered output 
    always @(posedge bus2ip_clk) ip2bus_data_o <= ip2bus_data;
    
    //++
    //bus write operation
    //--

    //self-clearing registers
    reg   offset_valid;
    reg   clear_rtc;

    //delayed self-clearing control signals
    reg   offset_valid_d1,  offset_valid_d2;
    reg   clear_rtc_d1, clear_rtc_d2;
  
    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            offset_valid  <= 0;
            clear_rtc     <= 0;
            intxms_sel_o  <= 0;

            tick_inc_o    <= 32'h0;
            ns_offset_o   <= 32'h0;
            sc_offset_o   <= 48'h0;
            pps_width_o   <= 32'h0;
        end
        else if(bus2ip_wr_ce_i == 1'b1 && bus2ip_addr_i[31:8] == BLK_ADDR) begin   //deal with base address
            case(bus2ip_addr_i[7:0]) //deal with offset address
                `RTC_CTL_ADDR:   {intxms_sel_o, clear_rtc, offset_valid} <= bus2ip_data_i[2:0];  //rtc control register
                `TICK_INC_ADDR:  tick_inc_o  <= bus2ip_data_i[31:0];
                `NS_OFST_ADDR:   ns_offset_o <= bus2ip_data_i[31:0];
                `SC_OFST_ADDR0:  sc_offset_o[47:32]  <= bus2ip_data_i[15:0];
                `SC_OFST_ADDR1:  sc_offset_o[31:0]   <= bus2ip_data_i[31:0];
                `PPS_W_ADDR:     pps_width_o <= bus2ip_data_i[31:0];
                default: ;
            endcase  
        end
        else begin  //clear self-clearing register bits
            if(offset_valid_d2 == 1'b1)       offset_valid   <= 0 ;
            if(clear_rtc_d2 == 1'b1 )         clear_rtc      <= 0 ;
        end
    end

    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            {offset_valid_d1,  offset_valid_d2}          <= 2'b0;
            {clear_rtc_d1, clear_rtc_d2}                 <= 2'b0;
        end
        else begin
            {offset_valid_d1,  offset_valid_d2}          <= {offset_valid,  offset_valid_d1};
            {clear_rtc_d1, clear_rtc_d2}                 <= {clear_rtc, clear_rtc_d1};
        end
    end
  
    //generate output signals for self-clearing register bits
    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            offset_valid_o     <= 0;
            clear_rtc_o        <= 0;
        end
        else begin
            offset_valid_o     <= offset_valid & (~offset_valid_d2);
            clear_rtc_o        <= clear_rtc & (~clear_rtc_d2) ;
        end
    end

endmodule
