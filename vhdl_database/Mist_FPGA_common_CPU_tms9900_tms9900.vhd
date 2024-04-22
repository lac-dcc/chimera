----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Erik Piehl
-- 
-- Create Date:    09:53:30 04/02/2017 
-- Design Name: 	 TMS9900 CPU Core
-- Module Name:    tms9900 - Behavioral 
-- Project Name: 
-- Target Devices: XC6SLX9
-- Tool versions:  ISE 14.7
-- Description: 	 Toplevel of the CPU core implementation
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-- Added CPU enable signal, so can clock at different frequency to CPU clock. Mike Coates
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- simulation begin
--USE STD.TEXTIO.ALL;
--USE IEEE.STD_LOGIC_TEXTIO.ALL;
-- simulation end


entity tms9900 is 
  generic (
    cycle_clks_g  : integer := 0
  );
	Port ( 
	clk 		: in  STD_LOGIC;		-- input clock
	enable   : in  STD_LOGIC;		-- CPU Enable
	reset 	: in  STD_LOGIC;		-- reset, active high
	addr_out	: out  STD_LOGIC_VECTOR (15 downto 0);
	data_in 	: in  STD_LOGIC_VECTOR (15 downto 0);
	data_out : out  STD_LOGIC_VECTOR (15 downto 0);
	rd 		: out  STD_LOGIC;		-- workin read with Pepino 40ns
	wr 		: out  STD_LOGIC;		-- working write with Pepino 60ns
	ready 	: in  STD_LOGIC := '1';	-- Currently connected to speech ready; 
	iaq 		: out  STD_LOGIC;
	as 		: out  STD_LOGIC;		-- address strobe, when high new address is valid, starts a memory cycle
--	test_out : out STD_LOGIC_VECTOR (15 downto 0);
--	alu_debug_out  : out STD_LOGIC_VECTOR (15 downto 0); -- ALU debug bus
--	alu_debug_oper : out STD_LOGIC_VECTOR(3 downto 0);
	alu_debug_arg1 :  out STD_LOGIC_VECTOR (15 downto 0);
	alu_debug_arg2 :  out STD_LOGIC_VECTOR (15 downto 0);	
	cpu_debug_out : out STD_LOGIC_VECTOR (95 downto 0);	
	mult_debug_out : out STD_LOGIC_VECTOR (35 downto 0);	
	int_req	: in STD_LOGIC;		-- interrupt request, active high
	ic03     : in STD_LOGIC_VECTOR(3 downto 0);	-- interrupt priority for the request, 0001 is the highest (0000 is reset)
	int_ack	: out STD_LOGIC;		-- does not exist on the TMS9900, when high CPU vectors to interrupt
	cruin		: in STD_LOGIC;
	cruout   : out STD_LOGIC;
	cruclk   : out STD_LOGIC;
	hold     : in STD_LOGIC;		-- DMA request, active high
	holda    : out STD_LOGIC;     -- DMA ack, active high
	waits    : in STD_LOGIC_VECTOR(7 downto 0);	-- number of wait states per memory cycles
	scratch_en : in STD_LOGIC;		-- when 1 in-core scratchpad RAM is enabled
	stuck	 	: out  STD_LOGIC;		-- when high the CPU is stuck
	turbo    : in STD_LOGIC
	);
end tms9900;

architecture Behavioral of tms9900 is
	signal addr : std_logic_vector(15 downto 0);	-- address bus

	-- CPU architecture registers
	signal pc : std_logic_vector(15 downto 0);
	signal w  : std_logic_vector(15 downto 0);
	signal st : std_logic_vector(15 downto 0);
	
	signal ea : std_logic_vector(15 downto 0);	-- effective address
	signal ir : std_logic_vector(15 downto 0);	-- instruction register
	signal rd_dat : std_logic_vector(15 downto 0);	-- data read from memory
	signal wr_dat : std_logic_vector(15 downto 0);	-- data written to memory
	signal reg_t : std_logic_vector(15 downto 0);	-- temporary register
	signal reg_t2 : std_logic_vector(15 downto 0); -- storage of source operand
	signal reg_stcr : std_logic_vector(15 downto 0); -- specific storage for STCR instruction - BUGBUG
	signal read_byte_aligner : std_logic_vector(15 downto 0); -- align bytes to words for reads
	
	-- debug stuff begin
	signal pc_ir : std_logic_vector(15 downto 0);	-- capture address when IR is loaded - debug BUGBUG
	signal first_ir : std_logic_vector(15 downto 0);
	signal capture_ir : boolean := false;
	signal alu_debug_src_arg : std_logic_vector(15 downto 0);
	signal alu_debug_dst_arg : std_logic_vector(15 downto 0);
	-- debug stuff end
		
	type cpu_state_type is (
		do_pc_read, 
		do_alu_read,
		do_fetch, do_decode,
		do_branch,
		do_stuck,
		do_read,
		do_read0, do_read1, do_read2, do_read3,
		do_read_pad, do_read_pad1,
		do_write,
		do_write0, do_write1, do_write2, do_write3, 
		do_ir_imm, do_lwpi_limi,
		do_load_imm, do_load_imm2, do_load_imm3, do_load_imm4, do_load_imm5,
		do_read_operand0, do_read_operand1, do_read_operand2, do_read_operand3, do_read_operand4, do_read_operand5,
		do_write_operand0, do_write_operand1, do_write_operand2, do_write_operand3, do_write_operand4,
		do_alu_write,
		do_dual_op, do_dual_op1, do_dual_op2, do_dual_op3,
		do_source_address0, do_source_address1, do_source_address2, do_source_address3, do_source_address4, do_source_address5, do_source_address6,
		do_branch_b_bl, do_single_op_read, do_single_op_writeback,
		do_rtwp0, do_rtwp1, do_rtwp2, do_rtwp3,
		do_shifts0, do_shifts1, do_shifts2, do_shifts3, do_shifts4,
		do_blwp00, do_blwp0, do_blwp_xop, do_blwp1, do_blwp2, do_blwp3,
		do_single_bit_cru0, do_single_bit_cru1, do_single_bit_cru2,
		do_ext_instructions, do_store_instructions, 
		do_coc_czc_etc0, do_coc_czc_etc1, do_coc_czc_etc2, do_coc_czc_etc3,
		do_xop,
		do_ldcr0, do_ldcr00, do_ldcr1, do_ldcr2, do_ldcr3, do_ldcr4, do_ldcr5,
		do_stcr0, do_stcr6, do_stcr7,
		do_stcr_delay0, do_stcr_delay1,
		do_idle_wait, do_mul_store0, do_mul_store1, do_mul_store2,
		do_div0, do_div1, do_div2, do_div3, do_div4, do_div5
	);
	signal cpu_state : cpu_state_type;
	signal cpu_state_next : cpu_state_type;
	signal cpu_state_operand_return : cpu_state_type;
	
	signal arg1 : std_logic_vector(15 downto 0);
	signal arg2 : std_logic_vector(15 downto 0);
	signal alu_out : std_logic_vector(16 downto 0);
	signal alu_result :  std_logic_vector(15 downto 0);
	signal shift_count : std_logic_vector(4 downto 0);
	signal delay_count : std_logic_vector(7 downto 0);
	signal delay_ir_count : std_logic_vector(15 downto 0);
	signal delay_ir_wait : std_logic_vector(15 downto 0);
	
	type alu_operation_type is (
		alu_load1, alu_load2, alu_add, alu_or, alu_and, alu_sub, alu_compare,
		alu_and_not, alu_xor, 
		alu_coc, alu_czc,
		alu_swpb2, alu_abs,
		alu_sla, alu_sra, alu_src, alu_srl
	);
	signal ope : alu_operation_type;
	signal alu_flag_zero     : std_logic;
	signal alu_flag_overflow : std_logic;
	signal alu_logical_gt 	 : std_logic;
	signal alu_arithmetic_gt : std_logic;
	signal alu_flag_carry    : std_logic;
	signal alu_flag_parity   : std_logic;
	signal alu_flag_parity_source : std_logic;
	
	signal i_am_xop			 : boolean := False;
	signal set_int_priority  : boolean := False;
	
	-- operand_mode controls fetching of operands, i.e. addressing modes
	-- operand_mode(5:4) is the mode R, *R, @ADDR, @ADDR(R), *R+
	-- operand_mode(3:0) is the register number
	signal operand_mode		 : std_logic_vector(5 downto 0);
	signal operand_word		 : boolean;	-- if false, we have a byte (matters for autoinc)
	
	constant cru_delay_clocks		: std_logic_vector(7 downto 0) := x"05";

	signal debug_wr_data, debug_wr_addr : std_logic_vector(15 downto 0);
	
	component multiplier IS
	PORT (
		clk : IN STD_LOGIC;
		a : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		b : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		p : OUT STD_LOGIC_VECTOR(35 DOWNTO 0)
	);
	END component;
	
	signal mult_a : std_logic_vector(17 downto 0);
	signal mult_b : std_logic_vector(17 downto 0);
	signal mult_product : std_logic_vector(35 downto 0);
	signal dividend : std_logic_vector(31 downto 0);	-- for the divide instruction
	signal divider_sub : std_logic_vector(16 downto 0);
	
	
	component scratchpad is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 1);
           din  : in  STD_LOGIC_VECTOR (15 downto 0);
           dout : out  STD_LOGIC_VECTOR (15 downto 0);
           clk  : in  STD_LOGIC;
           wr   : in  STD_LOGIC);
	end component;	
	
	signal scratchpad_wr  : std_logic;
