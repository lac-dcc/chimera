library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity out_xor is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           o  : out STD_LOGIC);
end out_xor;

architecture Behavioral of out_xor is
begin
xor_lut: LUT4_D 
	generic map ( INIT => X"6996") 
	port map ( I0 => I0, I1 => I1, I2 => I2, I3 => I3, LO => open, O => O);
end Behavioral;

