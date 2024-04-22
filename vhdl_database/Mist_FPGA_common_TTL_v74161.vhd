-- 74161 counter - extended to 8 bits
-- code found on the internet
-- adjustments made for 8 bit counter structure

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity v74161 is
port ( CLK, CLRN, LDN, ENP, ENT: in STD_LOGIC :='0';
D: in UNSIGNED (7 downto 0) := "00000000";
Q: out UNSIGNED (7 downto 0):= "00000000";
RCO: out STD_LOGIC  :='0');
end v74161;

architecture V74x161_arch of v74161 is
 signal IQ: UNSIGNED (7 downto 0) := "00000000";
 signal IRCO: STD_LOGIC := '0';
 begin

process (CLK, CLRN, IQ, ENT)
begin

if CLRN='0' then IQ <= "00000000";
elsif rising_edge(CLK) then
if LDN='0' then IQ <= D;
elsif (ENT and ENP)='1' then IQ <= IQ + 1;
end if;
end if;

--if (IQ=15) and (ENT='1') then IRCO <= '1';
if (IQ=255) and (ENT='1') then IRCO <= '1';
else IRCO <= '0';
end if;

end process;



Q <= IQ;
RCO <= IRCO;

end V74x161_arch;
