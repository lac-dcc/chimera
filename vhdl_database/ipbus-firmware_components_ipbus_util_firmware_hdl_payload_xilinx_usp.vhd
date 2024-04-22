---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- Jeroen Hegeman, December 2019

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_ipbus_example_xilinx_usp.all;

entity payload is
  port (
    ipb_clk : in std_logic;
    ipb_rst : in std_logic;
    ipb_in : in ipb_wbus;
    ipb_out : out ipb_rbus;
    clk : in std_logic;
    rst : in std_logic;
    nuke : out std_logic;
    soft_rst : out std_logic;
    userled : out std_logic
  );

end payload;

architecture rtl of payload is

  signal ipbw : ipb_wbus_array(N_SLAVES - 1 downto 0);
  signal ipbr : ipb_rbus_array(N_SLAVES - 1 downto 0);

  signal m_axi_awready : std_logic;
  signal m_axi_awvalid : std_logic;
  signal m_axi_awaddr : std_logic_vector(31 downto 0);
  signal m_axi_wready : std_logic;
  signal m_axi_wvalid : std_logic;
  signal m_axi_wdata : std_logic_vector(31 downto 0);
  signal m_axi_wstrb : std_logic_vector(3 downto 0);
  signal m_axi_bready : std_logic;
  signal m_axi_bvalid : std_logic;
  signal m_axi_bresp : std_logic_vector(1 downto 0);
  signal s_axi_arready : std_logic;
  signal s_axi_arvalid : std_logic;
  signal s_axi_araddr : std_logic_vector(31 downto 0);
  signal s_axi_rready : std_logic;
  signal s_axi_rvalid : std_logic;
  signal s_axi_rdata : std_logic_vector(31 downto 0);
  signal s_axi_rresp : std_logic_vector(1 downto 0);

  signal axi_stat : ipb_reg_v(0 downto 0);
  signal axi_traffic_done : std_logic;
  signal axi_traffic_status : std_logic_vector(31 downto 0);
  signal axi_bridged_data : std_logic_vector(31 downto 0);

  -- Yeah.... Not pretty, but it makes it easier to create
  -- a simple piece of example code.
  signal nuke_i : std_logic;
  signal soft_rst_i : std_logic;

  attribute keep : string;
  attribute keep of nuke_i : signal is "true";
  attribute keep of soft_rst_i : signal is "true";

begin

  fabric : entity work.ipbus_fabric_sel
    generic map (
      NSLV      => N_SLAVES,
      SEL_WIDTH => IPBUS_SEL_WIDTH
    )
    port map (
      ipb_in          => ipb_in,
      ipb_out         => ipb_out,
      sel             => ipbus_sel_ipbus_example_xilinx_usp(ipb_in.ipb_addr),
      ipb_to_slaves   => ipbw,
      ipb_from_slaves => ipbr
    );

  --==========

  device_dna : entity work.ipbus_device_dna_us_usp
    port map (
      clk     => ipb_clk,
      rst     => ipb_rst,
      ipb_in  => ipbw(N_SLV_DEVICE_DNA),
      ipb_out => ipbr(N_SLV_DEVICE_DNA)
    );

  --==========

  sysmon : entity work.ipbus_sysmon_usp
    port map (
      clk     => ipb_clk,
      rst     => ipb_rst,
      ipb_in  => ipbw(N_SLV_SYSMON),
      ipb_out => ipbr(N_SLV_SYSMON),
      i2c_scl => '0',
      i2c_sda => '0'
    );

  --==========

  icap : entity work.ipbus_icap_us_usp
    port map (
      clk     => ipb_clk,
      rst     => ipb_rst,
      ipb_in  => ipbw(N_SLV_ICAP),
      ipb_out => ipbr(N_SLV_ICAP)
    );

  --==========

  iprog : entity work.ipbus_iprog_us_usp
   port map (
     clk     => ipb_clk,
     rst     => ipb_rst,
     ipb_in  => ipbw(N_SLV_IPROG),
     ipb_out => ipbr(N_SLV_IPROG)
   );

  --==========

  axi_bridge : entity work.ipbus_axi4lite_master
    port map (
      clk     => ipb_clk,
      rst     => ipb_rst,
      ipb_in  => ipbw(N_SLV_AXI_BRIDGE),
      ipb_out => ipbr(N_SLV_AXI_BRIDGE),

      m_axi_clock   => ipb_clk,
      m_axi_awaddr  => m_axi_awaddr,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_awready => m_axi_awready,
      m_axi_wdata   => m_axi_wdata,
      m_axi_wstrb   => m_axi_wstrb,
      m_axi_size    => open,
      m_axi_wvalid  => m_axi_wvalid,
      m_axi_wready  => m_axi_wready,
      m_axi_bresp   => m_axi_bresp,
      m_axi_bvalid  => m_axi_bvalid,
      m_axi_bready  => m_axi_bready,
      m_axi_araddr  => s_axi_araddr,
      m_axi_arvalid => s_axi_arvalid,
      m_axi_arready => s_axi_arready,
      m_axi_rdata   => s_axi_rdata,
      m_axi_rvalid  => s_axi_rvalid,
      m_axi_rready  => s_axi_rready,
      m_axi_rresp   => s_axi_rresp
    );

  -- We (ab)use an AXI GPIO interface to extract the results of our
  -- AXI transaction in the form of a register for verification.
  axi_gpio : entity work.axi_gpio_example
    port map (
      s_axi_aclk    => ipb_clk,
      s_axi_aresetn => not ipb_rst,
      s_axi_awaddr  => m_axi_awaddr(8 downto 0),
      s_axi_awvalid => m_axi_awvalid,
      s_axi_awready => m_axi_awready,
      s_axi_wdata   => m_axi_wdata,
      s_axi_wstrb   => m_axi_wstrb,
      s_axi_wvalid  => m_axi_wvalid,
      s_axi_wready  => m_axi_wready,
      s_axi_bresp   => m_axi_bresp,
      s_axi_bvalid  => m_axi_bvalid,
      s_axi_bready  => m_axi_bready,
      s_axi_araddr  => s_axi_araddr(8 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata   => s_axi_rdata,
      s_axi_rresp   => s_axi_rresp,
      s_axi_rvalid  => s_axi_rvalid,
      s_axi_rready  => s_axi_rready,
      gpio_io_o     => axi_bridged_data
    );

  axi_demo_readback_register : entity work.ipbus_ctrlreg_v
    generic map (
      N_CTRL => 0,
      N_STAT => 1
    )
    port map (
      clk => ipb_clk,
      reset => ipb_rst,
      ipbus_in => ipbw(N_SLV_AXI_READBACK_REG),
      ipbus_out => ipbr(N_SLV_AXI_READBACK_REG),
      d => axi_stat,
      q => open
    );

  axi_stat(0) <= axi_bridged_data;

  --==========

  nuke_i     <= '0';
  nuke       <= nuke_i;
  soft_rst_i <= '0';
  soft_rst   <= soft_rst_i;
  userled    <= '0';

end rtl;
