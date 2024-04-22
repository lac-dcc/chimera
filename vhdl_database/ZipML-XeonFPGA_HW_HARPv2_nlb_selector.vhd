library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity selector is
generic(
	ID : integer := 0;
	ADDRESS_WIDTH : integer := 32);
port(
	clk_200 : in std_logic;
	resetn : in std_logic;

	-- Read request signals
	read_request : out std_logic;
	read_request_accept : in std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_transactionID : out std_logic_vector(15 downto 0);

	-- Read response signals
	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_config : in std_logic;
	read_response_transactionID : in std_logic_vector(15 downto 0);

	-- Write request signals
	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_transactionID : out std_logic_vector(15 downto 0);
	write_request_almostfull : in std_logic;
	
	-- Write response signals
	write_response: in std_logic;
	write_response_transactionID : in std_logic_vector(15 downto 0);

	read_length : out std_logic_vector(1 downto 0);
	read_sop : out std_logic;
	write_length : out std_logic_vector(1 downto 0);
	write_sop : out std_logic;
	  
	read_response_format : in std_logic;
	read_response_cacheline_number : in std_logic_vector(1 downto 0);
	write_response_format : in std_logic;
	write_response_cacheline_number : in std_logic_vector(1 downto 0);
	multi_cacheline_length : in std_logic_vector(1 downto 0);

	start : in std_logic;
	done : out std_logic;

	src_addr : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	dst_addr : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	instance_id : in std_logic_vector(31 downto 0);
	addr_reset : in std_logic_vector(31 downto 0);
	read_offset : in std_logic_vector(31 downto 0);
	write_offset : in std_logic_vector(31 downto 0);
	config1 : in std_logic_vector(63 downto 0);
	config2 : in std_logic_vector(63 downto 0);
	config3 : in std_logic_vector(63 downto 0);
	config4 : in std_logic_vector(63 downto 0);
	config5 : in std_logic_vector(63 downto 0);
	config6 : in std_logic_vector(63 downto 0);
	config7 : in std_logic_vector(63 downto 0));
end selector;

architecture behavioral of selector is

signal parti_start : std_logic;
signal parti_done : std_logic;

signal NumberOfWriteRequests : unsigned(31 downto 0) := (others => '0');
signal NumberOfPendingWrites : unsigned(31 downto 0) := (others => '0');
signal NumberOfWriteResponses : unsigned(31 downto 0) := (others => '0');

constant PAGE_SIZE_IN_BITS : integer := 16;
--constant PAGE_SIZE_IN_BITS : integer := 7;
constant PAGE_SIZE : integer := 2**PAGE_SIZE_IN_BITS;
constant FIFO_DEPTH_BITS : integer := 8;

signal src_addr_internal : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal dst_addr_internal : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal read_offset_internal : std_logic_vector(31 downto 0);
signal write_offset_internal : std_logic_vector(31 downto 0);

signal src_bram_we : std_logic;
signal src_bram_re : std_logic;
signal src_bram_re_1d : std_logic;
signal src_bram_raddr : std_logic_vector(10 downto 0);
signal src_bram_raddr_1d : std_logic_vector(10 downto 0);
signal src_bram_waddr : std_logic_vector(10 downto 0);
signal src_bram_din : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal src_bram_dout : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal src_bram_waddr_count : unsigned(10 downto 0);

signal dst_bram_we : std_logic;
signal dst_bram_re : std_logic;
signal dst_bram_re_1d : std_logic;
signal dst_bram_raddr : std_logic_vector(10 downto 0);
signal dst_bram_raddr_1d : std_logic_vector(10 downto 0);
signal dst_bram_waddr : std_logic_vector(10 downto 0);
signal dst_bram_din : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal dst_bram_dout : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal dst_bram_waddr_count : unsigned(10 downto 0);

signal verify_base : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal src_bram_verify : std_logic;
signal src_bram_verify_1d : std_logic;
signal src_bram_verify_2d : std_logic;
signal src_bram_verify_index : unsigned(10 downto 0);
signal src_bram_verified : std_logic;
signal dst_bram_verify : std_logic;
signal dst_bram_verify_1d : std_logic;
signal dst_bram_verify_2d : std_logic;
signal dst_bram_verify_index : unsigned(10 downto 0);
signal dst_bram_verified : std_logic;

