-------------------------------------------------------------------------------
-- Title      : Example Design level wrapper
-- Project    : 10GBASE-R
-------------------------------------------------------------------------------
-- File       : ten_gig_eth_pcs_pma_v2_5_example_design.vhd
-------------------------------------------------------------------------------
-- Description: This file is a wrapper for the 10GBASE-R core; it contains all 
-- of the clock buffers required for implementing the block level
-------------------------------------------------------------------------------
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

entity ten_gig_eth_pcs_pma_v2_5_example_design is
    port (
      -- refclk_p         : in  std_logic;
      -- refclk_n         : in  std_logic;
      REF_CLK_IN       : in  std_logic;  -- 156.25 MHz MGT_REF_CLK in (after LVDS Buffer)
      core_clk156_out  : out std_logic;  -- xaui_clk
      reset            : in  std_logic;  -- sys_rst
      xgmii_txd        : in  std_logic_vector(63 downto 0);  -- BUS = XGMII
      xgmii_txc        : in  std_logic_vector(7 downto 0);   -- BUS = XGMII
      xgmii_rxd        : out std_logic_vector(63 downto 0);  -- BUS = XGMII
      xgmii_rxc        : out std_logic_vector(7 downto 0);   -- BUS = XGMII
      xgmii_rx_clk     : out std_logic;   -- No Connect for now   
      txp              : out std_logic;   -- BUS = XAUI_SYS
      txn              : out std_logic;   -- BUS = XAUI_SYS
      rxp              : in  std_logic;   -- BUS = XAUI_SYS   
      rxn              : in  std_logic;   -- BUS = XAUI_SYS
      mdc              : in  std_logic;   -- No Connect for now
      mdio_in          : in  std_logic;   -- No Connect for now
      mdio_out         : out std_logic;   -- No Connect for now
      mdio_tri         : out std_logic;   -- No Connect for now
      prtad            : in  std_logic_vector(4 downto 0);   -- No Connect for now
      core_status      : out std_logic_vector(7 downto 0);   -- BUS = XAUI_CONF
      -- [7:6] BASE-KR Reserved,  
      -- 5 Auto Negotiation link_up
      -- 4 Auto Negotiation Enable
      -- 3 Auto Negotiation Complete
      -- 2 Training Done
      -- 1 FEC OK
      -- 0 PCS Block Lock

      -- .phy_rx_up (xaui_status[6:2] == 5'b11111)
      -- xaui_status [7..0]
      -- 0 TX Local Fault
      -- 1 RX Local Fault
      -- 2 XAUI lane 0 Sync
      -- 3 XAUI lane 1 Sync
      -- 4 XAUI lane 2 Sync
      -- 5 XAUI lane 3 Sync
      -- 6 XAUI lanes aligned
      -- 7 RX Link status (0 = link down)

      -- So for hack xaui_status vs core_status:
      -- xaui_status[0] - not PCS Block Lock [0]
      -- xaui_status[1] - not PCS Block Lock [0] 
      -- xaui_status[7..2] <= 6'b11111, when corestatus [5..0] = 6'b111111

      resetdone        : out std_logic;  -- xaui_reset
      signal_detect    : in  std_logic;  -- FROM SFP+ Tranceiver
      tx_fault         : in  std_logic;  -- FROM SFP+ Tranceiver
      tx_disable       : out std_logic); -- TO SFP+ Tranceiver
end ten_gig_eth_pcs_pma_v2_5_example_design;

-- library ieee;
-- use ieee.numeric_std.all;

-- library unisim;
-- use unisim.vcomponents.all;

-- architecture wrapper of ten_gig_eth_pcs_pma_v2_5_example_design is

-- ----------------------------------------------------------------------------
-- -- Component Declaration for the 10GBASE-R block level.
-- ----------------------------------------------------------------------------

--   component ten_gig_eth_pcs_pma_v2_5_block is
--     generic (
--       EXAMPLE_SIM_GTRESET_SPEEDUP : string    := "FALSE"
--       );
--     port (
--       -- refclk_n         : in  std_logic;
--       -- refclk_p         : in  std_logic;
--       REF_CLK_IN       : in  std_logic;  -- 156.25 MHz MGT_REF_CLK in (after LVDS Buffer)
--       clk156           : out std_logic;
--       txclk322         : out std_logic;
--       rxclk322         : out std_logic;
--       dclk             : out std_logic;
--       areset           : in  std_logic;
--       reset            : in  std_logic;
--       txreset322       : in  std_logic;
--       rxreset322       : in  std_logic;
--       dclk_reset       : in  std_logic;
--       txp              : out std_logic;
--       txn              : out std_logic;
--       rxp              : in  std_logic;
--       rxn              : in  std_logic;
--       xgmii_txd        : in  std_logic_vector(63 downto 0);
--       xgmii_txc        : in  std_logic_vector(7 downto 0);
--       xgmii_rxd        : out std_logic_vector(63 downto 0);
--       xgmii_rxc        : out std_logic_vector(7 downto 0);
--       mdc              : in  std_logic;
--       mdio_in          : in  std_logic;
--       mdio_out         : out std_logic;
--       mdio_tri         : out std_logic;
--       prtad            : in  std_logic_vector(4 downto 0);
--       core_status      : out std_logic_vector(7 downto 0);     
--       tx_resetdone     : out std_logic;
--       rx_resetdone     : out std_logic;
--       signal_detect    : in  std_logic;
--       tx_fault         : in  std_logic;
--       tx_disable       : out std_logic);
--   end component;

-- ----------------------------------------------------------------------------
-- -- Signal declarations.
-- ----------------------------------------------------------------------------

--   signal clk156                : std_logic;
--   signal txclk322              : std_logic;
--   attribute keep : string;
--   attribute keep of txclk322 : signal is "true";
--   signal rxclk322              : std_logic;
--   signal dclk                  : std_logic;
  
--   signal txclk156_mmcm0_locked : std_logic;
  
--   signal core_reset_tx: std_logic;
--   signal core_reset_rx: std_logic;
--   signal txreset322   : std_logic;
--   signal rxreset322   : std_logic;
--   signal dclk_reset   : std_logic;

--   signal core_reset_tx_tmp: std_logic;
--   signal core_reset_rx_tmp: std_logic;
--   signal rxreset_tmp      : std_logic;
--   signal txreset322_tmp   : std_logic;
--   signal rxreset322_tmp   : std_logic;
--   signal dclk_reset_tmp   : std_logic;

--   signal tx_resetdone_int : std_logic;
--   signal rx_resetdone_int : std_logic;
--   signal xgmii_txd_reg : std_logic_vector(63 downto 0);
--   signal xgmii_txc_reg : std_logic_vector(7 downto 0);
    
--   signal xgmii_rxd_int : std_logic_vector(63 downto 0);
--   signal xgmii_rxc_int : std_logic_vector(7 downto 0);
    


--   attribute async_reg : string;
--   attribute async_reg of core_reset_tx_tmp : signal is "true";
--   attribute async_reg of core_reset_rx_tmp : signal is "true";
--   attribute async_reg of rxreset_tmp : signal is "true";
--   attribute async_reg of txreset322_tmp : signal is "true";
--   attribute async_reg of rxreset322_tmp : signal is "true";
--   attribute async_reg of dclk_reset_tmp : signal is "true";
-- begin


--   resetdone <= tx_resetdone_int and rx_resetdone_int;
  
--   cr_proc : process(reset, clk156)
--   begin
--     if(reset = '1') then
--       core_reset_tx_tmp <= '1';
--       core_reset_tx <= '1';
--       core_reset_rx_tmp <= '1';
--       core_reset_rx <= '1';
--     elsif(clk156'event and clk156 = '1') then
--       -- Hold core in reset until everything else is ready...
--       core_reset_tx_tmp <= (not(tx_resetdone_int) or reset or 
--                         tx_fault or not(signal_detect));
--       core_reset_tx <= core_reset_tx_tmp;
--       core_reset_rx_tmp <= (not(rx_resetdone_int) or reset or 
--                         tx_fault or not(signal_detect));
--       core_reset_rx <= core_reset_rx_tmp;
--     end if;
--   end process;     
  
  
--   tr161proc : process(reset, txclk322)
--   begin
--     if(reset = '1') then
--       txreset322_tmp <= '1';
--       txreset322 <= '1';
--     elsif(txclk322'event and txclk322 = '1') then
--       txreset322_tmp <= core_reset_tx;
--       txreset322 <= txreset322_tmp;
--     end if;
--   end process; 
  
--   rr161proc : process(reset, rxclk322)
--   begin
--     if(reset = '1') then
--       rxreset322_tmp <= '1';
--       rxreset322 <= '1';
--     elsif(rxclk322'event and rxclk322 = '1') then
--       rxreset322_tmp <= core_reset_rx;
--       rxreset322 <= rxreset322_tmp;
--     end if;
--   end process; 
  
--   dr_proc : process(reset, dclk)
--   begin
--     if(reset = '1') then
--       dclk_reset_tmp <= '1';
--       dclk_reset <= '1';    
--     elsif(dclk'event and dclk = '1') then
--       dclk_reset_tmp <= core_reset_rx;
--       dclk_reset <= dclk_reset_tmp;
--     end if;
--   end process;  

--   -- Add a pipeline to the xmgii_tx inputs, to aid timing closure
--   tx_reg_proc : process(clk156)
--   begin
--     if(clk156'event and clk156 = '1') then
--       xgmii_txd_reg <= xgmii_txd; 
--       xgmii_txc_reg <= xgmii_txc; 
--     end if;
--   end process;     

--   -- Add a pipeline to the xmgii_rx outputs, to aid timing closure
--   rx_reg_proc : process(clk156)
--   begin
--     if(clk156'event and clk156 = '1') then
--       xgmii_rxd <= xgmii_rxd_int; 
--       xgmii_rxc <= xgmii_rxc_int; 
--     end if;
--   end process;     

--   ten_gig_eth_pcs_pma_block : ten_gig_eth_pcs_pma_v2_5_block
--     generic map (
--       EXAMPLE_SIM_GTRESET_SPEEDUP => "TRUE"
--       )
--     port map (
--       --refclk_n         => refclk_n,
--       --refclk_p         => refclk_p,
--       REF_CLK_IN       => REF_CLK_IN,
--       clk156           => clk156,
--       txclk322         => txclk322,
--       rxclk322         => rxclk322,
--       dclk             => dclk,
--       areset           => reset,
--       reset            => core_reset_tx,
--       txreset322       => txreset322,
--       rxreset322       => rxreset322,
--       dclk_reset       => dclk_reset,
--       txp              => txp,
--       txn              => txn,
--       rxp              => rxp,
--       rxn              => rxn,
--       xgmii_txd        => xgmii_txd_reg,
--       xgmii_txc        => xgmii_txc_reg,
--       xgmii_rxd        => xgmii_rxd_int,
--       xgmii_rxc        => xgmii_rxc_int,
--       mdc              => mdc,
--       mdio_in          => mdio_in,
--       mdio_out         => mdio_out,
--       mdio_tri         => mdio_tri,
--       prtad            => prtad,
--       core_status      => core_status,  
--       tx_resetdone     => tx_resetdone_int,
--       rx_resetdone     => rx_resetdone_int,
--       signal_detect    => signal_detect,
--       tx_fault         => tx_fault,
--       tx_disable       => tx_disable);

-- -----------------------------------------------------------------------------------------------------------------------
-- -- Clock management logic

--   core_clk156_out <= clk156;

--   rx_clk_ddr : ODDR
--     generic map (
--       DDR_CLK_EDGE => "SAME_EDGE")
--     port map (
--       Q =>  xgmii_rx_clk,
--       D1 => '1',
--       D2 => '0',
--       C  => clk156,
--       CE => '1',
--       R  => '0',
--       S  => '0');

-- end wrapper;
