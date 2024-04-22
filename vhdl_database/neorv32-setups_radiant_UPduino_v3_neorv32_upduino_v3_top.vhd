-- #################################################################################################
-- # << NEORV32 - Example setup for the tinyVision.ai Inc. "UPduino v3" (c) Board >>               #
-- # ********************************************************************************************* #
-- # BSD 3-Clause License                                                                          #
-- #                                                                                               #
-- # Copyright (c) 2024, Stephan Nolting. All rights reserved.                                     #
-- #                                                                                               #
-- # Redistribution and use in source and binary forms, with or without modification, are          #
-- # permitted provided that the following conditions are met:                                     #
-- #                                                                                               #
-- # 1. Redistributions of source code must retain the above copyright notice, this list of        #
-- #    conditions and the following disclaimer.                                                    #
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

library work;
use work.all;

library iCE40UP;
use iCE40UP.components.all; -- for device primitives

entity neorv32_upduino_v3_top is
  port (
    -- UART (uart0) --
    uart_txd_o  : out std_ulogic;
    uart_rxd_i  : in  std_ulogic;
    -- SPI to on-board flash --
    flash_sck_o : out std_ulogic;
    flash_sdo_o : out std_ulogic;
    flash_sdi_i : in  std_ulogic;
    flash_csn_o : out std_ulogic; -- NEORV32.SPI_CS(0)
    -- SPI to IO pins --
    spi_sck_o   : out std_ulogic;
    spi_sdo_o   : out std_ulogic;
    spi_sdi_i   : in  std_ulogic;
    spi_csn_o   : out std_ulogic; -- NEORV32.SPI_CS(1)
    -- TWI --
    twi_sda_io  : inout std_logic;
    twi_scl_io  : inout std_logic;
    -- GPIO --
    gpio_i      : in  std_ulogic_vector(3 downto 0);
    gpio_o      : out std_ulogic_vector(3 downto 0);
    -- PWM (to on-board RGB power LED) --
    pwm_o       : out std_ulogic_vector(2 downto 0)
  );
end neorv32_upduino_v3_top;

architecture neorv32_upduino_v3_top_rtl of neorv32_upduino_v3_top is

  -- configuration --
  constant f_clock_c : natural := 24000000; -- PLL output clock frequency in Hz

  -- On-chip oscillator --
  signal hf_osc_clk : std_logic;

  -- reset generator --
  signal rst_cnt : std_ulogic_vector(9 downto 0) := (others => '0'); -- reset by bistream

  -- CPU --
  signal cpu_clk  : std_ulogic;
  signal cpu_rstn : std_ulogic;

  -- internal IO connection --
  signal con_pwm     : std_ulogic_vector(11 downto 0);
  signal con_spi_sck : std_ulogic;
  signal con_spi_sdi : std_ulogic;
  signal con_spi_sdo : std_ulogic;
  signal con_spi_csn : std_ulogic_vector(07 downto 0);
  signal con_gpio_i  : std_ulogic_vector(63 downto 0);
  signal con_gpio_o  : std_ulogic_vector(63 downto 0);

  -- TWI tri-state drivers --
  signal twi_sda_i, twi_sda_o, twi_scl_i, twi_scl_o : std_ulogic;

  -- Misc --
  signal pwm_drive  : std_logic_vector(2 downto 0);
  signal pwm_driven : std_ulogic_vector(2 downto 0);

