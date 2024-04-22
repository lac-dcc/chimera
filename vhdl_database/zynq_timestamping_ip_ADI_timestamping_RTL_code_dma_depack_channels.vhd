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

library UNISIM;
use UNISIM.VComponents.all;

entity dma_depack_channels is
  generic (
    PARAM_CHANNEL_WIDTH : integer := 16;    --! Width of each channel
    PARAM_NUM_CHANNELS  : integer := 2      --! Default is 2, i.e. I and Q for one antenna
  );
  port (
      s_axi_aclk    : in std_logic;
      s_axi_aresetn : in std_logic;
      -- data from DMA
      axis_in_tdata  : in std_logic_vector(PARAM_NUM_CHANNELS*PARAM_CHANNEL_WIDTH-1 downto 0);
      axis_in_tvalid : in std_logic;
      axis_in_tlast  : in std_logic;
      axis_in_tready : out std_logic;
      -- data to
      dac_data_0 : out std_logic_vector(PARAM_CHANNEL_WIDTH-1 downto 0);
      dac_data_0_valid : out std_logic;
      dac_data_1 : out std_logic_vector(PARAM_CHANNEL_WIDTH-1 downto 0);
      dac_data_1_valid : out std_logic;
      dac_data_2 : out std_logic_vector(PARAM_CHANNEL_WIDTH-1 downto 0);
      dac_data_2_valid : out std_logic;
      dac_data_3 : out std_logic_vector(PARAM_CHANNEL_WIDTH-1 downto 0);
      dac_data_3_valid : out std_logic
  );
end dma_depack_channels;

architecture rtl_dma_depack_channels of dma_depack_channels is

begin

  process(s_axi_aclk, s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        dac_data_0 <= (others => '0');
        dac_data_1 <= (others => '0');
        dac_data_2 <= (others => '0');
        dac_data_3 <= (others => '0');
        dac_data_0_valid <= '0';
        dac_data_1_valid <= '0';
        dac_data_2_valid <= '0';
        dac_data_3_valid <= '0';
        axis_in_tready <= '0';
      else
        -- always ready to receive data from AXI DMA block
        axis_in_tready <= '1';

        -- default values
        dac_data_0_valid <= '0';
        dac_data_1_valid <= '0';
        dac_data_2_valid <= '0';
        dac_data_3_valid <= '0';

        if axis_in_tvalid = '1' then
          dac_data_0_valid <= '1';
          dac_data_0 <= axis_in_tdata(PARAM_CHANNEL_WIDTH - 1 downto 0);
          if PARAM_NUM_CHANNELS >= 2 then
            dac_data_1_valid <= '1';
            dac_data_1 <= axis_in_tdata(2*PARAM_CHANNEL_WIDTH - 1 downto 1*PARAM_CHANNEL_WIDTH);
          end if;
          if PARAM_NUM_CHANNELS >= 3 then
            dac_data_2_valid <= '1';
            dac_data_2 <= axis_in_tdata(3*PARAM_CHANNEL_WIDTH - 1 downto 2*PARAM_CHANNEL_WIDTH);
          end if;
          if PARAM_NUM_CHANNELS >= 4 then
            dac_data_3_valid <= '1';
            dac_data_3 <= axis_in_tdata(4*PARAM_CHANNEL_WIDTH - 1 downto 3*PARAM_CHANNEL_WIDTH);
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

end rtl_dma_depack_channels;