--	signal scratchpad_en  : std_logic;
	signal scratchpad_out : STD_LOGIC_VECTOR (15 downto 0);
	
	procedure do_pc_read_quick(
		signal pc : inout std_logic_vector(15 downto 0);
		signal addr : out std_logic_vector(15 downto 0);
		signal cpu_state : out cpu_state_type;
		signal as : out std_logic;
		signal rd : out std_logic;
		signal scratchpad_wr : out std_logic
--		signal scratchpad_en : out std_logic
	) is
	begin
		-- pc is only top 15 bits
		addr <= pc(15 downto 1) & "0";
		pc <= std_logic_vector(unsigned(pc(15 downto 1) & "0") + to_unsigned(2,16));
		if pc(15 downto 8) = x"83" and scratch_en='1' then
			-- scratchpad support begin
			scratchpad_wr <= '0';
--			scratchpad_en <= '1';
			cpu_state <= do_read_pad;
		else 
			as <= '1';
			rd <= '1';
			cpu_state <= do_read0;
		end if;
	end do_pc_read_quick;

begin

	addr_out <= addr;

	my_mult : multiplier port map (
		clk => clk,
		a => mult_a,
		b => mult_b,
		p => mult_product);
	mult_debug_out <= mult_product;
	

   my_scratchpad: scratchpad port map (
			  addr => addr(7 downto 1),
           din  => wr_dat,
           dout => scratchpad_out,
           clk  => clk,
           wr   => scratchpad_wr);

	cpu_debug_out <= debug_wr_data & debug_wr_addr & st & pc & pc_ir & ir;
	
	process(arg1, arg2, ope)
	variable t : std_logic_vector(15 downto 0);
	begin
		-- arg1 is DA, arg2 is SA when ALU used for instruction execute
		case ope is
			when alu_load1 =>
				alu_out <= '0' & arg1;
			when alu_load2 =>
				alu_out <= '0' & arg2;
--				alu_debug_oper <= x"1";
			when alu_add =>
				alu_out <= std_logic_vector(unsigned('0' & arg1) + unsigned('0' & arg2));
--				alu_debug_oper <= x"2";
			when alu_or =>
				alu_out <= '0' & arg1 or '0' & arg2;
--				alu_debug_oper <= x"3";
			when alu_and =>
				alu_out <= '0' & arg1 and '0' & arg2;
--				alu_debug_oper <= x"4";
			when alu_sub =>
				-- t := std_logic_vector(unsigned(arg1) - unsigned(arg2));
				-- alu_out <= t(15) & t;		-- BUGBUG I wonder if this is right for carry generation?
				alu_out <= std_logic_vector(unsigned('0' & arg1) - unsigned('0' & arg2));
--				alu_debug_oper <= x"5";
			when alu_compare =>
				-- this is just the same code as for subtract
				alu_out <= std_logic_vector(unsigned('0' & arg1) - unsigned('0' & arg2));
			when alu_and_not =>
				alu_out <= '0' & arg1 and not ('0' & arg2);
--				alu_debug_oper <= x"6";
			when alu_xor =>
				alu_out <= '0' & arg1 xor '0' & arg2;
--				alu_debug_oper <= x"7";
			when alu_coc => -- compare ones corresponding
				alu_out <= ('0' & arg1 xor ('0' & arg2)) and ('0' & arg1);
--				alu_debug_oper <= x"7";		-- BUGBUG show still debug code 7 as in xor
			when alu_czc => -- compare zeros corresponding
				alu_out <= ('0' & arg1 xor not ('0' & arg2)) and ('0' & arg1);
--				alu_debug_oper <= x"7";		-- BUGBUG show still debug code 7 as in xor
			when alu_swpb2 =>
				alu_out <= '0' & arg2(7 downto 0) & arg2(15 downto 8); -- swap bytes of arg2
--				alu_debug_oper <= x"8";
			when alu_abs => -- compute abs value of arg2
--				alu_debug_oper <= x"9";
				if arg2(15) = '0' then
					alu_out <= '0' & arg2;
				else
					-- same as alu sub (arg1 must be zero; this is set elsewhere)
					alu_out <= std_logic_vector(unsigned(arg1(15) & arg1) - unsigned(arg2(15) & arg2));
				end if;
			when alu_sla =>
--				alu_debug_oper <= x"A";
				alu_out <= arg2 & '0';
			when alu_sra =>
--				alu_debug_oper <= x"B";
				alu_out <= arg2(0) & arg2(15) & arg2(15 downto 1);
			when alu_src =>
--				alu_debug_oper <= x"C";
				alu_out <= arg2(0) & arg2(0) & arg2(15 downto 1);
			when alu_srl =>
--				alu_debug_oper <= x"D";
				alu_out <= arg2(0) & '0' & arg2(15 downto 1);
		end case;			
	end process;
	alu_result <= alu_out(15 downto 0);
-- alu_debug_out <= alu_out(15 downto 0);
--	alu_debug_arg1 <= arg1;
--	alu_debug_arg2 <= arg2;
	alu_debug_arg1 <= alu_debug_dst_arg;
	alu_debug_arg2 <= alu_debug_src_arg;
	
	-- ST0 ST1 ST2 ST3 ST4 ST5
	-- L>  A>  =   C   O   P
	-- ST0 - when looking at data sheet arg1 is (DA) and arg2 is (SA), sub is (DA)-(SA). 
	alu_logical_gt 	<= '1' when ope  = alu_compare and ((arg2(15)='1' and arg1(15)='0') or (arg1(15)=arg2(15) and alu_result(15)= '1')) else 
								'1' when ope /= alu_compare and alu_result /= x"0000" else
								'0';
	-- ST1
	alu_arithmetic_gt <= '1' when ope  = alu_compare and ((arg2(15)='0' and arg1(15)='1') or (arg1(15)=arg2(15) and alu_result(15)= '1')) else 
								'1' when ope  = alu_abs and arg2(15)='0' and arg2 /= x"0000" else
								'1' when ope /= alu_compare and ope /= alu_abs and alu_result(15)='0' and alu_result /= x"0000" else
								'0';
	-- ST2
	alu_flag_zero 		<= '1' when alu_result = x"0000" else '0';
	-- ST3 carry
	alu_flag_carry    <= alu_out(16) when ope /= alu_sub else not alu_out(16);	-- for sub carry out is inverted
	-- ST4 overflow
	alu_flag_overflow <= 
		'1' when (ope = alu_compare or ope = alu_sub or ope = alu_abs)			                   and arg1(15) /= arg2(15) and alu_result(15) /= arg1(15) else 
		'1' when (ope /= alu_sla and not (ope = alu_compare or ope = alu_sub or ope = alu_abs)) and arg1(15) =  arg2(15) and alu_result(15) /= arg1(15) else 
		'1' when ope = alu_sla and alu_result(15) /= arg2(15) else -- sla condition: if MSB changes during shift
		'0';
	-- ST5 parity
	alu_flag_parity <= alu_result(15) xor alu_result(14) xor alu_result(13) xor alu_result(12) xor 
				       alu_result(11) xor alu_result(10) xor alu_result(9)  xor alu_result(8);
		-- source parity used with CB and MOVB instructions
	alu_flag_parity_source <= arg2(15) xor arg2(14) xor arg2(13) xor arg2(12) xor 
				       arg2(11) xor arg2(10) xor arg2(9)  xor arg2(8);

	-- Byte aligner
	process(ea, rd_dat, operand_mode, operand_word)
	begin
		-- We have a byte operation. If the data came from register,
		-- we don't need to do anything. If it came from memory,
		-- we will zero extend and possibly shift.
		if operand_word then
			read_byte_aligner <= rd_dat;
		else
			-- Not register operand. Need to check that EA is still valid.
			if ea(0) = '0' then
				read_byte_aligner <= rd_dat(15 downto 8) & x"00";
			else
				read_byte_aligner <= rd_dat(7 downto 0) & x"00";
			end if;
		end if;
	end process;

	process(clk, reset, hold) is
	variable offset : std_logic_vector(15 downto 0);
	variable take_branch : boolean;
	variable dec_shift_count   : boolean := False;
	variable inc_ir_count   : boolean := True;
	-- simulation begin
--	variable my_line : line;	-- from textio
	-- simulation end
	begin
		if reset = '1' then
			st <= (others => '0');
			pc <= (others => '0');
			stuck <= '0';
			rd <= '0';
			wr <= '0';
			cruclk <= '0';
			-- Prepare for BLWP from 0
			i_am_xop <= False;
			arg2 <= x"0000";				-- pass pointer to WP via ALU as our EA
			ope <= alu_load2;
			cpu_state <= do_blwp00;		-- do blwp from zero
			delay_count <= "00000000";
			holda <= hold;					-- during reset hold is respected
			capture_ir <= True;
			set_int_priority <= False;
			int_ack <= '0';
