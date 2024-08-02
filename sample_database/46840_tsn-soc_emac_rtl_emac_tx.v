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
 * EMAC TX top level
-*/

module emac_tx (
    input               rst_n                  ,
    input               clk                    ,
    input               clk_user               ,
    input               xmt_en_i               , //transmit enable
    // PHY interface
    output  [7:0]       TxD_o                  ,
    output              TxEn_o                 ,   
    output              TxErr_o                ,
    input               CRS_i                  , //carrier sense
    input               COL_i                  , //collision
    // RMON
    output  [2:0]       tx_pkt_type_rmon_o     ,
    output  [15:0]      tx_pkt_length_rmon_o   ,
    output              tx_apply_rmon_o        ,
    output  [2:0]       tx_pkt_err_type_rmon_o ,
    // user interface 
    output              tx_mac_wa_o            ,
    input               tx_mac_wr_i            ,
    input   [31:0]      tx_mac_data_i          ,
    input   [1:0]       tx_mac_be_i            ,
    input               tx_mac_sop_i           ,
    input               tx_mac_eop_i           ,
    // host interface 
    input   [4:0]       r_txHwMark_i           , //TX FIFO high water mark
    input   [4:0]       r_txLwMark_i           , //TX FIFO low water mark 
    input               r_CrcEn_i              , //Enable Tx MAC appends the CRC to every frame
    input               r_PauseFrameSendEn_i   , //enable transmit logic to send pause frame               
    input               r_TxPauseRq_i          , //Write 1 to start Tx pause frame sending, automatically cleared to zero.
    input   [15:0]      r_TxPauseTV_i          , //Tx pause timer value that is sent in the pause control frame
    output              RstTxPauseRq_o         , //signal to clear r_TxPauseRq to zero
    input               r_FullDuplex_i         , //full duplex mode
    input   [3:0]       r_MaxRetry_i           , //Maximum retry times when collision occurred
    input   [5:0]       r_IFGSet_i             , //Minimum IFG value
    input               r_txMacAddrEn_i        , //enable to replace source MAC address of transmitting packet            
    input   [47:0]      r_txMacAddr_i          , //mac address which will replace the source mac address of transmit packet.
    input               r_TxPauseEn_i          , //respond to received pause frame enable
    // from MAC rx flow control       
    input   [15:0]      pause_quanta_i         ,   
    input               pause_quanta_val_i       
);

    //++
    //internal signals                                                              
    //--
    //CRC generator Interface 
    wire            crc_init            ;
    wire[7:0]       frame_data          ;
    wire            data_en             ;
    wire            crc_rd              ;
    wire            crc_end             ;
    wire[7:0]       crc_out             ;

    //random generator interface
    wire            random_init         ;
    wire[3:0]       retry_cnt           ;
    wire            random_time_meet    ;//levle hight indicate random time passed away

    //flow control
    wire            pause_apply         ;
    wire            pause_quanta_sub    ;
    wire            TxPauseRq_gen          ;
    wire            TxPauseRq_gen_complete ;

    //MAC TX FIFO 
    wire[7:0]       fifo_data           ;
    wire            fifo_rd             ;
    wire            fifo_eop            ;
    wire            fifo_da             ;
    wire            fifo_rd_finish      ;
    wire            fifo_rd_retry       ;
    wire            fifo_ra             ;
    wire            fifo_data_err_empty ;
    wire            fifo_data_err_full  ;

    // Connecting emac_tx_ctrl                                                             
    emac_tx_ctrl emac_tx_ctrl
    (
        .rst_n                    (rst_n                  ),                    
        .clk                      (clk                    ),            
        .xmt_en_i                 (xmt_en_i               ),
        //CRC generator Interface 
        .crc_init_o               (crc_init               ),        
        .frame_data_o             (frame_data             ),            
        .data_en_o                (data_en                ),            
        .crc_rd_o                 (crc_rd                 ),            
        .crc_end_i                (crc_end                ),            
        .crc_out_i                (crc_out                ),            
        //random generator interface
        .random_init_o            (random_init            ),            
        .retry_cnt_o              (retry_cnt              ),        
        .random_time_meet_i       (random_time_meet       ),        
        //flow control
        .pause_apply_i            (pause_apply            ),            
        .pause_quanta_sub_o       (pause_quanta_sub       ),        
        .TxPauseRq_gen_i          (TxPauseRq_gen           ),
        .TxPauseRq_gen_complete_o (TxPauseRq_gen_complete_o),
        //MAC TX FIFO interface
        .fifo_data_i              (fifo_data              ),            
        .fifo_rd_o                (fifo_rd                ),            
        .fifo_eop_i               (fifo_eop               ),        
        .fifo_rd_finish_o         (fifo_rd_finish         ),            
        .fifo_rd_retry_o          (fifo_rd_retry          ),            
        .fifo_ra_i                (fifo_ra                ),            
        .fifo_data_err_empty_i    (fifo_data_err_empty    ),            
        .fifo_data_err_full_i     (fifo_data_err_full     ),            
        //GMII/MII
        .TxD_o                    (TxD_o                  ),            
        .TxEn_o                   (TxEn_o                 ),        
        .TxErr_o                  (TxErr_o                ),
        .CRS_i                    (CRS_i                  ),            
        .COL_i                    (COL_i                  ),
        //RMON
        .tx_pkt_type_rmon_o       (tx_pkt_type_rmon_o     ),        
        .tx_pkt_length_rmon_o     (tx_pkt_length_rmon_o   ),            
        .tx_apply_rmon_o          (tx_apply_rmon_o        ),            
        .tx_pkt_err_type_rmon_o   (tx_pkt_err_type_rmon_o ),           
        //Host interface
        .r_CrcEn_i                (r_CrcEn_i              ),
        .r_PauseFrameSendEn_i     (r_PauseFrameSendEn_i),            
        .r_TxPauseTV_i            (r_TxPauseTV_i          ),                
        .r_txMacAddrEn_i          (r_txMacAddrEn_i        ),            
        .r_txMacAddr_i            (r_txMacAddr_i          ),
        .r_FullDuplex_i           (r_FullDuplex_i         ),            
        .r_MaxRetry_i             (r_MaxRetry_i           ),        
        .r_IFGSet_i               (r_IFGSet_i             )            
    );

    assign RstTxPauseRq_o = TxPauseRq_gen_complete_o;

    // Connecting emac_crc_gen
    emac_crc_gen emac_crc_gen 
    (
        .rst_n                    (rst_n      ),
        .clk                      (clk        ),
        .init_i                   (crc_init   ),
        .frame_data_i             (frame_data ),
        .data_en_i                (data_en    ),
        .crc_rd_i                 (crc_rd     ),
        .crc_out_o                (crc_out    ),
        .crc_end_o                (crc_end    )
    );

    // Connecting emac_flow_ctrl
    emac_flow_ctrl emac_flow_ctrl
    (
        .rst_n                    (rst_n                  ),
        .clk                      (clk                    ),
        //host interface    
        .r_TxPauseEn_i            (r_TxPauseEn_i          ),
        .r_TxPauseRq_i            (r_TxPauseRq_i          ),
        //from MAC RX flow control       
        .pause_quanta_i           (pause_quanta_i         ),
        .pause_quanta_val_i       (pause_quanta_val_i     ),
        //MAC TX flow control     
        .pause_apply_o            (pause_apply            ),
        .pause_quanta_sub_i       (pause_quanta_sub       ),
        .TxPauseRq_gen_o          (TxPauseRq_gen          ), 
        .TxPauseRq_gen_complete_i (TxPauseRq_gen_complete ) 
    );

    // Connecting EMAC TX FIFO
    emac_tx_fifo emac_tx_fifo
    (
        .rst_n                      (rst_n                  ),
        .clk_mac                    (clk                    ),
        .clk_sys                    (clk_user               ),
        //emac_tx_ctrl interface
        .fifo_data_o                (fifo_data              ),
        .fifo_rd_i                  (fifo_rd                ),
        .fifo_rd_finish_i           (fifo_rd_finish         ),
        .fifo_rd_retry_i            (fifo_rd_retry          ),
        .fifo_eop_o                 (fifo_eop               ),
        .fifo_da_o                  (fifo_da                ),
        .fifo_ra_o                  (fifo_ra                ),
        .fifo_data_err_empty_o      (fifo_data_err_empty    ),
        .fifo_data_err_full_o       (fifo_data_err_full     ),
        //user interface 
        .tx_mac_wa_o                (tx_mac_wa_o            ),
        .tx_mac_wr_i                (tx_mac_wr_i            ),
        .tx_mac_data_i              (tx_mac_data_i          ),
        .tx_mac_be_i                (tx_mac_be_i            ),
        .tx_mac_sop_i               (tx_mac_sop_i           ),
        .tx_mac_eop_i               (tx_mac_eop_i           ),
        //host interface 
        .r_FullDuplex_i             (r_FullDuplex_i         ),
        .r_txHwMark_i               (r_txHwMark_i           ),
        .r_txLwMark_i               (r_txLwMark_i           )
    );

    // Connecting EMAC random generator
    emac_random_gen emac_random_gen
    (
        .rst_n                      (rst_n                  ),
        .clk                        (clk                    ),
        .init_i                     (random_init            ),
        .retry_cnt_i                (retry_cnt              ),
        .random_time_meet_o         (random_time_meet       ) 
    );

endmodule

