-- #################################################################################################
-- # << NEORV32 - Example setup including the bootloader, for the IceZumAlhambraII (c) Board >>    #
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

entity neorv32_IceZumAlhambraII_BoardTop_MinimalBoot is
  port (
    -- external clock (12 MHz)
    IceZumAlhambraII_CLK : in std_logic;
    -- LED outputs
    IceZumAlhambraII_LED0 : out std_logic;
    IceZumAlhambraII_LED1 : out std_logic;
    IceZumAlhambraII_LED2 : out std_logic;
    IceZumAlhambraII_LED3 : out std_logic;
    IceZumAlhambraII_LED4 : out std_logic;
    IceZumAlhambraII_LED5 : out std_logic;
    IceZumAlhambraII_LED6 : out std_logic;
    IceZumAlhambraII_LED7 : out std_logic;
    -- UART0
    IceZumAlhambraII_RX : in  std_logic;
    IceZumAlhambraII_TX : out std_logic
  );
end entity;

architecture neorv32_IceZumAlhambraII_BoardTop_MinimalBoot_rtl of neorv32_IceZumAlhambraII_BoardTop_MinimalBoot is

  alias BOARD_CLK: std_logic is IceZumAlhambraII_CLK;
  alias BOARD_LED0: std_logic is IceZumAlhambraII_LED0;
  alias BOARD_LED1: std_logic is IceZumAlhambraII_LED1;
  alias BOARD_LED2: std_logic is IceZumAlhambraII_LED2;
  alias BOARD_LED3: std_logic is IceZumAlhambraII_LED3;
  alias BOARD_LED4: std_logic is IceZumAlhambraII_LED4;
  alias BOARD_LED5: std_logic is IceZumAlhambraII_LED5;
  alias BOARD_LED6: std_logic is IceZumAlhambraII_LED6;
  alias BOARD_LED7: std_logic is IceZumAlhambraII_LED7;
  alias BOARD_RX: std_logic is IceZumAlhambraII_RX;
  alias BOARD_TX: std_logic is IceZumAlhambraII_TX;

  -- configuration --
  constant f_clock_c : natural := 12000000; -- clock frequency in Hz

  -- reset generator --
  signal rst_cnt  : std_logic_vector(8 downto 0) := (others => '0'); -- initialized by bitstream
  signal sys_rstn : std_logic;

  -- internal IO connection --
  signal con_gpio_o : std_ulogic_vector(3 downto 0);
  signal con_pwm    : std_logic_vector(2 downto 0);

begin

  -- Reset Generator ------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  reset_generator: process(BOARD_CLK)
  begin
    if rising_edge(BOARD_CLK) then
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
    CLOCK_FREQUENCY   => f_clock_c, -- clock frequency of clk_i in Hz
    MEM_INT_IMEM_SIZE => 4*1024,    -- size of processor-internal instruction memory in bytes
    MEM_INT_DMEM_SIZE => 2*1024     -- size of processor-internal data memory in bytes
  )
  port map (
    -- Global control --
    clk_i      => std_ulogic(BOARD_CLK),
    rstn_i     => std_ulogic(sys_rstn),

    -- GPIO --
    gpio_o     => con_gpio_o,

    -- primary UART --
    uart_txd_o => BOARD_TX, -- UART0 send data
    uart_rxd_i => BOARD_RX, -- UART0 receive data

    -- PWM (to on-board RGB LED) --
    pwm_o      => con_pwm
  );

  -- IO Connection --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  BOARD_LED0 <= con_gpio_o(0);
  BOARD_LED1 <= con_gpio_o(1);
  BOARD_LED2 <= con_gpio_o(2);
  BOARD_LED3 <= con_gpio_o(3);
  BOARD_LED4 <= '0'; -- unused
  BOARD_LED5 <= con_pwm(0);
  BOARD_LED6 <= con_pwm(1);
  BOARD_LED7 <= con_pwm(2);

end architecture;
