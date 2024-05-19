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
 * tx ptp frame buffer 
 * for simplicity, just behavioral
-*/

`include "ptpv2_defines.v"

module tx_ptp_buf (
    //tx interface
    input               tx_clk,
    input               tx_rst_n,
    
    output reg          tx_en_o,
    output reg          tx_er_o,
    output reg [7:0]    txd_o  ,

    //32 bits on chip bus access interface
    input               bus2ip_clk   ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output reg [31:0]   ip2bus_data_o   
);
    parameter TX_BUF_BADDR = 32'h2000;
    reg  [31:0] wr_buf[127:0]; //tx buffer
    reg  [8:0]  frm_len;
    reg         tx_start, tx_start_d1, tx_start_d2;

    //bus write operation
    wire [31:0] masked_addr  = bus2ip_addr_i & 32'h1ff;
    wire [6:0]  shifted_addr = masked_addr[8:2];
  
    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            frm_len  <= 0;
            tx_start <= 0;
        end
        else if(bus2ip_wr_ce_i == 1'b1 && bus2ip_addr_i == TX_BUF_BADDR + 32'h200) begin   //frm_len and tx_start signal
            frm_len  <= bus2ip_data_i[8:0];
            tx_start <= bus2ip_data_i[15];
        end
        else if(bus2ip_wr_ce_i == 1'b1 && bus2ip_addr_i >= TX_BUF_BADDR && bus2ip_addr_i < (TX_BUF_BADDR+32'h200)) begin   
            wr_buf[shifted_addr] <= bus2ip_data_i[31:0];
        end
        else begin  //clear self-clearing register bits
            if(tx_start_d2 == 1'b1)   tx_start   <= 0 ;
        end
    end

    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            {tx_start_d1,  tx_start_d2} <= 2'b0;
        end
        else begin
            {tx_start_d1,  tx_start_d2} <= {tx_start,  tx_start_d1};
        end
    end

    //bus read operation
    always @(*) begin
        if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i == TX_BUF_BADDR + 32'h200) //frame length
            ip2bus_data_o[31:0] = {16'b0, tx_start, 6'b0, frm_len};
        else if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i >= TX_BUF_BADDR && bus2ip_addr_i < (TX_BUF_BADDR+32'h200)) 
            ip2bus_data_o[31:0] = wr_buf[shifted_addr];
        else
            ip2bus_data_o[31:0] = 32'h0;
    end

    //++
    //transmit data to gmii, use state machine
    //--
    parameter TX_IDLE = 2'd0, TX_PREAMBLE = 2'd1, TX_SFD = 2'd2, TX_DATA = 2'd3;
    reg  [1:0] cstate, nstate;

    //start signal delay in tx_clk domain
    reg  tx_start_z1, tx_start_z2, tx_start_z3; 
    wire  start_pul = tx_start_z2 & (~tx_start_z3);

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            {tx_start_z1,  tx_start_z2, tx_start_z3} <= 3'b0;
        end
        else begin
            {tx_start_z1,  tx_start_z2, tx_start_z3} <= {tx_start,  tx_start_z1, tx_start_z2};
        end
    end

    reg  [8:0]  eth_count;
    wire [8:0]  tx_octets = (eth_count >= 8) ? eth_count - 8 : 0;
    wire last_data = (tx_octets == (frm_len-1)) ? 1 : 0;

    //state transition
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) 
            cstate <= TX_IDLE;
        else 
            cstate <= nstate;
    end

    //next state switch
    always @(*) begin
      nstate = cstate;
      case(cstate)
          TX_IDLE:
              if(start_pul == 1'b1)
                  nstate = TX_PREAMBLE;
          TX_PREAMBLE:               //transmit preamble
              if(eth_count == 6)
                  nstate = TX_SFD;
          TX_SFD:                    //transmit sfd
              nstate = TX_DATA;
          TX_DATA:                   //transmit data
              if(last_data == 1'b1)
                  nstate = TX_IDLE;
      endcase
    end

    //output logic of state machine
    wire [6:0]  addr = tx_octets[8:2];
    wire [31:0] data_tuple = wr_buf[addr];
    reg  [7:0]  data;

    always @(*) begin
        case(tx_octets[1:0])
            2'b00: 
                data = data_tuple[7:0];
            2'b01:
                data = data_tuple[15:8];
            2'b10:
                data = data_tuple[23:16];
            2'b11:
                data = data_tuple[31:24];
            default:
                data = 8'h0;
        endcase
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin : TX_GMII
        if(!tx_rst_n) begin
            tx_en_o   <= 0;
            tx_er_o   <= 0;
            txd_o     <= 8'h0;
            eth_count <= 0;
        end
        else if(cstate == TX_IDLE) begin
            tx_en_o   <= 0;
            tx_er_o   <= 0;
            txd_o     <= 8'h0;
            eth_count <= 0;
        end
        else if(cstate == TX_PREAMBLE) begin
            tx_en_o   <= 1;
            tx_er_o   <= 0;
            txd_o     <= `PREAMBLE ;
            eth_count <= eth_count + 1;
        end
        else if(cstate == TX_SFD) begin
            tx_en_o   <= 1;
            tx_er_o   <= 0;
            txd_o     <= `SFD ;
            eth_count <= eth_count + 1;
        end
        else if(cstate == TX_DATA) begin
            tx_en_o   <= 1;
            tx_er_o   <= 0;
            txd_o     <= data ;
            eth_count <= eth_count + 1;
        end
    end

endmodule


