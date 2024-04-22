LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dskchk2d is
generic(
	sysclk	:integer	:=20000;	--system clock(kHz)	20000
	chkint	:integer	:=300;		--check interval(msec)
	signwait:integer	:=1;		--signal wait length(usec)
	datwait	:integer	:=10;		--data wait length(usec)
	motordly:integer	:=500		--motor rotate delay(msec)
);
port(
	FDC_USELn	:in std_logic_vector(1 downto 0);
	FDC_BUSY	:in std_logic;
	FDC_MOTORn	:in std_logic_vector(1 downto 0);
	FDC_DIRn	:in std_logic;
	FDC_STEPn	:in std_logic;
	FDC_READYn	:out std_logic;
	FDC_WAIT	:out std_logic;

	FDD_USELn	:out std_logic_vector(1 downto 0);
	FDD_MOTORn	:out std_logic_vector(1 downto 0);
	FDD_DATAn	:in std_logic;
	FDD_INDEXn	:in std_logic;
	FDD_DSKCHGn	:in std_logic;
	FDD_DIRn	:out std_logic;
	FDD_STEPn	:out std_logic;

	driveen		:in std_logic_vector(1 downto 0)	:=(others=>'1');
	f_eject		:in std_logic_vector(1 downto 0)	:=(others=>'0');

	indisk		:out std_logic_vector(1 downto 0);

	hmssft		:in std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end dskchk2d;

architecture rtl of dskchk2d is
type state_t is(
	st_IDLE,
	st_DCWAIT,
	st_DCCHK,
	st_DATCHK,
	st_STEP0,
	st_STEP1,
	st_STEP2,
	st_STEP3,
	st_STEP4,
	st_STEP5,
	st_STEP6,
	st_STEP7
);
signal	state	:state_t;
signal	cur_unit	:integer range 0 to 1;
signal	CONT_USEL	:std_logic_vector(1 downto 0);
signal	CONT_MOTOR	:std_logic_vector(1 downto 0);
signal	CONT_DIR	:std_logic;
signal	CONT_STEP	:std_logic;
signal	wait_count	:integer range 0 to (sysclk*chkint)-1;
signal	BUSY		:std_logic;
signal	indiskb		:std_logic_vector(1 downto 0);
signal	indiske		:std_logic_vector(1 downto 0);
signal	INDEXn,DATAn:std_logic;
signal	MOTOREN		:std_logic_vector(1 downto 0);
signal	mssft		:std_logic;

component delayon
generic(
	delay	:integer	:=100
);
port(
	delayin	:in std_logic;
	delayout:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin

	process(clk)begin
		if rising_edge(clk) then
			if(ce = '1')then
				INDEXn<=FDD_INDEXn;
				DATAn<=FDD_DATAn;
			end if;
		end if;
	end process;

	process(clk,rstn)
	variable sel	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				sel:='0';
				mssft<='0';
			elsif(ce = '1')then
				mssft<='0';
				if(hmssft='1')then
					if(sel='0')then
						sel:='1';
					else
						mssft<='1';
						sel:='0';
					end if;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				state<=st_IDLE;
				wait_count<=(sysclk*chkint)-1;
				cur_unit<=1;
				indiskb<=(others=>'0');
				CONT_DIR<='1';
				CONT_STEP<='1';
				CONT_MOTOR<=(others=>'0');
			elsif(ce = '1')then
				case state is
				when st_IDLE =>
					if(FDC_BUSY='1')then
						wait_count<=(sysclk*chkint)-1;
					else
						if(wait_count=0)then
							if(cur_unit=1)then
								cur_unit<=0;
							else
								cur_unit<=cur_unit+1;
							end if;
							wait_count<=(signwait*sysclk/1000)-1;
							state<=st_DCWAIT;
						else
							wait_count<=wait_count-1;
						end if;
					end if;
				when st_DCWAIT =>
					if(driveen(cur_unit)='0')then
						indiskb(cur_unit)<='0';
						wait_count<=(sysclk*chkint)-1;
						state<=st_IDLE;
					else
						if(wait_count>0)then
							wait_count<=wait_count-1;
						else
							state<=st_DCCHK;
						end if;
					end if;
				when st_DCCHK =>
					if(FDD_DSKCHGn='1')then
						indiskb(cur_unit)<='1';
						CONT_MOTOR(cur_unit)<='0';
						wait_count<=(sysclk*chkint)-1;
						state<=st_IDLE;
					else
						CONT_MOTOR(cur_unit)<='1';
						wait_count<=(datwait*sysclk/1000)-1;
						state<=st_DATCHK;
					end if;
				when st_DATCHK =>
					if(DATAn='0' or INDEXn='0')then
						state<=st_STEP0;
					else
						if(wait_count>0)then
							wait_count<=wait_count-1;
						else
							indiskb(cur_unit)<='0';
							wait_count<=(sysclk*chkint)-1;
							state<=st_IDLE;
						end if;
					end if;
				when st_STEP0 =>
					if(mssft='1')then
						CONT_DIR<='1';
						state<=st_STEP1;
					end if;
				when st_STEP1 =>
					if(mssft='1')then
						CONT_STEP<='0';
						state<=st_STEP2;
					end if;
				when st_STEP2 =>
					if(mssft='1')then
						CONT_STEP<='1';
						state<=st_STEP3;
					end if;
				when st_STEP3 =>
					if(mssft='1')then
						CONT_DIR<='0';
						state<=st_STEP4;
					end if;
				when st_STEP4 =>
					if(mssft='1')then
						CONT_STEP<='0';
						state<=st_STEP5;
					end if;
				when st_STEP5 =>
					if(mssft='1')then
						CONT_STEP<='1';
						CONT_DIR<='1';
						indiskb(cur_unit)<='1';
						wait_count<=(sysclk*chkint)-1;
						CONT_MOTOR(cur_unit)<='0';
						state<=st_IDLE;
					end if;
				when others =>
					state<=st_IDLE;
				end case;
			end if;
		end if;
	end process;

	BUSY<='0' when state=st_IDLE else '1';
	FDC_WAIT<=BUSY;

	FDD_STEPn<=	FDC_STEPn when BUSY='0' else CONT_STEP;
	FDD_DIRn<=	FDC_DIRn  when BUSY='0' else CONT_DIR;
	FDD_USELn<=	"10" when BUSY='0' and FDC_USELn="10" and FDC_BUSY='1' else
				"01" when BUSY='0' and FDC_USELn="01" and FDC_BUSY='1' else
				"10" when BUSY='1' and cur_unit=0 else
				"01" when BUSY='1' and cur_unit=1 else
				"11";
	FDD_MOTORn<=	FDC_MOTORn and (not CONT_MOTOR);

	process(clk,rstn)
	variable lindisk	:std_logic_vector(1 downto 0);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				indiske<=(others=>'0');
				lindisk:=(others=>'0');
			elsif(ce = '1')then
				for i in 0 to 1 loop
					if(lindisk(i)='0' and indiskb(i)='1')then
						indiske(i)<='1';
					elsif(lindisk(i)='1' and indiskb(i)='0')then
						indiske(i)<='0';
					elsif(f_eject(i)='1')then
						indiske(i)<='0';
					end if;
				end loop;
				lindisk:=indiskb;
			end if;
		end if;
	end process;

	delay0	:delayon generic map(sysclk*motordly) port map(not FDC_MOTORn(0),MOTOREN(0),clk,ce,rstn);
	delay1	:delayon generic map(sysclk*motordly) port map(not FDC_MOTORn(1),MOTOREN(1),clk,ce,rstn);

	FDC_READYn<=	not (indiske(0) and MOTOREN(0)) when FDC_USELn="10" else
					not (indiske(1) and MOTOREN(1)) when FDC_USELn="01" else
					'1';

	indisk<=indiske;

end rtl;

