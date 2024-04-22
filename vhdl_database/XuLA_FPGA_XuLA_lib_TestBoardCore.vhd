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
-- Module for testing board functionality.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use WORK.CommonPckg.all;

package TestBoardCorePckg is

  component TestBoardCore is
    generic(
      FREQ_G        : real    := 100.0;  -- frequency of operation in MHz
      PIPE_EN_G     : boolean := true;  -- enable fast, pipelined SDRAM operation
      DATA_WIDTH_G  : natural := 16;    -- SDRAM data width
      SADDR_WIDTH_G : natural := 13;    -- SDRAM row/col address width
      NROWS_G       : natural := 4096;  -- number of rows in the SDRAM
      NCOLS_G       : natural := 512;   -- number of columns in each SDRAM row
      -- beginning and ending addresses for the entire SDRAM
      BEG_ADDR_G    : natural := 16#00_0000#;
      END_ADDR_G    : natural := 16#7F_FFFF#;
      -- beginning and ending address for the memory tester
      BEG_TEST_G    : natural := 16#00_0000#;
      END_TEST_G    : natural := 16#7F_FFFF#
      );
    port(
      rst_i      : in    std_logic := NO;
      clk_i      : in    std_logic;  -- main clock input from external clock source
      do_again_i : in    std_logic := NO;
      progress_o : out   std_logic_vector(1 downto 0);  -- test progress_o indicator
      err_o      : out   std_logic;  -- true if an error was found during test
      sdCke_o    : out   std_logic;     -- Clock-enable to SDRAM.
      sdCe_bo    : out   std_logic;     -- Chip-select to SDRAM.
      sdRas_bo   : out   std_logic;     -- SDRAM row address strobe.
      sdCas_bo   : out   std_logic;     -- SDRAM column address strobe.
      sdWe_bo    : out   std_logic;     -- SDRAM write enable.
      sdBs_o     : out   std_logic_vector(1 downto 0);  -- SDRAM bank address.
      sdAddr_o   : out   std_logic_vector(SADDR_WIDTH_G-1 downto 0);  -- SDRAM row/column address.
      sdData_io  : inout std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- Data to/from SDRAM.
      sdDqmh_o   : out   std_logic;  -- Enable upper-byte of SDRAM databus if true.
      sdDqml_o   : out   std_logic  -- Enable lower-byte of SDRAM databus if true.
      );
  end component;

end package;




library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.CommonPckg.all;
use WORK.MemTestPckg.all;
use WORK.SdramCntlPckg.all;

entity TestBoardCore is
  generic(
    FREQ_G        : real    := 100.0;   -- frequency of operation in MHz
    PIPE_EN_G     : boolean := true;  -- enable fast, pipelined SDRAM operation
    DATA_WIDTH_G  : natural := 16;      -- SDRAM data width
    SADDR_WIDTH_G : natural := 13;      -- SDRAM row/col address width
    NROWS_G       : natural := 4096;    -- number of rows in the SDRAM
    NCOLS_G       : natural := 512;     -- number of columns in each SDRAM row
    -- beginning and ending addresses for the entire SDRAM
    BEG_ADDR_G    : natural := 16#00_0000#;
    END_ADDR_G    : natural := 16#7F_FFFF#;
    -- beginning and ending address for the memory tester
    BEG_TEST_G    : natural := 16#00_0000#;
    END_TEST_G    : natural := 16#7F_FFFF#
    );
  port(
    rst_i      : in    std_logic := NO;
    clk_i      : in    std_logic;  -- main clock input from external clock source
    do_again_i : in    std_logic := NO;
    progress_o : out   std_logic_vector(1 downto 0);  -- test progress_o indicator
    err_o      : out   std_logic;  -- true if an error was found during test
    sdCke_o    : out   std_logic;       -- Clock-enable to SDRAM.
    sdCe_bo    : out   std_logic;       -- Chip-select to SDRAM.
    sdRas_bo   : out   std_logic;       -- SDRAM row address strobe.
    sdCas_bo   : out   std_logic;       -- SDRAM column address strobe.
    sdWe_bo    : out   std_logic;       -- SDRAM write enable.
    sdBs_o     : out   std_logic_vector(1 downto 0);  -- SDRAM bank address.
    sdAddr_o   : out   std_logic_vector(SADDR_WIDTH_G-1 downto 0);  -- SDRAM row/column address.
    sdData_io  : inout std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- Data to/from SDRAM.
    sdDqmh_o   : out   std_logic;  -- Enable upper-byte of SDRAM databus if true.
    sdDqml_o   : out   std_logic  -- Enable lower-byte of SDRAM databus if true.
    );
end entity;

architecture arch of TestBoardCore is
  constant HADDR_WIDTH_C : natural := Log2(END_ADDR_G-BEG_ADDR_G+1);

  -- signals that go through the SDRAM host-side interface
  signal begun_s      : std_logic;      -- SDRAM operation started indicator
  signal earlyBegun_s : std_logic;      -- SDRAM operation started indicator
  signal done_s       : std_logic;      -- SDRAM operation complete indicator
  signal rdDone_s     : std_logic;      -- SDRAM operation complete indicator
  signal hAddr_s      : std_logic_vector(HADDR_WIDTH_C-1 downto 0);  -- host address bus
  signal hDIn_s       : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- host-side data to SDRAM
  signal hDOut_s      : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- host-side data from SDRAM
  signal rd_s         : std_logic;      -- host-side read control signal
  signal wr_s         : std_logic;      -- host-side write control signal
  signal rdPending_s  : std_logic;  -- read operation pending in SDRAM pipeline

