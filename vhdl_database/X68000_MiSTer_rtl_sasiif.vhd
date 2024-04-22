library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity sasiif is
generic(
	inirstwait	:integer	:=10;
	rstlen		:integer	:=100
);
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(1 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	wdat	:in std_logic_vector(7 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	doe		:out std_logic;
	int		:out std_logic;
	iack	:in std_logic;
	drq		:out std_logic;
	dack	:in std_logic;
	iowait	:out std_logic;
	
	IDAT	:in std_logic_vector(7 downto 0);
	ODAT	:out std_logic_vector(7 downto 0);
	ODEN	:out std_logic;
	SEL		:out std_logic;
	BSY		:in std_logic;
	REQ		:in std_logic;
	ACK		:out std_logic;
	IO		:in std_logic;
	CD		:in std_logic;
	MSG		:in std_logic;
	RST		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end sasiif;

architecture rtl of sasiif is
signal	iowdat	:std_logic_vector(7 downto 0);
signal	CMDWR	:std_logic;
signal	CMDRD	:std_logic;
signal	DMACLR:std_logic;
signal	IDWR	:std_logic;
signal	IDCLR	:std_logic;
signal	BUSRST	:std_logic;
signal	adrwr,ladrwr	:std_logic_vector(3 downto 0);
signal	adrrd,ladrrd	:std_logic_vector(3 downto 0);
signal	RDDAT_DAT	:std_logic_vector(7 downto 0);
signal	RDDAT_STA	:std_logic_vector(7 downto 0);
signal	ACKb,lACK	:std_logic;
signal	sREQ,lREQ	:std_logic;
signal	SELb		:std_logic;
signal	HSwait		:std_logic;
signal	inirst		:std_logic;

type initstate_t is (
	is_init,
	is_reset,
	is_idle
);
signal	initstate	:initstate_t;

type state_t	is(
	st_IDLE,
	st_SEL,
	st_SELA,
	st_CMD,
	st_EXEC,
	st_STA,
	st_MSG
);
signal	STATE	:state_t;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ladrwr<=(others=>'0');
				iowdat<=(others=>'0');
				ladrrd<=(others=>'0');
			elsif(ce = '1')then
				ladrwr<=adrwr;
				ladrrd<=adrrd;
				if(cs='1' and wr='1')then
					iowdat<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(cs,rd,wr,addr)begin
		if(cs='1' and wr='1')then
			case addr is
			when "00" =>
				adrwr<="0001";
			when "01" =>
				adrwr<="0010";
			when "10" =>
				adrwr<="0100";
			when "11" =>
				adrwr<="1000";
			when others =>
				adrwr<="0000";
			end case;
		else
			adrwr<="0000";
		end if;
		if(cs='1' and rd='1')then
			case addr is
			when "00" =>
				adrrd<="0001";
			when "01" =>
				adrrd<="0010";
			when "10" =>
				adrrd<="0100";
			when "11" =>
				adrrd<="1000";
			when others =>
				adrrd<="0000";
			end case;
		else
			adrrd<="0000";
		end if;
	end process;
	
	process(clk,rstn)
	variable wcount	:integer range 0 to inirstwait-1;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				initstate<=is_init;
				wcount:=inirstwait-1;
				inirst<='0';
			elsif(ce = '1')then
				inirst<='0';
				case initstate is
				when is_init =>
					if(wcount>0)then
						wcount:=wcount-1;
					else
						initstate<=is_reset;
					end if;
				when is_reset =>
					inirst<='1';
					initstate<=is_idle;
				when is_idle =>
				when others =>
				end case;
			end if;
		end if;
	end process;
	
	IDWR<=	'1' when adrwr(3)='0' and ladrwr(3)='1' else '0';
	BUSRST<=	'1' when adrwr(2)='0' and ladrwr(2)='1' else '1' when inirst='1' else '0';
	IDCLR<=	'1' when adrwr(1)='0' and ladrwr(1)='1' else '0';
	CMDWR<=	'1' when adrwr(0)='0' and ladrwr(0)='1' else '0';
	CMDRD<=	'1' when adrrd(0)='0' and ladrrd(0)='1' else '0';
	DMACLR<=	'1' when adrwr(0)='1' or adrrd(0)='1' else '0';
	
	process(clk,rstn)
	variable lencount	:integer range 0 to rstlen-1;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				lencount:=0;
				RST<='0';
			elsif(ce = '1')then
				if(BUSRST='1')then
					RST<='1';
					lencount:=rstlen-1;
				elsif(lencount>0)then
					lencount:=lencount-1;
				else
					RST<='0';
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				drq<='0';
				--lACK<='0';
				sREQ<='0';
				lREQ<='0';
				HSwait<='0';
			else
				lREQ<=sREQ;
				sREQ<=REQ;
				--lACK<=ACKb;
				if(BUSRST='1')then
					drq<='0';
					HSwait<='0';
				elsif(sREQ='1' and lREQ='0')then
					drq<='1';
				elsif(DMACLR='1')then
					drq<='0';
				elsif(CMDRD='1' or CMDWR='1')then
					HSwait<='1';
				elsif(sREQ='0')then
					HSwait<='0';
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				STATE<=st_IDLE;
			elsif(ce = '1')then
				if(BUSRST='1')then
					STATE<=st_IDLE;
				else
					case STATE is
					when st_IDLE =>
						if(SELb='1')then
							STATE<=st_SEL;
						end if;
					when st_SEL =>
						if(BSY='1')then
							STATE<=st_SELA;
						elsif(SELb='0')then
							STATE<=st_IDLE;
						end if;
					when st_SELA =>
						if(CD='1')then
							STATE<=st_CMD;
						end if;
					when st_CMD =>
						if(CD='0')then
							STATE<=st_EXEC;
						end if;
					when st_EXEC =>
						if(CD='1')then
							STATE<=st_STA;
						end if;
					when st_STA =>
						if(CMDRD='1')then
							STATE<=st_MSG;
						end if;
					when st_MSG =>
						if(BSY='0')then
							STATE<=st_IDLE;
						end if;
					when others =>
						STATE<=st_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;
	
	RDDAT_STA<=	"000" & MSG & CD & IO & BSY & sREQ;
	rdat<=	IDAT when adrrd="0001" else
			RDDAT_STA when adrrd="0010" else
			(others=>'0');
	
	doe<=	'1' when adrrd="0001" else
			'1' when adrrd="0010" else
			'0';
	int<='1' when STATE=st_STA else '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ACKb<='0';
			elsif(ce = '1')then
				if(BUSRST='1')then
					ACKb<='0';
				elsif(CMDWR='1' or CMDRD='1')then
					ACKb<='1';
				elsif(sREQ='0')then
					ACKb<='0';
				end if;
			end if;
		end if;
	end process;
	ACK<=ACKb;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				SELb<='0';
			elsif(ce = '1')then
				if(BUSRST='1')then
					SELb<='0';
				elsif(IDWR='1')then
					SELb<='1';
				elsif(IDCLR='1')then
					SELb<='0';
				end if;
			end if;
		end if;
	end process;
	SEL<=SELb;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ODAT<=(others=>'0');
				ODEN<='0';
			elsif(ce = '1')then
				if(BUSRST='1')then
					ODAT<=(others=>'0');
					ODEN<='0';
				elsif(IDWR='1')then
					ODAT<=iowdat;
					ODEN<='1';
				elsif(IDCLR='1')then
					ODAT<=iowdat;
					ODEN<='0';
				elsif(IO='1')then
					ODAT<=(others=>'0');
					ODEN<='0';
				elsif(CMDWR='1')then
					ODAT<=iowdat;
					ODEN<='1';
				elsif(CMDRD='1')then
					ODAT<=(others=>'0');
					ODEN<='0';
				end if;
			end if;
		end if;
	end process;

	iowait<=HSwait when cs='1' else '0';

end rtl;
