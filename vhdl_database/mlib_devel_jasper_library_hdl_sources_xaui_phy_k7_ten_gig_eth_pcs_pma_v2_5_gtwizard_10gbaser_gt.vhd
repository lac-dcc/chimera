-- (c) Copyright 2009 - 2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and 
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--***************************** Entity Declaration ****************************

entity ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser_GT is
generic
(
    -- Simulation attributes
    GT_SIM_GTRESET_SPEEDUP    : string     :=  "false";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN         : bit_vector :=   X"3008E56A";
    PMA_RSV_IN                : bit_vector :=   X"00000000";
    PCS_RSVD_ATTR_IN          : bit_vector :=   X"000000000000";
    SIM_VERSION               : string     := "4.0" 
);
port 
(
    ---------------------------------- Channel ---------------------------------
    QPLLCLK_IN                              : in   std_logic;
    QPLLREFCLK_IN                           : in   std_logic;
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    DRPADDR_IN                              : in   std_logic_vector(8 downto 0);
    DRPCLK_IN                               : in   std_logic;
    DRPDI_IN                                : in   std_logic_vector(15 downto 0);
    DRPDO_OUT                               : out  std_logic_vector(15 downto 0);
    DRPEN_IN                                : in   std_logic;
    DRPRDY_OUT                              : out  std_logic;
    DRPWE_IN                                : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    EYESCANDATAERROR_OUT                    : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    LOOPBACK_IN                             : in   std_logic_vector(2 downto 0);
    ------------------------------- Receive Ports ------------------------------
    RXUSERRDY_IN                            : in   std_logic;
    -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
    RXDATAVALID_OUT                         : out  std_logic;
    RXGEARBOXSLIP_IN                        : in   std_logic;
    RXHEADER_OUT                            : out  std_logic_vector(1 downto 0);
    RXHEADERVALID_OUT                       : out  std_logic;
    ----------------------- Receive Ports - PRBS Detection ---------------------
    RXPRBSCNTRESET_IN                       : in   std_logic;
    RXPRBSERR_OUT                           : out  std_logic;
    RXPRBSSEL_IN                            : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GTRXRESET_IN                            : in   std_logic;
    RXDATA_OUT                              : out  std_logic_vector(31 downto 0);
    RXOUTCLK_OUT                            : out  std_logic;
    RXPCSRESET_IN                           : in   std_logic;
    RXUSRCLK_IN                             : in   std_logic;
    RXUSRCLK2_IN                            : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GTXRXN_IN                               : in   std_logic;
    GTXRXP_IN                               : in   std_logic;
    RXCDRLOCK_OUT                           : out  std_logic;
    RXELECIDLE_OUT                          : out  std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    RXBUFRESET_IN                           : in   std_logic;
    RXBUFSTATUS_OUT                         : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX Equalizer ----------------------
    RXLPMEN_IN                              : in   std_logic;
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    RXRESETDONE_OUT                         : out  std_logic;
    ------------------------------- Transmit Ports -----------------------------
    TXUSERRDY_IN                            : in   std_logic;
    -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    TXHEADER_IN                             : in   std_logic_vector(1 downto 0);
    TXSEQUENCE_IN                           : in   std_logic_vector(6 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GTTXRESET_IN                            : in   std_logic;
    TXDATA_IN                               : in   std_logic_vector(31 downto 0);
    TXOUTCLK_OUT                            : out  std_logic;
    TXOUTCLKFABRIC_OUT                      : out  std_logic;
    TXOUTCLKPCS_OUT                         : out  std_logic;
    TXPCSRESET_IN                           : in   std_logic;
    TXUSRCLK_IN                             : in   std_logic;
    TXUSRCLK2_IN                            : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GTXTXN_OUT                              : out  std_logic;
    GTXTXP_OUT                              : out  std_logic;
    TXINHIBIT_IN                            : in   std_logic;
    TXPRECURSOR_IN                          : in   std_logic_vector(4 downto 0);
    TXPOSTCURSOR_IN                         : in   std_logic_vector(4 downto 0);
    TXMAINCURSOR_IN                         : in   std_logic_vector(6 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    TXRESETDONE_OUT                         : out  std_logic;
    --------------------- Transmit Ports - TX PRBS Generator -------------------
    TXPRBSSEL_IN                            : in   std_logic_vector(2 downto 0)


);


end ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser_GT;

architecture RTL of ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser_GT is
    
--**************************** Signal Declarations ****************************

    -- ground and tied_to_vcc_i signals
    signal  tied_to_ground_i                :   std_logic;
    signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   :   std_logic;



    -- RX Datapath signals
    signal rxdata_i                         :   std_logic_vector(63 downto 0);      
    signal rxchariscomma_float_i            :   std_logic_vector(5 downto 0);
    signal rxcharisk_float_i                :   std_logic_vector(5 downto 0);
    signal rxdisperr_float_i                :   std_logic_vector(5 downto 0);
    signal rxnotintable_float_i             :   std_logic_vector(5 downto 0);
    signal rxrundisp_float_i                :   std_logic_vector(5 downto 0);
    signal rxheader_float_i                 :   std_logic;
    


    -- TX Datapath signals
    signal txdata_i                         :   std_logic_vector(63 downto 0);
    signal txkerr_float_i                   :   std_logic_vector(5 downto 0);
    signal txrundisp_float_i                :   std_logic_vector(5 downto 0);


--******************************** Main Body of Code***************************
                       
begin                      

    ---------------------------  Static signal Assignments ---------------------   

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';

    -------------------  GT Datapath byte mapping  -----------------

    --The GT deserializes the rightmost parallel bit (LSb) first
    RXDATA_OUT    <=   rxdata_i(31 downto 0);


    --The GT serializes the rightmost parallel bit (LSb) first
    txdata_i <=   (tied_to_ground_vec_i(31 downto 0) & TXDATA_IN); 



    ----------------------------- GTXE2 Instance  --------------------------   

    gtxe2_i :GTXE2_CHANNEL
    generic map
    (

        --_______________________ Simulation-Only Attributes ___________________

        SIM_RECEIVER_DETECT_PASS   =>      ("TRUE"),
        SIM_RESET_SPEEDUP          =>      (GT_SIM_GTRESET_SPEEDUP),
        SIM_TX_EIDLE_DRIVE_LEVEL   =>      ("X"),
        SIM_CPLLREFCLK_SEL         =>      ("001"),
        SIM_VERSION                =>      (SIM_VERSION), 
        

       ------------------RX Byte and Word Alignment Attributes---------------
        ALIGN_COMMA_DOUBLE                      =>     ("FALSE"),
        ALIGN_COMMA_ENABLE                      =>     ("1111111111"),
        ALIGN_COMMA_WORD                        =>     (1),
        ALIGN_MCOMMA_DET                        =>     ("FALSE"),
        ALIGN_MCOMMA_VALUE                      =>     ("1010000011"),
        ALIGN_PCOMMA_DET                        =>     ("FALSE"),
        ALIGN_PCOMMA_VALUE                      =>     ("0101111100"),
        SHOW_REALIGN_COMMA                      =>     ("TRUE"),
        RXSLIDE_AUTO_WAIT                       =>     (7),
        RXSLIDE_MODE                            =>     ("OFF"),
        RX_SIG_VALID_DLY                        =>     (10),

       ------------------RX 8B/10B Decoder Attributes---------------
        RX_DISPERR_SEQ_MATCH                    =>     ("TRUE"),
        DEC_MCOMMA_DETECT                       =>     ("FALSE"),
        DEC_PCOMMA_DETECT                       =>     ("FALSE"),
        DEC_VALID_COMMA_ONLY                    =>     ("FALSE"),

       ------------------------RX Clock Correction Attributes----------------------
        CBCC_DATA_SOURCE_SEL                    =>     ("DECODED"),
        CLK_COR_SEQ_2_USE                       =>     ("FALSE"),
        CLK_COR_KEEP_IDLE                       =>     ("FALSE"),
        CLK_COR_MAX_LAT                         =>     (19),
        CLK_COR_MIN_LAT                         =>     (15),
        CLK_COR_PRECEDENCE                      =>     ("TRUE"),
        CLK_COR_REPEAT_WAIT                     =>     (0),
        CLK_COR_SEQ_LEN                         =>     (1),
        CLK_COR_SEQ_1_ENABLE                    =>     ("1111"),
        CLK_COR_SEQ_1_1                         =>     ("0000000000"),
        CLK_COR_SEQ_1_2                         =>     ("0000000000"),
        CLK_COR_SEQ_1_3                         =>     ("0000000000"),
        CLK_COR_SEQ_1_4                         =>     ("0000000000"),
        CLK_CORRECT_USE                         =>     ("FALSE"),
        CLK_COR_SEQ_2_ENABLE                    =>     ("1111"),
        CLK_COR_SEQ_2_1                         =>     ("0000000000"),
        CLK_COR_SEQ_2_2                         =>     ("0000000000"),
        CLK_COR_SEQ_2_3                         =>     ("0000000000"),
        CLK_COR_SEQ_2_4                         =>     ("0000000000"),

       ------------------------RX Channel Bonding Attributes----------------------
        CHAN_BOND_KEEP_ALIGN                    =>     ("FALSE"),
        CHAN_BOND_MAX_SKEW                      =>     (1),
        CHAN_BOND_SEQ_LEN                       =>     (1),
        CHAN_BOND_SEQ_1_1                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_2                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_3                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_4                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_ENABLE                  =>     ("1111"),
        CHAN_BOND_SEQ_2_1                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_2                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_3                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_4                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_ENABLE                  =>     ("1111"),
        CHAN_BOND_SEQ_2_USE                     =>     ("FALSE"),
        FTS_DESKEW_SEQ_ENABLE                   =>     ("1111"),
        FTS_LANE_DESKEW_CFG                     =>     ("1111"),
        FTS_LANE_DESKEW_EN                      =>     ("FALSE"),

       ---------------------------RX Margin Analysis Attributes----------------------------
        ES_CONTROL                              =>     ("000000"),
        ES_ERRDET_EN                            =>     ("FALSE"),
        ES_EYE_SCAN_EN                          =>     ("TRUE"),
        ES_HORZ_OFFSET                          =>     (x"000"),
        ES_PMA_CFG                              =>     ("0000000000"),
        ES_PRESCALE                             =>     ("00000"),
        ES_QUALIFIER                            =>     (x"00000000000000000000"),
        ES_QUAL_MASK                            =>     (x"00000000000000000000"),
        ES_SDATA_MASK                           =>     (x"00000000000000000000"),
        ES_VERT_OFFSET                          =>     ("000000000"),

       -------------------------FPGA RX Interface Attributes-------------------------
        RX_DATA_WIDTH                           =>     (32),

       ---------------------------PMA Attributes----------------------------
        OUTREFCLK_SEL_INV                       =>     ("11"),
        PMA_RSV                                 =>     (PMA_RSV_IN),
        PMA_RSV2                                =>     (x"2050"),
        PMA_RSV3                                =>     ("00"),
        PMA_RSV4                                =>     (x"00000000"),
        RX_BIAS_CFG                             =>     ("000000000100"),
        DMONITOR_CFG                            =>     (x"000A00"),
        RX_CM_SEL                               =>     ("11"),
        RX_CM_TRIM                              =>     ("010"),
        RX_DEBUG_CFG                            =>     ("000000000000"),
        RX_OS_CFG                               =>     ("0000010000000"),
        TERM_RCAL_CFG                           =>     ("10000"),
        TERM_RCAL_OVRD                          =>     ('0'),
        TST_RSV                                 =>     (x"00000000"),
        RX_CLK25_DIV                            =>     (7),
        TX_CLK25_DIV                            =>     (7),
        UCODEER_CLR                             =>     ('0'),

       ---------------------------PCI Express Attributes----------------------------
        PCS_PCIE_EN                             =>     ("FALSE"),

       ---------------------------PCS Attributes----------------------------
        PCS_RSVD_ATTR                           =>     (PCS_RSVD_ATTR_IN),

       -------------RX Buffer Attributes------------
        RXBUF_ADDR_MODE                         =>     ("FAST"),
        RXBUF_EIDLE_HI_CNT                      =>     ("1000"),
        RXBUF_EIDLE_LO_CNT                      =>     ("0000"),
        RXBUF_EN                                =>     ("TRUE"),
        RX_BUFFER_CFG                           =>     ("000000"),
        RXBUF_RESET_ON_CB_CHANGE                =>     ("TRUE"),
        RXBUF_RESET_ON_COMMAALIGN               =>     ("FALSE"),
        RXBUF_RESET_ON_EIDLE                    =>     ("FALSE"),
        RXBUF_RESET_ON_RATE_CHANGE              =>     ("TRUE"),
        RXBUFRESET_TIME                         =>     ("00001"),
        RXBUF_THRESH_OVFLW                      =>     (61),
        RXBUF_THRESH_OVRD                       =>     ("FALSE"),
        RXBUF_THRESH_UNDFLW                     =>     (4),
        RXDLY_CFG                               =>     (x"001F"),
        RXDLY_LCFG                              =>     (x"030"),
        RXDLY_TAP_CFG                           =>     (x"0000"),
        RXPH_CFG                                =>     (x"000000"),
        RXPHDLY_CFG                             =>     (x"084020"),
        RXPH_MONITOR_SEL                        =>     ("00000"),
        RX_XCLK_SEL                             =>     ("RXREC"),
        RX_DDI_SEL                              =>     ("000000"),
        RX_DEFER_RESET_BUF_EN                   =>     ("TRUE"),

       -----------------------CDR Attributes-------------------------
        RXCDR_CFG                               =>     (x"0b000023ff10400020"),
        RXCDR_FR_RESET_ON_EIDLE                 =>     ('0'),
        RXCDR_HOLD_DURING_EIDLE                 =>     ('0'),
        RXCDR_PH_RESET_ON_EIDLE                 =>     ('0'),
        RXCDR_LOCK_CFG                          =>     ("010101"),

       -------------------RX Initialization and Reset Attributes-------------------
        RXCDRFREQRESET_TIME                     =>     ("00001"),
        RXCDRPHRESET_TIME                       =>     ("00001"),
        RXISCANRESET_TIME                       =>     ("00001"),
        RXPCSRESET_TIME                         =>     ("00001"),
        RXPMARESET_TIME                         =>     ("00011"),

       -------------------RX OOB Signaling Attributes-------------------
        RXOOB_CFG                               =>     ("0000110"),

       -------------------------RX Gearbox Attributes---------------------------
        RXGEARBOX_EN                            =>     ("TRUE"),
        GEARBOX_MODE                            =>     ("001"),

       -------------------------PRBS Detection Attribute-----------------------
        RXPRBS_ERR_LOOPBACK                     =>     ('0'),

       -------------Power-Down Attributes----------
        PD_TRANS_TIME_FROM_P2                   =>     (x"03c"),
        PD_TRANS_TIME_NONE_P2                   =>     (x"19"),
        PD_TRANS_TIME_TO_P2                     =>     (x"64"),

       -------------RX OOB Signaling Attributes----------
        SAS_MAX_COM                             =>     (64),
        SAS_MIN_COM                             =>     (36),
        SATA_BURST_SEQ_LEN                      =>     ("1111"),
        SATA_BURST_VAL                          =>     ("100"),
        SATA_EIDLE_VAL                          =>     ("100"),
        SATA_MAX_BURST                          =>     (8),
        SATA_MAX_INIT                           =>     (21),
        SATA_MAX_WAKE                           =>     (7),
        SATA_MIN_BURST                          =>     (4),
        SATA_MIN_INIT                           =>     (12),
        SATA_MIN_WAKE                           =>     (4),

       -------------RX Fabric Clock Output Control Attributes----------
        TRANS_TIME_RATE                         =>     (x"0E"),

       --------------TX Buffer Attributes----------------
        TXBUF_EN                                =>     ("TRUE"),
        TXBUF_RESET_ON_RATE_CHANGE              =>     ("TRUE"),
        TXDLY_CFG                               =>     (x"001F"),
        TXDLY_LCFG                              =>     (x"030"),
        TXDLY_TAP_CFG                           =>     (x"0000"),
        TXPH_CFG                                =>     (x"0780"),
        TXPHDLY_CFG                             =>     (x"084020"),
        TXPH_MONITOR_SEL                        =>     ("00000"),
        TX_XCLK_SEL                             =>     ("TXOUT"),

       -------------------------FPGA TX Interface Attributes-------------------------
        TX_DATA_WIDTH                           =>     (32),

       -------------------------TX Configurable Driver Attributes-------------------------
        TX_DEEMPH0                              =>     ("00000"),
        TX_DEEMPH1                              =>     ("00000"),
        TX_EIDLE_ASSERT_DELAY                   =>     ("110"),
        TX_EIDLE_DEASSERT_DELAY                 =>     ("100"),
        TX_LOOPBACK_DRIVE_HIZ                   =>     ("FALSE"),
        TX_MAINCURSOR_SEL                       =>     ('0'),
        TX_DRIVE_MODE                           =>     ("DIRECT"),
        TX_MARGIN_FULL_0                        =>     ("1001110"),
        TX_MARGIN_FULL_1                        =>     ("1001001"),
        TX_MARGIN_FULL_2                        =>     ("1000101"),
        TX_MARGIN_FULL_3                        =>     ("1000010"),
        TX_MARGIN_FULL_4                        =>     ("1000000"),
        TX_MARGIN_LOW_0                         =>     ("1000110"),
        TX_MARGIN_LOW_1                         =>     ("1000100"),
        TX_MARGIN_LOW_2                         =>     ("1000010"),
        TX_MARGIN_LOW_3                         =>     ("1000000"),
        TX_MARGIN_LOW_4                         =>     ("1000000"),

       -------------------------TX Gearbox Attributes--------------------------
        TXGEARBOX_EN                            =>     ("TRUE"),

       -------------------------TX Initialization and Reset Attributes--------------------------
        TXPCSRESET_TIME                         =>     ("00001"),
        TXPMARESET_TIME                         =>     ("00001"),

       -------------------------TX Receiver Detection Attributes--------------------------
        TX_RXDETECT_CFG                         =>     (x"1832"),
        TX_RXDETECT_REF                         =>     ("100"),

       ----------------------------CPLL Attributes----------------------------
        CPLL_CFG                                =>     (x"BC07DC"),
        CPLL_FBDIV                              =>     (4),
        CPLL_FBDIV_45                           =>     (5),
        CPLL_INIT_CFG                           =>     (x"00001E"),
        CPLL_LOCK_CFG                           =>     (x"01E8"),
        CPLL_REFCLK_DIV                         =>     (1),
        RXOUT_DIV                               =>     (1),
        TXOUT_DIV                               =>     (1),
        SATA_CPLL_CFG                           =>     ("VCO_3000MHZ"),

       --------------RX Initialization and Reset Attributes-------------
        RXDFELPMRESET_TIME                      =>     ("0001111"),

       --------------RX Equalizer Attributes-------------
        RXLPM_HF_CFG                            =>     ("00000011110000"),
        RXLPM_LF_CFG                            =>     ("00000011110000"),
        RX_DFE_GAIN_CFG                         =>     (x"020FEA"),
        RX_DFE_H2_CFG                           =>     ("000000000000"),
        RX_DFE_H3_CFG                           =>     ("000001000000"),
        RX_DFE_H4_CFG                           =>     ("00011110000"),
        RX_DFE_H5_CFG                           =>     ("00011100000"),
        RX_DFE_KL_CFG                           =>     ("0000011111110"),
        RX_DFE_LPM_CFG                          =>     (x"0954"),
        RX_DFE_LPM_HOLD_DURING_EIDLE            =>     ('0'),
        RX_DFE_UT_CFG                           =>     ("10001111000000000"),
        RX_DFE_VP_CFG                           =>     ("00011111100000011"),

       -------------------------Power-Down Attributes-------------------------
        RX_CLKMUX_PD                            =>     ('1'),
        TX_CLKMUX_PD                            =>     ('1'),

       -------------------------FPGA RX Interface Attribute-------------------------
        RX_INT_DATAWIDTH                        =>     (1),

       -------------------------FPGA TX Interface Attribute-------------------------
        TX_INT_DATAWIDTH                        =>     (1),

       ------------------TX Configurable Driver Attributes---------------
        TX_QPI_STATUS_EN                        =>     ('0'),

       -------------------------RX Equalizer Attributes--------------------------
        RX_DFE_KL_CFG2                          =>     (RX_DFE_KL_CFG2_IN),
        RX_DFE_XYD_CFG                          =>     ("0000000000000"),

       -------------------------TX Configurable Driver Attributes--------------------------
        TX_PREDRIVER_MODE                       =>     ('0')


    )
    port map
    (
                      ---------------------------------- Channel ---------------------------------
        CFGRESET                        =>      tied_to_ground_i,
        CLKRSVD                         =>      "0000",
        DMONITOROUT                     =>      open,
        GTRESETSEL                      =>      tied_to_ground_i,
        GTRSVD                          =>      "0000000000000000",
        QPLLCLK                         =>      QPLLCLK_IN,
        QPLLREFCLK                      =>      QPLLREFCLK_IN,
        RESETOVRD                       =>      tied_to_ground_i,
        ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
        DRPADDR                         =>      DRPADDR_IN,
        DRPCLK                          =>      DRPCLK_IN,
        DRPDI                           =>      DRPDI_IN,
        DRPDO                           =>      DRPDO_OUT,
        DRPEN                           =>      DRPEN_IN,
        DRPRDY                          =>      DRPRDY_OUT,
        DRPWE                           =>      DRPWE_IN,
        ------------------------- Channel - Ref Clock Ports ------------------------
        GTGREFCLK                       =>      tied_to_ground_i,
        GTNORTHREFCLK0                  =>      tied_to_ground_i,
        GTNORTHREFCLK1                  =>      tied_to_ground_i,
        GTREFCLK0                       =>      tied_to_ground_i,
        GTREFCLK1                       =>      tied_to_ground_i,
        GTREFCLKMONITOR                 =>      open,
        GTSOUTHREFCLK0                  =>      tied_to_ground_i,
        GTSOUTHREFCLK1                  =>      tied_to_ground_i,
        -------------------------------- Channel PLL -------------------------------
        CPLLFBCLKLOST                   =>      open,
        CPLLLOCK                        =>      open,
        CPLLLOCKDETCLK                  =>      tied_to_ground_i,
        CPLLLOCKEN                      =>      tied_to_vcc_i,
        CPLLPD                          =>      tied_to_vcc_i,
        CPLLREFCLKLOST                  =>      open,
        CPLLREFCLKSEL                   =>      "001",
        CPLLRESET                       =>      tied_to_ground_i,
        ------------------------------- Eye Scan Ports -----------------------------
        EYESCANDATAERROR                =>      EYESCANDATAERROR_OUT,
        EYESCANMODE                     =>      tied_to_ground_i,
        EYESCANRESET                    =>      tied_to_ground_i,
        EYESCANTRIGGER                  =>      tied_to_ground_i,
        ------------------------ Loopback and Powerdown Ports ----------------------
        LOOPBACK                        =>      LOOPBACK_IN,
        RXPD                            =>      "00",
        TXPD                            =>      "00",
        ----------------------------- PCS Reserved Ports ---------------------------
        PCSRSVDIN                       =>      "0000000000000000",
        PCSRSVDIN2                      =>      "00000",
        PCSRSVDOUT                      =>      open,
        ----------------------------- PMA Reserved Ports ---------------------------
        PMARSVDIN                       =>      "00000",
        PMARSVDIN2                      =>      "00000",
        ------------------------------- Receive Ports ------------------------------
        RXQPIEN                         =>      tied_to_ground_i,
        RXQPISENN                       =>      open,
        RXQPISENP                       =>      open,
        RXSYSCLKSEL                     =>      "11",
        RXUSERRDY                       =>      RXUSERRDY_IN,
        -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        RXDATAVALID                     =>      RXDATAVALID_OUT,
        RXGEARBOXSLIP                   =>      RXGEARBOXSLIP_IN,
        RXHEADER(2)                     =>      rxheader_float_i,
        RXHEADER(1 downto 0)            =>      RXHEADER_OUT,
        RXHEADERVALID                   =>      RXHEADERVALID_OUT,
        RXSTARTOFSEQ                    =>      open,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
        RX8B10BEN                       =>      tied_to_ground_i,
        RXCHARISCOMMA                   =>      open,
        RXCHARISK                       =>      open,
        RXDISPERR                       =>      open,
        RXNOTINTABLE                    =>      open,
        ------------------- Receive Ports - Channel Bonding Ports ------------------
        RXCHANBONDSEQ                   =>      open,
        RXCHBONDEN                      =>      tied_to_ground_i,
        RXCHBONDI                       =>      "00000",
        RXCHBONDLEVEL                   =>      tied_to_ground_vec_i(2 downto 0),
        RXCHBONDMASTER                  =>      tied_to_ground_i,
        RXCHBONDO                       =>      open,
        RXCHBONDSLAVE                   =>      tied_to_ground_i,
        ------------------- Receive Ports - Channel Bonding Ports  -----------------
        RXCHANISALIGNED                 =>      open,
        RXCHANREALIGN                   =>      open,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        RXCLKCORCNT                     =>      open,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        RXBYTEISALIGNED                 =>      open,
        RXBYTEREALIGN                   =>      open,
        RXCOMMADET                      =>      open,
        RXCOMMADETEN                    =>      tied_to_ground_i,
        RXMCOMMAALIGNEN                 =>      tied_to_ground_i,
        RXPCOMMAALIGNEN                 =>      tied_to_ground_i,
        RXSLIDE                         =>      RXGEARBOXSLIP_IN,
        ----------------------- Receive Ports - PRBS Detection ---------------------
        RXPRBSCNTRESET                  =>      RXPRBSCNTRESET_IN,
        RXPRBSERR                       =>      RXPRBSERR_OUT,
        RXPRBSSEL                       =>      RXPRBSSEL_IN,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GTRXRESET                       =>      GTRXRESET_IN,
        RXDATA                          =>      rxdata_i,
        RXOUTCLK                        =>      RXOUTCLK_OUT,
        RXOUTCLKFABRIC                  =>      open,
        RXOUTCLKPCS                     =>      open,
        RXOUTCLKSEL                     =>      "010",
        RXPCSRESET                      =>      RXPCSRESET_IN,
        RXPMARESET                      =>      tied_to_ground_i,
        RXUSRCLK                        =>      RXUSRCLK_IN,
        RXUSRCLK2                       =>      RXUSRCLK2_IN,
        ------------ Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
        RXDFEAGCHOLD                    =>      tied_to_ground_i,
        RXDFEAGCOVRDEN                  =>      tied_to_ground_i,
        RXDFECM1EN                      =>      tied_to_ground_i,
        RXDFELFHOLD                     =>      tied_to_ground_i,
        RXDFELFOVRDEN                   =>      tied_to_vcc_i,
        RXDFELPMRESET                   =>      tied_to_ground_i,
        RXDFETAP2HOLD                   =>      tied_to_ground_i,
        RXDFETAP2OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP3HOLD                   =>      tied_to_ground_i,
        RXDFETAP3OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP4HOLD                   =>      tied_to_ground_i,
        RXDFETAP4OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP5HOLD                   =>      tied_to_ground_i,
        RXDFETAP5OVRDEN                 =>      tied_to_ground_i,
        RXDFEUTHOLD                     =>      tied_to_ground_i,
        RXDFEUTOVRDEN                   =>      tied_to_ground_i,
        RXDFEVPHOLD                     =>      tied_to_ground_i,
        RXDFEVPOVRDEN                   =>      tied_to_ground_i,
        RXDFEVSEN                       =>      tied_to_ground_i,
        RXDFEXYDEN                      =>      tied_to_ground_i,
        RXDFEXYDHOLD                    =>      tied_to_ground_i,
        RXDFEXYDOVRDEN                  =>      tied_to_ground_i,
        RXMONITOROUT                    =>      open,
        RXMONITORSEL                    =>      "00",
        RXOSHOLD                        =>      tied_to_ground_i,
        RXOSOVRDEN                      =>      tied_to_ground_i,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        GTXRXN                          =>      GTXRXN_IN,
        GTXRXP                          =>      GTXRXP_IN,
        RXCDRFREQRESET                  =>      tied_to_ground_i,
        RXCDRHOLD                       =>      tied_to_ground_i,
        RXCDRLOCK                       =>      RXCDRLOCK_OUT,
        RXCDROVRDEN                     =>      tied_to_ground_i,
        RXCDRRESET                      =>      tied_to_ground_i,
        RXCDRRESETRSV                   =>      tied_to_ground_i,
        RXELECIDLE                      =>      RXELECIDLE_OUT,
         RXELECIDLEMODE                  =>      "11",
        RXLPMHFHOLD                     =>      tied_to_ground_i,
        RXLPMHFOVRDEN                   =>      tied_to_ground_i,
        RXLPMLFHOLD                     =>      tied_to_ground_i,
        RXLPMLFKLOVRDEN                 =>      tied_to_ground_i,
        RXOOBRESET                      =>      tied_to_ground_i,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        RXBUFRESET                      =>      RXBUFRESET_IN,
        RXBUFSTATUS                     =>      RXBUFSTATUS_OUT,
        RXDDIEN                         =>      tied_to_ground_i,
        RXDLYBYPASS                     =>      tied_to_vcc_i,
        RXDLYEN                         =>      tied_to_ground_i,
        RXDLYOVRDEN                     =>      tied_to_ground_i,
        RXDLYSRESET                     =>      tied_to_ground_i,
        RXDLYSRESETDONE                 =>      open,
        RXPHALIGN                       =>      tied_to_ground_i,
        RXPHALIGNDONE                   =>      open,
        RXPHALIGNEN                     =>      tied_to_ground_i,
        RXPHDLYPD                       =>      tied_to_ground_i,
        RXPHDLYRESET                    =>      tied_to_ground_i,
        RXPHMONITOR                     =>      open,
        RXPHOVRDEN                      =>      tied_to_ground_i,
        RXPHSLIPMONITOR                 =>      open,
        RXSTATUS                        =>      open,
        ------------------------ Receive Ports - RX Equalizer ----------------------
        RXLPMEN                         =>      RXLPMEN_IN,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        RXRATE                          =>      tied_to_ground_vec_i(2 downto 0),
        RXRATEDONE                      =>      open,
        RXRESETDONE                     =>      RXRESETDONE_OUT,
        -------------- Receive Ports - RX Pipe Control for PCI Express -------------
        PHYSTATUS                       =>      open,
        RXVALID                         =>      open,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
        RXPOLARITY                      =>      tied_to_ground_i,
        --------------------- Receive Ports - RX Ports for SATA --------------------
        RXCOMINITDET                    =>      open,
        RXCOMSASDET                     =>      open,
        RXCOMWAKEDET                    =>      open,
        ------------------------------- Transmit Ports -----------------------------
        SETERRSTATUS                    =>      tied_to_ground_i,
        TSTIN                           =>      "11111111111111111111",
        TSTOUT                          =>      open,
        TXPHDLYTSTCLK                   =>      tied_to_ground_i,
        TXPOSTCURSOR                    =>      TXPOSTCURSOR_IN,
        TXPOSTCURSORINV                 =>      tied_to_ground_i,
        TXPRECURSOR                     =>      TXPRECURSOR_IN,
        TXPRECURSORINV                  =>      tied_to_ground_i,
        TXQPIBIASEN                     =>      tied_to_ground_i,
        TXQPISENN                       =>      open,
        TXQPISENP                       =>      open,
        TXQPISTRONGPDOWN                =>      tied_to_ground_i,
        TXQPIWEAKPUP                    =>      tied_to_ground_i,
        TXSYSCLKSEL                     =>      "11",
        TXUSERRDY                       =>      TXUSERRDY_IN,
        -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        TXGEARBOXREADY                  =>      open,
        TXHEADER(2)                     =>      tied_to_ground_i,
        TXHEADER(1 downto 0)            =>      TXHEADER_IN,
        TXSEQUENCE                      =>      TXSEQUENCE_IN,
        TXSTARTSEQ                      =>      tied_to_ground_i,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        TX8B10BBYPASS                   =>      tied_to_ground_vec_i(7 downto 0),
        TX8B10BEN                       =>      tied_to_ground_i,
        TXCHARDISPMODE                  =>      tied_to_ground_vec_i(7 downto 0),
        TXCHARDISPVAL                   =>      tied_to_ground_vec_i(7 downto 0),
        TXCHARISK                       =>      tied_to_ground_vec_i(7 downto 0),
        ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
        TXBUFSTATUS                     =>      open,
        TXDLYBYPASS                     =>      tied_to_vcc_i,
        TXDLYEN                         =>      tied_to_ground_i,
        TXDLYHOLD                       =>      tied_to_ground_i,
        TXDLYOVRDEN                     =>      tied_to_ground_i,
        TXDLYSRESET                     =>      tied_to_ground_i,
        TXDLYSRESETDONE                 =>      open,
        TXDLYUPDOWN                     =>      tied_to_ground_i,
        TXPHALIGN                       =>      tied_to_ground_i,
        TXPHALIGNDONE                   =>      open,
        TXPHALIGNEN                     =>      tied_to_ground_i,
        TXPHDLYPD                       =>      tied_to_ground_i,
        TXPHDLYRESET                    =>      tied_to_ground_i,
        TXPHINIT                        =>      tied_to_ground_i,
        TXPHINITDONE                    =>      open,
        TXPHOVRDEN                      =>      tied_to_ground_i,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GTTXRESET                       =>      GTTXRESET_IN,
        TXDATA                          =>      txdata_i,
        TXOUTCLK                        =>      TXOUTCLK_OUT,
        TXOUTCLKFABRIC                  =>      TXOUTCLKFABRIC_OUT,
        TXOUTCLKPCS                     =>      TXOUTCLKPCS_OUT,
        TXOUTCLKSEL                     =>      "010",
        TXPCSRESET                      =>      TXPCSRESET_IN,
        TXPMARESET                      =>      tied_to_ground_i,
        TXUSRCLK                        =>      TXUSRCLK_IN,
        TXUSRCLK2                       =>      TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GTXTXN                          =>      GTXTXN_OUT,
        GTXTXP                          =>      GTXTXP_OUT,
        TXBUFDIFFCTRL                   =>      "100",
        TXDIFFCTRL                      =>      "1110",
        TXDIFFPD                        =>      tied_to_ground_i,
        TXINHIBIT                       =>      TXINHIBIT_IN,
        TXMAINCURSOR                    =>      TXMAINCURSOR_IN,
        TXPDELECIDLEMODE                =>      tied_to_ground_i,
        TXPISOPD                        =>      tied_to_ground_i,
        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        TXRATE                          =>      tied_to_ground_vec_i(2 downto 0),
        TXRATEDONE                      =>      open,
        TXRESETDONE                     =>      TXRESETDONE_OUT,
        --------------------- Transmit Ports - TX PRBS Generator -------------------
        TXPRBSFORCEERR                  =>      tied_to_ground_i,
        TXPRBSSEL                       =>      TXPRBSSEL_IN,
        -------------------- Transmit Ports - TX Polarity Control ------------------
        TXPOLARITY                      =>      tied_to_ground_i,
        ----------------- Transmit Ports - TX Ports for PCI Express ----------------
        TXDEEMPH                        =>      tied_to_ground_i,
        TXDETECTRX                      =>      tied_to_ground_i,
        TXELECIDLE                      =>      tied_to_ground_i,
        TXMARGIN                        =>      tied_to_ground_vec_i(2 downto 0),
        TXSWING                         =>      tied_to_ground_i,
        --------------------- Transmit Ports - TX Ports for SATA -------------------
        TXCOMFINISH                     =>      open,
        TXCOMINIT                       =>      tied_to_ground_i,
        TXCOMSAS                        =>      tied_to_ground_i,
        TXCOMWAKE                       =>      tied_to_ground_i

    );
 
 end RTL;

