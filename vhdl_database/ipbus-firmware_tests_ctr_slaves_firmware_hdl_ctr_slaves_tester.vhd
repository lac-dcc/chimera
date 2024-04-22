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


-- ctr_slaves_tester
--
-- Test entity for the validation of ipbus counter slaves.
-- Control register block gives the ability to increment / decrement specific counter blocks


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_ctr_slaves_tester.all;

entity ctr_slaves_tester is
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

end ctr_slaves_tester;

architecture rtl of ctr_slaves_tester is

	type incdec_t is array(15 downto 0) of std_logic_vector(15 downto 0);

	constant LARGE_BLOCK_SIZE : positive := 5;

	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
	signal ctrl, stat: ipb_reg_v(0 downto 0);
	signal testctrl: ipb_reg_v(2 downto 0);
	signal ctr_rst: std_logic;

	signal incr, decr: std_logic;
	signal increment, decrement: incdec_t;

	signal ctrl_mask_slave, ctrl_mask_channel: std_logic_vector(15 downto 0);
	signal ctrl_action_incr, ctrl_start, ctrl_start_d: std_logic;
	signal ctrl_action_wait, tester_count_sleep: unsigned(2 downto 0);
	signal ctrl_action_count, tester_count_action: unsigned(27 downto 0);

	signal tester_active: std_logic := '0';

begin

-- ipbus address decode
	fabric: entity work.ipbus_fabric_sel
	generic map(
		NSLV => N_SLAVES,
		SEL_WIDTH => IPBUS_SEL_WIDTH)
	port map(
		ipb_in => ipb_in,
		ipb_out => ipb_out,
		sel => ipbus_sel_ctr_slaves_tester(ipb_in.ipb_addr),
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
			stb => open
		);

	stat(0) <= X"abcdfedc";
	soft_rst <= ctrl(0)(0);
	nuke <= ctrl(0)(1);
	ctr_rst <= ctrl(0)(2) or rst;
	userled <= ctrl(0)(4);


-- Utility: registers controlling increment & decrement
	testcsr: entity work.ipbus_syncreg_v
		generic map(
			N_STAT => 1,
			N_CTRL => 3
			)
		port map(
			clk => ipb_clk,
			rst => ipb_rst,
			ipb_in => ipbw(N_SLV_TESTCTRL),
			ipb_out => ipbr(N_SLV_TESTCTRL),
			slv_clk => clk,
			d(0)(31 downto 1) => (others => '0'),
			d(0)(0) => tester_active,
			q => testctrl,
			stb => open,
			rstb => open
		);


	ctrl_mask_slave <= testctrl(0)(31 downto 16);
	ctrl_mask_channel <= testctrl(0)(15 downto 0);

	ctrl_action_incr <= testctrl(1)(31);
	ctrl_action_wait <= unsigned(testctrl(1)(30 downto 28));
	ctrl_action_count <= unsigned(testctrl(1)(27 downto 0));

	ctrl_start <= testctrl(2)(0);

	process (clk)
	begin
		if rising_edge(clk) then
			ctrl_start_d <= ctrl_start;
		end if;
	end process;

	tester_fsm: process (clk)
	begin
		if rising_edge(clk) then
			if ctr_rst = '1' then
				tester_active <= '0';
			else
				if tester_active = '0' and ctrl_start = '1' and ctrl_start_d = '0' then
					tester_active <= '1';
				elsif tester_active = '1' and tester_count_sleep = "000" and tester_count_action = X"0000000" then
					tester_active <= '0';
				end if;
			end if;
		end if;
	end process tester_fsm;

	process (clk)
	begin
		if rising_edge(clk) then
			if tester_active = '0' or tester_count_sleep = "000" then
				tester_count_sleep <= ctrl_action_wait;
			else
				tester_count_sleep <= tester_count_sleep - 1;
			end if;
		end if;
	end process;

	process (clk)
	begin
		if rising_edge(clk) then
			if tester_active = '0' or tester_count_action = X"0000000" then
				tester_count_action <= ctrl_action_count - 1;
			else
				tester_count_action <= tester_count_action - 1;
			end if;
		end if;
	end process;

	-- increment / decrement
	incr <= '1' when tester_active = '1' and tester_count_sleep = "000" and ctrl_action_incr = '1' else '0';
	decr <= '1' when tester_active = '1' and tester_count_sleep = "000" and ctrl_action_incr = '0' else '0';

	gen_incr_slave: for i in 0 to 15 generate
		gen_incr_chan: for j in 0 to 15 generate
			increment(i)(j) <= '1' when incr = '1' and ctrl_mask_slave(i) = '1' and ctrl_mask_channel(j) = '1' else '0';
			decrement(i)(j) <= '1' when decr = '1' and ctrl_mask_slave(i) = '1' and ctrl_mask_channel(j) = '1' else '0';
		end generate gen_incr_chan;
	end generate gen_incr_slave;



-- Counter block slave 1: Small

	slave_ctr_block_1: entity work.ipbus_ctrs_v
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_SMALL),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_SMALL),
			clk => clk,
			rst => ctr_rst,
			inc => increment(0)(0 downto 0),
			dec => decrement(0)(0 downto 0),
			q => open
		);


-- Counter block slave 2: Small, read-write

	slave_ctr_block_2: entity work.ipbus_ctrs_v
		generic map(
			READ_ONLY => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_SMALL_RW),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_SMALL_RW),
			clk => clk,
			rst => ctr_rst,
			inc => increment(1)(0 downto 0),
			dec => decrement(1)(0 downto 0),
			q => open
		);


