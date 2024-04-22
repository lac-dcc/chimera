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


-- The state machine which controls the ipbus itself
--
-- This version for ipbus 2.0
--
-- All details of the ipbus transaction protocol itself are in here.
-- However, the module knows nothing about the transport layer, and
-- just processes the transactions it's handed.
--
-- Dave Newbold, October 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.ipbus.all;

entity transactor_sm is
	port(
		clk: in std_logic; 
		rst: in std_logic;
		rx_data: in std_logic_vector(31 downto 0); -- Input packet data
		rx_ready: in std_logic; -- Asserted when valid input packet data is available
		rx_next: out std_logic; -- New input packet data please
		tx_data: out std_logic_vector(31 downto 0); -- Output packet data
		tx_we: out std_logic; -- Valid output word
		tx_hdr: out std_logic; -- Marks a transaction header
		tx_err: out std_logic; -- Asserted if we end the packet early due to error
		ipb_out: out ipb_wbus;
		ipb_in: in ipb_rbus;
		cfg_we: out std_logic; -- local bus write enable
		cfg_addr: out std_logic_vector(1 downto 0); -- local bus addr
		cfg_din: in std_logic_vector(31 downto 0); -- local bus data
		cfg_dout: out std_logic_vector(31 downto 0)
	);
 
end transactor_sm;

architecture rtl of transactor_sm is

	constant TIMEOUT: integer := 255;

	constant TRANS_RD: std_logic_vector(3 downto 0) := X"0";
	constant TRANS_WR: std_logic_vector(3 downto 0) := X"1";
	constant TRANS_RDN: std_logic_vector(3 downto 0) := X"2";
	constant TRANS_WRN: std_logic_vector(3 downto 0) := X"3";
	constant TRANS_RMWB: std_logic_vector(3 downto 0) := X"4";
	constant TRANS_RMWS: std_logic_vector(3 downto 0) := X"5";
	constant TRANS_RD_CFG: std_logic_vector(3 downto 0) := X"6";
	constant TRANS_WR_CFG: std_logic_vector(3 downto 0) := X"7";

	type state_type is (ST_IDLE, ST_HDR, ST_ADDR, ST_BUS_CYCLE, ST_RMW_1, ST_RMW_2);
	signal state: state_type;

	signal rx_ready_d, start, rmw_cyc, cfg_cyc, rmw_write, write, strobe, ack, last_wd: std_logic;
	signal trans_type: std_logic_vector(3 downto 0);
	signal addr: unsigned(31 downto 0);
	signal words_todo, words_done: unsigned(7 downto 0);
	signal timer: unsigned(7 downto 0);
	signal rmw_coeff, rmw_input, rmw_result, data_out: std_logic_vector(31 downto 0);
	signal err, err_d: std_logic_vector(3 downto 0);
	signal hdr: std_logic_vector(31 downto 0);

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= ST_IDLE;
			else		
				case state is
-- Starting state
				when ST_IDLE =>
					if start = '1' then
						state <= ST_HDR;
					end if;
-- Decode header word			
				when ST_HDR =>
					if rx_ready = '0' or err /= X"0" or err_d /= X"0" then
						state <= ST_IDLE;
					else
						state <= ST_ADDR;
					end if;
-- Load address counter
				when ST_ADDR =>
					if words_todo /= X"00" then
						state <= ST_BUS_CYCLE;
					else
						state <= ST_HDR;
					end if;
-- The bus transaction
				when ST_BUS_CYCLE =>
					if err /= X"0" then
						state <= ST_HDR;
					elsif ack = '1' and last_wd = '1'  then
						if rmw_cyc = '1' and rmw_write = '0' then
							state <= ST_RMW_1;
						else
							state <= ST_HDR;
						end if;
					elsif timer = TIMEOUT then
						state <= ST_HDR;
					end if;
