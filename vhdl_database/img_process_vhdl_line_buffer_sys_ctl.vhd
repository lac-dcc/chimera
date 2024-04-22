library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity sys_ctl is
port (
		clk : in std_logic;
		en : in std_logic;
		rst : in std_logic;
		sys_ctl_en : out std_logic
	  );
end sys_ctl;

architecture control of sys_ctl is
begin	
	ctl_gen : process(rst, clk)
	begin
		if rst = '0' then
			sys_ctl_en <= '0';			
		elsif rising_edge(clk) then
			if en = '1' then
				sys_ctl_en <= '1';				
			end if;			
		end if;
	end process;	
end control;

