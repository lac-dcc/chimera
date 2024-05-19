// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2001 Jon Gao (gaojon@yahoo.com) 
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
 * Clock generation for EMAC TX/RX data processing.
-*/

module emac_phy_intf (
    input              rst_n          ,
    input              mac_rx_clk     ,
    input              mac_tx_clk     ,
    //RX interface to MAC core
    output reg         MRxDv_o        ,       
    output reg [7:0]   MRxD_o         ,       
    output reg         MRxErr_o       ,       
    output             MCRS_o         ,
    output             MCOL_o         ,
    //TX interface from MAC core
    input   [7:0]      MTxD_i         ,
    input              MTxEn_i        ,   
    input              MTxErr_i       ,
    //PHY interface
    output reg         tx_er_o        ,
    output reg         tx_en_o        ,
    output reg [7:0]   txd_o          ,
    input              rx_er_i        ,
    input              rx_dv_i        ,
    input   [7:0]      rxd_i          ,
    input              crs_i          ,
    input              col_i          ,
    //registers interface
    input              r_LoopEn_i     ,
    input   [2:0]      r_speed_i         
);
    //internal signals                                                              
    reg     [7:0]   MTxD_d1         ;
    reg             MTxEn_d1        ;
    reg             MTxErr_d1       ;
    reg             tx_odd_data_ptr ;  
    reg             rx_odd_data_ptr ;
    reg             rx_er_d1        ;
    reg             rx_er_d2        ;
    reg             rx_dv_d1        ;
    reg             rx_dv_d2        ;
    reg     [7:0]   rxd_d1          ;
    reg     [7:0]   rxd_d2          ;

    //++
    //Tx control                                                              
    //--

    //latch boundery signals
    always @ (posedge mac_tx_clk or negedge rst_n) begin
        if (!rst_n) begin
            MTxD_d1    <= 0;
            MTxEn_d1   <= 0;
            MTxErr_d1  <= 0;
        end  
        else begin
            MTxD_d1    <= MTxD_i  ;
            MTxEn_d1   <= MTxEn_i ;
            MTxErr_d1  <= MTxErr_i;
        end 
    end
     
    always @ (posedge mac_tx_clk or negedge rst_n) begin
        if (!rst_n)   
            tx_odd_data_ptr <= 0;
        else if (!MTxEn_d1)
            tx_odd_data_ptr <= 0;
        else 
            tx_odd_data_ptr <= !tx_odd_data_ptr;
    end
        

    always @ (posedge mac_tx_clk or negedge rst_n) begin
        if (!rst_n)  
            txd_o <= 0;
        else if(r_speed_i[2] && MTxEn_d1)
            txd_o <= MTxD_d1;
        else if(MTxEn_d1 && !tx_odd_data_ptr)
            txd_o <= {4'b0,MTxD_d1[3:0]};
        else if(MTxEn_d1 && tx_odd_data_ptr)
            txd_o <= {4'b0,MTxD_d1[7:4]};
        else
            txd_o <= 0;
    end

    always @ (posedge mac_tx_clk or negedge rst_n) begin
        if (!rst_n) begin 
            tx_en_o <= 0;
            tx_er_o <= 0;
        end
        else begin
            tx_en_o <= MTxEn_d1;
            tx_er_o <= MTxErr_d1;
        end
    end

    //++
    //Rx control                                                              
    //--

    //latch boundery signals
    always @ (posedge mac_rx_clk or negedge rst_n) begin
        if (!rst_n)  begin
            rx_er_d1 <= 0;
            rx_er_d2 <= 0;
            rx_dv_d1 <= 0;
            rx_dv_d2 <= 0;
            rxd_d1   <= 0;
            rxd_d2   <= 0;
        end
        else begin
            rx_er_d1 <= rx_er_i  ;
            rx_er_d2 <= rx_er_d1 ;
            rx_dv_d1 <= rx_dv_i  ;
            rx_dv_d2 <= rx_dv_d1 ;
            rxd_d1   <= rxd_i    ;
            rxd_d2   <= rxd_d1   ;
        end     
    end

    assign MCRS_o   = crs_i  ;
    assign MCOL_o   = col_i  ;

    always @ (posedge mac_rx_clk or negedge rst_n) begin
        if (!rst_n) begin 
            MRxDv_o  <= 0;
            MRxErr_o <= 0;
        end
        else if(r_LoopEn_i) begin
            MRxDv_o  <= tx_en_o;
            MRxErr_o <= tx_er_o;
        end
        else begin
            MRxDv_o  <= rx_dv_d2;
            MRxErr_o <= rx_er_d2;
        end
    end

    always @ (posedge mac_rx_clk or negedge rst_n) begin
        if (!rst_n)   
            rx_odd_data_ptr <= 0;
        else if (!rx_dv_d1)
            rx_odd_data_ptr <= 0;
        else 
            rx_odd_data_ptr <= !rx_odd_data_ptr;
    end
        
    always @ (posedge mac_rx_clk or negedge rst_n) begin
        if (!rst_n)  
            MRxD_o <= 0;
        else if(r_LoopEn_i)
            MRxD_o <= txd_o;
        else if(r_speed_i[2] && rx_dv_d2)
            MRxD_o <= rxd_d2;
        else if(rx_dv_d1 && rx_odd_data_ptr)
            MRxD_o <= {rxd_d1[3:0],rxd_d2[3:0]};
    end
        
endmodule           