-- RMW operations
				when ST_RMW_1 =>
					if trans_type = TRANS_RMWB then
						state <= ST_RMW_2;
					else
						state <= ST_BUS_CYCLE;
					end if;
				
				when ST_RMW_2 =>
					state <= ST_BUS_CYCLE;
			
				end case;
			end if;
			
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then

			rx_ready_d <= rx_ready;

			if state = ST_HDR then
				hdr <= rx_data;
			end if;
	
			if state = ST_ADDR then
				addr <= unsigned(rx_data);
			elsif ack = '1' and (trans_type = TRANS_RD or trans_type = TRANS_WR) then
				addr <= addr + 1;
			end if;
	
			if state = ST_HDR then
				words_todo <= unsigned(rx_data(15 downto 8));
			elsif state = ST_RMW_1 then
				words_todo <= (others => '0');
			elsif state = ST_ADDR or ack = '1' then
				words_todo <= words_todo - 1;
			end if;

			if state = ST_HDR then
				words_done <= (others => '0');
			elsif ack = '1' and (rmw_cyc = '0' or rmw_write = '1') then
				words_done <= words_done + 1;
			end if;
	
			if state = ST_ADDR or state = ST_RMW_1 or ack = '1' then
				timer <= (others => '0');
			elsif strobe = '1' then
				timer <= timer + 1;
			end if;
		
			if state = ST_HDR then
				rmw_write <= '0';
			elsif state = ST_RMW_1 then
				rmw_write <= '1';
			end if;
		
			if state = ST_RMW_1 then
				rmw_coeff <= rx_data;
				rmw_result <= std_logic_vector(unsigned(rmw_input) + unsigned(rx_data));
			elsif state = ST_RMW_2 then
				rmw_result <= (rmw_input and rmw_coeff) or rx_data;
			end if;
		
			if ack = '1' then
				rmw_input <= ipb_in.ipb_rdata;
			end if;
		
			if state = ST_IDLE then
				err_d <= X"0";
			else
				err_d <= err;
			end if;
		
		end if;
	end process;

	start <= rx_ready and not rx_ready_d;
	last_wd <= '1' when words_todo = 0 else '0';
	trans_type <= hdr(7 downto 4);

	strobe <= '1' when state = ST_BUS_CYCLE and cfg_cyc = '0' else '0';
	write <= '1' when trans_type = TRANS_WR or trans_type = TRANS_WRN or trans_type = TRANS_WR_CFG
		or rmw_write = '1' else '0';
	rx_next <= '1' when state = ST_HDR or state = ST_RMW_1 or state = ST_RMW_2 or 
				(state = ST_ADDR and (write='1' or words_todo = X"00")) or
				(state = ST_BUS_CYCLE and (ack and (strobe or cfg_cyc) and (write or last_wd) and not rmw_write) = '1')
				else '0';
	rmw_cyc <= '1' when trans_type = TRANS_RMWB or trans_type = TRANS_RMWS else '0';
	cfg_cyc <= '1' when trans_type = TRANS_RD_CFG or trans_type = TRANS_WR_CFG else '0';

	process(state, rx_data, ipb_in.ipb_err, timer, write)
	begin
		err <= X"0";
		if state = ST_HDR then
			if rx_data(31 downto 28) /= X"2" or rx_data(3 downto 0) /= X"f" then
				err <= "0001";
			end if;
		elsif state = ST_BUS_CYCLE then
			if ipb_in.ipb_err = '1' then
				err <= "010" & write;
			elsif timer = TIMEOUT then
				err <= "011" & write;
			end if;
		end if;
	end process;

	ack <= ipb_in.ipb_ack or ipb_in.ipb_err or cfg_cyc;
	
	ipb_out.ipb_addr <= std_logic_vector(addr);
	ipb_out.ipb_write <= write;
	ipb_out.ipb_strobe <= strobe;
	ipb_out.ipb_wdata <= rx_data when rmw_cyc = '0' else rmw_result;

	data_out <= ipb_in.ipb_rdata when cfg_cyc = '0' else cfg_din;

	tx_data <= (hdr(31 downto 16) & std_logic_vector(words_done) & hdr(7 downto 4) & err_d) when state = ST_HDR else data_out;
	tx_we <= '1' when state = ST_HDR or (state = ST_BUS_CYCLE and (ack and not write) = '1') else '0';
	tx_hdr <= '1' when state = ST_HDR else '0';
	tx_err <= '1' when err_d /= X"0" else '0';

	cfg_addr <= std_logic_vector(addr(1 downto 0));
	cfg_we <= '1' when state = ST_BUS_CYCLE and trans_type = TRANS_WR_CFG else '0';
	cfg_dout <= rx_data;

end rtl;
