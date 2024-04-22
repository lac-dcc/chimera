library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity spinner is
port(
 clock          : in std_logic;
 reset          : in std_logic;
 btn_left       : in std_logic;
 btn_right      : in std_logic;
 btn_acc        : in std_logic; -- speed up button
 strobe         : in std_logic;
 spin_angle     : out std_logic_vector(6 downto 0)
);
end spinner;

architecture rtl of spinner is

signal strobe_r   : std_logic;
signal spin_count : std_logic_vector(9 downto 0);

begin

spin_angle <= spin_count(9 downto 3);

process (clock, reset)
begin
	if reset = '1' then
		spin_count <= (others => '0');
	elsif rising_edge(clock) then
		strobe_r <= strobe;

		if strobe_r ='0' and strobe = '1' then
			if btn_acc = '0' then  -- space -- speed up
				if btn_left = '1' then spin_count <= spin_count - 8; end if; -- left
				if btn_right = '1' then spin_count <= spin_count + 8; end if; -- right
			else
				if btn_left = '1' then spin_count <= spin_count - 55; end if;
				if btn_right = '1' then spin_count <= spin_count + 55; end if;
			end if;
		end if;
	end if;
end process;

end rtl;