LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NRDET is
generic(
	TOms	:integer	:=800
);
port(
	start	:in std_logic;
	RDY		:in std_logic;

	NOTRDY	:out std_logic;

	mssft	:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end NRDET;
architecture rtl of NRDET is
type state_t is(
	st_IDLE,
	st_WAIT
);
signal state :state_t;
signal wcount :integer range 0 to TOms-1;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				state<=st_IDLE;
				NOTRDY<='0';
				wcount<=0;
			elsif(ce = '1')then
				NOTRDY<='0';
				if(start='1')then
					state<=st_WAIT;
					wcount<=TOms-1;
				elsif(state=st_WAIT)then
					if(RDY='1')then
						state<=st_IDLE;
						wcount<=0;
					elsif(mssft='1')then
						if(wcount>0)then
							wcount<=wcount-1;
						else
							NOTRDY<='1';
							state<=st_IDLE;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end rtl;