--			scratchpad_en <= '0';
			scratchpad_wr <= '0';
			delay_ir_count <= x"0000";
			delay_ir_wait <= x"0000";
		else
			if rising_edge(clk) then
			  if enable = '1' then	-- CPU Enable signal
			
				dec_shift_count := False;
				inc_ir_count := True;
			
				-- CPU state changes
				case cpu_state is
				------------------------
				-- memory opperations --
				------------------------
					when do_pc_read =>
						-- pc is only top 15 bits
						addr <= pc(15 downto 1) & "0";
						pc <= std_logic_vector(unsigned(pc(15 downto 1) & "0") + to_unsigned(2,16));
						if pc(15 downto 8) = x"83" and scratch_en='1' then
							-- scratchpad support begin
							scratchpad_wr <= '0';
--							scratchpad_en <= '1';
							cpu_state <= do_read_pad;
						else 
							as <= '1';
							rd <= '1';
							cpu_state <= do_read0;
						end if;
					when do_read =>		-- start memory read cycle
						addr <= ea;					
						if ea(15 downto 8) = x"83" and scratch_en='1' then
							-- scratchpad support begin
							scratchpad_wr <= '0';
--							scratchpad_en <= '1';
							cpu_state <= do_read_pad;
						else 
							as <= '1';
							rd <= '1';
							cpu_state <= do_read0;
						end if;
					when do_alu_read =>
						addr <= alu_result;
						if alu_result(15 downto 8) = x"83" and scratch_en='1' then
							scratchpad_wr <= '0';
--							scratchpad_en <= '1';
							cpu_state <= do_read_pad;
						else
							as <= '1';
							rd <= '1';
							cpu_state <= do_read0;
						end if;
					when do_read0 => 
						cpu_state <= do_read1; 
						as <= '0';
						delay_count <= waits;	-- used to be zero (i.e. not assigned)
					when do_read1 => 
						if delay_count = "00000000" then 
							cpu_state <= do_read2;
						end if;
					when do_read2 => cpu_state <= do_read3;
					when do_read3 => 
						if ready='1' then 
							if (addr(15 downto 10) /= "100000") and -- "100000" = 8000-83FF
							   (addr(15 downto 13) /= "000") then  -- "000"    = 0000-1FFF 
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(4*cycle_clks_g, 16));
							end if;
							cpu_state <= cpu_state_next;
							rd <= '0';
							rd_dat <= data_in;
						end if;
					when do_read_pad =>
						cpu_state <= do_read_pad1;
					when do_read_pad1 =>
						-- read from scratchpad
--						scratchpad_en <= '0';					
						cpu_state <= cpu_state_next; -- do_read4; -- cpu_state_next;
						data_out <= scratchpad_out;	-- for debugging show what was read
						rd_dat <= scratchpad_out;
						
					-- write cycles --
					when do_write =>
						addr <= ea;
						data_out <= wr_dat;
						if ea(15 downto 8) = x"83" and scratch_en='1' then
							scratchpad_wr <= '1';
--							scratchpad_en <= '1';
							cpu_state <= do_write3;
						else
							as <= '1';
							wr <= '1';
							cpu_state <= do_write0;
						end if;
					when do_alu_write =>
						-- scratchpad support begin
						addr <= alu_result;						
						data_out <= wr_dat;
						if alu_result(15 downto 8) = x"83" and scratch_en='1' then
							scratchpad_wr <= '1';
--							scratchpad_en <= '1';
							cpu_state <= do_write3;
						else
							-- external memory
							as <= '1';
							wr <= '1';
							cpu_state <= do_write0;
						end if;
					when do_write0 => 
						cpu_state <= do_write1; 
						as <= '0';
						if waits(7 downto 1) = "0000000" then
							delay_count <= "00000010"; -- minimum value
						else
							delay_count <= waits;
						end if;
						debug_wr_data <= wr_dat;
						debug_wr_addr <= addr;
					when do_write1 => 
						if delay_count = "00000000" then
							cpu_state <= do_write2;
						end if;
					when do_write2 => cpu_state <= do_write3;
					when do_write3 => 
						if ready='1' then
							if (addr(15 downto 10) /= "100000") and -- "100000" = 8000-83FF
							   (addr(15 downto 13) /= "000") then  -- "000"    = 0000-1FFF 
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(4*cycle_clks_g, 16));
							end if;
							scratchpad_wr <= '0';
--							scratchpad_en <= '0';
							cpu_state <= cpu_state_next; -- do_write4; -- cpu_state_next;
							wr <= '0';
						else
							inc_ir_count := False;
						end if;
					----------------
					-- operations --
					----------------
					when do_fetch =>		-- instruction opcode fetch
						if hold='1' then
							holda <= '1';	-- honor DMA requests here - stay in do_fetch state
						elsif (delay_ir_wait <= delay_ir_count) or (turbo = '1') then -- wait for cycle counter
							inc_ir_count := False;
							delay_ir_count <= x"0000";
							delay_ir_wait <= x"0000";
							holda <= '0';
							i_am_xop <= False;
							-- check interrupt requests
							if int_req = '1' and unsigned(ic03) <= unsigned(st(3 downto 0)) then
								delay_ir_wait <= std_logic_vector(to_unsigned(26*cycle_clks_g, 16));
								-- pass pointer to WP via ALU as our EA
								set_int_priority <= True;
								arg2 <= x"00" & "00" & ic03 & "00";	-- vector through interrupt priority
								ope <= alu_load2;
								cpu_state <= do_blwp00;		-- do blwp from interrupt vector
								int_ack <= '1';
							else
								iaq <= '1';
								-- let's run faster in here and save one clock cycle by setting things up already here.
								-- instead of going to do_pc_read let's inline that stuff here.
								-- LEGACY code:
								-- -- cpu_state <= do_pc_read;
--								do_pc_read_quick(pc=>pc, addr=>addr, cpu_state=>cpu_state, as=>as, rd=>rd, scratchpad_wr=>scratchpad_wr, scratchpad_en=>scratchpad_en);
								do_pc_read_quick(pc=>pc, addr=>addr, cpu_state=>cpu_state, as=>as, rd=>rd, scratchpad_wr=>scratchpad_wr);
								cpu_state_next <= do_decode;
--								addr <= pc;
--								pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,16));
--								if pc(15 downto 8) = x"83" and scratch_en='1' then
--									-- scratchpad support begin
--									scratchpad_wr <= '0';
--									scratchpad_en <= '1';
--									cpu_state <= do_read_pad;
--								else 
--									as <= '1';
--									rd <= '1';
--									cpu_state <= do_read0;
--								end if;
								
							end if;
						end if;
--						test_out <= x"0000";
					-------------------------------------------------------------------------------
					-- do_decode
					-------------------------------------------------------------------------------
					when do_decode =>
						operand_word <= True;			-- By default 16-bit operations.
						ir <= rd_dat;						-- read done, store to instruction register
						pc_ir <= pc;						-- store increment PC for debug purposes
						iaq <= '0';
