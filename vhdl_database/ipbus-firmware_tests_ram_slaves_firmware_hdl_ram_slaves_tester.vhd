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


-- ram_slaves
--
-- Test entity for the validation of ipbus ram slaves.
-- Includes a 72b pattern generator and capture logic 
-- to populate the rams from the payload clock domain.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_ram_slaves_testbench.all;

entity ram_slaves_tester is
	port(
		ipb_clk: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clk: in std_logic;
		rst: in std_logic;
		nuke: out std_logic;
		soft_rst: out std_logic;
		userled: out std_logic
	);

end ram_slaves_tester;

architecture rtl of ram_slaves_tester is
	constant ADDR_WIDTH : positive := 10;
	constant PATT_DATA_WIDTH : positive := 72;
	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
	signal ctrl, stat: ipb_reg_v(0 downto 0);
	signal ctrl_stb: std_logic_vector(0 downto 0);
	signal patt_stb: std_logic;
	signal patt_addr: std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal patt_data: std_logic_vector(PATT_DATA_WIDTH-1 downto 0);


begin

-- ipbus address decode
		
	fabric: entity work.ipbus_fabric_sel
    generic map(
    	NSLV => N_SLAVES,
    	SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
		ipb_in => ipb_in,
		ipb_out => ipb_out,
		sel => ipbus_sel_ram_slaves_testbench(ipb_in.ipb_addr),
		ipb_to_slaves => ipbw,
		ipb_from_slaves => ipbr
    );


-- CSR: id / rst reg

	csr: entity work.ipbus_ctrlreg_v
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(N_SLV_CSR),
			ipbus_out => ipbr(N_SLV_CSR),
			d => stat,
			q => ctrl,
			stb => ctrl_stb
		);
		
		stat(0) <= X"abcdfedc";
		soft_rst <= ctrl(0)(0);
		nuke <= ctrl(0)(1);
		userled <= ctrl(0)(2);


-- Utility: pattern generator
	patt_gen: entity work.ram_pattern_generator
		generic map(
			ADDR_WIDTH => ADDR_WIDTH,
			DATA_WIDTH => PATT_DATA_WIDTH
			)
	  	port map (
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_PATT_GEN),
			ipb_out => ipbr(N_SLV_PATT_GEN),
			clk => clk,
			rst => rst,
			stb => patt_stb,
			addr => patt_addr,
			q => patt_data
	  	);


-- Slave Register 1: Simple ipbus register

	slave_reg_1: entity work.ipbus_reg_v
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(N_SLV_REG),
			ipbus_out => ipbr(N_SLV_REG),
			q => open
		);

-- Slave Ported RAM 1: peephole RAM

	slave_pram_1: entity work.ipbus_peephole_ram
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(N_SLV_PORTED_RAM),
			ipbus_out => ipbr(N_SLV_PORTED_RAM)
		);

-- Slave Ported RAM 2: 1kword dual-port RAM
	slave_pram_2: entity work.ipbus_ported_dpram
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_PORTED_DPRAM),
			ipb_out => ipbr(N_SLV_PORTED_DPRAM),
			rclk => clk,
			we => patt_stb,
			d => patt_data(31 downto 0),
			q => open,
			addr => patt_addr
		);

--  Ported RAM slave 3: 1kword dual-port RAM
	slave_pram_3: entity work.ipbus_ported_dpram36
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_PORTED_DPRAM36),
			ipb_out => ipbr(N_SLV_PORTED_DPRAM36),
			rclk => clk,
			we => patt_stb,
			d => patt_data(35 downto 0),
			q => open,
			addr => patt_addr
		);

	--  Ported RAM slave 4: 1kword dual-port RAM
	slave_pram_4: entity work.ipbus_ported_dpram72
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_PORTED_DPRAM72),
			ipb_out => ipbr(N_SLV_PORTED_DPRAM72),
			rclk => clk,
			we => patt_stb,
			d => patt_data,
			q => open,
			addr => patt_addr
		);


	--  Ported RAM slave 5: 1kword simple dual-port RAM
	slave_pram_5: entity work.ipbus_ported_sdpram72
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_PORTED_SDPRAM72),
			ipb_out => ipbr(N_SLV_PORTED_SDPRAM72),
			wclk => clk,
			we => patt_stb,
			d => patt_data,
			--q => open,
			addr => patt_addr
		);

-- RAM Slave 1: 1kword RAM
	slave_ram_1: entity work.ipbus_ram
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(N_SLV_RAM),
			ipbus_out => ipbr(N_SLV_RAM)
		);


-- RAM Slave 2: 1kB dual port RAM
	slave_ram_2: entity work.ipbus_dpram
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_DPRAM),
			ipb_out => ipbr(N_SLV_DPRAM),
			rclk => clk,
			we => patt_stb,
			d => patt_data(31 downto 0),
			q => open,
			addr => patt_addr
		);


-- RAM Slave 3: 1kB dual port RAM 36
	slave_ram_3: entity work.ipbus_dpram36
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_DPRAM36),
			ipb_out => ipbr(N_SLV_DPRAM36),
			rclk => clk,
			we => patt_stb,
			d => patt_data(35 downto 0),
			q => open,
			addr => patt_addr
		);

-- RAM Slave 3: 1kB dual port RAM 36
	slave_ram_4: entity work.ipbus_sdpram72
		generic map(ADDR_WIDTH => ADDR_WIDTH)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_SDPRAM72),
			ipb_out => ipbr(N_SLV_SDPRAM72),
			wclk => clk,
			we => patt_stb,
			d => patt_data,
			--q => open,
			addr => patt_addr
		);

end rtl;
