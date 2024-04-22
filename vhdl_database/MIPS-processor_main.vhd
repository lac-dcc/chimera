------------------------------------------------------
-- This is the main script that is run when simulating
-- in modelsim.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
	port(
		ck: in std_logic
	);
end main;

architecture beh of main is

	-- dummy vector
	--signal dummy_vector: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

	signal instr_address: std_logic_vector(31 downto 0); -- Address of the instruction to run
	signal next_address: std_logic_vector(31 downto 0); -- Next address to be loaded into PC
	signal instruction: std_logic_vector(31 downto 0); -- The actual instruction to run
	signal read_data_1, read_data_2, write_data, extended_immediate, shifted_immediate, alu_in_2, alu_result, last_instr_address, incremented_address, add2_result, mux4_result, concatenated_pc_and_jump_address, mem_read_data: std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- vhdl does not allow me to port map " y => incremented_address(31 downto 28) & shifted_jump_address "
	signal shifted_jump_address: std_logic_vector(27 downto 0);
	signal jump_address: std_logic_vector(25 downto 0);
	signal immediate: std_logic_vector(15 downto 0);
	signal opcode, funct: std_logic_vector(5 downto 0);
	signal rs, rt, rd, shampt, write_reg: std_logic_vector(4 downto 0);
	signal alu_control_fuct: std_logic_vector(3 downto 0);
	signal reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, alu_zero, branch_and_alu_zero: std_logic:= '0'; -- vhdl does not allow me to port map " s => (branch and alu_zero) "
	signal alu_op: std_logic_vector(1 downto 0);

	 -- Enum for checking if the instructions have loaded
	type state is (loading, running, done);
	signal s: state:= loading;

	-- The clock for the other components; starts when the state is ready
	signal en: std_logic:= '0';

	-- Load the other components
	component pc
		port (
			ck: in std_logic;
			address_to_load: in std_logic_vector(31 downto 0);
			current_address: out std_logic_vector(31 downto 0)
		);
	end component;
	component instruction_memory
		port (
			read_address: in STD_LOGIC_VECTOR (31 downto 0);
			instruction, last_instr_address: out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
	component registers
		port (
			ck: in std_logic;
			reg_write: in std_logic;
			read_reg_1, read_reg_2, write_reg: in std_logic_vector(4 downto 0);
			write_data: in std_logic_vector(31 downto 0);
			read_data_1, read_data_2: out std_logic_vector(31 downto 0)
		);
	end component;
	component control
		port (
			opcode: in std_logic_vector(5 downto 0);
			reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
			alu_op: out std_logic_vector(1 downto 0)
		);
	end component;
	component mux
		generic (n: natural:= 1);
		port (
			x,y: in std_logic_vector(n-1 downto 0);
			s: in std_logic;
			z: out std_logic_vector(n-1 downto 0)
		);
	end component;
	component alu_control
		port (
			funct: in std_logic_vector(5 downto 0);
			alu_op: in std_logic_vector(1 downto 0);
			alu_control_fuct: out std_logic_vector(3 downto 0)
		);
	end component;
	component sign_extend
		port (
			x: in std_logic_vector(15 downto 0);
			y: out std_logic_vector(31 downto 0)
		);
	end component;
	component alu
		port (
			in_1, in_2: std_logic_vector(31 downto 0);
			alu_control_fuct: in std_logic_vector(3 downto 0);
			zero: out std_logic;
			alu_result: out std_logic_vector(31 downto 0)
		);
	end component;
	component shifter
		generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
		port (
			x: in std_logic_vector(n1-1 downto 0);
			y: out std_logic_vector(n2-1 downto 0)
		);
	end component;
	component adder 
		port (
			x,y: in std_logic_vector(31 downto 0);
			z: out std_logic_vector(31 downto 0)
		);		
	end component;
	
	component memory is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead,ck: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;

	begin

	process(ck)
		begin
		case s is
			when running =>
				en <= ck;
			when others =>
				en <= '0';
		end case;

		if ck='1' and ck'event then
			case s is
				when loading =>
					s <= running; -- give 1 cycle to load the instructions into memory
				when running =>
					if instr_address > last_instr_address then
						s <= done; -- stop moving the pc after it has passed the last instruction
						en <= '0';
					end if;
				when others =>
					null;
			end case;
		end if;
	end process;

	-- Wire some stuff
	opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	shampt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	immediate <= instruction(15 downto 0);
	jump_address <= instruction(25 downto 0);

	Prog_Count: pc port map (en, next_address, instr_address); 

	IM: instruction_memory port map (instr_address, instruction, last_instr_address);

	CONTROL1: control port map (
		opcode => opcode,
		reg_dest => reg_dest, 
		jump => jump,
		branch => branch, 
		mem_read => mem_read, 
		mem_to_reg => mem_to_reg,
		mem_write => mem_write,
		alu_src => alu_src,
		reg_write => reg_write,
		alu_op => alu_op 
	);

	-- This mux is going into Register's Write Register port; chooses between rt and rd
	MUX1: mux generic map(5) port map (
		x => rt, 
		y => rd, 
		s => reg_dest,
		z => write_reg
	);

	REG: registers port map (
		ck => en,
		reg_write => reg_write,
		read_reg_1 => rs,
		read_reg_2 => rt,
		write_reg => write_reg, 
		write_data => write_data, 
		read_data_1 => read_data_1, 
		read_data_2 => read_data_2
	);

	ALU_CONTRL: alu_control port map (funct, alu_op, alu_control_fuct);

	---- This mux is going into the ALU's second input; chooses between read_data_2 and the immediate
	SGN_EXT: sign_extend port map (immediate, extended_immediate);

	MUX2: mux generic map(32) port map (
		x => read_data_2, 
		y => extended_immediate, 
		s => alu_src,
		z => alu_in_2
	);

	ALU1: alu port map (read_data_1, alu_in_2, alu_control_fuct, alu_zero, alu_result);

	-- This mux is going into the Register's Write Data; chooses between the alu_result and read_data from data memory
	MUX3: mux generic map (32) port map (
		x => alu_result, 
		y => mem_read_data, 
		s => mem_to_reg,
		z => write_data
	);

	-- The Shift Left 2 for the immediate
	SHIFT1: shifter port map (
		x => extended_immediate,
		y => shifted_immediate
	);

	-- The +4 adder for the pc
	ADD1: adder port map (
		x => instr_address,
		y => "00000000000000000000000000000100",
		z => incremented_address
	);

	-- The mux between the +4 adder and the following adder
	branch_and_alu_zero <= branch and alu_zero;
	MUX4: mux generic map (32) port map (
		x => incremented_address,
		y => add2_result,
		s => branch_and_alu_zero,
		z => mux4_result
	);

	-- The adder between the PC and the sign-extended immediate
	ADD2: adder port map (
		x => incremented_address,
		y => shifted_immediate,
		z => add2_result
	);

	-- The Shift Left 2 for the jump instruction
	SHIFT2: shifter generic map (n1 =>26, n2 => 28) port map (
		x => jump_address,
		y => shifted_jump_address
	);

	-- This mux chooses between the result of mux4 and the jump address
	concatenated_pc_and_jump_address <= incremented_address(31 downto 28) & shifted_jump_address; -- I'm ashamed of myself
	MUX5: mux generic map (32) port map (
		x => mux4_result,
		y => concatenated_pc_and_jump_address,
		s => jump,
		z => next_address
	);
	
	MEM: memory port map (
		address => alu_result,
		write_data => read_data_2,
		MemWrite => mem_write,
		MemRead => mem_read,
		ck => en,
		read_data => mem_read_data
	);

end beh;