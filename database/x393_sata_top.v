// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: top
 * Date: 2015-07-11  
 * Author: Alexey     
 * Description: top-level module, instantiates PS7 + sata host controller
 *
 * Copyright (c) 2015 Elphel, Inc.
 * top.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * top.v file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 *******************************************************************************/
/*
 * all signals' and modules' names and interconnections are taken from x393.v
 * to make the final integration easier - just to make an instance of 
 * what is called now 'axi_regs' and connect it  
 */
 // Including system defines at the top level can distinguish between simulation and synthesis?
`include "system_defines.vh" 

module top #(
`include "includes/x393_parameters.vh" // SuppressThisWarning VEditor - partially used
)
(
// sata serial data iface
    input   wire    RXN, 
    input   wire    RXP,
    output  wire    TXN,
    output  wire    TXP,
// sata clocking iface
    input   wire    EXTCLK_P,
    input   wire    EXTCLK_N
);

wire            axi_aclk0;
wire            sclk    ; // Just output from SATA subsystem SuppressThisWarning VEditor Not used
wire            sata_rst; // Just output from SATA subsystem SuppressThisWarning VEditor Not used
wire            extrst;
wire    [3:0]   fclk;
wire    [3:0]   frst;
//wire            axi_aclk;
wire            axi_rst;
wire            hclk;
wire            comb_rst;
wire    [31:0]  maxi1_araddr;
wire            maxi1_arvalid;
wire            maxi1_arready;
wire    [11:0]  maxi1_arid;
wire    [3:0]   maxi1_arlen;
wire    [1:0]   maxi1_arsize;
wire    [1:0]   maxi1_arburst;
wire    [31:0]  maxi1_rdata;
wire            maxi1_rvalid;
wire            maxi1_rready;
wire    [11:0]  maxi1_rid;
wire            maxi1_rlast;
wire    [1:0]   maxi1_rresp;
wire    [31:0]  maxi1_awaddr;
wire            maxi1_awvalid;
wire            maxi1_awready;
wire    [11:0]  maxi1_awid;
wire    [3:0]   maxi1_awlen;
wire    [1:0]   maxi1_awsize;
wire    [1:0]   maxi1_awburst;
wire    [31:0]  maxi1_wdata;
wire            maxi1_wvalid;
wire            maxi1_wready;
wire    [11:0]  maxi1_wid;
wire            maxi1_wlast;
wire    [3:0]   maxi1_wstb;
wire            maxi1_bvalid;
wire            maxi1_bready;
wire    [11:0]  maxi1_bid;
wire    [1:0]   maxi1_bresp;
reg             axi_rst_pre;

// membridge
wire [31:0] afi3_awaddr;   // output[31:0]
wire        afi3_awvalid;  // output
wire        afi3_awready;     // input
wire [ 5:0] afi3_awid;     // output[5:0] 
wire [ 1:0] afi3_awlock;     // output[1:0] 
wire [ 3:0] afi3_awcache;     // output[3:0] 
wire [ 2:0] afi3_awprot;     // output[2:0] 
wire [ 3:0] afi3_awlen;     // output[3:0] 
wire [ 1:0] afi3_awsize;     // output[2:0] 
wire [ 1:0] afi3_awburst;     // output[1:0] 
wire [ 3:0] afi3_awqos;     // output[3:0] 
wire [63:0] afi3_wdata;     // output[63:0] 
wire        afi3_wvalid;     // output
wire        afi3_wready;     // input
wire [ 5:0] afi3_wid;     // output[5:0] 
wire        afi3_wlast;     // output
wire [ 7:0] afi3_wstrb;     // output[7:0] 
wire        afi3_bvalid;     // input
wire        afi3_bready;     // output
wire [ 5:0] afi3_bid;     // input[5:0] 
wire [ 1:0] afi3_bresp;     // input[1:0] 
wire [ 7:0] afi3_wcount;     // input[7:0] 
wire [ 5:0] afi3_wacount;     // input[5:0] 
wire        afi3_wrissuecap1en;     // output
wire [31:0] afi3_araddr;     // output[31:0] 
wire        afi3_arvalid;     // output
wire        afi3_arready;     // input
wire [ 5:0] afi3_arid;     // output[5:0] 
wire [ 1:0] afi3_arlock;     // output[1:0] 
wire [ 3:0] afi3_arcache;     // output[3:0] 
wire [ 2:0] afi3_arprot;     // output[2:0] 
wire [ 3:0] afi3_arlen;     // output[3:0] 
wire [ 1:0] afi3_arsize;     // output[2:0] 
wire [ 1:0] afi3_arburst;     // output[1:0] 
wire [ 3:0] afi3_arqos;     // output[3:0] 
wire [63:0] afi3_rdata;     // input[63:0] 
wire        afi3_rvalid;     // input
wire        afi3_rready;     // output
wire [ 5:0] afi3_rid;     // input[5:0] 
wire        afi3_rlast;     // input
wire [ 1:0] afi3_rresp;     // input[2:0] 
wire [ 7:0] afi3_rcount;     // input[7:0] 
wire [ 2:0] afi3_racount;     // input[2:0] 
wire        afi3_rdissuecap1en; // output

wire        irq;              // ps7 IRQ

assign comb_rst=~frst[0] | frst[1];
always @(posedge comb_rst or posedge axi_aclk0) begin
    if (comb_rst) axi_rst_pre <= 1'b1;
    else          axi_rst_pre <= 1'b0;
end

