//-----------------------------------------------------------------------------
// Title      : Virtex-5 Ethernet MAC Wrapper Top Level
// Project    : Virtex-5 Ethernet MAC Wrappers
//-----------------------------------------------------------------------------
// File       : v5_emac_v1_5_block.v
//-----------------------------------------------------------------------------
// Copyright (c) 2004-2008 by Xilinx, Inc. All rights reserved.
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you
// a license to use this text/file solely for design, simulation,
// implementation and creation of design files limited
// to Xilinx devices or technologies. Use with non-Xilinx
// devices or technologies is expressly prohibited and
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information
// "as is" solely for use in developing programs and
// solutions for Xilinx devices. By providing this design,
// code, or information as one possible implementation of
// this feature, application or standard, Xilinx is making no
// representation that this implementation is free from any
// claims of infringement. You are responsible for
// obtaining any rights you may require for your implementation.
// Xilinx expressly disclaims any warranty whatsoever with
// respect to the adequacy of the implementation, including
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied
// warranties of merchantability or fitness for a particular
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications are
// expressly prohibited.
//
// This copyright and support notice must be retained as part
// of this text at all times. (c) Copyright 2004-2008 Xilinx, Inc.
// All rights reserved.
//
//-----------------------------------------------------------------------------
// Description:  This is the EMAC block level Verilog design for the Virtex-5 
//               Embedded Ethernet MAC Example Design.  It is intended that
//               this example design can be quickly adapted and downloaded onto
//               an FPGA to provide a real hardware test environment.
//
//               The block level:
//
//               * instantiates all clock management logic required (BUFGs, 
//                 DCMs) to operate the EMAC and its example design;
//
//               * instantiates appropriate PHY interface modules (GMII, MII,
//                 RGMII, SGMII or 1000BASE-X) as required based on the user
//                 configuration.
//
//
//               Please refer to the Datasheet, Getting Started Guide, and
//               the Virtex-5 Embedded Tri-Mode Ethernet MAC User Gude for
//               further information.
//-----------------------------------------------------------------------------


