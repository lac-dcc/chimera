//-----------------------------------------------------------------------------
// Title      : Virtex-5 Ethernet MAC Wrapper Top Level
// Project    : Virtex-5 Ethernet MAC Wrappers
//-----------------------------------------------------------------------------
// File       : v5_emac_v1_6_block.v
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
module v5_emac_v1_6_block
(
    // EMAC0 Clocking
    // TX Clock output from EMAC
    TX_CLK_OUT,
    // EMAC0 TX Clock input from BUFG
    TX_CLK_0,

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

    // Asynchronous Reset Input
    RESET
);




//-----------------------------------------------------------------------------
// Port Declarations 
//-----------------------------------------------------------------------------
    // EMAC0 Clocking
    // TX Clock output from EMAC
    output          TX_CLK_OUT;
    // EMAC0 TX Clock input from BUFG
    input           TX_CLK_0;

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
    assign tx_gmii_mii_clk_in_0_i = TX_CLK_0;
 
    
    //------------------------------------------------------------------------
    // GMII PHY side Receiver Clock for EMAC0
    //------------------------------------------------------------------------
    assign gmii_rx_clk_0_i = GMII_RX_CLK_0;    

    //------------------------------------------------------------------------
    // GMII client side transmit clock for EMAC0
    //------------------------------------------------------------------------
    assign tx_client_clk_in_0_i = TX_CLK_0;

    //------------------------------------------------------------------------
    // GMII client side receive clock for EMAC0
    //------------------------------------------------------------------------
    assign rx_client_clk_in_0_i = gmii_rx_clk_0_i;




    //------------------------------------------------------------------------
    // Connect previously derived client clocks to example design output ports
    //------------------------------------------------------------------------
    // EMAC0 Clocking
    // TX Clock output from EMAC
    assign TX_CLK_OUT                = tx_gmii_mii_clk_out_0_i;




    //------------------------------------------------------------------------
    // Instantiate the EMAC Wrapper (v5_emac_v1_6.v) 
    //------------------------------------------------------------------------
    v5_emac_v1_6 v5_emac_wrapper_inst
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


        .DCM_LOCKED_0                   (1'b1  ),

        // Asynchronous Reset
        .RESET                          (reset_i)
        );
endmodule




//-----------------------------------------------------------------------------
// Title      : Virtex-5 Ethernet MAC Wrapper
//-----------------------------------------------------------------------------
// File       : v5_emac_v1_6.v
// Author     : Xilinx
//-----------------------------------------------------------------------------
// Description:  This wrapper file instantiates the full Virtex-5 Ethernet 
//               MAC (EMAC) primitive.  For one or both of the two Ethernet MACs
//               (EMAC0/EMAC1):
//
//               * all unused input ports on the primitive will be tied to the
//                 appropriate logic level;
//
//               * all unused output ports on the primitive will be left 
//                 unconnected;
//
//               * the Tie-off Vector will be connected based on the options 
//                 selected from CORE Generator;
//
//               * only used ports will be connected to the ports of this 
//                 wrapper file.
//
//               This simplified wrapper should therefore be used as the 
//               instantiation template for the EMAC in customer designs.
//------------------------------------------------------------------------------

