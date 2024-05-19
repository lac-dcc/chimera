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
 * EMAC RX top level
-*/

module emac_rx (
    input               rst_n              ,
    input               clk_user           ,
    input               clk                ,
    //GMII/MII interface
    input               MRxDv_i            ,       
    input  [7:0]        MRxD_i             ,       
    input               MRxErr_i           ,       
    //flow control signals to TX MAC 
    output [15:0]       pause_quanta_o     ,   
    output              pause_quanta_val_o ,   
    //user interface 
    output              rx_mac_ra_o        ,
    input               rx_mac_rd_i        ,
    output [31:0]       rx_mac_data_o      ,
    output [1:0]        rx_mac_be_o        ,
    output              rx_mac_pa_o        ,
    output              rx_mac_sop_o       ,
    output              rx_mac_eop_o       ,
    //Host interface registers
    input               r_RxEn_i                    , //receive enable
    input               r_rxAddrChkEn_i             , //check RX MAC address enable    
    input               r_AllAddrHashChkEn_i        , //All address Hash check enable, not limited to multicast
    input  [47:0]       r_rxMacAddr_i               , //MAC address used for check
    input  [31:0]       r_Hash0_i                   , //HASH table for address check, lower 4 bytes
    input  [31:0]       r_Hash1_i                   , //HASH table for address check, upper 4 bytes 
    input               r_BroadcastFilterEn_i       , //Broadcast packet filter enable
    input  [15:0]       r_BroadcastBucketDepth_i    , //Bucket depeth of broadcast packet filter    
    input  [15:0]       r_BroadcastBucketInterval_i , //time interval of refilling of broadcast bucket
    input               r_RxAppendCrc_i             , //retain FCS of received ethernet frame when hand up
    input  [4:0]        r_rxHwMark_i                , //RX FIFO high water mark
    input  [4:0]        r_rxLwMark_i                , //RX FIFO low water mark
    input               r_CrcChkEn_i                , //enable CRC check of received ethernet frame              
    input  [5:0]        r_RxIFGSet_i                , //minimum gap between consecutive received frames
    input  [15:0]       r_RxMaxLength_i             , //maximum frame length to be received (1518)
    input  [15:0]       r_RxMinLength_i             , //minimum frame length to be received (64)
    //RMON interface
    output [15:0]       rx_pkt_length_rmon_o        ,
    output              rx_apply_rmon_o             ,
    output [2:0]        rx_pkt_err_type_rmon_o      ,
    output [2:0]        rx_pkt_type_rmon_o          
);
    //++
    //internal signals                                                              
    //--
    
    //CRC check interface
    wire            crc_en  ;       
    wire            crc_init;       
    wire            crc_err ;
    //received MAC address check interface
    wire [15:0]     frame_counter       ;
    wire            mac_rx_add_chk_err  ;
    wire            multicast_ptr       ;
    //broadcast filter interface
    wire            broadcast_ptr       ;
    wire            broadcast_drop      ;
    //MAC receive control interface 
    wire [7:0]      fifo_data       ;
    wire            fifo_data_en    ;
    wire            fifo_full       ;
    wire            fifo_data_err   ;
    wire            fifo_data_end   ;

    //++
    //instantiation                                                            
    //--

    //Connecting emac_rx_ctrl
    emac_rx_ctrl emac_rx_ctrl
    (
        .rst_n                       (rst_n                     ),                                              
        .clk                         (clk                       ),                                                 
        //GMII/MII interface  
        .MRxDv_i                     (MRxDv_i                   ),                             
        .MRxD_i                      (MRxD_i                    ),                         
        .MRxErr_i                    (MRxErr_i                  ),                             
        //receive CRC check interface
        .crc_en_o                    (crc_en                    ),                                          
        .crc_init_o                  (crc_init                  ),                           
        .crc_err_i                   (crc_err                   ),                              
        //MAC receive address check interface
        .frame_counter_o             (frame_counter             ),
        .mac_rx_add_chk_err_i        (mac_rx_add_chk_err        ),                             
        .multicast_ptr_o             (multicast_ptr             ),
        //broadcast filter
        .broadcast_ptr_o             (broadcast_ptr             ),                         
        .broadcast_drop_i            (broadcast_drop            ),                             
        //flow control signals to TX MAC  
        .pause_quanta_o              (pause_quanta_o            ),                         
        .pause_quanta_val_o          (pause_quanta_val_o        ),                         
        //MAC RX FIFO interface
        .fifo_data_o                 (fifo_data                 ),                                         
        .fifo_data_en_o              (fifo_data_en              ),                                         
        .fifo_data_err_o             (fifo_data_err             ),                         
        .fifo_data_end_o             (fifo_data_end             ),                         
        .fifo_full_i                 (fifo_full                 ),                                      
        //RMON interface
        .rx_pkt_type_rmon_o          (rx_pkt_type_rmon_o        ),                                        
        .rx_pkt_length_rmon_o        (rx_pkt_length_rmon_o      ),                                             
        .rx_apply_rmon_o             (rx_apply_rmon_o           ),                                         
        .rx_pkt_err_type_rmon_o      (rx_pkt_err_type_rmon_o    ),                                         
        //Host interface registers
        .r_RxEn_i                    (r_RxEn_i                  ),
        .r_RxIFGSet_i                (r_RxIFGSet_i              ),                             
        .r_RxMaxLength_i             (r_RxMaxLength_i           ),                           
        .r_RxMinLength_i             (r_RxMinLength_i           )                           
    );

    //Connecting emac_rx_fifo
    emac_rx_fifo  emac_rx_fifo 
    (
        .rst_n                       (rst_n                     ),
        .clk_mac                     (clk                       ), 
        .clk_sys                     (clk_user                  ), 
        //emac_rx_ctrl interface 
        .fifo_data_i                 (fifo_data                 ),
        .fifo_data_en_i              (fifo_data_en              ),
        .fifo_full_o                 (fifo_full                 ),
        .fifo_data_err_i             (fifo_data_err             ),
        .fifo_data_end_i             (fifo_data_end             ),
        //Host interface
        .r_rxHwMark_i                (r_rxHwMark_i              ),
        .r_rxLwMark_i                (r_rxLwMark_i              ),
        .r_RxAppendCrc_i             (r_RxAppendCrc_i           ),
        //user interface 
        .rx_mac_ra_o                 (rx_mac_ra_o               ),
        .rx_mac_rd_i                 (rx_mac_rd_i               ),
        .rx_mac_data_o               (rx_mac_data_o             ), 
        .rx_mac_be_o                 (rx_mac_be_o               ),
        .rx_mac_sop_o                (rx_mac_sop_o              ), 
        .rx_mac_pa_o                 (rx_mac_pa_o               ),
        .rx_mac_eop_o                (rx_mac_eop_o              ) 
    ); 

    //Connectiong emac_broadcast_filter
    emac_broadcast_filter emac_broadcast_filter
    (
        .rst_n                       (rst_n                      ),
        .clk                         (clk                        ),
        //emac_rx_ctrl interface               
        .broadcast_ptr_i             (broadcast_ptr              ),
        .broadcast_drop_o            (broadcast_drop             ),
        //Host interface
        .r_BroadcastFilterEn_i       (r_BroadcastFilterEn_i      ),
        .r_BroadcastBucketDepth_i    (r_BroadcastBucketDepth_i   ),           
        .r_BroadcastBucketInterval_i (r_BroadcastBucketInterval_i)
    ); 

    wire [31:0] rx_crc;

    //Connecting emac_crc_chk
    emac_crc_chk emac_crc_chk
    (
        .rst_n                       (rst_n           ),
        .clk                         (clk             ),
        .crc_data_i                  (fifo_data       ),
        .crc_init_i                  (crc_init        ),
        .crc_en_i                    (crc_en          ),
        .r_CrcChkEn_i                (r_CrcChkEn_i    ),
        .crc_err_o                   (crc_err         ),
        .crc_o                       (rx_crc          )
    );   

    //Connecting emac_rx_addr_chk
    wire hash_multicast = multicast_ptr | r_AllAddrHashChkEn_i;

    emac_rx_addr_chk emac_rx_addr_chk
    (
        .rst_n                       (rst_n               ),
        .clk                         (clk                 ),
        //emac_rx_ctrl interface
        .init_i                      (crc_init            ),
        .data_i                      (fifo_data           ),
        .multicast_i                 (hash_multicast      ), 
        .broadcast_i                 (broadcast_ptr       ), 
        .rx_crc_i                    (rx_crc              ),
        .frame_counter_i             (frame_counter       ),
        .rx_addr_chk_err_o           (mac_rx_add_chk_err  ),
        //Host interface
        .r_rxAddrChkEn_i             (r_rxAddrChkEn_i     ),
        .r_rxMacAddr_i               (r_rxMacAddr_i       ),
        .r_Hash0_i                   (r_Hash0_i           ), 
        .r_Hash1_i                   (r_Hash1_i           )  
    );

endmodule

