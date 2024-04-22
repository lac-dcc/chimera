--------------------------------------------------------------------------------
---- FPGA VCO
--------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

use work.sine_package.all;

-- O_CLK = (I_CLK / 2^20) * I_STEP
entity MC_SOUND_VCO is
	port(
		I_CLK     : in  std_logic;
		I_RSTn    : in  std_logic;
		I_FS      : in  std_logic;
		I_STEP    : in  std_logic_vector( 7 downto 0);
		O_WAV     : out std_logic_vector( 7 downto 0)
	);
end;

architecture RTL of MC_SOUND_VCO is
	signal VCO1_CTR   : std_logic_vector(19 downto 0) := (others => '0');
	signal sine 		: std_logic_vector(14 downto 0) := (others => '0');

begin
	O_WAV <= sine(14 downto 7);
	process(I_CLK, I_RSTn)
	begin
		if (I_RSTn = '0') then
		  VCO1_CTR <= (others=>'0');
		elsif rising_edge(I_CLK) then
			if I_FS = '1' then
				VCO1_CTR <= VCO1_CTR + I_STEP;
				case VCO1_CTR(19 downto 18) is
					when "00" => 
						sine <= "100000000000000" + std_logic_vector( to_signed(get_table_value(     VCO1_CTR(17 downto 11)), 15));
					when "01" =>
						sine <= "100000000000000" + std_logic_vector( to_signed(get_table_value( not VCO1_CTR(17 downto 11)), 15));
					when "10" =>
						sine <= "100000000000000" + std_logic_vector(-to_signed(get_table_value(     VCO1_CTR(17 downto 11)), 15));
					when "11" =>
						sine <= "100000000000000" + std_logic_vector(-to_signed(get_table_value( not VCO1_CTR(17 downto 11)), 15));
					when others => null;
				end case;
			end if;
		end if;
	end process;
end RTL;
