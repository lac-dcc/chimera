----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:30:31 04/19/2014 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           address : out  STD_LOGIC_VECTOR (11 downto 0);
           write_data : out  STD_LOGIC_VECTOR (11 downto 0);
           read_data : in  STD_LOGIC_VECTOR (11 downto 0);
           write_enable : out  STD_LOGIC;
           read_enable : out  STD_LOGIC;
           mem_finished : in  STD_LOGIC;
           swreg : in  STD_LOGIC_VECTOR (11 downto 0);
           dispsel : in  STD_LOGIC_VECTOR (1 downto 0);
           run : in  STD_LOGIC;
           loadpc : in  STD_LOGIC;
			  loadac : in std_logic;
           step : in  STD_LOGIC;
           deposit : in  STD_LOGIC;
           dispout : out  STD_LOGIC_VECTOR (11 downto 0);
           linkout : out  STD_LOGIC;
           halt : out  STD_LOGIC;
           bit1_cp2 : out  STD_LOGIC;
           bit2_cp3 : out  STD_LOGIC;
           io_address : out  STD_LOGIC_VECTOR (2 downto 0);
           dataout : out  STD_LOGIC_VECTOR (7 downto 0);
           skip_flag : in  STD_LOGIC;
           clearacc : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (7 downto 0));
end CPU;

architecture Behavioral of CPU is

	COMPONENT CPU_StateMachine
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		do_skip : IN std_logic;
		skip_flag : IN std_logic;
		clearacc : IN std_logic;
		mem_finished : IN std_logic;
		run : IN std_logic;
		loadpc : IN std_logic;
		loadac : IN std_logic;
		deposit : IN std_logic;
		step : IN std_logic;
		i_reg : IN std_logic_vector(11 downto 0);
		swchange : IN std_logic;
		autoincrement : IN std_logic;
		memallones : IN std_logic; 
		difbit : IN std_logic;
		halt : OUT std_logic;
		bit1_cp2 : OUT std_logic;
		bit2_cp3 : OUT std_logic;
		read_enable : OUT std_logic;
		write_enable : OUT std_logic;
		en_load_ac_and : OUT std_logic;
		en_load_ac_panel : OUT std_logic;
		en_load_ac_or_io : OUT std_logic;
		en_load_ac_mq : OUT std_logic;
		en_load_ac_or_mq : OUT std_logic;
		en_clear_ac : OUT std_logic;
		en_load_opr1 : OUT std_logic;
		en_load_ac_add : OUT std_logic;
		en_load_pc_panel : OUT std_logic;
		en_load_pc_ea : OUT std_logic;
		en_inc_pc : OUT std_logic;
		en_load_i : OUT std_logic;
		en_load_ea_mem : OUT std_logic;
		en_load_ea_memp1 : OUT std_logic;
		en_load_ea : OUT std_logic;
		en_addr_ea : OUT std_logic;
		en_addr_pc : OUT std_logic;
		en_addr_sw : OUT std_logic;
		en_data_ac : OUT std_logic;
		en_data_pcp1 : OUT std_logic;
		en_data_sw : OUT std_logic;
		en_load_mq_ac : OUT std_logic;
		en_load_ac_or_swreg : OUT std_logic;
		en_data_memp1 : OUT std_logic;
		en_do_multiply : OUT std_logic;
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
-- Missed!
		en_load_hidden : OUT std_logic
		);
	END COMPONENT;

	signal ac_reg, pc_reg, mq_reg, i_reg, ea_reg, hidden_reg: std_logic_vector (11 downto 0) := (others => '0');
	signal l_reg : std_logic := '0';
	signal ac1, ac2, ac3, ac4 : std_logic_vector (11 downto 0);
	signal l1, l2, l3, l4 : std_logic;
	signal aceqz : std_logic;
	signal sum, sum2 : std_logic_vector (12 downto 0);
	signal oldsw : std_logic_vector (11 downto 0) := (others => '0');
	signal product : std_logic_vector (23 downto 0);
	signal difference : std_logic_vector (12 downto 0);
