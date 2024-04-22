----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:55 04/20/2014 
-- Design Name: 
-- Module Name:    CPU_StateMachine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_StateMachine is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           do_skip : in  STD_LOGIC;
           skip_flag : in  STD_LOGIC;
           clearacc : in  STD_LOGIC;
           mem_finished : in  STD_LOGIC;
           run : in  STD_LOGIC;
           loadpc : in  STD_LOGIC;
           loadac : in  STD_LOGIC;
           deposit : in  STD_LOGIC;
           step : in  STD_LOGIC;
           i_reg : in  STD_LOGIC_VECTOR (11 downto 0);
           swchange : in  STD_LOGIC;
           autoincrement : in  STD_LOGIC;
           memallones : in  STD_LOGIC;
           halt : out  STD_LOGIC;
			  difbit : in STD_LOGIC;
           bit1_cp2 : out  STD_LOGIC;
           bit2_cp3 : out  STD_LOGIC;
           read_enable : out  STD_LOGIC;
           write_enable : out  STD_LOGIC;
           en_load_ac_and : out  STD_LOGIC;
           en_load_ac_panel : out  STD_LOGIC;
           en_load_ac_or_io : out  STD_LOGIC;
           en_load_ac_mq : out  STD_LOGIC;
           en_load_ac_or_mq : out  STD_LOGIC;
           en_clear_ac : out  STD_LOGIC;
           en_load_opr1 : out  STD_LOGIC;
           en_load_ac_add : out  STD_LOGIC;
           en_load_pc_panel : out  STD_LOGIC;
           en_load_pc_ea : out  STD_LOGIC;
           en_inc_pc : out  STD_LOGIC;
           en_load_i : out  STD_LOGIC;
           en_load_ea_mem : out  STD_LOGIC;
           en_load_ea_memp1 : out  STD_LOGIC;
           en_load_ea : out  STD_LOGIC;
           en_addr_ea : out  STD_LOGIC;
           en_addr_pc : out  STD_LOGIC;
           en_addr_sw : out  STD_LOGIC;
           en_data_ac : out  STD_LOGIC;
           en_data_pcp1 : out  STD_LOGIC;
           en_data_sw : out  STD_LOGIC;
           en_load_mq_ac : out  STD_LOGIC;
           en_load_ac_or_swreg : out  STD_LOGIC;
           en_data_memp1 : out  STD_LOGIC;
			  en_do_multiply : out STD_LOGIC;
			  en_shift_left : OUT std_logic;
		     en_do_divide : out std_logic;
		     en_clear_l : OUT std_logic;
-- added for additional EAE support
		en_dec_sc : OUT std_logic;
		en_inc_sc : OUT std_logic;
		en_load_sc_mem : OUT std_logic;
		en_clear_sc : OUT std_logic;
		sc0 : IN std_logic;
		normalized : IN std_logic;
		en_load_ac_sc : OUT std_logic;
		en_load_sc_compl_mem :OUT std_logic;
		en_left_shift_with_l : OUT std_logic;
		en_right_shift : OUT std_logic;
		en_load_l_ac11 : OUT std_logic;
-- Missing!
		en_load_hidden : OUT std_logic
			  );
end CPU_StateMachine;

architecture Behavioral of CPU_StateMachine is

-- For the state machine
	type STATE_TYPE is (S0, S0A, S0B, S0C, SIFETCH, SIDECODE, INDIR, INDIR2, INDIR3, INDIR4,
	                    DISPATCH, ISZ, ISZ1, IOTPER2, IOTPER3, GROUP3A, GROUP2P, MULDIV, MULDIV2,
							  MUL, DIV, NMI, SHL, SHR, LASTSTATE);
	signal curr_state : STATE_TYPE := S0;
	signal next_state : STATE_TYPE;
	signal counter : integer range 0 to 12 := 0;
	signal en_counter, cnt11 : std_logic;
begin
-- Counter for divide
	process (clk) begin
		if rising_edge(clk) then
			if en_counter = '1' then
				counter <= counter + 1;
			else
				counter <= 0;
			end if;
		end if;
	end process;
	cnt11 <= '1' when counter = 11 else '0';

