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
-- SDRAM/RAM upload/download via JTAG.
-- See userinstr_jtag.vhd for details of operation.
--------------------------------------------------------------------


library IEEE, XESS;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use XESS.CommonPckg.all;
use XESS.SdramCntlPckg.all;
use XESS.ClkgenPckg.all;
use XESS.HostIoPckg.all;
use work.XessBoardPckg.all;


entity ramintfc_jtag is
  generic(
    ID_G          : std_logic_vector := "00000011";  -- The ID this module responds to.
    BASE_FREQ_G   : real    := BASE_FREQ_C;    -- base frequency in MHz
    CLK_MUL_G     : natural := 25;      -- multiplier for base frequency
    CLK_DIV_G     : natural := 3;       -- divider for base frequency
    PIPE_EN_G     : boolean := false
    );
  port(
    fpgaClk_i  : in    std_logic;       -- main clock input from external clock source
    sdClk_o    : out   std_logic;       -- clock to SDRAM
    sdClkFb_i  : in    std_logic;       -- SDRAM clock comes back in
    sdRas_bo   : out   std_logic;       -- SDRAM row address strobe.
    sdCas_bo   : out   std_logic;       -- SDRAM column address strobe.
    sdWe_bo    : out   std_logic;       -- SDRAM write enable.
    sdBs_o     : out   std_logic;       -- SDRAM bank address.
    sdAddr_o   : out   std_logic_vector(SDRAM_SADDR_WIDTH_C-1 downto 0);  -- SDRAM row/column address.
    sdData_io  : inout std_logic_vector(SDRAM_DATA_WIDTH_C-1 downto 0)  -- Data to/from SDRAM.
    );
end entity;


architecture arch of ramintfc_jtag is

  constant FREQ_G : real      := (BASE_FREQ_G * real(CLK_MUL_G)) / real(CLK_DIV_G);
  signal clk_s    : std_logic;
  signal reset_s  : std_logic := YES;

  -- signals to/from the SDRAM controller
  signal rd_s           : std_logic;    -- host read enable
  signal wr_s           : std_logic;    -- host write enable
  signal earlyOpBegun_s : std_logic;  -- true when current read/write has begun.
  signal done_s         : std_logic;    -- true when current read/write is done
  signal addr_s         : std_logic_vector(SDRAM_HADDR_WIDTH_C-1 downto 0);  -- host address
  signal dataToRam_s    : std_logic_vector(SDRAM_DATA_WIDTH_C-1 downto 0);  -- data input from host
  signal dataFromRam_s  : std_logic_vector(SDRAM_DATA_WIDTH_C-1 downto 0);  -- host data output to host
  
begin

  -- Generate a 100 MHz clock from the 12 MHz input clock.
  u0 : Clkgen
    generic map (BASE_FREQ_G => BASE_FREQ_G, CLK_MUL_G => CLK_MUL_G, CLK_DIV_G => CLK_DIV_G)
    port map(I               => fpgaClk_i, O => sdClk_o);

  clk_s <= sdClkFb_i;  -- main clock is SDRAM clock fed back into FPGA

  u3 : HostIoToRam
    generic map(
      ID_G     => ID_G,   -- The ID this module responds to.
      SIMPLE_G => true,  -- If true, include BscanToHostIo module in this module.
      SYNC_G   => true    -- If true, sync this module with the FPGA app. logic clock domain.
      )
    port map(
      reset_i        => reset_s,        -- Active-high reset signal.
      clk_i          => clk_s,          -- Clock from FPGA application logic. 
      addr_o         => addr_s,         -- Address to memory.
      wr_o           => wr_s,           -- Write data to memory when high.
      dataFromHost_o => dataToRam_s,    -- Data written to memory.
      rd_o           => rd_s,           -- Read data from memory when high.
      dataToHost_i   => dataFromRam_s,  -- Data read from memory.
      opBegun_i      => earlyOpBegun_s, -- True when R/W operation has initiated.
      done_i         => done_s  -- True when memory read/write operation is done.
      );

  -- SDRAM controller
  u4 : SdramCntl
    generic map(
      FREQ_G        => FREQ_G,
      PIPE_EN_G     => PIPE_EN_G
      )
    port map(
      clk_i          => clk_s,  -- master clock from external clock source (unbuffered)
      lock_i         => YES,   -- no DLLs, so frequency is always locked
      rst_i          => reset_s,        -- reset
      rd_i           => rd_s,  -- host-side SDRAM read control from memory tester
      wr_i           => wr_s,  -- host-side SDRAM write control from memory tester
      done_o         => done_s,  -- SDRAM memory read/write done indicator
      earlyOpBegun_o => earlyOpBegun_s,  -- SDRAM memory read/write done indicator
      addr_i         => addr_s,  -- host-side address from memory tester to SDRAM
      data_i         => dataToRam_s,  -- test data pattern from memory tester to SDRAM
      data_o         => dataFromRam_s,  -- SDRAM data output to memory tester
      sdRas_bo       => sdRas_bo,       -- SDRAM RAS
      sdCas_bo       => sdCas_bo,       -- SDRAM CAS
      sdWe_bo        => sdWe_bo,        -- SDRAM write-enable
      sdBs_o(0)      => sdBs_o,         -- SDRAM bank address
      sdBs_o(1)      => open,
      sdAddr_o       => sdAddr_o,       -- SDRAM address
      sdData_io      => sdData_io       -- data to/from SDRAM
      );

  -- Generate reset signal for SDRAM controller.
  process(clk_s)
    variable resetCnt_v : natural range 0 to 15 := 10;
  begin
    if rising_edge(clk_s) then
      reset_s <= YES;
      if resetCnt_v = 0 then
        reset_s <= NO;
      else
        resetCnt_v := resetCnt_v - 1;
      end if;
    end if;
  end process;

end architecture;
