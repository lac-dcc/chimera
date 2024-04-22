LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rp5c15 is
generic(
	clkfreq	:integer	:=21477270;
	YEAROFF	:std_logic_vector(7 downto 0)	:=x"00"
);
port(
	addr	:in std_logic_vector(3 downto 0);
	wdat	:in std_logic_vector(3 downto 0);
	rdat	:out std_logic_vector(3 downto 0);
	wr		:in std_logic;

	clkout	:out std_logic;
	alarm	:out std_logic;

	RTCIN	:in std_logic_vector(64 downto 0);

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end rp5c15;
architecture rtl of rp5c15 is
signal	YEH		:std_logic_vector(3 downto 0);
signal	YEL		:std_logic_vector(3 downto 0);
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

signal	YEHWD	:std_logic_vector(3 downto 0);
signal	YELWD	:std_logic_vector(3 downto 0);
signal	MONWD	:std_logic_vector(3 downto 0);
signal	DAYHWD	:std_logic_vector(1 downto 0);
signal	DAYLWD	:std_logic_vector(3 downto 0);
signal	WDAYWD	:std_logic_vector(2 downto 0);
signal	HORHWD	:std_logic_vector(1 downto 0);
signal	HORLWD	:std_logic_vector(3 downto 0);
signal	MINHWD	:std_logic_vector(2 downto 0);
signal	MINLWD	:std_logic_vector(3 downto 0);
signal	SECHWD	:std_logic_vector(2 downto 0);
signal	SECLWD	:std_logic_vector(3 downto 0);

signal	YEHWR	:std_logic;
signal	YELWR	:std_logic;
signal	MONWR	:std_logic;
signal	DAYHWR	:std_logic;
signal	DAYLWR	:std_logic;
signal	WDAYWR	:std_logic;
signal	HORHWR	:std_logic;
signal	HORLWR	:std_logic;
signal	MINHWR	:std_logic;
signal	MINLWR	:std_logic;
signal	SECHWR	:std_logic;
signal	SECLWR	:std_logic;
signal	SECZWR	:std_logic;

signal	YEHID	:std_logic_vector(3 downto 0);
signal	YELID	:std_logic_vector(3 downto 0);
signal	MONID	:std_logic_vector(3 downto 0);
signal	DAYHID	:std_logic_vector(1 downto 0);
signal	DAYLID	:std_logic_vector(3 downto 0);
signal	WDAYID	:std_logic_vector(2 downto 0);
signal	HORHID	:std_logic_vector(1 downto 0);
signal	HORLID	:std_logic_vector(3 downto 0);
signal	MINHID	:std_logic_vector(2 downto 0);
signal	MINLID	:std_logic_vector(3 downto 0);
signal	SECHID	:std_logic_vector(2 downto 0);
signal	SECLID	:std_logic_vector(3 downto 0);
signal	SYSSET	:std_logic;

signal	BNKSEL	:std_logic;
signal	RESET		:std_logic_vector(3 downto 0);
signal	MONHt	:std_logic;
signal	MONLt	:std_logic_vector(3 downto 0);
signal	monwdat	:std_logic_vector(3 downto 0);
signal	Hz		:std_logic;
signal	subHz	:integer range 0 to clkfreq-1;
signal	Hz16	:std_logic;

constant div32	:integer :=clkfreq/32;
constant div16	:integer	:=clkfreq/16;

component rtcbody
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
end component;


begin
	rtc	:rtcbody generic map(clkfreq) port map(
		YERHIN	=>YEHWD,
		YERHWR	=>YEHWR,
		YERLIN	=>YELWD,
		YERLWR	=>YELWR,
		MONIN	=>MONWD,
		MONWR	=>MONWR,
		DAYHIN	=>DAYHWD,
		DAYHWR	=>DAYHWR,
		DAYLIN	=>DAYLWD,
		DAYLWR	=>DAYLWR,
		WDAYIN	=>WDAYWD,
		WDAYWR	=>WDAYWR,
		HORHIN	=>HORHWD,
		HORHWR	=>HORHWR,
		HORLIN	=>HORLWD,
		HORLWR	=>HORLWR,
		MINHIN	=>MINHWD,
		MINHWR	=>MINHWR,
		MINLIN	=>MINLWD,
		MINLWR	=>MINLWR,
		SECHIN	=>SECHWD,
		SECHWR	=>SECHWR,
		SECLIN	=>SECLWD,
		SECLWR	=>SECLWR,
		SECZERO	=>SECZWR,

		YERHOUT	=>YEH,
		YERLOUT	=>YEL,
		MONOUT	=>MON,
		DAYHOUT	=>DAYH,
		DAYLOUT	=>DAYL,
		WDAYOUT	=>WDAY,
		HORHOUT	=>HORH,
		HORLOUT	=>HORL,
		MINHOUT	=>MINH,
		MINLOUT	=>MINL,
		SECHOUT	=>SECH,
		SECLOUT	=>SECL,

		OUT1Hz	=>Hz,
		SUBSEC	=>subHz,

		fast	=>'0',

		sclk	=>clk,
		sys_ce  =>ce,
		rstn	=>rstn
	);
	
	clkout <= '0';

	process(clk,rstn)
	variable modx	:integer range 0 to (div16-1);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				Hz16<='0';
			elsif(ce = '1')then
				modx:=subHz mod div16;
				if(modx>div32)then
					Hz16<='1';
				else
					Hz16<='0';
				end if;
			end if;
		end if;
	end process;

	alarm<=(Hz and (not RESET(3))) or (Hz16 and (not RESET(2)));

	SECLID<=RTCIN(3 downto 0);
	SECHID<=RTCIN(6 downto 4);
	MINLID<=RTCIN(11 downto 8);
	MINHID<=RTCIN(14 downto 12);
	HORLID<=RTCIN(19 downto 16);
	HORHID<=RTCIN(21 downto 20);
	DAYLID<=RTCIN(27 downto 24);
	DAYHID<=RTCIN(29 downto 28);
	MONID<=	RTCIN(35 downto 32) when RTCIN(36)='0' else
				RTCIN(35 downto 32)+x"a";

	process(RTCIN)
	variable carry	:std_logic;
	variable	tmpval	:std_logic_vector(4 downto 0);
	begin
		tmpval:=('0' & RTCIN(43 downto 40))+('0' & YEAROFF(3 downto 0));
		if(tmpval>"01010")then
			carry:='1';
			tmpval:=tmpval-"01010";
		else
			carry:='0';
		end if;
		YELID<=tmpval(3 downto 0);
		tmpval:=('0' & RTCIN(47 downto 44))+('0' & YEAROFF(7 downto 4));
		if(carry='1')then
			tmpval:=tmpval+1;
		end if;
		if(tmpval>"01010")then
			tmpval:=tmpval-"01010";
		end if;
		YEHID<=tmpval(3 downto 0);
	end process;

	WDAYID<=RTCIN(50 downto 48);

	YEHWD<=wdat 					when wr='1' else YEHID;
	YELWD<=wdat 					when wr='1' else YELID;
	MONWD<=monwdat 				when wr='1' else MONID;
	DAYHWD<=wdat(1 downto 0) 	when wr='1' else DAYHID;
	DAYLWD<=wdat 					when wr='1' else DAYLID;
	WDAYWD<=wdat(2 downto 0)	when wr='1' else WDAYID;
	HORHWD<=wdat(1 downto 0)	when wr='1' else HORHID;
	HORLWD<=wdat 					when wr='1' else HORLID;
	MINHWD<=wdat(2 downto 0)	when wr='1' else MINHID;
	MINLWD<=wdat 					when wr='1' else MINLID;
	SECHWD<=wdat(2 downto 0)	when wr='1' else SECHID;
	SECLWD<=wdat 					when wr='1' else SECLID;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				BNKSEL<='0';
				RESET<=(others=>'0');
			elsif(ce = '1')then
				if(addr=x"d" and wr='1')then
					BNKSEL<=wdat(0);
				elsif(addr=x"f" and wr='1')then
					RESET<=wdat(3 downto 0);
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)
	variable state	:integer range 0 to 2;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				state:=0;
				SYSSET<='0';
			elsif(ce = '1')then
				SYSSET<='0';
				case state is
				when 2 =>
				when 1 =>
					SYSSET<='1';
					state:=2;
				when 0 =>
					if(RTCIN(64)='1')then
						state:=1;
					end if;
				when others =>
					state:=2;
				end case;
			end if;
		end if;
	end process;

	YEHWR<=	'1' when addr=x"c" and BNKSEL='0' and wr='1' else SYSSET;
	YELWR<=	'1' when addr=x"b" and BNKSEL='0' and wr='1' else SYSSET;
	MONWR<=	'1' when (addr=x"9" or addr=x"a") and BNKSEL='0' and wr='1' else SYSSET;
	DAYHWR<='1' when addr=x"8" and BNKSEL='0' and wr='1' else SYSSET;
	DAYLWR<='1' when addr=x"7" and BNKSEL='0' and wr='1' else SYSSET;
	WDAYWR<='1' when addr=x"6" and BNKSEL='0' and wr='1' else SYSSET;
	HORHWR<='1' when addr=x"5" and BNKSEL='0' and wr='1' else SYSSET;
	HORLWR<='1' when addr=x"4" and BNKSEL='0' and wr='1' else SYSSET;
	MINHWR<='1' when addr=x"3" and BNKSEL='0' and wr='1' else SYSSET;
	MINLWR<='1' when addr=x"2" and BNKSEL='0' and wr='1' else SYSSET;
	SECHWR<='1' when addr=x"1" and BNKSEL='0' and wr='1' else SYSSET;
	SECLWR<='1' when addr=x"0" and BNKSEL='0' and wr='1' else SYSSET;
	SECZWR<='1' when addr=x"0" and BNKSEL='0' and wr='1' else SYSSET;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				MONHt<='0';
				MONLt<=x"0";
			elsif(ce = '1')then
				if(wr='1' and BNKSEL='0')then
					case addr is
					when x"9" =>
						MONLt<=wdat;
					when x"a" =>
						MONHt<=wdat(0);
					when others =>
					end case;
				end if;
			end if;
		end if;
	end process;
	monwdat<=MONLt when MONHt='0' else MONLt+x"a";

	rdat<=	SECL		when addr=x"0" and BNKSEL='0' else
			'0' & SECH	when addr=x"1" and BNKSEL='0' else
			MINL		when addr=x"2" and BNKSEL='0' else
			'0' & MINH	when addr=x"3" and BNKSEL='0' else
			HORL		when addr=x"4" and BNKSEL='0' else
			"00" & HORH	when addr=x"5" and BNKSEL='0' else
			'0' & WDAY	when addr=x"6" and BNKSEL='0' else
			DAYL		when addr=x"7" and BNKSEL='0' else
			"00" & DAYH	when addr=x"8" and BNKSEL='0' else
			MON			when MON<x"a" and addr=x"9" and BNKSEL='0' else
			MON-x"a"	when addr=x"9" and BNKSEL='0' else
			x"0"		when MON<x"a" and addr=x"a" and BNKSEL='0' else
			x"1"		when addr=x"a" and BNKSEL='0' else
			YEL			when addr=x"b" and BNKSEL='0' else
			YEH			when addr=x"c" and BNKSEL='0' else
			"000" & BNKSEL when addr=x"d" else
			RESET		when addr=x"f" else
			x"0";

end rtl;