--						if capture_ir then
--							capture_ir <= False;
--							first_ir <= rd_dat;
--						end if;
						-- Next analyze what we got
						-- check for dual operand instructions with full addressing modes
						if rd_dat(15 downto 13) = "101" or -- A, AB
						   rd_dat(15 downto 13) = "100" or -- C, CB
							rd_dat(15 downto 13) = "011" or -- S, SB
							rd_dat(15 downto 13) = "111" or -- SOC, SOCB
							rd_dat(15 downto 13) = "010" or -- SZC, SZCB
							rd_dat(15 downto 13) = "110" then -- MOV, MOVB
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
							-- found dual operand instruction. Get source operand.
							operand_mode <= rd_dat(5 downto 0);	-- ir not set at this point yet
							if rd_dat(12) = '1' then
								operand_word <= False;	-- byte operation
							else
								operand_word <= True;
							end if;
							cpu_state <= do_read_operand0;
							cpu_state_operand_return <= do_dual_op;
						elsif rd_dat(15 downto 12) = "0001" and 
							rd_dat(11 downto 8) /= x"D" and rd_dat(11 downto 8) /= x"E" and rd_dat(11 downto 8) /= x"F" then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
								cpu_state <= do_branch; 
						elsif rd_dat(15 downto 10) = "000010" then -- SLA, SRA, SRC, SRL
							-- Do all the shifts SLA(10) SRA(00) SRC(11) SRL(01), OPCODE:6 INS:2 C:4 W:4
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
							shift_count <= '0' & rd_dat(7 downto 4);
							arg1 <= w;
							arg2 <= x"00" & "000" & rd_dat(3 downto 0) & '0';
							ope <= alu_add;	-- calculate workspace address
							cpu_state <= do_shifts0;
						elsif rd_dat = x"0380" then	-- RTWP
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
							arg1 <= w;
							arg2 <= x"00" & "000" & x"D" & '0';	-- calculate of register 13 (WP)
							ope <= alu_add;	
							cpu_state <= do_rtwp0;
						elsif 
						   rd_dat(15 downto 8) = x"1D" or  --SBO
							rd_dat(15 downto 8) = x"1E" or -- SBZ
							rd_dat(15 downto 8) = x"1F" then	-- TB
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
--								test_out <= x"8877";
							 arg1	<= w;
							 arg2 <= x"00" & "000" & x"C" & '0';
							 ope <= alu_add;
							 cpu_state <= do_alu_read;	-- Read WR12
							 cpu_state_next <= do_single_bit_cru0;
						elsif rd_dat = x"0340" or rd_dat = x"0360" or rd_dat = x"03C0" or rd_dat = x"03A0" or rd_dat = x"03E0" then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
							-- external instructions IDLE, RSET, CKOF, CKON, LREX
							cpu_state <= do_ext_instructions;
						elsif rd_dat(15 downto 4) = x"02C" or rd_dat(15 downto 4) = x"02A" then -- STST, STWP
							if rd_dat(15 downto 4) = x"02C" then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
							else
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
							end if;
							arg1 <= w;
							arg2 <= x"00" & "000" & rd_dat(3 downto 0) & '0';
							ope <= alu_add;	-- calculate workspace address
							cpu_state <= do_store_instructions;
						elsif rd_dat(15 downto 13) = "001" and rd_dat(12 downto 10) /= "100" and rd_dat(12 downto 10) /= "101" then
							--	COC, CZC, XOR, MPY, DIV, XOP
							if rd_dat(12 downto 10) = "011" then	-- XOP
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(36*cycle_clks_g, 16));
								operand_mode <= rd_dat(5 downto 0);
								cpu_state <= do_source_address0;
								cpu_state_operand_return <= do_xop;
							else
								--delay_ir_wait done elsewhere
								operand_mode <= rd_dat(5 downto 0);
								cpu_state <= do_read_operand0;
								cpu_state_operand_return <= do_coc_czc_etc0;
							end if;
						elsif rd_dat(15 downto 11) = "00110" then -- LDCR, STCR
							--delay_ir_wait done elsewhere
							-- set operand_word to byte mode if count of bits is 1..8
							if rd_dat(9 downto 6) = "1000" or (rd_dat(9) = '0' and rd_dat(8 downto 6) /= "000") then
								operand_word <= False;
							end if;
							operand_mode <= rd_dat(5 downto 0);
							if rd_dat(10) = '0' then
								cpu_state <= do_read_operand0;
								cpu_state_operand_return <= do_ldcr0;	-- LDCR
							else
								cpu_state <= do_source_address0;
								cpu_state_operand_return <= do_stcr0;	-- STCR
							end if;
						elsif rd_dat(15 downto 4) = x"020" or rd_dat(15 downto 4) = x"022" or   -- LI, AI
									rd_dat(15 downto 4) = x"024" or rd_dat(15 downto 4) = x"026" or 	-- ANDI, ORI
									rd_dat(15 downto 4) = x"028"													-- CI
								then -- ANDI, ORI 
								if rd_dat(15 downto 4) = x"020" then
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
								else
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
								end if;
									cpu_state <= do_load_imm;	-- LI or AI
						elsif rd_dat(15 downto 9) = "0000001" and rd_dat(4 downto 0) = "00000" then
									--delay_ir_wait done elsewhere
									cpu_state <= do_ir_imm;
						elsif rd_dat(15 downto 10) = "000001" then 
									--delay_ir_wait done elsewhere
							-- Single operand instructions: BL, B, etc.
							operand_word <= True;
							operand_mode <= rd_dat(5 downto 0);
							cpu_state <= do_source_address0;
							cpu_state_operand_return <= do_branch_b_bl;
						elsif 
						   rd_dat(15 downto 9)  = "0000000" or     --illegal (0000-01FF)
						   rd_dat(15 downto 5)  = "00000011001" or --illegal (0320-033F)
						   rd_dat(15 downto 7)  = "000001111" or   --illegal (0780-07FF)
						   rd_dat(15 downto 10) = "000011" then    --illegal (0C00-0FFF)
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(6*cycle_clks_g, 16));
							cpu_state <= do_fetch;		-- 6 cycles delay then next instruction
						else
							cpu_state <= do_stuck;		-- unknown instruction, let's get stuck
						end if;
					when do_branch =>
						-- do branching, we need to sign extend ir(7 downto 0) and add it to PC and continue.
						cpu_state <= do_fetch; -- may be overwritten with do_stuck
						take_branch := False;
						case ir(11 downto 8) is
						when "0000" => take_branch := True;	-- JMP
						when "0001" => if ST(14)='0' and ST(13)='0' then take_branch := True; end if; -- JLT
						when "0010" => if ST(15)='0' or  ST(13)='1' then take_branch := True; end if; -- JLE
						when "0011" => if                ST(13)='1' then take_branch := True; end if; -- JEQ
						when "0100" => if ST(15)='1' or  ST(13)='1' then take_branch := True; end if; -- JHE
						when "0101" => if                ST(14)='1' then take_branch := True; end if; -- JGT
						when "0110" => if                ST(13)='0' then take_branch := True; end if; -- JNE
						when "0111" => if                ST(12)='0' then take_branch := True; end if; -- JNC
						when "1000" => if                ST(12)='1' then take_branch := True; end if; -- JOC (on carry)
						when "1001" => if                ST(11)='0' then take_branch := True; end if; -- JNO (no overflow)
						when "1010" => if ST(15)='0' and ST(13)='0' then take_branch := True; end if; -- JL
						when "1011" => if ST(15)='1' and ST(13)='0' then take_branch := True; end if; -- JH
						when "1100" => if                ST(10)='1' then take_branch := True; end if; -- JOP (odd parity)
						when others => cpu_state <= do_stuck;
						end case;
						if take_branch then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(2*cycle_clks_g, 16));
							offset := ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7 downto 0) & '0';
							pc <= std_logic_vector(unsigned(offset) + unsigned(pc));
						end if;
					when do_ir_imm =>
--						test_out <= x"EE00";
						if ir(8 downto 5) = "0111" or ir(8 downto 5) = "1000" then	-- 4 LSBs don't care
							cpu_state <= do_pc_read;
							cpu_state_next <= do_lwpi_limi;
						else
							cpu_state <= do_stuck;
						end if;
					when do_lwpi_limi =>	
						cpu_state <= do_fetch;
						if ir(8 downto 5) = "0111" then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
							w <= rd_dat;	-- LWPI
						else
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(16*cycle_clks_g, 16));
							st(3 downto 0) <= rd_dat(3 downto 0);	-- LIMI
						end if;
						
					when do_load_imm =>	-- LI, AI, ANDI, ORI, CI instruction here
						-- test_out <= x"0001";
						cpu_state <= do_pc_read;		-- read immediate value from instruction stream
						cpu_state_next <= do_load_imm2;
					when do_load_imm2 =>
						-- test_out <= x"0002";
						reg_t <= rd_dat;	-- store the immediate to temp
						arg1 <= w;
						arg2 <= x"00" & "000" & ir(3 downto 0) & '0';
						ope <= alu_add;	-- calculate workspace address
						cpu_state <= do_load_imm3;
					when do_load_imm3 =>	-- read from workspace register
--						-- test_out <= x"0003";
						ea <= alu_result; 
						cpu_state <= do_read;	
						cpu_state_next <= do_load_imm4;
					when do_load_imm4 =>	-- do actual operation
						-- test_out <= x"0004";
						-- The order below is abit funny, but that's due to CI instruction (sub).
						-- CI RX,IMM is defined as IMM-RX, and not RX-IMM
						arg1 <= reg_t;		-- temporary holds the immediate parameter
						arg2 <= rd_dat;	-- contents of workspace register
						case ir(7 downto 4) is
							when x"0" => ope <= alu_load1; -- LI
							when x"2" => ope <= alu_add;	 -- AI
							when x"4" => ope <= alu_and;	 -- ANDI
							when x"6" => ope <= alu_or;	 -- ORI
							when x"8" => ope <= alu_compare; -- CI
							when others => cpu_state <= do_stuck;
						end case;
						cpu_state <= do_load_imm5;
					when do_load_imm5 =>		-- write to workspace the result of ALU, ea still points to register
						-- test_out <= x"0005";
						-- let's write flags 0-2 for all instructions
						st(15) <= alu_logical_gt;
						st(14) <= alu_arithmetic_gt;
						st(13) <= alu_flag_zero;
						if ope = alu_add then
							st(12) <= alu_flag_carry;
							st(11) <= alu_flag_overflow;
						end if;
						
						if ope /= alu_compare then
							wr_dat <= alu_result;	
							cpu_state <= do_write;
							cpu_state_next <= do_fetch;
						else
							-- compare, skip result write altogether
							cpu_state <= do_fetch;
						end if;
					
					-------------------------------------------------------------
					-- Dual operand instructions
					-------------------------------------------------------------					
					when do_dual_op =>
						reg_t2 <= read_byte_aligner;
						-- calculate address of destination operand
						cpu_state <= do_source_address0;
						cpu_state_operand_return <= do_dual_op1;
						operand_mode <= ir(11 downto  6);
					when do_dual_op1 =>
						-- Now ALU output has address of destination (side effects done), and source_op
						-- has the source operand.
						-- Read destination operand, except if we have MOV in that case optimized
						ea <= alu_result;	-- Save destination address
						if ir(15 downto 13) = "110" and operand_word then
							-- We have MOV, skip reading of dest operand. We still need to
							-- move along as we need to set flags.
							-- test_out <= x"DD00";
							cpu_state <= do_dual_op2;
						else
							-- we have any of the other ones expect MOV
							cpu_state <= do_read;
							cpu_state_next <= do_dual_op2;
							-- test_out <= x"DD10";
						end if;
					when do_dual_op2 =>
						-- perform the actual operation
						-- test_out <= x"DD02";
						-- Handle processing of byte operations for rd_dat.
						if ir(15 downto 13) = "110" then 
							arg1 <= (others => '0');	-- For proper flag behavior drive zero for MOV to arg1 
							alu_debug_dst_arg <= (others => '0'); -- Store argument for debug information
						else
							arg1 <= read_byte_aligner;
							alu_debug_dst_arg <= read_byte_aligner;
						end if;
						arg2 <= reg_t2;
						alu_debug_src_arg <= reg_t2; -- Store argument for debug information
						cpu_state <= do_dual_op3;
						case ir(15 downto 13) is
							when "101" => ope <= alu_add; -- A add
							when "100" => ope <= alu_compare;	-- C compare
							when "011" => ope <= alu_sub; -- S substract
							when "111" => ope <= alu_or;
							when "010" => ope <= alu_and_not;
							when "110" => ope <= alu_load2;	-- MOV
							when others =>	cpu_state <= do_stuck;
						end case;
					when do_dual_op3 =>
						-- Store flags.
						st(15) <= alu_logical_gt;
						st(14) <= alu_arithmetic_gt;
						st(13) <= alu_flag_zero;
						if ir(15 downto 13) = "101" or ir(15 downto 13) = "011" then
							-- add and sub set two more flags
							st(12) <= alu_flag_carry;
							st(11) <= alu_flag_overflow;
						end if;	
						-- Byte operations set parity
						if not operand_word then
							-- parity bit for MOVB and CB is set differently and only depends on source operand
							if ir(15 downto 13) = "100" or ir(15 downto 13) = "110" then
								st(10) <= alu_flag_parity_source;	-- MOVB, CB
							else
								st(10) <= alu_flag_parity;
							end if;
						end if;					
						-- Store the result except with compare instruction.
						if ir(15 downto 13) = "100" then
							cpu_state <= do_fetch;	-- compare, we are already done
							-- test_out <= x"DD03";
						else
							-- writeback result
							-- test_out <= x"DD13";
							if operand_word then
								wr_dat <= alu_result;
							else
								-- simulation debug start
