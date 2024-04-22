library IEEE,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity txframe	is
	generic(
		maxlen	:integer	:=8;		--max bits/frame
		maxwid	:integer	:=4			--max bit/clock
	);
	port(
		SD		:out std_logic;		-- serial data output
		DRCNT	:out std_logic;		-- driver control signal

		SFT		:in std_logic;		-- shift enable signal
		WIDTH	:in std_logic_vector(maxwid-1 downto 0);	-- 1bit width of serial
		LEN		:in integer range 1 to maxlen;		--bits/frame
		STPLEN	:in integer range 1 to 4;			--stop bit length*2
		
		DATA	:in std_logic_vector(maxlen-1 downto 0);	-- transmit data input
		WRITE	:in std_logic;		-- transmit write signal(start)
		BUFEMP	:out std_logic;		-- transmit buffer empty signal
		
		clk		:in std_logic;		-- system clock
		ce      :in std_logic := '1';
		rstn	:in std_logic		-- system reset
	);
end txframe;

architecture rtl of txframe is
signal	SFTBUF	:std_logic_vector(MAXLEN+1 downto 0);	-- reansmit shift buffer
signal	WCNT	:std_logic_vector(MAXWID-1 downto 0);	-- 1bit width counter
signal	NXTBUF	:std_logic_vector(MAXLEN-1 downto 0);	-- transmit buffer
signal	BITCNT	:integer range 0 to MAXLEN+1;			-- bit number counter
signal	EXDATA	:std_logic;						-- transmit buffer full
constant widzero	:std_logic_vector(maxwid-1 downto 0)	:=(others=>'0');
begin

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				NXTBUF<=(others=>'0');
				EXDATA<='0';
				SFTBUF<=(others=>'0');
				BITCNT<=0;
				SD<='1';
				DRCNT<='0';
				WCNT<=(others=>'0');
			elsif(ce = '1')then
				if(WRITE='1' and EXDATA='0')then	-- write to buffer
					NXTBUF<=DATA;
					EXDATA<='1';
				end if;
	
				if(SFT='1')then
					if((WCNT=widzero) or (BITCNT<STPLEN and WCNT(maxwid-1)='0' and WCNT(maxwid-2 downto 0)=WIDTH(maxwid-1 downto 1)))then
						if(BITCNT=0)then	-- shift register empty
							if(EXDATA='1')then
								SFTBUF(maxlen downto 1)<=NXTBUF;	--data
								SFTBUF(LEN+1)<='1';	-- stop
								SFTBUF(0)<='0';	-- start
								BITCNT<=LEN+STPLEN;		-- last n bit
								EXDATA<='0';	-- buffer empty
								WCNT<=WIDTH-1;
								DRCNT<='1';		-- transmitting
								SD<='0';		-- start bit output
							else
								DRCNT<='0';		-- no transmitting
							end if;
						else
							SD<=SFTBUF(1);	-- shift the register
							SFTBUF(maxlen downto 0)<=SFTBUF(maxlen+1 downto 1);
							SFTBUF(LEN)<='1';
							BITCNT<=BITCNT-1;
							WCNT<=WIDTH-1;
						end if;
					else
						WCNT<=WCNT-1;
					end if;
				end if;
			end if;
		end if;
	end process;

	BUFEMP<=(not EXDATA) and (not WRITE);
	
end rtl;