library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;

entity aligner is
	generic(
		UNIT_WIDTH				: integer := 1;
		NUM_UNIT_INPUT			: integer := 16;
		NUM_UNIT_OUTPUT			: integer := 16; -- must be larger than NUM_UNIT_INPUT
		
		NUM_UNIT_INPUT_WIDTH	: integer := work.arithmetic_pkg.clog2(NUM_UNIT_INPUT+1);
		NUM_UNIT_OUTPUT_WIDTH	: integer := work.arithmetic_pkg.clog2(NUM_UNIT_OUTPUT+1);
		
		ALIGNED_LEFT			: std_logic := '1'   --set to 1 of aligned to the left, otherwise right
	);
	port(
		clk 				: in std_logic;
		reset_n				: in std_logic;
		
		start				: in std_logic;
		
		input_data			: in std_logic_vector(UNIT_WIDTH*NUM_UNIT_INPUT-1 downto 0);
		input_data_valid	: in std_logic;
		input_num			: in unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
		input_last			: in std_logic;
		task_last_in        : in std_logic; --the last slice of the task
				
		output_data 		: out std_logic_vector(UNIT_WIDTH*NUM_UNIT_OUTPUT-1 downto 0);
		output_data_valid	: out std_logic;
		output_num			: out unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
		output_last 		: out std_logic;
		task_last_out       : out std_logic
	);
end entity;

architecture rtl of aligner is

	--appended 0 to extend the length from input to output
	constant data_appended		: std_logic_vector((NUM_UNIT_OUTPUT-NUM_UNIT_INPUT)*UNIT_WIDTH-1 downto 0):= (others => '0');

	signal input_data_d			: std_logic_vector(UNIT_WIDTH*NUM_UNIT_INPUT-1 downto 0);
	signal input_data_d2		: std_logic_vector(UNIT_WIDTH*NUM_UNIT_INPUT-1 downto 0);
	signal input_data_d3		: std_logic_vector(UNIT_WIDTH*NUM_UNIT_INPUT-1 downto 0);
	
	signal input_num_d			: unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
	signal input_num_d2			: unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
	signal input_num_d3			: unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
	
	signal input_valid_d		: std_logic;
	signal input_valid_d2		: std_logic;
	signal input_valid_d3		: std_logic;
	
	signal input_last_d			: std_logic;
	signal input_last_d2		: std_logic;
	signal input_last_d3		: std_logic;
	
	signal task_last_d          : std_logic;
	signal task_last_d2         : std_logic;
	signal task_last_d3         : std_logic;
	
	signal input2buff_num		: unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
	signal input2aligned_num	: unsigned(NUM_UNIT_INPUT_WIDTH-1 downto 0);
	signal buff_full			: std_logic;
	signal remaind_data_flag	: std_logic;
	signal remaind_data_flag_d  : std_logic;
	
	signal aligned_data			: std_logic_vector(UNIT_WIDTH*NUM_UNIT_OUTPUT-1 downto 0);
	signal aligned_unit_num		: unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
	signal input2aligned_w		: std_logic_vector(UNIT_WIDTH*NUM_UNIT_OUTPUT-1 downto 0);
	
	signal aligned_unit_num_d	: unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
	signal output_valid			: std_logic;
	signal output_valid_d		: std_logic;
	signal buff_last			: std_logic;
	signal buff_last_d			: std_logic;
	signal buff_data			: std_logic_vector(UNIT_WIDTH*NUM_UNIT_OUTPUT-1 downto 0);
	signal buff_unit_num		: unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
	signal buff_unit_num_d		: unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
	signal buff_task_last       : std_logic;
	signal buff_task_last_d     : std_logic;
	
	signal num_buff_unit		: unsigned(NUM_UNIT_OUTPUT_WIDTH-1 downto 0);
	
	
	---debug
	signal debug1				: std_logic_vector(NUM_UNIT_OUTPUT*UNIT_WIDTH-1 downto 0);
begin
	process(clk)
		variable i : integer;
	begin
		if(rising_edge(clk))then
			for i in NUM_UNIT_INPUT-1 downto 0 loop
				input_data_d(i*UNIT_WIDTH+UNIT_WIDTH-1 downto i*UNIT_WIDTH)		<= input_data(i*UNIT_WIDTH + UNIT_WIDTH -1 downto i*UNIT_WIDTH);
			end loop;
			input_data_d2				<= input_data_d;
			input_data_d3				<= input_data_d2;
		
			input_num_d					<= input_num;
			input_num_d2				<= input_num_d;
			input_num_d3				<= input_num_d2;
		
			input_valid_d				<= input_data_valid;
			input_valid_d2				<= input_valid_d;
			input_valid_d3				<= input_valid_d2;
		
			input_last_d				<= input_last;
			input_last_d2				<= input_last_d;
			input_last_d3				<= input_last_d2;
			
			task_last_d                 <= task_last_in;
			task_last_d2                <= task_last_d;
			task_last_d3                <= task_last_d2;		
		end if;
	end process;

