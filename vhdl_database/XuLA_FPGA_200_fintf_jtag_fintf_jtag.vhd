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
-- ©1997-2010 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Flash upload/download via JTAG.
-- See UserInstrJtag.vhd and FlashCntl.vhd for details of operation.
--------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use WORK.CommonPckg.all;
use WORK.UserInstrJtagPckg.all;
use WORK.FlashCntlPckg.all;
use work.ClkgenPckg.all;

library UNISIM;
use UNISIM.VComponents.all;


entity fintf_jtag is
  generic(
    BASE_FREQ_G  : real    := 12.0;       -- base frequency in MHz.
    CLK_MUL_G    : natural := 25;         -- multiplier for base frequency.
    CLK_DIV_G    : natural := 3;          -- divider for base frequency.
    DATA_WIDTH_G : natural := 8;          -- data width of Flash chip.
    ADDR_WIDTH_G : natural := 24;         -- address width of Flash chip.
    BLOCK_SIZE_G : natural := 256  -- size of RAM block that buffers data programmed into Flash.
    );
  port(
    fpgaClk_i : in    std_logic;  -- main clock input from external clock source.
    sdBs_o    : out   std_logic;  -- SDRAM bank-select and serial Flash clock share this pin.
    sdAddr_o  : inout std_logic_vector(10 downto 0) -- SDRAM address pins shared with serial Flash MOSI, MISO, CS pins.
    );
end entity;


architecture arch of fintf_jtag is

  constant BLOCK_ADDR_WIDTH_G : natural := Log2(BLOCK_SIZE_G);  -- addr width of block RAM

  signal reset : std_logic;
  signal clk   : std_logic;

  -- signals to/from the JTAG BSCAN module
  signal bscan_drck   : std_logic;      -- JTAG clock from BSCAN module
  signal bscan_reset  : std_logic;      -- true when BSCAN module is reset
  signal bscan_sel    : std_logic;      -- true when BSCAN module selected
  signal bscan_shift  : std_logic;  -- true when TDI & TDO are shifting data
  signal bscan_update : std_logic;      -- BSCAN TAP is in update-dr state
  signal bscan_tdi    : std_logic;      -- data received on TDI pin
  signal bscan_tdo    : std_logic;      -- scan data sent to TDO pin

  -- Signals to/from the FSM that sequences the reads/writes for the Flash operations.
  signal h_rd          : std_logic;     -- read enable
  signal h_rd_continue : std_logic;     -- enable contiguous reads
  signal h_wr          : std_logic;     -- port A write enable
  signal h_erase       : std_logic;     -- flash chip erase enable
  signal h_blk_pgm     : std_logic;     -- block program enable
  signal h_begun       : std_logic;     -- true when flash operation begun
  signal begun         : std_logic;  -- true when flash or block RAM operation has begun
  signal h_busy        : std_logic;     -- true when operation in progress
  signal h_done        : std_logic;     -- true when flash operation done
  signal done          : std_logic;  -- true when flash or block RAM operation is done
  signal h_di          : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data from JTAG instr. unit
  signal h_do          : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data output from flash
  signal h_addr        : std_logic_vector(ADDR_WIDTH_G-1 downto 0);  -- address for read/write

begin
  
  u0 : ClkGen
    generic map (BASE_FREQ_G => BASE_FREQ_G, CLK_MUL_G => CLK_MUL_G, CLK_DIV_G => CLK_DIV_G)
    port map(I             => fpgaClk_i, O => clk);

  -- Generate a reset signal for everything.  
  process(clk)
    constant reset_dly_c : natural                        := 10;
    variable rst_cntr    : natural range 0 to reset_dly_c := 0;
  begin
    if rising_edge(clk) then
      reset <= NO;
      if rst_cntr < reset_dly_c then
        reset    <= YES;
        rst_cntr := rst_cntr + 1;
      end if;
    end if;
  end process;

  -- boundary-scan interface to FPGA JTAG port
  u_bscan : BSCAN_SPARTAN3
    port map(
      DRCK1  => bscan_drck,             -- JTAG clock
      RESET  => bscan_reset,            -- true when JTAG TAP FSM is reset
      SEL1   => bscan_sel,  -- USER1 instruction enables execution of the RAM interface
      SHIFT  => bscan_shift,  -- true when JTAG TAP FSM is in the SHIFT-DR state
      TDI    => bscan_tdi,  -- data bits from the PC arrive through here
      UPDATE => bscan_update,
      TDO1   => bscan_tdo,  -- LSbit of the tdo register outputs onto TDO pin and to the PC
      TDO2   => '0'         -- not using this input, so just hold it low
      );

  -- JTAG interface
  u1 : UserInstrJtag
    generic map(
      FPGA_TYPE_G          => SPARTAN3_G,
      ENABLE_FLASH_INTFC_G => true,
      DATA_WIDTH_G         => DATA_WIDTH_G,
      ADDR_WIDTH_G         => ADDR_WIDTH_G,
      BLOCK_ADDR_WIDTH_G   => BLOCK_ADDR_WIDTH_G
      )
    port map(
      clk           => clk,
      bscan_drck    => bscan_drck,
      bscan_reset   => bscan_reset,
      bscan_sel     => bscan_sel,
      bscan_shift   => bscan_shift,
      bscan_update  => bscan_update,
      bscan_tdi     => bscan_tdi,
      bscan_tdo     => bscan_tdo,
      rd            => h_rd,
      rd_continue   => h_rd_continue,
      wr            => h_wr,
      erase         => h_erase,
      blk_pgm       => h_blk_pgm,
      begun         => begun,
      done          => done,
      addr          => h_addr,
      din           => h_do,
      dout          => h_di,
      test_progress => "11",
      test_failed   => NO
      );

  done  <= h_wr or h_done;
  begun <= h_wr or h_begun;

  u2 : FlashCntl
    generic map(
      DATA_WIDTH_G => DATA_WIDTH_G,
      ADDR_WIDTH_G => ADDR_WIDTH_G,
      BLOCK_SIZE_G => BLOCK_SIZE_G
      )
    port map(
      reset         => reset,
      clk           => clk,
      h_rd          => h_rd,
      h_rd_continue => h_rd_continue,
      h_wr          => h_wr,
      h_erase       => h_erase,
      h_blk_pgm     => h_blk_pgm,
      h_addr        => h_addr,
      h_di          => h_di,
      h_do          => h_do,
      h_begun       => h_begun,
      h_busy        => h_busy,
      h_done        => h_done,
      f_cs_n        => sdAddr_o(7),
      sclk          => sdBs_o,
      si            => sdAddr_o(10),  -- flash serial out goes to serial input of flash controller
      so            => sdAddr_o(2)  -- flash serial input is driven by serial output of flash controller
      );

end architecture;
