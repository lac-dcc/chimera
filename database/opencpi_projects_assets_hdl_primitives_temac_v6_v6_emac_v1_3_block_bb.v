// Ethernet_v6.v -
//  Contains
//     i)   block-level-wrapper
//     ii)  EMAC wrapper
//     iii) GMII code


//-----------------------------------------------------------------------------
// Title      : Block-level Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
// Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
// File       : v6_emac_v1_3_block.v
// Version    : 1.3
//-----------------------------------------------------------------------------
// Description:  This is the block-level wrapper for the Virtex-6 Embedded
//               Tri-Mode Ethernet MAC. It is intended that this example design
//               can be quickly adapted and downloaded onto an FPGA to provide
//               a hardware test environment.
//
//               The block-level wrapper:
//
//               * instantiates appropriate PHY interface modules (GMII, MII,
//                 RGMII, SGMII or 1000BASE-X) as required per the user
//                 configuration;
//
//               * instantiates some clocking and reset resources to operate
//                 the EMAC and its example design.
//
//               Please refer to the Datasheet, Getting Started Guide, and
//               the Virtex-6 Embedded Tri-Mode Ethernet MAC User Gude for
//               further information.
//-----------------------------------------------------------------------------

`timescale 1 ps / 1 ps

//-----------------------------------------------------------------------------
// Module declaration for the block-level wrapper
//-----------------------------------------------------------------------------

(* box_type="user_black_box" *)
module v6_emac_v1_3_block
(

    // TX clock output
    TX_CLK_OUT,
    // TX clock input from BUFG
    TX_CLK,

    // Client receiver interface
    EMACCLIENTRXD,
    EMACCLIENTRXDVLD,
    EMACCLIENTRXGOODFRAME,
    EMACCLIENTRXBADFRAME,
    EMACCLIENTRXFRAMEDROP,
    EMACCLIENTRXSTATS,
    EMACCLIENTRXSTATSVLD,
    EMACCLIENTRXSTATSBYTEVLD,

    // Client transmitter interface
    CLIENTEMACTXD,
    CLIENTEMACTXDVLD,
    EMACCLIENTTXACK,
    CLIENTEMACTXFIRSTBYTE,
    CLIENTEMACTXUNDERRUN,
    EMACCLIENTTXCOLLISION,
    EMACCLIENTTXRETRANSMIT,
    CLIENTEMACTXIFGDELAY,
    EMACCLIENTTXSTATS,
    EMACCLIENTTXSTATSVLD,
    EMACCLIENTTXSTATSBYTEVLD,

    // MAC control interface
    CLIENTEMACPAUSEREQ,
    CLIENTEMACPAUSEVAL,

    // Receive-side PHY clock on regional buffer, to EMAC
    PHY_RX_CLK,

    // Clock signal
    GTX_CLK,

    // GMII interface
    GMII_TXD,
    GMII_TX_EN,
    GMII_TX_ER,
    GMII_TX_CLK,
    GMII_RXD,
    GMII_RX_DV,
    GMII_RX_ER,
    GMII_RX_CLK,

    // Asynchronous reset
    RESET
);


//-----------------------------------------------------------------------------
// Port declarations
//-----------------------------------------------------------------------------

    // TX clock output
    output          TX_CLK_OUT;
    // TX clock input from BUFG
    input           TX_CLK;

    // Client receiver interface
    output   [7:0]  EMACCLIENTRXD;
    output          EMACCLIENTRXDVLD;
    output          EMACCLIENTRXGOODFRAME;
    output          EMACCLIENTRXBADFRAME;
    output          EMACCLIENTRXFRAMEDROP;
    output   [6:0]  EMACCLIENTRXSTATS;
    output          EMACCLIENTRXSTATSVLD;
    output          EMACCLIENTRXSTATSBYTEVLD;

    // Client transmitter interface
    input    [7:0]  CLIENTEMACTXD;
    input           CLIENTEMACTXDVLD;
    output          EMACCLIENTTXACK;
    input           CLIENTEMACTXFIRSTBYTE;
    input           CLIENTEMACTXUNDERRUN;
    output          EMACCLIENTTXCOLLISION;
    output          EMACCLIENTTXRETRANSMIT;
    input    [7:0]  CLIENTEMACTXIFGDELAY;
    output          EMACCLIENTTXSTATS;
    output          EMACCLIENTTXSTATSVLD;
    output          EMACCLIENTTXSTATSBYTEVLD;

    // MAC control interface
    input           CLIENTEMACPAUSEREQ;
    input   [15:0]  CLIENTEMACPAUSEVAL;

    // Receive-side PHY clock on regional buffer, to EMAC
    input           PHY_RX_CLK;

    // Clock signal
    input           GTX_CLK;

    // GMII interface
    output   [7:0]  GMII_TXD;
    output          GMII_TX_EN;
    output          GMII_TX_ER;
    output          GMII_TX_CLK;
    input    [7:0]  GMII_RXD;
    input           GMII_RX_DV;
    input           GMII_RX_ER;
    input           GMII_RX_CLK;

    // Asynchronous reset
    input           RESET;

endmodule
