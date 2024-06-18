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
 *  EMAC remote monitoring
-*/

module emac_rmon ( 
    input               clk                   ,
    input               rst_n                 ,
    //TX RMON
    input  [2:0]        tx_pkt_type_rmon_i    ,
    input  [15:0]       tx_pkt_length_rmon_i  ,
    input               tx_apply_rmon_i       ,
    input  [2:0]        tx_pkt_err_type_rmon_i,
    //RX RMON
    input  [2:0]        rx_pkt_type_rmon_i    ,
    input  [15:0]       rx_pkt_length_rmon_i  ,
    input               rx_apply_rmon_i       ,
    input  [2:0]        rx_pkt_err_type_rmon_i,
    //Host interface
    input  [5:0]        r_MibRdAddr_i         ,
    input               r_MibRdApply_i        ,
    output              RstMibRdApply_o       ,
    output              r_MibRdGrant_o        ,
    output [31:0]       r_MibRdDout_o         
);
    //++  
    //interface signals
    //--  
    
    wire                reg_apply_0     ;
    wire    [4:0]       reg_addr_0      ;
    wire    [15:0]      reg_data_0      ;
    wire                reg_next_0      ;
    wire                reg_apply_1     ;
    wire    [4:0]       reg_addr_1      ;
    wire    [15:0]      reg_data_1      ;
    wire                reg_next_1      ;
    wire    [5:0]       addra           ;
    wire    [31:0]      dina            ;
    wire    [31:0]      douta           ;
    wire                wea             ;

    //++
    //Instantiating modules  
    //--

    // Connecting RX emac_rmon_addr_gen 
    emac_rmon_addr_gen rx_emac_rmon_addr_gen
    (
        .clk                      (clk                    ),                                            
        .rst_n                    (rst_n                  ),                              
        //RX RMON
        .pkt_type_rmon_i          (rx_pkt_type_rmon_i     ),                          
        .pkt_length_rmon_i        (rx_pkt_length_rmon_i   ),                                  
        .apply_rmon_i             (rx_apply_rmon_i        ),
        .pkt_err_type_rmon_i      (rx_pkt_err_type_rmon_i ),                             
        //emac_rmon_ctrl interface
        .reg_apply_o              (reg_apply_0            ),                          
        .reg_addr_o               (reg_addr_0             ),                              
        .reg_data_o               (reg_data_0             ),                              
        .reg_next_i               (reg_next_0             )                              
    );

    // Connecting TX emac_rmon_addr_gen
    emac_rmon_addr_gen tx_emac_rmon_addr_gen
    (
        .clk                      (clk                     ),                                            
        .rst_n                    (rst_n                   ),                              
        //TX RMON
        .pkt_type_rmon_i          (tx_pkt_type_rmon_i      ),                          
        .pkt_length_rmon_i        (tx_pkt_length_rmon_i    ),                                  
        .apply_rmon_i             (tx_apply_rmon_i         ),
        .pkt_err_type_rmon_i      (tx_pkt_err_type_rmon_i  ),                             
        //emac_rmon_ctrl interface
        .reg_apply_o              (reg_apply_1             ),                          
        .reg_addr_o               (reg_addr_1              ),                              
        .reg_data_o               (reg_data_1              ),                              
        .reg_next_i               (reg_next_1              )                              
    );

    // Connecting emac_rmon_ctrl
    emac_rmon_ctrl emac_rmon_ctrl
    (
        .clk                      (clk                      ),        
        .rst_n                    (rst_n                    ), 
        //interface with rmon address generator
        .reg_apply_0_i            (reg_apply_0              ),         
        .reg_addr_0_i             (reg_addr_0               ), 
        .reg_data_0_i             (reg_data_0               ), 
        .reg_next_0_o             (reg_next_0               ), 
        .reg_apply_1_i            (reg_apply_1              ),         
        .reg_addr_1_i             (reg_addr_1               ), 
        .reg_data_1_i             (reg_data_1               ), 
        .reg_next_1_o             (reg_next_1               ), 
        //interface with dual-port ram, port-a for RMON  
        .addra_o                  (addra                    ), 
        .dina_o                   (dina                     ), 
        .douta_i                  (douta                    ), 
        .wea_o                    (wea                      ),       
        //Host interface registers I/O
        .r_MibRdAddr_i            (r_MibRdAddr_i            ),     
        .r_MibRdApply_i           (r_MibRdApply_i           ), 
        .RstMibRdApply_o          (RstMibRdApply_o          ),
        .r_MibRdGrant_o           (r_MibRdGrant_o           ), 
        .r_MibRdDout_o            (r_MibRdDout_o            ) 
    );

    // Connecting emac_rmon_dpram
    emac_rmon_dpram emac_rmon_dpram
    (
        .clk                      (clk                       ), 
        //port-a for RMON  
        .addra                    (addra                     ),
        .dina                     (dina                      ),
        .douta                    (                          ),
        .wea                      (wea                       ),
        //port-b for HOST
        .addrb                    (addra                     ),
        .doutb                    (douta                     )
    );
    
endmodule

