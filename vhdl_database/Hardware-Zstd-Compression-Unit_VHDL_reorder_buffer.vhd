library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity reorder_buffer is
	generic(
		DATA_WIDTH					: integer := 32;
		STACK_SIZE					: integer := 256;
		ALMOST_FULL_THRESH			: integer := 200
	);
	port(
		clk							: in std_logic;
		reset_n						: in std_logic;
		
		start						: in std_logic;
		
		last_in						: in std_logic;
		data_in						: in std_logic_vector(DATA_WIDTH-1 downto 0);
		data_valid_in				: in std_logic;
		block_last_in				: in std_logic;
		
		last_out					: out std_logic;
		data_out					: out std_logic_vector(DATA_WIDTH-1 downto 0);
		data_valid_out				: out std_logic;
		block_last_out				: out std_logic
	);

end entity;

architecture rtl of reorder_buffer is	

	signal sequence_input_selector		: std_logic; -- '0': choose stack0; '1': choose stack1
	signal sequence_output_selector		: std_logic;
	type last_signal_stage_t is (WAIT_FOR_LAST, WAIT_FOR_EMPTY, WAIT_FOR_BLOCK_LAST);
	signal last_signal_stage 			: last_signal_stage_t;
	
	signal block_last_d					: std_logic;
	signal block_last_d2				: std_logic;
	signal last_received_flag			: std_logic;
	signal last_safe					: std_logic;
	------------
	signal stack0_wr_en					: std_logic;
	signal stack1_wr_en					: std_logic;
	signal stack0_data_out				: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal stack1_data_out				: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal stack0_valid_out				: std_logic;
	signal stack1_valid_out				: std_logic;
	signal stack0_rd_en					: std_logic;
	signal stack1_rd_en					: std_logic;
	signal stack0_almost_full			: std_logic;
	signal stack1_almost_full			: std_logic;
	signal stack0_empty_out				: std_logic;
	signal stack1_empty_out				: std_logic;
	signal stack0_last_out				: std_logic;
	signal stack1_last_out				: std_logic;
begin
	stack0_wr_en		<= '1' when data_valid_in = '1' and sequence_input_selector = '0'
							else '0';
	stack1_wr_en		<= '1' when data_valid_in = '1' and sequence_input_selector = '1'
							else '0';
	
	stack0_rd_en		<= '1' when sequence_input_selector = '1'
							else '0';
		
	stack1_rd_en		<= '1' when sequence_input_selector = '0'
							else '0';
	
	process(clk)
	begin
		if(rising_edge(clk))then
			block_last_d		<= block_last_in;
			block_last_d2		<= block_last_d;
		end if;
	end process;
	
	reorder_stack0 : entity work.reorder_stack
	generic map(
		DATA_WIDTH				=> DATA_WIDTH,
		STACK_SIZE				=> STACK_SIZE,
		ALMOST_FULL_THRESH		=> ALMOST_FULL_THRESH
	)
	port map(
		clk				=> clk,
		reset_n			=> reset_n,
		
		data_in			=> data_in,
		wr_en			=> stack0_wr_en,
		
		data_out		=> stack0_data_out,
		data_valid_out	=> stack0_valid_out,
		rd_en			=> stack0_rd_en,
		
		almost_full		=> stack0_almost_full,
		empty_out		=> stack0_empty_out,
		last_out		=> stack0_last_out
	);
	
	reorder_stack1 : entity work.reorder_stack
	generic map(
		DATA_WIDTH				=> DATA_WIDTH,
		STACK_SIZE				=> STACK_SIZE,
		ALMOST_FULL_THRESH		=> ALMOST_FULL_THRESH
	)
	port map(
		clk				=> clk,
		reset_n			=> reset_n,
		
		data_in			=> data_in,
		wr_en			=> stack1_wr_en,
		
		data_out		=> stack1_data_out,
		data_valid_out	=> stack1_valid_out,
		rd_en			=> stack1_rd_en,
		
		almost_full		=> stack1_almost_full,
		empty_out		=> stack1_empty_out,
		last_out		=> stack1_last_out
	);
	
	solve_last_unfull_block:process(clk)
	begin
		if(rising_edge(clk))then
			
			--when the last signal comes, it is possible that the last block did not totally output yet 
			if(reset_n = '0')then
				last_signal_stage		<= WAIT_FOR_LAST;
				last_safe				<= '0';
				last_out						<= '0';
			elsif(start = '1')then
				last_signal_stage		<= WAIT_FOR_LAST;
				last_safe				<= '0';
				last_out						<= '0';
			else
				case(last_signal_stage)is
				when WAIT_FOR_LAST 			=>
					if(data_valid_in = '1' and last_in = '1')then
						last_signal_stage			<= WAIT_FOR_EMPTY;
					end if;
					last_safe						<= '0';
					last_out						<= '0';
				when WAIT_FOR_EMPTY			=>
					if(sequence_input_selector = '1')then
						if(stack0_empty_out = '1')then
							last_signal_stage		<= WAIT_FOR_BLOCK_LAST;	
							last_safe				<= '1';
						end if;
					else
						if(stack1_empty_out = '1')then
							last_signal_stage		<= WAIT_FOR_BLOCK_LAST;	
							last_safe				<= '1';
						end if;					
					end if;
					last_out						<= '0';
				when WAIT_FOR_BLOCK_LAST	=>
					last_safe						<= '0';
					if((stack0_valid_out = '1' and stack0_last_out = '1') or (stack1_valid_out = '1' and stack1_last_out = '1'))then
						last_signal_stage			<= WAIT_FOR_LAST;
						last_out					<= '1';
					end if;
				end case;
			end if;
			
			
			
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				sequence_input_selector		<= '0';
			elsif((data_valid_in = '1' and block_last_in = '1' and last_in = '0') or last_safe = '1')then
				sequence_input_selector		<= not sequence_input_selector;
			end if;
		end if;
	end process;
	
	output_control:process(clk)
	begin		
		if(rising_edge(clk))then
			if(stack0_valid_out = '1')then
				data_out			<= stack0_data_out;
				block_last_out		<= stack0_valid_out and stack0_last_out;
			else
				data_out			<= stack1_data_out;
				block_last_out		<= stack1_valid_out and stack1_last_out;
			end if;
			data_valid_out		<= stack0_valid_out or stack1_valid_out;
			assert (stack0_valid_out and stack1_valid_out) /= '1' report "two stacks should not valid at the same time" severity error;
		end if;
	end process;
	
end architecture;