`timescale 1 ps / 1 ps


//------------------------------------------------------------------------------
// The module declaration for the top level wrapper.
//------------------------------------------------------------------------------
(* X_CORE_INFO = "v5_emac_v1_6, Coregen 11.1" *)
module v5_emac_v1_6
(
    // Client Receiver Interface - EMAC0
    EMAC0CLIENTRXCLIENTCLKOUT,
    CLIENTEMAC0RXCLIENTCLKIN,
    EMAC0CLIENTRXD,
    EMAC0CLIENTRXDVLD,
    EMAC0CLIENTRXDVLDMSW,
    EMAC0CLIENTRXGOODFRAME,
    EMAC0CLIENTRXBADFRAME,
    EMAC0CLIENTRXFRAMEDROP,
    EMAC0CLIENTRXSTATS,
    EMAC0CLIENTRXSTATSVLD,
    EMAC0CLIENTRXSTATSBYTEVLD,

    // Client Transmitter Interface - EMAC0
    EMAC0CLIENTTXCLIENTCLKOUT,
    CLIENTEMAC0TXCLIENTCLKIN,
    CLIENTEMAC0TXD,
    CLIENTEMAC0TXDVLD,
    CLIENTEMAC0TXDVLDMSW,
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
    PHYEMAC0TXGMIIMIICLKIN,
    EMAC0PHYTXGMIIMIICLKOUT,

    // GMII Interface - EMAC0
    GMII_TXD_0,
    GMII_TX_EN_0,
    GMII_TX_ER_0,
    GMII_RXD_0,
    GMII_RX_DV_0,
    GMII_RX_ER_0,
    GMII_RX_CLK_0,




    DCM_LOCKED_0,

    // Asynchronous Reset
    RESET
);

    //--------------------------------------------------------------------------
    // Port Declarations
    //--------------------------------------------------------------------------


    // Client Receiver Interface - EMAC0
    output          EMAC0CLIENTRXCLIENTCLKOUT;
    input           CLIENTEMAC0RXCLIENTCLKIN;
    output   [7:0]  EMAC0CLIENTRXD;
    output          EMAC0CLIENTRXDVLD;
    output          EMAC0CLIENTRXDVLDMSW;
    output          EMAC0CLIENTRXGOODFRAME;
    output          EMAC0CLIENTRXBADFRAME;
    output          EMAC0CLIENTRXFRAMEDROP;
    output   [6:0]  EMAC0CLIENTRXSTATS;
    output          EMAC0CLIENTRXSTATSVLD;
    output          EMAC0CLIENTRXSTATSBYTEVLD;

    // Client Transmitter Interface - EMAC0
    output          EMAC0CLIENTTXCLIENTCLKOUT;
    input           CLIENTEMAC0TXCLIENTCLKIN;
    input    [7:0]  CLIENTEMAC0TXD;
    input           CLIENTEMAC0TXDVLD;
    input           CLIENTEMAC0TXDVLDMSW;
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
    output          EMAC0PHYTXGMIIMIICLKOUT;
    input           PHYEMAC0TXGMIIMIICLKIN;

    // GMII Interface - EMAC0
    output   [7:0]  GMII_TXD_0;
    output          GMII_TX_EN_0;
    output          GMII_TX_ER_0;
    input    [7:0]  GMII_RXD_0;
    input           GMII_RX_DV_0;
    input           GMII_RX_ER_0;
    input           GMII_RX_CLK_0;




    input           DCM_LOCKED_0;

    // Asynchronous Reset
    input           RESET;


    //--------------------------------------------------------------------------
    // Wire Declarations 
    //--------------------------------------------------------------------------


    wire    [15:0]  client_rx_data_0_i;
    wire    [15:0]  client_tx_data_0_i;




    //--------------------------------------------------------------------------
    // Main Body of Code 
    //--------------------------------------------------------------------------


    // 8-bit client data on EMAC0
    assign EMAC0CLIENTRXD = client_rx_data_0_i[7:0];
    assign #4000 client_tx_data_0_i = {8'b00000000, CLIENTEMAC0TXD};




    //--------------------------------------------------------------------------
    // Instantiate the Virtex-5 Embedded Ethernet EMAC
    //--------------------------------------------------------------------------
    TEMAC v5_emac
    (
        .RESET                          (RESET),

        // EMAC0
        .EMAC0CLIENTRXCLIENTCLKOUT      (EMAC0CLIENTRXCLIENTCLKOUT),
        .CLIENTEMAC0RXCLIENTCLKIN       (CLIENTEMAC0RXCLIENTCLKIN),
        .EMAC0CLIENTRXD                 (client_rx_data_0_i),
        .EMAC0CLIENTRXDVLD              (EMAC0CLIENTRXDVLD),
        .EMAC0CLIENTRXDVLDMSW           (EMAC0CLIENTRXDVLDMSW),
        .EMAC0CLIENTRXGOODFRAME         (EMAC0CLIENTRXGOODFRAME),
        .EMAC0CLIENTRXBADFRAME          (EMAC0CLIENTRXBADFRAME),
        .EMAC0CLIENTRXFRAMEDROP         (EMAC0CLIENTRXFRAMEDROP),
        .EMAC0CLIENTRXSTATS             (EMAC0CLIENTRXSTATS),
        .EMAC0CLIENTRXSTATSVLD          (EMAC0CLIENTRXSTATSVLD),
        .EMAC0CLIENTRXSTATSBYTEVLD      (EMAC0CLIENTRXSTATSBYTEVLD),

        .EMAC0CLIENTTXCLIENTCLKOUT      (EMAC0CLIENTTXCLIENTCLKOUT),
        .CLIENTEMAC0TXCLIENTCLKIN       (CLIENTEMAC0TXCLIENTCLKIN),
        .CLIENTEMAC0TXD                 (client_tx_data_0_i),
        .CLIENTEMAC0TXDVLD              (CLIENTEMAC0TXDVLD),
        .CLIENTEMAC0TXDVLDMSW           (CLIENTEMAC0TXDVLDMSW),
        .EMAC0CLIENTTXACK               (EMAC0CLIENTTXACK),
        .CLIENTEMAC0TXFIRSTBYTE         (CLIENTEMAC0TXFIRSTBYTE),
        .CLIENTEMAC0TXUNDERRUN          (CLIENTEMAC0TXUNDERRUN),
        .EMAC0CLIENTTXCOLLISION         (EMAC0CLIENTTXCOLLISION),
        .EMAC0CLIENTTXRETRANSMIT        (EMAC0CLIENTTXRETRANSMIT),
        .CLIENTEMAC0TXIFGDELAY          (CLIENTEMAC0TXIFGDELAY),
        .EMAC0CLIENTTXSTATS             (EMAC0CLIENTTXSTATS),
        .EMAC0CLIENTTXSTATSVLD          (EMAC0CLIENTTXSTATSVLD),
        .EMAC0CLIENTTXSTATSBYTEVLD      (EMAC0CLIENTTXSTATSBYTEVLD),

        .CLIENTEMAC0PAUSEREQ            (CLIENTEMAC0PAUSEREQ),
        .CLIENTEMAC0PAUSEVAL            (CLIENTEMAC0PAUSEVAL),

        .PHYEMAC0GTXCLK                 (GTX_CLK_0),
        .EMAC0PHYTXGMIIMIICLKOUT        (EMAC0PHYTXGMIIMIICLKOUT),
        .PHYEMAC0TXGMIIMIICLKIN         (PHYEMAC0TXGMIIMIICLKIN),

        .PHYEMAC0RXCLK                  (GMII_RX_CLK_0),
        .PHYEMAC0RXD                    (GMII_RXD_0),
        .PHYEMAC0RXDV                   (GMII_RX_DV_0),
        .PHYEMAC0RXER                   (GMII_RX_ER_0),
        .EMAC0PHYTXCLK                  (),
        .EMAC0PHYTXD                    (GMII_TXD_0),
        .EMAC0PHYTXEN                   (GMII_TX_EN_0),
        .EMAC0PHYTXER                   (GMII_TX_ER_0),
        .PHYEMAC0MIITXCLK               (),
        .PHYEMAC0COL                    (1'b0),
        .PHYEMAC0CRS                    (1'b0),

        .CLIENTEMAC0DCMLOCKED           (DCM_LOCKED_0),
        .EMAC0CLIENTANINTERRUPT         (),
        .PHYEMAC0SIGNALDET              (1'b0),
        .PHYEMAC0PHYAD                  (5'b00000),
        .EMAC0PHYENCOMMAALIGN           (),
        .EMAC0PHYLOOPBACKMSB            (),
        .EMAC0PHYMGTRXRESET             (),
        .EMAC0PHYMGTTXRESET             (),
        .EMAC0PHYPOWERDOWN              (),
        .EMAC0PHYSYNCACQSTATUS          (),
        .PHYEMAC0RXCLKCORCNT            (3'b000),
        .PHYEMAC0RXBUFSTATUS            (2'b00),
        .PHYEMAC0RXBUFERR               (1'b0),
        .PHYEMAC0RXCHARISCOMMA          (1'b0),
        .PHYEMAC0RXCHARISK              (1'b0),
        .PHYEMAC0RXCHECKINGCRC          (1'b0),
        .PHYEMAC0RXCOMMADET             (1'b0),
        .PHYEMAC0RXDISPERR              (1'b0),
        .PHYEMAC0RXLOSSOFSYNC           (2'b00),
        .PHYEMAC0RXNOTINTABLE           (1'b0),
        .PHYEMAC0RXRUNDISP              (1'b0),
        .PHYEMAC0TXBUFERR               (1'b0),
        .EMAC0PHYTXCHARDISPMODE         (),
        .EMAC0PHYTXCHARDISPVAL          (),
        .EMAC0PHYTXCHARISK              (),

        .EMAC0PHYMCLKOUT                (),
        .PHYEMAC0MCLKIN                 (1'b0),
        .PHYEMAC0MDIN                   (1'b1),
        .EMAC0PHYMDOUT                  (),
        .EMAC0PHYMDTRI                  (),
        .EMAC0SPEEDIS10100              (),

        // EMAC1
        .EMAC1CLIENTRXCLIENTCLKOUT      (),
        .CLIENTEMAC1RXCLIENTCLKIN       (1'b0),
        .EMAC1CLIENTRXD                 (),
        .EMAC1CLIENTRXDVLD              (),
        .EMAC1CLIENTRXDVLDMSW           (),
        .EMAC1CLIENTRXGOODFRAME         (),
        .EMAC1CLIENTRXBADFRAME          (),
        .EMAC1CLIENTRXFRAMEDROP         (),
        .EMAC1CLIENTRXSTATS             (),
        .EMAC1CLIENTRXSTATSVLD          (),
        .EMAC1CLIENTRXSTATSBYTEVLD      (),

        .EMAC1CLIENTTXCLIENTCLKOUT      (),
        .CLIENTEMAC1TXCLIENTCLKIN       (1'b0),
        .CLIENTEMAC1TXD                 (16'h0000),
        .CLIENTEMAC1TXDVLD              (1'b0),
        .CLIENTEMAC1TXDVLDMSW           (1'b0),
        .EMAC1CLIENTTXACK               (),
        .CLIENTEMAC1TXFIRSTBYTE         (1'b0),
        .CLIENTEMAC1TXUNDERRUN          (1'b0),
        .EMAC1CLIENTTXCOLLISION         (),
        .EMAC1CLIENTTXRETRANSMIT        (),
        .CLIENTEMAC1TXIFGDELAY          (8'h00),
        .EMAC1CLIENTTXSTATS             (),
        .EMAC1CLIENTTXSTATSVLD          (),
        .EMAC1CLIENTTXSTATSBYTEVLD      (),

        .CLIENTEMAC1PAUSEREQ            (1'b0),
        .CLIENTEMAC1PAUSEVAL            (16'h0000),

        .PHYEMAC1GTXCLK                 (1'b0),
        .EMAC1PHYTXGMIIMIICLKOUT        (),
        .PHYEMAC1TXGMIIMIICLKIN         (1'b0),

        .PHYEMAC1RXCLK                  (1'b0),
        .PHYEMAC1RXD                    (8'h00),
        .PHYEMAC1RXDV                   (1'b0),
        .PHYEMAC1RXER                   (1'b0),
        .PHYEMAC1MIITXCLK               (1'b0),
        .EMAC1PHYTXCLK                  (),
        .EMAC1PHYTXD                    (),
        .EMAC1PHYTXEN                   (),
        .EMAC1PHYTXER                   (),
        .PHYEMAC1COL                    (1'b0),
        .PHYEMAC1CRS                    (1'b0),

        .CLIENTEMAC1DCMLOCKED           (1'b1),
        .EMAC1CLIENTANINTERRUPT         (),
        .PHYEMAC1SIGNALDET              (1'b0),
        .PHYEMAC1PHYAD                  (5'b00000),
        .EMAC1PHYENCOMMAALIGN           (),
        .EMAC1PHYLOOPBACKMSB            (),
        .EMAC1PHYMGTRXRESET             (),
        .EMAC1PHYMGTTXRESET             (),
        .EMAC1PHYPOWERDOWN              (),
        .EMAC1PHYSYNCACQSTATUS          (),
        .PHYEMAC1RXCLKCORCNT            (3'b000),
        .PHYEMAC1RXBUFSTATUS            (2'b00),
        .PHYEMAC1RXBUFERR               (1'b0),
        .PHYEMAC1RXCHARISCOMMA          (1'b0),
        .PHYEMAC1RXCHARISK              (1'b0),
        .PHYEMAC1RXCHECKINGCRC          (1'b0),
        .PHYEMAC1RXCOMMADET             (1'b0),
        .PHYEMAC1RXDISPERR              (1'b0),
        .PHYEMAC1RXLOSSOFSYNC           (2'b00),
        .PHYEMAC1RXNOTINTABLE           (1'b0),
        .PHYEMAC1RXRUNDISP              (1'b0),
        .PHYEMAC1TXBUFERR               (1'b0),
        .EMAC1PHYTXCHARDISPMODE         (),
        .EMAC1PHYTXCHARDISPVAL          (),
        .EMAC1PHYTXCHARISK              (),

        .EMAC1PHYMCLKOUT                (),
        .PHYEMAC1MCLKIN                 (1'b0),
        .PHYEMAC1MDIN                   (1'b0),
        .EMAC1PHYMDOUT                  (),
        .EMAC1PHYMDTRI                  (),
        .EMAC1SPEEDIS10100              (),

        // Host Interface 
        .HOSTCLK                        (1'b0),
        .HOSTOPCODE                     (2'b00),
        .HOSTREQ                        (1'b0),
        .HOSTMIIMSEL                    (1'b0),
        .HOSTADDR                       (10'b0000000000),
        .HOSTWRDATA                     (32'h00000000),
        .HOSTMIIMRDY                    (),
        .HOSTRDDATA                     (),
        .HOSTEMAC1SEL                   (1'b0),

        // DCR Interface
        .DCREMACCLK                     (1'b0),
        .DCREMACABUS                    (10'h000),
        .DCREMACREAD                    (1'b0),
        .DCREMACWRITE                   (1'b0),
        .DCREMACDBUS                    (32'h00000000),
        .EMACDCRACK                     (),
        .EMACDCRDBUS                    (),
        .DCREMACENABLE                  (1'b0),
        .DCRHOSTDONEIR                  ()
    );
    //------
    // EMAC0
    //------
    // PCS/PMA logic is not in use
    //synthesis attribute EMAC0_PHYINITAUTONEG_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_PHYINITAUTONEG_ENABLE = "FALSE";
    //synthesis attribute EMAC0_PHYISOLATE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_PHYISOLATE = "FALSE";
    //synthesis attribute EMAC0_PHYLOOPBACKMSB of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_PHYLOOPBACKMSB = "FALSE";
    //synthesis attribute EMAC0_PHYPOWERDOWN of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_PHYPOWERDOWN = "FALSE";
    //synthesis attribute EMAC0_PHYRESET of v5_emac is "TRUE"
    defparam v5_emac.EMAC0_PHYRESET = "TRUE";
    //synthesis attribute EMAC0_CONFIGVEC_79 of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_CONFIGVEC_79 = "FALSE";
    //synthesis attribute EMAC0_GTLOOPBACK of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_GTLOOPBACK = "FALSE";
    //synthesis attribute EMAC0_UNIDIRECTION_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_UNIDIRECTION_ENABLE = "FALSE";
    //synthesis attribute EMAC0_LINKTIMERVAL of v5_emac is 9'h000
    defparam v5_emac.EMAC0_LINKTIMERVAL = 9'h000;

    // Configure the MAC operating mode
    // MDIO is not enabled
    //synthesis attribute EMAC0_MDIO_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_MDIO_ENABLE = "FALSE";  
    // Speed is defaulted to 1000Mb/s
    //synthesis attribute EMAC0_SPEED_LSB of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_SPEED_LSB = "FALSE";
    //synthesis attribute EMAC0_SPEED_MSB of v5_emac is "TRUE"
    defparam v5_emac.EMAC0_SPEED_MSB = "TRUE"; 
    //synthesis attribute EMAC0_USECLKEN of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_USECLKEN = "FALSE";
    //synthesis attribute EMAC0_BYTEPHY of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_BYTEPHY = "FALSE";
   
    //synthesis attribute EMAC0_RGMII_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RGMII_ENABLE = "FALSE";
    //synthesis attribute EMAC0_SGMII_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_SGMII_ENABLE = "FALSE";
    //synthesis attribute EMAC0_1000BASEX_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_1000BASEX_ENABLE = "FALSE";
    // The Host I/F is not  in use
    //synthesis attribute EMAC0_HOST_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_HOST_ENABLE = "FALSE";  
    // 8-bit interface for Tx client
    //synthesis attribute EMAC0_TX16BITCLIENT_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TX16BITCLIENT_ENABLE = "FALSE";
    // 8-bit interface for Rx client
    //synthesis attribute EMAC0_RX16BITCLIENT_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RX16BITCLIENT_ENABLE = "FALSE";    
    // The Address Filter (not enabled)
    //synthesis attribute EMAC0_ADDRFILTER_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_ADDRFILTER_ENABLE = "FALSE";  

    // MAC configuration defaults
    // Rx Length/Type checking enabled (standard IEEE operation)
    //synthesis attribute EMAC0_LTCHECK_DISABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_LTCHECK_DISABLE = "FALSE";  
    // Rx Flow Control (not enabled)
    //synthesis attribute EMAC0_RXFLOWCTRL_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXFLOWCTRL_ENABLE = "FALSE";  
    // Tx Flow Control (not enabled)
    //synthesis attribute EMAC0_TXFLOWCTRL_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXFLOWCTRL_ENABLE = "FALSE";  
    // Transmitter is not held in reset not asserted (normal operating mode)
    //synthesis attribute EMAC0_TXRESET of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXRESET = "FALSE";  
    // Transmitter Jumbo Frames (not enabled)
    //synthesis attribute EMAC0_TXJUMBOFRAME_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXJUMBOFRAME_ENABLE = "FALSE";  
    // Transmitter In-band FCS (not enabled)
    //synthesis attribute EMAC0_TXINBANDFCS_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXINBANDFCS_ENABLE = "FALSE";  
    // Transmitter Enabled
    //synthesis attribute EMAC0_TX_ENABLE of v5_emac is "TRUE"
    defparam v5_emac.EMAC0_TX_ENABLE = "TRUE";  
    // Transmitter VLAN mode (not enabled)
    //synthesis attribute EMAC0_TXVLAN_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXVLAN_ENABLE = "FALSE";  
    // Transmitter Half Duplex mode (not enabled)
    //synthesis attribute EMAC0_TXHALFDUPLEX of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXHALFDUPLEX = "FALSE";  
    // Transmitter IFG Adjust (not enabled)
    //synthesis attribute EMAC0_TXIFGADJUST_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_TXIFGADJUST_ENABLE = "FALSE";  
    // Receiver is not held in reset not asserted (normal operating mode)
    //synthesis attribute EMAC0_RXRESET of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXRESET = "FALSE";  
    // Receiver Jumbo Frames (not enabled)
    //synthesis attribute EMAC0_RXJUMBOFRAME_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXJUMBOFRAME_ENABLE = "FALSE";  
    // Receiver In-band FCS (not enabled)
    //synthesis attribute EMAC0_RXINBANDFCS_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXINBANDFCS_ENABLE = "FALSE";  
    // Receiver Enabled
    //synthesis attribute EMAC0_RX_ENABLE of v5_emac is "TRUE"
    defparam v5_emac.EMAC0_RX_ENABLE = "TRUE";  
    // Receiver VLAN mode (not enabled)
    //synthesis attribute EMAC0_RXVLAN_ENABLE of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXVLAN_ENABLE = "FALSE";  
    // Receiver Half Duplex mode (not enabled)
    //synthesis attribute EMAC0_RXHALFDUPLEX of v5_emac is "FALSE"
    defparam v5_emac.EMAC0_RXHALFDUPLEX = "FALSE";  

    // Set the Pause Address Default
    //synthesis attribute EMAC0_PAUSEADDR of v5_emac is 48'hFFEEDDCCBBAA
    defparam v5_emac.EMAC0_PAUSEADDR = 48'hFFEEDDCCBBAA;

    //synthesis attribute EMAC0_UNICASTADDR of v5_emac is 48'h000000000000
    defparam v5_emac.EMAC0_UNICASTADDR = 48'h000000000000;
 
    //synthesis attribute EMAC0_DCRBASEADDR of v5_emac is 8'h00
    defparam v5_emac.EMAC0_DCRBASEADDR = 8'h00;

endmodule

//----------------------------------------------------------------------
// Title      : Gigabit Media Independent Interface (GMII) Physical I/F
// Project    : Virtex-5 Ethernet MAC Wrappers
//----------------------------------------------------------------------
// File       : gmii_if.v
//----------------------------------------------------------------------
// Description:  This module creates a Gigabit Media Independent 
//               Interface (GMII) by instantiating Input/Output buffers  
//               and Input/Output flip-flops as required.
//
//               This interface is used to connect the Ethernet MAC to
//               an external 1000Mb/s (or Tri-speed) Ethernet PHY.
//----------------------------------------------------------------------


`timescale 1 ps / 1 ps

