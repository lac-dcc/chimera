----------------------------------------------------------------------------
--  Copyright (C) 2017 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
generic(
	ADDRESS_WIDTH : integer := 32);
port(
	clk : in std_logic;
	resetn : in std_logic;

	-- Read request signals
	read_request : out std_logic;
	read_request_accept : in std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_transactionID : out std_logic_vector(13 downto 0);

	-- Read response signals
	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_config : in std_logic;
	read_response_transactionID : in std_logic_vector(13 downto 0);

	-- Write request signals
	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_transactionID : out std_logic_vector(13 downto 0);
	write_request_almostfull : in std_logic;
	
	-- Write response signals
	write_response: in std_logic;
	write_response_transactionID : in std_logic_vector(13 downto 0);

	start : in std_logic;
	done : out std_logic;
	
	src_addr : in std_logic_vector(31 downto 0);
	dst_addr : in std_logic_vector(31 downto 0);
	number_of_CL_to_process : in std_logic_vector(31 downto 0);
	addr_reset : in std_logic_vector(31 downto 0);
	read_offset : in std_logic_vector(31 downto 0);
	write_offset : in std_logic_vector(31 downto 0);
	config1 : in std_logic_vector(31 downto 0);
	config2 : in std_logic_vector(31 downto 0);
	config3 : in std_logic_vector(31 downto 0);
	config4 : in std_logic_vector(31 downto 0);
	config5 : in std_logic_vector(31 downto 0));
end top;

architecture behavioral of top is

constant PAGE_SIZE_IN_BITS : integer := 16;
--constant PAGE_SIZE_IN_BITS : integer := 7;
constant PAGE_SIZE : integer := 2**PAGE_SIZE_IN_BITS;
constant FIFO_DEPTH_BITS : integer := 8;

signal src_bram_we : std_logic;
signal src_bram_re : std_logic;
signal src_bram_re_1d : std_logic;
signal src_bram_raddr : std_logic_vector(10 downto 0);
signal src_bram_waddr : std_logic_vector(10 downto 0);
signal src_bram_din : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal src_bram_dout : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal src_bram_waddr_count : unsigned(10 downto 0);

signal dst_bram_we : std_logic;
signal dst_bram_re : std_logic;
signal dst_bram_re_1d : std_logic;
signal dst_bram_raddr : std_logic_vector(10 downto 0);
signal dst_bram_waddr : std_logic_vector(10 downto 0);
signal dst_bram_din : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal dst_bram_dout : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal dst_bram_waddr_count : unsigned(10 downto 0);

signal read_request_accept_was_down : std_logic;
signal read_request_accept_was_down_1d : std_logic;
signal read_request_accept_was_down_2d : std_logic;
signal current_read_request_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal current_read_request_address_1d : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal read_request_address_internal : std_logic_vector(ADDRESS_WIDTH-1 downto 0);

type circular_address_buffer_type is array (23 downto 0) of std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal circular_address_buffer : circular_address_buffer_type;
signal cab_write_pointer : integer range 0 to 23 := 0;
signal cab_read_pointer : integer range 0 to 23 := 0;

signal current_write_request_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal current_write_request_address_1d : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal current_write_request_data : std_logic_vector(511 downto 0);
signal current_write_request_data_1d : std_logic_vector(511 downto 0);

signal request_issued : std_logic := '0';
signal send_issued : std_logic := '0';
signal send_pending : std_logic := '0';

signal wrapper_read_request : std_logic;
signal wrapper_read_request_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal wrapper_read_response : std_logic;
signal wrapper_read_response_data : std_logic_vector(511 downto 0);
signal wrapper_read_response_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal wrapper_write_request : std_logic;
signal wrapper_write_request_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal wrapper_write_request_data : std_logic_vector(511 downto 0);

signal ififo_we :			std_logic;
signal ififo_din :			std_logic_vector(ADDRESS_WIDTH-1 downto 0);	
signal ififo_re :			std_logic;
signal ififo_valid :		std_logic;
signal ififo_dout :			std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal ififo_count :		std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal ififo_empty :		std_logic;
signal ififo_full :			std_logic;
signal ififo_almostfull: 	std_logic;

