--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.system_control_regs_pkg.all;
library xpm;
use xpm.vcomponents.all;

--! | Offset | Name | Description | Type | Access | Attributes | Reset | 
--! | ---    | --- | --- | --- | --- | --- | --- |
--! | `0x4` | SYSTEM_CONTROL_ID | | REG | R |  | `0xBBCAFE` |
--! |        |  [31:0] ID |  |  |  |  | `0xBBCAFE` |
--! | `0x8` | SYSTEM_CONTROL_ADC_FSM_STATUS | | REG | R |  | `0x0` |
--! |        |  [31:0] value |  |  |  |  | `0x0` |
--! | `0xC` | SYSTEM_CONTROL_DAC_FSM_STATUS | | REG | R |  | `0x0` |
--! |        |  [31:0] value |  |  |  |  | `0x0` |
--! | `0x10` | SYSTEM_CONTROL_DAC_LATE_FLAG | | REG | R |  | `0x0` |
--! |        |  [31:0] value |  |  |  |  | `0x0` |

entity system_control_top is
  generic (
    PARAM_AXI_ADDR_WIDTH : integer := 32 --! AXI address width
  );
  port (
    clk : in std_logic; --! ADC clock
    -- AXI common
    axi_aclk    : in std_logic; --! AXI4-lite
    axi_aresetn : in std_logic; --! AXI4-lite
    -- AXI Write Address Channel
    s_axi_awaddr  : in std_logic_vector(PARAM_AXI_ADDR_WIDTH - 1 downto 0); --! AXI4-lite
    s_axi_awprot  : in std_logic_vector(2 downto 0); --! AXI4-lite
    s_axi_awvalid : in std_logic; --! AXI4-lite
    s_axi_awready : out std_logic; --! AXI4-lite
    -- AXI Write Data Channel
    s_axi_wdata  : in std_logic_vector(31 downto 0); --! AXI4-lite
    s_axi_wstrb  : in std_logic_vector(3 downto 0); --! AXI4-lite
    s_axi_wvalid : in std_logic; --! AXI4-lite
    s_axi_wready : out std_logic; --! AXI4-lite
    -- AXI Read Address Channel
    s_axi_araddr  : in std_logic_vector(PARAM_AXI_ADDR_WIDTH - 1 downto 0); --! AXI4-lite
    s_axi_arprot  : in std_logic_vector(2 downto 0); --! AXI4-lite
    s_axi_arvalid : in std_logic; --! AXI4-lite
    s_axi_arready : out std_logic; --! AXI4-lite
    -- AXI Read Data Channel
    s_axi_rdata  : out std_logic_vector(31 downto 0); --! AXI4-lite
    s_axi_rresp  : out std_logic_vector(1 downto 0); --! AXI4-lite
    s_axi_rvalid : out std_logic; --! AXI4-lite
    s_axi_rready : in std_logic; --! AXI4-lite
    -- AXI Write Response Channel
    s_axi_bresp    : out std_logic_vector(1 downto 0); --! AXI4-lite
    s_axi_bvalid   : out std_logic; --! AXI4-lite
    s_axi_bready   : in std_logic; --! AXI4-lite

    adc_fsm_status_read_out : out std_logic;
    adc_fsm_status_in : in std_logic_vector(31 downto 0);
    adc_fsm_status_valid_in : in std_logic;

    dac_fsm_status_read_out : out std_logic;
    dac_late_flag_in : in std_logic;
    dac_late_flag_valid_in : in std_logic;
    dac_fsm_status_in : in std_logic_vector(31 downto 0);
    dac_fsm_status_valid_in : in std_logic

  );
end entity system_control_top;

architecture RTL of system_control_top is
  signal regs2user            : regs2user_t;
  signal user2regs            : user2regs_t;
  signal s_axi_araddr_reduce  : std_logic_vector(31 downto 0) := (others => '0');
  signal s_axi_awaddr_reduce  : std_logic_vector(31 downto 0) := (others => '0');
  constant cnt_BASEADDR       : std_logic_vector(31 downto 0) := x"00000000";
  constant cnt_IP_VERSION     : integer                       := 1;
  constant cnt_IP_CONFIG_ID   : std_logic_vector              := x"BEBECAFE";
  constant cnt_AXI_DATA_WIDTH : integer                       := 32;
  
  signal r0_dac_late_flag : std_logic := '0';
  signal r0_dac_fsm_status : std_logic_vector(31 downto 0) := (others => '0');
  signal r0_adc_fsm_status : std_logic_vector(31 downto 0) := (others => '0');
