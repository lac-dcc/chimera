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


library IEEE, XESS;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use XESS.CommonPckg.all;
use XESS.HostIoPckg.all;
use XESS.TestBoardCorePckg.all;
use XESS.ClkgenPckg.all;
use XESS.SyncToClockPckg.all;
use work.XessBoardPckg.all;

entity test_board_jtag is
  generic(
    ID_G        : std_logic_vector := "00000001";  -- The ID this module responds to.
    BASE_FREQ_G : real             := BASE_FREQ_C;        -- Base frequency in MHz.
    CLK_MUL_G   : natural          := 25;  -- Multiplier for base frequency.
    CLK_DIV_G   : natural          := 3   -- Divider for base frequency.
    );
  port(
    fpgaClk_i : in    std_logic;  -- Main clock input from external clock source.
    sdClk_o   : out   std_logic;        -- Clock to SDRAM.
    sdClkFb_i : in    std_logic;        -- SDRAM clock comes back in.
    sdRas_bo  : out   std_logic;        -- SDRAM RAS.
    sdCas_bo  : out   std_logic;        -- SDRAM CAS.
    sdWe_bo   : out   std_logic;        -- SDRAM write-enable.
    sdBs_o    : out   std_logic;        -- SDRAM bank-address.
    sdAddr_o  : out   std_logic_vector(SDRAM_SADDR_WIDTH_C-1 downto 0);  -- SDRAM address bus.
    sdData_io : inout std_logic_vector(SDRAM_DATA_WIDTH_C-1 downto 0)  -- Data bus to/from SDRAM.
    );
end entity;


architecture arch of test_board_jtag is

  constant FREQ_C        : real := (BASE_FREQ_G * real(CLK_MUL_G)) / real(CLK_DIV_G);
  constant SIGNATURE_C   : std_logic_vector(31 downto 0) := x"A50001A5";
  signal clk_s           : std_logic;
  signal reset_s         : std_logic;
  signal syncedReset_s   : std_logic;
  signal test_ctrl_s     : std_logic_vector(0 downto 0);
  signal test_progress_s : std_logic_vector(1 downto 0);  -- Progress of the test.
  signal test_failed_s   : std_logic;  -- True if an error was found during the test.
  signal test_status_s   : std_logic_vector(34 downto 0);
begin

  u0 : Clkgen
    generic map (BASE_FREQ_G => BASE_FREQ_G, CLK_MUL_G => CLK_MUL_G, CLK_DIV_G => CLK_DIV_G)
    port map(I               => fpgaClk_i, clkToLogic_o => sdClk_o);

  clk_s <= sdClkFb_i;  -- Main clock is SDRAM clock fed back into FPGA.

  u1 : HostIoToDut
    generic map(SIMPLE_G => true, ID_G => ID_G)
    port map(
      vectorFromDut_i => test_status_s,
      vectorToDut_o   => test_ctrl_s
      );
  reset_s       <= test_ctrl_s(0);
  test_status_s <= SIGNATURE_C & test_failed_s & test_progress_s;

  -- Sync reset signal from HostIoToDut to TestBoardCore.      
  u2 : SyncToClock
    port map (
      clk_i      => clk_s,
      unsynced_i => reset_s,
      synced_o   => syncedReset_s
      );

  -- Board diagnostic unit.
  u3 : TestBoardCore
    generic map(
      FREQ_G    => FREQ_C,
      PIPE_EN_G => true
      )
    port map(
      rst_i      => syncedReset_s,
      do_again_i => NO,
      clk_i      => clk_s,
      progress_o => test_progress_s,
      err_o      => test_failed_s,
      sdCke_o    => open,
      sdCe_bo    => open,
      sdRas_bo   => sdRas_bo,
      sdCas_bo   => sdCas_bo,
      sdWe_bo    => sdWe_bo,
      sdBs_o(0)  => sdBs_o,
      sdBs_o(1)  => open,
      sdAddr_o   => sdAddr_o,
      sdData_io  => sdData_io,
      sdDqmh_o   => open,
      sdDqml_o   => open
      );

end architecture;
