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
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;


--***************************** Entity Declaration ****************************

entity ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser is
generic
(
    QPLL_FBDIV_TOP                 : integer  := 66;

    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "false";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"001E7080";
    SIM_VERSION                     : string     :=  "4.0"

);
port
(
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y0)
    --____________________________CHANNEL PORTS________________________________
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT0_DRPCLK_IN                           : in   std_logic;
    GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT0_DRPEN_IN                            : in   std_logic;
    GT0_DRPRDY_OUT                          : out  std_logic;
    GT0_DRPWE_IN                            : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    GT0_EYESCANDATAERROR_OUT                : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT0_RXUSERRDY_IN                        : in   std_logic;
    -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
    GT0_RXDATAVALID_OUT                     : out  std_logic;
    GT0_RXGEARBOXSLIP_IN                    : in   std_logic;
    GT0_RXHEADER_OUT                        : out  std_logic_vector(1 downto 0);
    GT0_RXHEADERVALID_OUT                   : out  std_logic;
    ----------------------- Receive Ports - PRBS Detection ---------------------
    GT0_RXPRBSCNTRESET_IN                   : in   std_logic;
    GT0_RXPRBSERR_OUT                       : out  std_logic;
    GT0_RXPRBSSEL_IN                        : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXDATA_OUT                          : out  std_logic_vector(31 downto 0);
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    GT0_RXPCSRESET_IN                       : in   std_logic;
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT0_GTXRXN_IN                           : in   std_logic;
    GT0_GTXRXP_IN                           : in   std_logic;
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    GT0_RXELECIDLE_OUT                      : out  std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT0_RXBUFRESET_IN                       : in   std_logic;
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX Equalizer ----------------------
    GT0_RXLPMEN_IN                          : in   std_logic;
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT0_TXUSERRDY_IN                        : in   std_logic;
    -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    GT0_TXHEADER_IN                         : in   std_logic_vector(1 downto 0);
    GT0_TXSEQUENCE_IN                       : in   std_logic_vector(6 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXDATA_IN                           : in   std_logic_vector(31 downto 0);
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT0_TXPCSRESET_IN                       : in   std_logic;
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    GT0_TXINHIBIT_IN                        : in   std_logic;
    GT0_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
    GT0_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
    GT0_TXMAINCURSOR_IN                     : in   std_logic_vector(6 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT0_TXRESETDONE_OUT                     : out  std_logic;
    --------------------- Transmit Ports - TX PRBS Generator -------------------
    GT0_TXPRBSSEL_IN                        : in   std_logic_vector(2 downto 0);


    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
    GT0_GTREFCLK0_COMMON_IN                 : in   std_logic;
    ------------------------- Common Block - QPLL Ports ------------------------
    GT0_QPLLLOCK_OUT                        : out  std_logic;
    GT0_QPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_QPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_QPLLRESET_IN                        : in   std_logic


);


end ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser;
    
architecture RTL of ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser is

    attribute CORE_GENERATION_INFO : string;
    attribute CORE_GENERATION_INFO of RTL : architecture is "gtwizard_10gbaser,gtwizard_v2_3,{protocol_file=10GBASE-R}";


--***********************************Parameter Declarations********************

    constant DLY : time := 1 ns;

--***************************** Signal Declarations *****************************

    -- ground and tied_to_vcc_i signals
    signal  tied_to_ground_i                :   std_logic;
    signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   :   std_logic;
    signal   gt0_qplloutclk_i         :   std_logic;
    signal   gt0_qplloutrefclk_i      :   std_logic;

  
    signal  gt0_mgtrefclktx_i           :   std_logic_vector(1 downto 0);
    signal  gt0_mgtrefclkrx_i           :   std_logic_vector(1 downto 0);
  
 
    signal   gt0_qpllclk_i            :   std_logic;
    signal   gt0_qpllrefclk_i         :   std_logic;


--*************************** Component Declarations **************************
component ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser_GT
generic
(
    -- Simulation attributes
    GT_SIM_GTRESET_SPEEDUP       : string   := "false";
    RX_DFE_KL_CFG2_IN            : bit_vector :=   X"3010D90C";
    PMA_RSV_IN                   : bit_vector :=   X"00000000";
    PCS_RSVD_ATTR_IN             : bit_vector :=   X"000000000000";
    SIM_VERSION                  : string     := "4.0"
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
end component;



--*************************Logic to set Attribute QPLL_FB_DIV*****************************
    impure function conv_qpll_fbdiv_top (qpllfbdiv_top : in integer) return bit_vector is
    begin
       if (qpllfbdiv_top = 16) then
         return "0000100000";
       elsif (qpllfbdiv_top = 20) then
         return "0000110000" ;
       elsif (qpllfbdiv_top = 32) then
         return "0001100000" ;
       elsif (qpllfbdiv_top = 40) then
         return "0010000000" ;
       elsif (qpllfbdiv_top = 64) then
         return "0011100000" ;
       elsif (qpllfbdiv_top = 66) then
         return "0101000000" ;
       elsif (qpllfbdiv_top = 80) then
         return "0100100000" ;
       elsif (qpllfbdiv_top = 100) then
         return "0101110000" ;
       else 
         return "0000000000" ;
       end if;
    end function;

    impure function conv_qpll_fbdiv_ratio (qpllfbdiv_top : in integer) return bit is
    begin
       if (qpllfbdiv_top = 16) then
         return '1';
       elsif (qpllfbdiv_top = 20) then
         return '1' ;
       elsif (qpllfbdiv_top = 32) then
         return '1' ;
       elsif (qpllfbdiv_top = 40) then
         return '1' ;
       elsif (qpllfbdiv_top = 64) then
         return '1' ;
       elsif (qpllfbdiv_top = 66) then
         return '0' ;
       elsif (qpllfbdiv_top = 80) then
         return '1' ;
       elsif (qpllfbdiv_top = 100) then
         return '1' ;
       else 
         return '1' ;
       end if;
    end function;

    constant   QPLL_FBDIV_IN    :   bit_vector(9 downto 0) := conv_qpll_fbdiv_top(QPLL_FBDIV_TOP);
    constant   QPLL_FBDIV_RATIO :   bit := conv_qpll_fbdiv_ratio(QPLL_FBDIV_TOP);

    constant sBIAS_CFG : bit_vector(63 downto 0) := X"0000040000001000";
    constant sCOMMON_CFG : bit_vector(31 downto 0) := X"00000000";
    constant sQPLL_CFG : bit_vector(26 downto 0) := "000" & X"680181";
    constant sQPLL_INIT_CFG : bit_vector(23 downto 0) := X"000006";
    constant sQPLL_LOCK_CFG : bit_vector(15 downto 0) := X"21E8";

--********************************* Main Body of Code**************************

begin                       

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';
    gt0_qpllclk_i    <= gt0_qplloutclk_i;  
    gt0_qpllrefclk_i <= gt0_qplloutrefclk_i; 

    --------------------------- GT Instances  -------------------------------   

    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y0)

    gt0_gtwizard_10gbaser_i : ten_gig_eth_pcs_pma_v2_5_gtwizard_10gbaser_GT
    generic map
    (
        -- Simulation attributes
        GT_SIM_GTRESET_SPEEDUP        =>  WRAPPER_SIM_GTRESET_SPEEDUP,
        RX_DFE_KL_CFG2_IN             =>  RX_DFE_KL_CFG2_IN,
        PMA_RSV_IN                    =>  PMA_RSV_IN,
        PCS_RSVD_ATTR_IN              =>  X"000000000000",
        SIM_VERSION                   =>  SIM_VERSION    
    )
    port map
    (
        ---------------------------------- Channel ---------------------------------
        QPLLCLK_IN                      =>      gt0_qpllclk_i,
        QPLLREFCLK_IN                   =>      gt0_qpllrefclk_i,
        ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
        DRPADDR_IN                      =>      GT0_DRPADDR_IN,
        DRPCLK_IN                       =>      GT0_DRPCLK_IN,
        DRPDI_IN                        =>      GT0_DRPDI_IN,
        DRPDO_OUT                       =>      GT0_DRPDO_OUT,
        DRPEN_IN                        =>      GT0_DRPEN_IN,
        DRPRDY_OUT                      =>      GT0_DRPRDY_OUT,
        DRPWE_IN                        =>      GT0_DRPWE_IN,
        ------------------------------- Eye Scan Ports -----------------------------
        EYESCANDATAERROR_OUT            =>      GT0_EYESCANDATAERROR_OUT,
        ------------------------ Loopback and Powerdown Ports ----------------------
        LOOPBACK_IN                     =>      GT0_LOOPBACK_IN,
        ------------------------------- Receive Ports ------------------------------
        RXUSERRDY_IN                    =>      GT0_RXUSERRDY_IN,
        -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        RXDATAVALID_OUT                 =>      GT0_RXDATAVALID_OUT,
        RXGEARBOXSLIP_IN                =>      GT0_RXGEARBOXSLIP_IN,
        RXHEADER_OUT                    =>      GT0_RXHEADER_OUT,
        RXHEADERVALID_OUT               =>      GT0_RXHEADERVALID_OUT,
        ----------------------- Receive Ports - PRBS Detection ---------------------
        RXPRBSCNTRESET_IN               =>      GT0_RXPRBSCNTRESET_IN,
        RXPRBSERR_OUT                   =>      GT0_RXPRBSERR_OUT,
        RXPRBSSEL_IN                    =>      GT0_RXPRBSSEL_IN,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GTRXRESET_IN                    =>      GT0_GTRXRESET_IN,
        RXDATA_OUT                      =>      GT0_RXDATA_OUT,
        RXOUTCLK_OUT                    =>      GT0_RXOUTCLK_OUT,
        RXPCSRESET_IN                   =>      GT0_RXPCSRESET_IN,
        RXUSRCLK_IN                     =>      GT0_RXUSRCLK_IN,
        RXUSRCLK2_IN                    =>      GT0_RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        GTXRXN_IN                       =>      GT0_GTXRXN_IN,
        GTXRXP_IN                       =>      GT0_GTXRXP_IN,
        RXCDRLOCK_OUT                   =>      GT0_RXCDRLOCK_OUT,
        RXELECIDLE_OUT                  =>      GT0_RXELECIDLE_OUT,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        RXBUFRESET_IN                   =>      GT0_RXBUFRESET_IN,
        RXBUFSTATUS_OUT                 =>      GT0_RXBUFSTATUS_OUT,
        ------------------------ Receive Ports - RX Equalizer ----------------------
        RXLPMEN_IN                      =>      GT0_RXLPMEN_IN,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        RXRESETDONE_OUT                 =>      GT0_RXRESETDONE_OUT,
        ------------------------------- Transmit Ports -----------------------------
        TXUSERRDY_IN                    =>      GT0_TXUSERRDY_IN,
        -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        TXHEADER_IN                     =>      GT0_TXHEADER_IN,
        TXSEQUENCE_IN                   =>      GT0_TXSEQUENCE_IN,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GTTXRESET_IN                    =>      GT0_GTTXRESET_IN,
        TXDATA_IN                       =>      GT0_TXDATA_IN,
        TXOUTCLK_OUT                    =>      GT0_TXOUTCLK_OUT,
        TXOUTCLKFABRIC_OUT              =>      GT0_TXOUTCLKFABRIC_OUT,
        TXOUTCLKPCS_OUT                 =>      GT0_TXOUTCLKPCS_OUT,
        TXPCSRESET_IN                   =>      GT0_TXPCSRESET_IN,
        TXUSRCLK_IN                     =>      GT0_TXUSRCLK_IN,
        TXUSRCLK2_IN                    =>      GT0_TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GTXTXN_OUT                      =>      GT0_GTXTXN_OUT,
        GTXTXP_OUT                      =>      GT0_GTXTXP_OUT,
        TXINHIBIT_IN                    =>      GT0_TXINHIBIT_IN,
        TXPRECURSOR_IN                  =>      GT0_TXPRECURSOR_IN,
        TXPOSTCURSOR_IN                 =>      GT0_TXPOSTCURSOR_IN,
        TXMAINCURSOR_IN                 =>      GT0_TXMAINCURSOR_IN,
        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        TXRESETDONE_OUT                 =>      GT0_TXRESETDONE_OUT,
        --------------------- Transmit Ports - TX PRBS Generator -------------------
        TXPRBSSEL_IN                    =>      GT0_TXPRBSSEL_IN

    );

    --_________________________________________________________________________
    --_________________________________________________________________________
    --_________________________GTXE2_COMMON____________________________________



    gtxe2_common_0_i : GTXE2_COMMON
    generic map
    (
            -- Simulation attributes
            SIM_RESET_SPEEDUP    => WRAPPER_SIM_GTRESET_SPEEDUP,
            SIM_QPLLREFCLK_SEL   => ("001"),
            SIM_VERSION          => SIM_VERSION,


       ------------------COMMON BLOCK Attributes---------------
        BIAS_CFG                                =>     (x"0000040000001000"),--("01000000000000000000000000000001000000000000"),--
        COMMON_CFG                              =>     (x"00000000"),--("00000000000000000000000000000000"),--sCOMMON_CFG,
        QPLL_CFG                                =>     (x"0680181"),--("011010000000000110000001"),--sQPLL_CFG,--X"0680181",--("0110_1000_0000_0001_1000_0001"),--(x"0680181"),
        QPLL_CLKOUT_CFG                         =>     "0000",
        QPLL_COARSE_FREQ_OVRD                   =>     "010000",
        QPLL_COARSE_FREQ_OVRD_EN                =>     '0',
        QPLL_CP                                 =>     "0000011111",
        QPLL_CP_MONITOR_EN                      =>     '0',
        QPLL_DMONITOR_SEL                       =>     '0',
        QPLL_FBDIV                              =>     QPLL_FBDIV_IN,
        QPLL_FBDIV_MONITOR_EN                   =>     '0',
        QPLL_FBDIV_RATIO                        =>     QPLL_FBDIV_RATIO,
        QPLL_INIT_CFG                           =>     (x"000006"),--("0110"),--sQPLL_INIT_CFG,--X"000006",--("0110"),--(x"000006"),
        QPLL_LOCK_CFG                           =>     (x"21E8"),--("0010000111101000"),--sQPLL_LOCK_CFG,--("0010_0001_1110_1000"),--(x"21E8"),
        QPLL_LPF                                =>     "1111",
        QPLL_REFCLK_DIV                         =>     1

        
    )
    port map
    (
        ------------- Common Block  - Dynamic Reconfiguration Port (DRP) -----------
        DRPADDR                         =>      tied_to_ground_vec_i(7 downto 0),
        DRPCLK                          =>      tied_to_ground_i,
        DRPDI                           =>      tied_to_ground_vec_i(15 downto 0),
        DRPDO                           =>      open,
        DRPEN                           =>      tied_to_ground_i,
        DRPRDY                          =>      open,
        DRPWE                           =>      tied_to_ground_i,
        ---------------------- Common Block  - Ref Clock Ports ---------------------
        GTGREFCLK                       =>      tied_to_ground_i,
        GTNORTHREFCLK0                  =>      tied_to_ground_i,
        GTNORTHREFCLK1                  =>      tied_to_ground_i,
        GTREFCLK0                       =>      GT0_GTREFCLK0_COMMON_IN,
        GTREFCLK1                       =>      tied_to_ground_i,
        GTSOUTHREFCLK0                  =>      tied_to_ground_i,
        GTSOUTHREFCLK1                  =>      tied_to_ground_i,
        ------------------------- Common Block - QPLL Ports ------------------------
        QPLLDMONITOR                    =>      open,
        QPLLFBCLKLOST                   =>      open,
        QPLLLOCK                        =>      GT0_QPLLLOCK_OUT,
        QPLLLOCKDETCLK                  =>      GT0_QPLLLOCKDETCLK_IN,
        QPLLLOCKEN                      =>      tied_to_vcc_i,
        QPLLOUTCLK                      =>      gt0_qplloutclk_i,
        QPLLOUTREFCLK                   =>      gt0_qplloutrefclk_i,
        QPLLOUTRESET                    =>      tied_to_ground_i,
        QPLLPD                          =>      tied_to_ground_i,
        QPLLREFCLKLOST                  =>      GT0_QPLLREFCLKLOST_OUT,
        QPLLREFCLKSEL                   =>      "001",
        QPLLRESET                       =>      GT0_QPLLRESET_IN,
        QPLLRSVD1                       =>      "0000000000000000",
        QPLLRSVD2                       =>      "11111",
        REFCLKOUTMONITOR                =>      open,
        ----------------------------- Common Block Ports ---------------------------
        BGBYPASSB                       =>      tied_to_vcc_i,
        BGMONITORENB                    =>      tied_to_vcc_i,
        BGPDB                           =>      tied_to_vcc_i,
        BGRCALOVRD                      =>      "00000",
        PMARSVD                         =>      "00000000",
        RCALENB                         =>      tied_to_vcc_i

    );


     
end RTL;
