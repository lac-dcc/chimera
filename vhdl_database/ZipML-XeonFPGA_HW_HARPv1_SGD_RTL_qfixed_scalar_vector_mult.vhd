----------------------------------------------------------------------------
--  Copyright (C) 2017 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity qfixed_scalar_vector_mult is
generic (
	VECTOR_SIZE : integer := 16;
	QUANTIZATION_BITS : integer := 2);
port (
	clk : in std_logic;

	normalized_to_minus1_1 : in std_logic;
	trigger : in std_logic;
	scalar : in std_logic_vector(31 downto 0);
	vector : in std_logic_vector(255 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VECTOR_SIZE-1 downto 0));
end qfixed_scalar_vector_mult;

architecture behavioral of qfixed_scalar_vector_mult is

begin

result_almost_valid <= trigger;

GEN_Q1: if QUANTIZATION_BITS = 1 generate
process(clk)
begin
if clk'event and clk = '1' then
	result_valid <= trigger;
	for k in 0 to 255 loop
		if vector(k) = '0' then
			result(32*k+31 downto 32*k) <= (others => '0');
		else
			result(32*k+31 downto 32*k) <= scalar;
		end if;
	end loop;
end if;
end process;
end generate GEN_Q1;

GEN_Q2: if QUANTIZATION_BITS = 2 generate
process(clk)
begin
if clk'event and clk = '1' then
	result_valid <= trigger;
	for k in 0 to 127 loop
		if normalized_to_minus1_1 = '0' then
			if vector(2*k+1 downto 2*k) = B"00" then
				result(32*k+31 downto 32*k) <= (others => '0');
			elsif vector(2*k+1 downto 2*k) = B"01" then
				result(32*k+31 downto 32*k) <= std_logic_vector( shift_right(signed(scalar(31 downto 0)), 1) );
			else
				result(32*k+31 downto 32*k) <= scalar(31 downto 0);
			end if;
		else
			if vector(2*k+1 downto 2*k) = B"01" then
				result(32*k+31 downto 32*k) <= scalar(31 downto 0);
			elsif vector(2*k+1 downto 2*k) = B"11" then
				result(32*k+31 downto 32*k) <= std_logic_vector( -signed(scalar(31 downto 0)) );
			else
				result(32*k+31 downto 32*k) <= (others => '0');
			end if;
		end if;
	end loop;
end if;
end process;
end generate GEN_Q2;

GEN_Q4: if QUANTIZATION_BITS = 4 generate
process(clk)
variable temp_result : std_logic_vector(2303 downto 0);
begin
if clk'event and clk = '1' then
	result_valid <= trigger;
	for k in 0 to 63 loop
		if vector(4*k+3 downto 4*k) = B"1000" then
			temp_result(36*k+34 downto 36*k) := scalar & B"000";
		else
			temp_result(36*k+35 downto 36*k) := std_logic_vector( signed(vector(4*k+3 downto 4*k)) * signed(scalar) );
		end if;
		
		if normalized_to_minus1_1 = '0' then
			result(32*k+31 downto 32*k) <= temp_result(36*k+34 downto 36*k+3);
		else
			result(32*k+31 downto 32*k) <= temp_result(36*k+33 downto 36*k+2);
		end if;
	end loop;
end if;
end process;
end generate GEN_Q4;

GEN_Q8: if QUANTIZATION_BITS = 8 generate
process(clk)
variable temp_result : std_logic_vector(2559 downto 0);
begin
if clk'event and clk = '1' then
	result_valid <= trigger;
	for k in 0 to 31 loop
		if vector(8*k+7 downto 8*k) = B"10000000" then
			temp_result(40*k+38 downto 40*k) := scalar & B"0000000";
		else
			temp_result(40*k+39 downto 40*k) := std_logic_vector( signed(vector(8*k+7 downto 8*k)) * signed(scalar) );
		end if;

		if normalized_to_minus1_1 = '0' then
			result(32*k+31 downto 32*k) <= temp_result(40*k+38 downto 40*k+7);
		else
			result(32*k+31 downto 32*k) <= temp_result(40*k+37 downto 40*k+6);
		end if;
	end loop;
end if;
end process;
end generate GEN_Q8;

end architecture;