begin

  ------------------------------------------------------------------------
  -- Instantiate a memory tester that supports memory pipelining if that option is enabled
  ------------------------------------------------------------------------
  gen_fast_memtest : if PIPE_EN_G generate
    fast_memtest : MemTest
      generic map(
        PIPE_EN_G    => PIPE_EN_G,
        DATA_WIDTH_G => DATA_WIDTH_G,
        ADDR_WIDTH_G => HADDR_WIDTH_C,
        BEG_TEST_G   => BEG_TEST_G,
        END_TEST_G   => END_TEST_G
        )
      port map(
        clk_i       => clk_i,           -- master internal clock
        rst_i       => rst_i,           -- reset
        doAgain_i   => do_again_i,      -- run the test once
        begun_i     => earlyBegun_s,    -- SDRAM controller operation started
        done_i      => rdDone_s,        -- SDRAM controller operation complete
        dIn_i       => hDOut_s,  -- host-side data from SDRAM goes to memory tester
        rdPending_i => rdPending_s,  -- tell the memory tester if the SDRAM has pending reads
        rd_o        => rd_s,  -- host-side SDRAM read control from memory tester
        wr_o        => wr_s,  -- host-side SDRAM write control from memory tester
        addr_o      => hAddr_s,         -- host-side address from memory tester
        dOut_o      => hDIn_s,  -- host-side data to SDRAM comes from memory tester
        progress_o  => progress_o,      -- current phase of memory test
        err_o       => err_o            -- memory test error flag
        );
  end generate;

  ------------------------------------------------------------------------
  -- Instantiate memory tester without memory pipelining if that option is disabled
  ------------------------------------------------------------------------
  gen_slow_memtest : if not PIPE_EN_G generate
    slow_memtest : MemTest
      generic map(
        PIPE_EN_G    => PIPE_EN_G,
        DATA_WIDTH_G => DATA_WIDTH_G,
        ADDR_WIDTH_G => HADDR_WIDTH_C,
        BEG_TEST_G   => BEG_TEST_G,
        END_TEST_G   => END_TEST_G
        )
      port map(
        clk_i       => clk_i,           -- master internal clock
        rst_i       => rst_i,           -- reset
        doAgain_i   => do_again_i,      -- run the test once
        begun_i     => begun_s,         -- SDRAM controller operation started
        done_i      => done_s,          -- SDRAM controller operation complete
        dIn_i       => hDOut_s,  -- host-side data from SDRAM goes to memory tester
        rdPending_i => rdPending_s,  -- tell the memory tester if the SDRAM has pending reads
        rd_o        => rd_s,  -- host-side SDRAM read control from memory tester
        wr_o        => wr_s,  -- host-side SDRAM write control from memory tester
        addr_o      => hAddr_s,         -- host-side address from memory tester
        dOut_o      => hDIn_s,  -- host-side data to SDRAM comes from memory tester
        progress_o  => progress_o,      -- current phase of memory test
        err_o       => err_o            -- memory test error flag
        );
  end generate;

  ------------------------------------------------------------------------
  -- Instantiate the SDRAM controller that connects to the memory tester
  -- module and interfaces to the external SDRAM chip.
  ------------------------------------------------------------------------
  u1 : SdramCntl
    generic map(
      FREQ_G        => FREQ_G,
      IN_PHASE_G    => true,
      PIPE_EN_G     => PIPE_EN_G,
      MAX_NOP_G     => 10000,
      DATA_WIDTH_G  => DATA_WIDTH_G,
      NROWS_G       => NROWS_G,
      NCOLS_G       => NCOLS_G,
      HADDR_WIDTH_G => HADDR_WIDTH_C,
      SADDR_WIDTH_G => SADDR_WIDTH_G
      )
    port map(
      clk_i          => clk_i,  -- master clock from external clock source (unbuffered)
      lock_i         => YES,   -- no DLLs, so frequency is always locked
      rst_i          => rst_i,          -- reset
      rd_i           => rd_s,  -- host-side SDRAM read control from memory tester
      wr_i           => wr_s,  -- host-side SDRAM write control from memory tester
      earlyOpBegun_o => earlyBegun_s,  -- early indicator that memory operation has begun
      opBegun_o      => begun_s,  -- indicates memory read/write has begun
      rdPending_o    => rdPending_s,  -- read operation to SDRAM is in progress_o
      done_o         => done_s,  -- SDRAM memory read/write done indicator
      rdDone_o       => rdDone_s,  -- indicates SDRAM memory read operation is done
      addr_i         => hAddr_s,  -- host-side address from memory tester to SDRAM
      data_i         => hDIn_s,  -- test data pattern from memory tester to SDRAM
      data_o         => hDOut_s,        -- SDRAM data output to memory tester
      status_o       => open,  -- SDRAM controller state (for diagnostics)
      sdCke_o        => sdCke_o,
      sdCe_bo        => sdCe_bo,
      sdRas_bo       => sdRas_bo,       -- SDRAM RAS
      sdCas_bo       => sdCas_bo,       -- SDRAM CAS
      sdWe_bo        => sdWe_bo,        -- SDRAM write-enable
      sdBs_o         => sdBs_o,         -- SDRAM bank address
      sdAddr_o       => sdAddr_o,       -- SDRAM address
      sdData_io      => sdData_io,      -- data to/from SDRAM
      sdDqmh_o       => sdDqmh_o,  -- upper-byte enable for SDRAM data bus.
      sdDqml_o       => sdDqml_o  -- lower-byte enable for SDRAM data bus.
      );

end architecture;
