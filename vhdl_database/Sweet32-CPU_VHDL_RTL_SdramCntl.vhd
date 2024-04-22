-- Matthew Hagerty, copyright 2014
--
-- Create Date: 18:22:00 March 18, 2014
-- Module Name: sdram_simple - RTL
--
-- Simple SDRAM Controller for Winbond W9812G6JH-75
-- Can synthesize: Yes
-- Proven in hardware: Yes
--
-- The MIT License (MIT)
--
-- Copyright (c) 2014 Matthew Hagerty
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity sdram_simple is
   port(
      -- Host side
      clk_100m0_i    : in std_logic;            -- Master clock
      reset_i        : in std_logic := '0';     -- Reset, active high
      refresh_i      : in std_logic := '0';     -- Initiate a refresh cycle, active high
      rw_i           : in std_logic := '0';     -- Initiate a read or write operation, active high
      we_i           : in std_logic := '0';     -- Write enable, active low
      addr_i         : in std_logic_vector(23 downto 0) := (others => '0');   -- Address from host to SDRAM
      data_i         : in std_logic_vector(15 downto 0) := (others => '0');   -- Data from host to SDRAM
      ub_i           : in std_logic;            -- Data upper byte enable, active low
      lb_i           : in std_logic;            -- Data lower byte enable, active low
      ready_o        : out std_logic := '0';    -- Set to '1' when the memory is ready
      done_o         : out std_logic := '0';    -- Read, write, or refresh, operation is done
      data_o         : out std_logic_vector(15 downto 0);   -- Data from SDRAM to host

      -- SDRAM side
      sdCke_o        : out std_logic;           -- Clock-enable to SDRAM
      sdCe_bo        : out std_logic;           -- Chip-select to SDRAM
      sdRas_bo       : out std_logic;           -- SDRAM row address strobe
      sdCas_bo       : out std_logic;           -- SDRAM column address strobe
      sdWe_bo        : out std_logic;           -- SDRAM write enable
      sdBs_o         : out std_logic_vector(1 downto 0);    -- SDRAM bank address
      sdAddr_o       : out std_logic_vector(12 downto 0);   -- SDRAM row/column address
      sdData_io      : inout std_logic_vector(15 downto 0); -- Data to/from SDRAM
      sdDqmh_o       : out std_logic;           -- Enable upper-byte of SDRAM databus if true
      sdDqml_o       : out std_logic            -- Enable lower-byte of SDRAM databus if true
   );
end entity;

architecture rtl of sdram_simple is

   -- SDRAM controller states.
   type fsm_state_type is (
   ST_INIT_WAIT, ST_INIT_PRECHARGE, ST_INIT_REFRESH1, ST_INIT_MODE, ST_INIT_REFRESH2,
   ST_IDLE, ST_REFRESH, ST_ACTIVATE, ST_RCD, ST_RW, ST_RAS1, ST_RAS2, ST_PRECHARGE);
   signal state_r, state_x : fsm_state_type := ST_INIT_WAIT;


   -- SDRAM mode register data sent on the address bus.
   --
   -- | A12-A10 |    A9    | A8  A7 | A6 A5 A4 |    A3   | A2 A1 A0 |
   -- | reserved| wr burst |reserved| CAS Ltncy|addr mode| burst len|
   --   0  0  0      0       0   0    0  1  0       0      0  0  0
   constant MODE_REG : std_logic_vector(12 downto 0) := "000" & "0" & "00" & "010" & "0" & "000";

   -- SDRAM commands combine SDRAM inputs: cs, ras, cas, we.
   subtype cmd_type is unsigned(3 downto 0);
   constant CMD_ACTIVATE   : cmd_type := "0011";
   constant CMD_PRECHARGE  : cmd_type := "0010";
   constant CMD_WRITE      : cmd_type := "0100";
   constant CMD_READ       : cmd_type := "0101";
   constant CMD_MODE       : cmd_type := "0000";
   constant CMD_NOP        : cmd_type := "0111";
   constant CMD_REFRESH    : cmd_type := "0001";

   signal cmd_r   : cmd_type;
   signal cmd_x   : cmd_type;

   signal bank_s     : std_logic_vector(1 downto 0);
   signal row_s      : std_logic_vector(12 downto 0);
   signal col_s      : std_logic_vector(8 downto 0);
   signal addr_r     : std_logic_vector(12 downto 0);
   signal addr_x     : std_logic_vector(12 downto 0);    -- SDRAM row/column address.
   signal sd_dout_r  : std_logic_vector(15 downto 0);
   signal sd_dout_x  : std_logic_vector(15 downto 0);
   signal sd_busdir_r   : std_logic;
   signal sd_busdir_x   : std_logic;

   signal timer_r, timer_x : natural range 0 to 20000 := 0;
   signal refcnt_r, refcnt_x : natural range 0 to 7 := 0;

   signal bank_r, bank_x         : std_logic_vector(1 downto 0);
   signal cke_r, cke_x           : std_logic;
   signal sd_dqmu_r, sd_dqmu_x   : std_logic;
   signal sd_dqml_r, sd_dqml_x   : std_logic;
   signal ready_r, ready_x       : std_logic;

