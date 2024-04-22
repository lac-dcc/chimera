--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all; -- We do use signed arithmetic
use IEEE.numeric_std.all;

-- Device primitives library
library UNISIM;
use UNISIM.vcomponents.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

-- * NOTE: given the low dynamic range observed in the ADC DMA path, we'll assume that the conversion from 12 bits (ADC chip) to 16 bits was just padding 0s
--         on the left; we'll correct the issue by shifting the incoming ADC samples *.

entity adc_12bit_readjusment is
  generic ( -- @TO_BE_IMPROVED: a known fixed configuration is assumed for 'util_ad9361_adc_fifo' (i.e., 4 channels - 2RX/2TX - & 16-bit samples); changes might be required for different 'util_cpack' configurations
    BYPASS : boolean := false         -- the block can be bypassed, resulting thus in an unmodified ADI firmware implementation
  );
  port (
    -- **********************************
		-- clock and reset signals governing the ADC sample provision
		-- **********************************
    ADCxN_clk : in std_logic;                                        -- ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : in std_logic;                                      -- ADC high-active reset signal (mapped to the ADC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]

    -- ****************************
		-- interface to ADI AD936x
		-- ****************************

    -- input ports from axi_ad9361
    adc_enable_0 : in std_logic;                                     -- enable signal for ADC data port 0
    adc_valid_0 : in std_logic;                                      -- valid signal for ADC data port 0
    adc_data_0 : in std_logic_vector(15 downto 0);                   -- ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    adc_enable_1 : in std_logic;                                     -- enable signal for ADC data port 1
    adc_valid_1 : in std_logic;                                      -- valid signal for ADC data port 1
    adc_data_1 : in std_logic_vector(15 downto 0);                   -- ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    adc_enable_2 : in std_logic;                                     -- enable signal for ADC data port 2
    adc_valid_2 : in std_logic;                                      -- valid signal for ADC data port 2
    adc_data_2 : in std_logic_vector(15 downto 0);                   -- ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    adc_enable_3 : in std_logic;                                     -- enable signal for ADC data port 3
    adc_valid_3 : in std_logic;                                      -- valid signal for ADC data port 3
    adc_data_3 : in std_logic_vector(15 downto 0);                   -- ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]

    -- forwarded util_ad9361_adc_fifo inputs
    fwd_adc_enable_0 : out std_logic;                                -- enable signal for ADC data port 0
    fwd_adc_valid_0 : out std_logic;                                 -- valid signal for ADC data port 0
    fwd_adc_data_0 : out std_logic_vector(15 downto 0);              -- ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    fwd_adc_enable_1 : out std_logic;                                -- enable signal for ADC data port 1
    fwd_adc_valid_1 : out std_logic;                                 -- valid signal for ADC data port 1
    fwd_adc_data_1 : out std_logic_vector(15 downto 0);              -- ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    fwd_adc_enable_2 : out std_logic;                                -- enable signal for ADC data port 2
    fwd_adc_valid_2 : out std_logic;                                 -- valid signal for ADC data port 2
    fwd_adc_data_2 : out std_logic_vector(15 downto 0);              -- ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    fwd_adc_enable_3 : out std_logic;                                -- enable signal for ADC data port 3
    fwd_adc_valid_3 : out std_logic;                                 -- valid signal for ADC data port 3
    fwd_adc_data_3 : out std_logic_vector(15 downto 0)               -- ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]
  );
end adc_12bit_readjusment;

architecture arch_adc_12bit_readjusment_RTL_impl of adc_12bit_readjusment is

  -- **********************************
  -- internal signals
  -- **********************************

  -- internal forwarding signals
  signal fwd_adc_valid_0_s : std_logic;
  signal fwd_adc_data_0_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_1_s : std_logic;
  signal fwd_adc_data_1_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_2_s : std_logic;
  signal fwd_adc_data_2_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_3_s : std_logic;
  signal fwd_adc_data_3_s : std_logic_vector(15 downto 0);

begin

  -- ***********************************************************
  -- management of the util_ad9361_adc_fifo inputs [@ADCxN_clk]
  -- ***********************************************************

  -- process readjusting the incoming data to exploit the 16 available bits
  process(ADCxN_clk,ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
        fwd_adc_valid_0_s <= '0';
        fwd_adc_data_0_s <= (others => '0');
        fwd_adc_valid_1_s <= '0';
        fwd_adc_data_1_s <= (others => '0');
        fwd_adc_valid_2_s <= '0';
        fwd_adc_data_2_s <= (others => '0');
        fwd_adc_valid_3_s <= '0';
        fwd_adc_data_3_s <= (others => '0');
      else
        fwd_adc_valid_0_s <= adc_valid_0;
        fwd_adc_data_0_s <= adc_data_0(11 downto 0)&"0000";
        fwd_adc_valid_1_s <= adc_valid_1;
        fwd_adc_data_1_s <= adc_data_1(11 downto 0)&"0000";
        fwd_adc_valid_2_s <= adc_valid_2;
        fwd_adc_data_2_s <= adc_data_2(11 downto 0)&"0000";
        fwd_adc_valid_3_s <= adc_valid_3;
        fwd_adc_data_3_s <= adc_data_3(11 downto 0)&"0000";
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- mapping of the internal signals to the corresponding output ports (implementing the BYPASS configuration as well)
  fwd_adc_enable_0 <= adc_enable_0;-- when BYPASS else fwd_adc_enable_0_s;
  fwd_adc_valid_0 <= adc_valid_0 when BYPASS else fwd_adc_valid_0_s;
  fwd_adc_data_0 <= adc_data_0 when BYPASS else fwd_adc_data_0_s;
  fwd_adc_enable_1 <= adc_enable_1;-- when BYPASS else fwd_adc_enable_1_s;
  fwd_adc_valid_1 <= adc_valid_1 when BYPASS else fwd_adc_valid_1_s;
  fwd_adc_data_1 <= adc_data_1 when BYPASS else fwd_adc_data_1_s;
  fwd_adc_enable_2 <= adc_enable_2;-- when BYPASS else fwd_adc_enable_2_s;
  fwd_adc_valid_2 <= adc_valid_2 when BYPASS else fwd_adc_valid_2_s;
  fwd_adc_data_2 <= adc_data_2 when BYPASS else fwd_adc_data_2_s;
  fwd_adc_enable_3 <= adc_enable_3;-- when BYPASS else fwd_adc_enable_3_s;
  fwd_adc_valid_3 <= adc_valid_3 when BYPASS else fwd_adc_valid_3_s;
  fwd_adc_data_3 <= adc_data_3 when BYPASS else fwd_adc_data_3_s;

end arch_adc_12bit_readjusment_RTL_impl;
