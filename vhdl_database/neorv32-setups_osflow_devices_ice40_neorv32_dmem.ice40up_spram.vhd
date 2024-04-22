-- #################################################################################################
-- # << NEORV32 - Processor-Internal DMEM for Lattice iCE40 UltraPlus >>                           #
-- # ********************************************************************************************* #
-- # Memory has a physical size of 64kb (2 x SPRAMs).                                              #
-- # Logical size DMEM_SIZE must be less or equal.                                                 #
-- # ********************************************************************************************* #
-- # BSD 3-Clause License                                                                          #
-- #                                                                                               #
-- # Copyright (c) 2023, Stephan Nolting. All rights reserved.                                     #
-- #                                                                                               #
-- # Redistribution and use in source and binary forms, with or without modification, are          #
-- # permitted provided that the following conditions are met:                                     #
-- #                                                                                               #
-- # 1. Redistributions of source code must retain the above copyright notice, this list of        #
-- #    conditions and the following disclaimer.                                                   #
-- #                                                                                               #
-- # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
-- #    conditions and the following disclaimer in the documentation and/or other materials        #
-- #    provided with the distribution.                                                            #
-- #                                                                                               #
-- # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
-- #    endorse or promote products derived from this software without specific prior written      #
-- #    permission.                                                                                #
-- #                                                                                               #
-- # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
-- # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
-- # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
-- # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
-- # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
-- # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
-- # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
-- # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
-- # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
-- # ********************************************************************************************* #
-- # The NEORV32 Processor - https://github.com/stnolting/neorv32              (c) Stephan Nolting #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

library iCE40;
use iCE40.components.all;

architecture neorv32_dmem_rtl of neorv32_dmem is

  -- advanced configuration --------------------------------------------------------------------------------
  constant spram_sleep_mode_en_c : boolean := false; -- put DMEM into sleep mode when idle (for low power)
  -- -------------------------------------------------------------------------------------------------------

  -- IO space: module base address --
  constant hi_abb_c : natural := 31; -- high address boundary bit
  constant lo_abb_c : natural := index_size_f(DMEM_SIZE); -- low address boundary bit

  -- local signals --
  signal mem_cs : std_ulogic;
  signal rdata  : std_ulogic_vector(31 downto 0);
  signal rden   : std_ulogic;

  -- SPRAM signals --
  signal spram_clk   : std_logic;
  signal spram_addr  : std_logic_vector(13 downto 0);
  signal spram_di_lo : std_logic_vector(15 downto 0);
  signal spram_di_hi : std_logic_vector(15 downto 0);
  signal spram_do_lo : std_logic_vector(15 downto 0);
  signal spram_do_hi : std_logic_vector(15 downto 0);
  signal spram_be_lo : std_logic_vector(03 downto 0);
  signal spram_be_hi : std_logic_vector(03 downto 0);
  signal spram_we    : std_logic;
  signal spram_pwr_n : std_logic;
  signal spram_cs    : std_logic;

begin

  -- Sanity Checks --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  assert false report "NEORV32 PROCESSOR CONFIG NOTE: Using iCE40up SPRAM-based DMEM." severity note;
  assert not (DMEM_SIZE /= 64*1024) report "NEORV32 PROCESSOR CONFIG NOTE: DMEM SPRAM has a fixed physical size of 64kB." severity note;


  -- Access Control -------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  mem_cs <= bus_req_i.stb;


  -- Memory Access --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  imem_spram_lo_inst : SB_SPRAM256KA
  port map (
    ADDRESS    => spram_addr,  -- I
    DATAIN     => spram_di_lo, -- I
    MASKWREN   => spram_be_lo, -- I
    WREN       => spram_we,    -- I
    CHIPSELECT => spram_cs,    -- I
    CLOCK      => spram_clk,   -- I
    STANDBY    => '0',         -- I
    SLEEP      => spram_pwr_n, -- I
    POWEROFF   => '1',         -- I
    DATAOUT    => spram_do_lo  -- O
  );

  imem_spram_hi_inst : SB_SPRAM256KA
  port map (
    ADDRESS    => spram_addr,  -- I
    DATAIN     => spram_di_hi, -- I
    MASKWREN   => spram_be_hi, -- I
    WREN       => spram_we,    -- I
    CHIPSELECT => spram_cs,    -- I
    CLOCK      => spram_clk,   -- I
    STANDBY    => '0',         -- I
    SLEEP      => spram_pwr_n, -- I
    POWEROFF   => '1',         -- I
    DATAOUT    => spram_do_hi  -- O
  );

  -- access logic and signal type conversion --
  spram_clk   <= std_logic(clk_i);
  spram_addr  <= std_logic_vector(bus_req_i.addr(13+2 downto 0+2));
  spram_di_lo <= std_logic_vector(bus_req_i.data(15 downto 00));
  spram_di_hi <= std_logic_vector(bus_req_i.data(31 downto 16));
  spram_we    <= '1' when (bus_req_i.rw = '1') else '0'; -- global write enable
  spram_cs    <= std_logic(mem_cs);
  spram_be_lo <= std_logic(bus_req_i.ben(1)) & std_logic(bus_req_i.ben(1)) & std_logic(bus_req_i.ben(0)) & std_logic(bus_req_i.ben(0)); -- low byte write enable
  spram_be_hi <= std_logic(bus_req_i.ben(3)) & std_logic(bus_req_i.ben(3)) & std_logic(bus_req_i.ben(2)) & std_logic(bus_req_i.ben(2)); -- high byte write enable
  spram_pwr_n <= '0' when ((spram_sleep_mode_en_c = false) or (mem_cs = '1')) else '1'; -- LP mode disabled or IMEM selected
  rdata       <= std_ulogic_vector(spram_do_hi) & std_ulogic_vector(spram_do_lo);

  buffer_ff: process(clk_i)
  begin
    if rising_edge(clk_i) then
      bus_rsp_o.ack <= mem_cs;
      rden          <= bus_req_i.stb and (not bus_req_i.rw);
    end if;
  end process buffer_ff;

  -- no access error possible --
  bus_rsp_o.err <= '0';

  -- output gate --
  bus_rsp_o.data <= rdata when (rden = '1') else (others => '0');


end neorv32_dmem_rtl;
