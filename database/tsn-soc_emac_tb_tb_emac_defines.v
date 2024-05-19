// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2002 Tadej Markovic, tadej@opencores.org 
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
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHEMACER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

`ifndef TB_EMAC_DEFINES
`define TB_EMAC_DEFINES


`define MULTICAST_XFR          0
`define UNICAST_XFR            1
`define BROADCAST_XFR          2
`define UNICAST_WRONG_XFR      3

//++
//Note:
//for simulation correctly 
//If the address in file emac_defines.v changed, the corresponding address in
//file tb_emac_defines.v should be changed also.
//--

`define EMAC_BASE              (32'h0000_0300)

/* Register space */
`define EMAC_CONFIG      `EMAC_BASE + 32'h00 /* EMAC configuration  */
`define EMAC_INT_SOURCE  `EMAC_BASE + 32'h04 /* EMAC Interrupt source register  */
`define EMAC_INT_MASK    `EMAC_BASE + 32'h08 /* EMAC Interrupt mask register  */

`define EMAC_IFGCTRL     `EMAC_BASE + 32'h0c /* EMAC TX/RX Inter Frame Gap control */
`define EMAC_PACKETLEN   `EMAC_BASE + 32'h10 /* Min/Max packet length setting */
`define EMAC_COLLISION   `EMAC_BASE + 32'h14 /* Collision configuration register */
`define EMAC_TXWMARK     `EMAC_BASE + 32'h18 /* TX FIFO Water Mark register */
`define EMAC_RXWMARK     `EMAC_BASE + 32'h1c /* RX FIFO Water Mark register */
`define EMAC_FLOWCTRL    `EMAC_BASE + 32'h20 /* Flow Control register */
`define EMAC_TXPAUSE     `EMAC_BASE + 32'h24 /* TX pause frame register */
`define EMAC_BCASTBUCKET `EMAC_BASE + 32'h28 /* Broadcast filter bucket register */
`define EMAC_MACADDR0    `EMAC_BASE + 32'h2c /* MAC address register 0 */
`define EMAC_MACADDR1    `EMAC_BASE + 32'h30 /* MAC address register 1 */
`define EMAC_HASH0       `EMAC_BASE + 32'h34 /* Hash table register 0 */
`define EMAC_HASH1       `EMAC_BASE + 32'h38 /* Hash table register 1 */
`define EMAC_MIBRDOP     `EMAC_BASE + 32'h3c /* MIB read operation register */
`define EMAC_MIBGRANT    `EMAC_BASE + 32'h40 /* MIB read grant status register */
`define EMAC_MIBRDOUT    `EMAC_BASE + 32'h44 /* MIB read data out */

`define EMAC_MDIOMODE    `EMAC_BASE + 32'h90 /* MDIO Mode Register */
`define EMAC_MDIOCOMMAND `EMAC_BASE + 32'h94 /* MDIO Command Register */
`define EMAC_MDIOADDRESS `EMAC_BASE + 32'h98 /* MDIO Address Register */
`define EMAC_MDIOTX_DATA `EMAC_BASE + 32'h9C /* MDIO Transmit Data Register */
`define EMAC_MDIORX_DATA `EMAC_BASE + 32'ha0 /* MDIO Receive Data Register */
`define EMAC_MDIOSTATUS  `EMAC_BASE + 32'ha4 /* MDIO Status Register */

/* EMAC Configuration Register */
`define EMAC_CONFIG_SPEED               (32'b100    ) /*3'b100: 1000Mbps, 3'b010: 100Mbps, 3'b001: 10Mbps*/
`define EMAC_CONFIG_LOOPBACK            (32'b1 << 3 ) /* Loop Back */
`define EMAC_CONFIG_RXEN                (32'b1 << 4 ) /* Receive Enable */
`define EMAC_CONFIG_TXEN                (32'b1 << 5 ) /* Transmit Enable */
`define EMAC_CONFIG_RXADDRCHKEN         (32'b1 << 6 ) /* Receive MAC Address Check Enable */
`define EMAC_CONFIG_ALLADDRHASHCHKEN    (32'b1 << 7 ) /* All Receive MAC Address Checked Using Hash Table Enable */
`define EMAC_CONFIG_BROADCASTFILTEREN   (32'b1 << 8 ) /* Receive Broadcast Packet Filter Enable */
`define EMAC_CONFIG_RXAPPENDCRC         (32'b1 << 9 ) /* Append CRC for Received Frame */
`define EMAC_CONFIG_CRCCHKEN            (32'b1 << 10) /* Receive Frame CRC Check Enable */
`define EMAC_CONFIG_CRCEN               (32'b1 << 11) /* Transmit Frame CRC Enable */
`define EMAC_CONFIG_FULLDUPLEX          (32'b1 << 12) /* Full Duplex Mode */
`define EMAC_CONFIG_TXMACADDREN         (32'b1 << 13) /* Replace MAC Address of Transmit Frame Enable */

/* MDIO Mode Register */
`define EMAC_MDIOMODE_CLKDIV   32'h000000FF /* Clock Divider */
`define EMAC_MDIOMODE_NOPRE    32'h00000100 /* No Preamble */
`define EMAC_MDIOMODE_RST      32'h00000200 /* MIIM Reset */

/* MDIO Command Register */
`define EMAC_MDIOCOMMAND_SCANSTAT  32'h00000001 /* Scan Status */
`define EMAC_MDIOCOMMAND_RSTAT     32'h00000002 /* Read Status */
`define EMAC_MDIOCOMMAND_WCTRLDATA 32'h00000004 /* Write Control Data */

/* MDIO Address Register */
`define EMAC_MDIOADDRESS_FIAD 32'h0000001F /* PHY Address */
`define EMAC_MDIOADDRESS_RGAD 32'h00001F00 /* RGAD Address */

/* MDIO Status Register */
`define EMAC_MDIOSTATUS_LINKFAIL    0 /* Link Fail bit */
`define EMAC_MDIOSTATUS_BUSY        1 /* MDIO Busy bit */
`define EMAC_MDIOSTATUS_NVALID      2 /* Data in MDIO Status Register is invalid bit */


`define TIME $display("  Time: %0t", $time)

`endif //TB_EMAC_DEFINES