-- Counter block slave 3: Several counters, each 1 word

	slave_ctr_block_3: entity work.ipbus_ctrs_v
		generic map(
			N_CTRS => 5
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_LARGE),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_LARGE),
			clk => clk,
			rst => ctr_rst,
			inc => increment(2)(4 downto 0),
			dec => decrement(2)(4 downto 0),
			q => open
		);

-- Counter block slave 4: Several counters, each 2 words

	slave_ctr_block_4: entity work.ipbus_ctrs_v
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_LARGE_WIDE),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_LARGE_WIDE),
			clk => clk,
			rst => ctr_rst,
			inc => increment(3)(4 downto 0),
			dec => decrement(3)(4 downto 0),
			q => open
		);

-- Counter block slave 5: Several counters, each 2 words, wraps around

	slave_ctr_block_5: entity work.ipbus_ctrs_v
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			LIMIT => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_LARGE_WIDE_WRAPS),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_LARGE_WIDE_WRAPS),
			clk => clk,
			rst => ctr_rst,
			inc => increment(4)(4 downto 0),
			dec => decrement(4)(4 downto 0),
			q => open
		);

-- Counter block slave 6: Several counters, each 2 words, resets on read

	slave_ctr_block_6: entity work.ipbus_ctrs_v
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			RST_ON_READ => true
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_LARGE_WIDE_READRESET),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_LARGE_WIDE_READRESET),
			clk => clk,
			rst => ctr_rst,
			inc => increment(5)(4 downto 0),
			dec => decrement(5)(4 downto 0),
			q => open
		);

-- Counter block slave 7: Several counters, each 2 words, resets on read, read-write

	slave_ctr_block_7: entity work.ipbus_ctrs_v
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			RST_ON_READ => true,
			READ_ONLY => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_BLOCK_LARGE_WIDE_READRESET_RW),
			ipb_out => ipbr(N_SLV_CTRS_BLOCK_LARGE_WIDE_READRESET_RW),
			clk => clk,
			rst => ctr_rst,
			inc => increment(6)(4 downto 0),
			dec => decrement(6)(4 downto 0),
			q => open
		);




-- Ported counter slave 1: Small

	slave_ctr_ported_1: entity work.ipbus_ctrs_ported
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_SMALL),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_SMALL),
			clk => clk,
			rst => ctr_rst,
			inc => increment(8)(0 downto 0),
			dec => decrement(8)(0 downto 0),
			q => open
		);


-- Ported counter slave 2: Small, read-write

	slave_ctr_ported_2: entity work.ipbus_ctrs_ported
		generic map(
			READ_ONLY => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_SMALL_RW),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_SMALL_RW),
			clk => clk,
			rst => ctr_rst,
			inc => increment(9)(0 downto 0),
			dec => decrement(9)(0 downto 0),
			q => open
		);


-- Ported counter slave 3: Several counters, each 1 word

	slave_ctr_ported_3: entity work.ipbus_ctrs_ported
		generic map(
			N_CTRS => 5
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_LARGE),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_LARGE),
			clk => clk,
			rst => ctr_rst,
			inc => increment(10)(4 downto 0),
			dec => decrement(10)(4 downto 0),
			q => open
		);

-- Ported counter slave 4: Several counters, each 2 words

	slave_ctr_ported_4: entity work.ipbus_ctrs_ported
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_LARGE_WIDE),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_LARGE_WIDE),
			clk => clk,
			rst => ctr_rst,
			inc => increment(11)(4 downto 0),
			dec => decrement(11)(4 downto 0),
			q => open
		);

-- Ported counter slave 5: Several counters, each 2 words, wraps around

	slave_ctr_ported_5: entity work.ipbus_ctrs_ported
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			LIMIT => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_LARGE_WIDE_WRAPS),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_LARGE_WIDE_WRAPS),
			clk => clk,
			rst => ctr_rst,
			inc => increment(12)(4 downto 0),
			dec => decrement(12)(4 downto 0),
			q => open
		);

-- Ported counter slave 6: Several counters, each 2 words, resets on read

	slave_ctr_ported_6: entity work.ipbus_ctrs_ported
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			RST_ON_READ => true
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_LARGE_WIDE_READRESET),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_LARGE_WIDE_READRESET),
			clk => clk,
			rst => ctr_rst,
			inc => increment(13)(4 downto 0),
			dec => decrement(13)(4 downto 0),
			q => open
		);

-- Ported counter slave 7: Several counters, each 2 words, resets on read, read-write

	slave_ctr_ported_7: entity work.ipbus_ctrs_ported
		generic map(
			N_CTRS => 5,
			CTR_WDS => 2,
			RST_ON_READ => true,
			READ_ONLY => false
		)
		port map(
			ipb_clk => ipb_clk,
			ipb_rst => ipb_rst,
			ipb_in => ipbw(N_SLV_CTRS_PORTED_LARGE_WIDE_READRESET_RW),
			ipb_out => ipbr(N_SLV_CTRS_PORTED_LARGE_WIDE_READRESET_RW),
			clk => clk,
			rst => ctr_rst,
			inc => increment(14)(4 downto 0),
			dec => decrement(14)(4 downto 0),
			q => open
		);

end rtl;