signal ofifo_we :			std_logic;
signal ofifo_din :			std_logic_vector(511 + ADDRESS_WIDTH downto 0);	
signal ofifo_re :			std_logic;
signal ofifo_valid :		std_logic;
signal ofifo_dout :			std_logic_vector(511 + ADDRESS_WIDTH downto 0);
signal ofifo_count :		std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal ofifo_empty :		std_logic;
signal ofifo_full :			std_logic;
signal ofifo_almostfull: 	std_logic;

component fifo
generic(
	FIFO_WIDTH : integer;
	FIFO_DEPTH_BITS : integer;
	FIFO_ALMOSTFULL_THRESHOLD : integer);
port(
	clk :		in std_logic;
	resetn :	in std_logic;

	we :		in std_logic;
	din :		in std_logic_vector(FIFO_WIDTH-1 downto 0);	
	re :		in std_logic;
	valid :		out std_logic;
	dout :		out std_logic_vector(FIFO_WIDTH-1 downto 0);
	count :		out std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
	empty :		out std_logic;
	full :		out std_logic;
	almostfull: out std_logic);
end component;

component simple_dual_port_ram_single_clock
generic(
	DATA_WIDTH : integer := 32;
	ADDR_WIDTH : integer := 8);
port(
	clk :	in std_logic;
	raddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	waddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	data : 	in std_logic_vector(DATA_WIDTH-1 downto 0);
	we :	in std_logic;
	q : 	out std_logic_vector(DATA_WIDTH-1 downto 0));
end component;

component floatFSGD
generic(ADDRESS_WIDTH : integer := 32;
		MAX_DIMENSION_BITS : integer := 8);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	mini_batch_size : in std_logic_vector(15 downto 0);
	step_size : in std_logic_vector(31 downto 0);
	number_of_epochs : in std_logic_vector(13 downto 0);
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	binarize_b_value : in std_logic;
	b_value_to_binarize_to : in std_logic_vector(31 downto 0);
	accumulation_count : in std_logic_vector(17 downto 0);
	number_of_samples : in std_logic_vector(31 downto 0);
	number_of_CL_to_process : in std_logic_vector(31 downto 0));
end component;

component qFSGD
generic(ADDRESS_WIDTH : integer := 32;
		MAX_DIMENSION_BITS : integer := 8;
		QUANTIZATION_BITS : integer := 2);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	number_of_indices : in std_logic_vector(7 downto 0);
	mini_batch_size : in std_logic_vector(15 downto 0);
	step_size_decline_interval : in std_logic_vector(13 downto 0);
	step_size : in std_logic_vector(5 downto 0);
	number_of_epochs : in std_logic_vector(13 downto 0);
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	normalized_to_minus1_1 : in std_logic;
	binarize_b_value : in std_logic;
	b_value_to_binarize_to : in std_logic_vector(31 downto 0);
	dimension : in std_logic_vector(17 downto 0);
	number_of_samples : in std_logic_vector(31 downto 0);
	number_of_CL_to_process : in std_logic_vector(31 downto 0));
end component;

component qFSGD_Q1
generic(ADDRESS_WIDTH : integer := 32;
		MAX_DIMENSION_BITS : integer := 8);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	number_of_indices : in std_logic_vector(7 downto 0);
	mini_batch_size : in std_logic_vector(15 downto 0);
	step_size_decline_interval : in std_logic_vector(13 downto 0);
	step_size : in std_logic_vector(5 downto 0);
	number_of_epochs : in std_logic_vector(13 downto 0);
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	binarize_b_value : in std_logic;
	b_value_to_binarize_to : in std_logic_vector(31 downto 0);
	dimension : in std_logic_vector(17 downto 0);
	number_of_samples : in std_logic_vector(31 downto 0);
	number_of_CL_to_process : in std_logic_vector(31 downto 0));
end component;

begin

read_request_address <= read_request_address_internal;
read_request_transactionID <= read_request_address_internal(13 downto 0);
write_request_transactionID <= (others => '0');

src_bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => ADDRESS_WIDTH,
	ADDR_WIDTH => 11)
