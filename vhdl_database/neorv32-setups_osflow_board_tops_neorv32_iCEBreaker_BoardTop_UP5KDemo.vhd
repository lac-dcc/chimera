-- #################################################################################################
-- # << NEORV32 - Example setup for the iCEBreaker >>                                              #
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

entity neorv32_iCEBreaker_BoardTop_UP5KDemo is
  port (
    iCEBreaker_USR_RST_BTN : in std_ulogic;
    -- UART (uart0) --
    iCEBreaker_TX          : out std_ulogic;
    iCEBreaker_RX          : in  std_ulogic;
    -- SPI to on-board flash --
    iCEBreaker_FLASH_SCK   : out std_ulogic;
    iCEBreaker_FLASH_SDO   : out std_ulogic;
    iCEBreaker_FLASH_SDI   : in  std_ulogic;
    iCEBreaker_FLASH_CSN   : out std_ulogic; -- NEORV32.SPI_CS(0)
    -- SPI to IO pins --
    iCEBreaker_SPI_SCK     : out std_ulogic;
    iCEBreaker_SPI_SDO     : out std_ulogic;
    iCEBreaker_SPI_SDI     : in  std_ulogic;
    iCEBreaker_SPI_CSN     : out std_ulogic; -- NEORV32.SPI_CS(1)
    -- TWI --
    iCEBreaker_TWI_SDA     : inout std_logic;
    iCEBreaker_TWI_SCL     : inout std_logic;
	-- on-board GPIO --
    --iCEBreaker_BOARD_LED_G : out  std_ulogic; -- iCEBreaker on-board LEDs
	--iCEBreaker_BOARD_LED_R : out  std_ulogic; -- iCEBreaker on-board LEDs
    -- GPIO External --
    iCEBreaker_GPIO_I      : in  std_ulogic_vector(3 downto 0);
    iCEBreaker_GPIO_O      : out std_ulogic_vector(3 downto 0);
    -- PWM (to on-board RGB power LED) --
    iCEBreaker_LED_R       : out std_logic;
    iCEBreaker_LED_G       : out std_logic;
    iCEBreaker_LED_B       : out std_logic
  );
end entity;

architecture neorv32_iCEBreaker_BoardTop_UP5KDemo_rtl of neorv32_iCEBreaker_BoardTop_UP5KDemo is

  -- configuration --
  constant f_clock_c : natural := 18000000; -- PLL output clock frequency in Hz

  -- On-chip oscillator --
  signal hf_osc_clk : std_logic;

  -- Globals
  signal pll_rstn : std_logic;
  signal pll_clk  : std_logic;

  -- internal IO connection --
  signal con_pwm     : std_ulogic_vector(2 downto 0);
  signal con_spi_sdi : std_ulogic;
  signal con_spi_csn : std_ulogic;

begin

  -- On-Chip HF Oscillator ------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  HSOSC_inst : SB_HFOSC
  generic map (
    CLKHF_DIV => "0b10" -- 12 MHz
  )
  port map (
    CLKHFPU => '1',
    CLKHFEN => '1',
    CLKHF   => hf_osc_clk
  );


  -- System PLL -----------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  -- Settings generated by icepll -i 12 -o 18:
  -- F_PLLIN:      12.000 MHz (given)
  -- F_PLLOUT:     18.000 MHz (requested)
  -- F_PLLOUT:     18.000 MHz (achieved)
  -- FEEDBACK:     SIMPLE
  -- F_PFD:        12.000 MHz
  -- F_VCO:        576.000 MHz
  -- DIVR:         0 (4'b0000)
  -- DIVF:        47 (7'b0101111)
  -- DIVQ:         5 (3'b101)
  -- FILTER_RANGE: 1 (3'b001)
  Pll_inst : SB_PLL40_CORE
  generic map (
    FEEDBACK_PATH => "SIMPLE",
    DIVR          =>  x"0",
    DIVF          => 7x"2F",
    DIVQ          => 3x"5",
    FILTER_RANGE  => 3x"1"
  )
  port map (
    REFERENCECLK    => hf_osc_clk,
    PLLOUTCORE      => open,
    PLLOUTGLOBAL    => pll_clk,
    EXTFEEDBACK     => '0',
    DYNAMICDELAY    => x"00",
    LOCK            => pll_rstn,
    BYPASS          => '0',
    RESETB          => iCEBreaker_USR_RST_BTN,
    LATCHINPUTVALUE => '0',
    SDO             => open,
    SDI             => '0',
    SCLK            => '0'
  );

  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------

  neorv32_inst: entity work.neorv32_ProcessorTop_UP5KDemo
  generic map (
    CLOCK_FREQUENCY => f_clock_c -- clock frequency of clk_i in Hz
  )
  port map (
    -- Global control --
    clk_i       => std_ulogic(pll_clk),
    rstn_i      => std_ulogic(pll_rstn),

    -- primary UART --
    uart_txd_o  => iCEBreaker_TX,
    uart_rxd_i  => iCEBreaker_RX,

    -- SPI to on-board flash --
    flash_sck_o => iCEBreaker_FLASH_SCK,
    flash_sdo_o => iCEBreaker_FLASH_SDO,
    flash_sdi_i => iCEBreaker_FLASH_SDI,
    flash_csn_o => iCEBreaker_FLASH_CSN,

    -- SPI to IO pins --
    spi_sck_o   => iCEBreaker_SPI_SCK,
    spi_sdo_o   => iCEBreaker_SPI_SDO,
    spi_sdi_i   => con_spi_sdi,
    spi_csn_o   => con_spi_csn,

    -- TWI --
    twi_sda_io  => iCEBreaker_TWI_SDA,
    twi_scl_io  => iCEBreaker_TWI_SCL,

    -- GPIO --
    gpio_i      => iCEBreaker_GPIO_I,
    gpio_o      => iCEBreaker_GPIO_O,

    -- PWM (to on-board RGB power LED) --
    pwm_o       => con_pwm
  );

  -- IO Connection --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------

  -- SPI sdi read-back --
  iCEBreaker_SPI_CSN <= con_spi_csn;
  con_spi_sdi <= iCEBreaker_FLASH_SDI when (con_spi_csn = '0') else iCEBreaker_SPI_SDI;

  -- RGB --
  RGB_inst: SB_RGBA_DRV
  generic map (
    CURRENT_MODE => "0b1",
    RGB0_CURRENT => "0b000001",
    RGB1_CURRENT => "0b000001",
    RGB2_CURRENT => "0b000001"
  )
  port map (
    CURREN   => '1',  -- I
    RGBLEDEN => '1',  -- I
    RGB0PWM  => con_pwm(1),  -- I - green - pwm channel 1
    RGB1PWM  => con_pwm(2),  -- I - bluee - pwm channel 2
    RGB2PWM  => con_pwm(0),  -- I - red   - pwm channel 0
    RGB2     => iCEBreaker_LED_R,    -- O - red
    RGB1     => iCEBreaker_LED_G,    -- O - blue
    RGB0     => iCEBreaker_LED_B     -- O - green
  );

end architecture;