--								write(my_line, STRING'("do_dual_op3 byte arg1 "));
--								hwrite(my_line, arg1);
--								write(my_line, STRING'(" arg2 "));
--								hwrite(my_line, arg2);
--								write(my_line, STRING'(" alu_result "));
--								hwrite(my_line, alu_result);
--								write(my_line, STRING'(" rd_dat "));
--								hwrite(my_line, rd_dat);
								-- simulation debug end
								
								-- Byte operation.
								if operand_mode(5 downto 4) = "00" or ea(0)='0' then
									-- Register operation or write to high byte. Always impacts high byte.
									wr_dat <= alu_result(15 downto 8) & rd_dat(7 downto 0);
--									write(my_line, STRING'(" HIGH "));
								else
									-- Memory operation going to low byte. High byte not impacted.
									wr_dat <= rd_dat(15 downto 8) & alu_result(15 downto 8); 
--									write(my_line, STRING'(" LOW "));
								end if;
								
--								writeline(OUTPUT, my_line);	-- simulation
							end if;
							cpu_state_next <= do_fetch;
							cpu_state <= do_write;
						end if;
						
					-------------------------------------------------------------
					-- Single operand instructions
					-------------------------------------------------------------					
					when do_branch_b_bl =>
						-- when we enter here source address is at the ALU output
						case ir(9 downto 6) is 
							when "0001" => -- B instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
								pc <= alu_result;	-- the source address is our PC destination
								cpu_state <= do_fetch;
							when "1010" => -- BL instruction.Store old PC to R11 before returning.
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
								pc <= alu_result;	-- the source address is our PC destination
								wr_dat <= pc;		-- capture old PC before to write data
								arg1 <= w;
								arg2 <= x"0016";	-- 2*11 = 22 = 0x16, offset to R11
								ope <= alu_add;
								cpu_state <= do_alu_write;
								cpu_state_next <= do_fetch;
							when "0011" => -- CLR instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								wr_dat <= x"0000";
								cpu_state <= do_alu_write;
								cpu_state_next <= do_fetch;
							when "1100" => -- SETO instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								wr_dat <= x"FFFF";
								cpu_state <= do_alu_write;
								cpu_state_next <= do_fetch;
							when "0101" => -- INV instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"FFFF";
								ope <= alu_xor;
							when "0100" => -- NEG instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
								-- test_out <= x"EEFF";
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"0000";
								ope <= alu_sub;
							when "1101" => -- ABS instruction
								if arg2(15) = '0' then
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(12*cycle_clks_g, 16));
								else
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
								end if;
								-- test_out <= x"AABB";
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"0000";
								ope <= alu_abs;
							when "1011" =>  -- SWPB instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"0000";
								ope <= alu_swpb2;
							when "0110" => -- INC instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"0001";
								ope <= alu_add;
							when "0111" => -- INCT instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"0002";
								ope <= alu_add;
							when "1000" => -- DEC instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"FFFF";	-- add -1 to create DEC
								ope <= alu_add;
							when "1001" => -- DECT instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(10*cycle_clks_g, 16));
								ea <= alu_result;	-- save address SA
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
								arg1 <= x"FFFE";	-- add -2 to create DEC
								ope <= alu_add;
							when "0010" => -- X instruction...
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned((8-4)*cycle_clks_g, 16));
								ea <= alu_result;
								cpu_state_next <= do_single_op_read;
								cpu_state <= do_read;
							when "0000" => -- BLWP instruction
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(26*cycle_clks_g, 16));
								-- alu_result points to new WP
								cpu_state <= do_blwp00;
							when others =>
								cpu_state <= do_stuck;
						end case;
					when do_single_op_read =>
						if ir(9 downto 6) /= "0010" then -- if not X instruction
							arg2 <= rd_dat;	-- feed the data that was read to ALU
							cpu_state <= do_single_op_writeback;
						else -- Here we process the X instruction...
							ir <= rd_dat;
							cpu_state <= do_decode;	-- off we go to do something... 
						end if;
					when do_single_op_writeback =>
						-- setup flags
						if ope /= alu_swpb2 then 
							-- set flags for INV, NEG, ABS, INC, INCT, DEC, DECT
							st(15) <= alu_logical_gt;
							st(14) <= alu_arithmetic_gt;
							st(13) <= alu_flag_zero;
							if ope = alu_add or ope = alu_sub or ope = alu_abs then
								st(12) <= alu_flag_carry;
								st(11) <= alu_flag_overflow;
							end if;
						end if;
						-- write the result
						wr_dat <= alu_result;
						cpu_state <= do_write;	-- ea still holds our address; return via write
						cpu_state_next <= do_fetch;

					-------------------------------------------------------------
					-- BLWP
					-- (SA) -> WP, (SA+2) -> PC
					-- R13 -> old_WP, R14 -> old_PC, R15 -> ST
					-------------------------------------------------------------					
					when do_blwp00 =>
						-- since we come here from reset, continue to respect hold
						-- or from interrupt processing
						if hold='1' then
							holda <= '1';
						else
							-- alu_result points to new WP
							holda <= '0';
							ea <= alu_result;
							arg1 <= x"0002";			-- calculate address of PC
							arg2 <= alu_result;
							ope <= alu_add;
							cpu_state <= do_read;	-- read new WP
							cpu_state_next <= do_blwp0;					
						end if;
					when do_blwp0 =>
						-- here rd_dat is our new WP, alu_result is addr of new PC
						ea 	<= alu_result;
						reg_t <= rd_dat;	-- store new WP to temp register
						arg1 	<= rd_dat;
						if not i_am_xop then
							-- normal BLWP
							arg2 <= x"00" & "000" & x"D" & '0';	-- calculate new addr 13 (WP)
							cpu_state_next <= do_blwp1;						
						else
							-- XOP
							arg2 <= x"00" & "000" & x"B" & '0';	-- calculate new addr R11 (WP)
							cpu_state_next <= do_blwp_xop;		-- XOP has an extra step to store EA to R11
						end if;
						ope 	<= alu_add;
						cpu_state <= do_read;
						int_ack <= '0';		-- if this was an interrupt vectoring event, clear the flag
					when do_blwp_xop =>
						-- ** This phase only exists for XOP **
						-- Now rd_dat is new PC, reg_t new WP, alu_result addr of new R11
						wr_dat <= reg_t2;				-- Write effective address to R11
						ea     <= alu_result;
						arg1   <= x"0004";			-- Add 4 to skip R12, point to R13 for WP storage
						arg2   <= alu_result;		-- prepare for WP write, i.e. point to new R14
						cpu_state 		<= do_write; -- write effective address to new R11
						cpu_state_next <= do_blwp1;						
					when do_blwp1 =>
						-- now rd_dat is new PC, reg_t new WP, alu_result addr of new R13
						wr_dat <= w;
						ea     <= alu_result;
						arg1   <= x"0002";
						arg2   <= alu_result;		-- prepare for PC write, i.e. point to new R14
						cpu_state 		<= do_write; -- write old WP
						cpu_state_next <= do_blwp2;
					when do_blwp2 =>
						wr_dat <= pc;
						ea     <= alu_result;
						arg2   <= alu_result;		-- prepare for ST write, i.e. point to new R15
						cpu_state 		<= do_write; -- write old PC
						cpu_state_next <= do_blwp3;
					when do_blwp3 =>
						wr_dat <= st;
						ea     <= alu_result;
						arg2   <= alu_result;
						cpu_state 		<= do_write; -- write old ST
						cpu_state_next <= do_fetch;
						-- For interrupts now set the interrupt priority. 
						-- BUGBUG: the priority may have changed since it was sampled...
						if set_int_priority then
							st(3 downto 0) <= std_logic_vector(unsigned(ic03) - 1);
							set_int_priority <= False;
						end if;
						-- now do the context switch
						pc <= rd_dat;
						w 	<= reg_t;
						if i_am_xop then
							st(9) <= '1';		-- Set XOP flag
						end if;
					
					-------------------------------------------------------------
					-- RTWP
					-- R13 -> WP, R14 -> PC, R15 -> ST
					-------------------------------------------------------------					
					when do_rtwp0 =>
						-- Here start first read cycle (from R13) and calculate also addr of R14
						ea <= alu_result;		-- Addr of R13
						arg1 <= x"0002";
						arg2 <= alu_result;
						ope <= alu_add;
						cpu_state <= do_read;
						cpu_state_next <= do_rtwp1;
					when do_rtwp1 =>
						w <= rd_dat;			-- W from previous R13
						ea <= alu_result;		-- addr of previous R14
						arg2 <= alu_result;	-- start calculation of R15
						cpu_state <= do_read;
						cpu_state_next <= do_rtwp2;
					when do_rtwp2 =>
						pc <= rd_dat;			-- PC from previous R14
						ea <= alu_result;		-- addr of previous R15
						cpu_state <= do_read;
						cpu_state_next <= do_rtwp3;
					when do_rtwp3 =>
						st <= rd_dat;			-- ST from previous R15
						cpu_state <= do_fetch;
						
					-------------------------------------------------------------
					-- All shift instructions
					-------------------------------------------------------------					
					when do_shifts0 =>
						ea <= alu_result;	-- address of our working register
						if shift_count = "00000" then 
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
							-- we need to read WR0 to get shift count
							arg1 <= w;
							arg2 <= x"0000";
							ope <= alu_add;
							cpu_state <= do_alu_read;
							cpu_state_next <= do_shifts1;
						else
							-- shift count is ready, it came from the instruction already.
							cpu_state <= do_read;			-- read the register.
							cpu_state_next <= do_shifts2;
						end if;
					when do_shifts1 =>
						-- rd_dat is now contents of WR0. Setup shift count and read the operand.
						if rd_dat(3 downto 0) = x"0" then
							shift_count <= '1' & rd_dat(3 downto 0);
						else
							shift_count <= '0' & rd_dat(3 downto 0);
						end if;
						cpu_state <= do_read;
						cpu_state_next <= do_shifts2;
					when do_shifts2 => 
						-- shift count is now ready. rd_dat is our operand.
						arg2 <= rd_dat;
						case ir(9 downto 8) is 
							when "00" =>
								ope <= alu_sra;
							when "01" =>
								ope <= alu_srl;
							when "10" =>
								ope <= alu_sla;
								st(11) <= '0';	-- no overflow (yet)
							when "11" =>
								ope <= alu_src;
							when others =>
						end case;
						cpu_state <= do_shifts3;
					when do_shifts3 => 	-- we stay here doing the shifting
						delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(2*cycle_clks_g, 16));
						arg2 <= alu_result;
						st(15) <= alu_logical_gt;
						st(14) <= alu_arithmetic_gt;
						st(13) <= alu_flag_zero;
						st(12) <= alu_flag_carry;
						-- For SLA, set alu_flag_overflow. We have to handle it in a special way
						-- since during multiple bit shift we cannot rely on the last value of alu_flag_overflow.
						-- st(11) has been cleared in the beginning of the shift, so we only need to set it.
						if ir(9 downto 8) = "10" and alu_flag_overflow='1' then
							st(11) <= '1';
						end if;
						dec_shift_count := True;
						if shift_count = "00001" then 
							ope <= alu_load2;				-- pass through the previous result
							cpu_state <= do_shifts4;	-- done with shifting altogether
						else 
							cpu_state <= do_shifts3;	-- more shifting to be done
						end if;
					when do_shifts4 =>
						-- Store the result of shifting, and return to next instruction.
						wr_dat <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= do_fetch;
						
					-------------------------------------------------------------
					-- Single bit CRU instructions
					-------------------------------------------------------------
					when do_single_bit_cru0 =>
						-- contents of R12 are in rd_dat. Sign extend the 8-bit displacement.
						arg1 <= ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7) & ir(7 downto 0) & '0';
						arg2 <= rd_dat;
						ope <= alu_add;
						cpu_state <= do_single_bit_cru1;
					when do_single_bit_cru1 =>
						addr <= "000" & alu_result(12 downto 1) & '0';
						cruout <= ir(8);	-- in case of output, drive to CRUOUT the bit (SBZ, SBO)
						cpu_state <= do_single_bit_cru2;
						delay_count <= cru_delay_clocks;
					when do_single_bit_cru2 =>
						-- stay in this state until delay over. For writes drive CRUCLK high.
						if ir(15 downto 8) /= x"1F" then	-- Not TB
							-- SBO or SBZ - or external instructions
							cruclk <= '1';
						end if;
						if delay_count = "00000000" then
							cpu_state <= do_fetch;
							cruclk <= '0';		-- drive low, regardless of write or read. For reads (TB) this was zero to begin with.
							if ir(15 downto 8) = x"1F" then -- Check if we have TB instruction (Mike)
								st(13) <= cruin;	-- If SBZ, now capture the input bit
							end if;
						end if;
						
					-------------------------------------------------------------
					-- External instructions
					-------------------------------------------------------------
					when do_ext_instructions =>
						-- external instructions IDLE, RSET, CKOF, CKON, LREX
						-- These are all the same in that they issue a CRUCLK pulse.
						-- But high bits of address bus indicate which instruction it is.
						if ir = x"0360" then 
							st(3 downto 0) <= "0000";  -- RSET
						end if;
						addr(15 downto 13) <= rd_dat(7 downto 5);
						delay_count <= "00000101";	-- 5 clock cycles, used as delay counter
						cpu_state <= do_single_bit_cru2; -- issue CRUCLK pulse
						if ir = x"0340" then
							-- IDLE instruction, go to idle state instead of cru stuff
							cpu_state <= do_idle_wait;
						end if;
						
					when do_idle_wait =>
						if delay_count /= "00000000" then
							cruclk <= '1';
						else
							cruclk <= '0';
							-- see if we should escape idle state, i.e. we get an interrupt we need to serve
							if int_req = '1' and unsigned(ic03) <= unsigned(st(3 downto 0)) then
								cpu_state <= do_fetch;
							end if;
						end if;
						
					-------------------------------------------------------------
					-- Store ST or W to workspace register
					-------------------------------------------------------------
					when do_store_instructions => -- STST, STWP
						if ir(6 downto 5)="10" then
							wr_dat <= st;	-- STST
						else
							wr_dat <= w;	-- STWP
						end if;
						cpu_state <= do_alu_write;
						cpu_state_next <= do_fetch;
						
					-------------------------------------------------------------
					-- COC, CZC, XOR, MPY, DIV
					-------------------------------------------------------------
					when do_coc_czc_etc0 =>
						-- Need to read destination operand. Source operand is in rd_dat.
						reg_t <= rd_dat;	-- store source operand
						operand_mode <= "00" & ir(9 downto 6);	-- register operand
						cpu_state <= do_source_address0;			-- calculate address of our register
						cpu_state_operand_return <= do_coc_czc_etc1;
					when do_coc_czc_etc1 =>
						ea <= alu_result;	-- store the effective address and go and read the destination operand
						cpu_state <= do_read;
						cpu_state_next <= do_coc_czc_etc2;
					when do_coc_czc_etc2 =>
						arg1 <= reg_t;		-- source
						arg2 <= rd_dat;	-- dest
						cpu_state <= do_stuck;
						case ir(12 downto 10) is 
							when "000" => -- COC
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
								ope <= alu_coc;
								cpu_state <= do_coc_czc_etc3;
							when "001" => -- CZC
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
								ope <= alu_czc;
								cpu_state <= do_coc_czc_etc3;
							when "010" => -- XOR
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(14*cycle_clks_g, 16));
								ope <= alu_xor;
								cpu_state <= do_coc_czc_etc3;
							when "110" => -- MPY		
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(52*cycle_clks_g, 16));
								mult_a <= "00" & reg_t;
								mult_b <= "00" & rd_dat;
								cpu_state <= do_mul_store0;
								--delay_count <= "00000100";
								delay_count <= "00010100";
							when "111" => -- DIV
								--delay_ir_wait done elsewhere
								-- we need here dest - source operation
								arg1 <= rd_dat;
								arg2 <= reg_t;
								ope <= alu_sub;		-- do initial comparison
								cpu_state <= do_div0;
