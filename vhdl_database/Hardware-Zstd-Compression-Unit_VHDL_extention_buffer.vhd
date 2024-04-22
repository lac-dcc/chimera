library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;
use work.arithmetic_pkg.all;

entity extention_buffer is
	port(
		clk						: in std_logic;
		reset_n					: in std_logic;
		start					: in std_logic;
		
		data_in					: in std_logic_vector(INPUT_WIDTH * 8 -1 downto 0);
		data_valid_in			: in std_logic_vector(INPUT_WIDTH -1 downto 0);
		data_last_in			: in std_logic;
		
		data_out				: out std_logic_vector(MAX_LOOK_UP_WIDTH * 2 * 8 - 1 downto 0);
		data_valid_out			: out std_logic_vector(MAX_LOOK_UP_WIDTH * 2 - 1 downto 0);
		data_last_out			: out std_logic
	);
end entity;

architecture rtl of extention_buffer is
	type eb_state_t	 		is (EB_STATE_START, EB_STATE_BUFFER);
	signal eb_state			: eb_state_t;
	
	--number of buffering cycles
	constant NUM_BUFF		: integer := dividor_round_to_ceil(INPUT_WIDTH, MAX_LOOK_UP_WIDTH*2);
	constant NUM_BUFF_WIDTH	: integer := work.arithmetic_pkg.clog2(NUM_BUFF+1);
	
	signal data_buff		: std_logic_vector(MAX_LOOK_UP_WIDTH * 2 * 8 - 1 downto 0);
	signal buff_cnt			: unsigned(NUM_BUFF_WIDTH-1 downto 0);
	signal buff_valid 		: std_logic_vector(MAX_LOOK_UP_WIDTH * 2 - 1 downto 0);
	signal data_last_d		: std_logic;
begin
	process(clk)
	begin
		if(rising_edge(clk))then
			data_last_d		<= data_last_in;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(data_valid_in(INPUT_WIDTH-1) = '1')then
				data_buff		<= data_buff((MAX_LOOK_UP_WIDTH * 2 -INPUT_WIDTH) * 8 - 1 downto 0) & data_in;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				eb_state 	<= EB_STATE_START;
				buff_cnt	<= (others => '0');
				buff_valid	<= (others => '0');
			elsif(start = '1')then
				eb_state 	<= EB_STATE_START;
				buff_cnt	<= (others => '0');
				buff_valid	<= (others => '0');
			else
				case eb_state is 
					when EB_STATE_START	=> 
						if(data_valid_in(INPUT_WIDTH -1) = '1')then
							buff_cnt <= buff_cnt + to_unsigned(1, NUM_BUFF_WIDTH);
							if(buff_cnt = NUM_BUFF -2)then
								eb_state	<= EB_STATE_BUFFER;
							end if;
						end if;
						buff_valid	<= (others => '0');
					when EB_STATE_BUFFER =>
						if(data_last_in = '1' and data_valid_in(INPUT_WIDTH -1) = '1')then
							eb_state 	<= EB_STATE_START;
						end if;
						buff_valid	<= (INPUT_WIDTH-1 downto 0 => data_valid_in,
										others => data_valid_in(INPUT_WIDTH-1));
					when others =>
						eb_state 	<= EB_STATE_START;
				end case;
			end if;
		
		end if;
	end process;
	
	data_valid_out		<= buff_valid;
	data_out			<= data_buff;
	data_last_out		<= data_last_d;

end architecture;