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
 * rx ptp frame buffer 
 * for simplicity, just behavioral
-*/

`include "ptpv2_defines.v"

module rx_ptp_buf (
    //rx interface
    input               rx_clk,
    input               rx_rst_n,

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    output              int_rx_all_o,           //received frame besides PTP messages

    //32 bits on chip bus access interface
    input               bus2ip_clk   ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output reg [31:0]   ip2bus_data_o   
);
    parameter RX_BUF_BADDR = 32'h1000;
    reg  [7:0]  rcvd_frame[511:0];
    reg  [31:0] rd_buf[127:0]; //buffer to bus
    reg  [9:0]  eth_count;
    reg  [8:0]  frm_len;
    reg         wr_fin, wr_fin_z1, wr_fin_z2;
    reg  [8:0]  sof_pos;
    reg         get_sof_done;
    reg         rx_dv_z1;

    always @(posedge rx_clk) rx_dv_z1 <= rx_dv_i;

    //receiving process, behavioral, using block assignment
    always @(posedge rx_clk or negedge rx_rst_n) begin : GE_RCV_PROC
        if(!rx_rst_n) begin
            eth_count    = 0;
            frm_len      = 0;
            sof_pos      = 0;
            get_sof_done = 0;
            wr_fin       = 0;
        end
        else begin
            if(rx_dv_i == 1'b1) begin
                wr_fin = 0;

                rcvd_frame[eth_count[8:0]] = rxd_i[7:0];
                eth_count = eth_count + 1;

                if(rxd_i[7:0] == `SFD && get_sof_done == 1'b0) begin
                    sof_pos = eth_count[8:0];
                    get_sof_done = 1'b1;
                end
            end
            else if(rx_dv_i == 1'b0 && rx_dv_z1 == 1'b1) begin //end of frame
                frm_len   = eth_count[8:0] - sof_pos;
                wr_fin    = 1;
                eth_count = 0;
                get_sof_done = 0;
            end
        end  //else
    end

    always @(posedge rx_clk) {wr_fin_z1, wr_fin_z2} <= {wr_fin, wr_fin_z1};

    //transfer received frame data to read buffer
    always @(posedge rx_clk) begin : TO_RD_BUFF
        reg [8:0] i;
        integer   j;
    
        if(wr_fin_z1 & (~wr_fin_z2)) begin
            j = 0;
            for(i = sof_pos; i < frm_len+sof_pos; i = i+4) begin
                rd_buf[j] = {rcvd_frame[i+3], rcvd_frame[i+2], rcvd_frame[i+1], rcvd_frame[i]};
                j = j + 1;
            end //i
        end //if
    end

    //generate read clearing signal internally
    reg  [31:0]      bus2ip_addr_z1, bus2ip_addr_z2 ; 
    reg              bus2ip_rd_ce_z1 ;         //active high
    reg              read_clear, read_clear_z1 ; 
    wire             read_clear_pulse = read_clear & (~read_clear_z1);

    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            bus2ip_addr_z1 <= 32'h0;
            bus2ip_addr_z2 <= 32'h0;
            bus2ip_rd_ce_z1 <= 1'b0;
            read_clear_z1  <= 1'b0;
        end
        else begin
            bus2ip_addr_z1 <= bus2ip_addr_i;
            bus2ip_addr_z2 <= bus2ip_addr_z1;
            bus2ip_rd_ce_z1 <= bus2ip_rd_ce_i;
            read_clear_z1  <= read_clear  ;
        end
    end

    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n)
            read_clear <= 1'b0;
        else if(bus2ip_rd_ce_i == 1'b0 && bus2ip_rd_ce_z1 == 1'b1) //single read
            read_clear <= 1'b1;
        else if(bus2ip_addr_i != bus2ip_addr_z1 && bus2ip_rd_ce_i == 1'b1 && bus2ip_rd_ce_z1 == 1'b1) //continuous read and not the first one
            read_clear <= 1'b1;
        else if(read_clear_z1 == 1'b1)
            read_clear <= 1'b0;
    end

    //rx data ready signal, read clearing marks that data have been read out.
    reg  data_rdy, data_rdy_z1, data_rdy_z2;
    always @(posedge bus2ip_clk) {data_rdy_z1, data_rdy_z2} <= {data_rdy, data_rdy_z1};

    //synchronize wr_fin to bus2ip_clk domain
    wire wr_fin_bus = wr_fin | wr_fin_z1 | wr_fin_z2;
    reg  wr_fin_bus_z1, wr_fin_bus_z2;
    always @(posedge bus2ip_clk) {wr_fin_bus_z1, wr_fin_bus_z2} <= {wr_fin_bus, wr_fin_bus_z1};

    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n)
            data_rdy <= 1'b0;
        else if(wr_fin_bus_z1 & (~wr_fin_bus_z2))
            data_rdy <= 1'b1;
        else if(read_clear_pulse == 1'b1 && bus2ip_addr_z2 == (RX_BUF_BADDR + 32'h200) && data_rdy_z2 == 1'b1) 
            data_rdy <= 1'b0;
    end

    //bus read operation
    wire [31:0] masked_addr  = bus2ip_addr_i & 32'h1ff;
    wire [6:0]  shifted_addr = masked_addr[8:2];

    always @(*) begin
        if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i == RX_BUF_BADDR + 32'h200) //frame length
            ip2bus_data_o[31:0] = {16'b0, data_rdy, 6'b0, frm_len};
        else if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i >= RX_BUF_BADDR && bus2ip_addr_i < (RX_BUF_BADDR+32'h200)) 
            ip2bus_data_o[31:0] = rd_buf[shifted_addr];
        else
            ip2bus_data_o[31:0] = 32'h0;
    end

    assign int_rx_all_o = wr_fin_z1;
endmodule