--                   The following are commented out and will stuck the CPU								
							when others =>
						end case;
					when do_coc_czc_etc3 =>
						-- COC, CZC, set only flag 2. Nothing is written to destination register.
						-- XOR sets flags 0-2
						st(13) <= alu_flag_zero;
						if ir(12 downto 11) = "00" then
							cpu_state <= do_fetch;			-- done for COC and CZC
						elsif ir(12 downto 11) = "01" then -- XOR
							st(15) <= alu_logical_gt;
							st(14) <= alu_arithmetic_gt;
							wr_dat <= alu_result;
							cpu_state <= do_write;
							cpu_state_next <= do_fetch;
						else
							cpu_state <= do_stuck;
						end if;
					when do_mul_store0 =>
						if delay_count = "00000000" then
							cpu_state <= do_mul_store1;
						end if;
					when do_mul_store1 =>
						cpu_state <= do_write;
						cpu_state_next <= do_mul_store2;
						wr_dat <= mult_product(31 downto 16);
						arg1 <= x"0002";
						arg2 <= ea;
						ope <= alu_add;
					when do_mul_store2 =>
						ea <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= do_fetch;
						wr_dat <= mult_product(15 downto 0);
						
					when do_div0 => -- division, now alu_result is arg1-arg2 i.e. dest-source
						-- reg_t = source, rd_dat = destination
						-- First check for overflow condition (ST4) i.e. st(11)
						st(11) <= '0'; -- by default no overflow
						if (reg_t(15)='0' and rd_dat(15)='1') or (reg_t(15)=rd_dat(15) and alu_result(15)='0') then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(16*cycle_clks_g, 16));
							st(11) <= '1';	 -- overflow
							cpu_state <= do_fetch;	-- done
						else
						delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(92*cycle_clks_g, 16));
							-- fetch the 2nd word of the dividend, first calculate it's address
							dividend(31 downto 16) <= rd_dat;	-- store the high word
							arg1 <= x"0002";
							arg2 <= ea;
							ope <= alu_add;							
							cpu_state <= do_alu_read;
							cpu_state_next <= do_div1;
						end if;
					when do_div1 =>
						dividend(15 downto 0) <= rd_dat; -- store the low word
						shift_count <= "10000"; -- 16
						cpu_state <= do_div2;
					when do_div2 =>
						delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(2*cycle_clks_g, 16));
						dividend(31 downto 0) <= dividend(30 downto 0) & '0'; -- shift left
						-- perform 17-bit substraction, picking up the bit to shifted out too
						divider_sub <= std_logic_vector(unsigned(dividend(31 downto 15)) - unsigned('0' & reg_t));
						dec_shift_count := True;	-- decrement count				
						cpu_state <= do_div3;
					when do_div3 =>
						if divider_sub(16)='0' then	
							-- successful subtract
							dividend(31 downto 16) <= divider_sub(15 downto 0);
							dividend(0) <= '1';
						end if;
						if shift_count /= "00000" then
							cpu_state <= do_div2; -- loop back
						else
							cpu_state <= do_div4;
						end if;
					when do_div4 =>
						-- done with the division.
						wr_dat <= dividend(15 downto 0);	-- store quotient. This operation cannot be merged with the above or we do not capture the LSB.
						-- prepare in ALU the next address 
						arg1 <= x"0002";
						arg2 <= ea;
						ope <= alu_add;
						-- write
						cpu_state <= do_write;
						cpu_state_next <= do_div5; 
					when do_div5 =>
						-- write remainder to memory, continue with next instruction
						wr_dat <= dividend(31 downto 16);
						ea <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= do_fetch;
					
					-------------------------------------------------------------
					-- XOP - processed like BLWP but with a few extra steps
					-------------------------------------------------------------
					when do_xop =>
						-- alu_result is here the effective address
						reg_t2 <= alu_result;	-- effective address on its way to R11, save to t2
						-- calculate XOP vector address
						arg1 <= x"0040";
						arg2 <= x"00" & "00" & ir(9 downto 6) & "00";	-- 4*XOP number
						ope <= alu_add;
						cpu_state <= do_blwp00;
						i_am_xop <= True;

					-------------------------------------------------------------
					-- LDCR and STCR
					-------------------------------------------------------------
					when do_ldcr0 =>	
						-- LDCR, now rd_dat is source operand
						reg_t <= read_byte_aligner;	-- LDCR
						-- We need to setup flags - shove the (SA) which was just read into the ALU.
						-- We perform a dummy add with zero to get the flags out.
						arg1 <= read_byte_aligner;
						ope <= alu_load1;
						cpu_state <= do_ldcr00;
					when do_ldcr00 =>
						-- Update the CPU flags ST0-ST2 and ST5 if count is <= 8
						st(15) <= alu_logical_gt;
						st(14) <= alu_arithmetic_gt;
						st(13) <= alu_flag_zero;
						if not operand_word then
							ST(10) <= alu_flag_parity;
						end if;
						operand_mode <= "001100";	-- Reg 12 in direct addressing mode
						cpu_state <= do_read_operand0;
						cpu_state_operand_return <= do_ldcr1;
					when do_stcr0 =>
						-- STCR, here alu_result is the address of our operand.
						-- reg_t will contain the operand for OR
						if operand_word then
							reg_t <= x"0001";
						else
							reg_t <= x"0100";
						end if;
						reg_stcr <= x"0000";
						reg_t2 <= alu_result;		-- Store the destination effective address
						operand_mode <= "001100";	-- Reg 12 in direct addressing mode
						cpu_state <= do_read_operand0;
						cpu_state_operand_return <= do_ldcr1;
					when do_ldcr1 =>
						-- rd_dat is now R12
						ea <= rd_dat;
						if ir(9 downto 6) = "0000" then
							if ir(10) = '0' then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(20*cycle_clks_g, 16));
							else
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(60*cycle_clks_g, 16));
							end if;
							shift_count <= '1' & ir(9 downto 6);
						else
							if ir(10) = '0' then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(20*cycle_clks_g, 16));
							else
								if ir(9 downto 6) = "1000" then
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(44*cycle_clks_g, 16));
								elsif ir(9) = '1' then
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(58*cycle_clks_g, 16));
								else
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(42*cycle_clks_g, 16));
								end if;
							end if;
							shift_count <= '0' & ir(9 downto 6);
						end if;
						cpu_state <= do_ldcr2;
					when do_ldcr2 =>
						arg2 <= reg_t;
						if ir(10) = '0' then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(2*cycle_clks_g, 16));
							ope <= alu_srl;	-- for LDCR,shift right	
							cpu_state <= do_ldcr3;							
						else	
							ope <= alu_sla;	-- for STCR, shift left
							cpu_state <= do_stcr_delay0; -- a few cycles delay from address
						end if;
						addr <= "000" & ea(12 downto 1) & '0'; -- "000" & alu_result(12 downto 1) & '0';
					when do_stcr_delay0 =>
						cpu_state <= do_stcr_delay1;
					when do_stcr_delay1 =>
						cpu_state <= do_ldcr3;
					when do_ldcr3 =>
						if ir(10) = '0' then	-- LDCR
							cpu_state <= do_ldcr4;
							if operand_word then
								cruout <= alu_flag_carry;
							else
								cruout <= alu_result(7);	-- Byte operand
							end if;
						else
							-- STCR or in the data we get; done outside the ALU just here
							if cruin = '1' then
								reg_stcr <= reg_stcr or reg_t;	
							end if;
							cpu_state <= do_ldcr5;	-- skip creation of CLKOUT pulse
						end if;
						reg_t <= alu_result;				-- store right shifted operand
						arg1 <= x"0002";
						arg2 <= ea;
						ope <= alu_add;
						delay_count <= cru_delay_clocks;
					when do_ldcr4 =>
						cruclk <= '1';
						cpu_state <= do_ldcr5;
					when do_ldcr5 =>
						if delay_count = "00000000" then
							ea <= alu_result;
							cruclk <= '0';
							dec_shift_count := True;
							if shift_count = "00001" then
								if ir(10) = '0' then
									cpu_state <= do_fetch;		-- LDCR, we are done
								else
									cpu_state <= do_stcr6;		-- STCR, we need to store the result
								end if;
							else
								cpu_state <= do_ldcr2;
							end if;
						end if;
					when do_stcr6 =>
						-- Writeback the result in reg_stcr. 
						-- For byte operation support, we need to read the destination before writing
						-- to it. reg_t2 has the destination address.
						st(15) <= '0';
						st(14) <= '0';
						st(13) <= '1';
						st(12) <= '0';
						if (reg_stcr /= x"0000") then
							st(15) <= '1';
							st(13) <= '0';
							st(14) <= not reg_stcr(15);
						end if;
						ea <= reg_t2;
						cpu_state <= do_read;
						cpu_state_next <= do_stcr7;
					when do_stcr7 =>
						-- Ok now rd_dat has destination data from memory. 
						-- Let's merge our data from reg_stcr and write the bloody thing back.
						if operand_word then
							wr_dat <= reg_stcr;
						else
							-- Byte operation.
							if ea(0)='0' then -- high byte impacted
								wr_dat <= reg_stcr(15 downto 8) & rd_dat(7 downto 0);
							else	-- low byte impacted
								wr_dat <= rd_dat(15 downto 8) & reg_stcr(15 downto 8); 
							end if;
						end if;
						cpu_state_next <= do_fetch;
						cpu_state <= do_write;
						

					-------------------------------------------------------------
					-- subprogram to calculate source operand address SA
					-- This does not include reading the source operand, the address is
					-- left at ALU output register alu_result
					-------------------------------------------------------------					
					when do_source_address0 =>
						arg1 <= w;
						arg2 <= x"00" & "000" & operand_mode(3 downto 0) & '0';
						ope <= alu_add;	-- calculate workspace address
						case operand_mode(5 downto 4) is
							when "00" => -- workspace register
								cpu_state <= cpu_state_operand_return;	-- return the workspace register address
							when "01" => -- workspace register indirect
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(4*cycle_clks_g, 16));
								cpu_state <= do_alu_read;
								cpu_state_next <= do_source_address1;
							when "10" => -- symbolic or indexed mode
								delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
								cpu_state <= do_pc_read;
								if operand_mode(3 downto 0) = "0000" then
									cpu_state_next <= do_source_address1;	-- symbolic
								else
									cpu_state_next <= do_source_address2;	-- indexed
								end if;
							when "11" => -- workspace register indirect with autoincrement
								cpu_state <= do_alu_read;
								cpu_state_next <= do_source_address4;
							when others =>
								cpu_state <= do_stuck;
						end case;
					when do_source_address1 =>
						-- Make the result visible in alu output, i.e. the contents of the memory read.
						-- This is either workspace register contents in case of *Rx or the immediate operand in case of @LABEL
						arg2 <= rd_dat;
						ope  <= alu_load2;
						cpu_state <= cpu_state_operand_return;
					when do_source_address2 =>
						-- Indexed. rd_dat is the immediate parameter. alu_result is still the address of register Rx.
						-- We need to read the register and add it to rd_dat.
						reg_t <= rd_dat;
						cpu_state <= do_alu_read;
						cpu_state_next <= do_source_address3;
					when do_source_address3 =>
						arg1 <= rd_dat;	-- contents of Rx
						arg2 <= reg_t;		-- @TABLE
						ope <= alu_add;
						cpu_state <= cpu_state_operand_return;
					when do_source_address4 =>	-- autoincrement
						reg_t <= rd_dat;	-- save the value of Rx, this is our return value
						arg1 <= rd_dat;
						if operand_word then
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(8*cycle_clks_g, 16));
							arg2 <= x"0002";	
						else
							delay_ir_wait <= std_logic_vector(unsigned(delay_ir_wait) + to_unsigned(6*cycle_clks_g, 16));
							arg2 <= x"0001";	
						end if;
						ope <= alu_add;
						ea <= alu_result;	-- save address of register before alu op destroys it					
						cpu_state <= do_source_address5;
					when do_source_address5 =>
						-- writeback the autoincremented value
						wr_dat <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= do_source_address6;
					when do_source_address6 =>
						-- end of the autoincrement stuff, now put source address to ALU output
						arg2 <= reg_t;
						ope <= alu_load2;
						cpu_state <= cpu_state_operand_return;
					
					-------------------------------------------------------------
					-- subprogram to do operand fetching, data returned in rd_dat.
					-- operand address is left to EA (when appropriate)
					when do_read_operand0 =>
						-- read workspace register. Goes to waste if symbolic mode.
						arg1 <= w;
						arg2 <= x"00" & "000" & operand_mode(3 downto 0) & '0';
						ope <= alu_add;	-- calculate workspace address
						cpu_state <= do_alu_read;	-- read from addr of ALU output
						cpu_state_next <= do_read_operand1;
						-- test_out <= x"EE00";
					when do_read_operand1 =>
						-- test_out <= x"EE01";
						case operand_mode(5 downto 4) is
						when "00" =>
							-- workspace register, we are done.
							ea <= alu_result; -- effective address must be stored for byte selection to work
							cpu_state <= cpu_state_operand_return;
						when "01" =>
							-- workspace register indirect
							ea <= rd_dat;
							cpu_state <= do_read;
							-- return via operand read
							cpu_state_next <= cpu_state_operand_return;
						when "10" =>
							-- read immediate operand for symbolic or indexed mode
							reg_t <= rd_dat;	-- save register value for later
							cpu_state <= do_pc_read;
							cpu_state_next <= do_read_operand2;
						when "11" =>
							-- workspace register indirect auto-increment
							reg_t <= rd_dat;		-- register value, to be left to EA
							ea <= alu_result;		-- address of register
							arg1 <= rd_dat;
							if operand_word then
								arg2 <= x"0002";	
							else
								arg2 <= x"0001";	
							end if;
							ope <= alu_add;		-- add for autoincrement
							cpu_state <= do_read_operand3;
						when others =>
							cpu_state <= do_stuck;	-- get stuck, should never happen
						end case;
					when do_read_operand2 =>
						-- indirect or indexed mode here
						-- test_out <= x"EE02";
						if operand_mode(3 downto 0) = "0000" then
							-- symbolic, read from rd_dat
							ea <= rd_dat;
							cpu_state <= do_read;
							-- return after read
							cpu_state_next <= cpu_state_operand_return;
						else
							-- indexed, need to compute the address
							-- We need to return via an extra state (not with do_alu_read) since
							-- EA needs to be setup.
							arg1 <= rd_dat;
							arg2 <= reg_t;
							ope <= alu_add;
							cpu_state <= do_read_operand5;
						end if;
					when do_read_operand3 =>
						-- test_out <= x"EE03";
						-- write back our result to the register
						wr_dat <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= do_read_operand4;
					when do_read_operand4 =>
						-- Now we need to read the actual value. And return in EA where it came from.
						ea <= reg_t;
						cpu_state <= do_read;
						cpu_state_next <= cpu_state_operand_return;
					when do_read_operand5 =>
						ea <= alu_result;
						cpu_state <= do_read;
						cpu_state_next <= cpu_state_operand_return; 	-- return via read
						
						
					-- subprogram to do operand writing, data to write in wr_dat
					when do_write_operand0 =>
						-- read workspace register. Goes to waste if symbolic mode.
						-- test_out <= x"AA00";
						arg1 <= w;
						arg2 <= x"00" & "000" & operand_mode(3 downto 0) & '0';
						ope <= alu_add;	-- calculate workspace address
						if operand_mode(5 downto 4) = "00" then
							-- write to workspace register directly, then done!
							cpu_state <= do_alu_write;
							cpu_state_next <= cpu_state_operand_return;
						else
							-- we have an indirect write, so need to first read the workspace register
							cpu_state <= do_alu_read;	-- read from addr of ALU output
							cpu_state_next <= do_write_operand1;
						end if;
					when do_write_operand1 =>
						-- test_out <= x"AA01";
						case operand_mode(5 downto 4) is
						when "01" =>
							-- workspace register indirect
							ea <= rd_dat;
							cpu_state <= do_write;
							-- return via operand write
							cpu_state_next <= cpu_state_operand_return;
						when "10" =>
							-- read immediate operand for symbolic or indexed mode
							reg_t <= rd_dat;	-- save register value for later
							cpu_state <= do_pc_read;
							cpu_state_next <= do_write_operand2;
						when "11" =>
							-- workspace register indirect auto-increment
							ea <= rd_dat;
							reg_t <= rd_dat;
							cpu_state <= do_write;
							cpu_state_next <= do_write_operand3;
						when others =>
							cpu_state <= do_stuck;	-- get stuck, should never happen
						end case;
					when do_write_operand2 =>
						-- indirect or indexed mode here
						if operand_mode(3 downto 0) = "0000" then
							-- symbolic, write to address rd_dat
							-- test_out <= x"AA02";
							ea <= rd_dat;
							cpu_state <= do_write;
							-- return after write
							cpu_state_next <= cpu_state_operand_return;
						else
							-- indexed, need to compute the address
							-- test_out <= x"AA12";
							arg1 <= rd_dat;
							arg2 <= reg_t;
							ope <= alu_add;
							cpu_state <= do_alu_write;
							-- return after read
							cpu_state_next <= cpu_state_operand_return;
						end if;
					when do_write_operand3 =>
						-- need to autoincrement our register. rd_dat contains still our read data.
						-- test_out <= x"AA03";
						arg1 <= reg_t;		-- register value
						if operand_word then
							arg2 <= x"0002";	-- word operation, inc by 2
						else
							arg2 <= x"0001";
						end if;
						ope <= alu_add;
						ea <= alu_result;	-- save address of register before alu op destroys it
						cpu_state <= do_write_operand4;
					when do_write_operand4 =>
						-- writeback of autoincremented register
						-- test_out <= x"AA04";
						wr_dat <= alu_result;
						cpu_state <= do_write;
						cpu_state_next <= cpu_state_operand_return;
						
						
					when do_stuck =>
						stuck <= '1';
						holda <= hold;
				end case;

				-- decrement shift count if necessary
				if dec_shift_count then
					shift_count <= std_logic_vector(unsigned(shift_count) - to_unsigned(1, 5));
				end if;
				
				if delay_count /= "00000000" then
					delay_count <= std_logic_vector(unsigned(delay_count) - to_unsigned(1, 8));
				end if;
				
				if inc_ir_count then
					delay_ir_count <= std_logic_vector(unsigned(delay_ir_count) + to_unsigned(1, 16));
				end if;
				
			
			  end if; -- enable
			end if; -- rising_edge
		end if;	
	end process;

end Behavioral;

