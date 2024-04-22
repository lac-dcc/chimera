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

entity dac_control_s_axi_aclk is
  port (
    -- *************************************************************************
    -- Clock and reset signals governing the communication with the PS
    -- *************************************************************************
    s_axi_aclk : in std_logic;    --! AXI clock signal (@100 MHz).
    s_axi_aresetn : in std_logic; --! AXI low-active reset signal (mapped to the AXI clock domain [@100 MHz]).

    -- *************************************************************************
    -- Clock and reset signals governing the DAC sample provision
    -- *************************************************************************
    --! DAC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) 
    --! configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz].
    DACxN_clk : in std_logic;        
    --! Indicates the division factor between the sampling clock and input clock 
    --! (i.e., '1' indicates N = 2 or 1x1, '0' indicates N = 4 or 2x2).
    DAC_clk_division : in std_logic; 

    -- *************************************************************************
		-- Interface to ADI axi_ad9361_dac_dma
		-- *************************************************************************
    dac_enable_0 : in std_logic;  --! Enable signal for DAC data port 0 (@DACxN_clk).
    dac_enable_1 : in std_logic;  --! Enable signal for DAC data port 1 (@DACxN_clk).
    dac_enable_2 : in std_logic;  --! Enable signal for DAC data port 2 (@DACxN_clk).
    dac_enable_3 : in std_logic;  --! Enable signal for DAC data port 3 (@DACxN_clk).

    -- *************************************************************************
		-- Interface to ADI axi_ad9361_dac_fifo
		-- *************************************************************************
    s_axi_dac_enable_0 : out std_logic; --! Enable signal for DAC data port 0 (@s_axi_aclk).
    s_axi_dac_valid_0 : out std_logic;  --! Valid signal for DAC data port 0 (@s_axi_aclk).
    s_axi_dac_enable_1 : out std_logic; --! Enable signal for DAC data port 1 (@s_axi_aclk).
    s_axi_dac_valid_1 : out std_logic;  --! Valid signal for DAC data port 0 (@s_axi_aclk).
    s_axi_dac_enable_2 : out std_logic; --! Enable signal for DAC data port 2 (@s_axi_aclk).
    s_axi_dac_valid_2 : out std_logic;  --! Valid signal for DAC data port 0 (@s_axi_aclk).
    s_axi_dac_enable_3 : out std_logic; --! Enable signal for DAC data port 3 (@s_axi_aclk).
    s_axi_dac_valid_3 : out std_logic   --! Valid signal for DAC data port 0 (@s_axi_aclk).
  );
end dac_control_s_axi_aclk;

architecture arch_dac_control_s_axi_aclk_RTL_impl of dac_control_s_axi_aclk is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- internal clock-enable constants
  constant cnt_0_3b : std_logic_vector(2 downto 0):="000";
  constant cnt_1_3b : std_logic_vector(2 downto 0):="001";
  constant cnt_3_3b : std_logic_vector(2 downto 0):="011";

  -- **********************************
  -- internal signals
  -- **********************************

  -- internal clock-enable related signals
  signal clock_enable_counter : std_logic_vector(2 downto 0);

  -- DAC related signals
  signal DAC_enable_s : std_logic_vector(3 downto 0);
  signal DAC_enable_s_AXIclk_int : std_logic_vector(3 downto 0);
  signal DAC_valid_s_AXIclk_int : std_logic_vector(3 downto 0);
  signal DAC_clk_division_AXIclk_int : std_logic;
  signal DAC_clk_division_AXIclk_int_valid : std_logic;

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal DAC_enable_s_AXIclk : std_logic_vector(3 downto 0):=(others => '0');
  signal DAC_enable_s_valid_AXIclk : std_logic:='0';
  signal DAC_clk_division_AXIclk : std_logic:='1'; -- default configuration is 1x1
  signal DAC_clk_division_valid_AXIclk : std_logic:='0';

