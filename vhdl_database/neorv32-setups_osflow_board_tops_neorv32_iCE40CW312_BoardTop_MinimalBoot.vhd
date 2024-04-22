-- #################################################################################################
-- # << NEORV32 - Example minimal setup for the iCE40CW312 >>                                      #
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

library iCE40;
use iCE40.components.all; -- for device primitives and macros

entity neorv32_iCE40CW312_BoardTop_MinimalBoot is
  port (
    iCE40CW312_CLK : in std_logic;
    -- UART (uart0) --
    iCE40CW312_TX      : out std_ulogic;
    iCE40CW312_RX      : in  std_ulogic;
    -- GPIO --
    iCE40CW312_GPIO_O  : out std_ulogic_vector(1 downto 0)
  );
end entity;

architecture neorv32_iCE40CW312_BoardTop_MinimalBoot_rtl of neorv32_iCE40CW312_BoardTop_MinimalBoot is

  -- configuration --
  constant f_clock_c : natural := 7372800; -- Input clock frequency in Hz

  -- Clock connection --
  signal sys_clk  : std_logic;

  -- internal IO connection --
  signal GPIO_Intermediate : std_ulogic_vector(3 downto 0);

  -- reset generator --
  signal rst_cnt  : std_logic_vector(8 downto 0) := (others => '0'); -- initialized by bitstream
  signal sys_rstn : std_logic;

begin

  -- Reset Generator ------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  reset_generator: process(sys_clk)
  begin
    if rising_edge(sys_clk) then
      if (rst_cnt(rst_cnt'left) = '0') then
        rst_cnt <= std_logic_vector(unsigned(rst_cnt) + 1);
      end if;
    end if;
  end process reset_generator;

  sys_rstn <= rst_cnt(rst_cnt'left);

  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_inst: entity work.neorv32_ProcessorTop_MinimalBoot
  generic map (
    CLOCK_FREQUENCY => f_clock_c, -- clock frequency of clk_i in Hz
    IO_PWM_NUM_CH => 0
  )
  port map (
    -- Global control --
    clk_i      => sys_clk,
    rstn_i     => sys_rstn,

    -- GPIO --
    gpio_o     => GPIO_Intermediate,

    -- primary UART --
    uart_txd_o => iCE40CW312_TX, -- UART0 send data
    uart_rxd_i => iCE40CW312_RX  -- UART0 receive data
  );

  -- External to System Connections ---------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  iCE40CW312_GPIO_O <= GPIO_Intermediate(1 downto 0);
  sys_clk <= iCE40CW312_CLK;

end architecture;
