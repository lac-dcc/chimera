library IEEE,work;
use IEEE.std_logic_1164.all;

entity CRCGENN is
	generic(
		DATWIDTH :integer	:=10;
		WIDTH	:integer	:=3
	);
	port(
		POLY	:in std_logic_vector(WIDTH downto 0);
		DATA	:in std_logic_vector(DATWIDTH-1 downto 0);
		DIR		:in std_logic;
		WRITE	:in std_logic;
		BITIN	:in std_logic;
		BITWR	:in std_logic;
		CLR		:in std_logic;
		CLRDAT	:in std_logic_vector(WIDTH-1 downto 0);
		CRC		:out std_logic_vector(WIDTH-1 downto 0);
		BUSY	:out std_logic;
		DONE	:out std_logic;
		CRCZERO	:out std_logic;

		clk		:in std_logic;
		ce      :in std_logic := '1';
		rstn	:in std_logic
	);
end CRCGENN;

architecture MAIN of CRCGENN is
signal	CRCbuf	:std_logic_vector(WIDTH-1 downto 0);
signal	CRCdir	:std_logic_vector(WIDTH-1 downto 0);
signal	CLRDATdir:std_logic_vector(WIDTH-1 downto 0);
signal	DATbuf	:std_logic_vector(DATWIDTH-1 downto 0);
signal	COUNT	:integer range 0 to DATWIDTH;
signal	BUSYbuf	:std_logic;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				CRCbuf<=(others=>'0');
				DATbuf<=(others=>'0');
				COUNT<=0;
				DONE<='0';
				BUSYbuf<='0';
			elsif(ce = '1')then
				DONE<='0';
				if(CLR='1')then
					CRCbuf<=CLRDATdir;
					COUNT<=0;
				else
					if(COUNT>0)then
						for i in 0 to WIDTH-2 loop
							if(POLY(i+1)='1')then
								CRCbuf(i)<=CRCbuf(i+1) xor CRCbuf(0) xor DATbuf(0);
							else
								CRCbuf(i)<=CRCbuf(i+1);
							end if;
						end loop;
						CRCbuf(WIDTH-1)<=(DATbuf(0) and POLY(WIDTH)) xor CRCbuf(0);
						COUNT<=COUNT-1;
						DATbuf(DATWIDTH-2 downto 0)<=DATbuf(DATWIDTH-1 downto 1);
						DATbuf(DATWIDTH-1)<='0';
						if(COUNT=1)then
							DONE<='1';
							BUSYbuf<='0';
						end if;
					end if;
				end if;
				if(WRITE='1')then
					if(DIR='1')then
						DATbuf<=DATA;
					else
						for i in 0 to DATWIDTH-1 loop
							DATbuf(i)<=DATA(DATWIDTH-i-1);
						end loop;
					end if;
					COUNT<=DATWIDTH;
					BUSYbuf<='1';
				elsif(BITWR='1')then
					DATbuf(DATWIDTH-1 downto 1)<=(others=>'0');
					DATbuf(0)<=BITIN;
					COUNT<=1;
					BUSYbuf<='1';
				end if;
			end if;
		end if;
	end process;

	process(CRCbuf, CLRDAT)begin
		for i in 0 to WIDTH-1 loop
			CRCdir(i)<=CRCbuf(WIDTH-i-1);
			CLRDATdir(i)<=CLRDAT(WIDTH-i-1);
		end loop;
	end process;

	CRC<=CRCbuf when DIR='1' else CRCdir;
	BUSY<=BUSYbuf or WRITE or BITWR;
	
	process(CRCbuf)
	variable tmp	:std_logic;
	begin
		tmp:='0';
		for i in 0 to WIDTH-1 loop
			tmp:=tmp or CRCbuf(i);
		end loop;
		CRCZERO<=not tmp;
	end process;
end MAIN;
		