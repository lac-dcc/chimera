LIBRARY	IEEE,work;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
	use ieee.std_logic_arith.all;
	use work.envelope_pkg.all;

entity envcont is
generic(
	totalwidth	:integer	:=20
);
port(
	KEY		:in std_logic;
	AR		:in std_logic_vector(4 downto 0);
	DR		:in std_logic_vector(4 downto 0);
	SLlevel	:in std_logic_vector(15 downto 0);
	RR		:in std_logic_vector(3 downto 0);
	SR		:in std_logic_vector(4 downto 0);
	
	CURSTATE	:in envstate_t;
	NXTSTATE	:out envstate_t;
	
	CURLEVEL	:in std_logic_vector(totalwidth-1 downto 0);
	NXTLEVEL	:out std_logic_vector(totalwidth-1 downto 0)
);

end envcont;

architecture rtl of envcont is
signal	SLEVEL	:std_logic_vector(totalwidth downto 0);
begin
	
	SLEVEL(totalwidth downto totalwidth-16)<='0' & SLlevel;
	SLEVEL(totalwidth-17 downto 0)<=(others=>'1');

	process(KEY,AR,DR,SLEVEL,RR,SR,CURSTATE,CURLEVEL)
	variable venvlev	:std_logic_vector(totalwidth downto 0);
	variable adddat		:std_logic_vector(totalwidth downto 0);
	variable ival		:integer range 0 to 15;
	begin
		NXTSTATE<=CURSTATE;
		if(KEY='1')then
			case CURSTATE is
			when es_OFF | es_Rel =>
				NXTSTATE<=es_Atk;
				NXTLEVEL<=(others=>'0');
			when es_Atk =>
				if(AR="00000")then
					adddat(totalwidth):='0';adddat(totalwidth-1 downto 0):=(others=>'1');
				else
					adddat:=(others=>'0');
					ival:=conv_integer(AR(4 downto 1));
					case CURLEVEL(totalwidth-1 downto totalwidth-3)is
					when "000" | "001" | "010" | "011" =>
						adddat(ival+4):='1';
						if(AR(0)='1')then
							adddat(ival+3):='1';
						end if;
					when "100" | "101" =>
						adddat(ival+3):='1';
						if(AR(0)='1')then
							adddat(ival+2):='1';
						end if;
					when "110" =>
						adddat(ival+2):='1';
						if(AR(0)='1')then
							adddat(ival+1):='1';
						end if;
					when others =>
						adddat(ival+1):='1';
						if(AR(0)='1')then
							adddat(ival+0):='1';
						end if;
					end case;
				end if;
				venvlev:=('0' & CURLEVEL) + adddat;
				if(venvlev(totalwidth)='1')then
					NXTLEVEL<=(others=>'1');
					NXTSTATE<=es_Dec;
				else
					NXTLEVEL<=venvlev(totalwidth-1 downto 0);
				end if;
			when es_Dec =>
				ival:=conv_integer(DR(4 downto 1));
				adddat:=(others=>'0');
				if(DR/="00000")then
					adddat(ival+1):='1';
					if(DR(0)='1')then
						adddat(ival):='1';
					end if;
				end if;
				venvlev:=('0' & CURLEVEL)-adddat;
				if(venvlev(totalwidth)='1' or venvlev<SLEVEL)then
					NXTLEVEL<=SLEVEL(totalwidth-1 downto 0);
					NXTSTATE<=es_Sus;
				else
					NXTLEVEL<=venvlev(totalwidth-1 downto 0);
				end if;
			when es_Sus =>
				ival:=conv_integer(SR(4 downto 1));
				adddat:=(others=>'0');
				if(SR/="00000")then
					adddat(ival+1):='1';
					if(SR(0)='1')then
						adddat(ival):='1';
					end if;
				end if;
				venvlev:=('0' & CURLEVEL) - adddat;
				if(venvlev(totalwidth)='1')then
					NXTLEVEL<=(others=>'0');
				else
					NXTLEVEL<=venvlev(totalwidth-1 downto 0);
				end if;
			when others =>
				NXTLEVEL<=(others=>'0');
				NXTSTATE<=es_OFF;
			end case;
		else
			case CURSTATE is
			when es_OFF =>
				NXTLEVEL<=(others=>'0');
			when others =>
				ival:=conv_integer(RR);
				adddat:=(others=>'0');
				adddat(ival):='1';
				venvlev:=('0' & CURLEVEL) - adddat;
				if(venvlev(totalwidth)='1')then
					NXTLEVEL<=(others=>'0');
					NXTSTATE<=es_OFF;
				else
					NXTLEVEL<=venvlev(totalwidth-1 downto 0);
					NXTSTATE<=es_Rel;
				end if;
			end case;
		end if;
	end process;
	
end rtl;
		
	