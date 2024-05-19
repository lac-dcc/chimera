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
 * Ethernet MAC registers for CPU/SW
-*/

`include "emac_defines.v"

module emac_registers (
    //32 bits on chip host bus access interface
    input               bus2ip_clk     ,         //clock 
    input               bus2ip_rst_n   ,         //active low reset
    input  [31:0]       bus2ip_addr_i  ,
    input  [31:0]       bus2ip_data_i  ,
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output reg [31:0]   ip2bus_data_o  , 

    //EMAC control and status registers
    output [2:0]        r_speed_o            ,
    output              r_LoopEn_o           ,

    output              r_TxEn_o             , //Transmit enable
    output              r_CrcEn_o            , //Enable Tx MAC appends the CRC to every frame
    output              r_FullDuplex_o       , //full duplex mode
    output              r_txMacAddrEn_o      , //enable to replace source MAC address of transmitting packet            
    output              r_RxEn_o             , //receive enable
    output              r_rxAddrChkEn_o      , //check RX MAC address enable    
    output              r_AllAddrHashChkEn_o , //All address Hash check enable, not limited to multicast
    output              r_BroadcastFilterEn_o, //Broadcast packet filter enable
    output              r_RxAppendCrc_o      , //retain FCS of received ethernet frame when hand up
    output              r_CrcChkEn_o         , //enable CRC check of received ethernet frame              

    output [5:0]        r_IFGSet_o           , //TX Minimum IFG value
    output [5:0]        r_RxIFGSet_o         , //minimum gap between consecutive received frames
    output [15:0]       r_RxMaxLength_o      , //maximum frame length to be received (1518)
    output [15:0]       r_RxMinLength_o      , //minimum frame length to be received (64)
    output [3:0]        r_MaxRetry_o         , //Maximum retry times when collision occurred
    output [4:0]        r_txHwMark_o         , //TX FIFO high water mark
    output [4:0]        r_txLwMark_o         , //TX FIFO low water mark 
    output [4:0]        r_rxHwMark_o         , //RX FIFO high water mark
    output [4:0]        r_rxLwMark_o         , //RX FIFO low water mark
    output              r_TxPauseEn_o        , //respond to received pause frame enable
    output              r_PauseFrameSendEn_o , //enable transmit logic to send pause frame               
    output              r_TxPauseRq_o        , //Write 1 to start Tx pause frame sending, automatically cleared to zero.
    output [15:0]       r_TxPauseTV_o        , //Tx pause timer value that is sent in the pause control frame
    input               RstTxPauseRq_i       , //signal to clear r_TxPauseRq to zero
    output [15:0]       r_BroadcastBucketDepth_o    , //Bucket depeth of broadcast packet filter    
    output [15:0]       r_BroadcastBucketInterval_o , //time interval of refilling of broadcast bucket
    output [47:0]       r_MacAddr_o          , //Local MAC address
    output [31:0]       r_Hash0_o            , //HASH table for address check, lower 4 bytes
    output [31:0]       r_Hash1_o            , //HASH table for address check, upper 4 bytes 

    output [5:0]        r_MibRdAddr_o        , //Read address for MIB RAM
    output              r_MibRdApply_o       , //Write 1 to start MIB read operation
    input               RstMibRdApply_i      , //Clear r_MibRdApply to zero
    input               r_MibRdGrant_i       , //MIB read data out is available
    input  [31:0]       r_MibRdDout_i        , //MIB read data out

    //EMAC MIIM registers
    output [7:0]        r_ClkDiv_o           , 
    output              r_MiiNoPre_o         , 
    output [15:0]       r_CtrlData_o         , 
    output [4:0]        r_RGAD_o             , 
    output [4:0]        r_FIAD_o             , 
    output              r_WCtrlData_o        , 
    output              r_RStat_o            , 
    output              r_ScanStat_o         , 
    input               Busy_stat_i          , 
    input  [15:0]       Prsd_i               , 
    input               LinkFail_i           , 
    input               NValid_stat_i        , 
    input               WCtrlDataStart_i     , 
    input               RStatStart_i         , 
    input               UpdateMIIRX_DATAReg_i 
);
    parameter BLK_ADDR = `EMAC_BLK_ADR;

    wire  emac_blk_sel = (bus2ip_addr_i[31:8] == BLK_ADDR);

    //++
    //instantiate emac registers
    //--

    //EMAC configuration
    wire emac_config_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_CONFIG_ADR);
    wire [31:0] emac_config;
    eth_register #(32, 32'h1e34) u_emac_config
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (emac_config_wr), 
        .data_i         (bus2ip_data_i[31:0]),
        .data_o         (emac_config[31:0]) 
    );
    assign r_speed_o             = emac_config[2:0]; //default to 3'b100 
    assign r_LoopEn_o            = emac_config[3]  ; //default to 0
    assign r_RxEn_o              = emac_config[4]  ; //default to 1
    assign r_TxEn_o              = emac_config[5]  ; //default to 1
    assign r_rxAddrChkEn_o       = emac_config[6]  ; //default to 0
    assign r_AllAddrHashChkEn_o  = emac_config[7]  ; //default to 0
    assign r_BroadcastFilterEn_o = emac_config[8]  ; //default to 0
    assign r_RxAppendCrc_o       = emac_config[9]  ; //default to 1
    assign r_CrcChkEn_o          = emac_config[10] ; //default to 1
    assign r_CrcEn_o             = emac_config[11] ; //default to 1
    assign r_FullDuplex_o        = emac_config[12] ; //default to 1
    assign r_txMacAddrEn_o       = emac_config[13] ; //default to 0    
    //defaul value of emac_config register 14'b01_1110_0011_0100 = 14'h1e34
    
    //Inter Frame Gap control register
    wire ifg_ctrl_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_IFGCTRL_ADR);
    wire [31:0] ifg_ctrl;

    eth_register #(6, 6'd12) u_ifg_ctrl_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (ifg_ctrl_wr), 
        .data_i         (bus2ip_data_i[5:0]),
        .data_o         (ifg_ctrl[5:0]) 
    );
    assign r_IFGSet_o     = ifg_ctrl[5:0];
    assign ifg_ctrl[15:6] = 0;

    eth_register #(6, 6'd12) u_ifg_ctrl_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (ifg_ctrl_wr), 
        .data_i         (bus2ip_data_i[21:16]),
        .data_o         (ifg_ctrl[21:16]) 
    );
    assign r_RxIFGSet_o    = ifg_ctrl[21:16];
    assign ifg_ctrl[31:22] = 0;

    //Packet length register
    wire packet_len_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_PACKETLEN_ADR);
    wire [31:0] packet_len;

    eth_register #(16, 16'd1518) u_packet_len_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (packet_len_wr), 
        .data_i         (bus2ip_data_i[15:0]),
        .data_o         (packet_len[15:0]) 
    );
    assign r_RxMaxLength_o = packet_len[15:0];

    eth_register #(16, 16'd64) u_packet_len_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (packet_len_wr), 
        .data_i         (bus2ip_data_i[31:16]),
        .data_o         (packet_len[31:16]) 
    );
    assign r_RxMinLength_o = packet_len[31:16];

    //Collision configuration register
    wire collision_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_COLLISION_ADR);
    wire [31:0] collision;

    eth_register #(4, 4'd2) u_collision
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (collision_wr), 
        .data_i         (bus2ip_data_i[3:0]),
        .data_o         (collision[3:0]) 
    );
    assign r_MaxRetry_o    = collision[3:0];
    assign collision[31:4] = 28'b0;

    //TX FIFO Water Mark register
    wire tx_water_mark_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_TXWMARK_ADR);
    wire [31:0] tx_water_mark;

    eth_register #(5, 5'd30) u_tx_water_mark_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (tx_water_mark_wr), 
        .data_i         (bus2ip_data_i[4:0]),
        .data_o         (tx_water_mark[4:0]) 
    );
    assign r_txHwMark_o = tx_water_mark[4:0];
    assign tx_water_mark[15:5] = 0;

    eth_register #(5, 5'd2) u_tx_water_mark_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (tx_water_mark_wr), 
        .data_i         (bus2ip_data_i[20:16]),
        .data_o         (tx_water_mark[20:16]) 
    );
    assign r_txLwMark_o = tx_water_mark[20:16];
    assign tx_water_mark[31:21] = 0;

    //RX FIFO Water Mark register
    wire rx_water_mark_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_RXWMARK_ADR);
    wire [31:0] rx_water_mark;

    eth_register #(5, 5'd26) u_rx_water_mark_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (rx_water_mark_wr), 
        .data_i         (bus2ip_data_i[4:0]),
        .data_o         (rx_water_mark[4:0]) 
    );
    assign r_rxHwMark_o = rx_water_mark[4:0];
    assign rx_water_mark[15:5] = 0;

    eth_register #(5, 5'd16) u_rx_water_mark_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (rx_water_mark_wr), 
        .data_i         (bus2ip_data_i[20:16]),
        .data_o         (rx_water_mark[20:16]) 
    );
    assign r_rxLwMark_o = rx_water_mark[20:16];
    assign rx_water_mark[31:21] = 0;

    //Flow Control register
    wire flow_ctrl_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_FLOWCTRL_ADR);
    wire [31:0] flow_ctrl;

    eth_register #(2, 2'b11) u_flow_ctrl
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (flow_ctrl_wr), 
        .data_i         (bus2ip_data_i[1:0]),
        .data_o         (flow_ctrl[1:0]) 
    );
    assign r_TxPauseEn_o        = flow_ctrl[0]; 
    assign r_PauseFrameSendEn_o = flow_ctrl[1]; 
    assign flow_ctrl[31:2]      = 0;

    //TX pause frame register
    wire tx_pause_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_TXPAUSE_ADR);
    wire [31:0] tx_pause;

    eth_register #(16, 0) u_tx_pause_tv
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (tx_pause_wr), 
        .data_i         (bus2ip_data_i[15:0]),
        .data_o         (tx_pause[15:0]) 
    );
    assign r_TxPauseTV_o = tx_pause[15:0];

    eth_register #(1, 0) u_tx_pause_rq
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (RstTxPauseRq_i), 
        .write_en_i     (tx_pause_wr), 
        .data_i         (bus2ip_data_i[16]),
        .data_o         (tx_pause[16]) 
    );
    assign r_TxPauseTV_o   = tx_pause[16];
    assign tx_pause[31:17] = 0;

    //Broadcast filter leaky bucket register
    wire bcast_bucket_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_BCASTBUCKET_ADR);
    wire [31:0] bcast_bucket;

    eth_register #(32, 0) u_bcast_bucket
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (bcast_bucket_wr), 
        .data_i         (bus2ip_data_i[31:0]),
        .data_o         (bcast_bucket[31:0]) 
    );
    assign r_BroadcastBucketDepth_o    = bcast_bucket[15:0];
    assign r_BroadcastBucketInterval_o = bcast_bucket[31:16];

    //MAC address register 0
    wire mac_addr0_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MACADDR0_ADR);
    wire [31:0] mac_addr0;

    eth_register #(32, 0) u_mac_addr0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mac_addr0_wr), 
        .data_i         (bus2ip_data_i[31:0]),
        .data_o         (mac_addr0[31:0]) 
    );
    assign r_MacAddr_o[31:0] = mac_addr0[31:0];

    //MAC address register 1
    wire mac_addr1_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MACADDR1_ADR);
    wire [31:0] mac_addr1;

    eth_register #(16, 0) u_mac_addr1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mac_addr1_wr), 
        .data_i         (bus2ip_data_i[15:0]),
        .data_o         (mac_addr1[15:0]) 
    );
    assign r_MacAddr_o[47:32] = mac_addr1[15:0];
    assign mac_addr1[31:16]   = 0;

    //Hash table register 0
    wire hash0_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_HASH0_ADR);
    wire [31:0] hash0;

    eth_register #(32, 0) u_hash0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (hash0_wr), 
        .data_i         (bus2ip_data_i[31:0]),
        .data_o         (hash0[31:0]) 
    );
    assign r_Hash0_o = hash0[31:0];

    //Hash table register 1
    wire hash1_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_HASH1_ADR);
    wire [31:0] hash1;

    eth_register #(32, 0) u_hash1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (hash1_wr), 
        .data_i         (bus2ip_data_i[31:0]),
        .data_o         (hash1[31:0]) 
    );
    assign r_Hash1_o = hash1[31:0];

    //MIB read operation register 
    wire mib_read_op_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MIBRDOP_ADR);
    wire [31:0] mib_read_op;

    eth_register #(6, 0) u_mib_read_addr
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mib_read_op_wr), 
        .data_i         (bus2ip_data_i[5:0]),
        .data_o         (mib_read_op[5:0]) 
    );
    assign r_MibRdAddr_o     = mib_read_op[5:0];
    assign mib_read_op[15:6] = 0;

    eth_register #(1, 0) u_mib_read_apply
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (RstMibRdApply_i), 
        .write_en_i     (mib_read_op_wr), 
        .data_i         (bus2ip_data_i[16]),
        .data_o         (mib_read_op[16]) 
    );
    assign r_MibRdApply_o     = mib_read_op[16];
    assign mib_read_op[31:17] = 0;




    //MDIO MODE register
    wire mdio_mode_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MDIOMODE_ADR);
    wire [31:0] mdio_mode;

    eth_register #(8, 8'h64) u_mdio_mode_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_mode_wr), 
        .data_i         (bus2ip_data_i[7:0]),
        .data_o         (mdio_mode[7:0]) 
    );
    assign r_ClkDiv_o   = mdio_mode[7:0];

    eth_register #(1, 0) u_mdio_mode_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_mode_wr), 
        .data_i         (bus2ip_data_i[8]),
        .data_o         (mdio_mode[8]) 
    );
    assign r_MiiNoPre_o = mdio_mode[8];

    assign mdio_mode[31:9] = 0;
    
    //MDIO Command register
    wire mdio_command_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MDIOCOMMAND_ADR);
    wire [31:0] mdio_command;

    eth_register #(1, 0) u_mdio_command_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_command_wr), 
        .data_i         (bus2ip_data_i[0]),
        .data_o         (mdio_command[0]) 
    );
    assign r_ScanStat_o = mdio_command[0];

    eth_register #(1, 0) u_mdio_command_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (RStatStart_i), 
        .write_en_i     (mdio_command_wr), 
        .data_i         (bus2ip_data_i[1]),
        .data_o         (mdio_command[1]) 
    );
    assign r_RStat_o = mdio_command[1];

    eth_register #(1, 0) u_mdio_command_2
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (WCtrlDataStart_i), 
        .write_en_i     (mdio_command_wr), 
        .data_i         (bus2ip_data_i[2]),
        .data_o         (mdio_command[2]) 
    );
    assign r_WCtrlData_o = mdio_command[2];

    assign mdio_command[31:3] = 0;

    //MDIO Address register
    wire mdio_address_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MDIOADDRESS_ADR);
    wire [31:0] mdio_address;

    eth_register #(5, 0) u_mdio_address_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_address_wr), 
        .data_i         (bus2ip_data_i[4:0]),
        .data_o         (mdio_address[4:0]) 
    );
    assign r_FIAD_o   = mdio_address[4:0];

    eth_register #(5, 0) u_mdio_address_1
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_address_wr), 
        .data_i         (bus2ip_data_i[12:8]),
        .data_o         (mdio_address[12:8]) 
    );
    assign r_RGAD_o   = mdio_address[12:8];

    assign mdio_address[31:13] = 0;
    assign mdio_address[7:5]   = 0;

    //MDIO transmit data register
    wire mdio_tx_data_wr = emac_blk_sel & bus2ip_wr_ce_i & (bus2ip_addr_i[7:0] == `EMAC_MDIOTX_DATA_ADR);
    wire [31:0] mdio_tx_data;

    eth_register #(16, 0) u_mdio_tx_data_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (mdio_tx_data_wr), 
        .data_i         (bus2ip_data_i[15:0]),
        .data_o         (mdio_tx_data[15:0]) 
    );
    assign r_CtrlData_o   = mdio_tx_data[15:0];

    assign mdio_tx_data[31:16] = 0;

    //MDIO receive data register
    wire [31:0] mdio_rx_data;

    eth_register #(16, 0) u_mdio_rx_data_0
    (
        .clk            (bus2ip_clk),
        .rst_n          (bus2ip_rst_n),  
    
        .sync_reset_i   (1'b0), 
        .write_en_i     (UpdateMIIRX_DATAReg_i), //not written from bus
        .data_i         (Prsd_i[15:0]),
        .data_o         (mdio_rx_data[15:0]) 
    );
    assign mdio_rx_data[31:16] = 0;

    //++
    //bus read operation
    //--
    reg [31:0] ip2bus_data;

    always @(*) begin
        ip2bus_data = 32'h0;

        if(bus2ip_rd_ce_i == 1'b1 && emac_blk_sel) begin   
            case(bus2ip_addr_i[7:0])    //deal with offset address
                `EMAC_CONFIG_ADR       :  ip2bus_data = emac_config;
                `EMAC_IFGCTRL_ADR      :  ip2bus_data = ifg_ctrl;
                `EMAC_PACKETLEN_ADR    :  ip2bus_data = packet_len;
                `EMAC_COLLISION_ADR    :  ip2bus_data = collision;
                `EMAC_TXWMARK_ADR      :  ip2bus_data = tx_water_mark;
                `EMAC_RXWMARK_ADR      :  ip2bus_data = rx_water_mark;
                `EMAC_FLOWCTRL_ADR     :  ip2bus_data = flow_ctrl;
                `EMAC_TXPAUSE_ADR      :  ip2bus_data = tx_pause;
                `EMAC_BCASTBUCKET_ADR  :  ip2bus_data = bcast_bucket;
                `EMAC_MACADDR0_ADR     :  ip2bus_data = mac_addr0;
                `EMAC_MACADDR1_ADR     :  ip2bus_data = mac_addr1;
                `EMAC_HASH0_ADR        :  ip2bus_data = hash0;
                `EMAC_HASH1_ADR        :  ip2bus_data = hash1;
                `EMAC_MIBRDOP_ADR      :  ip2bus_data = mib_read_op;
                `EMAC_MIBGRANT_ADR     :  ip2bus_data = {31'b0, r_MibRdGrant_i};
                `EMAC_MIBRDOUT_ADR     :  ip2bus_data = r_MibRdDout_i;

                `EMAC_MDIOMODE_ADR     :  ip2bus_data = mdio_mode;  
                `EMAC_MDIOCOMMAND_ADR  :  ip2bus_data = mdio_command;
                `EMAC_MDIOADDRESS_ADR  :  ip2bus_data = mdio_address;
                `EMAC_MDIOTX_DATA_ADR  :  ip2bus_data = mdio_tx_data;
                `EMAC_MDIORX_DATA_ADR  :  ip2bus_data = mdio_rx_data;
                `EMAC_MDIOSTATUS_ADR   :  ip2bus_data = {29'b0, NValid_stat_i, Busy_stat_i, LinkFail_i};
                default                :  ip2bus_data = 32'h0;
            endcase                        
        end   
    end

    //registered output 
    always @(posedge bus2ip_clk) ip2bus_data_o <= ip2bus_data;

endmodule

