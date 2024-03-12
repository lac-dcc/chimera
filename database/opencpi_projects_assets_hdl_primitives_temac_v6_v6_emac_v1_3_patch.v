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


//-----------------------------------------------------------------------------
// Wire and register declarations
//-----------------------------------------------------------------------------

    // Asynchronous reset signals
    wire            reset_ibuf_i;
    wire            reset_i;

    // Client clocking signals
    wire            rx_client_clk_out_i;
    wire            rx_client_clk_in_i;
    wire            tx_client_clk_out_i;
    wire            tx_client_clk_in_i;
    wire            tx_gmii_mii_clk_out_i;
    wire            tx_gmii_mii_clk_in_i;

    // Physical interface signals
    wire            gmii_tx_en_i;
    wire            gmii_tx_er_i;
    wire     [7:0]  gmii_txd_i;
    wire            gmii_rx_dv_r;
    wire            gmii_rx_er_r;
    wire     [7:0]  gmii_rxd_r;
    wire            gmii_rx_clk_i;

    // 125MHz reference clock
    wire            gtx_clk_ibufg_i;

//-----------------------------------------------------------------------------
// Main body of code
//-----------------------------------------------------------------------------

    //-------------------------------------------------------------------------
    // Main reset circuitry
    //-------------------------------------------------------------------------

    assign reset_ibuf_i = RESET;
    assign reset_i = reset_ibuf_i;

    //-------------------------------------------------------------------------
    // GMII circuitry for the physical interface
    //-------------------------------------------------------------------------

    gmii_if gmii (
        .RESET          (reset_i),
        .GMII_TXD       (GMII_TXD),
        .GMII_TX_EN     (GMII_TX_EN),
        .GMII_TX_ER     (GMII_TX_ER),
        .GMII_TX_CLK    (GMII_TX_CLK),
        .GMII_RXD       (GMII_RXD),
        .GMII_RX_DV     (GMII_RX_DV),
        .GMII_RX_ER     (GMII_RX_ER),
        .TXD_FROM_MAC   (gmii_txd_i),
        .TX_EN_FROM_MAC (gmii_tx_en_i),
        .TX_ER_FROM_MAC (gmii_tx_er_i),
        .TX_CLK         (tx_gmii_mii_clk_in_i),
        .RXD_TO_MAC     (gmii_rxd_r),
        .RX_DV_TO_MAC   (gmii_rx_dv_r),
        .RX_ER_TO_MAC   (gmii_rx_er_r),
        .RX_CLK         (GMII_RX_CLK)
    );

    // GTX reference clock
    assign gtx_clk_ibufg_i = GTX_CLK;

    // GMII PHY-side transmit clock
    assign tx_gmii_mii_clk_in_i = TX_CLK;

    // GMII PHY-side receive clock, regionally-buffered
    assign gmii_rx_clk_i = PHY_RX_CLK;

    // GMII client-side transmit clock
    assign tx_client_clk_in_i = TX_CLK;

    // GMII client-side receive clock
    assign rx_client_clk_in_i = gmii_rx_clk_i;

    // TX clock output
    assign TX_CLK_OUT = tx_gmii_mii_clk_out_i;

    //------------------------------------------------------------------------
    // Instantiate the primitive-level EMAC wrapper (v6_emac_v1_3.v)
    //------------------------------------------------------------------------

    v6_emac_v1_3 v6_emac_v1_3_inst
    (
        // Client receiver interface
        .EMACCLIENTRXCLIENTCLKOUT    (rx_client_clk_out_i),
        .CLIENTEMACRXCLIENTCLKIN     (rx_client_clk_in_i),
        .EMACCLIENTRXD               (EMACCLIENTRXD),
        .EMACCLIENTRXDVLD            (EMACCLIENTRXDVLD),
        .EMACCLIENTRXDVLDMSW         (),
        .EMACCLIENTRXGOODFRAME       (EMACCLIENTRXGOODFRAME),
        .EMACCLIENTRXBADFRAME        (EMACCLIENTRXBADFRAME),
        .EMACCLIENTRXFRAMEDROP       (EMACCLIENTRXFRAMEDROP),
        .EMACCLIENTRXSTATS           (EMACCLIENTRXSTATS),
        .EMACCLIENTRXSTATSVLD        (EMACCLIENTRXSTATSVLD),
        .EMACCLIENTRXSTATSBYTEVLD    (EMACCLIENTRXSTATSBYTEVLD),

        // Client transmitter interface
        .EMACCLIENTTXCLIENTCLKOUT    (tx_client_clk_out_i),
        .CLIENTEMACTXCLIENTCLKIN     (tx_client_clk_in_i),
        .CLIENTEMACTXD               (CLIENTEMACTXD),
        .CLIENTEMACTXDVLD            (CLIENTEMACTXDVLD),
        .CLIENTEMACTXDVLDMSW         (1'b0),
        .EMACCLIENTTXACK             (EMACCLIENTTXACK),
        .CLIENTEMACTXFIRSTBYTE       (CLIENTEMACTXFIRSTBYTE),
        .CLIENTEMACTXUNDERRUN        (CLIENTEMACTXUNDERRUN),
        .EMACCLIENTTXCOLLISION       (EMACCLIENTTXCOLLISION),
        .EMACCLIENTTXRETRANSMIT      (EMACCLIENTTXRETRANSMIT),
        .CLIENTEMACTXIFGDELAY        (CLIENTEMACTXIFGDELAY),
        .EMACCLIENTTXSTATS           (EMACCLIENTTXSTATS),
        .EMACCLIENTTXSTATSVLD        (EMACCLIENTTXSTATSVLD),
        .EMACCLIENTTXSTATSBYTEVLD    (EMACCLIENTTXSTATSBYTEVLD),

        // MAC control interface
        .CLIENTEMACPAUSEREQ          (CLIENTEMACPAUSEREQ),
        .CLIENTEMACPAUSEVAL          (CLIENTEMACPAUSEVAL),

        // Clock signals
        .GTX_CLK                     (gtx_clk_ibufg_i),
        .EMACPHYTXGMIIMIICLKOUT      (tx_gmii_mii_clk_out_i),
        .PHYEMACTXGMIIMIICLKIN       (tx_gmii_mii_clk_in_i),

        // GMII interface
        .GMII_TXD                    (gmii_txd_i),
        .GMII_TX_EN                  (gmii_tx_en_i),
        .GMII_TX_ER                  (gmii_tx_er_i),
        .GMII_RXD                    (gmii_rxd_r),
        .GMII_RX_DV                  (gmii_rx_dv_r),
        .GMII_RX_ER                  (gmii_rx_er_r),
        .GMII_RX_CLK                 (gmii_rx_clk_i),

         // MMCM lock indicator
        .MMCM_LOCKED                 (1'b1),

        // Asynchronous reset
        .RESET                       (reset_i)
    );

endmodule

//-----------------------------------------------------------------------------
// Title      : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
// Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
// File       : v6_emac_v1_3.v
// Version    : 1.3
//-----------------------------------------------------------------------------
// Description:  This wrapper file instantiates the full Virtex-6 Embedded
//               Tri-Mode Ethernet MAC (EMAC) primitive, where:
//
//               * all unused input ports on the primitive are tied to the
//                 appropriate logic level;
//
//               * all unused output ports on the primitive are left
//                 unconnected;
//
//               * the attributes are set based on the options selected
//                 from CORE Generator;
//
//               * only used ports are connected to the ports of this
//                 wrapper file.
//
//               This simplified wrapper should therefore be used as the
//               instantiation template for the EMAC primitive in customer
//               designs.
//------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

//------------------------------------------------------------------------------
// Module declaration for the primitive-level wrapper
//------------------------------------------------------------------------------

(* X_CORE_INFO = "v6_emac_v1_3, Coregen 11.3" *)
(* CORE_GENERATION_INFO = "v6_emac_v1_3,v6_emac_v1_3,{c_has_mii=false,c_has_gmii=true,c_has_rgmii_v1_3=false,c_has_rgmii_v2_0=false,c_has_sgmii=false,c_has_gpcs=false,c_tri_speed=false,c_speed_10=false,c_speed_100=false,c_speed_1000=true,c_has_host=false,c_has_dcr=false,c_has_mdio=false,c_client_16=false,c_add_filter=false,c_has_clock_enable=false,c_serial_mode_switch_en=false,c_overclocking_rate_2000mbps=false,c_overclocking_rate_2500mbps=false,}" *)
module v6_emac_v1_3
(

    // Client Receiver Interface
    EMACCLIENTRXCLIENTCLKOUT,
    CLIENTEMACRXCLIENTCLKIN,
    EMACCLIENTRXD,
    EMACCLIENTRXDVLD,
    EMACCLIENTRXDVLDMSW,
    EMACCLIENTRXGOODFRAME,
    EMACCLIENTRXBADFRAME,
    EMACCLIENTRXFRAMEDROP,
    EMACCLIENTRXSTATS,
    EMACCLIENTRXSTATSVLD,
    EMACCLIENTRXSTATSBYTEVLD,

    // Client Transmitter Interface
    EMACCLIENTTXCLIENTCLKOUT,
    CLIENTEMACTXCLIENTCLKIN,
    CLIENTEMACTXD,
    CLIENTEMACTXDVLD,
    CLIENTEMACTXDVLDMSW,
    EMACCLIENTTXACK,
    CLIENTEMACTXFIRSTBYTE,
    CLIENTEMACTXUNDERRUN,
    EMACCLIENTTXCOLLISION,
    EMACCLIENTTXRETRANSMIT,
    CLIENTEMACTXIFGDELAY,
    EMACCLIENTTXSTATS,
    EMACCLIENTTXSTATSVLD,
    EMACCLIENTTXSTATSBYTEVLD,

    // MAC Control Interface
    CLIENTEMACPAUSEREQ,
    CLIENTEMACPAUSEVAL,

    // Clock Signals
    GTX_CLK,
    PHYEMACTXGMIIMIICLKIN,
    EMACPHYTXGMIIMIICLKOUT,

    // GMII Interface
    GMII_TXD,
    GMII_TX_EN,
    GMII_TX_ER,
    GMII_RXD,
    GMII_RX_DV,
    GMII_RX_ER,
    GMII_RX_CLK,

    // MMCM Lock Indicator
    MMCM_LOCKED,

    // Asynchronous Reset
    RESET
);


    //--------------------------------------------------------------------------
    // Port declarations
    //--------------------------------------------------------------------------

    // Client Receiver Interface
    output          EMACCLIENTRXCLIENTCLKOUT;
    input           CLIENTEMACRXCLIENTCLKIN;
    output   [7:0]  EMACCLIENTRXD;
    output          EMACCLIENTRXDVLD;
    output          EMACCLIENTRXDVLDMSW;
    output          EMACCLIENTRXGOODFRAME;
    output          EMACCLIENTRXBADFRAME;
    output          EMACCLIENTRXFRAMEDROP;
    output   [6:0]  EMACCLIENTRXSTATS;
    output          EMACCLIENTRXSTATSVLD;
    output          EMACCLIENTRXSTATSBYTEVLD;

    // Client Transmitter Interface
    output          EMACCLIENTTXCLIENTCLKOUT;
    input           CLIENTEMACTXCLIENTCLKIN;
    input    [7:0]  CLIENTEMACTXD;
    input           CLIENTEMACTXDVLD;
    input           CLIENTEMACTXDVLDMSW;
    output          EMACCLIENTTXACK;
    input           CLIENTEMACTXFIRSTBYTE;
    input           CLIENTEMACTXUNDERRUN;
    output          EMACCLIENTTXCOLLISION;
    output          EMACCLIENTTXRETRANSMIT;
    input    [7:0]  CLIENTEMACTXIFGDELAY;
    output          EMACCLIENTTXSTATS;
    output          EMACCLIENTTXSTATSVLD;
    output          EMACCLIENTTXSTATSBYTEVLD;

    // MAC Control Interface
    input           CLIENTEMACPAUSEREQ;
    input   [15:0]  CLIENTEMACPAUSEVAL;

    // Clock Signals
    input           GTX_CLK;
    output          EMACPHYTXGMIIMIICLKOUT;
    input           PHYEMACTXGMIIMIICLKIN;

    // GMII Interface
    output   [7:0]  GMII_TXD;
    output          GMII_TX_EN;
    output          GMII_TX_ER;
    input    [7:0]  GMII_RXD;
    input           GMII_RX_DV;
    input           GMII_RX_ER;
    input           GMII_RX_CLK;

    // MMCM Lock Indicator
    input           MMCM_LOCKED;

    // Asynchronous Reset
    input           RESET;


    //--------------------------------------------------------------------------
    // Wire declarations
    //--------------------------------------------------------------------------

    wire    [15:0]  client_rx_data_i;
    wire    [15:0]  client_tx_data_i;

    //--------------------------------------------------------------------------
    // Main body of code
    //--------------------------------------------------------------------------

    // Use the 8-bit client data interface
    assign EMACCLIENTRXD = client_rx_data_i[7:0];
    assign #4000 client_tx_data_i = {8'b00000000, CLIENTEMACTXD};

    // Instantiate the Virtex-6 Embedded Tri-Mode Ethernet MAC
    TEMAC_SINGLE #(
    // PCS/PMA logic is not in use
       .EMAC_PHYINITAUTONEG_ENABLE         ("FALSE"),
       .EMAC_PHYISOLATE                    ("FALSE"),
       .EMAC_PHYLOOPBACKMSB                ("FALSE"),
       .EMAC_PHYPOWERDOWN                  ("FALSE"),
       .EMAC_PHYRESET                      ("TRUE"),
       .EMAC_GTLOOPBACK                    ("FALSE"),
       .EMAC_UNIDIRECTION_ENABLE           ("FALSE"),
       .EMAC_LINKTIMERVAL                  (9'h000),
       .EMAC_MDIO_IGNORE_PHYADZERO         ("FALSE"),
    // Configure the EMAC operating mode
    // MDIO is not enabled
       .EMAC_MDIO_ENABLE                   ("FALSE"),
    // Speed is defaulted to 1000 Mb/s
       .EMAC_SPEED_LSB                     ("FALSE"),
       .EMAC_SPEED_MSB                     ("TRUE"),
    // Clock Enable advanced clocking is not in use
       .EMAC_USECLKEN                      ("FALSE"),
    // Byte PHY advanced clocking is not supported. Do not modify.
       .EMAC_BYTEPHY                       ("FALSE"),
    // RGMII physical interface is not in use
       .EMAC_RGMII_ENABLE                  ("FALSE"),
    // SGMII physical interface is not in use
       .EMAC_SGMII_ENABLE                  ("FALSE"),
       .EMAC_1000BASEX_ENABLE              ("FALSE"),
    // The host interface is not enabled
       .EMAC_HOST_ENABLE                   ("FALSE"),
    // The Tx-side 8-bit client data interface is used
       .EMAC_TX16BITCLIENT_ENABLE          ("FALSE"),
    // The Rx-side 8-bit client data interface is used
       .EMAC_RX16BITCLIENT_ENABLE          ("FALSE"),
    // The address filter is not enabled
       .EMAC_ADDRFILTER_ENABLE             ("FALSE"),

    // EMAC configuration defaults
    // Rx Length/Type checking is enabled
       .EMAC_LTCHECK_DISABLE               ("FALSE"),
    // Rx control frame length checking is enabled
       .EMAC_CTRLLENCHECK_DISABLE          ("FALSE"),
    // Rx flow control is not enabled
       .EMAC_RXFLOWCTRL_ENABLE             ("FALSE"),
    // Tx flow control is not enabled
       .EMAC_TXFLOWCTRL_ENABLE             ("FALSE"),
    // Transmitter is not held in reset
       .EMAC_TXRESET                       ("FALSE"),
    // Transmitter Jumbo frames are not enabled
       .EMAC_TXJUMBOFRAME_ENABLE           ("FALSE"),
    // Transmitter in-band FCS is not enabled
       .EMAC_TXINBANDFCS_ENABLE            ("FALSE"),
    // Transmitter is enabled
       .EMAC_TX_ENABLE                     ("TRUE"),
    // Transmitter VLAN frames are not enabled
       .EMAC_TXVLAN_ENABLE                 ("FALSE"),
    // Transmitter full-duplex mode is enabled
       .EMAC_TXHALFDUPLEX                  ("FALSE"),
    // Transmitter IFG Adjust is not enabled
       .EMAC_TXIFGADJUST_ENABLE            ("FALSE"),
    // Receiver is not held in reset
       .EMAC_RXRESET                       ("FALSE"),
    // Receiver Jumbo frames are not enabled
       .EMAC_RXJUMBOFRAME_ENABLE           ("FALSE"),
    // Receiver in-band FCS is not enabled
       .EMAC_RXINBANDFCS_ENABLE            ("FALSE"),
    // Receiver is enabled
       .EMAC_RX_ENABLE                     ("TRUE"),
    // Receiver VLAN frames are not enabled
       .EMAC_RXVLAN_ENABLE                 ("FALSE"),
    // Receiver full-duplex mode is enabled
       .EMAC_RXHALFDUPLEX                  ("FALSE"),

    // Configure the EMAC addressing
    // Set the PAUSE address default
       .EMAC_PAUSEADDR                     (48'hFFEEDDCCBBAA),
    // Do not set the unicast address (address filter is unused)
       .EMAC_UNICASTADDR                   (48'h000000000000),
    // Do not set the DCR base address (DCR is unused)
       .EMAC_DCRBASEADDR                   (8'h00)
    )
    v6_emac
    (
        .RESET                    (RESET),

        .EMACCLIENTRXCLIENTCLKOUT (EMACCLIENTRXCLIENTCLKOUT),
        .CLIENTEMACRXCLIENTCLKIN  (CLIENTEMACRXCLIENTCLKIN),
        .EMACCLIENTRXD            (client_rx_data_i),
        .EMACCLIENTRXDVLD         (EMACCLIENTRXDVLD),
        .EMACCLIENTRXDVLDMSW      (EMACCLIENTRXDVLDMSW),
        .EMACCLIENTRXGOODFRAME    (EMACCLIENTRXGOODFRAME),
        .EMACCLIENTRXBADFRAME     (EMACCLIENTRXBADFRAME),
        .EMACCLIENTRXFRAMEDROP    (EMACCLIENTRXFRAMEDROP),
        .EMACCLIENTRXSTATS        (EMACCLIENTRXSTATS),
        .EMACCLIENTRXSTATSVLD     (EMACCLIENTRXSTATSVLD),
        .EMACCLIENTRXSTATSBYTEVLD (EMACCLIENTRXSTATSBYTEVLD),

        .EMACCLIENTTXCLIENTCLKOUT (EMACCLIENTTXCLIENTCLKOUT),
        .CLIENTEMACTXCLIENTCLKIN  (CLIENTEMACTXCLIENTCLKIN),
        .CLIENTEMACTXD            (client_tx_data_i),
        .CLIENTEMACTXDVLD         (CLIENTEMACTXDVLD),
        .CLIENTEMACTXDVLDMSW      (CLIENTEMACTXDVLDMSW),
        .EMACCLIENTTXACK          (EMACCLIENTTXACK),
        .CLIENTEMACTXFIRSTBYTE    (CLIENTEMACTXFIRSTBYTE),
        .CLIENTEMACTXUNDERRUN     (CLIENTEMACTXUNDERRUN),
        .EMACCLIENTTXCOLLISION    (EMACCLIENTTXCOLLISION),
        .EMACCLIENTTXRETRANSMIT   (EMACCLIENTTXRETRANSMIT),
        .CLIENTEMACTXIFGDELAY     (CLIENTEMACTXIFGDELAY),
        .EMACCLIENTTXSTATS        (EMACCLIENTTXSTATS),
        .EMACCLIENTTXSTATSVLD     (EMACCLIENTTXSTATSVLD),
        .EMACCLIENTTXSTATSBYTEVLD (EMACCLIENTTXSTATSBYTEVLD),

        .CLIENTEMACPAUSEREQ       (CLIENTEMACPAUSEREQ),
        .CLIENTEMACPAUSEVAL       (CLIENTEMACPAUSEVAL),

        .PHYEMACGTXCLK            (GTX_CLK),
        .EMACPHYTXGMIIMIICLKOUT   (EMACPHYTXGMIIMIICLKOUT),
        .PHYEMACTXGMIIMIICLKIN    (PHYEMACTXGMIIMIICLKIN),

        .PHYEMACRXCLK             (GMII_RX_CLK),
        .PHYEMACRXD               (GMII_RXD),
        .PHYEMACRXDV              (GMII_RX_DV),
        .PHYEMACRXER              (GMII_RX_ER),
        .EMACPHYTXCLK             (),
        .EMACPHYTXD               (GMII_TXD),
        .EMACPHYTXEN              (GMII_TX_EN),
        .EMACPHYTXER              (GMII_TX_ER),
        .PHYEMACMIITXCLK          (1'b0),
        .PHYEMACCOL               (1'b0),
        .PHYEMACCRS               (1'b0),

        .CLIENTEMACDCMLOCKED      (MMCM_LOCKED),
        .EMACCLIENTANINTERRUPT    (),
        .PHYEMACSIGNALDET         (1'b0),
        .PHYEMACPHYAD             (5'b00000),
        .EMACPHYENCOMMAALIGN      (),
        .EMACPHYLOOPBACKMSB       (),
        .EMACPHYMGTRXRESET        (),
        .EMACPHYMGTTXRESET        (),
        .EMACPHYPOWERDOWN         (),
        .EMACPHYSYNCACQSTATUS     (),
        .PHYEMACRXCLKCORCNT       (3'b000),
        .PHYEMACRXBUFSTATUS       (2'b00),
        .PHYEMACRXCHARISCOMMA     (1'b0),
        .PHYEMACRXCHARISK         (1'b0),
        .PHYEMACRXDISPERR         (1'b0),
        .PHYEMACRXNOTINTABLE      (1'b0),
        .PHYEMACRXRUNDISP         (1'b0),
        .PHYEMACTXBUFERR          (1'b0),
        .EMACPHYTXCHARDISPMODE    (),
        .EMACPHYTXCHARDISPVAL     (),
        .EMACPHYTXCHARISK         (),

        .EMACPHYMCLKOUT           (),
        .PHYEMACMCLKIN            (1'b0),
        .PHYEMACMDIN              (1'b1),
        .EMACPHYMDOUT             (),
        .EMACPHYMDTRI             (),

        .EMACSPEEDIS10100         (),

        .HOSTCLK                  (1'b0),
        .HOSTOPCODE               (2'b00),
        .HOSTREQ                  (1'b0),
        .HOSTMIIMSEL              (1'b0),
        .HOSTADDR                 (10'b0000000000),
        .HOSTWRDATA               (32'h00000000),
        .HOSTMIIMRDY              (),
        .HOSTRDDATA               (),

        .DCREMACCLK               (1'b0),
        .DCREMACABUS              (10'h000),
        .DCREMACREAD              (1'b0),
        .DCREMACWRITE             (1'b0),
        .DCREMACDBUS              (32'h00000000),
        .EMACDCRACK               (),
        .EMACDCRDBUS              (),
        .DCREMACENABLE            (1'b0),
        .DCRHOSTDONEIR            ()
    );

endmodule
//----------------------------------------------------------------------
// Title      : Gigabit Media Independent Interface (GMII) Physical I/F
// Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
// File       : gmii_if.v
// Version    : 1.3
//-----------------------------------------------------------------------------
// Description:  This module creates a Gigabit Media Independent
//               Interface (GMII) by instantiating Input/Output buffers
//               and Input/Output flip-flops as required.
//
//               This interface is used to connect the Ethernet MAC to
//               an external 1000Mb/s (or Tri-speed) Ethernet PHY.
//----------------------------------------------------------------------

`timescale 1 ps / 1 ps

module gmii_if (
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
  RX_CLK
);

  input        RESET;
  output [7:0] GMII_TXD;
  output       GMII_TX_EN;
  output       GMII_TX_ER;
  output       GMII_TX_CLK;
  input  [7:0] GMII_RXD;
  input        GMII_RX_DV;
  input        GMII_RX_ER;
  input  [7:0] TXD_FROM_MAC;
  input        TX_EN_FROM_MAC;
  input        TX_ER_FROM_MAC;
  input        TX_CLK;
  output [7:0] RXD_TO_MAC;
  output       RX_DV_TO_MAC;
  output       RX_ER_TO_MAC;
  input        RX_CLK;

  reg    [7:0] RXD_TO_MAC;
  reg          RX_DV_TO_MAC;
  reg          RX_ER_TO_MAC;
  reg    [7:0] GMII_TXD;
  reg          GMII_TX_EN;
  reg          GMII_TX_ER;
  wire   [7:0] GMII_RXD_DLY;
  wire         GMII_RX_DV_DLY;
  wire         GMII_RX_ER_DLY;

  //------------------------------------------------------------------------
  // GMII Transmitter Clock Management
  //------------------------------------------------------------------------
  // Instantiate a DDR output register. This is a good way to drive
  // GMII_TX_CLK since the clock-to-pad delay will be the same as that for
  // data driven from IOB Ouput flip-flops, eg. GMII_TXD[7:0].
  ODDR gmii_tx_clk_oddr (
     .Q  (GMII_TX_CLK),
     .C  (TX_CLK),
     .CE (1'b1),
     .D1 (1'b0),
     .D2 (1'b1),
     .R  (RESET),
     .S  (1'b0)
  );

  //------------------------------------------------------------------------
  // GMII Transmitter Logic : Drive TX signals through IOBs onto the
  // GMII interface
  //------------------------------------------------------------------------
  // Infer IOB Output flip-flops
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

  //------------------------------------------------------------------------
  // Route GMII inputs through IODELAY blocks, using IDELAY function
  //------------------------------------------------------------------------
  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld0 (
    .IDATAIN(GMII_RXD[0]),
    .DATAOUT(GMII_RXD_DLY[0]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

 IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld1 (
    .IDATAIN(GMII_RXD[1]),
    .DATAOUT(GMII_RXD_DLY[1]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld2 (
    .IDATAIN(GMII_RXD[2]),
    .DATAOUT(GMII_RXD_DLY[2]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld3 (
    .IDATAIN(GMII_RXD[3]),
    .DATAOUT(GMII_RXD_DLY[3]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld4 (
    .IDATAIN(GMII_RXD[4]),
    .DATAOUT(GMII_RXD_DLY[4]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld5 (
    .IDATAIN(GMII_RXD[5]),
    .DATAOUT(GMII_RXD_DLY[5]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld6 (
    .IDATAIN(GMII_RXD[6]),
    .DATAOUT(GMII_RXD_DLY[6]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideld7 (
    .IDATAIN(GMII_RXD[7]),
    .DATAOUT(GMII_RXD_DLY[7]),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
  );

  IODELAY #(
    .IDELAY_TYPE           ("FIXED"),
    .IDELAY_VALUE          (0),
    .HIGH_PERFORMANCE_MODE ("TRUE")
  )
  ideldv(
    .IDATAIN(GMII_RX_DV),
    .DATAOUT(GMII_RX_DV_DLY),
    .DATAIN(1'b0),
    .ODATAIN(1'b0),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .T(1'b0),
    .RST(1'b0)
 );

 IODELAY #(
   .IDELAY_TYPE           ("FIXED"),
   .IDELAY_VALUE          (0),
   .HIGH_PERFORMANCE_MODE ("TRUE")
 )
 ideler(
   .IDATAIN(GMII_RX_ER),
   .DATAOUT(GMII_RX_ER_DLY),
   .DATAIN(1'b0),
   .ODATAIN(1'b0),
   .C(1'b0),
   .CE(1'b0),
   .INC(1'b0),
   .T(1'b0),
   .RST(1'b0)
 );

  //------------------------------------------------------------------------
  // GMII Receiver Logic : Receive RX signals through IOBs from the
  // GMII interface
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