signal read_request_accept_was_down : std_logic;
signal read_request_accept_was_down_1d : std_logic;
signal read_request_accept_was_down_2d : std_logic;
signal current_read_request_address : std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);
signal current_read_request_address_1d : std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);
signal read_request_address_internal : std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);

type circular_address_buffer_type is array (23 downto 0) of std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);
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
signal wrapper_read_request_tid : std_logic_vector(15 downto 0);
signal wrapper_read_request_length : std_logic_vector(1 downto 0);

signal read_response_cacheline_number_1d : std_logic_vector(1 downto 0);
signal wrapper_read_response : std_logic;
signal wrapper_read_response_data : std_logic_vector(511 downto 0);
signal wrapper_read_response_tid_with_CL_number : std_logic_vector(15 downto 0);
signal wrapper_read_response_tid : std_logic_vector(15 downto 0);

signal wrapper_write_request : std_logic;
signal wrapper_write_request_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal wrapper_write_request_data : std_logic_vector(511 downto 0);

signal wrapper_write_response : std_logic;

signal ififo_we :			std_logic;
signal ififo_din :			std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);	
signal ififo_re :			std_logic;
signal ififo_valid :		std_logic;
signal ififo_dout :			std_logic_vector(18+ADDRESS_WIDTH-1 downto 0);
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
	FIFO_ALMOSTFULL_THRESHOLD: integer);
port(
	clk :    in std_logic;
	resetn :  in std_logic;

	we :    in std_logic;
	din :    in std_logic_vector(FIFO_WIDTH-1 downto 0);  
	re :    in std_logic;
	valid :    out std_logic;
	dout :    out std_logic_vector(FIFO_WIDTH-1 downto 0);
	count :    out std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
	empty :    out std_logic;
	full :    out std_logic;
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

signal do_real_scd : std_logic := '0';
signal do_residual_update : std_logic := '0';
signal enable_multiline : std_logic := '0';
signal enable_decompression : std_logic := '0';
signal enable_staleness : std_logic := '0';
signal enable_decryption : std_logic := '0';
signal program_key_index : std_logic_vector(3 downto 0);
signal program_key : std_logic_vector(127 downto 0);
signal to_integer_scaler : std_logic_vector(15 downto 0) := (others => '0');
signal a_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0) := (others => '0');
signal b_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0) := (others => '0');
signal step_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0) := (others => '0');
signal residual_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0) := (others => '0');
signal number_of_features : std_logic_vector(31 downto 0) := (others => '0');
signal number_of_batches : std_logic_vector(15 downto 0) := (others => '0');
signal batch_size : std_logic_vector(15 downto 0) := (others => '0');
signal step_size : std_logic_vector(31 downto 0) := (others => '0');
signal lambda : std_logic_vector(31 downto 0) := (others => '0');
signal do_sigmoid : std_logic;
signal number_of_epochs : std_logic_vector(15 downto 0) := (others => '0');
component floatFSCD
generic(ADDRESS_WIDTH : integer := 32;
		LOG2_MAX_iBATCHSIZE : integer := 9;
		LOG2_MAX_NUMFEATURES: integer := 15);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_tid : out std_logic_vector(15 downto 0);
	read_request_length : out std_logic_vector(1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_tid : in std_logic_vector(15 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	do_real_scd: in std_logic;
	do_residual_update : in std_logic;
	enable_multiline : in std_logic;
	enable_decompression : in std_logic;
	enable_staleness : in std_logic;
	enable_decryption : in std_logic;
	program_key_index : std_logic_vector(3 downto 0);
	program_key : std_logic_vector(127 downto 0);
	to_integer_scaler : in std_logic_vector(15 downto 0);
	a_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	b_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	step_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	residual_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	number_of_features : in std_logic_vector(31 downto 0);
	number_of_batches : in std_logic_vector(15 downto 0);
	batch_size : in std_logic_vector(15 downto 0);
	step_size : in std_logic_vector(31 downto 0);
	lambda : in std_logic_vector(31 downto 0);
	do_sigmoid : in std_logic;
	number_of_epochs : in std_logic_vector(15 downto 0));
end component;

begin

read_request_address <= read_request_address_internal(ADDRESS_WIDTH-1 downto 0);
read_request_transactionID <= read_request_address_internal(16+ADDRESS_WIDTH-1 downto ADDRESS_WIDTH);
read_length <= read_request_address_internal(18+ADDRESS_WIDTH-1 downto 18+ADDRESS_WIDTH-2);
write_request_transactionID <= (others => '0');

read_sop <= '1';
write_length <= B"00";
write_sop <= '1';

src_bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => ADDRESS_WIDTH,
	ADDR_WIDTH => 11)
