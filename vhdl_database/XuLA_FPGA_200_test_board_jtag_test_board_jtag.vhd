----------------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
-- 02111-1307, USA.
--
-- ©1997-2012 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Test board via JTAG.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.CommonPckg.all;
use work.UserInstrJtagPckg.all;
use work.TestBoardCorePckg.all;
use work.ClkgenPckg.all;

library UNISIM;
use UNISIM.VComponents.all;

entity test_board_jtag is
  generic(
    BASE_FREQ_G   : real    := 12.0;    -- base frequency in MHz
    CLK_MUL_G     : natural := 25;      -- multiplier for base frequency
    CLK_DIV_G     : natural := 3;       -- divider for base frequency
    PIPE_EN_G     : boolean := true;
    DATA_WIDTH_G  : natural := 16;      -- width of data
    HADDR_WIDTH_G : natural := 23;      -- host-side address width
    SADDR_WIDTH_G : natural := 12;      -- SDRAM address bus width
    NROWS_G       : natural := 4096;    -- number of rows in each SDRAM bank
    NCOLS_G       : natural := 512;     -- number of words in each row
    -- beginning and ending addresses for the entire SDRAM
    BEG_ADDR_G    : natural := 16#00_0000#;
    END_ADDR_G    : natural := 16#7F_FFFF#;
    -- beginning and ending address for the memory tester
    BEG_TEST_G    : natural := 16#00_0000#;
    END_TEST_G    : natural := 16#3F_FFFF#  -- Board will pass with this.
    );
  port(
    fpgaClk_i : in    std_logic;  -- main clock input from external clock source
    sdClk_o   : out   std_logic;        -- clock to SDRAM
    sdClkFb_i : in    std_logic;        -- SDRAM clock comes back in
    sdRas_bo  : out   std_logic;        -- SDRAM row address strobe.
    sdCas_bo  : out   std_logic;        -- SDRAM column address strobe.
    sdWe_bo   : out   std_logic;        -- SDRAM write enable.
    sdBs_o    : out   std_logic;        -- SDRAM bank address.
    sdAddr_o  : out   std_logic_vector(SADDR_WIDTH_G-1 downto 0);  -- SDRAM row/column address.
    sdData_io : inout std_logic_vector(DATA_WIDTH_G-1 downto 0)  -- Data to/from SDRAM.
    );
end entity;


architecture arch of test_board_jtag is

  constant FREQ_G : real := (BASE_FREQ_G * real(CLK_MUL_G)) / real(CLK_DIV_G);
  signal clk_s    : std_logic;

  -- signals to/from the JTAG BSCAN module
  signal bscan_drck   : std_logic;      -- JTAG clock from BSCAN module
  signal bscan_reset  : std_logic;      -- true when BSCAN module is reset
  signal bscan_sel    : std_logic;      -- true when BSCAN module selected
  signal bscan_shift  : std_logic;  -- true when TDI & TDO are shifting data
  signal bscan_update : std_logic;      -- BSCAN TAP is in update-dr state
  signal bscan_tdi    : std_logic;      -- data received on TDI pin
  signal bscan_tdo    : std_logic;      -- scan data sent to TDO pin

  signal run_test_s      : std_logic;
  signal reset_s         : std_logic;
  signal test_progress_s : std_logic_vector(1 downto 0);  -- progress of the test
  signal test_failed_s   : std_logic;  -- true if an error was found during the test
begin

  -- Generate 100 MHz clock from 12 MHz input clock.
  u0 : Clkgen
    generic map (BASE_FREQ_G => BASE_FREQ_G, CLK_MUL_G => CLK_MUL_G, CLK_DIV_G => CLK_DIV_G)
    port map(I               => fpgaClk_i, O => sdClk_o);

  clk_s <= sdClkFb_i;  -- main clock is SDRAM clock fed back into FPGA

  -- Boundary-scan interface to FPGA JTAG port.
  u_bscan : BSCAN_SPARTAN3
    port map(
      DRCK1 => bscan_drck,              -- JTAG clock
      RESET => bscan_reset,             -- true when JTAG TAP FSM is reset
      SEL1  => bscan_sel,  -- USER1 instruction enables execution of the RAM interface
      SHIFT => bscan_shift,  -- true when JTAG TAP FSM is in the SHIFT-DR state
      TDI   => bscan_tdi,  -- data bits from the PC arrive through here
      TDO1  => bscan_tdo,  -- LSbit of the tdo register outputs onto TDO pin and to the PC
      TDO2  => '0'         -- not using this input, so just hold it low
      );

  -- JTAG interface
  u2 : UserinstrJtag
    generic map(
      ENABLE_TEST_INTFC_G => true,
      DATA_WIDTH_G        => DATA_WIDTH_G
      )
    port map(
      clk           => clk_s,
      bscan_drck    => bscan_drck,
      bscan_reset   => bscan_reset,
      bscan_sel     => bscan_sel,
      bscan_shift   => bscan_shift,
      bscan_update  => bscan_update,
      bscan_tdi     => bscan_tdi,
      bscan_tdo     => bscan_tdo,
      begun         => YES,                 -- don't care
      done          => YES,                 -- don't care
      din           => "0000000000000000",  -- don't care
      run_test      => run_test_s,
      test_progress => test_progress_s,
      test_failed   => test_failed_s
      );

  reset_s <= not run_test_s;

  -- board diagnostic unit
  u3 : TestBoardCore
    generic map(
      FREQ_G        => FREQ_G,
      PIPE_EN_G     => PIPE_EN_G,
      DATA_WIDTH_G  => DATA_WIDTH_G,
      SADDR_WIDTH_G => SADDR_WIDTH_G,
      NROWS_G       => NROWS_G,
      NCOLS_G       => NCOLS_G,
      BEG_ADDR_G    => BEG_ADDR_G,
      END_ADDR_G    => END_ADDR_G,
      BEG_TEST_G    => BEG_TEST_G,
      END_TEST_G    => END_TEST_G
      )
    port map(
      rst_i      => reset_s,
      do_again_i => NO,
      clk_i      => clk_s,
      progress_o => test_progress_s,
      err_o      => test_failed_s,
      sdRas_bo   => sdRas_bo,           -- SDRAM RAS
      sdCas_bo   => sdCas_bo,           -- SDRAM CAS
      sdWe_bo    => sdWe_bo,            -- SDRAM write-enable
      sdBs_o(0)  => sdBs_o,             -- SDRAM bank address
      sdBs_o(1)  => open,
      sdAddr_o   => sdAddr_o,           -- SDRAM address
      sdData_io  => sdData_io           -- data to/from SDRAM
      );

end architecture;

