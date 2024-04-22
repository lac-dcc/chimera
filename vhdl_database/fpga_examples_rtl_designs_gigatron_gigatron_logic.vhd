-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2021 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Part of the Gigatron emulator.
-- TTL logic emulation.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity gigatron_logic is
	port (
		clk : in std_logic;
		reset : in std_logic;
		tick : in std_logic;

		rom_req : out std_logic;
		rom_a : out unsigned(15 downto 0);
		rom_q : in unsigned(15 downto 0);

		sram_we : out std_logic;
		sram_a : out unsigned(15 downto 0);
		sram_d : out unsigned(7 downto 0);
		sram_q : in unsigned(7 downto 0);

		inport : in unsigned(7 downto 0);
		outport : out unsigned(7 downto 0);
		xoutport : out unsigned(7 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gigatron_logic is
	signal rom_req_reg : std_logic := '0';

	signal sram_we_reg : std_logic := '0';
	signal sram_a_reg : unsigned(sram_a'range) := (others => '0');
	signal sram_d_reg : unsigned(sram_d'range) := (others => '0');

	signal pc_reg : unsigned(15 downto 0) := (others => '0');
	signal accu_reg : unsigned(7 downto 0) := (others => '0');
	signal ir_reg : unsigned(7 downto 0) := (others => '0');
	signal d_reg : unsigned(7 downto 0) := (others => '0');
	signal x_reg : unsigned(7 downto 0) := (others => '0');
	signal y_reg : unsigned(7 downto 0) := (others => '0');
	signal out_reg : unsigned(7 downto 0) := (others => '0');
	signal xout_reg : unsigned(7 downto 0) := (others => '0');

	signal b_bus_reg : unsigned(7 downto 0) := (others => '0');
	signal alu_reg : unsigned(7 downto 0) := (others => '0');
	signal in_reg : unsigned(7 downto 0) := (others => '1');
	signal flags_reg : unsigned(2 downto 0) := (others => '0');
begin
	rom_req <= rom_req_reg;
	rom_a <= pc_reg;
	sram_we <= sram_we_reg;
	sram_a <= sram_a_reg;
	sram_d <= sram_d_reg;
	outport <= out_reg;
	xoutport <= xout_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			in_reg <= inport;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			sram_we_reg <= '0';
			if tick = '1' then
				rom_req_reg <= not rom_req_reg;
				ir_reg <= rom_q(7 downto 0);
				d_reg <= rom_q(15 downto 8);

				if ir_reg(7 downto 5) = "110" then
					-- RAM write
					sram_we_reg <= '1';
				end if;

				pc_reg <= pc_reg + 1;
				if ir_reg(7 downto 5) = "111" then
					-- Jump instruction
					if ir_reg(4 downto 2) = 0 then
						pc_reg <= y_reg & b_bus_reg;
					elsif (ir_reg(4 downto 2) and flags_reg) /= 0 then
						pc_reg(7 downto 0) <= b_bus_reg;
					end if;
				else
					-- Only update registers when not a jump instruction
					case ir_reg(4 downto 2) is
					when "100" =>
						x_reg <= alu_reg;
					when "101" =>
						y_reg <= alu_reg;
					when "110" =>
						if ir_reg(7 downto 5) /= "110" then
							out_reg <= alu_reg;
							if (out_reg(6) = '0') and (alu_reg(6) = '1') then
								-- Rising edge on hsync, latch xout from accumulator
								xout_reg <= accu_reg;
							end if;
						end if;
					when "111" =>
						if ir_reg(7 downto 5) /= "110" then
							out_reg <= alu_reg;
							if (out_reg(6) = '0') and (alu_reg(6) = '1') then
								-- Rising edge on hsync, latch xout from accumulator
								xout_reg <= accu_reg;
							end if;
						end if;
						x_reg <= x_reg + 1;
					when others =>
						if ir_reg(7 downto 5) /= "110" then
							accu_reg <= alu_reg;
						end if;
					end case;
				end if;
			end if;

			case ir_reg(1 downto 0) is
			when "00" =>   b_bus_reg <= d_reg;
			when "01" =>   b_bus_reg <= sram_q;
			when "10" =>   b_bus_reg <= accu_reg;
			when others => b_bus_reg <= in_reg;
			end case;

			sram_a_reg <= X"00" & d_reg;
			if ir_reg(7 downto 5) /= "111" then
				case ir_reg(4 downto 2) is
				when "001" => sram_a_reg(7 downto 0) <= x_reg;
				when "010" => sram_a_reg(15 downto 8) <= y_reg;
				when "011" => sram_a_reg <= y_reg & x_reg;
				when "111" => sram_a_reg <= y_reg & x_reg;
				when others => null;
				end case;
			end if;

			sram_d_reg <= b_bus_reg;

			alu_reg <= b_bus_reg;
			case ir_reg(7 downto 5) is
			when "001" => alu_reg <= accu_reg and b_bus_reg;
			when "010" => alu_reg <= accu_reg or b_bus_reg;
			when "011" => alu_reg <= accu_reg xor b_bus_reg;
			when "100" => alu_reg <= accu_reg + b_bus_reg;
			when "101" => alu_reg <= accu_reg - b_bus_reg;
			when "110" => alu_reg <= accu_reg;
			when "111" => alu_reg <= 0 - accu_reg;
			when others => null;
			end case;

			-- Determine condition codes for branch instructions.
			-- Not really implemented as condition "flags" as such as it directly uses the accumulator status.
			if accu_reg = 0 then
				flags_reg <= "100";
			else
				flags_reg <= "0" & accu_reg(7) & (not accu_reg(7));
			end if;

			if reset = '1' then
				pc_reg <= (others => '0');
			end if;
		end if;
	end process;
end architecture;