port map (
	clk => clk_200,
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
	clk => clk_200,
	raddr => dst_bram_raddr,
	waddr => dst_bram_waddr,
	data => dst_bram_din,
	we => dst_bram_we,
	q => dst_bram_dout);

wrapper_read_response_tid_with_CL_number <= std_logic_vector(unsigned(wrapper_read_response_tid) + unsigned(read_response_cacheline_number_1d));
read_tid_bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 16,
	ADDR_WIDTH => 8)
port map (
	clk => clk_200,
	raddr => read_response_transactionID(7 downto 0),
	waddr => wrapper_read_request_tid(7 downto 0), -- TID
	data => wrapper_read_request_tid,
	we => wrapper_read_request,
	q => wrapper_read_response_tid);


parti_start <= start when (unsigned(number_of_batches) > 0 and addr_reset = X"FFFFFFFF") else '0';
done <= parti_done when unsigned(number_of_batches) > 0 else 
		start when addr_reset = X"FFFFFFFF" and unsigned(instance_id) > 0 else
		'0';
FSCD: floatFSCD
generic map (
	ADDRESS_WIDTH => ADDRESS_WIDTH,
	LOG2_MAX_iBATCHSIZE => 10,
	LOG2_MAX_NUMFEATURES => 12)
port map (
	clk => clk_200,
	resetn => resetn,

	read_request => wrapper_read_request,
	read_request_address => wrapper_read_request_address,
	read_request_tid => wrapper_read_request_tid,
	read_request_length => wrapper_read_request_length,
	read_request_almostfull => ififo_almostfull,

	read_response => wrapper_read_response,
	read_response_data => wrapper_read_response_data,
	read_response_tid => wrapper_read_response_tid_with_CL_number,

	write_request => wrapper_write_request,
	write_request_address => wrapper_write_request_address,
	write_request_data => wrapper_write_request_data,
	write_request_almostfull => ofifo_almostfull,

	write_response => write_response,

	start => parti_start,
	done => parti_done,

	do_real_scd => do_real_scd,
	do_residual_update => do_residual_update,
	enable_multiline => enable_multiline,
	enable_decompression => enable_decompression,
	enable_staleness => enable_staleness,
	enable_decryption => enable_decryption,
	program_key_index => program_key_index,
	program_key => program_key,
	to_integer_scaler => to_integer_scaler,
	a_address => a_address,
	b_address => b_address,
	step_address => step_address,
	residual_address => residual_address,
	number_of_features => number_of_features,
	number_of_batches => number_of_batches,
	batch_size => batch_size,
	step_size => step_size,
	lambda => lambda,
	do_sigmoid => do_sigmoid,
	number_of_epochs => number_of_epochs);
process(clk_200)
begin
if clk_200'event and clk_200 = '1' then
	program_key_index <= config5(23 downto 20);
	program_key <= config7 & config6;

	if to_integer(unsigned(instance_id)) = ID then
		read_offset_internal <= read_offset;
		write_offset_internal <= write_offset;

		do_real_scd <= config5(25);
		do_residual_update <= config5(24);
		enable_multiline <= config5(18);
		enable_decompression <= config5(1);
		enable_staleness <= config5(0);
		enable_decryption <= config5(19);	
		to_integer_scaler <= config5(17 downto 2);
		a_address(ADDRESS_WIDTH-1 downto 32) <= (others => '0');
		a_address(31 downto 0) <= config1(31 downto 0);
		b_address(ADDRESS_WIDTH-1 downto 32) <= (others => '0');
		b_address(31 downto 0) <= config1(63 downto 32);
		step_address(ADDRESS_WIDTH-1 downto 32) <= (others => '0');
		step_address(31 downto 0) <= config2(31 downto 0);
		residual_address(ADDRESS_WIDTH-1 downto 32) <= (others => '0');
		residual_address(31 downto 0) <= config2(63 downto 32);
		number_of_features <= config3(31 downto 0);
		number_of_batches <= config3(47 downto 32);
		batch_size <= config3(63 downto 48);
		step_size <= config4(31 downto 0);
		lambda <= config5(63 downto 32);
		do_sigmoid <= config5(26);
		number_of_epochs <= config4(47 downto 32);
	end if;