-- State Machine (can be pulled into another module)
	process (clk) begin
		if rising_edge(clk) then
			if reset = '1' then
				curr_state <= S0;
			else
				curr_state <= next_state;
			end if;
		end if;
	end process;
	
	process (difbit, normalized, sc0, cnt11, do_skip, skip_flag, clearacc, curr_state, mem_finished, run, loadpc, loadac, deposit, step, i_reg, swchange, autoincrement, memallones) begin
		next_state <= curr_state; -- set the defaults
		halt <= '0';
		bit1_cp2 <= '0';
		bit2_cp3 <= '0';
		read_enable <= '0';
		write_enable <= '0';
      en_load_ac_and <= '0';
		en_load_ac_panel <= '0';
		en_load_ac_or_io <= '0';
		en_load_ac_mq <= '0';
		en_load_ac_or_mq <= '0';
		en_clear_ac <= '0';
		en_load_opr1 <= '0';
		en_load_ac_add <= '0';
		en_load_pc_panel <= '0';
	   en_load_pc_ea <= '0';
		en_inc_pc <= '0';
		en_load_i <= '0';
		en_load_ea_mem <= '0';
		en_load_ea_memp1 <= '0';
		en_load_ea <= '0';
	   en_addr_ea <= '0';
		en_addr_pc <= '0';
		en_addr_sw <= '0';
		en_data_ac <= '0';
		en_data_pcp1 <= '0';
		en_data_sw <= '0';
		en_data_memp1 <= '0';
		en_load_mq_ac <= '0';
		en_load_ac_or_swreg <= '0';
		en_do_multiply <= '0';
		en_shift_left <= '0';
		en_do_divide <= '0';
		en_clear_l <= '0';
		en_counter <= '0';
		en_dec_sc <= '0';
		en_inc_sc <= '0';
		en_load_sc_mem <= '0';
		en_clear_sc <= '0';
		en_load_ac_sc <= '0';
		en_load_sc_compl_mem <= '0';
		en_left_shift_with_l <= '0';
		en_right_shift <= '0';
		en_load_l_ac11 <= '0';
		en_load_hidden <= '0';

	   case (curr_state) is
			when S0 => -- en_addr_sw <= '1'; read_enable <= '1'; -- I don't see why I'm doing this
							next_state <= S0A; -- Start out by reading memory location
			when S0A => -- finish memory operation
						en_addr_sw <= '1'; read_enable <= '1';
						if mem_finished = '1' then en_load_hidden <= '1'; next_state <= S0B; end if; -- read has finished;
			when S0B => if loadpc = '1' then en_load_pc_panel <= '1'; -- Detect switches
						  elsif loadac = '1' then en_load_ac_panel <= '1';
						  elsif deposit = '1' then en_data_sw <= '1'; en_addr_pc <= '1'; write_enable<= '1'; en_inc_pc <= '1'; next_state <= S0C;
						  elsif step = '1' OR run = '1' then next_state <= SIFETCH; -- Start execution
						  elsif swchange = '1' then  -- en_addr_sw <= '1'; read_enable<='1'; -- Why??
						                              next_state <= S0A;
						  end if;
			when S0C => -- deposit operation finishing
					   if mem_finished = '1' then next_state <= S0; end if;
			when SIFETCH => -- Fetch a new instruction
				en_addr_pc <= '1'; read_enable<='1';
				if mem_finished = '1' then en_load_i <= '1'; next_state <= SIDECODE; end if;
			when SIDECODE => -- Decode fetched instruction
				case i_reg(11 downto 9) is 
					when "110" => -- IOT
						if i_reg(0) = '1' AND skip_flag = '1' then en_inc_pc <= '1'; end if; -- Clock period 1
						next_state <= IOTPER2;
					when "111" => -- OPR
						if i_reg(8) = '0' then -- group 1
							en_load_opr1 <= '1';
							next_state <= LASTSTATE;
						elsif i_reg(0) = '0' then -- group 2
							if do_skip = '1' then en_inc_pc <= '1'; end if;
							if i_reg(7) = '1' then en_clear_ac <= '1'; end if;
							-- The protected group 2 should require bit 8=1 but macro8x
							-- doesn't set it.
							if (i_reg(1) = '1' OR i_reg(2) = '1') then next_state <= GROUP2P;
							else
								next_state <= LASTSTATE;
							end if;
						else -- group 3
							if i_reg(7) = '1' then en_clear_ac <= '1'; end if;
							next_state <= GROUP3A;
						end if;
					when others => -- All memory reference instructions
					   en_load_ea <= '1';
						if i_reg(8) = '1' then next_state <= INDIR; else next_state <= DISPATCH; end if;
				end case;
			when INDIR => en_addr_ea <= '1'; read_enable <= '1'; next_state <= INDIR2;
			when INDIR2 => if mem_finished = '1' then
									if autoincrement = '1' then -- autoincrement
							         -- we must wait a clock period to start IO Write (no overlap allowed)
									   en_addr_ea <= '1'; -- needed to hold data valid
										next_state <= INDIR3;
									else 
										en_load_ea_mem <= '1'; next_state <= DISPATCH;
									end if;
								end if;
			when INDIR3 => -- autoincrement
							en_load_ea_memp1 <= '1';
							en_addr_ea <= '1';
							write_enable <= '1';
							en_data_memp1 <= '1';
							next_state <= INDIR4;
			when INDIR4 => if mem_finished = '1' then next_state <= DISPATCH; end if;
			when DISPATCH => -- Dispatch memory reference instructions
				case i_reg(11 downto 9) is
					when "000" => -- AND
						en_addr_ea <= '1'; read_enable <= '1'; 
						if mem_finished = '1' then en_load_ac_and <= '1'; next_state <= LASTSTATE; end if;
					when "001" => -- TAD
						en_addr_ea <= '1'; read_enable <= '1';
						if mem_finished = '1' then en_load_ac_add <= '1'; next_state <= LASTSTATE; end if;
					when "010" => -- ISZ
						en_addr_ea <= '1'; read_enable <= '1';
						if mem_finished = '1' then next_state <= ISZ; end if;
					when "011" => -- DCA
						en_addr_ea <= '1'; en_data_ac <= '1'; write_enable <= '1'; en_clear_ac <= '1'; next_state <= ISZ1;
					when "100" =>  -- JMS
						en_addr_ea <= '1'; en_data_pcp1 <= '1'; write_enable <= '1'; 
						en_load_pc_ea <= '1'; next_state <= ISZ1;
					when "101" => -- JMP
						en_load_pc_ea <= '1';
						if run = '0' then next_state <= S0; else next_state <= SIFETCH; end if;
					when others => next_state <= S0; -- never happens
				end case;
			when ISZ => -- ISZ added state to separate read fromm write
                    en_addr_ea <= '1'; en_data_memp1 <= '1'; write_enable <= '1'; next_state <= ISZ1;
						 if memallones = '1' then en_inc_pc <= '1'; end if; -- skip
			
			when ISZ1 => -- wait for write to memory to finish
				if mem_finished = '1' then next_state <= LASTSTATE; end if;
			when IOTPER2 => -- IOT second clock period
				if i_reg(1) = '1' then bit1_cp2 <= '1'; end if;
				if i_reg(1) = '1' AND clearacc = '1' then en_clear_ac <= '1'; end if;
				next_state <= IOTPER3;
			when IOTPER3 => -- IOT third clock period
				if i_reg(2) = '1' then 
					bit2_cp3 <= '1';
					en_load_ac_or_io <= '1';
				end if;
				next_state <= LASTSTATE;
			when GROUP3A => 
				if i_reg(6) = '1' then -- MQA
					if i_reg(4) = '1' then -- MQA MQL
						en_load_ac_mq <= '1';
						en_load_mq_ac <= '1';
					else
						en_load_ac_or_mq <= '1';
					end if;
				elsif i_reg(4) = '1' then -- MQL
					en_load_mq_ac <= '1';
					en_clear_ac <= '1';
				end if;
				if i_reg(5) = '1' then -- SCA
					en_load_ac_sc <= '1';
				end if;
				if i_reg(3 downto 1) = "100" then -- NMI
					en_clear_sc <= '1';
					next_state <= NMI;
				elsif i_reg(3 downto 1) /= "000" then -- EAE instructions other than NMI
					en_inc_pc <= '1'; -- fetch next location
					next_state <= MULDIV;
				else
					next_state <= LASTSTATE;
				end if;
			when MULDIV =>
				en_addr_pc <= '1'; read_enable <= '1'; -- get word
				next_state <= MULDIV2;
			when MULDIV2 =>
				if mem_finished = '1' then
					en_load_ea_mem <= '1';
					case i_reg(3 downto 1) is
					when "001" => -- SCL
						en_load_sc_compl_mem <= '1';
						next_state <= LASTSTATE;
					when "010" => -- MUY
						en_clear_l <= '1';
						next_state <= MUL;
					when "011" => -- DIV
						en_clear_l <= '1';
						next_state <= DIV;
					when "101" => -- SHL
						en_load_sc_mem <= '1';
						next_state <= SHL;
					when "110" => -- ASR
						en_load_sc_mem <= '1';
						en_load_l_ac11 <= '1';
						next_state <= SHR;
					when "111" => -- LSR
						en_load_sc_mem <= '1';
						en_clear_l <= '1';
						next_state <= SHR;
					when others =>
					end case;
				end if;
			when MUL => 
				en_do_multiply <= '1';
				next_state <= LASTSTATE;
			when DIV => 
				en_counter <= '1';
				if cnt11 = '1' then 
				    next_state <= LASTSTATE; 
				end if;
				if difbit = '0' then 
					en_do_divide <= '1';
				else
					en_shift_left <= '1';
				end if;
			when NMI =>
				if normalized = '1' then next_state <= LASTSTATE;
				else en_inc_sc <= '1'; en_left_shift_with_l <= '1';
				end if;
			when SHL =>
				if sc0 = '1' then next_state <= LASTSTATE; end if;
				en_left_shift_with_l <= '1';
				en_dec_sc <= '1';
			when SHR =>
				if sc0 = '1' then next_state <= LASTSTATE; end if;
				en_right_shift <= '1';
				en_dec_sc <= '1';
			when GROUP2P => -- Group 2 privileged instructions
				if i_reg(2) = '1' then en_load_ac_or_swreg <= '1'; end if;
				if i_reg(1) = '1' then halt <= '1'; end if;
				next_state <= LASTSTATE;
			when LASTSTATE => -- Last state before instruction fetch;
				en_inc_pc <= '1';
				if run = '0' then next_state <= S0; else next_state <= SIFETCH; end if;
				
			when OTHERS => next_state <= S0; -- never happens
		end case;
	end process;
end Behavioral;

