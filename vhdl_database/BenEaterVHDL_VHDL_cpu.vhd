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

ENTITY cpu IS
	PORT(
		clk_i		: IN	STD_LOGIC;
		clk_en_i	: IN	STD_LOGIC;
		rst_i		: IN	STD_LOGIC;
		ram_data_i	: IN	STD_LOGIC_VECTOR(7 downto 0);
		ram_data_o	: OUT	STD_LOGIC_VECTOR(7 downto 0);
		ram_addr_o	: OUT	STD_LOGIC_VECTOR(3 downto 0);
		ram_write_o : OUT	STD_LOGIC;
		hlt_o		: OUT	STD_LOGIC;
		out_val_o	: OUT	STD_LOGIC_VECTOR(7 downto 0);
		debug_sel_i : IN	STD_LOGIC_VECTOR(3 downto 0);
		debug_out_o : OUT	STD_LOGIC_VECTOR(7 downto 0)
	);
END cpu;

ARCHITECTURE RTL OF cpu IS

	-- format a std_logic_vector as binary string (for simulation)
	function to_bin(uslv : UNSIGNED) return STRING is
		variable Value				: UNSIGNED(uslv'length-1 downto 0);
		variable Digit				: UNSIGNED(0 downto 0);
		variable j					: NATURAL;
		variable Result				: STRING(1 to integer(uslv'length));
		constant BIN				: STRING := "01";
	begin
		Value := (others => '0');
		Value(uslv'length-1 downto 0) := uslv;
		j := 0;
		for i in Result'reverse_range loop
			Digit		:= Value(j downto j);
			Result(i)	:= BIN(to_integer(Digit)+1);
			j			:= j + 1;
		end loop;
		return Result;
	end function;

	-- format a std_logic as binary (for simulation)
	function to_bin(sl : STD_LOGIC) return STRING is
		variable Result				: STRING(1 to 1);
	begin
		if (sl = '1') then
			Result := "1";
		else
			Result := "0";
		end if ;
		return Result;
	end function;

	SIGNAL	rst		: STD_LOGIC := '0';							-- asynchronous reset
	SIGNAL	clk		: STD_LOGIC := '0';							-- CPU clock
	SIGNAL	clk_en	: STD_LOGIC := '0';							-- CPU clock enable (clock ignored if 0)

	type t_cyc_t is (T0, T1, T2, T3, T4, T5);					-- ucode step type
	SIGNAL	t_cyc:	t_cyc_t := T0;								-- current ucode step

	SIGNAL	id		: STD_LOGIC := '0';							-- instruction done, reset t_cyc
	SIGNAL	h		: STD_LOGIC := '0';							-- halt clock (for HLT opcode)

	SIGNAL	pc		: UNSIGNED(3 downto 0) := (others => '0');	-- program counter value
	SIGNAL	j		: STD_LOGIC := '0';							-- unconditional jump (load PC from bus)
	SIGNAL	jc		: STD_LOGIC := '0';							-- conditional jump (load PC from bus) if carry set
	SIGNAL	jz		: STD_LOGIC := '0';							-- conditional jump (load PC from bus) if zero set
	SIGNAL	ci		: STD_LOGIC := '0';							-- load PC from bus (for j or jc)
	SIGNAL	co		: STD_LOGIC := '0';							-- output PC on bus
	SIGNAL	ce		: STD_LOGIC := '0';							-- program counter increment

	SIGNAL	mar		: UNSIGNED(3 downto 0) := (others => '0');	-- RAM address register value
	SIGNAL	mi		: STD_LOGIC := '0';							-- load MAR from bus

	SIGNAL	ri		: STD_LOGIC := '0';							-- RAM input (write bus to RAM)
	SIGNAL	ro		: STD_LOGIC := '0';							-- RAM output to bus

	SIGNAL	ir		: UNSIGNED(7 downto 0) := (others => '0');	-- instruction register value
	SIGNAL	ii		: STD_LOGIC := '0';							-- load IR from bus
	SIGNAL	io		: STD_LOGIC := '0';							-- output IR on bus (4-LSB)

	SIGNAL	a		: UNSIGNED(7 downto 0) := (others => '0');	-- A register value
	SIGNAL	ai		: STD_LOGIC := '0';							-- load A from bus
	SIGNAL	ao		: STD_LOGIC := '0';							-- output A on bus

	SIGNAL	e		: UNSIGNED(7 downto 0) := (others => '0');	-- ALU result value (aka "E" for sum symbol)
	SIGNAL	ec		: STD_LOGIC := '0';							-- carry bit of ALU result
	SIGNAL	ez		: STD_LOGIC := '0';							-- zero flag bit of ALU result
	SIGNAL	eo		: STD_LOGIC := '0';							-- output ALU result on bus
	SIGNAL	cy		: STD_LOGIC := '0';							-- carry flag register (set from ec when eo asserted)
	SIGNAL	zr		: STD_LOGIC := '0';							-- zero flag register (set from ez when eo asserted)
	SIGNAL	su		: STD_LOGIC := '0';							-- 1 for ALU subraction (else addition)

	SIGNAL	b		: UNSIGNED(7 downto 0) := (others => '0');	-- B register value
	SIGNAL	bi		: STD_LOGIC := '0';							-- load B from bus
	SIGNAL	bo		: STD_LOGIC := '0';							-- output B on bus

	SIGNAL	o		: UNSIGNED(7 downto 0) := (others => '0');	-- OUT command value
	SIGNAL	oi		: STD_LOGIC := '0';							-- load OUT from bus

	SIGNAL	cpu_bus : UNSIGNED(7 downto 0) := (others => '0');	-- 8-bit CPU internal bus

BEGIN
	-- Ben Eater SAP inspired CPU instruction set:
	--
	-- 0000 xxxx	NOP				no-operation
	-- 0001 mmmm	LDA M			A = RAM[M]
	-- 0010 mmmm	ADD M			A = A+RAM[M]
	-- 0011 mmmm	SUB M			A = A-RAM[M]
	-- 0100 mmmm	STA M			RAM[M] = A
	-- 0101 iiii	LDI N			A = N (4-LSB)
	-- 0110 mmmm	JMP M			PC = M
	-- 0111 mmmm	JC  M			if (carry) then PC = M
	-- 1000 mmmm	JZ  M			if (zero) then PC = M
	-- 1001 xxxx	??? (unused, acts like NOP)
	-- 1010 xxxx	??? (unused, acts like NOP)
	-- 1011 xxxx	??? (unused, acts like NOP)
	-- 1100 xxxx	??? (unused, acts like NOP)
	-- 1101 xxxx	??? (unused, acts like NOP)
	-- 1110 xxxx	OUT				output A register
	-- 1111 xxxx	HLT				halt CPU clock (forces clock enable low)

	-- internal signals
	rst			<= rst_i;
	clk			<= clk_i;
	clk_en		<= clk_en_i AND (NOT h);	-- force clk_en off if halted

	-- external signals
	hlt_o		<=	h;
	out_val_o	<= STD_LOGIC_VECTOR(o);

	-- RAM signals
	ram_addr_o	<= STD_LOGIC_VECTOR(mar);		-- present MAR to RAM
	ram_data_o	<= STD_LOGIC_VECTOR(cpu_bus);	-- present CPU bus to RAM (in case of write)
	ram_write_o <= ri AND clk_en;				-- set RAM write signal when RI set and clock enabled)

	registers: PROCESS(rst, clk)
	BEGIN
		if (rst = '1') then
			pc	<= (others => '0');
			mar	<= (others => '0');
			ir	<= (others => '0');
			a	<= (others => '0');
			b	<= (others => '0');
			o	<= (others => '0');
			cy	<= '0';
			zr	<= '0';
		elsif (rising_edge(clk)) then
			if (clk_en = '1') then
				if (ce = '1') then
					pc <= pc + 1;
				end if;
				if (j = '1' OR (jc = '1' AND cy = '1') OR (jz = '1' AND zr = '1')) then
					pc <= cpu_bus(3 downto 0);
				end if;
				if (mi = '1') then
					mar <= cpu_bus(3 downto 0);
				end if;
				if (ii = '1') then
					ir <= cpu_bus;
				end if;
				if (ai = '1') then
					a <= cpu_bus;
				end if;
				if (bi = '1') then
					b <= cpu_bus;
				end if;
				if (oi = '1') then
					o <= cpu_bus;
					report LF & ">>> OUTPUT: " & to_bin(cpu_bus) & " (" & integer'image(to_integer(cpu_bus)) & ")";
				end if;
				if (eo = '1') then	-- save flags when sum output requested
					cy <= ec;
					zr <= ez;
				end if;
			end if;
		end if;
	END PROCESS;

	alu: PROCESS(a, b, su)
		variable	val : UNSIGNED(8 downto 0) := (others => '0');	-- includes carry
	BEGIN
		if (su = '1') then
			val := ('0' & a) - ('0' & b);
		else
			val := ('0' & a) + ('0' & b);
		end if;
		e			<= val(7 downto 0);
		ec			<= val(8);
		if (val(7 downto 0) = 0) then
			ez <= '1';
		else
			ez <= '0';
		end if;
	END PROCESS;

	-- bus output (based on control signals)
	bus_out: PROCESS(pc, co, ram_data_i, ro, ir, io, a, ao, e, eo, b, bo)
	BEGIN
		cpu_bus <= (others => '0');
		if (co = '1') then
			cpu_bus(3 downto 0) <= pc;
		end if;
		if (ro = '1') then
			cpu_bus <= unsigned(ram_data_i);
		end if;
		if (io = '1') then
			cpu_bus(3 downto 0) <= ir(3 downto 0);
		end if;
		if (ao = '1') then
			cpu_bus <= a;
		end if;
		if (eo = '1') then
			cpu_bus <= e(7 downto 0);
		end if;
		if (bo = '1') then
			cpu_bus <= b;
		end if;
	END PROCESS bus_out;

	-- ucode t_cyc counter (resets with id signal "instruction done")
	ucode_cyc: PROCESS(rst, clk, clk_en)
	BEGIN
		if (rst = '1') then
			t_cyc <= T0;
		elsif (rising_edge(clk)) then
			if (clk_en = '1') then
				case t_cyc is
					when T0 => t_cyc <= T1;
					when T1 => t_cyc <= T2;
					when T2 => t_cyc <= T3;
					when T3 => t_cyc <= T4;
					when T4 => t_cyc <= T5;
					when T5 => t_cyc <= T0;
					when others => t_cyc <= T0;
				end case;
				if (id = '1') then
					t_cyc <= T0;
				end if;
			end if;
		end if;
	END PROCESS ucode_cyc;

	-- CPU control logic (executes on clock falling edge)
	control: PROCESS(rst, clk, clk_en)
	BEGIN
		if (rst = '1') then
			ii <= '0'; io <= '0';
			ce <= '0'; co <= '0';
			mi <= '0'; id <= '0';
			ri <= '0'; ro <= '0';
			ai <= '0'; ao <= '0';
			bi <= '0'; bo <= '0';
			oi <= '0'; h  <= '0';
			su <= '0'; eo <= '0';
			j  <= '0'; jc <= '0'; jz <= '0';

		elsif (falling_edge(clk)) then
			if (clk_en = '1') then
				ii <= '0'; io <= '0';
				ce <= '0'; co <= '0';
				mi <= '0'; id <= '0';
				ri <= '0'; ro <= '0';
				ai <= '0'; ao <= '0';
				bi <= '0'; bo <= '0';
				oi <= '0'; h  <= '0';
				su <= '0'; eo <= '0';
				j  <= '0'; jc <= '0'; jz <= '0';

				-- "micro-code" to execute opcode in IR register (4-MSB)
				case ir(7 downto 4) is
					when "0000" =>		-- 0000 xxxx	NOP				no-operation
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "0001" =>		-- 0001 mmmm	LDA M			A = RAM[M]
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; mi <= '1';				-- move IR (4-LSB) to M
							when T3 =>	ro <= '1'; ai <= '1'; id <= '1';	-- move RAM[M] to A, instruction done
							when others => null;
						end case;
					when "0010" =>		-- 0010 mmmm	ADD M			A = A+RAM[M]
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; mi <= '1';				-- move IR (4-LSB) to M
							when T3 =>	ro <= '1'; bi <= '1';				-- move RAM[M] to B
							when T4 =>	eo <= '1'; ai <= '1'; su <= '0'; id <= '1'; -- move E to A, adding, instruction done
							when others => null;
						end case;
					when "0011" =>		-- 0011 mmmm	SUB M			A = A-RAM[M]
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; mi <= '1';				-- move IR (4-LSB) to M
							when T3 =>	ro <= '1'; bi <= '1';				-- move RAM[M] to B,
							when T4 =>	eo <= '1'; ai <= '1'; su <= '1'; id <= '1'; -- move E to A, subtracting, instruction done
							when others => null;
						end case;
					when "0100" =>		-- 0100 mmmm	STA M			RAM[M] = A
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; mi <= '1';				-- move IR (4-LSB) to M
							when T3 =>	ao <= '1'; ri <= '1'; id <= '1';	-- move A to RAM[M], instruction done
							when others => null;
						end case;
					when "0101" =>		-- 0101 nnnn	LDI #N			A = N (4-LSB)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; ai <= '1'; id <= '1';	-- move IR (4-LSB) to A, instruction done
							when others => null;
						end case;
					when "0110" =>		-- 0110 mmmm	JMP M			PC = M
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move PC to M
							when T2 =>	io <= '1'; j  <= '1'; id <= '1';	-- move IR (4-LSB) to PC, instruction done
							when others => null;
						end case;
					when "0111" =>		-- 0111 mmmm	JC  M			if (carry) then PC = M
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; jc <= '1'; id <= '1';	-- move IR (4-LSB) to PC if carry set, instruction done
							when others => null;
						end case;
					when "1000" =>		-- 0111 mmmm	JZ  M			if (zero) then PC = M
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	io <= '1'; jz <= '1'; id <= '1';	-- move IR (4-LSB) to PC if zero set, instruction done
							when others => null;
						end case;
					when "1001" =>		-- 1001 xxxx	---				no-op (not defined)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "1010" =>		-- 1010 xxxx	---				no-op (not defined)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "1011" =>		-- 1011 xxxx	---				no-op (not defined)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "1100" =>		-- 1100 xxxx	---				no-op (not defined)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "1101" =>		-- 1101 xxxx	---				no-op (not defined)
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	id <= '1';							-- instruction done
							when others => null;
						end case;
					when "1110" =>		-- 1110 xxxx	OUT				output A register
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	ao <= '1'; oi <= '1'; id <= '1';	-- move A to O, instruction done
							when others => null;
						end case;
					when "1111" =>		-- 1111 xxxx	HLT				halt CPU clock
						case t_cyc is
							when T0 =>	co <= '1'; mi <= '1';				-- move PC to M
							when T1 =>	ro <= '1'; ii <= '1'; ce <= '1';	-- move RAM[M] to IR, increment PC
							when T2 =>	h  <= '1';							-- halt
							when T3 =>	id <= '1';							-- insruction done
							when others => null;
						end case;
					when others =>	null;
				end case;
			end if;
		end if;
	END PROCESS control;

	-- This is a simple "debug port" that saves having to run a large number of signals out of this module
	-- but still provides a way to "peer inside" at the CPU state.
	-- Here are how the debug registers are mapped:
	--
	--								debug_out_o
	-- debug_sel_i 0000		id h  su cy	zr	t  t  t
	-- debug_sel_i 0001		0  ce co ro io ao bo eo
	-- debug_sel_i 0010		jc j  mi ri ii ai bi oi
	-- debug_sel_i 0011		cpu_bus
	-- debug_sel_i 0100		0  0  0	 0	mar
	-- debug_sel_i 0101		0  0  0	 0	pc
	-- debug_sel_i 0110		i
	-- debug_sel_i 0111		a
	-- debug_sel_i 1000		b
	-- debug_sel_i 1001		o

	debug: PROCESS(clk, cpu_bus, debug_sel_i, t_cyc, h, id, pc, jc, ci, co, ce, mar, mi, ri, ro, ir, ii, io, a, ai, ao, eo, cy, zr, su, b, bi, bo, o, oi)
		constant 	op_codes: STRING := "NOPLDAADDSUBSTALDIJMPJC JZ 9??A??B??C??D??OUTHLT";
		VARIABLE	op:	STRING(1 to 3);
		VARIABLE	cycles: NATURAL := 0;
		VARIABLE	bus_save: UNSIGNED(7 downto 0);
		VARIABLE	bus_in: STRING(1 to 6*2);
		VARIABLE	bus_out: STRING(1 to 6*2);
		VARIABLE	ctrl: STRING(1 to 7*3);
		VARIABLE	halted: BOOLEAN := false;
	BEGIN
		-- need to capture bus on clock edge to get desired value (as CPU does)
		if (rising_edge(clk)) then
			if (clk_en_i = '1' AND halted = false) then	-- note: use clk_en_i so we capture bus even when CPU halted (to get HLT tracing correctly)
				bus_save	:= cpu_bus;
				cycles := cycles + 1;

				if (t_cyc = T0 OR t_cyc = T1) then
					op := "---";
				else
					op(1) := op_codes((to_integer(ir(7 downto 4))*3)+1);
					op(2) := op_codes((to_integer(ir(7 downto 4))*3)+2);
					op(3) := op_codes((to_integer(ir(7 downto 4))*3)+3);
				end if;

				bus_in := (others => ' ');
				if (co = '1') then bus_in(1 to 2)   := "cO"; end if;
				if (ro = '1') then bus_in(3 to 4)   := "rO"; end if;
				if (io = '1') then bus_in(5 to 6)   := "iO"; end if;
				if (ao = '1') then bus_in(7 to 8)   := "aO"; end if;
				if (bo = '1') then bus_in(9 to 10)  := "bO"; end if;
				if (eo = '1') then bus_in(11 to 12) := "eO"; end if;
				bus_out := (others => ' ');
				if (mi = '1') then bus_out(1 to 2)   := "mI"; end if;
				if (ii = '1') then bus_out(3 to 4)   := "iI"; end if;
				if (ai = '1') then bus_out(5 to 6)   := "aI"; end if;
				if (bi = '1') then bus_out(7 to 8)   := "bI"; end if;
				if (ri = '1') then bus_out(9 to 10)  := "rI"; end if;
				if (oi = '1') then bus_out(11 to 12) := "oI"; end if;
				ctrl := (others => ' ');
				if (ce = '1') then ctrl(1 to 3)   := "ce "; end if;
				if (su = '1') then ctrl(4 to 6)   := "su "; end if;
				if (j  = '1') then ctrl(7 to 9)   := "j  "; end if;
				if (jc = '1') then ctrl(10 to 12) := "jc "; end if;
				if (jz = '1') then ctrl(13 to 15) := "jz "; end if;
				if (id = '1') then ctrl(16 to 18) := "id "; end if;
				if (h  = '1') then ctrl(19 to 21) := "hlt"; end if;

				report LF & "T" & integer'image(t_cyc_t'pos(t_cyc)) &
				": pc=" & to_bin(pc) & " mar=" & to_bin(mar) & " ir=" & to_bin(ir) & " " & op & " a=" & to_bin(a) & " b=" & to_bin(b) & " o=" & to_bin(o) & " cy=" & to_bin(cy) & " zr=" & to_bin(zr) &
				LF & "    " & bus_in & " => " & to_bin(cpu_bus) & " => " & bus_out & "  | " & ctrl;
				if (h = '1') then
					halted := true;
					report LF & "*** CPU HAS HALTED, " & natural'image(cycles) & " CYCLES ***" severity error;
				end if;
			end if;
		end if;

		-- the debug port is combinatorial
		case debug_sel_i is
			when "0000" =>
				debug_out_o(7 downto 3) <= id & h & su & cy & zr;
				case t_cyc is	-- convert t_cyc to binary
					when T0 =>	debug_out_o(2 downto 0) <= "000";
					when T1 =>	debug_out_o(2 downto 0) <= "001";
					when T2 =>	debug_out_o(2 downto 0) <= "010";
					when T3 =>	debug_out_o(2 downto 0) <= "011";
					when T4 =>	debug_out_o(2 downto 0) <= "100";
					when T5 =>	debug_out_o(2 downto 0) <= "101";
					when others => debug_out_o(2 downto 0)	<= "111";
				end case;
			when "0001" =>	debug_out_o <= "0" & ce & co & ro & io & ao & bo & eo;
			when "0010" =>	debug_out_o <= STD_LOGIC_VECTOR(bus_save); -- saved cpu_bus value
			when "0011" =>	debug_out_o <= jc & ci & mi & ri & ii & ai & bi & oi;
			when "0100" =>	debug_out_o <= "0000" & STD_LOGIC_VECTOR(mar);
			when "0101" =>	debug_out_o <= "0000" & STD_LOGIC_VECTOR(pc);
			when "0110" =>	debug_out_o <= STD_LOGIC_VECTOR(ir);
			when "0111" =>	debug_out_o <= STD_LOGIC_VECTOR(a);
			when "1000" =>	debug_out_o <= STD_LOGIC_VECTOR(b);
			when "1001" =>	debug_out_o <= STD_LOGIC_VECTOR(o);
			when others =>	debug_out_o <= (others => '-');
		end case;
	END PROCESS debug;

END ARCHITECTURE RTL;