select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_axi_aclk0_i (
    .o          (axi_aclk0),    // output
    .i          (fclk[0]),      // input
    .clr        (1'b0)          // input
);

select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_axi_rst_i (
    .o          (axi_rst),      // output
    .i          (axi_rst_pre),  // input
    .clr        (1'b0)          // input
);

select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_extrst_i (
    .o          (extrst),       // output
    .i          (axi_rst_pre),  // input
    .clr        (1'b0)          // input
);


axi_hp_clk #(
    .CLKIN_PERIOD(20.000),
    .CLKFBOUT_MULT_AXIHP(18),
    .CLKFBOUT_DIV_AXIHP(6)
) axi_hp_clk_i (
    .rst          (axi_rst), // input
    .clk_in       (axi_aclk0), // input
    .clk_axihp    (hclk), // output
    .locked_axihp () // output // not controlled?
);

sata_ahci_top sata_top(
    .sata_clk                   (sclk),
    // reliable clock to source drp and cpll lock det circuits
    .reliable_clk               (axi_aclk0),
    .hclk                       (hclk),
    .sata_rst                   (sata_rst),
    .arst                       (extrst),
    .ACLK                       (axi_aclk0),
    .ARESETN                    (axi_rst/* | sata_rst*/),
// AXI PS Master GP1: Read Address    
    .ARADDR                     (maxi1_araddr),
    .ARVALID                    (maxi1_arvalid),
    .ARREADY                    (maxi1_arready),
    .ARID                       (maxi1_arid),
    .ARLEN                      (maxi1_arlen),
    .ARSIZE                     (maxi1_arsize),
    .ARBURST                    (maxi1_arburst),
// AXI PS Master GP1: Read Data
    .RDATA                      (maxi1_rdata),
    .RVALID                     (maxi1_rvalid),
    .RREADY                     (maxi1_rready),
    .RID                        (maxi1_rid),
    .RLAST                      (maxi1_rlast),
    .RRESP                      (maxi1_rresp),
// AXI PS Master GP1: Write Address    
    .AWADDR                     (maxi1_awaddr),
    .AWVALID                    (maxi1_awvalid),
    .AWREADY                    (maxi1_awready),
    .AWID                       (maxi1_awid),
    .AWLEN                      (maxi1_awlen),
    .AWSIZE                     (maxi1_awsize),
    .AWBURST                    (maxi1_awburst),
// AXI PS Master GP1: Write Data
    .WDATA                      (maxi1_wdata),
    .WVALID                     (maxi1_wvalid),
    .WREADY                     (maxi1_wready),
    .WID                        (maxi1_wid),
    .WLAST                      (maxi1_wlast),
    .WSTRB                      (maxi1_wstb),
// AXI PS Master GP1: Write response
    .BVALID                     (maxi1_bvalid),
    .BREADY                     (maxi1_bready),
    .BID                        (maxi1_bid),
    .BRESP                      (maxi1_bresp),

/*
 * Data interface
 */
    .afi_awaddr                 (afi3_awaddr),
    .afi_awvalid                (afi3_awvalid),
    .afi_awready                (afi3_awready),
    .afi_awid                   (afi3_awid),
    .afi_awlock                 (afi3_awlock),
    .afi_awcache                (afi3_awcache),
    .afi_awprot                 (afi3_awprot),
    .afi_awlen                  (afi3_awlen),
    .afi_awsize                 (afi3_awsize),
    .afi_awburst                (afi3_awburst),
    .afi_awqos                  (afi3_awqos),
    // write data
    .afi_wdata                  (afi3_wdata),
    .afi_wvalid                 (afi3_wvalid),
    .afi_wready                 (afi3_wready),
    .afi_wid                    (afi3_wid),
    .afi_wlast                  (afi3_wlast),
    .afi_wstrb                  (afi3_wstrb),
    // write response
    .afi_bvalid                 (afi3_bvalid),
    .afi_bready                 (afi3_bready),
    .afi_bid                    (afi3_bid),
    .afi_bresp                  (afi3_bresp),
    // PL extra (non-AXI) signal
    .afi_wcount                 (afi3_wcount),
    .afi_wacount                (afi3_wacount),
    .afi_wrissuecap1en          (afi3_wrissuecap1en),
    // AXI_HP signals - read channel
    // read address
    .afi_araddr                 (afi3_araddr),
    .afi_arvalid                (afi3_arvalid),
    .afi_arready                (afi3_arready),
    .afi_arid                   (afi3_arid),
    .afi_arlock                 (afi3_arlock),
    .afi_arcache                (afi3_arcache),
    .afi_arprot                 (afi3_arprot),
    .afi_arlen                  (afi3_arlen),
    .afi_arsize                 (afi3_arsize),
    .afi_arburst                (afi3_arburst),
    .afi_arqos                  (afi3_arqos),
    // read data
    .afi_rdata                  (afi3_rdata),
    .afi_rvalid                 (afi3_rvalid),
    .afi_rready                 (afi3_rready),
    .afi_rid                    (afi3_rid),
    .afi_rlast                  (afi3_rlast),
    .afi_rresp                  (afi3_rresp),
    // PL extra (non-AXI) signal
    .afi_rcount                 (afi3_rcount),
    .afi_racount                (afi3_racount),
    .afi_rdissuecap1en          (afi3_rdissuecap1en),

    .irq                        (irq), // output wire 

/*
 * PHY
 */
    .TXN                        (TXN),
    .TXP                        (TXP),
    .RXN                        (RXN),
    .RXP                        (RXP),

    .EXTCLK_P                   (EXTCLK_P),
    .EXTCLK_N                   (EXTCLK_N)
);

PS7 ps7_i (
 // EMIO interface
 // CAN interface
    .EMIOCAN0PHYTX(),            // CAN 0 TX, output
    .EMIOCAN0PHYRX(),            // CAN 0 RX, input
    .EMIOCAN1PHYTX(),            // Can 1 TX, output
    .EMIOCAN1PHYRX(),            // CAN 1 RX, input
 // GMII 0
    .EMIOENET0GMIICRS(),         // GMII 0 Carrier sense, input
    .EMIOENET0GMIICOL(),         // GMII 0 Collision detect, input
    .EMIOENET0EXTINTIN(),        // GMII 0 Controller Interrupt input, input
    // GMII 0 TX signals
    .EMIOENET0GMIITXCLK(),       // GMII 0 TX clock, input
    .EMIOENET0GMIITXD(),         // GMII 0 Tx Data[7:0], output
    .EMIOENET0GMIITXEN(),        // GMII 0 Tx En, output
    .EMIOENET0GMIITXER(),        // GMII 0 Tx Err, output
    // GMII 0 TX timestamp signals
    .EMIOENET0SOFTX(),           // GMII 0 Tx Tx Start-of-Frame, output
    .EMIOENET0PTPDELAYREQTX(),   // GMII 0 Tx PTP delay req frame detected, output
    .EMIOENET0PTPPDELAYREQTX(),  // GMII 0 Tx PTP peer delay frame detect, output
    .EMIOENET0PTPPDELAYRESPTX(), // GMII 0 Tx PTP pear delay response frame detected, output
    .EMIOENET0PTPSYNCFRAMETX(),  // GMII 0 Tx PTP sync frame detected, output
    // GMII 0 RX signals
    .EMIOENET0GMIIRXCLK(),       // GMII 0 Rx Clock, input
    .EMIOENET0GMIIRXD(),         // GMII 0 Rx Data (7:0), input
    .EMIOENET0GMIIRXDV(),        // GMII 0 Rx Data valid, input
    .EMIOENET0GMIIRXER(),        // GMII 0 Rx Error, input
    // GMII 0 RX timestamp signals
    .EMIOENET0SOFRX(),           // GMII 0 Rx Start of Frame, output
    .EMIOENET0PTPDELAYREQRX(),   // GMII 0 Rx PTP delay req frame detected
    .EMIOENET0PTPPDELAYREQRX(),  // GMII 0 Rx PTP peer delay frame detected, output
    .EMIOENET0PTPPDELAYRESPRX(), // GMII 0 Rx PTP peer delay response frame detected, output
    .EMIOENET0PTPSYNCFRAMERX(),  // GMII 0 Rx PTP sync frame detected, output
    // MDIO 0
    .EMIOENET0MDIOMDC(),         // MDIO 0 MD clock output, output
    .EMIOENET0MDIOO(),           // MDIO 0 MD data output, output
    .EMIOENET0MDIOTN(),          // MDIO 0 MD data 3-state, output
    .EMIOENET0MDIOI(),           // MDIO 0 MD data input, input

 // GMII 1
    .EMIOENET1GMIICRS(),         // GMII 1 Carrier sense, input
    .EMIOENET1GMIICOL(),         // GMII 1 Collision detect, input
    .EMIOENET1EXTINTIN(),        // GMII 1 Controller Interrupt input, input
    // GMII 1 TX signals
    .EMIOENET1GMIITXCLK(),       // GMII 1 TX clock, input
    .EMIOENET1GMIITXD(),         // GMII 1 Tx Data[7:0], output
    .EMIOENET1GMIITXEN(),        // GMII 1 Tx En, output
    .EMIOENET1GMIITXER(),        // GMII 1 Tx Err, output
    // GMII 1 TX timestamp signals
    .EMIOENET1SOFTX(),           // GMII 1 Tx Tx Start-of-Frame, output
    .EMIOENET1PTPDELAYREQTX(),   // GMII 1 Tx PTP delay req frame detected, output
    .EMIOENET1PTPPDELAYREQTX(),  // GMII 1 Tx PTP peer delay frame detect, output
    .EMIOENET1PTPPDELAYRESPTX(), // GMII 1 Tx PTP pear delay response frame detected, output
    .EMIOENET1PTPSYNCFRAMETX(),  // GMII 1 Tx PTP sync frame detected, output
    // GMII 1 RX signals
    .EMIOENET1GMIIRXCLK(),       // GMII 1 Rx Clock, input
    .EMIOENET1GMIIRXD(),         // GMII 1 Rx Data (7:0), input
    .EMIOENET1GMIIRXDV(),        // GMII 1 Rx Data valid, input
    .EMIOENET1GMIIRXER(),        // GMII 1 Rx Error, input
    // GMII 1 RX timestamp signals
    .EMIOENET1SOFRX(),           // GMII 1 Rx Start of Frame, output
    .EMIOENET1PTPDELAYREQRX(),   // GMII 1 Rx PTP delay req frame detected
    .EMIOENET1PTPPDELAYREQRX(),  // GMII 1 Rx PTP peer delay frame detected, output
    .EMIOENET1PTPPDELAYRESPRX(), // GMII 1 Rx PTP peer delay response frame detected, output
    .EMIOENET1PTPSYNCFRAMERX(),  // GMII 1 Rx PTP sync frame detected, output
    // MDIO 1
    .EMIOENET1MDIOMDC(),         // MDIO 1 MD clock output, output
    .EMIOENET1MDIOO(),           // MDIO 1 MD data output, output
    .EMIOENET1MDIOTN(),          // MDIO 1 MD data 3-state, output
    .EMIOENET1MDIOI(),           // MDIO 1 MD data input, input
  // EMIO GPIO
    .EMIOGPIOO(),                // EMIO GPIO Data out[63:0], output
    .EMIOGPIOI(/*gpio_in[63:0]*/),   // EMIO GPIO Data in[63:0], input
    .EMIOGPIOTN(),               // EMIO GPIO OutputEnable[63:0], output
  // EMIO I2C 0  
    .EMIOI2C0SCLO(),             // I2C 0 SCL OUT, output // manual says input
    .EMIOI2C0SCLI(),             // I2C 0 SCL IN,  input  // manual says output
    .EMIOI2C0SCLTN(),            // I2C 0 SCL EN,  output // manual says input 
    .EMIOI2C0SDAO(),             // I2C 0 SDA OUT, output // manual says input
    .EMIOI2C0SDAI(),             // I2C 0 SDA IN,  input  // manual says output
    .EMIOI2C0SDATN(),            // I2C 0 SDA EN,  output // manual says input
  // EMIO I2C 1  
    .EMIOI2C1SCLO(),             // I2C 1 SCL OUT, output // manual says input
    .EMIOI2C1SCLI(),             // I2C 1 SCL IN,  input  // manual says output
    .EMIOI2C1SCLTN(),            // I2C 1 SCL EN,  output // manual says input 
    .EMIOI2C1SDAO(),             // I2C 1 SDA OUT, output // manual says input
    .EMIOI2C1SDAI(),             // I2C 1 SDA IN,  input  // manual says output
    .EMIOI2C1SDATN(),            // I2C 1 SDA EN,  output // manual says input
// JTAG
    .EMIOPJTAGTCK(),             // JTAG TCK, input
    .EMIOPJTAGTMS(),             // JTAG TMS, input
    .EMIOPJTAGTDI(),             // JTAG TDI, input
    .EMIOPJTAGTDO(),             // JTAG TDO, output
    .EMIOPJTAGTDTN(),            // JTAG TDO OE, output
 // SDIO 0  
    .EMIOSDIO0CLKFB(),           // SDIO 0 Clock feedback, input
    .EMIOSDIO0CLK(),             // SDIO 0 Clock, output
    .EMIOSDIO0CMDI(),            // SDIO 0 Command in, input
    .EMIOSDIO0CMDO(),            // SDIO 0 Command out, output
    .EMIOSDIO0CMDTN(),           // SDIO 0 command OE, output
    .EMIOSDIO0DATAI(),           // SDIO 0 Data in [3:0], input
    .EMIOSDIO0DATAO(),           // SDIO 0 Data out [3:0], output
    .EMIOSDIO0DATATN(),          // SDIO 0 Data OE [3:0], output
    .EMIOSDIO0CDN(),             // SDIO 0 Card detect, input
    .EMIOSDIO0WP(),              // SDIO 0 Write protect, input
    .EMIOSDIO0BUSPOW(),          // SDIO 0 Power control, output
    .EMIOSDIO0LED(),             // SDIO 0 LED control, output
    .EMIOSDIO0BUSVOLT(),         // SDIO 0 Bus voltage [2:0], output
 // SDIO 1  
    .EMIOSDIO1CLKFB(),           // SDIO 1 Clock feedback, input
    .EMIOSDIO1CLK(),             // SDIO 1 Clock, output
    .EMIOSDIO1CMDI(),            // SDIO 1 Command in, input
    .EMIOSDIO1CMDO(),            // SDIO 1 Command out, output
    .EMIOSDIO1CMDTN(),           // SDIO 1 command OE, output
    .EMIOSDIO1DATAI(),           // SDIO 1 Data in [3:0], input
    .EMIOSDIO1DATAO(),           // SDIO 1 Data out [3:0], output
    .EMIOSDIO1DATATN(),          // SDIO 1 Data OE [3:0], output
    .EMIOSDIO1CDN(),             // SDIO 1 Card detect, input
    .EMIOSDIO1WP(),              // SDIO 1 Write protect, input
    .EMIOSDIO1BUSPOW(),          // SDIO 1 Power control, output
    .EMIOSDIO1LED(),             // SDIO 1 LED control, output
    .EMIOSDIO1BUSVOLT(),         // SDIO 1 Bus voltage [2:0], output
  // SPI 0    
    .EMIOSPI0SCLKI(),            // SPI 0 CLK in , input
    .EMIOSPI0SCLKO(),            // SPI 0 CLK out, output
    .EMIOSPI0SCLKTN(),           // SPI 0 CLK OE, output
    .EMIOSPI0SI(),               // SPI 0 MOSI in , input
    .EMIOSPI0MO(),               // SPI 0 MOSI out , output
    .EMIOSPI0MOTN(),             // SPI 0 MOSI OE, output
    .EMIOSPI0MI(),               // SPI 0 MISO in, input
    .EMIOSPI0SO(),               // SPI 0 MISO out, output
    .EMIOSPI0STN(),              // SPI 0 MISO OE, output
    .EMIOSPI0SSIN(),             // SPI 0 Slave select 0 in, input
    .EMIOSPI0SSON(),             // SPI 0 Slave select [2:0] out, output
    .EMIOSPI0SSNTN(),            // SPI 0 Slave select OE, output
  // SPI 1    
    .EMIOSPI1SCLKI(),            // SPI 1 CLK in , input
    .EMIOSPI1SCLKO(),            // SPI 1 CLK out, output
    .EMIOSPI1SCLKTN(),           // SPI 1 CLK OE, output
    .EMIOSPI1SI(),               // SPI 1 MOSI in , input
    .EMIOSPI1MO(),               // SPI 1 MOSI out , output
    .EMIOSPI1MOTN(),             // SPI 1 MOSI OE, output
    .EMIOSPI1MI(),               // SPI 1 MISO in, input
    .EMIOSPI1SO(),               // SPI 1 MISO out, output
    .EMIOSPI1STN(),              // SPI 1 MISO OE, output
    .EMIOSPI1SSIN(),             // SPI 1 Slave select 0 in, input
    .EMIOSPI1SSON(),             // SPI 1 Slave select [2:0] out, output
    .EMIOSPI1SSNTN(),            // SPI 1 Slave select OE, output
// TPIU signals (Trace)    
    .EMIOTRACECTL(),             // Trace CTL, output
    .EMIOTRACEDATA(),            // Trace Data[31:0], output
    .EMIOTRACECLK(),             // Trace CLK, input
// Timers/counters    
    .EMIOTTC0CLKI(),             // Counter/Timer 0 clock in [2:0], input
    .EMIOTTC0WAVEO(),            // Counter/Timer 0 wave out[2:0], output
    .EMIOTTC1CLKI(),             // Counter/Timer 1 clock in [2:0], input
    .EMIOTTC1WAVEO(),            // Counter/Timer 1 wave out[2:0], output
 //UART 0
    .EMIOUART0TX(),              // UART 0 Transmit, output
    .EMIOUART0RX(),              // UART 0 Receive, input
    .EMIOUART0CTSN(),            // UART 0 Clear To Send, input
    .EMIOUART0RTSN(),            // UART 0 Ready to Send, output
    .EMIOUART0DSRN(),            // UART 0 Data Set Ready , input
    .EMIOUART0DCDN(),            // UART 0 Data Carrier Detect, input
    .EMIOUART0RIN(),             // UART 0 Ring Indicator, input
    .EMIOUART0DTRN(),            // UART 0 Data Terminal Ready, output
 //UART 1
    .EMIOUART1TX(),              // UART 1 Transmit, output
    .EMIOUART1RX(),              // UART 1 Receive, input
    .EMIOUART1CTSN(),            // UART 1 Clear To Send, input
    .EMIOUART1RTSN(),            // UART 1 Ready to Send, output
    .EMIOUART1DSRN(),            // UART 1 Data Set Ready , input
    .EMIOUART1DCDN(),            // UART 1 Data Carrier Detect, input
    .EMIOUART1RIN(),             // UART 1 Ring Indicator, input
    .EMIOUART1DTRN(),            // UART 1 Data Terminal Ready, output
 // USB 0    
    .EMIOUSB0PORTINDCTL(),       // USB 0 Port Indicator [1:0], output 
    .EMIOUSB0VBUSPWRFAULT(),     // USB 0 Power Fault, input
    .EMIOUSB0VBUSPWRSELECT(),    // USB 0 Power Select, output
 // USB 1    
    .EMIOUSB1PORTINDCTL(),       // USB 1 Port Indicator [1:0], output 
    .EMIOUSB1VBUSPWRFAULT(),     // USB 1 Power Fault, input
    .EMIOUSB1VBUSPWRSELECT(),    // USB 1 Power Select, output
 // Watchdog Timer    
    .EMIOWDTCLKI(),              // Watchdog Timer Clock in, input
    .EMIOWDTRSTO(),              // Watchdog Timer Reset out, output
 // DMAC 0  
    .DMA0ACLK(),                 // DMAC 0 Clock, input
    .DMA0DRVALID(),              // DMAC 0 DMA Request Valid, input
    .DMA0DRLAST(),               // DMAC 0 DMA Request Last, input
    .DMA0DRTYPE(),               // DMAC 0 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA0DRREADY(),              // DMAC 0 DMA Request Ready, output
    .DMA0DAVALID(),              // DMAC 0 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA0DAREADY(),              // DMAC 0 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA0DATYPE(),               // DMAC 0 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA0RSTN(),                 // DMAC 0 RESET output (reserved, do not use), output
 // DMAC 1 
    .DMA1ACLK(),                 // DMAC 1 Clock, input
    .DMA1DRVALID(),              // DMAC 1 DMA Request Valid, input
    .DMA1DRLAST(),               // DMAC 1 DMA Request Last, input
    .DMA1DRTYPE(),               // DMAC 1 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA1DRREADY(),              // DMAC 1 DMA Request Ready, output
    .DMA1DAVALID(),              // DMAC 1 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA1DAREADY(),              // DMAC 1 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA1DATYPE(),               // DMAC 1 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA1RSTN(),                 // DMAC 1 RESET output (reserved, do not use), output
 // DMAC 2  
    .DMA2ACLK(),                 // DMAC 2 Clock, input
    .DMA2DRVALID(),              // DMAC 2 DMA Request Valid, input
    .DMA2DRLAST(),               // DMAC 2 DMA Request Last, input
    .DMA2DRTYPE(),               // DMAC 2 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA2DRREADY(),              // DMAC 2 DMA Request Ready, output
    .DMA2DAVALID(),              // DMAC 2 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA2DAREADY(),              // DMAC 2 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA2DATYPE(),               // DMAC 2 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA2RSTN(),                 // DMAC 2 RESET output (reserved, do not use), output
 // DMAC 3  
    .DMA3ACLK(),                 // DMAC 3 Clock, input
    .DMA3DRVALID(),              // DMAC 3 DMA Request Valid, input
    .DMA3DRLAST(),               // DMAC 3 DMA Request Last, input
    .DMA3DRTYPE(),               // DMAC 3 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA3DRREADY(),              // DMAC 3 DMA Request Ready, output
    .DMA3DAVALID(),              // DMAC 3 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA3DAREADY(),              // DMAC 3 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA3DATYPE(),               // DMAC 3 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA3RSTN(),                 // DMAC 3 RESET output (reserved, do not use), output
 // Interrupt signals
    .IRQF2P({19'b0,irq}),        // Interrupts, PL to PS [19:0], input
    .IRQP2F(),                   // Interrupts, PS to PL [28:0], output
 // Event Signals
    .EVENTEVENTI(),              // EVENT Wake up one or both CPU from WFE state, input
    .EVENTEVENTO(),              // EVENT Asserted when one of the COUs executed SEV instruction, output
    .EVENTSTANDBYWFE(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an event, output
    .EVENTSTANDBYWFI(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an interrupt, output
 // PL Resets and clocks
    .FCLKCLK(fclk[3:0]),         // PL Clocks [3:0], output
    .FCLKCLKTRIGN(),             // PL Clock Throttle Control [3:0], input
    .FCLKRESETN(frst[3:0]),      // PL General purpose user reset [3:0], output (active low)
// Debug signals
    .FTMTP2FDEBUG(),             // Debug General purpose debug output [31:0], output
    .FTMTF2PDEBUG(),             // Debug General purpose debug input [31:0], input
    .FTMTP2FTRIG(),              // Debug Trigger PS to PL [3:0], output
    .FTMTP2FTRIGACK(),           // Debug Trigger PS to PL acknowledge[3:0], input
    .FTMTF2PTRIG(),              // Debug Trigger PL to PS [3:0], input
    .FTMTF2PTRIGACK(),           // Debug Trigger PL to PS acknowledge[3:0], output
    .FTMDTRACEINCLOCK(),         // Debug Trace PL to PS Clock, input
    .FTMDTRACEINVALID(),         // Debug Trace PL to PS Clock, data&id valid, input
    .FTMDTRACEINDATA(),          // Debug Trace PL to PS data [31:0], input
    .FTMDTRACEINATID(),          // Debug Trace PL to PS ID [3:0], input
// DDR Urgent
    .DDRARB(),                   // DDR Urgent[3:0], input
    
// SRAM interrupt (on rising edge)
    .EMIOSRAMINTIN(),             // SRAM interrupt #50 shared with NAND busy, input
// AXI interfaces
    .FPGAIDLEN(1'b1),             //Idle PL AXI interfaces (active low), input
// AXI PS Master GP0    
// AXI PS Master GP0: Clock, Reset
    .MAXIGP0ACLK(/*axi_aclk*/),       // AXI PS Master GP0 Clock , input
//    .MAXIGP0ACLK(/*fclk[0]*/),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(/*~fclk[0]*/),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(/*axi_naclk*/),       // AXI PS Master GP0 Clock , input
    //
    .MAXIGP0ARESETN(),            // AXI PS Master GP0 Reset, output
// AXI PS Master GP0: Read Address    
    .MAXIGP0ARADDR  (/*axi_araddr[31:0]*/), // AXI PS Master GP0 ARADDR[31:0], output  
    .MAXIGP0ARVALID (/*axi_arvalid*/),     // AXI PS Master GP0 ARVALID, output
    .MAXIGP0ARREADY (/*axi_arready*/),     // AXI PS Master GP0 ARREADY, input
    .MAXIGP0ARID    (/*axi_arid[11:0]*/),     // AXI PS Master GP0 ARID[11:0], output
    .MAXIGP0ARLOCK   (),  // AXI PS Master GP0 ARLOCK[1:0], output
    .MAXIGP0ARCACHE  (),// AXI PS Master GP0 ARCACHE[3:0], output
    .MAXIGP0ARPROT(),  // AXI PS Master GP0 ARPROT[2:0], output
    .MAXIGP0ARLEN   (/*axi_arlen[3:0]*/),    // AXI PS Master GP0 ARLEN[3:0], output
    .MAXIGP0ARSIZE  (/*axi_arsize[1:0]*/),  // AXI PS Master GP0 ARSIZE[1:0], output
    .MAXIGP0ARBURST (/*axi_arburst[1:0]*/),// AXI PS Master GP0 ARBURST[1:0], output
    .MAXIGP0ARQOS    (),    // AXI PS Master GP0 ARQOS[3:0], output
// AXI PS Master GP0: Read Data
    .MAXIGP0RDATA   (/*axi_rdata[31:0]*/),   // AXI PS Master GP0 RDATA[31:0], input
    .MAXIGP0RVALID  (/*axi_rvalid*/),       // AXI PS Master GP0 RVALID, input
    .MAXIGP0RREADY  (/*axi_rready*/),       // AXI PS Master GP0 RREADY, output
    .MAXIGP0RID     (/*axi_rid[11:0]*/),       // AXI PS Master GP0 RID[11:0], input
    .MAXIGP0RLAST   (/*axi_rlast*/),         // AXI PS Master GP0 RLAST, input
    .MAXIGP0RRESP   (/*axi_rresp[1:0]*/),    // AXI PS Master GP0 RRESP[1:0], input
    
// AXI PS Master GP0: Write Address    
    .MAXIGP0AWADDR  (/*axi_awaddr[31:0]*/), // AXI PS Master GP0 AWADDR[31:0], output
    .MAXIGP0AWVALID (/*axi_awvalid*/),     // AXI PS Master GP0 AWVALID, output
    .MAXIGP0AWREADY (/*axi_awready*/),     // AXI PS Master GP0 AWREADY, input
    .MAXIGP0AWID    (/*axi_awid[11:0]*/),     // AXI PS Master GP0 AWID[11:0], output
    .MAXIGP0AWLOCK   (),  // AXI PS Master GP0 AWLOCK[1:0], output
    .MAXIGP0AWCACHE  (),// AXI PS Master GP0 AWCACHE[3:0], output
    .MAXIGP0AWPROT   (),  // AXI PS Master GP0 AWPROT[2:0], output
    .MAXIGP0AWLEN   (/*axi_awlen[3:0]*/),    // AXI PS Master GP0 AWLEN[3:0], output
    .MAXIGP0AWSIZE  (/*axi_awsize[1:0]*/),  // AXI PS Master GP0 AWSIZE[1:0], output
    .MAXIGP0AWBURST (/*axi_awburst[1:0]*/),// AXI PS Master GP0 AWBURST[1:0], output
    .MAXIGP0AWQOS    (),          // AXI PS Master GP0 AWQOS[3:0], output
// AXI PS Master GP0: Write Data
    .MAXIGP0WDATA   (/*axi_wdata[31:0]*/),   // AXI PS Master GP0 WDATA[31:0], output
    .MAXIGP0WVALID  (/*axi_wvalid*/),       // AXI PS Master GP0 WVALID, output
    .MAXIGP0WREADY  (/*axi_wready*/),       // AXI PS Master GP0 WREADY, input
    .MAXIGP0WID     (/*axi_wid[11:0]*/),       // AXI PS Master GP0 WID[11:0], output
    .MAXIGP0WLAST   (/*axi_wlast*/),         // AXI PS Master GP0 WLAST, output
    .MAXIGP0WSTRB   (/*axi_wstb[3:0]*/),    // AXI PS Master GP0 WSTRB[3:0], output
// AXI PS Master GP0: Write response
    .MAXIGP0BVALID  (/*axi_bvalid*/),       // AXI PS Master GP0 BVALID, input
    .MAXIGP0BREADY  (/*axi_bready*/),       // AXI PS Master GP0 BREADY, output
    .MAXIGP0BID     (/*axi_bid[11:0]*/),       // AXI PS Master GP0 BID[11:0], input
    .MAXIGP0BRESP   (/*axi_bresp[1:0]*/),    // AXI PS Master GP0 BRESP[1:0], input

// AXI PS Master GP1    
// AXI PS Master GP1: Clock, Reset
    .MAXIGP1ACLK    (axi_aclk0),         // AXI PS Master GP1 Clock , input
    .MAXIGP1ARESETN (),          // AXI PS Master GP1 Reset, output
// AXI PS Master GP1: Read Address    
    .MAXIGP1ARADDR  (maxi1_araddr),           // AXI PS Master GP1 ARADDR[31:0], output  
    .MAXIGP1ARVALID (maxi1_arvalid),          // AXI PS Master GP1 ARVALID, output
    .MAXIGP1ARREADY (maxi1_arready),          // AXI PS Master GP1 ARREADY, input
    .MAXIGP1ARID    (maxi1_arid),             // AXI PS Master GP1 ARID[11:0], output
    .MAXIGP1ARLOCK  (),           // AXI PS Master GP1 ARLOCK[1:0], output
    .MAXIGP1ARCACHE (),          // AXI PS Master GP1 ARCACHE[3:0], output
    .MAXIGP1ARPROT  (),           // AXI PS Master GP1 ARPROT[2:0], output
    .MAXIGP1ARLEN   (maxi1_arlen),            // AXI PS Master GP1 ARLEN[3:0], output
    .MAXIGP1ARSIZE  (maxi1_arsize),           // AXI PS Master GP1 ARSIZE[1:0], output
    .MAXIGP1ARBURST (maxi1_arburst),          // AXI PS Master GP1 ARBURST[1:0], output
    .MAXIGP1ARQOS   (),            // AXI PS Master GP1 ARQOS[3:0], output
// AXI PS Master GP1: Read Data
    .MAXIGP1RDATA   (maxi1_rdata),            // AXI PS Master GP1 RDATA[31:0], input
    .MAXIGP1RVALID  (maxi1_rvalid),           // AXI PS Master GP1 RVALID, input
    .MAXIGP1RREADY  (maxi1_rready),           // AXI PS Master GP1 RREADY, output
    .MAXIGP1RID     (maxi1_rid),              // AXI PS Master GP1 RID[11:0], input
    .MAXIGP1RLAST   (maxi1_rlast),            // AXI PS Master GP1 RLAST, input
    .MAXIGP1RRESP   (maxi1_rresp),            // AXI PS Master GP1 RRESP[1:0], input
// AXI PS Master GP1: Write Address    
    .MAXIGP1AWADDR  (maxi1_awaddr),           // AXI PS Master GP1 AWADDR[31:0], output
    .MAXIGP1AWVALID (maxi1_awvalid),          // AXI PS Master GP1 AWVALID, output
    .MAXIGP1AWREADY (maxi1_awready),          // AXI PS Master GP1 AWREADY, input
    .MAXIGP1AWID    (maxi1_awid),             // AXI PS Master GP1 AWID[11:0], output
    .MAXIGP1AWLOCK  (),           // AXI PS Master GP1 AWLOCK[1:0], output
    .MAXIGP1AWCACHE (),          // AXI PS Master GP1 AWCACHE[3:0], output
    .MAXIGP1AWPROT  (),           // AXI PS Master GP1 AWPROT[2:0], output
    .MAXIGP1AWLEN   (maxi1_awlen),            // AXI PS Master GP1 AWLEN[3:0], output
    .MAXIGP1AWSIZE  (maxi1_awsize),           // AXI PS Master GP1 AWSIZE[1:0], output
    .MAXIGP1AWBURST (maxi1_awburst),          // AXI PS Master GP1 AWBURST[1:0], output
    .MAXIGP1AWQOS   (),            // AXI PS Master GP1 AWQOS[3:0], output
// AXI PS Master GP1: Write Data
    .MAXIGP1WDATA   (maxi1_wdata),            // AXI PS Master GP1 WDATA[31:0], output
    .MAXIGP1WVALID  (maxi1_wvalid),           // AXI PS Master GP1 WVALID, output
    .MAXIGP1WREADY  (maxi1_wready),           // AXI PS Master GP1 WREADY, input
    .MAXIGP1WID     (maxi1_wid),              // AXI PS Master GP1 WID[11:0], output
    .MAXIGP1WLAST   (maxi1_wlast),            // AXI PS Master GP1 WLAST, output
    .MAXIGP1WSTRB   (maxi1_wstb),             // AXI PS Master GP1 maxi1_wstb[3:0], output
// AXI PS Master GP1: Write response
    .MAXIGP1BVALID  (maxi1_bvalid),           // AXI PS Master GP1 BVALID, input
    .MAXIGP1BREADY  (maxi1_bready),           // AXI PS Master GP1 BREADY, output
    .MAXIGP1BID     (maxi1_bid),              // AXI PS Master GP1 BID[11:0], input
    .MAXIGP1BRESP   (maxi1_bresp),            // AXI PS Master GP1 BRESP[1:0], input

// AXI PS Slave GP0    
// AXI PS Slave GP0: Clock, Reset
    .SAXIGP0ACLK(),              // AXI PS Slave GP0 Clock , input
    .SAXIGP0ARESETN(),           // AXI PS Slave GP0 Reset, output
// AXI PS Slave GP0: Read Address    
    .SAXIGP0ARADDR(),            // AXI PS Slave GP0 ARADDR[31:0], input  
    .SAXIGP0ARVALID(),           // AXI PS Slave GP0 ARVALID, input
    .SAXIGP0ARREADY(),           // AXI PS Slave GP0 ARREADY, output
    .SAXIGP0ARID(),              // AXI PS Slave GP0 ARID[5:0], input
    .SAXIGP0ARLOCK(),            // AXI PS Slave GP0 ARLOCK[1:0], input
    .SAXIGP0ARCACHE(),           // AXI PS Slave GP0 ARCACHE[3:0], input
    .SAXIGP0ARPROT(),            // AXI PS Slave GP0 ARPROT[2:0], input
    .SAXIGP0ARLEN(),             // AXI PS Slave GP0 ARLEN[3:0], input
    .SAXIGP0ARSIZE(),            // AXI PS Slave GP0 ARSIZE[1:0], input
    .SAXIGP0ARBURST(),           // AXI PS Slave GP0 ARBURST[1:0], input
    .SAXIGP0ARQOS(),             // AXI PS Slave GP0 ARQOS[3:0], input
// AXI PS Slave GP0: Read Data
    .SAXIGP0RDATA(),             // AXI PS Slave GP0 RDATA[31:0], output
    .SAXIGP0RVALID(),            // AXI PS Slave GP0 RVALID, output
    .SAXIGP0RREADY(),            // AXI PS Slave GP0 RREADY, input
    .SAXIGP0RID(),               // AXI PS Slave GP0 RID[5:0], output
    .SAXIGP0RLAST(),             // AXI PS Slave GP0 RLAST, output
    .SAXIGP0RRESP(),             // AXI PS Slave GP0 RRESP[1:0], output
// AXI PS Slave GP0: Write Address    
    .SAXIGP0AWADDR(),            // AXI PS Slave GP0 AWADDR[31:0], input
    .SAXIGP0AWVALID(),           // AXI PS Slave GP0 AWVALID, input
    .SAXIGP0AWREADY(),           // AXI PS Slave GP0 AWREADY, output
    .SAXIGP0AWID(),              // AXI PS Slave GP0 AWID[5:0], input
    .SAXIGP0AWLOCK(),            // AXI PS Slave GP0 AWLOCK[1:0], input
    .SAXIGP0AWCACHE(),           // AXI PS Slave GP0 AWCACHE[3:0], input
    .SAXIGP0AWPROT(),            // AXI PS Slave GP0 AWPROT[2:0], input
    .SAXIGP0AWLEN(),             // AXI PS Slave GP0 AWLEN[3:0], input
    .SAXIGP0AWSIZE(),            // AXI PS Slave GP0 AWSIZE[1:0], input
    .SAXIGP0AWBURST(),           // AXI PS Slave GP0 AWBURST[1:0], input
    .SAXIGP0AWQOS(),             // AXI PS Slave GP0 AWQOS[3:0], input
// AXI PS Slave GP0: Write Data
    .SAXIGP0WDATA(),             // AXI PS Slave GP0 WDATA[31:0], input
    .SAXIGP0WVALID(),            // AXI PS Slave GP0 WVALID, input
    .SAXIGP0WREADY(),            // AXI PS Slave GP0 WREADY, output
    .SAXIGP0WID(),               // AXI PS Slave GP0 WID[5:0], input
    .SAXIGP0WLAST(),             // AXI PS Slave GP0 WLAST, input
    .SAXIGP0WSTRB(),             // AXI PS Slave GP0 WSTRB[3:0], input
// AXI PS Slave GP0: Write response
    .SAXIGP0BVALID(),            // AXI PS Slave GP0 BVALID, output
    .SAXIGP0BREADY(),            // AXI PS Slave GP0 BREADY, input
    .SAXIGP0BID(),               // AXI PS Slave GP0 BID[5:0], output //TODO:  Update range !!!
    .SAXIGP0BRESP(),             // AXI PS Slave GP0 BRESP[1:0], output

// AXI PS Slave GP1    
// AXI PS Slave GP1: Clock, Reset
    .SAXIGP1ACLK(),              // AXI PS Slave GP1 Clock , input
    .SAXIGP1ARESETN(),           // AXI PS Slave GP1 Reset, output
// AXI PS Slave GP1: Read Address    
    .SAXIGP1ARADDR(),            // AXI PS Slave GP1 ARADDR[31:0], input  
    .SAXIGP1ARVALID(),           // AXI PS Slave GP1 ARVALID, input
    .SAXIGP1ARREADY(),           // AXI PS Slave GP1 ARREADY, output
    .SAXIGP1ARID(),              // AXI PS Slave GP1 ARID[5:0], input
    .SAXIGP1ARLOCK(),            // AXI PS Slave GP1 ARLOCK[1:0], input
    .SAXIGP1ARCACHE(),           // AXI PS Slave GP1 ARCACHE[3:0], input
    .SAXIGP1ARPROT(),            // AXI PS Slave GP1 ARPROT[2:0], input
    .SAXIGP1ARLEN(),             // AXI PS Slave GP1 ARLEN[3:0], input
    .SAXIGP1ARSIZE(),            // AXI PS Slave GP1 ARSIZE[1:0], input
    .SAXIGP1ARBURST(),           // AXI PS Slave GP1 ARBURST[1:0], input
    .SAXIGP1ARQOS(),             // AXI PS Slave GP1 ARQOS[3:0], input
// AXI PS Slave GP1: Read Data
    .SAXIGP1RDATA(),             // AXI PS Slave GP1 RDATA[31:0], output
    .SAXIGP1RVALID(),            // AXI PS Slave GP1 RVALID, output
    .SAXIGP1RREADY(),            // AXI PS Slave GP1 RREADY, input
    .SAXIGP1RID(),               // AXI PS Slave GP1 RID[5:0], output
    .SAXIGP1RLAST(),             // AXI PS Slave GP1 RLAST, output
    .SAXIGP1RRESP(),             // AXI PS Slave GP1 RRESP[1:0], output
// AXI PS Slave GP1: Write Address    
    .SAXIGP1AWADDR(),            // AXI PS Slave GP1 AWADDR[31:0], input
    .SAXIGP1AWVALID(),           // AXI PS Slave GP1 AWVALID, input
    .SAXIGP1AWREADY(),           // AXI PS Slave GP1 AWREADY, output
    .SAXIGP1AWID(),              // AXI PS Slave GP1 AWID[5:0], input
    .SAXIGP1AWLOCK(),            // AXI PS Slave GP1 AWLOCK[1:0], input
    .SAXIGP1AWCACHE(),           // AXI PS Slave GP1 AWCACHE[3:0], input
    .SAXIGP1AWPROT(),            // AXI PS Slave GP1 AWPROT[2:0], input
    .SAXIGP1AWLEN(),             // AXI PS Slave GP1 AWLEN[3:0], input
    .SAXIGP1AWSIZE(),            // AXI PS Slave GP1 AWSIZE[1:0], input
    .SAXIGP1AWBURST(),           // AXI PS Slave GP1 AWBURST[1:0], input
    .SAXIGP1AWQOS(),             // AXI PS Slave GP1 AWQOS[3:0], input
// AXI PS Slave GP1: Write Data
    .SAXIGP1WDATA(),             // AXI PS Slave GP1 WDATA[31:0], input
    .SAXIGP1WVALID(),            // AXI PS Slave GP1 WVALID, input
    .SAXIGP1WREADY(),            // AXI PS Slave GP1 WREADY, output
    .SAXIGP1WID(),               // AXI PS Slave GP1 WID[5:0], input
    .SAXIGP1WLAST(),             // AXI PS Slave GP1 WLAST, input
    .SAXIGP1WSTRB(),             // AXI PS Slave GP1 WSTRB[3:0], input
// AXI PS Slave GP1: Write response
    .SAXIGP1BVALID(),            // AXI PS Slave GP1 BVALID, output
    .SAXIGP1BREADY(),            // AXI PS Slave GP1 BREADY, input
    .SAXIGP1BID(),               // AXI PS Slave GP1 BID[5:0], output
    .SAXIGP1BRESP(),             // AXI PS Slave GP1 BRESP[1:0], output

// AXI PS Slave HP0    
// AXI PS Slave HP0: Clock, Reset
    .SAXIHP0ACLK(),              // AXI PS Slave HP0 Clock , input
    .SAXIHP0ARESETN(),           // AXI PS Slave HP0 Reset, output
// AXI PS Slave HP0: Read Address    
    .SAXIHP0ARADDR(),            // AXI PS Slave HP0 ARADDR[31:0], input  
    .SAXIHP0ARVALID(),           // AXI PS Slave HP0 ARVALID, input
    .SAXIHP0ARREADY(),           // AXI PS Slave HP0 ARREADY, output
    .SAXIHP0ARID(),              // AXI PS Slave HP0 ARID[5:0], input
    .SAXIHP0ARLOCK(),            // AXI PS Slave HP0 ARLOCK[1:0], input
    .SAXIHP0ARCACHE(),           // AXI PS Slave HP0 ARCACHE[3:0], input
    .SAXIHP0ARPROT(),            // AXI PS Slave HP0 ARPROT[2:0], input
    .SAXIHP0ARLEN(),             // AXI PS Slave HP0 ARLEN[3:0], input
    .SAXIHP0ARSIZE(),            // AXI PS Slave HP0 ARSIZE[2:0], input
    .SAXIHP0ARBURST(),           // AXI PS Slave HP0 ARBURST[1:0], input
    .SAXIHP0ARQOS(),             // AXI PS Slave HP0 ARQOS[3:0], input
// AXI PS Slave HP0: Read Data
    .SAXIHP0RDATA(),             // AXI PS Slave HP0 RDATA[63:0], output
    .SAXIHP0RVALID(),            // AXI PS Slave HP0 RVALID, output
    .SAXIHP0RREADY(),            // AXI PS Slave HP0 RREADY, input
    .SAXIHP0RID(),               // AXI PS Slave HP0 RID[5:0], output
    .SAXIHP0RLAST(),             // AXI PS Slave HP0 RLAST, output
    .SAXIHP0RRESP(),             // AXI PS Slave HP0 RRESP[1:0], output
    .SAXIHP0RCOUNT(),            // AXI PS Slave HP0 RCOUNT[7:0], output
    .SAXIHP0RACOUNT(),           // AXI PS Slave HP0 RACOUNT[2:0], output
    .SAXIHP0RDISSUECAP1EN(),     // AXI PS Slave HP0 RDISSUECAP1EN, input
// AXI PS Slave HP0: Write Address    
    .SAXIHP0AWADDR(),            // AXI PS Slave HP0 AWADDR[31:0], input
    .SAXIHP0AWVALID(),           // AXI PS Slave HP0 AWVALID, input
    .SAXIHP0AWREADY(),           // AXI PS Slave HP0 AWREADY, output
    .SAXIHP0AWID(),              // AXI PS Slave HP0 AWID[5:0], input
    .SAXIHP0AWLOCK(),            // AXI PS Slave HP0 AWLOCK[1:0], input
    .SAXIHP0AWCACHE(),           // AXI PS Slave HP0 AWCACHE[3:0], input
    .SAXIHP0AWPROT(),            // AXI PS Slave HP0 AWPROT[2:0], input
    .SAXIHP0AWLEN(),             // AXI PS Slave HP0 AWLEN[3:0], input
    .SAXIHP0AWSIZE(),            // AXI PS Slave HP0 AWSIZE[1:0], input
    .SAXIHP0AWBURST(),           // AXI PS Slave HP0 AWBURST[1:0], input
    .SAXIHP0AWQOS(),             // AXI PS Slave HP0 AWQOS[3:0], input
// AXI PS Slave HP0: Write Data
    .SAXIHP0WDATA(),             // AXI PS Slave HP0 WDATA[63:0], input
    .SAXIHP0WVALID(),            // AXI PS Slave HP0 WVALID, input
    .SAXIHP0WREADY(),            // AXI PS Slave HP0 WREADY, output
    .SAXIHP0WID(),               // AXI PS Slave HP0 WID[5:0], input
    .SAXIHP0WLAST(),             // AXI PS Slave HP0 WLAST, input
    .SAXIHP0WSTRB(),             // AXI PS Slave HP0 WSTRB[7:0], input
    .SAXIHP0WCOUNT(),            // AXI PS Slave HP0 WCOUNT[7:0], output
    .SAXIHP0WACOUNT(),           // AXI PS Slave HP0 WACOUNT[5:0], output
    .SAXIHP0WRISSUECAP1EN(),     // AXI PS Slave HP0 WRISSUECAP1EN, input
// AXI PS Slave HP0: Write response
    .SAXIHP0BVALID(),            // AXI PS Slave HP0 BVALID, output
    .SAXIHP0BREADY(),            // AXI PS Slave HP0 BREADY, input
    .SAXIHP0BID(),               // AXI PS Slave HP0 BID[5:0], output
    .SAXIHP0BRESP(),             // AXI PS Slave HP0 BRESP[1:0], output

// AXI PS Slave HP1    
// AXI PS Slave 1: Clock, Reset
    .SAXIHP1ACLK(),              // AXI PS Slave HP1 Clock , input
    .SAXIHP1ARESETN(),           // AXI PS Slave HP1 Reset, output
// AXI PS Slave HP1: Read Address    
    .SAXIHP1ARADDR(),            // AXI PS Slave HP1 ARADDR[31:0], input  
    .SAXIHP1ARVALID(),           // AXI PS Slave HP1 ARVALID, input
    .SAXIHP1ARREADY(),           // AXI PS Slave HP1 ARREADY, output
    .SAXIHP1ARID(),              // AXI PS Slave HP1 ARID[5:0], input
    .SAXIHP1ARLOCK(),            // AXI PS Slave HP1 ARLOCK[1:0], input
    .SAXIHP1ARCACHE(),           // AXI PS Slave HP1 ARCACHE[3:0], input
    .SAXIHP1ARPROT(),            // AXI PS Slave HP1 ARPROT[2:0], input
    .SAXIHP1ARLEN(),             // AXI PS Slave HP1 ARLEN[3:0], input
    .SAXIHP1ARSIZE(),            // AXI PS Slave HP1 ARSIZE[2:0], input
    .SAXIHP1ARBURST(),           // AXI PS Slave HP1 ARBURST[1:0], input
    .SAXIHP1ARQOS(),             // AXI PS Slave HP1 ARQOS[3:0], input
// AXI PS Slave HP1: Read Data
    .SAXIHP1RDATA(),             // AXI PS Slave HP1 RDATA[63:0], output
    .SAXIHP1RVALID(),            // AXI PS Slave HP1 RVALID, output
    .SAXIHP1RREADY(),            // AXI PS Slave HP1 RREADY, input
    .SAXIHP1RID(),               // AXI PS Slave HP1 RID[5:0], output
    .SAXIHP1RLAST(),             // AXI PS Slave HP1 RLAST, output
    .SAXIHP1RRESP(),             // AXI PS Slave HP1 RRESP[1:0], output
    .SAXIHP1RCOUNT(),            // AXI PS Slave HP1 RCOUNT[7:0], output
    .SAXIHP1RACOUNT(),           // AXI PS Slave HP1 RACOUNT[2:0], output
    .SAXIHP1RDISSUECAP1EN(),     // AXI PS Slave HP1 RDISSUECAP1EN, input
// AXI PS Slave HP1: Write Address    
    .SAXIHP1AWADDR(),            // AXI PS Slave HP1 AWADDR[31:0], input
    .SAXIHP1AWVALID(),           // AXI PS Slave HP1 AWVALID, input
    .SAXIHP1AWREADY(),           // AXI PS Slave HP1 AWREADY, output
    .SAXIHP1AWID(),              // AXI PS Slave HP1 AWID[5:0], input
    .SAXIHP1AWLOCK(),            // AXI PS Slave HP1 AWLOCK[1:0], input
    .SAXIHP1AWCACHE(),           // AXI PS Slave HP1 AWCACHE[3:0], input
    .SAXIHP1AWPROT(),            // AXI PS Slave HP1 AWPROT[2:0], input
    .SAXIHP1AWLEN(),             // AXI PS Slave HP1 AWLEN[3:0], input
    .SAXIHP1AWSIZE(),            // AXI PS Slave HP1 AWSIZE[1:0], input
    .SAXIHP1AWBURST(),           // AXI PS Slave HP1 AWBURST[1:0], input
    .SAXIHP1AWQOS(),             // AXI PS Slave HP1 AWQOS[3:0], input
// AXI PS Slave HP1: Write Data
    .SAXIHP1WDATA(),             // AXI PS Slave HP1 WDATA[63:0], input
    .SAXIHP1WVALID(),            // AXI PS Slave HP1 WVALID, input
    .SAXIHP1WREADY(),            // AXI PS Slave HP1 WREADY, output
    .SAXIHP1WID(),               // AXI PS Slave HP1 WID[5:0], input
    .SAXIHP1WLAST(),             // AXI PS Slave HP1 WLAST, input
    .SAXIHP1WSTRB(),             // AXI PS Slave HP1 WSTRB[7:0], input
    .SAXIHP1WCOUNT(),            // AXI PS Slave HP1 WCOUNT[7:0], output
    .SAXIHP1WACOUNT(),           // AXI PS Slave HP1 WACOUNT[5:0], output
    .SAXIHP1WRISSUECAP1EN(),     // AXI PS Slave HP1 WRISSUECAP1EN, input
// AXI PS Slave HP1: Write response
    .SAXIHP1BVALID(),            // AXI PS Slave HP1 BVALID, output
    .SAXIHP1BREADY(),            // AXI PS Slave HP1 BREADY, input
    .SAXIHP1BID(),               // AXI PS Slave HP1 BID[5:0], output
    .SAXIHP1BRESP(),             // AXI PS Slave HP1 BRESP[1:0], output

// AXI PS Slave HP2    
// AXI PS Slave HP2: Clock, Reset
    .SAXIHP2ACLK(),              // AXI PS Slave HP2 Clock , input
    .SAXIHP2ARESETN(),           // AXI PS Slave HP2 Reset, output
// AXI PS Slave HP2: Read Address    
    .SAXIHP2ARADDR(),            // AXI PS Slave HP2 ARADDR[31:0], input  
    .SAXIHP2ARVALID(),           // AXI PS Slave HP2 ARVALID, input
    .SAXIHP2ARREADY(),           // AXI PS Slave HP2 ARREADY, output
    .SAXIHP2ARID(),              // AXI PS Slave HP2 ARID[5:0], input
    .SAXIHP2ARLOCK(),            // AXI PS Slave HP2 ARLOCK[1:0], input
    .SAXIHP2ARCACHE(),           // AXI PS Slave HP2 ARCACHE[3:0], input
    .SAXIHP2ARPROT(),            // AXI PS Slave HP2 ARPROT[2:0], input
    .SAXIHP2ARLEN(),             // AXI PS Slave HP2 ARLEN[3:0], input
    .SAXIHP2ARSIZE(),            // AXI PS Slave HP2 ARSIZE[2:0], input
    .SAXIHP2ARBURST(),           // AXI PS Slave HP2 ARBURST[1:0], input
    .SAXIHP2ARQOS(),             // AXI PS Slave HP2 ARQOS[3:0], input
// AXI PS Slave HP2: Read Data
    .SAXIHP2RDATA(),             // AXI PS Slave HP2 RDATA[63:0], output
    .SAXIHP2RVALID(),            // AXI PS Slave HP2 RVALID, output
    .SAXIHP2RREADY(),            // AXI PS Slave HP2 RREADY, input
    .SAXIHP2RID(),               // AXI PS Slave HP2 RID[5:0], output
    .SAXIHP2RLAST(),             // AXI PS Slave HP2 RLAST, output
    .SAXIHP2RRESP(),             // AXI PS Slave HP2 RRESP[1:0], output
    .SAXIHP2RCOUNT(),            // AXI PS Slave HP2 RCOUNT[7:0], output
    .SAXIHP2RACOUNT(),           // AXI PS Slave HP2 RACOUNT[2:0], output
    .SAXIHP2RDISSUECAP1EN(),     // AXI PS Slave HP2 RDISSUECAP1EN, input
// AXI PS Slave HP2: Write Address    
    .SAXIHP2AWADDR(),            // AXI PS Slave HP2 AWADDR[31:0], input
    .SAXIHP2AWVALID(),           // AXI PS Slave HP2 AWVALID, input
    .SAXIHP2AWREADY(),           // AXI PS Slave HP2 AWREADY, output
    .SAXIHP2AWID(),              // AXI PS Slave HP2 AWID[5:0], input
    .SAXIHP2AWLOCK(),            // AXI PS Slave HP2 AWLOCK[1:0], input
    .SAXIHP2AWCACHE(),           // AXI PS Slave HP2 AWCACHE[3:0], input
    .SAXIHP2AWPROT(),            // AXI PS Slave HP2 AWPROT[2:0], input
    .SAXIHP2AWLEN(),             // AXI PS Slave HP2 AWLEN[3:0], input
    .SAXIHP2AWSIZE(),            // AXI PS Slave HP2 AWSIZE[1:0], input
    .SAXIHP2AWBURST(),           // AXI PS Slave HP2 AWBURST[1:0], input
    .SAXIHP2AWQOS(),             // AXI PS Slave HP2 AWQOS[3:0], input
// AXI PS Slave HP2: Write Data
    .SAXIHP2WDATA(),             // AXI PS Slave HP2 WDATA[63:0], input
    .SAXIHP2WVALID(),            // AXI PS Slave HP2 WVALID, input
    .SAXIHP2WREADY(),            // AXI PS Slave HP2 WREADY, output
    .SAXIHP2WID(),               // AXI PS Slave HP2 WID[5:0], input
    .SAXIHP2WLAST(),             // AXI PS Slave HP2 WLAST, input
    .SAXIHP2WSTRB(),             // AXI PS Slave HP2 WSTRB[7:0], input
    .SAXIHP2WCOUNT(),            // AXI PS Slave HP2 WCOUNT[7:0], output
    .SAXIHP2WACOUNT(),           // AXI PS Slave HP2 WACOUNT[5:0], output
    .SAXIHP2WRISSUECAP1EN(),     // AXI PS Slave HP2 WRISSUECAP1EN, input
// AXI PS Slave HP2: Write response
    .SAXIHP2BVALID(),            // AXI PS Slave HP2 BVALID, output
    .SAXIHP2BREADY(),            // AXI PS Slave HP2 BREADY, input
    .SAXIHP2BID(),               // AXI PS Slave HP2 BID[5:0], output
    .SAXIHP2BRESP(),             // AXI PS Slave HP2 BRESP[1:0], output

// AXI PS Slave HP3    
// AXI PS Slave HP3: Clock, Reset
    .SAXIHP3ACLK            (hclk),                 // AXI PS Slave HP3 Clock , input
    .SAXIHP3ARESETN(),           // AXI PS Slave HP3 Reset, output
// AXI PS Slave HP3: Read Address    
    .SAXIHP3ARADDR          (afi3_araddr),            // AXI PS Slave HP3 ARADDR[31:0], input  
    .SAXIHP3ARVALID         (afi3_arvalid),           // AXI PS Slave HP3 ARVALID, input
    .SAXIHP3ARREADY         (afi3_arready),           // AXI PS Slave HP3 ARREADY, output
    .SAXIHP3ARID            (afi3_arid),              // AXI PS Slave HP3 ARID[5:0], input
    .SAXIHP3ARLOCK          (afi3_arlock),            // AXI PS Slave HP3 ARLOCK[1:0], input
    .SAXIHP3ARCACHE         (afi3_arcache),           // AXI PS Slave HP3 ARCACHE[3:0], input
    .SAXIHP3ARPROT          (afi3_arprot),            // AXI PS Slave HP3 ARPROT[2:0], input
    .SAXIHP3ARLEN           (afi3_arlen),             // AXI PS Slave HP3 ARLEN[3:0], input
    .SAXIHP3ARSIZE          (afi3_arsize),            // AXI PS Slave HP3 ARSIZE[2:0], input
    .SAXIHP3ARBURST         (afi3_arburst),           // AXI PS Slave HP3 ARBURST[1:0], input
    .SAXIHP3ARQOS           (afi3_arqos),             // AXI PS Slave HP3 ARQOS[3:0], input
// AXI PS Slave HP3: Read Data
    .SAXIHP3RDATA           (afi3_rdata),             // AXI PS Slave HP3 RDATA[63:0], output
    .SAXIHP3RVALID          (afi3_rvalid),            // AXI PS Slave HP3 RVALID, output
    .SAXIHP3RREADY          (afi3_rready),            // AXI PS Slave HP3 RREADY, input
    .SAXIHP3RID             (afi3_rid),               // AXI PS Slave HP3 RID[5:0], output
    .SAXIHP3RLAST           (afi3_rlast),             // AXI PS Slave HP3 RLAST, output
    .SAXIHP3RRESP           (afi3_rresp),             // AXI PS Slave HP3 RRESP[1:0], output
    .SAXIHP3RCOUNT          (afi3_rcount),            // AXI PS Slave HP3 RCOUNT[7:0], output
    .SAXIHP3RACOUNT         (afi3_racount),           // AXI PS Slave HP3 RACOUNT[2:0], output
    .SAXIHP3RDISSUECAP1EN   (afi3_rdissuecap1en),     // AXI PS Slave HP3 RDISSUECAP1EN, input
// AXI PS Slave HP3: Write Address    
    .SAXIHP3AWADDR          (afi3_awaddr),            // AXI PS Slave HP3 AWADDR[31:0], input
    .SAXIHP3AWVALID         (afi3_awvalid),           // AXI PS Slave HP3 AWVALID, input
    .SAXIHP3AWREADY         (afi3_awready),           // AXI PS Slave HP3 AWREADY, output
    .SAXIHP3AWID            (afi3_awid),              // AXI PS Slave HP3 AWID[5:0], input
    .SAXIHP3AWLOCK          (afi3_awlock),            // AXI PS Slave HP3 AWLOCK[1:0], input
    .SAXIHP3AWCACHE         (afi3_awcache),           // AXI PS Slave HP3 AWCACHE[3:0], input
    .SAXIHP3AWPROT          (afi3_awprot),            // AXI PS Slave HP3 AWPROT[2:0], input
    .SAXIHP3AWLEN           (afi3_awlen),             // AXI PS Slave HP3 AWLEN[3:0], input
    .SAXIHP3AWSIZE          (afi3_awsize),            // AXI PS Slave HP3 AWSIZE[1:0], input
    .SAXIHP3AWBURST         (afi3_awburst),           // AXI PS Slave HP3 AWBURST[1:0], input
    .SAXIHP3AWQOS           (afi3_awqos),             // AXI PS Slave HP3 AWQOS[3:0], input
// AXI PS Slave HP3: Write Data
    .SAXIHP3WDATA           (afi3_wdata),             // AXI PS Slave HP3 WDATA[63:0], input
    .SAXIHP3WVALID          (afi3_wvalid),            // AXI PS Slave HP3 WVALID, input
    .SAXIHP3WREADY          (afi3_wready),            // AXI PS Slave HP3 WREADY, output
    .SAXIHP3WID             (afi3_wid),               // AXI PS Slave HP3 WID[5:0], input
    .SAXIHP3WLAST           (afi3_wlast),             // AXI PS Slave HP3 WLAST, input
    .SAXIHP3WSTRB           (afi3_wstrb),             // AXI PS Slave HP3 WSTRB[7:0], input
    .SAXIHP3WCOUNT          (afi3_wcount),            // AXI PS Slave HP3 WCOUNT[7:0], output
    .SAXIHP3WACOUNT         (afi3_wacount),           // AXI PS Slave HP3 WACOUNT[5:0], output
    .SAXIHP3WRISSUECAP1EN   (afi3_wrissuecap1en),     // AXI PS Slave HP3 WRISSUECAP1EN, input
// AXI PS Slave HP3: Write response
    .SAXIHP3BVALID          (afi3_bvalid),            // AXI PS Slave HP3 BVALID, output
    .SAXIHP3BREADY          (afi3_bready),            // AXI PS Slave HP3 BREADY, input
    .SAXIHP3BID             (afi3_bid),               // AXI PS Slave HP3 BID[5:0], output
    .SAXIHP3BRESP           (afi3_bresp),             // AXI PS Slave HP3 BRESP[1:0], output

// AXI PS Slave ACP    
// AXI PS Slave ACP: Clock, Reset
    .SAXIACPACLK(),              // AXI PS Slave ACP Clock, input
    .SAXIACPARESETN(),           // AXI PS Slave ACP Reset, output
// AXI PS Slave ACP: Read Address    
    .SAXIACPARADDR(),            // AXI PS Slave ACP ARADDR[31:0], input  
    .SAXIACPARVALID(),           // AXI PS Slave ACP ARVALID, input
    .SAXIACPARREADY(),           // AXI PS Slave ACP ARREADY, output
    .SAXIACPARID(),              // AXI PS Slave ACP ARID[2:0], input
    .SAXIACPARLOCK(),            // AXI PS Slave ACP ARLOCK[1:0], input
    .SAXIACPARCACHE(),           // AXI PS Slave ACP ARCACHE[3:0], input
    .SAXIACPARPROT(),            // AXI PS Slave ACP ARPROT[2:0], input
    .SAXIACPARLEN(),             // AXI PS Slave ACP ARLEN[3:0], input
    .SAXIACPARSIZE(),            // AXI PS Slave ACP ARSIZE[2:0], input
    .SAXIACPARBURST(),           // AXI PS Slave ACP ARBURST[1:0], input
    .SAXIACPARQOS(),             // AXI PS Slave ACP ARQOS[3:0], input
    .SAXIACPARUSER(),            // AXI PS Slave ACP ARUSER[4:0], input
// AXI PS Slave ACP: Read Data
    .SAXIACPRDATA(),             // AXI PS Slave ACP RDATA[63:0], output
    .SAXIACPRVALID(),            // AXI PS Slave ACP RVALID, output
    .SAXIACPRREADY(),            // AXI PS Slave ACP RREADY, input
    .SAXIACPRID(),               // AXI PS Slave ACP RID[2:0], output
    .SAXIACPRLAST(),             // AXI PS Slave ACP RLAST, output
    .SAXIACPRRESP(),             // AXI PS Slave ACP RRESP[1:0], output
// AXI PS Slave ACP: Write Address    
    .SAXIACPAWADDR(),            // AXI PS Slave ACP AWADDR[31:0], input
    .SAXIACPAWVALID(),           // AXI PS Slave ACP AWVALID, input
    .SAXIACPAWREADY(),           // AXI PS Slave ACP AWREADY, output
    .SAXIACPAWID(),              // AXI PS Slave ACP AWID[2:0], input
    .SAXIACPAWLOCK(),            // AXI PS Slave ACP AWLOCK[1:0], input
    .SAXIACPAWCACHE(),           // AXI PS Slave ACP AWCACHE[3:0], input
    .SAXIACPAWPROT(),            // AXI PS Slave ACP AWPROT[2:0], input
    .SAXIACPAWLEN(),             // AXI PS Slave ACP AWLEN[3:0], input
    .SAXIACPAWSIZE(),            // AXI PS Slave ACP AWSIZE[1:0], input
    .SAXIACPAWBURST(),           // AXI PS Slave ACP AWBURST[1:0], input
    .SAXIACPAWQOS(),             // AXI PS Slave ACP AWQOS[3:0], input
    .SAXIACPAWUSER(),            // AXI PS Slave ACP AWUSER[4:0], input
    
// AXI PS Slave ACP: Write Data
    .SAXIACPWDATA(),             // AXI PS Slave ACP WDATA[63:0], input
    .SAXIACPWVALID(),            // AXI PS Slave ACP WVALID, input
    .SAXIACPWREADY(),            // AXI PS Slave ACP WREADY, output
    .SAXIACPWID(),               // AXI PS Slave ACP WID[2:0], input
    .SAXIACPWLAST(),             // AXI PS Slave ACP WLAST, input
    .SAXIACPWSTRB(),             // AXI PS Slave ACP WSTRB[7:0], input
// AXI PS Slave ACP: Write response
    .SAXIACPBVALID(),            // AXI PS Slave ACP BVALID, output
    .SAXIACPBREADY(),            // AXI PS Slave ACP BREADY, input
    .SAXIACPBID(),               // AXI PS Slave ACP BID[2:0], output
    .SAXIACPBRESP(),             // AXI PS Slave ACP BRESP[1:0], output
// Direct connection to PS package pads
    .DDRA(),                     // PS DDRA[14:0], inout
    .DDRBA(),                    // PS DDRBA[2:0], inout
    .DDRCASB(),                  // PS DDRCASB, inout
    .DDRCKE(),                   // PS DDRCKE, inout
    .DDRCKP(),                   // PS DDRCKP, inout
    .DDRCKN(),                   // PS DDRCKN, inout
    .DDRCSB(),                   // PS DDRCSB, inout
    .DDRDM(),                    // PS DDRDM[3:0], inout
    .DDRDQ(),                    // PS DDRDQ[31:0], inout
    .DDRDQSP(),                  // PS DDRDQSP[3:0], inout
    .DDRDQSN(),                  // PS DDRDQSN[3:0], inout
    .DDRDRSTB(),                 // PS DDRDRSTB, inout
    .DDRODT(),                   // PS DDRODT, inout
    .DDRRASB(),                  // PS DDRRASB, inout
    .DDRVRN(),                   // PS DDRVRN, inout
    .DDRVRP(),                   // PS DDRVRP, inout
    .DDRWEB(),                   // PS DDRWEB, inout
    .MIO(),                      // PS MIO[53:0], inout // clg225 has less
    .PSCLK(),                    // PS PSCLK, inout
    .PSPORB(),                   // PS PSPORB, inout
    .PSSRSTB()                  // PS PSSRSTB, inout
  );
endmodule
