library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity wrotecont is
generic(
	sysfreq	:integer	:=20;	--kHz
	delay	:integer	:=3		--msec
);
port(
	wrgate	:in std_logic;
	usel	:in std_logic_vector(1 downto 0);
	
	busy	:out std_logic;
	save	:out std_logic_vector(1 downto 0);
	done	:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end wrotecont;

architecture rtl of wrotecont is
constant waitlen	:integer	:=sysfreq*delay;
signal	waitcount0	:integer range waitlen-1 downto 0;
signal	waitcount1	:integer range waitlen-1 downto 0;

type state_t is (
	st_idle,
	st_save0,
	st_save1
);
signal	state	:state_t;

begin
	process(clk,rstn)
	variable savepend	:std_logic_vector(1 downto 0);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				state<=st_idle;
				waitcount0<=0;
				waitcount1<=0;
				save<="00";
				savepend:="00";
			elsif(ce = '1')then
				save<="00";
				if(wrgate='1' and usel(0)='1')then
					waitcount0<=waitlen-1;
				elsif(waitcount0>0)then
					waitcount0<=waitcount0-1;
					if(waitcount0=1)then
						savepend(0):='1';
					end if;
				end if;
	
				if(wrgate='1' and usel(1)='1')then
					waitcount1<=waitlen-1;
				elsif(waitcount1>0)then
					waitcount1<=waitcount1-1;
					if(waitcount1=1)then
						savepend(1):='1';
					end if;
				end if;
					
				case state is
				when st_idle =>
					if(savepend(0)='1')then
						save(0)<='1';
						savepend(0):='0';
						state<=st_save0;
					elsif(savepend(1)='1')then
						save(1)<='1';
						savepend(1):='0';
						state<=st_save1;
					end if;
				when st_save0 | st_save1 =>
					if(done='1')then
						state<=st_idle;
					end if;
				when others =>
					state<=st_idle;
				end case;
			end if;
		end if;
	end process;
	
	busy<=	'1' when waitcount0>0 else
			'1' when waitcount1>0 else
			'0' when state=st_idle else
			'1';

end rtl;