begin

  -- ***************************************************
  -- processing @DACxN_clk
  -- ***************************************************

  -- concurrent combination of the input signals into a single signal
  DAC_enable_s <= dac_enable_3 & dac_enable_2 & dac_enable_1 & dac_enable_0;

  -- ***************************************************
  -- processing @s_axi_aclk
  -- ***************************************************

  -- generation of an internal clock-enable signal used to match the output data-rate with the input one
  process(s_axi_aclk,s_axi_aresetn,DAC_clk_division_AXIclk_int_valid)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then-- or DAC_clk_division_AXIclk_int_valid = '0' then -- synchronous low-active reset: initialization of signals
        clock_enable_counter <= cnt_0_3b;
      else
        -- clock enable control (implemented according to 'DAC_clk_division')
        if (clock_enable_counter < cnt_1_3b) then -- and DAC_clk_division_AXIclk_int = '1') or   -- 1x1 antenna configuration [N = 2]
           --(clock_enable_counter < cnt_3_3b and DAC_clk_division_AXIclk_int = '0') then -- 2x2 antenna configuration [N = 4]
          clock_enable_counter <= clock_enable_counter + cnt_1_3b;
        else
          clock_enable_counter <= (others => '0');
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- generation of 'DAC_enable_s_AXIclk_int'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        DAC_enable_s_AXIclk_int <= (others => '0');
     else
        -- forwarding of the original DAC enable signals
        if DAC_enable_s_valid_AXIclk = '1' then
          DAC_enable_s_AXIclk_int <= DAC_enable_s_AXIclk;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- generation of 'DAC_clk_division_AXIclk_int'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        DAC_clk_division_AXIclk_int <= '0';
        DAC_clk_division_AXIclk_int_valid <= '0';
      else
        if DAC_clk_division_valid_AXIclk = '1' then
          DAC_clk_division_AXIclk_int <= DAC_clk_division_AXIclk;
          DAC_clk_division_AXIclk_int_valid <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- generation of 'DAC_valid_s_AXIclk_int'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        DAC_valid_s_AXIclk_int <= (others => '0');
      else
        -- generation of custom DAC valid signals, because the input and output clock cycles of 'axi_ad9361_dac_fifo' will now be the same clock, then
        --  there is no need to have the signals active only each 1/N cycles (still, the signals need to be updated according to 'DAC_clk_division_AXIclk'
        --  [N=2 with '1' and N=4 with '0'])
        if clock_enable_counter = cnt_0_3b then
          DAC_valid_s_AXIclk_int <= DAC_enable_s_AXIclk_int; -- @TO_BE_TESTED: valid data is expected each 1/N clock cycles for all enabled DAC channels
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- mapping of the internal signals to the corresponding output ports
  s_axi_dac_enable_0 <=  DAC_enable_s_AXIclk_int(0);
  s_axi_dac_valid_0 <= DAC_valid_s_AXIclk_int(0);
  s_axi_dac_enable_1 <=  DAC_enable_s_AXIclk_int(1);
  s_axi_dac_valid_1 <= DAC_valid_s_AXIclk_int(1);
  s_axi_dac_enable_2 <=  DAC_enable_s_AXIclk_int(2);
  s_axi_dac_valid_2 <= DAC_valid_s_AXIclk_int(2);
  s_axi_dac_enable_3 <=  DAC_enable_s_AXIclk_int(3);
  s_axi_dac_valid_3 <= DAC_valid_s_AXIclk_int(3);

  -- ***************************************************
  -- block instances
  -- ***************************************************

  -- cross-clock domain sharing of 'DAC_enable_s'
  synchronizer_dac_enable_s_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 4,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data => DAC_enable_s,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s_axi_aclk,
      dst_data => DAC_enable_s_AXIclk,
      dst_data_valid => DAC_enable_s_valid_AXIclk
    );

  -- cross-clock domain sharing of 'DAC_clk_division'
  synchronizer_dac_clk_div_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data(0) => DAC_clk_division,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s_axi_aclk,
      dst_data(0) => DAC_clk_division_AXIclk,
      dst_data_valid => DAC_clk_division_valid_AXIclk
    );

end arch_dac_control_s_axi_aclk_RTL_impl;
