library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;

entity pcu is
	port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_reset: in std_logic;
		I_op: in pcuops_t;
		I_data: in std_logic_vector(XLEN-1 downto 0);
		O_data: out std_logic_vector(XLEN-1 downto 0);
		O_trapret: out std_logic_vector(XLEN-1 downto 0)
	);
end pcu;


architecture Behavioral of pcu is
	signal pc,ret_trap,ret_interrupt: std_logic_vector(XLEN-1 downto 1) := RESET_VECTOR(XLEN-1 downto 1);

begin
	process(I_clk, I_en, I_reset, I_op, I_data)
		variable newpc: std_logic_vector(XLEN-1 downto 0) := XLEN_ZERO;
	begin
		if rising_edge(I_clk) and I_en = '1' then
	
			case I_op is
				-- load and output program counter value
				when PCU_SETPC =>
					pc <= I_data(XLEN-1 downto 1);
					
				-- output trap vector and save return address
				-- NOTE: a return address needs to be computed beforehand
				-- for that, the ALU will compute (PC + INSTR_LEN)
				when PCU_ENTERTRAP =>
					ret_trap <= I_data(XLEN-1 downto 1);
					pc <= TRAP_VECTOR(XLEN-1 downto 1);
					
				-- set program counter to trap return address
				when PCU_RETTRAP =>
					pc <= ret_trap;
						
				-- output interrupt vector and save return address
				-- Note: the return address is the original pc value, unlike traps
				when PCU_ENTERINT =>
					ret_interrupt <= pc;
					pc <= INTERRUPT_VECTOR(XLEN-1 downto 1);
					
				-- set program counter to interrupt return address
				when PCU_RETINT =>
					pc <= ret_interrupt;
			end case;
			
			if I_reset = '1' then
				pc <= RESET_VECTOR(XLEN-1 downto 1);
				ret_trap <= RESET_VECTOR(XLEN-1 downto 1);
				ret_interrupt <= RESET_VECTOR(XLEN-1 downto 1);
			end if;
			
		end if;
	end process;
	
	-- process to drive O_data
	process(pc)
	begin
		O_data <= pc & '0';
	end process;
	
	-- process to drive O_trapret
	process(ret_trap)
	begin
		O_trapret <= ret_trap & '0';
	end process;
	
end Behavioral;