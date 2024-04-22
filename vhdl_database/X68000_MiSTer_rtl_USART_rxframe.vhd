library IEEE,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity rxframe is
	generic(
		maxlen 	:integer	:=8;
		maxwid	:integer	:=4
	);
	port(
		SD		:in std_logic;	-- serial data input
		
		SFT		:in std_logic;	-- shift enable signal
		WIDTH	:in std_logic_vector(maxwid-1 downto 0);	-- 1bit width of serial
		LEN		:in integer range 1 to maxlen;
		
		DATA	:out std_logic_Vector(maxlen-1 downto 0);	--received data
		DONE	:out std_logic;	-- received

		BUSY	:out std_logic;
		STOPERR	:out std_logic;	-- stop error detect
		SFTRST	:in std_logic;	-- stop receive and reset
				
		clk		:in std_logic;	-- system clock
		ce      :in std_logic := '1';
		rstn	:in std_logic	-- system reset
	);
end rxframe;

architecture rtl of rxframe is
signal	BITCNT	:integer range 0 to maxlen+1;	-- bit number counter
signal	SFTBUF	:std_logic_vector(maxlen-1 downto 0);	-- serial shift buffer
signal	WCNT	:std_logic_vector(maxwid-1 downto 0);	-- 1bit width counter
signal	WSTART	:std_logic;				-- start bit waiting
signal	SDtr	:std_logic;				-- digital filtered SD signal
constant widzero	:std_logic_vector(maxwid-1 downto 0)	:=(others=>'0');
constant widone		:std_logic_vector(maxwid-1 downto 0)	:=widzero(maxwid-1 downto 1) & '1';
component TWICEREAD --FIXME: Unused
	port(
		D	:in std_logic;
		Q	:out std_logic;

		clk	:in std_logic;
		rstn :in std_logic
	);
end component;
begin

--	SDT	:TWICEREAD port map(SD,SDtr,clk,rstn);	-- digital filter(twice reading)
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				SDtr<='1';
			elsif(ce = '1')then
				SDtr<=SD;
			end if;
		end if;
	end process;

	process(clk,rstn)
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				BITCNT<=0;
				SFTBUF<=(others=>'0');
				WSTART<='1';
				WCNT<=(others=>'0');
				STOPERR<='0';
				DONE<='0';
				DATA<=(others=>'0');
			elsif(ce = '1')then
				DONE<='0';
				STOPERR<='0';
				if(SFTRST='1')then		-- SYNC error detected
					BITCNT<=0;			-- buffer clear
					SFTBUF<=(others=>'0');
					WSTART<='1';
					WCNT<=(others=>'0');
				elsif(SFT='1')then
					if(WCNT=widzero)then	-- shift timing
						if(WSTART='1')then
							if(SDtr='1')then --is STOP bit
								WSTART<='1';
							else	-- START detect
								WSTART<='0';	-- no waiting start bit
								SFTBUF<=(others=>'0');	-- receive buffer clear
								if(WIDTH=widzero)then
									WCNT(maxwid-1)<='1';	-- half of 1 bit width delay(bit center detect)
								else
									WCNT(maxwid-1)<='0';
								end if;
								if(WIDTH=widone)then
									WCNT(maxwid-2 downto 0)<=widzero(maxwid-2 downto 0);
									BITCNT<=len;		-- last 9 bit
								else
									WCNT(maxwid-2 downto 0)<=(WIDTH(maxwid-1 downto 1)-1);
									BITCNT<=len+1;		-- last 9 bit
								end if;
							end if;
						else
							if(BITCNT=0)then	-- received full bit
								if(SDtr='0')then	--stop error
									STOPERR<='1';
									DATA<=SFTBUF;
									WSTART<='1';
								else			-- receive success
									DONE<='1';
									DATA<=SFTBUF;
									WSTART<='1';
								end if;
							else	
								SFTBUF(maxlen-2 downto 0)<=SFTBUF(maxlen-1 downto 1);	-- receive data shift
								SFTBUF(len-1)<=SDtr;
								WCNT<=WIDTH-1; 	-- full width wait
							end if;
							BITCNT<=BITCNT-1;	-- next bit
						end if;
					else
						WCNT<=WCNT-1;
					end if;
				end if;
			end if;
		end if;
	end process;
	BUSY<=not WSTART;
end rtl;