begin

   -- SDRAM signals.

   (sdCe_bo, sdRas_bo, sdCas_bo, sdWe_bo) <= cmd_r;   -- SDRAM operation control bits
   sdCke_o     <= cke_r;      -- SDRAM clock enable
   sdBs_o      <= bank_r;     -- SDRAM bank address
   sdAddr_o    <= addr_r;     -- SDRAM address
   sdData_io   <= sd_dout_r when sd_busdir_r = '1' else (others => 'Z');   -- SDRAM data bus.
   sdDqmh_o    <= sd_dqmu_r;  -- SDRAM high data byte enable, active low
   sdDqml_o    <= sd_dqml_r;  -- SDRAM low date byte enable, active low

   ready_o <= ready_r;

   -- Data back to host, not buffered and must be latched when done_o == '1'.
   data_o <= sdData_io;

   -- 23  22  | 21 20 19 18 17 16 15 14 13 12 11 10 09 | 08 07 06 05 04 03 02 01 00 |
   -- BS0 BS1 |        ROW (A12-A0)  8192 rows         |   COL (A8-A0)  512 cols    |
   bank_s <= addr_i(23 downto 22);
   row_s <= addr_i(21 downto 9);
   col_s <= addr_i(8 downto 0);

   -- When rw_i activates:
   -- hold_i   | active_r
   -- 0        | 0 -> 0    activate the row, issue read/write, precharge all rows when done
   -- 1        | 0 -> 1    activate the row, issue read/write, do not precharage when done
   -- 1        | 1 -> 1    issue read/write, do not precharge when done
   -- 0        | 1 -> 0    issue read/write, precharge all rows when done
   --
   -- Thus, for a "one time" read / write, hold_i should be low.  For a series of reads / writes
   -- to the same bank, hold_i should be held high for all reads / writes, but then brought
   -- low for the final read / write.


   process (
   state_r, timer_r, refcnt_r, cke_r, addr_r, sd_dout_r, sd_busdir_r, sd_dqmu_r, sd_dqml_r, ready_r,
   bank_s, row_s, col_s,
   rw_i, refresh_i, addr_i, data_i, we_i, ub_i, lb_i )
   begin

      state_x     <= state_r;       -- Stay in the same state unless changed.
      timer_x     <= timer_r;       -- Hold the cycle timer by default.
      refcnt_x    <= refcnt_r;      -- Hold the refresh timer by default.
      cke_x       <= cke_r;         -- Stay in the same clock mode unless changed.
      cmd_x       <= CMD_NOP;       -- Default to NOP unless changed.
      bank_x      <= bank_r;        -- Register the SDRAM bank.
      addr_x      <= addr_r;        -- Register the SDRAM address.
      sd_dout_x   <= sd_dout_r;     -- Register the SDRAM write data.
      sd_busdir_x <= sd_busdir_r;   -- Register the SDRAM bus tristate control.
      sd_dqmu_x   <= sd_dqmu_r;
      sd_dqml_x   <= sd_dqml_r;

      ready_x     <= ready_r;       -- Always ready unless performing initialization.
      done_o      <= '0';           -- Done tick, single cycle.

      if timer_r /= 0 then
         timer_x <= timer_r - 1;
      else

         cke_x       <= '1';
         bank_x      <= bank_s;
         addr_x      <= "0000" & col_s;   -- A10 low for rd/wr commands to suppress auto-precharge.
         sd_dqmu_x   <= '0';
         sd_dqml_x   <= '0';

         case state_r is

         when ST_INIT_WAIT =>

            -- 1. Wait 200us with DQM signals high, cmd NOP.
            -- 2. Precharge all banks.
            -- 3. Eight refresh cycles.
            -- 4. Set mode register.
            -- 5. Eight refresh cycles.

            state_x <= ST_INIT_PRECHARGE;
            timer_x <= 20000;          -- Wait 200us (20,000 cycles).
--          timer_x <= 2;              -- for simulation
            sd_dqmu_x <= '1';
            sd_dqml_x <= '1';

         when ST_INIT_PRECHARGE =>

            state_x <= ST_INIT_REFRESH1;
            refcnt_x <= 7;             -- Do 8 refresh cycles in the next state.
