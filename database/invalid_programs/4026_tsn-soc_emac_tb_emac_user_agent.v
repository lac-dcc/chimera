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
 * Ethernet MAC user interface agent including driver and monitor
-*/

`include "emac_defines.v"
`include "ephy_defines.v"
`include "tb_emac_defines.v"

module emac_user_agent (
    input               rst_n           ,
    input               clk_user        ,

    //RX FIFO user interface
    input               rx_mac_ra_i     , //RX FIFO read data available
    output reg          rx_mac_rd_o     , //RX FIFO read enable
    input  [31:0]       rx_mac_data_i   , //Read data output, aligned with rx_mac_pa_o
    input  [1:0]        rx_mac_be_i     , //Byte enable for the last word, little endian
    input               rx_mac_pa_i     , //packet data valid
    input               rx_mac_sop_i    , //start of packet
    input               rx_mac_eop_i    , //end of packet

    //TX FIFO user interface 
    input               tx_mac_wa_i     , //FIFO write data available
    output reg          tx_mac_wr_o     , //MAC data write enable
    output reg [31:0]   tx_mac_data_o   , //MAC data input
    output reg [1:0]    tx_mac_be_o     , //byte enable, little endian
    output reg          tx_mac_sop_o    , //Start of Packet input
    output reg          tx_mac_eop_o      //End of Packet input
);
    reg   [7:0]  tx_buf[0:16383];
    reg   [9:0]  rx_buf[0:4194303];
    reg   [31:0] rcv_ptr;

    initial begin
        rx_mac_rd_o   = 0;  
        tx_mac_wr_o   = 0; 
        tx_mac_data_o = 0; 
        tx_mac_be_o   = 0;
        tx_mac_sop_o  = 0; 
        tx_mac_eop_o  = 0; 

        rcv_ptr       = 0; 
    end

    //++
    //task to transmit frame
    //--
    task TransmitFrame(input integer frameLength);
        integer i;
        
        begin
            i = 0;
            while(i < frameLength) begin
                @(posedge clk_user);
                #1;

                if(tx_mac_wa_i) begin
                    if((i+4) <= frameLength) begin
                        tx_mac_wr_o   = 1;   
                        tx_mac_data_o = {tx_buf[i+3], tx_buf[i+2], tx_buf[i+1], tx_buf[i]};   
                        tx_mac_be_o   = 2'b00;
                        if(i == 0)
                            tx_mac_sop_o = 1;
                        else
                            tx_mac_sop_o = 0;

                        if((i+4) == frameLength)
                            tx_mac_eop_o = 1;
                        else 
                            tx_mac_eop_o = 0;
                    end
                    else if((i+3) == frameLength) begin
                        tx_mac_wr_o   = 1;   
                        tx_mac_data_o = {8'b0, tx_buf[i+2], tx_buf[i+1], tx_buf[i]};   
                        tx_mac_be_o   = 2'b11;
                        tx_mac_sop_o = 0;
                        tx_mac_eop_o = 1;
                    end
                    else if((i+2) == frameLength) begin
                        tx_mac_wr_o   = 1;   
                        tx_mac_data_o = {16'b0, tx_buf[i+1], tx_buf[i]};   
                        tx_mac_be_o   = 2'b10;
                        tx_mac_sop_o = 0;
                        tx_mac_eop_o = 1;
                    end
                    else if((i+1) == frameLength) begin
                        tx_mac_wr_o   = 1;   
                        tx_mac_data_o = {24'b0, tx_buf[i]};   
                        tx_mac_be_o   = 2'b01;
                        tx_mac_sop_o = 0;
                        tx_mac_eop_o = 1;
                    end

                    i = i + 4;
                end //tx_mac_wa_i == 1
                else begin
                    tx_mac_wr_o   = 0; 
                    tx_mac_data_o = 0; 
                    tx_mac_be_o   = 0;
                    tx_mac_sop_o  = 0; 
                    tx_mac_eop_o  = 0;  
                end
            end //while

            @(posedge clk_user);
            #1;
            tx_mac_wr_o   = 0; 
            tx_mac_data_o = 0; 
            tx_mac_be_o   = 0;
            tx_mac_sop_o  = 0; 
            tx_mac_eop_o  = 0;  

        end
    endtask

    //++
    //receive data from RX FIFO and store to rx_buf
    //--
    always @(posedge clk_user or negedge rst_n) begin
        if(!rst_n)
            rx_mac_rd_o <= 0;
        //else if(rx_mac_ra_i && rx_mac_rd_o == 0) //read-wait-read
        else if(rx_mac_ra_i) 
            rx_mac_rd_o <= 1;
        else 
            rx_mac_rd_o <= 0;
    end

    always @(posedge clk_user or negedge rst_n) begin
        if(!rst_n) begin
            rcv_ptr = 0;
        end
        else if(rx_mac_pa_i) begin
            if(rx_mac_eop_i != 1) begin
                rx_buf[rcv_ptr]   = {rx_mac_sop_i, 1'b0, rx_mac_data_i[7:0]};
                rx_buf[rcv_ptr+1] = {2'b0, rx_mac_data_i[15:8]};
                rx_buf[rcv_ptr+2] = {2'b0, rx_mac_data_i[23:16]};
                rx_buf[rcv_ptr+3] = {2'b0, rx_mac_data_i[31:24]};

                rcv_ptr = rcv_ptr + 4;
            end
            else begin
                case(rx_mac_be_i)
                    2'b00:
                    begin
                        rx_buf[rcv_ptr]   = {2'b0, rx_mac_data_i[7:0]};
                        rx_buf[rcv_ptr+1] = {2'b0, rx_mac_data_i[15:8]};
                        rx_buf[rcv_ptr+2] = {2'b0, rx_mac_data_i[23:16]};
                        rx_buf[rcv_ptr+3] = {1'b0, rx_mac_eop_i, rx_mac_data_i[31:24]};
                        rcv_ptr = rcv_ptr + 4;
                    end

                    2'b11:
                    begin
                        rx_buf[rcv_ptr]   = {2'b0, rx_mac_data_i[7:0]};
                        rx_buf[rcv_ptr+1] = {2'b0, rx_mac_data_i[15:8]};
                        rx_buf[rcv_ptr+2] = {1'b0, rx_mac_eop_i, rx_mac_data_i[23:16]};
                        rcv_ptr = rcv_ptr + 3;
                    end

                    2'b10:
                    begin
                        rx_buf[rcv_ptr]   = {2'b0, rx_mac_data_i[7:0]};
                        rx_buf[rcv_ptr+1] = {1'b0, rx_mac_eop_i, rx_mac_data_i[15:8]};
                        rcv_ptr = rcv_ptr + 2;
                    end

                    2'b01:
                    begin
                        rx_buf[rcv_ptr]   = {1'b0, rx_mac_eop_i, rx_mac_data_i[7:0]};
                        rcv_ptr = rcv_ptr + 1;
                    end
                endcase
            end //rx_mac_eop_i
        end //rx_mac_pa_i
    end

endmodule
