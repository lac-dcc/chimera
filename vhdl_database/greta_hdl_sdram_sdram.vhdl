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

-- RAM arbiter and controller
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.greta_pkg.all;

entity sdram is
  port(
    clk         : in    std_logic;
    reset       : in    std_logic;
    ready       : out   std_logic := '0';

    --- CLIENTS
    fast        : in    ram_bus;
    fast_ack    : out   std_logic;
    disk        : in    ram_bus;
    disk_ack    : out   std_logic;
    rdata       : out   bus_data;

    --- SDRAM
    SDRAM_CKE   : out   std_logic;
    SDRAM_nRAS  : out   std_logic;
    SDRAM_nCAS  : out   std_logic;
    SDRAM_nWE   : out   std_logic;
    SDRAM_UDQM  : out   std_logic;
    SDRAM_LDQM  : out   std_logic;
    SDRAM_BA    : out   std_logic_vector( 1 downto  0);
    SDRAM_A     : out   std_logic_vector(11 downto  0);
    SDRAM_DQ    : inout std_logic_vector(15 downto  0) :=
     (others => 'Z')
  );
end;

architecture rtl of sdram is
  constant NCLIENTS : integer := 2;
  constant AP : integer := 10;

  subtype init_counter_t is unsigned(14 downto 0);
  signal init_counter : init_counter_t := (others => '0');

  subtype tick_t is unsigned(3 downto 0);
  signal tick : tick_t := (others => '0');

  subtype offset_t is unsigned(1 downto 0);
  signal offset : offset_t := (others => '0');

  type state_t is (INIT_NOP, INIT_PRE, INIT_AR, INIT_MRS,
   INIT_DONE);
  signal state : state_t := INIT_NOP;

  -- nRAS, nCAS, nWE
  subtype cmd_t is std_logic_vector(2 downto 0);
  constant CMD_MRS    : cmd_t := "000";
  constant CMD_AR     : cmd_t := "001";
  constant CMD_PRE    : cmd_t := "010";
  constant CMD_ACT    : cmd_t := "011";
  constant CMD_WRITE  : cmd_t := "100";
  constant CMD_READ   : cmd_t := "101";
  constant CMD_NOP    : cmd_t := "111";
  signal cmd          : cmd_t := CMD_NOP;

  signal addr : bus_addr := (others => '0');
  signal nwe : bus_nwe := READ_WORD;
  signal refresh : std_logic := '0';
  signal acks : std_logic_vector(NCLIENTS - 1 downto 0) :=
    (others => '0');
  signal acks_pend : std_logic_vector(NCLIENTS - 1 downto 0) :=
    (others => '0');
  signal wdata : bus_data;

