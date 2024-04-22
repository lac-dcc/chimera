--
-- Copyright (C) 2013 Martin Åberg
--
--  This program is free software: you can redistribute it
--  and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation,
--  either version 3 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General
--  Public License along with this program.  If not, see
--  <http://www.gnu.org/licenses/>.
--

-- This component is responsible for translating asynchronous
-- MC68000 bus accesses to a protocol suitable for the
-- AUTOCONFIG component and the other upstream components.
library ieee;
use ieee.std_logic_1164.all;
use work.greta_pkg.all;

entity bus_interface is
  port(
    --- GRETA
    clk             : in    std_logic;
    cpu_reset       : out   std_logic;
    dcm_locked      : in    std_logic;
    req             : out   std_logic;
    nwe             : out   bus_nwe;
    addr            : out   bus_addr;
    wdata           : out   bus_data;
    rdata           : in    bus_data;
    dev_select      : in    std_logic;
    --- ROCK LOBSTER
    nRST            : in    std_logic;
    nAS             : in    std_logic;
    nUDS            : in    std_logic;
    nLDS            : in    std_logic;
    RnW             : in    std_logic;
    CDAC            : in    std_logic;
    nOVR            : out   std_logic;
    nINT2           : out   std_logic;
    nINT6           : out   std_logic;
    nINT7           : out   std_logic;
    nDTACK          : out   std_logic;
    A               : in    bus_addr;
    D               : inout bus_data;
    D_nOE           : out   std_logic := '1';
    D_TO_GRETA      : out   std_logic := '1'
  );
end;

architecture rtl of bus_interface is
  signal nRST_sync       : std_logic_vector(1 downto 0) := "00";
  signal nAS_sync        : std_logic_vector(1 downto 0) := "11";
  signal nUDS_sync       : std_logic_vector(2 downto 0);
  signal nLDS_sync       : std_logic_vector(2 downto 0);
  signal RnW_sync        : std_logic_vector(1 downto 0);

  signal cpu_reset_int : std_logic := '1';

  type bus_state is (S1, W1, W2, R1);
  signal state : bus_state := S1;

begin

  synchronizers : process(clk)
  begin
    if rising_edge(clk) then
      nRST_sync   <= nRST_sync(0) & nRST;
      nAS_sync    <= nAS_sync(0) & nAS;
      RnW_sync    <= RnW_sync(0) & RnW;
      nUDS_sync   <= nUDS_sync(1 downto 0) & nUDS;
      nLDS_sync   <= nLDS_sync(1 downto 0) & nLDS;

      wdata   <= D;
      addr    <= A;

      -- NOTE: clk may be in any state, so the following logic
      -- may get trashed...
      if (dcm_locked = '1') and (nRST_sync(1) = '1') then
        cpu_reset_int <= '0';
      else
        cpu_reset_int <= '1';
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if cpu_reset_int = '1' then
        D_nOE       <= '1';
        D_TO_GRETA  <= '1';
        req <= '0';
        state <= S1;
      else
        D_nOE       <= '1';
        D_TO_GRETA  <= '1';
        req <= '0';
        D <= "ZZZZZZZZZZZZZZZZ";

        case state is
        when S1 =>
          if nAS_sync(1) = '0' then
            -- Transfer
            if (RnW_sync(1) = '0') then
              -- Write
              state <= W1;
            else
              -- Read, wait for nUDS and nLDS to become stable.
              if (nUDS_sync(1) = '0') or (nLDS_sync(1) = '0') then
                req <= '1';
                nwe <= READ_WORD;
                D_TO_GRETA <= '0';
                state <= R1;
              end if;
            end if;
          end if;

        when R1 =>
          D_TO_GRETA <= '0';
          D_nOE <= not dev_select;
          D <= rdata;
          if (nUDS_sync(1) = '1') and (nLDS_sync(1) = '1') then
            state <= S1;
            D_nOE <= '1';
            D <= "ZZZZZZZZZZZZZZZZ";
          end if;

        when W1 =>
          D_nOE <= '0';
          -- Wait for nUDS and nLDS to become stable.
          if ((nUDS_sync(2) = nUDS_sync(1))) and
             ((nLDS_sync(2) = nLDS_sync(1))) and
             ((nUDS_sync(2) = '0') or (nLDS_sync(2) = '0')) then
            nwe <= nUDS_sync(1) & nLDS_sync(1);
            req <= '1';
            -- wdata and addr is driven elsewhere.
            state <= W2;
          end if;

        when W2 =>
          D_nOE <= '0';
          if nAS_sync(1) = '1' then
            D_nOE <= '1';
            state <= S1;
          end if;

        end case;

      end if;
    end if;
  end process;

  cpu_reset <= cpu_reset_int;

  nOVR        <= '1';
  nINT2       <= '1';
  nINT6       <= '1';
  nINT7       <= '1';
  nDTACK      <= '1';

end;