-- For the state machine interface
	signal do_skip, en_load_ac_and, en_load_ac_panel, en_load_ac_or_io, en_load_ac_mq : std_logic;
	signal en_load_ac_or_mq, en_clear_ac, en_load_opr1, en_load_ac_add, en_load_pc_panel : std_logic;
	signal en_load_pc_ea, en_inc_pc, en_load_i, en_load_ea_mem, en_load_ea_memp1, en_load_ea : std_logic;
	signal en_addr_ea, en_addr_pc, en_addr_sw, en_data_ac, en_data_pcp1, en_data_sw: std_logic;
	signal en_load_mq_ac, en_load_ac_or_swreg, en_data_memp1, en_do_multiply, en_shift_left, en_do_divide, en_clear_l : std_logic;
	signal swchange, en_load_hidden : std_logic;
	signal autoincrement, memallones :std_logic;
-- State machine interface, added EAE instructions
	signal en_dec_sc, en_inc_sc, en_load_sc_mem, en_clear_sc, sc0, normalized : std_logic;
	signal en_load_ac_sc, en_load_sc_compl_mem, en_left_shift_with_l, en_right_shift, en_load_l_ac11 : std_logic;
	signal sc_reg : std_logic_vector (4 downto 0) := "00000";
begin
	Inst_CPU_StateMachine: CPU_StateMachine PORT MAP(
		clk => clk,
		reset => reset,
		do_skip => do_skip,
		skip_flag => skip_flag,
		clearacc => clearacc,
		mem_finished => mem_finished,
		run => run,
		loadpc => loadpc,
		loadac => loadac,
		deposit => deposit,
		step => step,
		i_reg => i_reg,
		swchange => swchange,
		autoincrement => autoincrement,
		memallones => memallones,
		halt => halt,
		difbit => difference(12),
		bit1_cp2 => bit1_cp2,
		bit2_cp3 => bit2_cp3,
		read_enable => read_enable,
		write_enable => write_enable,
		en_load_ac_and => en_load_ac_and,
		en_load_ac_panel => en_load_ac_panel,
		en_load_ac_or_io => en_load_ac_or_io,
		en_load_ac_mq => en_load_ac_mq,
		en_load_ac_or_mq => en_load_ac_or_mq,
		en_clear_ac => en_clear_ac,
		en_load_opr1 => en_load_opr1,
		en_load_ac_add => en_load_ac_add,
		en_load_pc_panel => en_load_pc_panel,
		en_load_pc_ea => en_load_pc_ea,
		en_inc_pc => en_inc_pc,
		en_load_i => en_load_i,
		en_load_ea_mem => en_load_ea_mem,
		en_load_ea_memp1 => en_load_ea_memp1,
		en_load_ea => en_load_ea,
		en_addr_ea => en_addr_ea,
		en_addr_pc => en_addr_pc,
		en_addr_sw => en_addr_sw,
		en_data_ac => en_data_ac,
		en_data_pcp1 => en_data_pcp1,
		en_data_sw => en_data_sw,
		en_load_mq_ac => en_load_mq_ac,
		en_load_ac_or_swreg => en_load_ac_or_swreg,
		en_data_memp1 => en_data_memp1,
		en_do_multiply => en_do_multiply,
		en_shift_left => en_shift_left,
		en_do_divide => en_do_divide,
	   en_clear_l => en_clear_l,
		en_dec_sc => en_dec_sc,
		en_inc_sc => en_inc_sc,
		en_load_sc_mem => en_load_sc_mem,
		en_clear_sc => en_clear_sc,
		sc0 => sc0,
		normalized => normalized,
		en_load_ac_sc => en_load_ac_sc,
		en_load_sc_compl_mem => en_load_sc_compl_mem,
		en_left_shift_with_l => en_left_shift_with_l,
		en_right_shift => en_right_shift,
		en_load_l_ac11 => en_load_l_ac11,
		en_load_hidden => en_load_hidden
	);

-- Remainder of front panel interface
	linkout <= l_reg;
	dispout <= pc_reg when dispsel = "00" else
	           ac_reg when dispsel = "01" else
				  hidden_reg when dispsel = "10" else
				  mq_reg;
	
	process (clk) begin -- hidden read data register
		if rising_edge(clk) then
			if en_load_hidden = '1' then
				hidden_reg <= read_data;
			end if;
		end if;
	end process;
	
	process (clk) begin -- detect swreg change
		if rising_edge(clk) then
			oldsw <= swreg;
		end if;
	end process;
	swchange <= '0' when (oldsw = swreg) else '1';
	
