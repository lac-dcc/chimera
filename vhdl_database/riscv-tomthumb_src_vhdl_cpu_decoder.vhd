library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;

entity decoder is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_instr: in std_logic_vector(31 downto 0);
		O_rs1: out std_logic_vector(4 downto 0);
		O_rs2: out std_logic_vector(4 downto 0);
		O_rd: out std_logic_vector(4 downto 0);
		O_imm: out std_logic_vector(31 downto 0) := XLEN_ZERO;
		O_opcode: out std_logic_vector(4 downto 0);
		O_funct3: out std_logic_vector(2 downto 0);
		O_funct7: out std_logic_vector(6 downto 0)
	);
end decoder;

architecture Behavioral of decoder is
	signal instr: std_logic_vector(XLEN-1 downto 0) := XLEN_ZERO;
begin

	-- save incoming instruction into the instruction register
	process(I_clk)
	begin
		if rising_edge(I_clk) and I_en = '1' then
			instr <= I_instr;
		end if;
	end process;

	-- decode contents of instruction register
	process(instr)
		alias opcode: std_logic_vector(4 downto 0) is instr(6 downto 2);
		alias funct3: std_logic_vector(2 downto 0) is instr(14 downto 12);
		alias funct7: std_logic_vector(6 downto 0) is instr(31 downto 25);
	begin

		O_rs1 <= instr(19 downto 15);
		O_rs2 <= instr(24 downto 20);
		O_rd <= instr(11 downto 7);
			
		O_opcode <= opcode;
		O_funct3 <= funct3;
		O_funct7 <= funct7;

		-- extract immediate value
		case opcode is
			when OP_STORE =>
				-- S-type
				O_imm <= std_logic_vector(resize(signed(instr(31 downto 25) & instr(11 downto 8) & instr(7)), O_imm'length));
			
			when OP_BRANCH =>
				-- SB-type
				O_imm <= std_logic_vector(resize(signed(instr(31) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0'), O_imm'length));
			
			when OP_LUI | OP_AUIPC =>
				-- U-type
				O_imm <= std_logic_vector(instr(31 downto 12) & X"000");
					
			when OP_JAL =>
				-- UJ-type
				O_imm <= std_logic_vector(resize(signed(instr(31) & instr(19 downto 12) & instr(20) & instr(30 downto 25) & instr(24 downto 21) & '0'), O_imm'length));

			when others =>
				-- I-type and R-type
				-- immediate carries no actual meaning for R-type instructions
				O_imm <= std_logic_vector(resize(signed(instr(31 downto 20)), O_imm'length));
		end case;

	end process;

end Behavioral;