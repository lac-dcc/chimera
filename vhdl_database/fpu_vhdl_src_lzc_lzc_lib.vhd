-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;

package lzc_lib is

	component lzc_4
		port(
			A : in  std_logic_vector(3 downto 0);
			Z : out std_logic_vector(1 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_8
		port(
			A : in  std_logic_vector(7 downto 0);
			Z : out std_logic_vector(2 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_16
		port(
			A : in  std_logic_vector(15 downto 0);
			Z : out std_logic_vector(3 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_32
		port(
			A : in  std_logic_vector(31 downto 0);
			Z : out std_logic_vector(4 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_64
		port(
			A : in  std_logic_vector(63 downto 0);
			Z : out std_logic_vector(5 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_128
		port(
			A : in  std_logic_vector(127 downto 0);
			Z : out std_logic_vector(6 downto 0);
			V : out std_logic
		);
	end component;

	component lzc_256
		port(
			A : in  std_logic_vector(255 downto 0);
			Z : out std_logic_vector(7 downto 0);
			V : out std_logic
		);
	end component;

end package;
