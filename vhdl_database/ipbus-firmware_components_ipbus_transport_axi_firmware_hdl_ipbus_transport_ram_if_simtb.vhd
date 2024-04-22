---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use work.ipbus.ALL;
use work.ipbus_trans_decl.all;



entity ipbus_transport_ram_if_simtb is
--  Port ( );
end ipbus_transport_ram_if_simtb;

architecture Behavioral of ipbus_transport_ram_if_simtb is

  signal ipb_clk: std_logic := '0';

  signal rst_ipb: std_logic := '1';
  signal rst_pcie: std_logic := '1';
  signal nuke: std_logic := '0';

  signal wr_addr : std_logic_vector(9 downto 0);
  signal wr_data : std_logic_vector(63 downto 0);
  signal wr_en : std_logic := '0';

  signal rd_addr : std_logic_vector(10 downto 0);
  signal rd_data : std_logic_vector(63 downto 0);
   
  signal trans_in : ipbus_trans_in;
  signal trans_out : ipbus_trans_out;

  signal ipb_in: ipb_rbus;
  signal ipb_out: ipb_wbus;

begin

  ipb_clk <= not ipb_clk after 16 ns;

  STIMULUS: process
  begin
    rst_ipb <= '1';
    rst_pcie <= '1';
    wait for 128 ns;
    wait until ipb_clk = '0';
    rst_ipb <= '0';
    rst_pcie <= '0';
    wait for 256 ns;
    --- IPBUS INPUT PACKET: HEADERS ---
    wr_en <= '1';
    wr_addr <= (Others => '0');
    wr_data(31 downto 0) <= X"00010002"; -- header length, payload length
--    wait for 32 ns;
--    rx_addr <= "000" & X"01";
    wr_data(63 downto 32) <= X"200001F0"; -- IPbus packet header
    -- IPBUS INPUT PACKET: READ TRANSACTION --
    wait for 32 ns;
    wr_addr <= "00" & X"01";
    wr_data(31 downto 0) <= X"2001010F";
--    wait for 32 ns;
--    rx_addr <= "000" & X"03";
    wr_data(63 downto 32) <= X"00000001";
    -- END OF INPUT PACKET --
    wait for 32 ns;
    wr_en <= '0';
    --wait for 32 ns;
    --ram_rx_payload_send <= '1';
    --wait for 32 ns;
    --ram_rx_payload_send <= '0';
    wait;
  end process;
  
  TX_BUF_STIMULUS : process
  begin
    rd_addr <= "000" & X"00";
    wait for 2016 ns;
--    if rising_edge(ram_tx_req_send) then
    rd_addr <= "000" & X"01";
    wait for 32 ns;
    rd_addr <= "000" & X"02";
    wait for 32 ns;
    rd_addr <= "000" & X"03";
    wait for 32 ns;
    rd_addr <= "000" & X"04";
    wait for 32 ns;
    rd_addr <= "000" & X"05";
    wait for 32 ns;
    rd_addr <= "000" & X"06";
    wait for 32 ns;
    rd_addr <= "000" & X"07";
    wait for 32 ns;
    rd_addr <= "000" & X"08";
    wait;
--    end if;
  end process;

  ipbus_if : entity work.ipbus_transport_ram_if
    generic map (
      BUFWIDTH => 2,
      ADDRWIDTH => 9
    )
    port map (
      ram_clk => ipb_clk,
      ipb_clk => ipb_clk,
      rst_ipb => rst_ipb,

      wr_addr => wr_addr,
      wr_data => wr_data,
      wr_en => wr_en,

      rd_addr => rd_addr,
      rd_data => rd_data,
    
      trans_out => trans_out,
      trans_in => trans_in
    );


  trans: entity work.transactor
    port map(
      clk => ipb_clk,
      rst => rst_ipb,
      ipb_out => ipb_out,
      ipb_in => ipb_in,
      ipb_req => open,
      ipb_grant => '1',
      trans_in => trans_in,
      trans_out => trans_out,
      cfg_vector_in => (Others => '0'),
      cfg_vector_out => open
    );

  slaves: entity work.ipbus_example
    port map(
      ipb_clk => ipb_clk,
      ipb_rst => rst_ipb,
      ipb_in => ipb_out,
      ipb_out => ipb_in,
      nuke => open,
      soft_rst => open,
      userled => open
    );

end Behavioral;
