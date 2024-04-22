-- 74161 counter: 16 bit extended version
-- code found on the internet
-- adjusted to fit 16 bit counter structure

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity v74161_16bit is
port ( CLK, CLRN, LDN, ENP, ENT: in STD_LOGIC :='0';
D: in UNSIGNED (15 downto 0) := "0000000000000000";
Q: out UNSIGNED (15 downto 0):= "0000000000000000";
RCO: out STD_LOGIC  :='0');
end v74161_16bit;

architecture V74x161_arch of v74161_16bit is
 signal IQ: UNSIGNED (15 downto 0) := "0000000000000000";
 signal IRCO: STD_LOGIC := '0';
 begin

process (CLK, CLRN, IQ, ENT)
begin

if CLRN='0' then IQ <= "0000000000000000";
elsif rising_edge(CLK) then
if LDN='0' then
	IQ <= D;
elsif (ENT and ENP)='1' then IQ <= IQ + 1;
end if;
end if;

--if (IQ=15) and (ENT='1') then IRCO <= '1';

if (IQ=65535) and (ENT='1') then IRCO <= '1';
else IRCO <= '0';
end if;

end process;


Q <= IQ;
RCO <= IRCO;

end V74x161_arch;
