LIBRARY	IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

entity mkgapsync is
port(
	GAPS	:in integer	range 0 to 31;
	SYNCS	:in integer	range 0 to 15;
	
	GAPDAT	:in std_logic_vector(7 downto 0);
	
	WRENn		:in std_logic;
	
	MKEN		:out std_logic;
	MKDAT		:out std_logic_vector(7 downto 0);
	MK			:out std_logic;
	MKDONE	:in std_logic	:='1';
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end mkgapsync;

architecture rtl of mkgapsync is
signal	counter	:integer range 0 to 31;
type state_t is(
	st_IDLE,
	st_PREGAP,
	st_GAP,
	st_SYNC,
	st_END
);
signal	lWRENn	:std_logic_vector(1 downto 0);
signal	state	:state_t;
--signal	waitcount	:integer range 0 to 3;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				state<=st_IDLE;
				lWRENn<=(others=>'1');
				counter<=0;
	--			waitcount<=0;
				MKEN<='0';
				MKDAT<=x"00";
				MK<='0';
			elsif(ce = '1')then
				lWRENn<=lWRENn(0) & WRENn;
				MK<='0';
	--			if(waitcount>0)then
	--				waitcount<=waitcount-1;
	--			else
					case state is
					when st_IDLE =>
						if(lWRENn="10")then
							counter<=GAPS-1;
							MKEN<='1';
							MKDAT<=GAPDAT;
	--						waitcount<=3;
							state<=st_PREGAP;
						end if;
					when st_PREGAP =>
						MK<='1';
	--					waitcount<=3;
						state<=st_GAP;
					when st_GAP =>
						if(MKDONE='1')then
							MK<='1';
							if(counter>0)then
								counter<=counter-1;
							else
								MKDAT<=x"00";
								counter<=SYNCS;
								state<=st_SYNC;
							end if;
	--						waitcount<=3;
						end if;
					when st_SYNC =>
						if(MKDONE='1')then
							MK<='1';
							if(counter>0)then
								counter<=counter-1;
							else
								MKDAT<=x"00";
								state<=st_END;
							end if;
	--						waitcount<=3;
						end if;
					when others =>
						MKEN<='0';
						state<=st_IDLE;
					end case;
	--			end if;
			end if;
		end if;
	end process;
	
end rtl;

					
					
			