--          refcnt_x <= 2;             -- for simulation
            cmd_x <= CMD_PRECHARGE;
            timer_x <= 1;              -- Wait 1 cycles plus state overhead for 20ns Trp.
            addr_x(10) <= '1';         -- Precharge all banks.

         when ST_INIT_REFRESH1 =>

            if refcnt_r = 0 then
               state_x <= ST_INIT_MODE;
            else
               refcnt_x <= refcnt_r - 1;
               cmd_x <= CMD_REFRESH;
               timer_x <= 6;           -- Wait 6 cycles plus state overhead for 70ns refresh.
            end if;

         when ST_INIT_MODE =>

            state_x <= ST_INIT_REFRESH2;
            refcnt_x <= 7;             -- Do 8 refresh cycles in the next state.
--          refcnt_x <= 2;             -- for simulation
            bank_x <= "00";
            addr_x <= MODE_REG;
            cmd_x <= CMD_MODE;
            timer_x <= 1;              -- Trsc == 2 cycles after issuing MODE command.

         when ST_INIT_REFRESH2 =>

            if refcnt_r = 0 then
               state_x <= ST_IDLE;
               ready_x <= '1';
            else
               refcnt_x <= refcnt_r - 1;
               cmd_x <= CMD_REFRESH;
               timer_x <= 6;           -- Wait 6 cycles plus state overhead for 70ns refresh.
            end if;

       --
       -- Normal Operation
       --

         when ST_IDLE =>
            -- 60ns since activate when coming from PRECHARGE state.
            -- 10ns since PRECHARGE.  Trp == 20ns min.
            if rw_i = '1' then
               state_x <= ST_ACTIVATE;
               cmd_x <= CMD_ACTIVATE;
               addr_x <= row_s;        -- Set bank select and row on activate command.
            elsif refresh_i = '1' then
               state_x <= ST_REFRESH;
               cmd_x <= CMD_REFRESH;
               timer_x <= 5;           -- Wait 5 cycles plus state overhead for 70ns refresh.
            end if;

         when ST_REFRESH =>

            state_x <= ST_IDLE;
            done_o <= '1';

         when ST_ACTIVATE =>
            -- Trc (Active to Active Command Period) is 65ns min.
            -- 70ns since activate when coming from PRECHARGE -> IDLE states.
            -- 20ns since PRECHARGE.
            -- ACTIVATE command is presented to the SDRAM.  The command out of this
            -- state will be NOP for one cycle.
            state_x <= ST_RCD;
            sd_dout_x <= data_i;       -- Register any write data, even if not used.

         when ST_RCD =>
            -- 10ns since activate.
            -- Trcd == 20ns min.  The clock is 10ns, so the requirement is satisfied by this state.
            -- READ or WRITE command will be active in the next cycle.
            state_x <= ST_RW;

            if we_i = '0' then
               cmd_x <= CMD_WRITE;
               sd_busdir_x <= '1';     -- The SDRAM latches the input data with the command.
               sd_dqmu_x <= ub_i;
               sd_dqml_x <= lb_i;
            else
               cmd_x <= CMD_READ;
            end if;

         when ST_RW =>
            -- 20ns since activate.
            -- READ or WRITE command presented to SDRAM.
            state_x <= ST_RAS1;
            sd_busdir_x <= '0';

         when ST_RAS1 =>
            -- 30ns since activate.
            state_x <= ST_RAS2;

         when ST_RAS2 =>
            -- 40ns since activate.
            -- Tras (Active to precharge Command Period) 45ns min.
            -- PRECHARGE command will be active in the next cycle.
            state_x <= ST_PRECHARGE;
            cmd_x <= CMD_PRECHARGE;
            addr_x(10) <= '1';         -- Precharge all banks.

         when ST_PRECHARGE =>
            -- 50ns since activate.
            -- PRECHARGE presented to SDRAM.
            state_x <= ST_IDLE;
            done_o <= '1';             -- Read data is ready and should be latched by the host.

         end case;
      end if;
   end process;

   process (clk_100m0_i)
   begin
      if falling_edge(clk_100m0_i) then
      if reset_i = '0' then
         state_r  <= ST_INIT_WAIT;
         timer_r  <= 0;
         cmd_r    <= CMD_NOP;
         cke_r    <= '0';
         ready_r  <= '0';
      else
         state_r     <= state_x;
         timer_r     <= timer_x;
         refcnt_r    <= refcnt_x;
         cke_r       <= cke_x;         -- CKE to SDRAM.
         cmd_r       <= cmd_x;         -- Command to SDRAM.
         bank_r      <= bank_x;        -- Bank to SDRAM.
         addr_r      <= addr_x;        -- Address to SDRAM.
         sd_dout_r   <= sd_dout_x;     -- Data to SDRAM.
         sd_busdir_r <= sd_busdir_x;   -- SDRAM bus direction.
         sd_dqmu_r   <= sd_dqmu_x;     -- Upper byte enable to SDRAM.
         sd_dqml_r   <= sd_dqml_x;     -- Lower byte enable to SDRAM.
         ready_r     <= ready_x;

      end if;
      end if;
   end process;

end architecture;