begin
--  psl default clock is rising_edge(clk);
--  psl assert
--    always({state = INIT_DONE and fast.req='1' and acks(0) = '0'} |=>
--      {[*0 to 26]; acks(0)='1'});
--  psl assert
--    always({state = INIT_DONE and disk.req='1' and acks(1) = '0'} |=>
--      {[*0 to 44]; acks(1)='1'});
  SDRAM_nRAS  <= cmd(2);
  SDRAM_nCAS  <= cmd(1);
  SDRAM_nWE   <= cmd(0);
  SDRAM_CKE   <= '1';

  fast_ack <= acks(0);
  disk_ack <= acks(1);

  counters: process(clk)
  begin
    if rising_edge(clk) then
      -- Manage counters.
      if tick(tick'high) = '1' then
        tick <= (others => '0');
        offset <= offset + 1;
      else
        tick <= tick + 1;
      end if;
    end if;
  end process;

  state_machine: process(clk)
  begin
    if rising_edge(clk) then
      cmd <= CMD_NOP;
      acks <= (others => '0');
      -- Sample read data. Only use together with the
      -- distributed ack.
      rdata <= SDRAM_DQ;
      SDRAM_DQ <= (others => 'Z');

      if reset = '1' then
        ready <= '0';
        init_counter <= (others => '0');
        -- NOP
        SDRAM_A <= (others => '0');
        SDRAM_A(AP) <= '1';
        SDRAM_BA <= (others => '0');
        SDRAM_UDQM <= '1';
        SDRAM_LDQM <= '1';
        state <= INIT_NOP;
      else
        init_counter <= init_counter + 1;

        case state is
        when INIT_NOP =>
          if init_counter(14 downto 12) = "111" then
            -- Anything greater than 200 us * 133.333 MHz
            cmd <= CMD_PRE;
            state <= INIT_PRE;
          end if;

        when INIT_PRE =>
          SDRAM_A(AP) <= '0';
          if init_counter(1) = '1' then
            -- "111000000000010"
            -- Pre lasts for 3 cycles.
            state <= INIT_AR;
          end if;

        when INIT_AR =>
          if init_counter(3 downto 0) = "0011" then
            -- "111000000000011"
            -- "111000000010011"
            -- "111000000100011"
            -- "111000000110011"
            -- "111000001000011"
            -- "111000001010011"
            -- "111000001100011"
            -- "111000001110011"
            cmd <= CMD_AR;
          end if;
          if init_counter(7) = '1' then
            cmd <= CMD_MRS;
            -- SDRAM_A is zero. Set bits according to MRS.
            -- CAS Latency 3.
            -- A(6) <= '0';
            SDRAM_A(5) <= '1';
            SDRAM_A(4) <= '1';
            -- Burst length 1.
            -- SDRAM_A(2) <= '0';
            -- SDRAM_A(1) <= '0';
            -- SDRAM_A(0) <= '0';
            state <= INIT_MRS;
          end if;

        when INIT_MRS =>
          if init_counter(0) = '1' then
            state <= INIT_DONE;
          end if;

        when INIT_DONE =>
          ready <= '1';
          if nwe = WRITE_UPPER then
            SDRAM_UDQM <= '0';
            SDRAM_LDQM <= '1';
          elsif nwe = WRITE_LOWER then
            SDRAM_UDQM <= '1';
            SDRAM_LDQM <= '0';
          else
            SDRAM_UDQM <= '0';
            SDRAM_LDQM <= '0';
          end if;

          -- Registered outputs
          case tick is
          when x"0" =>
            -- Transfer offset, tick, req => acks_pend.
            null;
          when x"1" =>
            -- ACT
            SDRAM_BA  <= addr(22 downto 21);
            SDRAM_A   <= addr(20 downto  9);
            if refresh = '0' then
              cmd <= CMD_ACT;
            else
              cmd <= CMD_AR;
            end if;
          when x"2" =>
            -- NOP
          when x"3" =>
            -- NOP
          when x"4" =>
            --  Auto Precharge
            SDRAM_A(AP) <= '1';
            SDRAM_A(7 downto 0) <= addr(8 downto 1);
            if refresh = '1' then
              -- NOP
            elsif nwe = READ_WORD then
              cmd <= CMD_READ;
              -- READ + AP
            else
              SDRAM_DQ <= wdata;
              cmd <= CMD_WRITE;
            end if;
          when x"5" =>
            -- NOP
          when x"6" =>
            -- NOP
          when x"7" =>
            -- NOP
          when others =>
            -- NOP
            acks <= acks_pend;
            nwe <= READ_WORD;
          end case;
        end case;
 
        case offset is
        when "00" | "10" =>
          refresh <= '0';
          addr <= fast.addr;
          wdata <= fast.wdata;
          if tick = 0 then
            acks_pend(0) <= fast.req;
            acks_pend(1) <= '0';
          end if;
          if tick = 1 and fast.req = '1' then
            nwe <= fast.nwe;
          end if;

        when "01" =>
          refresh <= '0';
          addr <= disk.addr;
          wdata <= disk.wdata;
          if tick = 0 then
            acks_pend(0) <= '0';
            acks_pend(1) <= disk.req;
          end if;
          if tick = 1 and disk.req = '1' then
            nwe <= disk.nwe;
          end if;

        when others =>
          refresh <= '1';
          addr <= disk.addr;
          wdata <= disk.wdata;
          acks_pend <= "00";
        end case;
      end if;
    end if;
  end process;
end;

