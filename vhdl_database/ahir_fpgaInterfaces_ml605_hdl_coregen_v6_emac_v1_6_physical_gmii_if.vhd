------------------------------------------------------------------------
-- Title      : Gigabit Media Independent Interface (GMII) Physical I/F
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : gmii_if.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
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
--
------------------------------------------------------------------------
-- Description:  This module creates a Gigabit Media Independent
--               Interface (GMII) by instantiating Input/Output buffers
--               and Input/Output flip-flops as required.
--
--               This interface is used to connect the Ethernet MAC to
--               an external 1000Mb/s (or Tri-speed) Ethernet PHY.
------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- Entity declaration for the physical interface
------------------------------------------------------------------------------
entity gmii_if is
   port(
      RESET              : in  std_logic;
      -- GMII Interface
      GMII_TXD           : out std_logic_vector(7 downto 0);
      GMII_TX_EN         : out std_logic;
      GMII_TX_ER         : out std_logic;
      GMII_TX_CLK        : out std_logic;
      GMII_RXD           : in  std_logic_vector(7 downto 0);
      GMII_RX_DV         : in  std_logic;
      GMII_RX_ER         : in  std_logic;
      -- MAC Interface
      TXD_FROM_MAC       : in  std_logic_vector(7 downto 0);
      TX_EN_FROM_MAC     : in  std_logic;
      TX_ER_FROM_MAC     : in  std_logic;
      TX_CLK             : in  std_logic;
      RXD_TO_MAC         : out std_logic_vector(7 downto 0);
      RX_DV_TO_MAC       : out std_logic;
      RX_ER_TO_MAC       : out std_logic;
      RX_CLK             : in  std_logic);
end gmii_if;

architecture PHY_IF of gmii_if is

  signal vcc_i           : std_logic;
  signal gnd_i           : std_logic;

  signal  GMII_RXD_DLY   : std_logic_vector(7 downto 0);
  signal  GMII_RX_DV_DLY : std_logic;
  signal  GMII_RX_ER_DLY : std_logic;


begin

  vcc_i <= '1';
  gnd_i <= '0';

  --------------------------------------------------------------------------
  -- GMII Transmitter Clock Management
  --------------------------------------------------------------------------
  -- Instantiate a DDR output register.  This is a good way to drive
  -- GMII_TX_CLK since the clock-to-PAD delay will be the same as that for
  -- data driven from IOB Ouput flip-flops, eg. GMII_TXD[7:0].
  gmii_tx_clk_oddr : ODDR
  port map (
     Q => GMII_TX_CLK,
     C => TX_CLK,
     CE => vcc_i,
     D1 => gnd_i,
     D2 => vcc_i,
     R => RESET,
     S => gnd_i
  );

  --------------------------------------------------------------------------
  -- GMII Transmitter Logic : Drive TX signals through IOBs onto the
  -- GMII interface
  --------------------------------------------------------------------------
  -- Infer IOB Output flip-flops
  gmii_output_ffs : process (TX_CLK, RESET)
  begin
     if RESET = '1' then
        GMII_TX_EN <= '0';
        GMII_TX_ER <= '0';
        GMII_TXD   <= (others => '0');
     elsif TX_CLK'event and TX_CLK = '1' then
        GMII_TX_EN <= TX_EN_FROM_MAC;
        GMII_TX_ER <= TX_ER_FROM_MAC;
        GMII_TXD   <= TXD_FROM_MAC;
     end if;
  end process gmii_output_ffs;

  --------------------------------------------------------------------------
  -- Route GMII inputs through IODELAY blocks, using IDELAY function
  --------------------------------------------------------------------------
  ideld0 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(0), DATAOUT => GMII_RXD_DLY(0),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld1 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(1), DATAOUT => GMII_RXD_DLY(1),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld2 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(2), DATAOUT => GMII_RXD_DLY(2),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld3 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(3), DATAOUT => GMII_RXD_DLY(3),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld4 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(4), DATAOUT => GMII_RXD_DLY(4),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld5 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(5), DATAOUT => GMII_RXD_DLY(5),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld6 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(6), DATAOUT => GMII_RXD_DLY(6),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideld7 : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RXD(7), DATAOUT => GMII_RXD_DLY(7),
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideldv : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RX_DV, DATAOUT => GMII_RX_DV_DLY,
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  ideler : IODELAY generic map (
    IDELAY_TYPE           => "FIXED",
    IDELAY_VALUE          => 0,
    HIGH_PERFORMANCE_MODE => TRUE
    )
    port map(IDATAIN => GMII_RX_ER, DATAOUT => GMII_RX_ER_DLY,
             DATAIN => '0', ODATAIN => '0', C => '0', CE => '0',
             INC => '0', T => '0', RST => '0');

  --------------------------------------------------------------------------
  -- GMII Receiver Logic : Receive RX signals through IOBs from the
  -- GMII interface
  --------------------------------------------------------------------------
  -- Infer IOB Input flip-flops
  gmii_input_ffs : process (RX_CLK, RESET)
  begin
     if RESET = '1' then
        RX_DV_TO_MAC <= '0';
        RX_ER_TO_MAC <= '0';
        RXD_TO_MAC   <= (others => '0');
     elsif RX_CLK'event and RX_CLK = '1' then
        RX_DV_TO_MAC <= GMII_RX_DV_DLY;
        RX_ER_TO_MAC <= GMII_RX_ER_DLY;
        RXD_TO_MAC   <= GMII_RXD_DLY;
     end if;
  end process gmii_input_ffs;

end PHY_IF;