begin

  s_axi_araddr_reduce(11 downto 0) <= s_axi_araddr(11 downto 0);
  s_axi_awaddr_reduce(11 downto 0) <= s_axi_awaddr(11 downto 0);
  axi_lite_reset_regs_inst : entity work.system_control_regs
    generic map(
      AXI_ADDR_WIDTH => PARAM_AXI_ADDR_WIDTH,
      BASEADDR       => cnt_BASEADDR
    )
    port map(
      axi_aclk      => axi_aclk,
      axi_aresetn   => axi_aresetn,
      s_axi_awaddr  => s_axi_awaddr_reduce,
      s_axi_awprot  => s_axi_awprot,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata   => s_axi_wdata,
      s_axi_wstrb   => s_axi_wstrb,
      s_axi_wvalid  => s_axi_wvalid,
      s_axi_wready  => s_axi_wready,
      s_axi_araddr  => s_axi_araddr_reduce,
      s_axi_arprot  => s_axi_arprot,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata   => s_axi_rdata,
      s_axi_rresp   => s_axi_rresp,
      s_axi_rvalid  => s_axi_rvalid,
      s_axi_rready  => s_axi_rready,
      s_axi_bresp   => s_axi_bresp,
      s_axi_bvalid  => s_axi_bvalid,
      s_axi_bready  => s_axi_bready,
      user2regs     => user2regs,
      regs2user     => regs2user
    );

  -- Config ID
  user2regs.system_control_id_id <= cnt_IP_CONFIG_ID;

  ------------------------------------------------------------------------------
  -- CDC ADC: FSM status read
  ------------------------------------------------------------------------------ 
  sync_adc_fsm_read_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 1,    
      SYNCH_ACTIVE => true
    )
    port map (
      src_clk => axi_aclk,
      src_data(0) => '1',
      src_data_valid => regs2user.system_control_adc_fsm_status_strobe,
      dst_clk => clk,
      dst_data => open,
      dst_data_valid => adc_fsm_status_read_out
    );

  ------------------------------------------------------------------------------
  -- CDC ADC: FSM status
  ------------------------------------------------------------------------------  
  process (clk)
  begin
    if rising_edge(clk) then
      if (adc_fsm_status_valid_in = '1') then
        r0_adc_fsm_status <= adc_fsm_status_in;
      end if;
    end if;
  end process;

  sync_adc_fsm_status_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 32,    
      SYNCH_ACTIVE => true
    )
    port map (
      src_clk => clk,
      src_data => r0_adc_fsm_status,
      src_data_valid => '1',
      dst_clk => axi_aclk,
      dst_data => user2regs.system_control_adc_fsm_status_value,
      dst_data_valid => open
    );

  ------------------------------------------------------------------------------
  -- CDC DAC: FSM status read
  ------------------------------------------------------------------------------ 
  process (axi_aclk)
  begin
    if rising_edge(axi_aclk) then
      dac_fsm_status_read_out <= regs2user.system_control_dac_fsm_status_strobe;
    end if;
  end process;

  ------------------------------------------------------------------------------
  -- CDC DAC: FSM status
  ------------------------------------------------------------------------------
  process (axi_aclk)
  begin
    if rising_edge(axi_aclk) then
      if (dac_fsm_status_valid_in = '1') then
        user2regs.system_control_dac_fsm_status_value <= dac_fsm_status_in;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------------------
  -- CDC DAC: late flag
  ------------------------------------------------------------------------------
  process (axi_aclk)
  begin
    if rising_edge(axi_aclk) then
      if (dac_late_flag_valid_in = '1') then
        user2regs.system_control_dac_late_flag_value(0) <= dac_late_flag_in;
      end if;
    end if;
  end process;

end architecture RTL;