port map (
	clk => clk,
	raddr => src_bram_raddr,
	waddr => src_bram_waddr,
	data => src_bram_din,
	we => src_bram_we,
	q => src_bram_dout);

dst_bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => ADDRESS_WIDTH,
	ADDR_WIDTH => 11)
port map (
	clk => clk,
	raddr => dst_bram_raddr,
	waddr => dst_bram_waddr,
	data => dst_bram_din,
	we => dst_bram_we,
	q => dst_bram_dout);

read_addresses_bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => ADDRESS_WIDTH,
	ADDR_WIDTH => 10)
port map (
	clk => clk,
	raddr => read_response_transactionID(9 downto 0),
	waddr => wrapper_read_request_address(9 downto 0), -- TID
	data => wrapper_read_request_address,
	we => wrapper_read_request,
	q => wrapper_read_response_address);

inst_floatFSGD: floatFSGD
generic map (
	ADDRESS_WIDTH => ADDRESS_WIDTH,
	MAX_DIMENSION_BITS => 13) -- 8192
port map (
	clk => clk,
	resetn => resetn,

	read_request => wrapper_read_request,
	read_request_address => wrapper_read_request_address,
	read_request_almostfull => ififo_almostfull,

	read_response => wrapper_read_response,
	read_response_data => wrapper_read_response_data,
	read_response_address => wrapper_read_response_address,

	write_request => wrapper_write_request,
	write_request_address => wrapper_write_request_address,
	write_request_data => wrapper_write_request_data,
	write_request_almostfull => ofifo_almostfull,

	write_response => write_response,

	start => start,
	done => done,

	mini_batch_size => config2(25 downto 10),
	step_size => config1,
	number_of_epochs => config3(31 downto 18),
	start_address => (others => '0'),
	binarize_b_value => config2(1),
	b_value_to_binarize_to => config5,
	accumulation_count => config3(17 downto 0),
	number_of_samples => config4,
	number_of_CL_to_process => number_of_CL_to_process);

--inst_qFSGD: qFSGD
--generic map (
--	ADDRESS_WIDTH => ADDRESS_WIDTH,
--	MAX_DIMENSION_BITS => 13, -- 8192
--	QUANTIZATION_BITS => 2)
--port map (
--	clk => clk,
--	resetn => resetn,

--	read_request => wrapper_read_request,
--	read_request_address => wrapper_read_request_address,
--	read_request_almostfull => ififo_almostfull,

--	read_response => wrapper_read_response,
--	read_response_data => wrapper_read_response_data,
--	read_response_address => wrapper_read_response_address,

--	write_request => wrapper_write_request,
--	write_request_address => wrapper_write_request_address,
--	write_request_data => wrapper_write_request_data,
--	write_request_almostfull => ofifo_almostfull,

--	write_response => write_response,

--	start => start,
--	done => done,

--	number_of_indices => config2(9 downto 2),
--	mini_batch_size => config2(25 downto 10),
--	step_size_decline_interval => config1(19 downto 6),
--	step_size => config1(5 downto 0),
--	number_of_epochs => config3(31 downto 18),
--	start_address => (others => '0'),
--	normalized_to_minus1_1 => config2(0),
--	binarize_b_value => config2(1),
--	b_value_to_binarize_to => config5,
--	dimension => config3(17 downto 0),
--	number_of_samples => config4,
--	number_of_CL_to_process => number_of_CL_to_process);

--inst_qFSGD_Q1: qFSGD_Q1
--generic map (
--	ADDRESS_WIDTH => ADDRESS_WIDTH,
--	MAX_DIMENSION_BITS => 13) -- 8192
--port map (
--	clk => clk,
--	resetn => resetn,

--	read_request => wrapper_read_request,
--	read_request_address => wrapper_read_request_address,
--	read_request_almostfull => ififo_almostfull,

--	read_response => wrapper_read_response,
--	read_response_data => wrapper_read_response_data,
--	read_response_address => wrapper_read_response_address,

--	write_request => wrapper_write_request,
--	write_request_address => wrapper_write_request_address,
--	write_request_data => wrapper_write_request_data,
--	write_request_almostfull => ofifo_almostfull,

--	write_response => write_response,

--	start => start,
--	done => done,

--	number_of_indices => config2(9 downto 2),
--	mini_batch_size => config2(25 downto 10),
--	step_size_decline_interval => config1(19 downto 6),
--	step_size => config1(5 downto 0),
--	number_of_epochs => config3(31 downto 18),
--	start_address => (others => '0'),
--	binarize_b_value => config2(1),
--	b_value_to_binarize_to => config5,
--	dimension => config3(17 downto 0),
--	number_of_samples => config4,
--	number_of_CL_to_process => number_of_CL_to_process);

