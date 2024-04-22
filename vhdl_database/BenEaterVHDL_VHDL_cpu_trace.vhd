--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY cpu_trace IS
	PORT(
		clk_i		: IN	STD_LOGIC;
		clk_en_i	: IN	STD_LOGIC;
		rst_i		: IN	STD_LOGIC;
		halt_i		: IN	STD_LOGIC;
		busy_o		: OUT	STD_LOGIC;
		tx_busy_i	: IN	STD_LOGIC;
		tx_write_o	: OUT	STD_LOGIC;
		tx_data_o	: OUT	STD_LOGIC_VECTOR(7 downto 0);
		debug_sel_o : OUT	STD_LOGIC_VECTOR(3 downto 0);
		debug_val_i : IN	STD_LOGIC_VECTOR(7 downto 0)
	);
END cpu_trace;

ARCHITECTURE RTL OF cpu_trace IS
	-- helper functions
	FUNCTION ASCII(c : CHARACTER) return STD_LOGIC_VECTOR is
	BEGIN
	  return STD_LOGIC_VECTOR(TO_UNSIGNED(CHARACTER'POS(c), 8));
	END FUNCTION;
	function CT_PRINT_IF_SET(n: INTEGER RANGE 0 to 7) return STD_LOGIC_VECTOR is
	begin
		return "10000" & STD_LOGIC_VECTOR(TO_UNSIGNED(n, 3));
	end FUNCTION;
	constant CT_PRINT: STD_LOGIC_VECTOR(7 downto 0) := "10001000";
	constant CT_PRINT_TCYC: STD_LOGIC_VECTOR(7 downto 0) := "10010000";
	function CT_PRINT_BIT(n: INTEGER RANGE 0 to 7) return STD_LOGIC_VECTOR is
	begin
		return "10100" & STD_LOGIC_VECTOR(TO_UNSIGNED(n, 3));
	end FUNCTION;
	function CT_PRINT_IF_OP(n: INTEGER RANGE 0 to 15) return STD_LOGIC_VECTOR is
	begin
		return "1011" & STD_LOGIC_VECTOR(TO_UNSIGNED(n, 4));
	end FUNCTION;
	function CT_SEL_REG(n: INTEGER RANGE 0 to 15) return STD_LOGIC_VECTOR is
	begin
		return "1100" & STD_LOGIC_VECTOR(TO_UNSIGNED(n, 4));
	end FUNCTION;
	constant CT_DONE: STD_LOGIC_VECTOR(7 downto 0) := "11110000";

	-- "ROM" for cpu trace commands
	constant addrwidth : INTEGER := 10;
	constant romtop : INTEGER := (2**addrwidth)-1;

	type rom_type is array(0 to romtop) of STD_LOGIC_VECTOR(7 downto 0);
	signal rom_data : STD_LOGIC_VECTOR(7 downto 0);
	signal addr_r	: UNSIGNED(addrwidth-1 downto 0);

-- This mess below is for printing a "trace" something like this:
--
-- T4: EO => 00000000 => AI | ID
--	   C=0100 M=1101 I=00101101 (ADD) A=00000000 B=00000001 CY=1 O=00000000
--
--

	constant C_RESET_SKIP: INTEGER := 56;

	signal ROM : rom_type :=
	(
		ASCII(NUL), ASCII(NUL),
		CT_PRINT, CT_PRINT,
		ASCII(CR), CT_PRINT,
		ASCII(LF), CT_PRINT,
		ASCII(CR), CT_PRINT,
		ASCII(LF), CT_PRINT,
		ASCII('B'), CT_PRINT,
		ASCII('E'), CT_PRINT,
		ASCII('-'), CT_PRINT,
		ASCII('S'), CT_PRINT,
		ASCII('A'), CT_PRINT,
		ASCII('P'), CT_PRINT,
		ASCII('-'), CT_PRINT,
		ASCII('V'), CT_PRINT,
		ASCII('H'), CT_PRINT,
		ASCII('D'), CT_PRINT,
		ASCII('L'), CT_PRINT,
		ASCII(':'), CT_PRINT,
		ASCII(' '), CT_PRINT,
		ASCII('*'), CT_PRINT,
		ASCII('R'), CT_PRINT,
		ASCII('E'), CT_PRINT,
		ASCII('S'), CT_PRINT,
		ASCII('E'), CT_PRINT,
		ASCII('T'), CT_PRINT,
		ASCII('*'), CT_PRINT,
		ASCII(CR), CT_PRINT,
		ASCII(LF), CT_PRINT,
-- 56 = C_RESET_SKIP (adjust above)		-- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(0),					-- id h	 su cy 0  t	 t	t
		ASCII('T'), CT_PRINT,
		ASCII('0'), CT_PRINT_TCYC,		-- T-cycle "octal"
		ASCII(':'), CT_PRINT,
		ASCII(' '), CT_PRINT,			-- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(1),					-- e8 ce co ro io ao bo eo
		ASCII('C'), CT_PRINT_IF_SET(5),
		ASCII('O'), CT_PRINT_IF_SET(5),
		ASCII(' '), CT_PRINT_IF_SET(5),
		ASCII('R'), CT_PRINT_IF_SET(4),
		ASCII('O'), CT_PRINT_IF_SET(4),
		ASCII(' '), CT_PRINT_IF_SET(4),
		ASCII('I'), CT_PRINT_IF_SET(3),
		ASCII('O'), CT_PRINT_IF_SET(3),
		ASCII(' '), CT_PRINT_IF_SET(3),
		ASCII('A'), CT_PRINT_IF_SET(2),
		ASCII('O'), CT_PRINT_IF_SET(2),
		ASCII(' '), CT_PRINT_IF_SET(2),
		ASCII('B'), CT_PRINT_IF_SET(1),
		ASCII('O'), CT_PRINT_IF_SET(1),
		ASCII(' '), CT_PRINT_IF_SET(1),
		ASCII('E'), CT_PRINT_IF_SET(0),
		ASCII('O'), CT_PRINT_IF_SET(0),
		ASCII(' '), CT_PRINT_IF_SET(0),
		ASCII('='), CT_PRINT,
		ASCII('>'), CT_PRINT,
		ASCII(' '), CT_PRINT,
		CT_SEL_REG(2),					-- cpu_bus (7 downto 0)
		ASCII('0'),						-- print binary
		CT_PRINT_BIT(7),
		CT_PRINT_BIT(6),
		CT_PRINT_BIT(5),
		CT_PRINT_BIT(4),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(' '), CT_PRINT,
		ASCII('='), CT_PRINT,
		ASCII('>'), CT_PRINT,
		ASCII(' '), CT_PRINT,			-- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(3),					-- jc j	 mi ri ii ai bi oi
		ASCII('M'), CT_PRINT_IF_SET(5),
		ASCII('I'), CT_PRINT_IF_SET(5),
		ASCII(' '), CT_PRINT_IF_SET(5),
		ASCII('I'), CT_PRINT_IF_SET(3),
		ASCII('I'), CT_PRINT_IF_SET(3),
		ASCII(' '), CT_PRINT_IF_SET(3),
		ASCII('A'), CT_PRINT_IF_SET(2),
		ASCII('I'), CT_PRINT_IF_SET(2),
		ASCII(' '), CT_PRINT_IF_SET(2),
		ASCII('B'), CT_PRINT_IF_SET(1),
		ASCII('I'), CT_PRINT_IF_SET(1),
		ASCII(' '), CT_PRINT_IF_SET(1),
		ASCII('R'), CT_PRINT_IF_SET(4),
		ASCII('I'), CT_PRINT_IF_SET(4),
		ASCII(' '), CT_PRINT_IF_SET(4),
		ASCII('O'), CT_PRINT_IF_SET(0),
		ASCII('I'), CT_PRINT_IF_SET(0),
		ASCII(' '), CT_PRINT_IF_SET(0),
		ASCII('J'), CT_PRINT_IF_SET(6),
		ASCII(' '), CT_PRINT_IF_SET(6),
		ASCII(' '), CT_PRINT_IF_SET(6),
		ASCII('|'), CT_PRINT,
		ASCII(' '), CT_PRINT,
		ASCII('J'), CT_PRINT_IF_SET(7),
		ASCII('C'), CT_PRINT_IF_SET(7),
		ASCII(' '), CT_PRINT_IF_SET(7), -- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(1),					-- 0 ce co ro io ao bo eo
		ASCII('C'), CT_PRINT_IF_SET(6),
		ASCII('E'), CT_PRINT_IF_SET(6),
		ASCII(' '), CT_PRINT_IF_SET(6), -- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(0),					-- id h	 su cy 0  t	 t	t
		ASCII('S'), CT_PRINT_IF_SET(5),
		ASCII('U'), CT_PRINT_IF_SET(5),
		ASCII(' '), CT_PRINT_IF_SET(5),
		ASCII('I'), CT_PRINT_IF_SET(7),
		ASCII('D'), CT_PRINT_IF_SET(7),
		ASCII(' '), CT_PRINT_IF_SET(7),
		ASCII('H'), CT_PRINT_IF_SET(6),
		ASCII(CR),	CT_PRINT,
		ASCII(LF),	CT_PRINT,
-- print state							-- 7  6	 5	4  3  2	 1	0
		CT_SEL_REG(0),					-- id h	 su cy 0  t	 t	t
		ASCII(' '), CT_PRINT,
		ASCII(' '), CT_PRINT,
		ASCII(' '), CT_PRINT,
		ASCII(' '), CT_PRINT,
		ASCII('C'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(5),					-- pc (3 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(' '), CT_PRINT,
		ASCII('M'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(4),					-- mar (3 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(' '), CT_PRINT,
		ASCII('I'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(6),					-- ir (7 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(7),
		CT_PRINT_BIT(6),
		CT_PRINT_BIT(5),
		CT_PRINT_BIT(4),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		
		ASCII(' '), CT_PRINT,
		ASCII('('), CT_PRINT,				-- op-code name decode
		-- 1st char
		ASCII('N'), CT_PRINT_IF_OP(0),		-- 0000 NOP
		ASCII('L'), CT_PRINT_IF_OP(1),		-- 0001 LDA
		ASCII('A'), CT_PRINT_IF_OP(2),		-- 0010 ADD
		ASCII('S'), CT_PRINT_IF_OP(3),		-- 0011 SUB
		ASCII('S'), CT_PRINT_IF_OP(4),		-- 0100 STA
		ASCII('L'), CT_PRINT_IF_OP(5),		-- 0101 LDI
		ASCII('J'), CT_PRINT_IF_OP(6),		-- 0110 JMP
		ASCII('J'), CT_PRINT_IF_OP(7),		-- 0111 JC
		ASCII('J'), CT_PRINT_IF_OP(8),		-- 1000 JZ
		ASCII('?'), CT_PRINT_IF_OP(9),		-- 1001 ???
		ASCII('?'), CT_PRINT_IF_OP(10),		-- 1010 ???
		ASCII('?'), CT_PRINT_IF_OP(11),		-- 1011 ???
		ASCII('?'), CT_PRINT_IF_OP(12),		-- 1100 ???
		ASCII('?'), CT_PRINT_IF_OP(13),		-- 1101 ???
		ASCII('O'), CT_PRINT_IF_OP(14),		-- 1110 OUT
		ASCII('H'), CT_PRINT_IF_OP(15),		-- 1111 HLT
		-- 2nd char
		ASCII('O'), CT_PRINT_IF_OP(0),		-- 0000 NOP
		ASCII('D'), CT_PRINT_IF_OP(1),		-- 0001 LDA
		ASCII('D'), CT_PRINT_IF_OP(2),		-- 0010 ADD
		ASCII('U'), CT_PRINT_IF_OP(3),		-- 0011 SUB
		ASCII('T'), CT_PRINT_IF_OP(4),		-- 0100 STA
		ASCII('D'), CT_PRINT_IF_OP(5),		-- 0101 LDI
		ASCII('M'), CT_PRINT_IF_OP(6),		-- 0110 JMP
		ASCII('C'), CT_PRINT_IF_OP(7),		-- 0111 JC
		ASCII('Z'), CT_PRINT_IF_OP(8),		-- 1000 JZ
		ASCII('?'), CT_PRINT_IF_OP(9),		-- 1001 ???
		ASCII('?'), CT_PRINT_IF_OP(10),		-- 1010 ???
		ASCII('?'), CT_PRINT_IF_OP(11),		-- 1011 ???
		ASCII('?'), CT_PRINT_IF_OP(12),		-- 1100 ???
		ASCII('?'), CT_PRINT_IF_OP(13),		-- 1101 ???
		ASCII('U'), CT_PRINT_IF_OP(14),		-- 1110 OUT
		ASCII('L'), CT_PRINT_IF_OP(15),		-- 1111 HLT
		-- 3rd char
		ASCII('P'), CT_PRINT_IF_OP(0),		-- 0000 NOP
		ASCII('A'), CT_PRINT_IF_OP(1),		-- 0001 LDA
		ASCII('D'), CT_PRINT_IF_OP(2),		-- 0010 ADD
		ASCII('B'), CT_PRINT_IF_OP(3),		-- 0011 SUB
		ASCII('A'), CT_PRINT_IF_OP(4),		-- 0100 STA
		ASCII('I'), CT_PRINT_IF_OP(5),		-- 0101 LDI
		ASCII('P'), CT_PRINT_IF_OP(6),		-- 0110 JMP
		ASCII(' '), CT_PRINT_IF_OP(7),		-- 0111 JC
		ASCII(' '), CT_PRINT_IF_OP(8),		-- 1000 JZ
		ASCII('?'), CT_PRINT_IF_OP(9),		-- 1001 ???
		ASCII('?'), CT_PRINT_IF_OP(10),		-- 1010 ???
		ASCII('?'), CT_PRINT_IF_OP(11),		-- 1011 ???
		ASCII('?'), CT_PRINT_IF_OP(12),		-- 1100 ???
		ASCII('?'), CT_PRINT_IF_OP(13),		-- 1101 ???
		ASCII('T'), CT_PRINT_IF_OP(14),		-- 1110 OUT
		ASCII('T'), CT_PRINT_IF_OP(15),		-- 1111 HLT

		ASCII(')'), CT_PRINT,
		
		ASCII(' '), CT_PRINT,
		ASCII('A'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(7),					-- a (7 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(7),
		CT_PRINT_BIT(6),
		CT_PRINT_BIT(5),
		CT_PRINT_BIT(4),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(' '), CT_PRINT,
		ASCII('B'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(8),					-- a (7 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(7),
		CT_PRINT_BIT(6),
		CT_PRINT_BIT(5),
		CT_PRINT_BIT(4),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(' '), CT_PRINT,
		ASCII('C'), CT_PRINT,
		ASCII('Y'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(0),					-- id h	 su cy zr t	 t	t
		ASCII('0'),
		CT_PRINT_BIT(4),
		ASCII(' '), CT_PRINT,
		ASCII('Z'), CT_PRINT,
		ASCII('R'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(0),					-- id h	 su cy zr t	 t	t
		ASCII('0'),
		CT_PRINT_BIT(3),
		ASCII(' '), CT_PRINT,
		ASCII('O'), CT_PRINT,
		ASCII('='), CT_PRINT,
		CT_SEL_REG(9),					-- o (7 downto 0)
		ASCII('0'),
		CT_PRINT_BIT(7),
		CT_PRINT_BIT(6),
		CT_PRINT_BIT(5),
		CT_PRINT_BIT(4),
		CT_PRINT_BIT(3),
		CT_PRINT_BIT(2),
		CT_PRINT_BIT(1),
		CT_PRINT_BIT(0),
		ASCII(CR),	CT_PRINT,
		ASCII(LF),	CT_PRINT,
		CT_SEL_REG(0),					-- id h	 su cy zr t	 t	t
		ASCII('*'), CT_PRINT_IF_SET(6),
		ASCII('H'), CT_PRINT_IF_SET(6),
		ASCII('A'), CT_PRINT_IF_SET(6),
		ASCII('L'), CT_PRINT_IF_SET(6),
		ASCII('T'), CT_PRINT_IF_SET(6),
		ASCII('E'), CT_PRINT_IF_SET(6),
		ASCII('D'), CT_PRINT_IF_SET(6),
		ASCII('*'), CT_PRINT_IF_SET(6),
		ASCII(CR),	CT_PRINT_IF_SET(6),
		ASCII(LF),	CT_PRINT_IF_SET(6),
		others => CT_DONE
	);

	attribute syn_romstyle : string;
	attribute syn_romstyle of ROM : signal is "block_ram";

	SIGNAL	clk			: STD_LOGIC;
	SIGNAL	clk_en		: STD_LOGIC;
	SIGNAL	rst			: STD_LOGIC;
	SIGNAL	last_clk_en : STD_LOGIC;
	SIGNAL	trace_halt	: STD_LOGIC;
	SIGNAL	debug_save	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	debug_reg	: STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	trace_addr	: UNSIGNED(9 downto 0);
	SIGNAL	trace_data	: STD_LOGIC_VECTOR(6 downto 0); -- 7-bit ASCII
	SIGNAL	tx_w		: STD_LOGIC;

BEGIN

	rst		<= rst_i;
	clk		<= clk_i;
	clk_en	<= clk_en_i;
	
	-- CPU trace "processor" commands (read from ROM at trace_addr):
	--
	-- 0bbbbbbb = load 0bbbbbbb into trace_data register (typically an ASCII character)
	-- 1000abbb = print trace_data if bit bbb set in currently selected debug register, if a=1 always print
	-- 1001xxxx = print trace_data(7 downto 5) with bits (2 downto 0) from currently selected debug register ("octal", used for T-cycle)
	-- 1010xbbb = print trace_data(7 downto 1) with bit (0) from currently selected debug register ("binary" used for registers)
	-- 1011bbbb = print trace_data if bbbb equals bits (7 downto 4) from currently selected debug register (used to crudely decode opcode name)
	-- 1100rrrr = select debug register rrrr (0 to 15)
	-- 1101xxxx = unused
	-- 1110xxxx = unused
	-- 1111xxxx = done with trace (wait for next clk_en)
	--
	-- CT processor is idle when trace_addr is 0 and will wait for clk_en edge
	-- on reset it runs commands at trace_addr 1 (for reset message)
	-- normally it will start each cycle trace at trace_addr C_RESET_SKIP
	-- tracing will also halt after CPU halt signal (after current trace completed)
	--
	-- it is assumed the rate of clk_en pulses is slow enough to print ~110 bytes at 9600 baud.

	do_trace: PROCESS(rst, clk, clk_en)
	BEGIN
		if (rst = '1') then
			tx_w		<= '0';
			last_clk_en	<= '0';
			trace_halt	<= '0';
			trace_addr	<= to_unsigned(1, trace_addr'length);
			debug_reg	<= (others => '0');
			debug_save	<= (others => '0');
			trace_data	<= (others => '0');
		elsif (rising_edge(clk)) then
			tx_w		<= '0';
			last_clk_en <= clk_en;
			if (trace_addr = 0 AND clk_en = '1' AND last_clk_en = '0') then
				trace_addr	<= to_unsigned(C_RESET_SKIP, trace_addr'length);	-- skip reset sequence
				debug_save	<= debug_val_i;
			end if;
			if (trace_addr /= 0 AND tx_busy_i = '0') then
				-- set trace data to ASCII if high bit clear
				if (rom_data(7) = '0') then
					trace_data	<= rom_data(6 downto 0);
				else
					-- parse 3 bit command 
					case rom_data(6 downto 4) is
						-- print data or skip (bit 3 = never skip)
						when "000" =>
							tx_w	<= rom_data(3) OR debug_val_i(to_integer(unsigned(rom_data(2 downto 0))));
						-- print t_cyc (replace data 3-LSB)
						when "001" =>
							trace_data(2 downto 0) <= debug_save(2 downto 0);
							tx_w	<= '1';
						-- print binary (replace data low bit)
						when "010" =>
							trace_data(0)	<= debug_val_i(to_integer(unsigned(rom_data(2 downto 0))));
							tx_w	<= '1';
						-- print if reg 4-MSB == 4-LSB of command
						when "011" =>
							if (rom_data(3 downto 0) = debug_val_i(7 downto 4)) then
								tx_w <= '1';
							end if;
						-- select debug register
						when "100" =>
							debug_reg	<= rom_data(3 downto 0);
						-- cycle trace done
						when "101" | "110" | "111" =>
							trace_halt	<= halt_i;			-- halt after trace when CPU halted
							trace_addr	<= (others => '1');
							debug_reg	<= (others => '0');
						when others =>
							null;
					end case;
				end if;
				if (trace_halt = '0') then
					trace_addr	<= trace_addr + 1;
				end if;
			end if;
		end if;
	END PROCESS do_trace;

	busy_o		<= '1' when (trace_addr /= 0) else '0'; 
	debug_sel_o <= debug_reg;
	tx_data_o	<= "0" & trace_data;
	tx_write_o	<= tx_w;

	-- "ROM" process
	trace_rom: PROCESS (clk_i)
	BEGIN
		if falling_edge(clk_i) then
			addr_r <= unsigned(trace_addr);
		end if;
	END PROCESS trace_rom;
	rom_data <= rom(to_integer(addr_r));

END ARCHITECTURE RTL;