-- Other static interfaces
	io_address <= i_reg(5 downto 3);
	dataout <= ac_reg(7 downto 0);
	
-- Comparisons for state machines
	autoincrement <= '1' when ea_reg(11 downto 3) = "000000001" else '0';
	memallones <= '1' when read_data = "111111111111" else '0';
	
-- Group 1 Microcoded instructions
   process (ac_reg, l_reg, i_reg(7 downto 6)) begin
		if i_reg(7) = '1' then ac1 <= (others=> '0'); else ac1 <= ac_reg; end if; -- CLA
		if i_reg(6) = '1' then l1 <= '0'; else l1 <= l_reg; end if; -- CLL
	end process;
	process (ac1, l1, i_reg(5 downto 4)) begin
		if i_reg(5) = '1' then ac2 <= not ac1; else ac2 <= ac1; end if; --CMA
		if i_reg(4) = '1' then l2 <= not l1; else l2 <= l1; end if; -- CML
	end process;
	sum2 <= (l2 & ac2) + "0000000000001";
	process (sum2, ac2, l2, i_reg(0)) begin 
		if i_reg(0) = '1' then  -- IAC
			ac3 <= sum2(11 downto 0);
			l3 <= sum2(12);
		else
			ac3 <= ac2;
			l3 <= l2;
		end if;
	end process;
	process (ac3, l3, i_reg(3 downto 1)) begin
		 case i_reg(3 downto 1) is
			when "100" => l4 <= ac3(0); ac4 <= l3 & ac3(11 downto 1);-- RAR
			when "010" => l4 <= ac3(11); ac4 <= ac3(10 downto 0) & l3;-- RAL
			when "101" => l4 <= ac3(1); ac4 <= ac3(0) & l3 & ac3(11 downto 2);-- RTR
			when "011" => l4 <= ac3(10); ac4 <= ac3(9 downto 0) & l3 & ac3(11);-- RTL
			when "001" => l4 <= l3; ac4 <= ac3(5 downto 0) & ac3(11 downto 6); -- BSW
			when others => ac4 <= ac3; l4 <= l3;
		 end case;
	end process;
-- Group 2 Skip Tests
   aceqz <= '1' when ac_reg = 0 else '0';
	do_skip <= ((NOT i_reg(3)) AND ((i_reg(6) AND ac_reg(11)) OR      -- SMA     "OR GROUP"
											 (i_reg(5) AND aceqz) OR            -- SZA
											 (i_reg(4) AND l_reg)))             -- SNL
				   OR                                                    -- "AND GROUP"
				   (i_reg(3) AND (((NOT i_reg(6)) OR NOT ac_reg(11)) AND     -- SPA
					                   ((NOT i_reg(5)) OR NOT aceqz) AND    -- SNA
									       ((NOT i_reg(4)) OR NOT l_reg)));       -- SZL
-- Memory Address and Memory Data (write) muxes
   address <= ea_reg when en_addr_ea = '1' else
	           pc_reg when en_addr_pc = '1' else
				  swreg when en_addr_sw = '1' else
				  (others => '0');
   write_data <= ac_reg when en_data_ac = '1' else
					  pc_reg+1 when en_data_pcp1 = '1' else
					  swreg when en_data_sw = '1' else
					  read_data+1 when en_data_memp1 = '1' else
					  (others => '0');
