-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2011 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------------------
-- Project    : Virtex-6 Integrated Block for PCI Express
-- File       : pcie_pipe_lane_v6.vhd
-- Version    : 2.4
---- Description: PIPE per lane module for Virtex6 PCIe Block
----
----
----
----------------------------------------------------------------------------------

library ieee;
   use ieee.std_logic_1164.all;

entity pcie_pipe_lane_v6 is
   generic (
      PIPE_PIPELINE_STAGES                         : integer := 0		-- 0 - 0 stages, 1 - 1 stage, 2 - 2 stages
   );
   port (
      pipe_rx_char_is_k_o                          : out std_logic_vector(1 downto 0);
      pipe_rx_data_o                               : out std_logic_vector(15 downto 0);
      pipe_rx_valid_o                              : out std_logic;
      pipe_rx_chanisaligned_o                      : out std_logic;
      pipe_rx_status_o                             : out std_logic_vector(2 downto 0);
      pipe_rx_phy_status_o                         : out std_logic;
      pipe_rx_elec_idle_o                          : out std_logic;
      pipe_rx_polarity_i                           : in std_logic;
      pipe_tx_compliance_i                         : in std_logic;
      pipe_tx_char_is_k_i                          : in std_logic_vector(1 downto 0);
      pipe_tx_data_i                               : in std_logic_vector(15 downto 0);
      pipe_tx_elec_idle_i                          : in std_logic;
      pipe_tx_powerdown_i                          : in std_logic_vector(1 downto 0);
      pipe_rx_char_is_k_i                          : in std_logic_vector(1 downto 0);
      pipe_rx_data_i                               : in std_logic_vector(15 downto 0);
      pipe_rx_valid_i                              : in std_logic;
      pipe_rx_chanisaligned_i                      : in std_logic;
      pipe_rx_status_i                             : in std_logic_vector(2 downto 0);
      pipe_rx_phy_status_i                         : in std_logic;
      pipe_rx_elec_idle_i                          : in std_logic;
      pipe_rx_polarity_o                           : out std_logic;
      pipe_tx_compliance_o                         : out std_logic;
      pipe_tx_char_is_k_o                          : out std_logic_vector(1 downto 0);
      pipe_tx_data_o                               : out std_logic_vector(15 downto 0);
      pipe_tx_elec_idle_o                          : out std_logic;
      pipe_tx_powerdown_o                          : out std_logic_vector(1 downto 0);
      pipe_clk                                     : in std_logic;
      rst_n                                        : in std_logic
   );
end pcie_pipe_lane_v6;

architecture v6_pcie of pcie_pipe_lane_v6 is
   
      --******************************************************************//
      -- Reality check.                                                   //
      --******************************************************************//
      
   constant TCQ                                    : integer := 1;		-- clock to out delay model
   signal pipe_rx_char_is_k_q                      : std_logic_vector(1 downto 0);
   signal pipe_rx_data_q                           : std_logic_vector(15 downto 0);
   signal pipe_rx_valid_q                          : std_logic;
   signal pipe_rx_chanisaligned_q                  : std_logic;
   signal pipe_rx_status_q                         : std_logic_vector(2 downto 0);
   signal pipe_rx_phy_status_q                     : std_logic;
   signal pipe_rx_elec_idle_q                      : std_logic;
   
   signal pipe_rx_polarity_q                       : std_logic;
   signal pipe_tx_compliance_q                     : std_logic;
   signal pipe_tx_char_is_k_q                      : std_logic_vector(1 downto 0);
   signal pipe_tx_data_q                           : std_logic_vector(15 downto 0);
   signal pipe_tx_elec_idle_q                      : std_logic;
   signal pipe_tx_powerdown_q                      : std_logic_vector(1 downto 0);
   
   signal pipe_rx_char_is_k_qq                     : std_logic_vector(1 downto 0);
   signal pipe_rx_data_qq                          : std_logic_vector(15 downto 0);
   signal pipe_rx_valid_qq                         : std_logic;
   signal pipe_rx_chanisaligned_qq                 : std_logic;
   signal pipe_rx_status_qq                        : std_logic_vector(2 downto 0);
   signal pipe_rx_phy_status_qq                    : std_logic;
   signal pipe_rx_elec_idle_qq                     : std_logic;
   
   signal pipe_rx_polarity_qq                      : std_logic;
   signal pipe_tx_compliance_qq                    : std_logic;
   signal pipe_tx_char_is_k_qq                     : std_logic_vector(1 downto 0);
   signal pipe_tx_data_qq                          : std_logic_vector(15 downto 0);
   signal pipe_tx_elec_idle_qq                     : std_logic;
   signal pipe_tx_powerdown_qq                     : std_logic_vector(1 downto 0);