ififo: fifo
generic map(
	FIFO_WIDTH => ADDRESS_WIDTH,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 240)
port map(
	clk => clk,
	resetn => resetn,

	we => ififo_we,
	din => ififo_din,
	re => ififo_re,
	valid => ififo_valid,
	dout => ififo_dout,
	count => ififo_count,
	empty => ififo_empty,
	full => ififo_full,
	almostfull => ififo_almostfull);

ofifo: fifo
generic map(
	FIFO_WIDTH => ADDRESS_WIDTH + 512,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 240)
port map(
	clk => clk,
	resetn => resetn,

	we => ofifo_we,
	din => ofifo_din,
	re => ofifo_re,
	valid => ofifo_valid,
	dout => ofifo_dout,
	count => ofifo_count,
	empty => ofifo_empty,
	full => ofifo_full,
	almostfull => ofifo_almostfull);

process(clk)
variable offsetted_read_request_address : unsigned(ADDRESS_WIDTH-1 downto 0) := (others => '0');
variable offsetted_write_request_address : unsigned(ADDRESS_WIDTH-1 downto 0) := (others => '0');
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		read_request <= '0';
		write_request <= '0';

		src_bram_re <= '0';
		src_bram_re_1d <= '0';
		src_bram_we <= '0';
		src_bram_raddr <= (others => '0');
		src_bram_waddr <= (others => '0');
		src_bram_din <= (others => '0');
		src_bram_waddr_count <= (others =>'0');

		dst_bram_re <= '0';
		dst_bram_re_1d <= '0';
		dst_bram_we <= '0';
		dst_bram_raddr <= (others => '0');
		dst_bram_waddr <= (others => '0');
		dst_bram_din <= (others => '0');
		dst_bram_waddr_count <= (others => '0');

		read_request_accept_was_down <= '0';
		read_request_accept_was_down_1d <= '0';
		read_request_accept_was_down_2d <= '0';
		current_read_request_address <= (others => '0');
		current_read_request_address_1d <= (others => '0');
		read_request_address_internal <= (others => '0');

		circular_address_buffer <= (others => (others => '0'));
		cab_write_pointer <= 0;
		cab_read_pointer <= 0;

		current_write_request_address <= (others => '0');
		current_write_request_address_1d <= (others => '0');
		current_write_request_data <= (others => '0');
		current_write_request_data_1d <= (others => '0');

		request_issued <= '0';
		send_issued <= '0';
		send_pending <= '0';

		wrapper_read_response <= '0';

		ififo_we <= '0';
		ififo_din <= (others => '0');
		ififo_re <= '0';

		ofifo_we <= '0';
		ofifo_din <= (others => '0');
		ofifo_re <= '0';
	else
		src_bram_we <= '0';
		dst_bram_we <= '0';
		if read_response_config = '1' then -- Populate page tables
			if addr_reset = X"00000000" then
				src_bram_waddr_count <= (others => '0');
				dst_bram_waddr_count <= (others => '0');
			elsif addr_reset = X"00000001" and src_addr /= X"00000000" then
				src_bram_we <= '1';
				src_bram_waddr <= std_logic_vector(src_bram_waddr_count);
				src_bram_din <= src_addr;
				src_bram_waddr_count <= src_bram_waddr_count + 1;
			elsif addr_reset = X"00000002" and dst_addr /= X"00000000" then
				dst_bram_we <= '1';
				dst_bram_waddr <= std_logic_vector(dst_bram_waddr_count);
				dst_bram_din <= dst_addr;
				dst_bram_waddr_count <= dst_bram_waddr_count + 1;
			end if;
		end if;

		src_bram_re <= '0';
		if wrapper_read_request = '1' then
			src_bram_re <= '1';
			offsetted_read_request_address := unsigned(wrapper_read_request_address) + unsigned(read_offset);
			src_bram_raddr <= std_logic_vector(offsetted_read_request_address(10 + PAGE_SIZE_IN_BITS downto PAGE_SIZE_IN_BITS));
			current_read_request_address <= std_logic_vector(offsetted_read_request_address);
		end if;

		ififo_we <= '0';
		if src_bram_re_1d = '1' then
			ififo_we <= '1';
			ififo_din <= std_logic_vector(unsigned(src_bram_dout) + unsigned(current_read_request_address_1d(PAGE_SIZE_IN_BITS-1 downto 0)));
		end if;

		ififo_re <= '0';
		if ififo_empty = '0' and read_request_accept_was_down = '0' and read_request_accept_was_down_1d = '0' and read_request_accept_was_down_2d = '0' then
			ififo_re <= '1';
		end if;

		if ififo_valid = '1' then -- Read requests from the wrapper
			circular_address_buffer(cab_write_pointer) <= ififo_dout;
			if cab_write_pointer = 23 then
				cab_write_pointer <= 0;
			else
				cab_write_pointer <= cab_write_pointer + 1;
			end if;
		end if;

		read_request <= '0';
		read_request_accept_was_down <= '0';
		request_issued <= '0';
		if request_issued = '1' and read_request_accept = '0' then -- Request lines
			read_request_accept_was_down <= '1';
		elsif read_request_accept_was_down = '0' then
			if read_request_accept_was_down_1d = '1' then
				read_request <= '1';
				read_request_address_internal <= read_request_address_internal;
				request_issued <= '1';
			elsif cab_read_pointer /= cab_write_pointer then
				read_request <= '1';
				read_request_address_internal <= circular_address_buffer(cab_read_pointer);
				if cab_read_pointer = 23 then
					cab_read_pointer <= 0;
				else
					cab_read_pointer <= cab_read_pointer + 1;
				end if;
				request_issued <= '1';
			end if;
		end if;

		read_request_accept_was_down_1d <= read_request_accept_was_down;
		read_request_accept_was_down_2d <= read_request_accept_was_down_1d;
		current_read_request_address_1d <= current_read_request_address;
		src_bram_re_1d <= src_bram_re;

		wrapper_read_response <= '0';
		if read_response = '1' then -- Receive lines and forward them to the wrapper
			wrapper_read_response <= '1';
			wrapper_read_response_data <= read_response_data;
		end if;

		ofifo_we <= '0'; -- Write requests from the wrapper
		if wrapper_write_request = '1' then
			ofifo_we <= '1';
			ofifo_din <= wrapper_write_request_address & wrapper_write_request_data;
		end if;

		ofifo_re <= '0';
		if ofifo_empty = '0' and write_request_almostfull = '0' and send_pending = '0' then -- Send lines
			ofifo_re <= '1';	
		end if;
		dst_bram_re <= '0';
		if ofifo_valid = '1' then
			dst_bram_re <= '1';
			offsetted_write_request_address := unsigned(ofifo_dout(511+ADDRESS_WIDTH downto 512)) + unsigned(write_offset);
			dst_bram_raddr <= std_logic_vector(offsetted_write_request_address(10+PAGE_SIZE_IN_BITS downto PAGE_SIZE_IN_BITS));
			current_write_request_address <= std_logic_vector(offsetted_write_request_address);
            current_write_request_data <= ofifo_dout(511 downto 0);
		end if;
		
		write_request <= '0';
		if dst_bram_re_1d = '1' then
			write_request <= '1';
			write_request_address <= std_logic_vector(unsigned(dst_bram_dout) + unsigned(current_write_request_address_1d(PAGE_SIZE_IN_BITS-1 downto 0)));
			write_request_data <= current_write_request_data_1d;
		end if;

		dst_bram_re_1d <= dst_bram_re;
		current_write_request_address_1d <= current_write_request_address;
		current_write_request_data_1d <= current_write_request_data;
	end if;
end if;
end process;

end architecture;