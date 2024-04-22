LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rtcbody is
generic(
	clkfreq	:integer	:=21477270
);
port(
	YERHIN	:in std_logic_vector(3 downto 0);
	YERHWR	:in std_logic;
	YERLIN	:in std_logic_vector(3 downto 0);
	YERLWR	:in std_logic;
	MONIN	:in std_logic_vector(3 downto 0);
	MONWR	:in std_logic;
	DAYHIN	:in std_logic_vector(1 downto 0);
	DAYHWR	:in std_logic;
	DAYLIN	:in std_logic_vector(3 downto 0);
	DAYLWR	:in std_logic;
	WDAYIN	:in std_logic_vector(2 downto 0);
	WDAYWR	:in std_logic;
	HORHIN	:in std_logic_vector(1 downto 0);
	HORHWR	:in std_logic;
	HORLIN	:in std_logic_vector(3 downto 0);
	HORLWR	:in std_logic;
	MINHIN	:in std_logic_vector(2 downto 0);
	MINHWR	:in std_logic;
	MINLIN	:in std_logic_vector(3 downto 0);
	MINLWR	:in std_logic;
	SECHIN	:in std_logic_vector(2 downto 0);
	SECHWR	:in std_logic;
	SECLIN	:in std_logic_vector(3 downto 0);
	SECLWR	:in std_logic;
	SECZERO	:in std_logic;
	
	YERHOUT	:out std_logic_vector(3 downto 0);
	YERLOUT	:out std_logic_vector(3 downto 0);
	MONOUT	:out std_logic_vector(3 downto 0);
	DAYHOUT	:out std_logic_vector(1 downto 0);
	DAYLOUT	:out std_logic_vector(3 downto 0);
	WDAYOUT	:out std_logic_vector(2 downto 0);
	HORHOUT	:out std_logic_vector(1 downto 0);
	HORLOUT	:out std_logic_vector(3 downto 0);
	MINHOUT	:out std_logic_vector(2 downto 0);
	MINLOUT	:out std_logic_vector(3 downto 0);
	SECHOUT	:out std_logic_vector(2 downto 0);
	SECLOUT	:out std_logic_vector(3 downto 0);

	OUT1Hz	:out std_logic;
	SUBSEC	:out integer range 0 to clkfreq-1;

	fast	:in std_logic;

 	sclk	:in std_logic;
 	sys_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end rtcbody;

architecture MAIN of rtcbody is
signal	YERH	:std_logic_vector(3 downto 0);
signal	YERL	:std_logic_vector(3 downto 0);
signal	MON		:std_logic_vector(3 downto 0);
signal	DAYH	:std_logic_vector(1 downto 0);
signal	DAYL	:std_logic_vector(3 downto 0);
signal	WDAY	:std_logic_vector(2 downto 0);
signal	HORH	:std_logic_vector(1 downto 0);
signal	HORL	:std_logic_vector(3 downto 0);
signal	MINH	:std_logic_vector(2 downto 0);
signal	MINL	:std_logic_vector(3 downto 0);
signal	SECH	:std_logic_vector(2 downto 0);
signal	SECL	:std_logic_vector(3 downto 0);

signal	seccount:integer range 0 to clkfreq-1;
signal	SFT1s	:std_logic;
signal	SFTSECL	:std_logic;
signal	SFTSECH	:std_logic;
signal	SFTMINL	:std_logic;
signal	SFTMINH	:std_logic;
signal	SFTHORL	:std_logic;
signal	SFTHORH	:std_logic;
signal	SFTDAYL	:std_logic;
signal	SFTDAYH	:std_logic;
signal	SFTMON	:std_logic;
signal	SFTYERL	:std_logic;
signal	SFTYERH	:std_logic;
signal	LEAP	:std_logic;
begin
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				seccount<=clkfreq-1;
				SFT1s<='0';
				OUT1Hz<='0';
			elsif(sys_ce = '1')then
				SFT1s<='0';
				if(SECZERO='1')then
					seccount<=clkfreq-1;
				elsif(seccount>0)then
					seccount<=seccount-1;
				else
					seccount<=clkfreq-1;
					SFT1s<='1';
				end if;
				if(seccount>(clkfreq/2))then
					OUT1Hz<='1';
				else
					OUT1Hz<='0';
				end if;
			end if;
		end if;
	end process;
	SUBSEC<=seccount;
	SFTSECL<=SFT1s when fast='0' else '1';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				SECL<=(others=>'0');
			elsif(sys_ce = '1')then
				if(SECLWR='1')then
					SECL<=SECLIN;
				elsif(SFTSECL='1')then
					if(SECL<x"9")then
						SECL<=SECL+x"1";
					else
						SECL<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	SECLOUT<=SECL;
	SFTSECH<=SFTSECL when SECL=x"9" else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				SECH<=(others=>'0');
			elsif(sys_ce = '1')then
				if(SECHWR='1')then
					SECH<=SECHIN;
				elsif(SFTSECH='1')then
					if(SECH<"101")then
						SECH<=SECH+"001";
					else
						SECH<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	SECHOUT<=SECH;
	SFTMINL<=SFTSECH when SECH="101" else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				MINL<=(others=>'0');
			elsif(sys_ce = '1')then
				if(MINLWR='1')then
					MINL<=MINLIN;
				elsif(SFTMINL='1')then
					if(MINL<x"9")then
						MINL<=MINL+x"1";
					else
						MINL<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	MINLOUT<=MINL;
	SFTMINH<=SFTMINL when MINL=x"9" else '0';

	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				MINH<=(others=>'0');
			elsif(sys_ce = '1')then
				if(MINHWR='1')then
					MINH<=MINHIN;
				elsif(SFTMINH='1')then
					if(MINH<"101")then
						MINH<=MINH+"001";
					else
						MINH<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	MINHOUT<=MINH;
	SFTHORL<=SFTMINH when MINH="101" else '0';

	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				HORL<=(others=>'0');
			elsif(sys_ce = '1')then
				if(HORLWR='1')then
					HORL<=HORLIN;
				elsif(SFTHORL='1')then
					if(HORL=x"9")then
						HORL<=(others=>'0');
					elsif(HORH="10" and HORL=x"3")then
						HORL<=(others=>'0');
					else
						HORL<=HORL+x"1";
					end if;
				end if;
			end if;
		end if;
	end process;
	HORLOUT<=HORL;
	SFTHORH<=SFTHORL when (HORL=x"9" or (HORH="10" and HORL=x"3")) else '0';

	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				HORH<=(others=>'0');
			elsif(sys_ce = '1')then
				if(HORHWR='1')then
					HORH<=HORHIN;
				elsif(SFTHORH='1')then
					if(HORH<"10")then
						HORH<=HORH+"01";
					else
						HORH<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	HORHOUT<=HORH;
	SFTDAYL<=SFTHORH when HORH="10" else '0';

	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				WDAY<=(others=>'0');
			elsif(sys_ce = '1')then
				if(WDAYWR='1')then
					WDAY<=WDAYIN;
				elsif(SFTDAYL='1')then
					if(WDAY<"110")then
						WDAY<=WDAY+"001";
					else
						WDAY<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	WDAYOUT<=WDAY;

	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				DAYL<=x"1";
			elsif(sys_ce = '1')then
				if(DAYLWR='1')then
					DAYL<=DAYLIN;
				elsif(SFTDAYL='1')then
					if(DAYL=x"9")then
						if(MON=x"2")then
							DAYL<=x"1";
						else
							DAYL<=x"0";
						end if;
					elsif(MON=x"2" and DAYH="010" and DAYL=x"8" and LEAP='0')then
						DAYL<=x"1";
					elsif((MON=x"4" or MON=x"6" or MON=x"9" or MON=x"b") and DAYH="011" and DAYL=x"0")then
						DAYL<=x"1";
					elsif((MON=x"1" or MON=x"3" or MON=x"5" or MON=x"7" or MON=x"8" or MON=x"a" or MON=x"c") and DAYH="011" and DAYL=x"1")then
						DAYL<=x"1";
					else
						DAYL<=DAYL+x"1";
					end if;
				end if;
			end if;
		end if;
	end process;
	DAYLOUT<=DAYL;
	SFTDAYH<=SFTDAYL when (	(DAYL=x"9" ) or
							(MON=x"2" and DAYH="010" and DAYL=x"8" and LEAP='0') or
							((MON=x"4" or MON=x"6" or MON=x"9" or MON=x"b") and DAYH="011" and DAYL=x"0") or
							((MON=x"1" or MON=x"3" or MON=x"5" or MON=x"7" or MON=x"8" or MON=x"a" or MON=x"c") and DAYH="011" and DAYL=x"1")) else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				DAYH<=(others=>'0');
			elsif(sys_ce = '1')then
				if(DAYHWR='1')then
					DAYH<=DAYHIN;
				elsif(SFTDAYH='1')then
					if(DAYH="00" or DAYH="01")then
						DAYH<=DAYH+"01";
					elsif(MON/=x"2" and DAYH="10")then
						DAYH<=DAYH+"01";
					elsif(MON=x"2" and DAYH="10")then
						DAYH<=(others=>'0');
					elsif(DAYH="11")then
						DAYH<=(others=>'0');
					else
						DAYH<=DAYH+"01";
					end if;
				end if;
			end if;
		end if;
	end process;
	DAYHOUT<=DAYH;
	SFTMON<=SFTDAYH when ((MON=x"2" and DAYH="10") or DAYH="11") else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				MON<=x"1";
			elsif(sys_ce = '1')then
				if(MONWR='1')then
					MON<=MONIN;
				elsif(SFTMON='1')then
					if(MON<x"c")then
						MON<=MON+x"1";
					else
						MON<=x"1";
					end if;
				end if;
			end if;
		end if;
	end process;
	MONOUT<=MON;
	SFTYERL<=SFTMON when MON=x"c" else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				YERL<=(others=>'0');
			elsif(sys_ce = '1')then
				if(YERLWR='1')then
					YERL<=YERLIN;
				elsif(SFTYERL='1')then
					if(YERL<x"9")then
						YERL<=YERL+x"1";
					else
						YERL<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	YERLOUT<=YERL;
	SFTYERH<=SFTYERL when YERL=x"9" else '0';
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				YERH<=(others=>'0');
			elsif(sys_ce = '1')then
				if(YERHWR='1')then
					YERH<=YERHIN;
				elsif(SFTYERH='1')then
					if(YERH<x"9")then
						YERH<=YERH+x"1";
					else
						YERH<=(others=>'0');
					end if;
				end if;
			end if;
		end if;
	end process;
	YERHOUT<=YERH;
	
	LEAP<=	'1' when YERH(0)='0' and YERL(1 downto 0)="00" else
			'1' when YERH(0)='1' and YERL(1 downto 0)="10" else
			'0';
	
end MAIN;