`timescale 1 ps / 1 ps


//-----------------------------------------------------------------------------
// The module declaration for the top level design.
//-----------------------------------------------------------------------------
module v5_emac_v1_5_block
(
    // EMAC0 Clocking
    // TX Client Clock output from EMAC0
    TX_CLIENT_CLK_OUT_0,
    // RX Client Clock output from EMAC0
    RX_CLIENT_CLK_OUT_0,
    // TX PHY Clock output from EMAC0
    TX_PHY_CLK_OUT_0,
    // EMAC0 TX Client Clock input from BUFG
    TX_CLIENT_CLK_0,
    // EMAC0 RX Client Clock input from BUFG
    RX_CLIENT_CLK_0,
    // EMAC0 TX PHY Clock input from BUFG
    TX_PHY_CLK_0,

    // Client Receiver Interface - EMAC0
    EMAC0CLIENTRXD,
    EMAC0CLIENTRXDVLD,
    EMAC0CLIENTRXGOODFRAME,
    EMAC0CLIENTRXBADFRAME,
    EMAC0CLIENTRXFRAMEDROP,
    EMAC0CLIENTRXSTATS,
    EMAC0CLIENTRXSTATSVLD,
    EMAC0CLIENTRXSTATSBYTEVLD,

    // Client Transmitter Interface - EMAC0
    CLIENTEMAC0TXD,
    CLIENTEMAC0TXDVLD,
    EMAC0CLIENTTXACK,
    CLIENTEMAC0TXFIRSTBYTE,
    CLIENTEMAC0TXUNDERRUN,
    EMAC0CLIENTTXCOLLISION,
    EMAC0CLIENTTXRETRANSMIT,
    CLIENTEMAC0TXIFGDELAY,
    EMAC0CLIENTTXSTATS,
    EMAC0CLIENTTXSTATSVLD,
    EMAC0CLIENTTXSTATSBYTEVLD,

    // MAC Control Interface - EMAC0
    CLIENTEMAC0PAUSEREQ,
    CLIENTEMAC0PAUSEVAL,

    // Clock Signal - EMAC0
    GTX_CLK_0,

    // GMII Interface - EMAC0
    GMII_TXD_0,
    GMII_TX_EN_0,
    GMII_TX_ER_0,
    GMII_TX_CLK_0,
    GMII_RXD_0,
    GMII_RX_DV_0,
    GMII_RX_ER_0,
    GMII_RX_CLK_0 ,

    MII_TX_CLK_0,
    GMII_COL_0,
    GMII_CRS_0,

    // Asynchronous Reset Input
    RESET
);


//-----------------------------------------------------------------------------
// Port Declarations 
//-----------------------------------------------------------------------------
    // EMAC0 Clocking
    // TX Client Clock output from EMAC0
    output          TX_CLIENT_CLK_OUT_0;
    // RX Client Clock output from EMAC0
    output          RX_CLIENT_CLK_OUT_0;
    // TX PHY Clock output from EMAC0
    output          TX_PHY_CLK_OUT_0;
    // EMAC0 TX Client Clock input from BUFG
    input           TX_CLIENT_CLK_0;
    // EMAC0 RX Client Clock input from BUFG
    input           RX_CLIENT_CLK_0;
    // EMAC0 TX PHY Clock input from BUFG
    input           TX_PHY_CLK_0;

    // Client Receiver Interface - EMAC0
    output   [7:0]  EMAC0CLIENTRXD;
    output          EMAC0CLIENTRXDVLD;
    output          EMAC0CLIENTRXGOODFRAME;
    output          EMAC0CLIENTRXBADFRAME;
    output          EMAC0CLIENTRXFRAMEDROP;
    output   [6:0]  EMAC0CLIENTRXSTATS;
    output          EMAC0CLIENTRXSTATSVLD;
    output          EMAC0CLIENTRXSTATSBYTEVLD;

    // Client Transmitter Interface - EMAC0
    input    [7:0]  CLIENTEMAC0TXD;
    input           CLIENTEMAC0TXDVLD;
    output          EMAC0CLIENTTXACK;
    input           CLIENTEMAC0TXFIRSTBYTE;
    input           CLIENTEMAC0TXUNDERRUN;
    output          EMAC0CLIENTTXCOLLISION;
    output          EMAC0CLIENTTXRETRANSMIT;
    input    [7:0]  CLIENTEMAC0TXIFGDELAY;
    output          EMAC0CLIENTTXSTATS;
    output          EMAC0CLIENTTXSTATSVLD;
    output          EMAC0CLIENTTXSTATSBYTEVLD;

    // MAC Control Interface - EMAC0
    input           CLIENTEMAC0PAUSEREQ;
    input   [15:0]  CLIENTEMAC0PAUSEVAL;

    // Clock Signal - EMAC0
    input           GTX_CLK_0;

    // GMII Interface - EMAC0
    output   [7:0]  GMII_TXD_0;
    output          GMII_TX_EN_0;
    output          GMII_TX_ER_0;
    output          GMII_TX_CLK_0;
    input    [7:0]  GMII_RXD_0;
    input           GMII_RX_DV_0;
    input           GMII_RX_ER_0;
    input           GMII_RX_CLK_0 ;

    input           MII_TX_CLK_0;
    input           GMII_COL_0;
    input           GMII_CRS_0;

    // Asynchronous Reset
    input           RESET;

//-----------------------------------------------------------------------------
// Wire and Reg Declarations 
//-----------------------------------------------------------------------------

    // Asynchronous reset signals
    wire            reset_ibuf_i;
    wire            reset_i;

    // EMAC0 client clocking signals
    wire            rx_client_clk_out_0_i;
    wire            rx_client_clk_in_0_i;
    wire            tx_client_clk_out_0_i;
    wire            tx_client_clk_in_0_i;
    wire            tx_gmii_mii_clk_out_0_i;
    wire            tx_gmii_mii_clk_in_0_i;

    // EMAC0 Physical interface signals
    wire            gmii_tx_en_0_i;
    wire            gmii_tx_er_0_i;
    wire     [7:0]  gmii_txd_0_i;
    wire            gmii_rx_dv_0_r;
    wire            gmii_rx_er_0_r;
    wire     [7:0]  gmii_rxd_0_r;
    wire            mii_tx_clk_0_i;
    wire            gmii_rx_clk_0_i;


    // 125MHz reference clock for EMAC0
    wire            gtx_clk_ibufg_0_i;


//-----------------------------------------------------------------------------
// Main Body of Code 
//-----------------------------------------------------------------------------


    //-------------------------------------------------------------------------
    // Main Reset Circuitry
    //-------------------------------------------------------------------------

    assign reset_ibuf_i = RESET;

    assign reset_i = reset_ibuf_i;

    //-------------------------------------------------------------------------
    // GMII circuitry for the Physical Interface of EMAC0
    //-------------------------------------------------------------------------

    gmii_if gmii0 (
        .RESET(reset_i),
        .GMII_TXD(GMII_TXD_0),
        .GMII_TX_EN(GMII_TX_EN_0),
        .GMII_TX_ER(GMII_TX_ER_0),
        .GMII_TX_CLK(GMII_TX_CLK_0),
        .GMII_RXD(GMII_RXD_0),
        .GMII_RX_DV(GMII_RX_DV_0),
        .GMII_RX_ER(GMII_RX_ER_0),
        .TXD_FROM_MAC(gmii_txd_0_i),
        .TX_EN_FROM_MAC(gmii_tx_en_0_i),
        .TX_ER_FROM_MAC(gmii_tx_er_0_i),
        .TX_CLK(tx_gmii_mii_clk_in_0_i),
        .RXD_TO_MAC(gmii_rxd_0_r),
        .RX_DV_TO_MAC(gmii_rx_dv_0_r),
        .RX_ER_TO_MAC(gmii_rx_er_0_r),
        .RX_CLK(gmii_rx_clk_0_i));

 

    //------------------------------------------------------------------------
    // GTX_CLK Clock Management - 125 MHz clock frequency supplied by the user
    // (Connected to PHYEMAC#GTXCLK of the EMAC primitive)
    //------------------------------------------------------------------------
    assign gtx_clk_ibufg_0_i = GTX_CLK_0; 



    //------------------------------------------------------------------------
    // GMII PHY side transmit clock for EMAC0
    //------------------------------------------------------------------------
    assign tx_gmii_mii_clk_in_0_i = TX_PHY_CLK_0;
 
    
    //------------------------------------------------------------------------
    // GMII PHY side Receiver Clock for EMAC0
    //------------------------------------------------------------------------
    assign gmii_rx_clk_0_i = GMII_RX_CLK_0;    

    //------------------------------------------------------------------------
    // GMII client side transmit clock for EMAC0
    //------------------------------------------------------------------------
    assign tx_client_clk_in_0_i = TX_CLIENT_CLK_0;

    //------------------------------------------------------------------------
    // GMII client side receive clock for EMAC0
    //------------------------------------------------------------------------
    assign rx_client_clk_in_0_i = RX_CLIENT_CLK_0;

    //------------------------------------------------------------------------
    // MII Transmitter Clock for EMAC0
    //------------------------------------------------------------------------
    assign mii_tx_clk_0_i = MII_TX_CLK_0;




    //------------------------------------------------------------------------
    // Connect previously derived client clocks to example design output ports
    //------------------------------------------------------------------------
    // EMAC0 Clocking
    // TX Client Clock output from EMAC0
    assign TX_CLIENT_CLK_OUT_0       = tx_client_clk_out_0_i;
    // RX Client Clock output from EMAC0
    assign RX_CLIENT_CLK_OUT_0       = rx_client_clk_out_0_i;
    // TX PHY Clock output from EMAC0
    assign TX_PHY_CLK_OUT_0          = tx_gmii_mii_clk_out_0_i;




    //------------------------------------------------------------------------
    // Instantiate the EMAC Wrapper (v5_emac_v1_5.v) 
    //------------------------------------------------------------------------
    v5_emac_v1_5 v5_emac_wrapper
    (
        // Client Receiver Interface - EMAC0
        .EMAC0CLIENTRXCLIENTCLKOUT      (rx_client_clk_out_0_i),
        .CLIENTEMAC0RXCLIENTCLKIN       (rx_client_clk_in_0_i),
        .EMAC0CLIENTRXD                 (EMAC0CLIENTRXD),
        .EMAC0CLIENTRXDVLD              (EMAC0CLIENTRXDVLD),
        .EMAC0CLIENTRXDVLDMSW           (),
        .EMAC0CLIENTRXGOODFRAME         (EMAC0CLIENTRXGOODFRAME),
        .EMAC0CLIENTRXBADFRAME          (EMAC0CLIENTRXBADFRAME),
        .EMAC0CLIENTRXFRAMEDROP         (EMAC0CLIENTRXFRAMEDROP),
        .EMAC0CLIENTRXSTATS             (EMAC0CLIENTRXSTATS),
        .EMAC0CLIENTRXSTATSVLD          (EMAC0CLIENTRXSTATSVLD),
        .EMAC0CLIENTRXSTATSBYTEVLD      (EMAC0CLIENTRXSTATSBYTEVLD),

        // Client Transmitter Interface - EMAC0
        .EMAC0CLIENTTXCLIENTCLKOUT      (tx_client_clk_out_0_i),
        .CLIENTEMAC0TXCLIENTCLKIN       (tx_client_clk_in_0_i),
        .CLIENTEMAC0TXD                 (CLIENTEMAC0TXD),
        .CLIENTEMAC0TXDVLD              (CLIENTEMAC0TXDVLD),
        .CLIENTEMAC0TXDVLDMSW           (1'b0),
        .EMAC0CLIENTTXACK               (EMAC0CLIENTTXACK),
        .CLIENTEMAC0TXFIRSTBYTE         (CLIENTEMAC0TXFIRSTBYTE),
        .CLIENTEMAC0TXUNDERRUN          (CLIENTEMAC0TXUNDERRUN),
        .EMAC0CLIENTTXCOLLISION         (EMAC0CLIENTTXCOLLISION),
        .EMAC0CLIENTTXRETRANSMIT        (EMAC0CLIENTTXRETRANSMIT),
        .CLIENTEMAC0TXIFGDELAY          (CLIENTEMAC0TXIFGDELAY),
        .EMAC0CLIENTTXSTATS             (EMAC0CLIENTTXSTATS),
        .EMAC0CLIENTTXSTATSVLD          (EMAC0CLIENTTXSTATSVLD),
        .EMAC0CLIENTTXSTATSBYTEVLD      (EMAC0CLIENTTXSTATSBYTEVLD),

        // MAC Control Interface - EMAC0
        .CLIENTEMAC0PAUSEREQ            (CLIENTEMAC0PAUSEREQ),
        .CLIENTEMAC0PAUSEVAL            (CLIENTEMAC0PAUSEVAL),

        // Clock Signals - EMAC0
        .GTX_CLK_0                      (gtx_clk_ibufg_0_i),

        .EMAC0PHYTXGMIIMIICLKOUT        (tx_gmii_mii_clk_out_0_i),
        .PHYEMAC0TXGMIIMIICLKIN         (tx_gmii_mii_clk_in_0_i),

        // GMII Interface - EMAC0
        .GMII_TXD_0                     (gmii_txd_0_i),
        .GMII_TX_EN_0                   (gmii_tx_en_0_i),
        .GMII_TX_ER_0                   (gmii_tx_er_0_i),
        .GMII_RXD_0                     (gmii_rxd_0_r),
        .GMII_RX_DV_0                   (gmii_rx_dv_0_r),
        .GMII_RX_ER_0                   (gmii_rx_er_0_r),
        .GMII_RX_CLK_0                  (gmii_rx_clk_0_i),

        .MII_TX_CLK_0                   (mii_tx_clk_0_i),
        .GMII_COL_0                     (GMII_COL_0),
        .GMII_CRS_0                     (GMII_CRS_0),


        .DCM_LOCKED_0                   (1'b1  ),

        // Asynchronous Reset
        .RESET                          (reset_i)
        );


  
 



endmodule