-- Define Registers
	process (clk) begin -- SC
		if rising_edge(clk) then
			if en_dec_sc = '1' then sc_reg <= sc_reg - 1;
			elsif en_inc_sc = '1' then sc_reg <= sc_reg + 1;
			elsif en_load_sc_mem = '1' then sc_reg <= read_data(4 downto 0);
			elsif en_load_sc_compl_mem = '1' then sc_reg <= not read_data(4 downto 0);
			elsif en_clear_sc = '1' then sc_reg <= (others => '0');
			end if;
		end if;
	end process;
	sc0 <= '1' when sc_reg = 0 else '0';
	
	normalized <= '1' when (ac_reg(11) /= ac_reg(10)) OR 
	                       ((ac_reg(11) = (ac_reg(10)) AND 
								    ac_reg(9 downto 0) = "0000000000" AND 
									 mq_reg = 0))
					   else '0';

	sum <= (l_reg & ac_reg) + ('0' & read_data);
	product <= (mq_reg * ea_reg) + ("00000000000" & ac_reg);
	difference <= (ac_reg & mq_reg(11)) - ("0" & ea_reg);
	process (clk) begin -- AC
		if rising_edge(clk) then
			if reset = '1' or en_clear_ac = '1' then ac_reg <= (others => '0');
			elsif en_load_ac_add = '1' then  ac_reg <= sum(11 downto 0);
			elsif en_load_ac_and = '1' then ac_reg <= ac_reg AND read_data; 
			elsif en_load_ac_panel = '1' then ac_reg <= swreg;
			elsif en_load_ac_or_swreg = '1' then ac_reg <= ac_reg OR swreg;
			elsif en_load_ac_or_io = '1' then ac_reg(7 downto 0) <= ac_reg(7 downto 0) OR datain;
			elsif en_load_ac_mq = '1' then ac_reg <= mq_reg;
			elsif en_load_ac_or_mq = '1' then ac_reg <= mq_reg OR ac_reg;
			elsif en_load_opr1 = '1' then ac_reg <= ac4;
			elsif en_do_multiply = '1' then ac_reg <= product(23 downto 12);
			elsif en_shift_left = '1' OR en_left_shift_with_l = '1' then ac_reg <= ac_reg(10 downto 0) & mq_reg(11);
			elsif en_do_divide = '1' then ac_reg <= difference(11 downto 0);
			elsif en_load_ac_sc = '1' then ac_reg(4 downto 0) <= ac_reg(4 downto 0) OR sc_reg;
			elsif en_right_shift = '1' then ac_reg <= l_reg & ac_reg(11 downto 1);
			end if;
		end if;
	end process;
	process (clk) begin -- Link
		if rising_edge(clk) then
			if reset = '1' OR en_do_multiply = '1' OR en_clear_l = '1' then l_reg <= '0';
			elsif en_load_ac_add = '1' then l_reg <= sum(12);
			elsif en_load_opr1 = '1' then l_reg <= l4;
			elsif en_shift_left = '1' then l_reg <= l_reg or ac_reg(11);
			elsif en_left_shift_with_l = '1' OR en_load_l_ac11='1' then l_reg <= ac_reg(11);
			elsif en_do_divide = '1' then l_reg <= l_reg or difference(12);
			end if;
		end if;
	end process;
	process (clk) begin -- PC
		if rising_edge(clk) then
			if reset = '1' then pc_reg <= (others => '0');
			elsif en_inc_pc = '1' then pc_reg <= pc_reg + 1;
			elsif en_load_pc_panel = '1' then pc_reg <= swreg;
			elsif en_load_pc_ea = '1' then pc_reg <= ea_reg;
			end if;
		end if;
	end process;
	process (clk) begin -- MQ
		if rising_edge(clk) then
			if reset = '1' then 
				mq_reg <= (others => '0');
			elsif en_load_mq_ac = '1' then
				mq_reg <= ac_reg;
			elsif en_do_multiply = '1' then
				mq_reg <= product(11 downto 0);
			elsif en_shift_left = '1' OR en_left_shift_with_l = '1' then
				mq_reg <= mq_reg(10 downto 0) & "0";
			elsif en_right_shift = '1' then 
				mq_reg <= ac_reg(0) & mq_reg(11 downto 1);
			elsif en_do_divide = '1' then
				mq_reg <= mq_reg(10 downto 0) & "1";
			end if;
		end if;
	end process;
	process (clk) begin -- Instruction register
		if rising_edge(clk) then
			if en_load_i = '1' then 
				i_reg <= read_data;
			end if;
		end if;
	end process;
	process (clk) begin -- EA register
		if rising_edge(clk) then
			if en_load_ea = '1' then
				if i_reg(7) = '1' then
					ea_reg <= pc_reg(11 downto 7) & i_reg(6 downto 0);
				else
					ea_reg <= "00000" & i_reg(6 downto 0);
				end if;
			elsif en_load_ea_mem = '1' then
				ea_reg <= read_data;
			elsif en_load_ea_memp1 = '1' then
				ea_reg <= read_data + 1;
			end if;
		end if;
	end process;
			

end Behavioral;