begin

  -- On-Chip HF Oscillator ------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  HSOSC_inst : HSOSC
  generic map (
    CLKHF_DIV => "0b01" -- 24 MHz
  )
  port map (
    CLKHFPU => '1',
    CLKHFEN => '1',
    CLKHF   => hf_osc_clk
  );

  cpu_clk  <= std_ulogic(hf_osc_clk);


  -- Reset Generator ------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  reset_gen: process(cpu_clk)
  begin
    if rising_edge(cpu_clk) then
      if (rst_cnt(9) = '0') then
        rst_cnt <= std_ulogic_vector(unsigned(rst_cnt) + 1);
      end if;
    end if;
  end process reset_gen;

  cpu_rstn <= rst_cnt(9);


  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_inst: neorv32_top
  generic map (
    -- General --
    CLOCK_FREQUENCY              => f_clock_c,   -- clock frequency of clk_i in Hz
    INT_BOOTLOADER_EN            => true,        -- boot configuration: true = boot explicit bootloader; false = boot from int/ext (I)MEM

    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_C        => true,        -- implement compressed extension?
    CPU_EXTENSION_RISCV_M        => true,        -- implement mul/div extension?
    CPU_EXTENSION_RISCV_U        => true,        -- implement user mode extension?
    CPU_EXTENSION_RISCV_Zicntr   => true,        -- implement base counters?

    -- Internal Instruction memory --
    MEM_INT_IMEM_EN              => true,        -- implement processor-internal instruction memory
    MEM_INT_IMEM_SIZE            => 64*1024,     -- size of processor-internal instruction memory in bytes

    -- Internal Data memory --
    MEM_INT_DMEM_EN              => true,        -- implement processor-internal data memory
    MEM_INT_DMEM_SIZE            => 64*1024,     -- size of processor-internal data memory in bytes

    -- Processor peripherals --
    IO_GPIO_NUM                  => 4,           -- implement general purpose input/output port unit (GPIO)?
    IO_MTIME_EN                  => true,        -- implement machine system timer (MTIME)?
    IO_UART0_EN                  => true,        -- implement primary universal asynchronous receiver/transmitter (UART0)?
    IO_SPI_EN                    => true,        -- implement serial peripheral interface (SPI)?
    IO_TWI_EN                    => true,        -- implement two-wire interface (TWI)?
    IO_PWM_NUM_CH                => 3,           -- number of PWM channels to implement (0..60); 0 = disabled
    IO_WDT_EN                    => true         -- implement watch dog timer (WDT)?
  )
  port map (
    -- Global control --
    clk_i       => cpu_clk,
    rstn_i      => cpu_rstn,

    -- GPIO (available if IO_GPIO_EN = true) --
    gpio_o      => con_gpio_o,
    gpio_i      => con_gpio_i,

    -- primary UART0 (available if IO_UART0_EN = true) --
    uart0_txd_o => uart_txd_o,
    uart0_rxd_i => uart_rxd_i,

    -- SPI (available if IO_SPI_EN = true) --
    spi_clk_o   => con_spi_sck,
    spi_dat_o   => con_spi_sdo,
    spi_dat_i   => con_spi_sdi,
    spi_csn_o   => con_spi_csn,

    -- TWI (available if IO_TWI_EN = true) --
    twi_sda_i   => twi_sda_i,
    twi_sda_o   => twi_sda_o,
    twi_scl_i   => twi_scl_i,
    twi_scl_o   => twi_scl_o,

    -- PWM (available if IO_PWM_EN = true) --
    pwm_o       => con_pwm
  );

  -- TWI --
  twi_sda_io <= '0' when (twi_sda_o = '0') else 'Z'; -- module can only pull the line low actively
  twi_scl_io <= '0' when (twi_scl_o = '0') else 'Z';
  twi_sda_i  <= std_ulogic(twi_sda_io);
  twi_scl_i  <= std_ulogic(twi_scl_io);

  -- GPIO --
  con_gpio_i <= x"000000000000000" & gpio_i(3 downto 0);
  gpio_o(3 downto 0) <= con_gpio_o(3 downto 0);

  -- SPI --
  flash_sck_o <= con_spi_sck;
  flash_sdo_o <= con_spi_sdo;
  flash_csn_o <= con_spi_csn(0);
  spi_sck_o   <= con_spi_sck;
  spi_sdo_o   <= con_spi_sdo;
  spi_csn_o   <= con_spi_csn(1);
  con_spi_sdi <= flash_sdi_i when (con_spi_csn(0) = '0') else spi_sdi_i;

  -- RGB --
  pwm_drive(0) <= std_logic(con_pwm(0) or con_gpio_o(0)); -- bit 0: red - pwm channel 0 OR gpio_o(0) [status LED]
  pwm_drive(1) <= std_logic(con_pwm(1)); -- bit 1: green - pwm channel 1
  pwm_drive(2) <= std_logic(con_pwm(2)); -- bit 2: blue - pwm channel 2

  RGB_inst: RGB
  generic map (
    CURRENT_MODE => "1",
    RGB0_CURRENT => "0b000001",
    RGB1_CURRENT => "0b000001",
    RGB2_CURRENT => "0b000001"
  )
  port map (
    CURREN   => '1',  -- I
    RGBLEDEN => '1',  -- I
    RGB0PWM  => pwm_drive(1),  -- I - green
    RGB1PWM  => pwm_drive(2),  -- I - blue
    RGB2PWM  => pwm_drive(0),  -- I - red
    RGB2     => pwm_driven(2), -- O - red
    RGB1     => pwm_driven(1), -- O - blue
    RGB0     => pwm_driven(0)  -- O - green
  );

  pwm_o <= std_ulogic_vector(pwm_driven);


end neorv32_upduino_v3_top_rtl;
