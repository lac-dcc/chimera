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


-- Clock domain crossings for multi-buffer master to the IPbus transactor
-- 
-- Tom Williams, July 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;


entity ipbus_transport_multibuffer_cdc is
  generic (
    -- Number of buffers
    N_BUFFERS: natural
  );
  port (
    ipb_clk: in std_logic;
    master_clk: in std_logic;

    -- IPbus reset
    rst_ipbclk : in std_logic;
    -- IPbus reset in 'master' clock domain
    rst_mstclk : out std_logic;

    -- IPbus transactor 'pkt_done' signal
    pkt_done_ipbclk : in std_logic;
    -- IPbus transactor 'pkt_done' in 'master' clock domain
    pkt_done_mstclk : out std_logic;

    -- 'Buffer filled' signal in 'master' clock domain
    buf_filled_mstclk : in std_logic_vector(N_BUFFERS - 1 downto 0);
    -- 'Buffer filled' signal in IPbus clock domain
    buf_filled_ipbclk : out std_logic_vector(N_BUFFERS - 1 downto 0)
  );

end ipbus_transport_multibuffer_cdc;



architecture rtl of ipbus_transport_multibuffer_cdc is

  signal rst_cdc1, rst_cdc2, pkt_done_cdc1, pkt_done_cdc2 : std_logic;
  signal buf_filled_cdc1, buf_filled_cdc2 : std_logic_vector(N_BUFFERS - 1 downto 0);

  attribute ASYNC_REG: string;

  attribute ASYNC_REG of rst_cdc1 : signal is "TRUE";
  attribute ASYNC_REG of rst_cdc2 : signal is "TRUE";

  attribute ASYNC_REG of pkt_done_cdc1 : signal is "TRUE";
  attribute ASYNC_REG of pkt_done_cdc2 : signal is "TRUE";

  attribute ASYNC_REG of buf_filled_cdc1 : signal is "TRUE";
  attribute ASYNC_REG of buf_filled_cdc2 : signal is "TRUE";

begin

  process (master_clk)
  begin
    if rising_edge(master_clk) then
      rst_cdc2 <= rst_cdc1;
      rst_mstclk <= rst_cdc2;

      pkt_done_cdc2 <= pkt_done_cdc1;
      pkt_done_mstclk <= pkt_done_cdc2;

      buf_filled_cdc1 <= buf_filled_mstclk;
    end if;
  end process;


  process (ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      rst_cdc1 <= rst_ipbclk;

      pkt_done_cdc1 <= pkt_done_ipbclk;

      buf_filled_cdc2   <= buf_filled_cdc1;
      buf_filled_ipbclk <= buf_filled_cdc2;
    end if;
  end process;


end rtl;