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

`ifndef PTPV2_DEFINES
`define PTPV2_DEFINES

`define PREAMBLE   8'h55
`define SFD        8'hd5

//rtc related macros
`define FNS_W  (26)                //width of fractional nanosecond(16 < FNS_W < 28)
`define NSC_W  (`FNS_W + 32)       //width of nanosecond counter (ns+fractional ns)
`define SC2NS  (32'd10_0000_0000)  //1 seconds = 10^9 nanoseconds

//rtc register addresses
`define RTC_BLK_ADDR     (24'h00_0000)    //RTC block address

`define RTC_CTL_ADDR     (8'h00)    //rtc control {29'h0, intxms_sel_o, clear_rtc_o, offset_valid_o}
`define TICK_INC_ADDR    (8'h04)    //tick increment valule tick_inc[31:0]
`define NS_OFST_ADDR     (8'h08)    //nanosecond offset ns_offset[31:0]
`define SC_OFST_ADDR0    (8'h0c)    //second offset sc_offset{16'b0, [47:32]}
`define SC_OFST_ADDR1    (8'h10)    //second offset sc_offset[31:0]
`define CUR_TM_ADDR0     (8'h14)    //current time rtc_std[79:48]
`define CUR_TM_ADDR1     (8'h18)    //current time rtc_std[47:16]
`define CUR_TM_ADDR2     (8'h1c)    //current time {rtc_std[15:0], rtc_fns[15:0]}
`define PTS_ADDR0        (8'h20)    //timestamp of pps input pts_std[79:48]
`define PTS_ADDR1        (8'h24)    //timestamp of pps input pts_std[47:16]
`define PTS_ADDR2        (8'h28)    //timestamp of pps input {pts_std[15:0], pts_fns[15:0]}
`define PPS_W_ADDR       (8'h2c)    //pulse width of pps output pps_width[31:0]

//timestamp unit addresses
`define TSU_BLK_ADDR     (24'h00_0001)  //TSU block address

`define TSU_CFG_ADDR     (8'h00)    //TSU configuration register {6'hxx, cf_from_pkt, one_step_from_pkt, 
 // crc_validate, ptp_addr_chk, ptp_ver_chk, ptpVersion[3:0], ipv6_udp_chk, 8'hxx, ing_asym_en, eg_asym_en,
 // emb_ingressTime, bypass, tc_offload, peer_delay, tc, one_step}
`define LINK_DELAY_ADDR  (8'h04)    //link delay setting for peer delay 
`define IN_ASYM_ADDR     (8'h08)    //ingress asymmetry
`define EG_ASYM_ADDR     (8'h0c)    //egress asymmetry
`define LOC_MAC_ADDR0    (8'h10)    //local mac address {tx_latency[15:0], [47:32]}
`define LOC_MAC_ADDR1    (8'h14)    //local mac address [31:0]

//tx direction
`define TX_TS_ADDR0      (8'h20)    //tx timestamp second[47:16]
`define TX_TS_ADDR1      (8'h24)    //tx timestamp {second[15:0], nanosecond[31:16]
`define TX_TS_ADDR2      (8'h28)    //tx timestamp {nanosecond[15:0], frac_ns[15:0]}

`define TX_SPF_ADDR0     (8'h2c)    //tx sourcePortIdentity[79:48]
`define TX_SPF_ADDR1     (8'h30)    //tx sourcePortIdentity[47:16]
`define TX_SPF_ADDR2     (8'h34)    //tx {sourcePortIdentity[15:0], flagField[15:0]}

`define TX_TVID_ADDR     (8'h3c)    //tx {majorSdoId[3:0], messageType[3:0], minorVersionPTP[3:0], versionPTP[3:0], sequenceId[15:0]}

//rx direction
`define RX_TS_ADDR0      (8'h50)    //rx timestamp second[47:16]
`define RX_TS_ADDR1      (8'h54)    //rx timestamp {second[15:0], nanosecond[31:16]
`define RX_TS_ADDR2      (8'h58)    //rx timestamp {nanosecond[15:0], frac_ns[15:0]}

`define RX_SPF_ADDR0     (8'h5c)    //rx sourcePortIdentity[79:48]
`define RX_SPF_ADDR1     (8'h60)    //rx sourcePortIdentity[47:16]
`define RX_SPF_ADDR2     (8'h64)    //rx {sourcePortIdentity[15:0], flagField[15:0]}

`define RX_TVID_ADDR     (8'h6c)    //rx {majorSdoId[3:0], messageType[3:0], minorVersionPTP[3:0], versionPTP[3:0], sequenceId[15:0]}

//`timescale 1ns/10fs

`endif