-- stage2
	process(clk)
		variable buff_full_v	: std_logic;
		variable has_remaind	: std_logic;
	begin
		if(rising_edge(clk))then
			if(buff_unit_num + input_num_d >= NUM_UNIT_OUTPUT)then
				buff_full_v			:= '1';
			else
				buff_full_v			:= '0';
			end if;
			
			if(resize(buff_unit_num, NUM_UNIT_OUTPUT_WIDTH) + input_num_d > NUM_UNIT_OUTPUT)then
				has_remaind			:= '1';
			else
				has_remaind			:= '0';
			end if;
			
			if(remaind_data_flag = '1')then
				output_valid		<= '1';
			elsif(input_valid_d = '1' and input_last_d = '1' and has_remaind = '0')then
				output_valid		<= input_valid_d;
			elsif(buff_full_v = '1')then
				output_valid		<= input_valid_d;
			else
				output_valid		<= '0';
			end if;
			
			if(input_valid_d = '1' and input_last_d = '1' and has_remaind = '1')then
				remaind_data_flag	<= '1';
			else
				remaind_data_flag	<= '0';
			end if;
			
			if(remaind_data_flag = '1')then
				buff_last			<= '1';
				
			elsif(input_valid_d = '1' and input_last_d = '1' and has_remaind = '0')then
				buff_last			<= '1';
				
			else
				buff_last			<= '0';
			end if;
			
			if(remaind_data_flag = '1')then
			    buff_task_last      <= task_last_d2;
			elsif(input_valid_d = '1' and task_last_d = '1' and has_remaind = '0')then
			    buff_task_last   	<= '1';
			else
			    buff_task_last      <= '0';
			end if;
			
			
			if(remaind_data_flag = '1')then
				aligned_unit_num	<= buff_unit_num;
			elsif(input_valid_d = '1' and input_last_d = '1' and has_remaind = '0')then
				aligned_unit_num	<= buff_unit_num + input_num_d;
			else
				aligned_unit_num	<= to_unsigned(NUM_UNIT_OUTPUT, NUM_UNIT_OUTPUT_WIDTH);
			end if;
			
			
			if(reset_n = '0')then
				buff_unit_num		<= (others => '0');
			elsif(remaind_data_flag = '1')then
			    if(input_valid_d = '1')then
				    buff_unit_num			<= resize(input_num_d, buff_unit_num'length);
				else
				    buff_unit_num			<= (others => '0');
				end if;	
			elsif(input_valid_d	= '1')then
				if(buff_full_v = '1')then
--					input2buff_num		<= resize(buff_unit_num + input_num_d - NUM_UNIT_OUTPUT, NUM_UNIT_INPUT_WIDTH);
					buff_unit_num		<= buff_unit_num + input_num_d - NUM_UNIT_OUTPUT;
				elsif(input_valid_d = '1' and input_last_d = '1' and has_remaind = '0')then
--					input2buff_num		<= input_num_d;
					buff_unit_num		<= (others => '0');
				else
--					input2buff_num		<= input_num_d;
					buff_unit_num		<= buff_unit_num + input_num_d;
				end if;
			end if;
			
			if(buff_full_v = '1')then
				input2aligned_num		<= resize(NUM_UNIT_OUTPUT - buff_unit_num, NUM_UNIT_INPUT_WIDTH);
			else
				input2aligned_num		<= (others => '0');
			end if;
			
			
			buff_full				<= buff_full_v;
			
			buff_unit_num_d			<= buff_unit_num;
			remaind_data_flag_d     <= remaind_data_flag;
		end if;
	end process;
	
-- stage3
	process(all)
	begin
		if(ALIGNED_LEFT = '1')then
			input2aligned_w		<= std_logic_vector(shift_right(unsigned(input_data_d2 & data_appended), to_integer(buff_unit_num_d)*UNIT_WIDTH));
		else
			input2aligned_w		<= std_logic_vector(shift_left(unsigned(data_appended & input_data_d2), to_integer(buff_unit_num_d)*UNIT_WIDTH));
		end if;
	end process;
	
	process(clk)
		variable buff_mask	: std_logic_vector(NUM_UNIT_OUTPUT*UNIT_WIDTH-1 downto 0);
	begin
		if(rising_edge(clk))then
			buff_mask			:= (others => '1');
			if(ALIGNED_LEFT = '1')then
				buff_mask((NUM_UNIT_OUTPUT-to_integer(buff_unit_num_d))*UNIT_WIDTH-1 downto 0) := (others => '0');
			else
				buff_mask(NUM_UNIT_OUTPUT*UNIT_WIDTH-1 downto to_integer(buff_unit_num_d)*UNIT_WIDTH) := (others => '0');
			end if;
			
			output_valid_d		<= output_valid;
			
			if(remaind_data_flag_d = '1')then
			    buff_data                   <= input_data_d2 & data_appended;
			elsif(input_valid_d2 = '1')then
				if(ALIGNED_LEFT = '1')then
					if(buff_full = '1')then	
						buff_data			<= std_logic_vector(shift_left(unsigned(input_data_d2 & data_appended), to_integer(input2aligned_num)*UNIT_WIDTH));
					else
						buff_data			<= (buff_data and buff_mask) or std_logic_vector(shift_right(unsigned(input_data_d2 & data_appended), to_integer(buff_unit_num_d)*UNIT_WIDTH));
					end if;
				else
					if(buff_full = '1')then	
						buff_data			<= std_logic_vector(shift_right(unsigned(data_appended & input_data_d2), to_integer(input2aligned_num)*UNIT_WIDTH));
					else
						buff_data			<= (buff_data and buff_mask) or std_logic_vector(shift_left(unsigned(data_appended & input_data_d2), to_integer(buff_unit_num_d)*UNIT_WIDTH));
					end if;
				end if;
			end if;
			
			debug1				<= buff_mask;
			aligned_data		<= (buff_data and buff_mask) or input2aligned_w;
			buff_last_d			<= buff_last;
			aligned_unit_num_d	<= aligned_unit_num;
			buff_task_last_d    <= buff_task_last;
		end if;
	end process;

	output_data				<= aligned_data;
	output_data_valid		<= output_valid_d;
	output_last				<= buff_last_d;
	output_num				<= aligned_unit_num_d;
	task_last_out           <= buff_task_last_d;
end architecture;