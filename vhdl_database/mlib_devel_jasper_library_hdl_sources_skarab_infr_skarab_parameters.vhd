---------------------------------------------------------------------------------------------------
--
-- Title       : parameter
-- Design      : FRM121401U1R1
-- Author      : Gavin Teague
-- Company     : Peralex
--
---------------------------------------------------------------------------------------------------
--
-- File        : parameter.vhd
-- Generated   : Tue Feb 22 08:48:52 2005
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description :
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--library synplify;
--use synplify.attributes.all;
-- pragma translate_off
library UNISIM; 
use UNISIM.VCOMPONENTS.ALL;
-- pragma translate_on
package parameter is

    -- GLOBAL CONSTANTS
    constant C_VERSION : std_logic_vector(31 downto 0) := X"00030001";

    -- TYPE DEFINES
	constant C_NUM_REGISTERS : integer := 32;
	constant C_NUM_REGISTER_ADDRESS_BITS : integer := 5;
	
	subtype ST_REGISTER is std_logic_vector(31 downto 0);
	type T_REGISTER_BLOCK is array(0 to (C_NUM_REGISTERS - 1)) of ST_REGISTER;

    -- REGISTER ADDRESSES
    -- READ REGISTERS
    constant C_RD_VERSION_ADDR          : integer := 0;
    constant C_RD_BRD_CTL_STAT_0_ADDR   : integer := 1;
    constant C_RD_LOOPBACK_ADDR         : integer := 2;
    constant C_RD_ETH_IF_LINK_UP_ADDR   : integer := 3;
    constant C_RD_MEZZANINE_STAT_0_ADDR : integer := 4;
    constant C_RD_USB_STAT_ADDR         : integer := 5;
    constant C_RD_SOC_VERSION_ADDR      : integer := 6;
    constant C_RD_FPGA_DNA_LOW_ADDR     : integer := 7;
    constant C_RD_FPGA_DNA_HIGH_ADDR    : integer := 8;
    constant C_RD_XADC_STATUS_ADDR        : integer := 9;
    constant C_RD_XADC_LATCHED_ADDR        : integer := 10;
    -- > Assign register space to new register for LED Control
    -- -> Has to be the same integer value for the WR_ADDR
    constant C_RD_UBLAZE_ALIVE_ADDR         : integer := 11;
    constant C_RD_MEZZANINE_STAT_1_ADDR     : integer := 12;
    constant C_RD_DSP_OVERRIDE_ADDR         : integer := 13;

    -- offsets of the multiple 40gbe cores
    constant C_RD_40GBE_IF_0_OFFSET_ADDR     : integer := 14;
    constant C_RD_40GBE_IF_1_OFFSET_ADDR     : integer := 15;
    constant C_RD_40GBE_IF_2_OFFSET_ADDR     : integer := 16;
    constant C_RD_40GBE_IF_3_OFFSET_ADDR     : integer := 17;


    constant C_RD_THROUGHPUT_COUNTER_ADDR     : integer := 22;
    constant C_RD_NUM_PACKETS_CHECKED_0_ADDR     : integer := 23;
    constant C_RD_NUM_PACKETS_CHECKED_1_ADDR     : integer := 24;
    constant C_RD_NUM_PACKETS_CHECKED_2_ADDR     : integer := 25;
    constant C_RD_NUM_PACKETS_CHECKED_3_ADDR     : integer := 26;
    constant C_RD_NUM_PACKETS_CHECKED_4_ADDR     : integer := 27;
    constant C_RD_MEZZANINE_CLK_FREQ_ADDR  : integer := 29;
    constant C_RD_CONFIG_CLK_FREQ_ADDR  : integer := 30;
    constant C_RD_AUX_CLK_FREQ_ADDR     : integer := 31;

    -- WRITE REGISTERS
    constant C_WR_BRD_CTL_STAT_0_ADDR       : integer := 1;
    constant C_WR_LOOPBACK_ADDR             : integer := 2;
    constant C_WR_ETH_IF_CTL_ADDR           : integer := 3;
    constant C_WR_MEZZANINE_CTL_ADDR		: integer := 4;
    constant C_WR_FRONT_PANEL_STAT_LED_ADDR : integer := 5;
    constant C_WR_BRD_CTL_STAT_1_ADDR       : integer := 6;
    constant C_WR_XADC_CONTROL_ADDR         : integer := 7;
    -- > Assign register space to new register for LED Control
    -- -> Has to be the same integer value for the RD_ADDR
    constant C_WR_UBLAZE_ALIVE_ADDR         : integer := 11;

    constant C_WR_DSP_OVERRIDE_ADDR         : integer := 13;

    constant C_WR_RAMP_SOURCE_DESTINATION_IP_3_ADDR     : integer := 22;
    constant C_WR_RAMP_CHECKER_SOURCE_IP_3_ADDR         : integer := 23;
    constant C_WR_RAMP_SOURCE_DESTINATION_IP_2_ADDR     : integer := 24;
    constant C_WR_RAMP_CHECKER_SOURCE_IP_2_ADDR         : integer := 25;
    constant C_WR_RAMP_SOURCE_DESTINATION_IP_1_ADDR     : integer := 26;
    constant C_WR_RAMP_CHECKER_SOURCE_IP_1_ADDR         : integer := 27;
    constant C_WR_RAMP_SOURCE_PAYLOAD_WORDS_ADDR        : integer := 28;
    constant C_WR_RAMP_SOURCE_DESTINATION_IP_0_ADDR     : integer := 29;
    constant C_WR_RAMP_CHECKER_SOURCE_IP_0_ADDR         : integer := 30;
    constant C_WR_NUM_PACKETS_TO_GENERATE_ADDR   : integer := 31;

    -- WISHBONE SPECIFIC CONSTANTS AND TYPE DEFINES
    constant C_WB_MST_ADDRESS_BITS : integer := 32;
    constant C_WB_SLV_ADDRESS_BITS : integer := 32;
    constant C_WB_NUM_SLAVES : integer := 15;
    constant C_WB_MAX_NUM_SLAVES : integer := 16;

    subtype ST_WB_DATA is std_logic_vector(31 downto 0);
    type T_SLAVE_WB_DATA is array (0 to (C_WB_NUM_SLAVES - 1)) of ST_WB_DATA;
    
    subtype ST_SLAVE_WB_ADDRESS is std_logic_vector((C_WB_SLV_ADDRESS_BITS - 1) downto 0);
    type T_SLAVE_WB_ADDRESS is array (0 to (C_WB_NUM_SLAVES - 1)) of ST_SLAVE_WB_ADDRESS;

    subtype ST_WB_SEL is std_logic_vector(3 downto 0);
    type T_SLAVE_WB_SEL is array (0 to (C_WB_NUM_SLAVES - 1)) of ST_WB_SEL;

    -- 40GBE MAC SPECIFIC CONSTANTS AND TYPE DEFINES
    constant C_NUM_40GBE_MAC : integer := 4;

    subtype ST_40GBE_LED_CTRL is std_logic_vector(1 downto 0);
    type T_40GBE_LED_CTRL is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_LED_CTRL;

    subtype ST_40GBE_DATA_VALID is std_logic_vector(3 downto 0);
    type T_40GBE_DATA_VALID is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_DATA_VALID;

    subtype ST_40GBE_DATA is std_logic_vector(255 downto 0);
    type T_40GBE_DATA is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_DATA;

    subtype ST_40GBE_IP_ADDRESS is std_logic_vector(31 downto 0);
    type T_40GBE_IP_ADDRESS is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_IP_ADDRESS;

    subtype ST_40GBE_PORT_ADDRESS is std_logic_vector(15 downto 0);
    type T_40GBE_PORT_ADDRESS is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_PORT_ADDRESS;

    subtype ST_40GBE_MAC_ADDRESS is std_logic_vector(47 downto 0);
    type T_40GBE_MAC_ADDRESS is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_MAC_ADDRESS;

    subtype ST_40GBE_GATEWAY_ADDRESS is std_logic_vector(7 downto 0);
    type T_40GBE_GATEWAY_ADDRESS is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_GATEWAY_ADDRESS;

    subtype ST_40GBE_XLGMII_DATA is std_logic_vector(255 downto 0);
    type T_40GBE_XLGMII_DATA is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_XLGMII_DATA;

    subtype ST_40GBE_XLGMII_CONTROL is std_logic_vector(31 downto 0);
    type T_40GBE_XLGMII_CONTROL is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_XLGMII_CONTROL;

    subtype ST_40GBE_XLGMII_NUM_PACKETS_CHECKED is std_logic_vector(23 downto 0);
    type T_40GBE_XLGMII_NUM_PACKETS_CHECKED is array (0 to (C_NUM_40GBE_MAC - 1)) of ST_40GBE_XLGMII_NUM_PACKETS_CHECKED;

end parameter;