module gmii_if
    (
        RESET,
        // GMII Interface
        GMII_TXD,
        GMII_TX_EN,
        GMII_TX_ER,
        GMII_TX_CLK,
        GMII_RXD,
        GMII_RX_DV,
        GMII_RX_ER,
        // MAC Interface
        TXD_FROM_MAC,
        TX_EN_FROM_MAC,
        TX_ER_FROM_MAC,
        TX_CLK,
        RXD_TO_MAC,
        RX_DV_TO_MAC,
        RX_ER_TO_MAC,
        RX_CLK);

  input  RESET;

  output [7:0] GMII_TXD;
  output GMII_TX_EN;
  output GMII_TX_ER;
  output GMII_TX_CLK;
  
  input  [7:0] GMII_RXD;
  input  GMII_RX_DV;
  input  GMII_RX_ER;
  
  input  [7:0] TXD_FROM_MAC;
  input  TX_EN_FROM_MAC;
  input  TX_ER_FROM_MAC;
  input  TX_CLK;

  output [7:0] RXD_TO_MAC;
  output RX_DV_TO_MAC;
  output RX_ER_TO_MAC;
  input  RX_CLK;

  reg  [7:0] RXD_TO_MAC;
  reg  RX_DV_TO_MAC;
  reg  RX_ER_TO_MAC;

  reg  [7:0] GMII_TXD;
  reg  GMII_TX_EN;
  reg  GMII_TX_ER;

  wire [7:0] GMII_RXD_DLY;
  wire GMII_RX_DV_DLY;
  wire GMII_RX_ER_DLY;

  //------------------------------------------------------------------------
  // GMII Transmitter Clock Management
  //------------------------------------------------------------------------
  // Instantiate a DDR output register.  This is a good way to drive
  // GMII_TX_CLK since the clock-to-PAD delay will be the same as that for
  // data driven from IOB Ouput flip-flops eg GMII_TXD[7:0].
  ODDR gmii_tx_clk_oddr (
      .Q(GMII_TX_CLK),
      .C(TX_CLK),
      .CE(1'b1),
      .D1(1'b0),
      .D2(1'b1),
      .R(RESET),
      .S(1'b0)
  );

  //------------------------------------------------------------------------
  // GMII Transmitter Logic : Drive TX signals through IOBs onto GMII
  // interface
  //------------------------------------------------------------------------
  // Infer IOB Output flip-flops.
  always @(posedge TX_CLK, posedge RESET)
  begin
      if (RESET == 1'b1)
      begin
          GMII_TX_EN <= 1'b0;
          GMII_TX_ER <= 1'b0;
          GMII_TXD   <= 8'h00;
      end
      else
      begin
          GMII_TX_EN <= TX_EN_FROM_MAC;
          GMII_TX_ER <= TX_ER_FROM_MAC;
          GMII_TXD   <= TXD_FROM_MAC;
      end
  end        

  // Route GMII inputs through IO delays
  IDELAY ideld0(.I(GMII_RXD[0]), .O(GMII_RXD_DLY[0]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld0 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld0 is 0;
  defparam ideld0.IOBDELAY_TYPE = "FIXED";
  defparam ideld0.IOBDELAY_VALUE = 0;

  IDELAY ideld1(.I(GMII_RXD[1]), .O(GMII_RXD_DLY[1]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld1 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld1 is 0;
  defparam ideld1.IOBDELAY_TYPE = "FIXED";
  defparam ideld1.IOBDELAY_VALUE = 0;

  IDELAY ideld2(.I(GMII_RXD[2]), .O(GMII_RXD_DLY[2]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld2 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld2 is 0;
  defparam ideld2.IOBDELAY_TYPE = "FIXED";
  defparam ideld2.IOBDELAY_VALUE = 0;

  IDELAY ideld3(.I(GMII_RXD[3]), .O(GMII_RXD_DLY[3]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld3 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld3 is 0;
  defparam ideld3.IOBDELAY_TYPE = "FIXED";
  defparam ideld3.IOBDELAY_VALUE = 0;

  IDELAY ideld4(.I(GMII_RXD[4]), .O(GMII_RXD_DLY[4]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld4 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld4 is 0;
  defparam ideld4.IOBDELAY_TYPE = "FIXED";
  defparam ideld4.IOBDELAY_VALUE = 0;

  IDELAY ideld5(.I(GMII_RXD[5]), .O(GMII_RXD_DLY[5]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld5 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld5 is 0;
  defparam ideld5.IOBDELAY_TYPE = "FIXED";
  defparam ideld5.IOBDELAY_VALUE = 0;

  IDELAY ideld6(.I(GMII_RXD[6]), .O(GMII_RXD_DLY[6]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld6 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld6 is 0;
  defparam ideld6.IOBDELAY_TYPE = "FIXED";
  defparam ideld6.IOBDELAY_VALUE = 0;

  IDELAY ideld7(.I(GMII_RXD[7]), .O(GMII_RXD_DLY[7]), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideld7 is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideld7 is 0;
  defparam ideld7.IOBDELAY_TYPE = "FIXED";
  defparam ideld7.IOBDELAY_VALUE = 0;

  IDELAY ideldv(.I(GMII_RX_DV), .O(GMII_RX_DV_DLY), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideldv is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideldv is 0;
  defparam ideldv.IOBDELAY_TYPE = "FIXED";
  defparam ideldv.IOBDELAY_VALUE = 0;

  IDELAY ideler(.I(GMII_RX_ER), .O(GMII_RX_ER_DLY), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  //synthesis attribute IOBDELAY_TYPE of ideler is "FIXED"
  //synthesis attribute IOBDELAY_VALUE of ideler is 0;
  defparam ideler.IOBDELAY_TYPE = "FIXED";
  defparam ideler.IOBDELAY_VALUE = 0;

  //------------------------------------------------------------------------
  // GMII Receiver Logic : Receive RX signals through IOBs from GMII
  // interface
  //------------------------------------------------------------------------ 
  // Infer IOB Input flip-flops
  always @(posedge RX_CLK, posedge RESET)
  begin
      if (RESET == 1'b1)
      begin
          RX_DV_TO_MAC <= 1'b0;
          RX_ER_TO_MAC <= 1'b0;
          RXD_TO_MAC   <= 8'h00;
      end
      else
      begin
          RX_DV_TO_MAC <= GMII_RX_DV_DLY;
          RX_ER_TO_MAC <= GMII_RX_ER_DLY;
          RXD_TO_MAC   <= GMII_RXD_DLY;
      end
  end

endmodule
