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
 * Ethernet MAC RTL top level
-*/

`include "emac_defines.v"

module emac_top (
    //System signals
    input               sys_rst_n,         //async. reset, active low
    input               clk_125m ,
    input               clk_user ,
    output [2:0]        speed_o  ,
    input               dl_xmt_i ,         //downlink(PTP) is transmitting, backpressure signal

    //32 bits on chip host bus access interface
    input               bus2ip_clk     ,         //clock used for register access and mdio
    input               bus2ip_rst_n   ,
    input  [31:0]       bus2ip_addr_i  ,
    input  [31:0]       bus2ip_data_i  ,
    input               bus2ip_rd_ce_i ,   //active high
    input               bus2ip_wr_ce_i ,   //active high
    output [31:0]       ip2bus_data_o  , 

    //RX FIFO user interface
    output              rx_mac_ra_o     , //RX FIFO read data available
    input               rx_mac_rd_i     , //RX FIFO read enable
    output [31:0]       rx_mac_data_o   , //Read data output, aligned with rx_mac_pa_o
    output [1:0]        rx_mac_be_o     , //Byte enable for the last word, little endian
    output              rx_mac_pa_o     , //packet data valid
    output              rx_mac_sop_o    , //start of packet
    output              rx_mac_eop_o    , //end of packet

    //TX FIFO user interface 
    output              tx_mac_wa_o     , //FIFO write data available
    input               tx_mac_wr_i     , //MAC data write enable
    input  [31:0]       tx_mac_data_i   , //MAC data input
    input  [1:0]        tx_mac_be_i     , //byte enable, little endian
    input               tx_mac_sop_i    , //Start of Packet input
    input               tx_mac_eop_i    , //End of Packet input

    //PHY GMII/MII rx interface
    input               rx_clk ,
    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 
    input               crs_i  ,           //carrier sense from PHY
    input               col_i  ,           //collision from PHY
      
    //PHY GMII/MII tx interface
    output              gtx_clk,           //used only in GMII mode, from MAC to PHY
    input               tx_clk ,           //used only in MII mode, from PHY to MAc
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //PHY mdio interface
    output              mdc_o     ,         //mdio clock
    output              mdo_en_o  ,         //mdio output enable
    output              mdo_o     ,         //mdio serial data output
    input               mdi_i               //mdio serial data input
);
    //miim related signals
    wire  [7:0]     r_ClkDiv;
    wire            r_MiiNoPre;
    wire  [15:0]    r_CtrlData;
    wire  [4:0]     r_FIAD;
    wire  [4:0]     r_RGAD;
    wire            r_WCtrlData;
    wire            r_RStat;
    wire            r_ScanStat;
    wire            NValid_stat;
    wire            Busy_stat;
    wire            LinkFail;
    wire  [15:0]    Prsd;             // Read Status Data (data read from the PHY)
    wire            WCtrlDataStart;
    wire            RStatStart;
    wire            UpdateMIIRX_DATAReg;

    //registers for host interface
    wire  [2:0]     r_speed              ; //Ethernet speed, 3'b100: 1000Mbps, 3'b010: 100Mbps, 3'b001: 10Mbps
    wire            r_LoopEn             ; //TX to RX loop back enable          
    wire  [47:0]    r_MacAddr            ; //Local MAC address

    wire            r_TxEn               ; //Transmit enable
    wire  [4:0]     r_txHwMark           ; //TX FIFO high water mark
    wire  [4:0]     r_txLwMark           ; //TX FIFO low water mark 
    wire            r_CrcEn              ; //Enable Tx MAC appends the CRC to every frame
    wire            r_PauseFrameSendEn   ; //enable transmit logic to send pause frame               
    wire            r_TxPauseRq          ; //Write 1 to start Tx pause frame sending, automatically cleared to zero.
    wire  [15:0]    r_TxPauseTV          ; //Tx pause timer value that is sent in the pause control frame
    wire            RstTxPauseRq         ; //signal to clear r_TxPauseRq to zero
    wire            r_FullDuplex         ; //full duplex mode
    wire  [3:0]     r_MaxRetry           ; //Maximum retry times when collision occurred
    wire  [5:0]     r_IFGSet             ; //Minimum IFG value
    wire            r_txMacAddrEn        ; //enable to replace source MAC address of transmitting packet            
    wire            r_TxPauseEn          ; //respond to received pause frame enable

    wire            r_RxEn                    ; //receive enable
    wire            r_rxAddrChkEn             ; //check RX MAC address enable    
    wire            r_AllAddrHashChkEn        ; //All address Hash check enable, not limited to multicast
    wire  [31:0]    r_Hash0                   ; //HASH table for address check, lower 4 bytes
    wire  [31:0]    r_Hash1                   ; //HASH table for address check, upper 4 bytes 
    wire            r_BroadcastFilterEn       ; //Broadcast packet filter enable
    wire  [15:0]    r_BroadcastBucketDepth    ; //Bucket depeth of broadcast packet filter    
    wire  [15:0]    r_BroadcastBucketInterval ; //time interval of refilling of broadcast bucket
    wire            r_RxAppendCrc             ; //retain FCS of received ethernet frame when hand up
    wire  [4:0]     r_rxHwMark                ; //RX FIFO high water mark
    wire  [4:0]     r_rxLwMark                ; //RX FIFO low water mark
    wire            r_CrcChkEn                ; //enable CRC check of received ethernet frame              
    wire  [5:0]     r_RxIFGSet                ; //minimum gap between consecutive received frames
    wire  [15:0]    r_RxMaxLength             ; //maximum frame length to be received (1518)
    wire  [15:0]    r_RxMinLength             ; //minimum frame length to be received (64)

    wire  [5:0]     r_MibRdAddr   ; //Read address for MIB RAM
    wire            r_MibRdApply  ; //Write 1 to start MIB read operation
    wire            RstMibRdApply ; //Clear r_MibRdApply to zero
    wire            r_MibRdGrant  ; //MIB read data out is available
    wire  [31:0]    r_MibRdDout   ; //MIB read data out

    //clock signals
    wire            mac_tx_clk    ;
    wire            mac_rx_clk    ;
    wire            mac_tx_clk_div;
    wire            mac_rx_clk_div; 
    //RX interface from PHY to MAC core
    wire            MRxDv  ;       
    wire  [7:0]     MRxD   ;       
    wire            MRxErr ;       
    wire            mcrs   ;
    wire            mcol   ;
    //TX interface from MAC core to PHY
    wire  [7:0]     MTxD  ;
    wire            MTxEn ;   
    wire            MTxErr;

    // Connecting EMAC TX module
    wire  [2:0]     tx_pkt_type_rmon    ;
    wire  [15:0]    tx_pkt_length_rmon  ;
    wire            tx_apply_rmon       ;
    wire  [2:0]     tx_pkt_err_type_rmon;

    wire  [15:0]    pause_quanta        ;
    wire            pause_quanta_val    ;       

    wire    xmt_en = (~dl_xmt_i) & r_TxEn;

    emac_tx emac_tx 
    (
        .rst_n                  (sys_rst_n            ),
        .clk                    (mac_tx_clk_div       ),
        .clk_user               (clk_user             ),
        .xmt_en_i               (xmt_en               ), 
        // PHY interface
        .TxD_o                  (MTxD                 ),
        .TxEn_o                 (MTxEn                ),   
        .TxErr_o                (MTxErr               ),
        .CRS_i                  (mcrs                 ), 
        .COL_i                  (mcol                 ),
        // RMON
        .tx_pkt_type_rmon_o     (tx_pkt_type_rmon     ),
        .tx_pkt_length_rmon_o   (tx_pkt_length_rmon   ),
        .tx_apply_rmon_o        (tx_apply_rmon        ),
        .tx_pkt_err_type_rmon_o (tx_pkt_err_type_rmon ),
        // user interface 
        .tx_mac_wa_o            (tx_mac_wa_o          ),
        .tx_mac_wr_i            (tx_mac_wr_i          ),
        .tx_mac_data_i          (tx_mac_data_i        ),
        .tx_mac_be_i            (tx_mac_be_i          ),
        .tx_mac_sop_i           (tx_mac_sop_i         ),
        .tx_mac_eop_i           (tx_mac_eop_i         ),
        // host interface 
        .r_txHwMark_i           (r_txHwMark           ), 
        .r_txLwMark_i           (r_txLwMark           ), 
        .r_CrcEn_i              (r_CrcEn              ),
        .r_PauseFrameSendEn_i   (r_PauseFrameSendEn   ),
        .r_TxPauseRq_i          (r_TxPauseRq          ),
        .r_TxPauseTV_i          (r_TxPauseTV          ),
        .RstTxPauseRq_o         (RstTxPauseRq         ), 
        .r_FullDuplex_i         (r_FullDuplex         ), 
        .r_MaxRetry_i           (r_MaxRetry           ),
        .r_IFGSet_i             (r_IFGSet             ), 
        .r_txMacAddrEn_i        (r_txMacAddrEn        ),
        .r_txMacAddr_i          (r_MacAddr            ),
        .r_TxPauseEn_i          (r_TxPauseEn          ), 
        // from MAC rx flow control       
        .pause_quanta_i         (pause_quanta         ),   
        .pause_quanta_val_i     (pause_quanta_val     )  
    );

    // Connecting EMAC RX module
    wire [15:0]  rx_pkt_length_rmon   ;  
    wire         rx_apply_rmon        ;  
    wire [2:0]   rx_pkt_err_type_rmon ;  
    wire [2:0]   rx_pkt_type_rmon     ;  

    emac_rx emac_rx 
    (
        .rst_n                  (sys_rst_n            ),
        .clk_user               (clk_user             ),
        .clk                    (mac_rx_clk_div       ),
        //GMII/MII interface
        .MRxDv_i                (MRxDv                ),       
        .MRxD_i                 (MRxD                 ),       
        .MRxErr_i               (MRxErr               ),       
        //flow control signals to TX MAC 
        .pause_quanta_o         (pause_quanta         ),   
        .pause_quanta_val_o     (pause_quanta_val     ),   
        //user interface 
        .rx_mac_ra_o            (rx_mac_ra_o          ),
        .rx_mac_rd_i            (rx_mac_rd_i          ),
        .rx_mac_data_o          (rx_mac_data_o        ),
        .rx_mac_be_o            (rx_mac_be_o          ),
        .rx_mac_pa_o            (rx_mac_pa_o          ),
        .rx_mac_sop_o           (rx_mac_sop_o         ),
        .rx_mac_eop_o           (rx_mac_eop_o         ),
        //Host interface registers
        .r_RxEn_i                    (r_RxEn                   ), 
        .r_rxAddrChkEn_i             (r_rxAddrChkEn            ), 
        .r_AllAddrHashChkEn_i        (r_AllAddrHashChkEn       ),
        .r_rxMacAddr_i               (r_MacAddr                ), 
        .r_Hash0_i                   (r_Hash0                  ),
        .r_Hash1_i                   (r_Hash1                  ),
        .r_BroadcastFilterEn_i       (r_BroadcastFilterEn      ), 
        .r_BroadcastBucketDepth_i    (r_BroadcastBucketDepth   ),    
        .r_BroadcastBucketInterval_i (r_BroadcastBucketInterval),
        .r_RxAppendCrc_i             (r_RxAppendCrc            ),
        .r_rxHwMark_i                (r_rxHwMark               ), 
        .r_rxLwMark_i                (r_rxLwMark               ), 
        .r_CrcChkEn_i                (r_CrcChkEn               ), 
        .r_RxIFGSet_i                (r_RxIFGSet               ),
        .r_RxMaxLength_i             (r_RxMaxLength            ),
        .r_RxMinLength_i             (r_RxMinLength            ), 
        //RMON interface
        .rx_pkt_length_rmon_o        (rx_pkt_length_rmon    ),
        .rx_apply_rmon_o             (rx_apply_rmon         ),
        .rx_pkt_err_type_rmon_o      (rx_pkt_err_type_rmon  ),
        .rx_pkt_type_rmon_o          (rx_pkt_type_rmon      )
    );

    // Connecting EMAC remote monitoring module
    emac_rmon emac_rmon ( 
        .clk                         (bus2ip_clk            ),
        .rst_n                       (bus2ip_rst_n          ),
        //TX RMON
        .tx_pkt_type_rmon_i          (tx_pkt_type_rmon      ),
        .tx_pkt_length_rmon_i        (tx_pkt_length_rmon    ),
        .tx_apply_rmon_i             (tx_apply_rmon         ),
        .tx_pkt_err_type_rmon_i      (tx_pkt_err_type_rmon  ),
        //RX RMON
        .rx_pkt_type_rmon_i          (rx_pkt_type_rmon      ),
        .rx_pkt_length_rmon_i        (rx_pkt_length_rmon    ),
        .rx_apply_rmon_i             (rx_apply_rmon         ),
        .rx_pkt_err_type_rmon_i      (rx_pkt_err_type_rmon  ),
        //Host interface
        .r_MibRdAddr_i               (r_MibRdAddr           ),
        .r_MibRdApply_i              (r_MibRdApply          ),
        .RstMibRdApply_o             (RstMibRdApply         ),
        .r_MibRdGrant_o              (r_MibRdGrant          ),
        .r_MibRdDout_o               (r_MibRdDout           )
    );

    // Connecting EMAC clock control module
    emac_clk_ctrl u_clk_ctrl
    (   
        .rst_n                 (sys_rst_n),
        .clk_125m              (clk_125m ),
    
        //registers interface
        .speed_i               (r_speed),       
    
        //clock signals between PHY/MAC interface
        .gtx_clk               (gtx_clk),
        .rx_clk                (rx_clk ),
        .tx_clk                (tx_clk ),
    
        //internal clock signals for TX/RX data processing
        .mac_tx_clk            (mac_tx_clk    ),
        .mac_rx_clk            (mac_rx_clk    ),
        .mac_tx_clk_div        (mac_tx_clk_div),
        .mac_rx_clk_div        (mac_rx_clk_div)  
    );

    // Connecting PHY interface
    emac_phy_intf u_phy_intf 
    (
        .rst_n                 (sys_rst_n ),
        .mac_rx_clk            (mac_rx_clk),
        .mac_tx_clk            (mac_tx_clk),
        //RX interface to MAC core
        .MRxDv_o               (MRxDv ),       
        .MRxD_o                (MRxD  ),       
        .MRxErr_o              (MRxErr),       
        .MCRS_o                (mcrs  ),
        .MCOL_o                (mcol  ),
        //TX interface from MAC core
        .MTxD_i                (MTxD  ),
        .MTxEn_i               (MTxEn ),   
        .MTxErr_i              (MTxErr),
        //PHY interface
        .tx_er_o               (tx_er_o),
        .tx_en_o               (tx_en_o),
        .txd_o                 (txd_o  ),
        .rx_er_i               (rx_er_i),
        .rx_dv_i               (rx_dv_i),
        .rxd_i                 (rxd_i  ),
        .crs_i                 (crs_i  ),
        .col_i                 (col_i  ),
        //registers interface
        .r_LoopEn_i            (r_LoopEn),
        .r_speed_i             (r_speed ) 
    );

    // Connecting miim module
    eth_miim u_eth_miim
    (
        .Clk                   (bus2ip_clk),
        .rst_n                 (bus2ip_rst_n),

        .Mdi_i                 (mdi_i),
        .Mdo_o                 (mdo_o),
        .MdoEn_o               (mdo_en_o),
        .Mdc_o                 (mdc_o),

        .Divider_i             (r_ClkDiv),
        .NoPre_i               (r_MiiNoPre),
        .CtrlData_i            (r_CtrlData),
        .Rgad_i                (r_RGAD),
        .Fiad_i                (r_FIAD),
        .WCtrlData_i           (r_WCtrlData),
        .RStat_i               (r_RStat),
        .ScanStat_i            (r_ScanStat),
        .Busy_o                (Busy_stat),
        .Prsd_o                (Prsd),
        .LinkFail_o            (LinkFail),
        .Nvalid_o              (NValid_stat),
        .WCtrlDataStart_o      (WCtrlDataStart),
        .RStatStart_o          (RStatStart),
        .UpdateMIIRX_DATAReg_o (UpdateMIIRX_DATAReg)
    );

    // Connecting Ethernet registers
    emac_registers u_emac_registers
    (
        .bus2ip_clk            (bus2ip_clk          ),         
        .bus2ip_rst_n          (bus2ip_rst_n        ),
        .bus2ip_addr_i         (bus2ip_addr_i       ),
        .bus2ip_data_i         (bus2ip_data_i       ),
        .bus2ip_rd_ce_i        (bus2ip_rd_ce_i      ),         
        .bus2ip_wr_ce_i        (bus2ip_wr_ce_i      ),        
        .ip2bus_data_o         (ip2bus_data_o       ), 

        //EMAC control and status registers
        .r_speed_o                   (r_speed                  ),
        .r_LoopEn_o                  (r_LoopEn                 ),
        .r_TxEn_o                    (r_TxEn                   ), 
        .r_CrcEn_o                   (r_CrcEn                  ), 
        .r_FullDuplex_o              (r_FullDuplex             ), 
        .r_txMacAddrEn_o             (r_txMacAddrEn            ),             
        .r_RxEn_o                    (r_RxEn                   ), 
        .r_rxAddrChkEn_o             (r_rxAddrChkEn            ), 
        .r_AllAddrHashChkEn_o        (r_AllAddrHashChkEn       ), 
        .r_BroadcastFilterEn_o       (r_BroadcastFilterEn      ), 
        .r_RxAppendCrc_o             (r_RxAppendCrc            ), 
        .r_CrcChkEn_o                (r_CrcChkEn               ), 
        .r_IFGSet_o                  (r_IFGSet                 ), 
        .r_RxIFGSet_o                (r_RxIFGSet               ),
        .r_RxMaxLength_o             (r_RxMaxLength            ),
        .r_RxMinLength_o             (r_RxMinLength            ),
        .r_MaxRetry_o                (r_MaxRetry               ), 
        .r_txHwMark_o                (r_txHwMark               ), 
        .r_txLwMark_o                (r_txLwMark               ), 
        .r_rxHwMark_o                (r_rxHwMark               ),
        .r_rxLwMark_o                (r_rxLwMark               ),
        .r_TxPauseEn_o               (r_TxPauseEn              ),
        .r_PauseFrameSendEn_o        (r_PauseFrameSendEn       ),
        .r_TxPauseRq_o               (r_TxPauseRq              ), 
        .r_TxPauseTV_o               (r_TxPauseTV              ),
        .RstTxPauseRq_i              (RstTxPauseRq             ), 
        .r_BroadcastBucketDepth_o    (r_BroadcastBucketDepth   ), 
        .r_BroadcastBucketInterval_o (r_BroadcastBucketInterval), 
        .r_MacAddr_o                 (r_MacAddr                ), 
        .r_Hash0_o                   (r_Hash0                  ), 
        .r_Hash1_o                   (r_Hash1                  ), 

        .r_MibRdAddr_o               (r_MibRdAddr              ), 
        .r_MibRdApply_o              (r_MibRdApply             ),
        .RstMibRdApply_i             (RstMibRdApply            ), 
        .r_MibRdGrant_i              (r_MibRdGrant             ), 
        .r_MibRdDout_i               (r_MibRdDout              ), 

        // EMAC MIIM registers
        .r_ClkDiv_o            (r_ClkDiv            ),
        .r_MiiNoPre_o          (r_MiiNoPre          ),
        .r_CtrlData_o          (r_CtrlData          ),
        .r_RGAD_o              (r_RGAD              ),
        .r_FIAD_o              (r_FIAD              ),
        .r_WCtrlData_o         (r_WCtrlData         ),
        .r_RStat_o             (r_RStat             ),
        .r_ScanStat_o          (r_ScanStat          ),
        .Busy_stat_i           (Busy_stat           ),
        .Prsd_i                (Prsd                ),
        .LinkFail_i            (LinkFail            ),
        .NValid_stat_i         (NValid_stat         ),
        .WCtrlDataStart_i      (WCtrlDataStart      ),
        .RStatStart_i          (RStatStart          ),
        .UpdateMIIRX_DATAReg_i (UpdateMIIRX_DATAReg )
    );
    assign speed_o = r_speed;

endmodule
