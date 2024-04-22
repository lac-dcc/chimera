-- #################################################################################################
-- # << NEORV32 - Example setup for using Intel FPGAs internal JTAG atom. >>                       #
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
-- # The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32                           #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_on_chip_debugger_intel is
  generic (
    -- adapt these for your setup --
    CLOCK_FREQUENCY   : natural := 50000000; -- clock frequency of clk_i in Hz
    MEM_INT_IMEM_SIZE : natural := 16*1024;  -- size of processor-internal instruction memory in bytes
    MEM_INT_DMEM_SIZE : natural := 8*1024    -- size of processor-internal data memory in bytes
  );
  port (
    -- Global control --
    clk_i               : in  std_ulogic; -- global clock, rising edge
    rstn_i              : in  std_ulogic; -- global reset, low-active, async
    -- JTAG on-chip debugger interface --
    altera_reserved_tck : in  std_ulogic; -- serial clock
    altera_reserved_tdi : in  std_ulogic; -- serial data input
    altera_reserved_tdo : out std_ulogic; -- serial data output
    altera_reserved_tms : in  std_ulogic; -- mode select
    -- GPIO --
    gpio_o              : out std_ulogic_vector(7 downto 0) -- parallel output
  );
end entity;

architecture neorv32_on_chip_debugger_intel_rtl of neorv32_on_chip_debugger_intel is

  -- Cyclone IV E specific atom for indirect access to physical JTAG --
  -- 
  -- Depending on the chip it could be one of these: component arriaii_jtag, arriaiigz_jtag,
  -- arriav_jtag, arriavgz_jtag, cyclone_jtag, cyclone10lp_jtag, cycloneii_jtag, cycloneiii_jtag,
  -- cycloneiiils_jtag, cycloneiv_jtag, cycloneive_jtag, cyclonev_jtag, fiftyfivenm_jtag,
  -- maxii_jtag, maxv_jtag, stratix_jtag, stratixgx_jtag, stratixii_jtag, stratixiigx_jtag,
  -- stratixiii_jtag, stratixiv_jtag, stratixv_jtag, twentynm_jtagblock, twentynm_jtag,
  -- twentynm_hps_interface_jtag, fiftyfivenm_jtag
  component cycloneive_jtag
    generic (
      lpm_type : string := "cycloneive_jtag"
    );
    port (
      tms         : in  std_logic := '0';
      tck         : in  std_logic := '0';
      tdi         : in  std_logic := '0';
      tdoutap     : in  std_logic := '0';
      tdouser     : in  std_logic := '0';
      tdo         : out std_logic;
      tmsutap     : out std_logic;
      tckutap     : out std_logic;
      tdiutap     : out std_logic;
      shiftuser   : out std_logic;
      clkdruser   : out std_logic;
      updateuser  : out std_logic;
      runidleuser : out std_logic;
      usr1user    : out std_logic
    );
  end component;

  signal con_gpio_o : std_ulogic_vector(63 downto 0);
  signal con_jtag_tck, con_jtag_tdi, con_jtag_tdo, con_jtag_tms : std_logic;

begin

  -- The Core Of The Problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_top_inst: neorv32_top
  generic map (
    -- General --
    CLOCK_FREQUENCY              => CLOCK_FREQUENCY,   -- clock frequency of clk_i in Hz
    INT_BOOTLOADER_EN            => true,              -- boot configuration: true = boot explicit bootloader; false = boot from int/ext (I)MEM
    -- On-Chip Debugger (OCD) --
    ON_CHIP_DEBUGGER_EN          => true,              -- implement on-chip debugger
    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_C        => true,              -- implement compressed extension?
    CPU_EXTENSION_RISCV_M        => true,              -- implement mul/div extension?
    CPU_EXTENSION_RISCV_U        => true,              -- implement user mode extension?
    CPU_EXTENSION_RISCV_Zicntr   => true,              -- implement base counters?
    -- Internal Instruction memory --
    MEM_INT_IMEM_EN              => true,              -- implement processor-internal instruction memory
    MEM_INT_IMEM_SIZE            => MEM_INT_IMEM_SIZE, -- size of processor-internal instruction memory in bytes
    -- Internal Data memory --
    MEM_INT_DMEM_EN              => true,              -- implement processor-internal data memory
    MEM_INT_DMEM_SIZE            => MEM_INT_DMEM_SIZE, -- size of processor-internal data memory in bytes
    -- Processor peripherals --
    IO_GPIO_NUM                  => 8,                 -- number of GPIO input/output pairs (0..64)
    IO_MTIME_EN                  => true               -- implement machine system timer (MTIME)?
  )
  port map (
    -- Global control --
    clk_i       => clk_i,        -- global clock, rising edge
    rstn_i      => rstn_i,       -- global reset, low-active, async
    -- JTAG on-chip debugger interface (available if ON_CHIP_DEBUGGER_EN = true) --
    jtag_trst_i => '1',          -- low-active TAP reset (optional)
    jtag_tck_i  => con_jtag_tck, -- serial clock
    jtag_tdi_i  => con_jtag_tdi, -- serial data input
    jtag_tdo_o  => con_jtag_tdo, -- serial data output
    jtag_tms_i  => con_jtag_tms, -- mode select
    -- GPIO (available if IO_GPIO_NUM > 0) --
    gpio_o      => con_gpio_o    -- parallel output
  );

  -- GPIO output --
  gpio_o <= con_gpio_o(7 downto 0);

  -- Cyclone IV E JTAG atom --
  jtag_inst : cycloneive_jtag
  PORT MAP(
      tms         => altera_reserved_tms,
      tck         => altera_reserved_tck,
      tdi         => altera_reserved_tdi,
      tdo         => altera_reserved_tdo,
      tdoutap     => open, -- don't use, quartus will complain otherwise
      tdouser     => con_jtag_tdo,
      tmsutap     => con_jtag_tms,
      tckutap     => con_jtag_tck,
      tdiutap     => con_jtag_tdi,
      shiftuser   => open, -- don't care, dtm has it's own JTAG FSM
      clkdruser   => open,
      updateuser  => open,
      runidleuser => open,
      usr1user    => open
  );

end architecture;
