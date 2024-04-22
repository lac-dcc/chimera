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

--! This block will sniff the current value of 'x_length', but it will not modify it in 
--! any way. Hence, it assumes that the SW running in the PS has
--! requested 8 extra bytes to accommodate the (64-bit) timestamp  (i.e., 'x_length' is N+7 bytes, 
--! instead of the N-1 value described in the original
--! ADI's 'axi_dmac' documentation).

-- @TO_BE_IMPROVED: a known fixed configuration is assumed for 'axi_dmac' (i.e., that of the 
-- 'fmcomms2_zcu102' project provided by ADI); changes might be required for different 'axi_dmac' configurations
entity dac_dmac_xlength_sniffer is
  generic ( 
    --! defines the width of transfer length control register in bits; limits the maximum length of 
    --! the transfers to 2^DMA_LENGTH_WIDTH (e.g., 2^24 = 16M)
    DMA_LENGTH_WIDTH : integer := 24 
  );
  port (
    -- *************************************************************************
    -- Custom timestamping ports
    -- *************************************************************************
    --! Signal indicating the number of samples comprising the current DMA transfer
    DMA_x_length : out std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0);                
    DMA_x_length_valid : out std_logic; --! Valid signal for 'DMA_x_length'

    -- *************************************************************************
		-- Ports of the slave AXI interface -> management of the memory mapped 
    -- registers (i.e., set/read parameters from the CPU)
		-- *************************************************************************
    -- Input ports from PS
    s_axi_aclk : in std_logic;
    s_axi_aresetn : in std_logic;
    s_axi_awvalid : in std_logic;
    s_axi_awaddr : in std_logic_vector(11 downto 0);
    s_axi_wvalid : in std_logic;
    s_axi_wdata : in std_logic_vector(31 downto 0);
    s_axi_bready : in std_logic;

    -- Forwarded 'axi_dmac' outputs
    fwd_s_axi_awready : in std_logic;
    fwd_s_axi_wready : in std_logic;
    fwd_s_axi_bvalid : in std_logic
  );
end dac_dmac_xlength_sniffer;

architecture arch_dac_dmac_xlength_sniffer_RTL_impl of dac_dmac_xlength_sniffer is

  -- **********************************
  -- definition of constants
  -- **********************************
  constant cnt_DMA_LENGTH_zero : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0) := (others => '0');

  -- memory-mapped dmac configuration register addresses
  constant cnt_X_LENGTH_mmreg_addr : std_logic_vector(8 downto 0):="1" & x"06";

  -- fixed values for non supported generic parameters (up_axi)
  constant cnt_fixed_up_axi_ADDRESS_WIDTH : integer:=9;    -- value inherited from 'up_axi' instance in 'axi_dmac_regmap.v'

  -- constants related to the modified 'dmac_x_length' value
  constant cnt_8_DMA_LENGTH_WIDTH : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0):=(3 => '1', others => '0'); -- we do need to write 8 extra bytes (i.e., 64-bit timestamp)

  -- **********************************
  -- internal signals
  -- **********************************

  -- axi_dmac slave AXI interface related signals
  signal dmac_mm_regs_valid_wreq_s : std_logic:='0';
  signal dmac_mm_regs_wdone_s : std_logic:='0';

  -- dma_x_length related signals; they are initialized to avoid problems with its cross-clock domain crossing
  signal dma_x_length_int : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0):=(others => '0');
  signal dma_x_length_written : std_logic:='0';
  signal dma_x_length_int_valid : std_logic:='0';

begin

  -- ***************************************************
  -- management of the input slave AXI interface (modification of 'dma_x_length')
  -- ***************************************************

  -- concurrent generation of the memory mapped register write-control signals
  dmac_mm_regs_valid_wreq_s <= fwd_s_axi_awready and s_axi_wvalid and fwd_s_axi_wready and s_axi_awvalid;
  dmac_mm_regs_wdone_s <= s_axi_bready and fwd_s_axi_bvalid;

  -- process capturing 'x_length'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        dma_x_length_int <= (others => '0');
        dma_x_length_written <= '0';
        dma_x_length_int_valid <= '0';
      else
        -- clear 'dma_x_length_int_valid'
         dma_x_length_int_valid <= '0';

        -- check if there is a new write request to modify the current value of the 'x_length' register
        if dmac_mm_regs_valid_wreq_s = '1' and s_axi_awaddr(cnt_fixed_up_axi_ADDRESS_WIDTH+1 downto 2) = cnt_X_LENGTH_mmreg_addr and dma_x_length_written = '0' then -- 'dma_x_length': we will capture it
          dma_x_length_int <= s_axi_wdata(DMA_LENGTH_WIDTH-1 downto 0);
          dma_x_length_written <= '1';
        -- we will consider the new value valid when the write operation is acknowledged
        elsif dma_x_length_written = '1' and dmac_mm_regs_wdone_s = '1' then
          dma_x_length_written <= '0';
          if dma_x_length_int > cnt_DMA_LENGTH_zero then
            dma_x_length_int_valid <= '1';
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- generation of 'DMA_x_length' outputs
  -- ***************************************************

  -- mapping of the internal signals to the corresponding output ports
  DMA_x_length <= dma_x_length_int;
  DMA_x_length_valid <= dma_x_length_int_valid;

end arch_dac_dmac_xlength_sniffer_RTL_impl;
