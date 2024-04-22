library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;

entity alu is
	port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_dataS1: in std_logic_vector(XLEN-1 downto 0);
		I_dataS2: in std_logic_vector(XLEN-1 downto 0);
		I_reset: in std_logic := '0';
		I_aluop: in aluops_t;
		O_busy: out std_logic := '0';
		O_data: out std_logic_vector(XLEN-1 downto 0);
		O_lt: out boolean := false;
		O_ltu: out boolean := false;
		O_eq: out boolean := false
	);
end alu;

architecture Behavioral of alu is
	alias op1 is I_dataS1(XLEN-1 downto 0);
	alias op2 is I_dataS2(XLEN-1 downto 0);
	signal result: std_logic_vector(XLEN-1 downto 0) := XLEN_ZERO;
	signal sum,myxor,myand,myor: std_logic_vector(XLEN-1 downto 0);
	signal sub: std_logic_vector(XLEN downto 0); -- one additional bit to detect underflow
	signal lt,ltu,eq: boolean;
	signal busy: std_logic := '0';
begin

	-- combinatorial logic for basic operations
	process(op1, op2)
	begin
		sum <= std_logic_vector(unsigned(op1) + unsigned(op2));
		sub <= std_logic_vector(unsigned('0' & op1) - unsigned('0' & op2));
		
		myxor <= op1 xor op2;
		myor <= op1 or op2;
		myand <= op1 and op2;
	end process;
	
	-- determine flag values
	process(sub, myxor)
	begin
		-- unsigned comparision: simply look at underflow bit
		ltu <= sub(XLEN) = '1';
		-- signed comparison: xor underflow bit with xored sign bits
		lt <= (sub(XLEN) xor myxor(XLEN-1)) = '1';
		eq <= sub = ('0' & XLEN_ZERO);
	end process;


	process(I_clk, I_en, I_dataS1, I_dataS2, I_reset, I_aluop, sum, sub, ltu, myxor, myor, myand, lt, eq)
		variable shiftcnt: std_logic_vector(4 downto 0);
	begin
	
		if rising_edge(I_clk) then

			-- check for reset
			if(I_reset = '1') then
				busy <= '0';
			elsif I_en = '1' then
			
				-------------------------------
				-- ALU core operations
				-------------------------------
				
				case I_aluop is
		
					when ALU_ADD =>
						result <= sum;
				
					when ALU_SUB =>
						result <= sub(XLEN-1 downto 0);
					
					when ALU_AND =>
						result <= myand;
				
					when ALU_OR =>
						result <= myor;
					
					when ALU_XOR =>
						result <= myxor;
				
					when ALU_SLT =>
						result <= XLEN_ZERO;
						if lt then
							result(0) <= '1';
						end if;
				
					when ALU_SLTU =>
						result <= XLEN_ZERO;
						if ltu then
							result(0) <= '1';
						end if;
				
					when ALU_SLL | ALU_SRL | ALU_SRA =>
						if busy = '0' then
							busy <= '1';
							result <= op1;
							shiftcnt := op2(4 downto 0);
						elsif shiftcnt /= "00000" then
							case I_aluop is
								when ALU_SLL => result <= result(30 downto 0) & '0';
								when ALU_SRL => result <= '0' & result(31 downto 1);
								when others => result <= result(31) & result(31 downto 1);
							end case;
							shiftcnt := std_logic_vector(unsigned(shiftcnt) - 1);
						else
							busy <= '0';
						end if;
		
				end case;
				
				O_lt <= lt;
				O_ltu <= ltu;
				O_eq <= eq;
		
		
			end if;
		end if;
	end process;
	
	
	process(result, busy)
	begin
		O_data <= result;
		O_busy <= busy;
	end process;
	

end Behavioral;