end if;
end process;

ififo: fifo
generic map(
	FIFO_WIDTH => 18+ADDRESS_WIDTH,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 2**FIFO_DEPTH_BITS-20)
port map(
	clk => clk_200,
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
	FIFO_ALMOSTFULL_THRESHOLD => 2**FIFO_DEPTH_BITS-20)
port map(
	clk => clk_200,
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

process(clk_200)
variable offsetted_read_request_address : unsigned(ADDRESS_WIDTH-1 downto 0) := (others => '0');
variable offsetted_write_request_address : unsigned(ADDRESS_WIDTH-1 downto 0) := (others => '0');
begin
if clk_200'event and clk_200 = '1' then
	NumberOfPendingWrites <= NumberOfWriteRequests - NumberOfWriteResponses;

	src_addr_internal <= src_addr;
	dst_addr_internal <= dst_addr;

	src_bram_verify_1d <= src_bram_verify;
	dst_bram_verify_1d <= dst_bram_verify;
	src_bram_verify_2d <= src_bram_verify_1d;
	dst_bram_verify_2d <= dst_bram_verify_1d;

	read_response_cacheline_number_1d <= read_response_cacheline_number;

	if resetn = '0' then
		NumberOfWriteRequests <= (others => '0');
		NumberOfWriteResponses <= (others => '0');

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

		src_bram_verify <= '0';
		src_bram_verify_index <= (others => '0');
		src_bram_verified <= '0';
		dst_bram_verify <= '0';
		dst_bram_verify_index <= (others => '0');
		dst_bram_verified <= '0';

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

		ififo_we <= '0';
		ififo_din <= (others => '0');
		ififo_re <= '0';

		ofifo_we <= '0';
		ofifo_din <= (others => '0');
		ofifo_re <= '0';
	else
		write_request <= '0';

		src_bram_we <= '0';
		dst_bram_we <= '0';
		if addr_reset = X"00000000" then
			src_bram_waddr_count <= (others => '0');
			dst_bram_waddr_count <= (others => '0');
		elsif addr_reset = X"00000001" and src_addr /= src_addr_internal and to_integer(unsigned(src_addr)) /= 0 then
			src_bram_we <= '1';
			src_bram_waddr <= std_logic_vector(src_bram_waddr_count);
			src_bram_din <= src_addr;
			src_bram_waddr_count <= src_bram_waddr_count + 1;
		elsif addr_reset = X"00000002" and dst_addr /= dst_addr_internal and to_integer(unsigned(dst_addr)) /= 0 then
			dst_bram_we <= '1';
			dst_bram_waddr <= std_logic_vector(dst_bram_waddr_count);
			dst_bram_din <= dst_addr;
			dst_bram_waddr_count <= dst_bram_waddr_count + 1;
			if to_integer(dst_bram_waddr_count) = 0 then
				verify_base <= dst_addr;
			end if;
		elsif addr_reset = X"00000003" and src_bram_verified = '0' then
			if ID = 0 then
				src_bram_verify <= '1';
			else
				src_bram_verify <= '0';
			end if;
			src_bram_verified <= '1';
			src_bram_verify_index <= (others => '0');
		elsif addr_reset = X"00000004" and dst_bram_verified = '0' then
			if ID = 0 then
				dst_bram_verify <= '1';
			else
				dst_bram_verify <= '0';
			end if;
			dst_bram_verified <= '1';
			dst_bram_verify_index <= (others => '0');
		end if;

		src_bram_re <= '0';
		if wrapper_read_request = '1' then
			src_bram_re <= '1';
			offsetted_read_request_address := unsigned(wrapper_read_request_address) + unsigned(read_offset_internal);
			src_bram_raddr <= std_logic_vector(offsetted_read_request_address(10 + PAGE_SIZE_IN_BITS downto PAGE_SIZE_IN_BITS));
			current_read_request_address <= wrapper_read_request_length & wrapper_read_request_tid & std_logic_vector(offsetted_read_request_address);
		end if;
		if src_bram_verify = '1' and start = '1' and NumberOfPendingWrites < 220 then
			src_bram_re <= '1';
			src_bram_raddr <= std_logic_vector(src_bram_verify_index);
			if src_bram_verify_index = src_bram_waddr_count-1 then
				src_bram_verify <= '0';
				src_bram_verify_index <= (others => '0');
			else
				src_bram_verify_index <= src_bram_verify_index + 1;
			end if;
		end if;

		ififo_we <= '0';
		if src_bram_re_1d = '1' then
			if src_bram_verify_2d = '1' then
				NumberOfWriteRequests <= NumberOfWriteRequests + 1;
				write_request <= '1';
				write_request_address <= std_logic_vector( unsigned(src_bram_raddr_1d) + unsigned(verify_base) );
				write_request_data(ADDRESS_WIDTH-1 downto 0) <= src_bram_dout;
			else
				ififo_we <= '1';
				ififo_din <= current_read_request_address_1d(18+ADDRESS_WIDTH-1 downto ADDRESS_WIDTH) & std_logic_vector(unsigned(src_bram_dout) + unsigned(current_read_request_address_1d(PAGE_SIZE_IN_BITS-1 downto 0)));
			end if;
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
		src_bram_raddr_1d <= src_bram_raddr;

		wrapper_read_response <= '0';
		if read_response = '1' then -- Receive lines and forward them to the wrapper
			wrapper_read_response <= '1';
			--wrapper_read_response <= read_response_data(0); -- For testing the timeout
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
			offsetted_write_request_address := unsigned(ofifo_dout(511+ADDRESS_WIDTH downto 512)) + unsigned(write_offset_internal);
			dst_bram_raddr <= std_logic_vector(offsetted_write_request_address(10+PAGE_SIZE_IN_BITS downto PAGE_SIZE_IN_BITS));
			current_write_request_address <= std_logic_vector(offsetted_write_request_address);
            current_write_request_data <= ofifo_dout(511 downto 0);
		end if;
		if dst_bram_verify = '1' and src_bram_verify = '0' and start = '1' and NumberOfPendingWrites < 220 then
			dst_bram_re <= '1';
			dst_bram_raddr <= std_logic_vector(dst_bram_verify_index);
			if dst_bram_verify_index = dst_bram_waddr_count-1 then
				dst_bram_verify <= '0';
				dst_bram_verify_index <= (others => '0');
			else
				dst_bram_verify_index <= dst_bram_verify_index + 1;
			end if;
		end if;
		
		if dst_bram_re_1d = '1' then
			write_request <= '1';
			NumberOfWriteRequests <= NumberOfWriteRequests + 1;
			if dst_bram_verify_2d = '1' then
				write_request_address <= std_logic_vector( unsigned(dst_bram_raddr_1d) + src_bram_waddr_count + unsigned(verify_base) );
				write_request_data(ADDRESS_WIDTH-1 downto 0) <= dst_bram_dout;
			else
				write_request_address <= std_logic_vector(unsigned(dst_bram_dout) + unsigned(current_write_request_address_1d(PAGE_SIZE_IN_BITS-1 downto 0)));
				write_request_data <= current_write_request_data_1d;
			end if;
		end if;

		wrapper_write_response <= '0';
		if write_response = '1' then
			NumberOfWriteResponses <= NumberOfWriteResponses + 1;
			wrapper_write_response <= '1';
		end if;

		dst_bram_re_1d <= dst_bram_re;
		dst_bram_raddr_1d <= dst_bram_raddr;
		current_write_request_address_1d <= current_write_request_address;
		current_write_request_data_1d <= current_write_request_data;
	end if;
end if;
end process;

end architecture;