begin
   
   v6pcie0 : if (PIPE_PIPELINE_STAGES = 0) generate
      
      pipe_rx_char_is_k_o <= pipe_rx_char_is_k_i;
      pipe_rx_data_o <= pipe_rx_data_i;
      pipe_rx_valid_o <= pipe_rx_valid_i;
      pipe_rx_chanisaligned_o <= pipe_rx_chanisaligned_i;
      pipe_rx_status_o <= pipe_rx_status_i;
      pipe_rx_phy_status_o <= pipe_rx_phy_status_i;
      pipe_rx_elec_idle_o <= pipe_rx_elec_idle_i;
      
      pipe_rx_polarity_o <= pipe_rx_polarity_i;
      pipe_tx_compliance_o <= pipe_tx_compliance_i;
      pipe_tx_char_is_k_o <= pipe_tx_char_is_k_i;
      pipe_tx_data_o <= pipe_tx_data_i;
      pipe_tx_elec_idle_o <= pipe_tx_elec_idle_i;
      pipe_tx_powerdown_o <= pipe_tx_powerdown_i;
      
   end generate;
   v6pcie1 : if (PIPE_PIPELINE_STAGES = 1) generate
         
      process (pipe_clk)
      begin
         if (pipe_clk'event and pipe_clk = '1') then
            
            if (rst_n = '1') then
               
               pipe_rx_char_is_k_q <= "00" after (TCQ)*1 ps;
               pipe_rx_data_q <= "0000000000000000" after (TCQ)*1 ps;
               pipe_rx_valid_q <= '0' after (TCQ)*1 ps;
               pipe_rx_chanisaligned_q <= '0' after (TCQ)*1 ps;
               pipe_rx_status_q <= "000" after (TCQ)*1 ps;
               pipe_rx_phy_status_q <= '0' after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_q <= '0' after (TCQ)*1 ps;
               pipe_rx_polarity_q <= '0' after (TCQ)*1 ps;
               pipe_tx_compliance_q <= '0' after (TCQ)*1 ps;
               pipe_tx_char_is_k_q <= "00" after (TCQ)*1 ps;
               pipe_tx_data_q <= "0000000000000000" after (TCQ)*1 ps;
               pipe_tx_elec_idle_q <= '1' after (TCQ)*1 ps;
               
               pipe_tx_powerdown_q <= "10" after (TCQ)*1 ps;
            else
               
               pipe_rx_char_is_k_q <= pipe_rx_char_is_k_i after (TCQ)*1 ps;
               pipe_rx_data_q <= pipe_rx_data_i after (TCQ)*1 ps;
               pipe_rx_valid_q <= pipe_rx_valid_i after (TCQ)*1 ps;
               pipe_rx_chanisaligned_q <= pipe_rx_chanisaligned_i after (TCQ)*1 ps;
               pipe_rx_status_q <= pipe_rx_status_i after (TCQ)*1 ps;
               pipe_rx_phy_status_q <= pipe_rx_phy_status_i after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_q <= pipe_rx_elec_idle_i after (TCQ)*1 ps;
               pipe_rx_polarity_q <= pipe_rx_polarity_i after (TCQ)*1 ps;
               pipe_tx_compliance_q <= pipe_tx_compliance_i after (TCQ)*1 ps;
               pipe_tx_char_is_k_q <= pipe_tx_char_is_k_i after (TCQ)*1 ps;
               pipe_tx_data_q <= pipe_tx_data_i after (TCQ)*1 ps;
               pipe_tx_elec_idle_q <= pipe_tx_elec_idle_i after (TCQ)*1 ps;
               
               pipe_tx_powerdown_q <= pipe_tx_powerdown_i after (TCQ)*1 ps;
            end if;
         end if;
      end process;
         
         
      pipe_rx_char_is_k_o <= pipe_rx_char_is_k_q;
      pipe_rx_data_o <= pipe_rx_data_q;
      pipe_rx_valid_o <= pipe_rx_valid_q;
      pipe_rx_chanisaligned_o <= pipe_rx_chanisaligned_q;
      pipe_rx_status_o <= pipe_rx_status_q;
      pipe_rx_phy_status_o <= pipe_rx_phy_status_q;
      pipe_rx_elec_idle_o <= pipe_rx_elec_idle_q;
      
      pipe_rx_polarity_o <= pipe_rx_polarity_q;
      pipe_tx_compliance_o <= pipe_tx_compliance_q;
      pipe_tx_char_is_k_o <= pipe_tx_char_is_k_q;
      pipe_tx_data_o <= pipe_tx_data_q;
      pipe_tx_elec_idle_o <= pipe_tx_elec_idle_q;
      pipe_tx_powerdown_o <= pipe_tx_powerdown_q;
         
   end generate;
   v6pcie3 : if (PIPE_PIPELINE_STAGES = 2) generate
         
      process (pipe_clk)
      begin
         if (pipe_clk'event and pipe_clk = '1') then
            
            if (rst_n = '1') then
               
               pipe_rx_char_is_k_q <= "00" after (TCQ)*1 ps;
               pipe_rx_data_q <= "0000000000000000" after (TCQ)*1 ps;
               pipe_rx_valid_q <= '0' after (TCQ)*1 ps;
               pipe_rx_chanisaligned_q <= '0' after (TCQ)*1 ps;
               pipe_rx_status_q <= "000" after (TCQ)*1 ps;
               pipe_rx_phy_status_q <= '0' after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_q <= '0' after (TCQ)*1 ps;
               pipe_rx_polarity_q <= '0' after (TCQ)*1 ps;
               pipe_tx_compliance_q <= '0' after (TCQ)*1 ps;
               pipe_tx_char_is_k_q <= "00" after (TCQ)*1 ps;
               pipe_tx_data_q <= "0000000000000000" after (TCQ)*1 ps;
               pipe_tx_elec_idle_q <= '1' after (TCQ)*1 ps;
               pipe_tx_powerdown_q <= "10" after (TCQ)*1 ps;

               pipe_rx_char_is_k_qq <= "00" after (TCQ)*1 ps;
               pipe_rx_data_qq <= "0000000000000000" after (TCQ)*1 ps;
               pipe_rx_valid_qq <= '0' after (TCQ)*1 ps;
               pipe_rx_chanisaligned_qq <= '0' after (TCQ)*1 ps;
               pipe_rx_status_qq <= "000" after (TCQ)*1 ps;
               pipe_rx_phy_status_qq <= '0' after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_qq <= '0' after (TCQ)*1 ps;
               pipe_rx_polarity_qq <= '0' after (TCQ)*1 ps;
               pipe_tx_compliance_qq <= '0' after (TCQ)*1 ps;
               pipe_tx_char_is_k_qq <= "00" after (TCQ)*1 ps;
               pipe_tx_data_qq <= "0000000000000000" after (TCQ)*1 ps;
               pipe_tx_elec_idle_qq <= '1' after (TCQ)*1 ps;
               pipe_tx_powerdown_qq <= "10" after (TCQ)*1 ps;
            else
               
               pipe_rx_char_is_k_q <= pipe_rx_char_is_k_i after (TCQ)*1 ps;
               pipe_rx_data_q <= pipe_rx_data_i after (TCQ)*1 ps;
               pipe_rx_valid_q <= pipe_rx_valid_i after (TCQ)*1 ps;
               pipe_rx_chanisaligned_q <= pipe_rx_chanisaligned_i after (TCQ)*1 ps;
               pipe_rx_status_q <= pipe_rx_status_i after (TCQ)*1 ps;
               pipe_rx_phy_status_q <= pipe_rx_phy_status_i after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_q <= pipe_rx_elec_idle_i after (TCQ)*1 ps;
               pipe_rx_polarity_q <= pipe_rx_polarity_i after (TCQ)*1 ps;
               pipe_tx_compliance_q <= pipe_tx_compliance_i after (TCQ)*1 ps;
               pipe_tx_char_is_k_q <= pipe_tx_char_is_k_i after (TCQ)*1 ps;
               pipe_tx_data_q <= pipe_tx_data_i after (TCQ)*1 ps;
               pipe_tx_elec_idle_q <= pipe_tx_elec_idle_i after (TCQ)*1 ps;
               pipe_tx_powerdown_q <= pipe_tx_powerdown_i after (TCQ)*1 ps;

               pipe_rx_char_is_k_qq <= pipe_rx_char_is_k_q after (TCQ)*1 ps;
               pipe_rx_data_qq <= pipe_rx_data_q after (TCQ)*1 ps;
               pipe_rx_valid_qq <= pipe_rx_valid_q after (TCQ)*1 ps;
               pipe_rx_chanisaligned_qq <= pipe_rx_chanisaligned_q after (TCQ)*1 ps;
               pipe_rx_status_qq <= pipe_rx_status_q after (TCQ)*1 ps;
               pipe_rx_phy_status_qq <= pipe_rx_phy_status_q after (TCQ)*1 ps;
               
               pipe_rx_elec_idle_qq <= pipe_rx_elec_idle_q after (TCQ)*1 ps;
               pipe_rx_polarity_qq <= pipe_rx_polarity_q after (TCQ)*1 ps;
               pipe_tx_compliance_qq <= pipe_tx_compliance_q after (TCQ)*1 ps;
               pipe_tx_char_is_k_qq <= pipe_tx_char_is_k_q after (TCQ)*1 ps;
               pipe_tx_data_qq <= pipe_tx_data_q after (TCQ)*1 ps;
               pipe_tx_elec_idle_qq <= pipe_tx_elec_idle_q after (TCQ)*1 ps;
               pipe_tx_powerdown_qq <= pipe_tx_powerdown_q after (TCQ)*1 ps;
            end if;
         end if;
      end process;

      pipe_rx_char_is_k_o <= pipe_rx_char_is_k_qq;
      pipe_rx_data_o <= pipe_rx_data_qq;
      pipe_rx_valid_o <= pipe_rx_valid_qq;
      pipe_rx_chanisaligned_o <= pipe_rx_chanisaligned_qq;
      pipe_rx_status_o <= pipe_rx_status_qq;
      pipe_rx_phy_status_o <= pipe_rx_phy_status_qq;
      pipe_rx_elec_idle_o <= pipe_rx_elec_idle_qq;
      
      pipe_rx_polarity_o <= pipe_rx_polarity_qq;
      pipe_tx_compliance_o <= pipe_tx_compliance_qq;
      pipe_tx_char_is_k_o <= pipe_tx_char_is_k_qq;
      pipe_tx_data_o <= pipe_tx_data_qq;
      pipe_tx_elec_idle_o <= pipe_tx_elec_idle_qq;
      pipe_tx_powerdown_o <= pipe_tx_powerdown_qq;
      
   end generate;

end v6_pcie;


