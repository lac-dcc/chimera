library ieee;
use ieee.std_logic_1164.all;

entity SingleCycleStartFinFsm is
	port (clk, reset, start_req, fin_req : in std_logic;
		enable, start_ack, fin_ack: out std_logic) ;
end entity SingleCycleStartFinFsm;

architecture BehaveProcess of SingleCycleStartFinFsm is
       signal fin_ack_sig: std_logic;
begin
	fin_ack <= fin_ack_sig;

	process(clk,reset, fin_req, start_req, fin_ack_sig)
		variable next_fin_ack_sig: std_logic;
		variable enable_var : std_logic;
	begin
		next_fin_ack_sig := fin_ack_sig;
		enable_var := '0';

		case fin_ack_sig is
			when '0' =>
				if(start_req = '1') then
					enable_var := '1';
					next_fin_ack_sig := '1';
				end if;
			when '1' =>
				if((fin_req = '1') and (start_req  = '1')) then
					enable_var := '1';
				elsif (fin_req = '1') then
					next_fin_ack_sig := '0';
				end if;
			when others => 
				null;
		end case;

		enable <= enable_var;
                start_ack <= enable_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fin_ack_sig <= '0';
			else
				fin_ack_sig <= next_fin_ack_sig;
			end if;
		end if;
	end process;
end BehaveProcess; 
