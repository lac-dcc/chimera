-------------------------------------------------------------------------
--  Copyright (C) 2018 Kaan Kara - Systems Group, ETH Zurich

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

entity AESDEC is
generic (
	LAST : integer := 0);
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	in_key : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end AESDEC;

architecture structural of AESDEC is

signal InvShiftRows_valid : std_logic;
signal InvShiftRows_data : std_logic_vector(127 downto 0);

signal InvSubBytes_valid : std_logic;
signal InvSubBytes_data : std_logic_vector(127 downto 0);

signal InvMixColumns_valid : std_logic;
signal InvMixColumns_data : std_logic_vector(127 downto 0);

component InvShiftRows
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end component;

component InvSubBytes
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end component;

component InvMixColumns
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end component;

begin

InvShiftRows_inst: InvShiftRows
port map (
	clk => clk,

	in_valid => in_valid,
	in_data => in_data,
	out_valid => InvShiftRows_valid,
	out_data => InvShiftRows_data);

InvSubBytes_inst: InvSubBytes
port map (
	clk => clk,

	in_valid => InvShiftRows_valid,
	in_data => InvShiftRows_data,
	out_valid => InvSubBytes_valid,
	out_data => InvSubBytes_data);

LAST_0: if LAST = 0 generate
	InvMixColumns_inst: InvMixColumns
	port map (
		clk => clk,

		in_valid => InvSubBytes_valid,
		in_data => InvSubBytes_data,
		out_valid => InvMixColumns_valid,
		out_data => InvMixColumns_data);
	process(clk)
	begin
	if clk'event and clk = '1' then
		out_valid <= InvMixColumns_valid;
		out_data <= InvMixColumns_data xor in_key;
	end if;
	end process;
end generate;
LAST_1: if LAST = 1 generate
	process(clk)
	begin
	if clk'event and clk = '1' then
		out_valid <= InvSubBytes_valid;
		out_data <= InvSubBytes_data xor in_key;
	end if;
	end process;
end generate;

end architecture;