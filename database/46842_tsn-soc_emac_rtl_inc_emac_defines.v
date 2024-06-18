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

`ifndef EMAC_DEFINES
`define EMAC_DEFINES

//++
//Note:
//for simulation correctly 
//If the address in file emac_defines.v changed, the corresponding address in
//file tb_emac_defines.v should be changed also.
//--

`define EMAC_BLK_ADR           (24'h00_0003)    //EMAC block address

`define EMAC_CONFIG_ADR        (8'h00)       //EMAC configuration {txMacAddrEn, FullDuplex, CrcEn, \
                                             //CrcChkEn, RxAppendCrc, BroadcastFilterEn, AllAddrHashChkEn, rxAddrChkEn,\
                                             //TxEn, RxEn, LoopEn, speed[2:0]}
`define EMAC_INT_SOURCE_ADR    (8'h04)       //EMAC Interrupt source register
`define EMAC_INT_MASK_ADR      (8'h08)       //EMAC Interrupt mask register
`define EMAC_IFGCTRL_ADR       (8'h0c)       //EMAC TX/RX Inter Frame Gap control {10'b0, RxIFGSet[5:0], 10'b0, IFGSet[5:0]}
`define EMAC_PACKETLEN_ADR     (8'h10)       //Min/Max packet length setting {RxMinLength[15:0], RxMaxLength[15:0]}
`define EMAC_COLLISION_ADR     (8'h14)       //Collision configuration register {28'b0, MaxRetry[3:0]}
`define EMAC_TXWMARK_ADR       (8'h18)       //TX FIFO Water Mark register {11'b0, txLwMark[4:0], 11'b0, txHwMark[4:0]}
`define EMAC_RXWMARK_ADR       (8'h1c)       //RX FIFO Water Mark register {11'b0, rxLwMark[4:0], 11'b0, rxHwMark[4:0]}
`define EMAC_FLOWCTRL_ADR      (8'h20)       //Flow Control register {30'b0, PauseFrameSendEn, TxPauseEn}
`define EMAC_TXPAUSE_ADR       (8'h24)       //TX pause frame register{15'b0, TxPauseRq, TxPauseTV[15:0]}
`define EMAC_BCASTBUCKET_ADR   (8'h28)       //Broadcast filter bucket register{BroadcastBucketInterval[15:0], BroadcastBucketDepth[15:0]}
`define EMAC_MACADDR0_ADR      (8'h2c)       //MAC address register 0 {MacAddr[31:0]}
`define EMAC_MACADDR1_ADR      (8'h30)       //MAC address register 1 {16'b0, MacAddr[47:32]}
`define EMAC_HASH0_ADR         (8'h34)       //Hash table register 0 {Hash0[31:0]}
`define EMAC_HASH1_ADR         (8'h38)       //Hash table register 1 {Hash1[31:0]}
`define EMAC_MIBRDOP_ADR       (8'h3c)       //MIB read operation register {15'b0, MibRdApply, 10'b0, MibRdAddr[5:0]}
`define EMAC_MIBGRANT_ADR      (8'h40)       //MIB read grant status register {31'b0, MibRdGrant}
`define EMAC_MIBRDOUT_ADR      (8'h44)       //MIB read data out {MibRdDout[31:0]}

`define EMAC_MDIOMODE_ADR      (8'h90)       //MDIO mode {23'h0, MiiNoPre, ClkDiv[7:0]}
`define EMAC_MDIOCOMMAND_ADR   (8'h94)       //MDIO command {29'h0, WCtrlData, RStat, ScanStat}
`define EMAC_MDIOADDRESS_ADR   (8'h98)       //MDIO address {19'h0, RGAD[4:0], 3'b0, FIAD[4:0]}
`define EMAC_MDIOTX_DATA_ADR   (8'h9c)       //MDIO transmit data {16'h0, CtrlData[15:0]}
`define EMAC_MDIORX_DATA_ADR   (8'ha0)       //MDIO receive data {16'h0, Prsd[15:0]}
`define EMAC_MDIOSTATUS_ADR    (8'ha4)       //MDIO status {29'b0, NValid_stat, Busy_stat, LinkFail}

`define EMAC_TXFF_AWIDTH       (9)           //TX FIFO address width
`define EMAC_RXFF_AWIDTH       (9)           //RX FIFO address width

`timescale 1ns / 1ns
`endif
