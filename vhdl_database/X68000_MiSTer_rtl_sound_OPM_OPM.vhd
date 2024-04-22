LIBRARY	IEEE,work;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
	use ieee.std_logic_arith.all;
	use work.envelope_pkg.all;

entity OPM is
generic(
	res		:integer	:=9
);
port(
	DIN		:in std_logic_vector(7 downto 0);
	DOUT	:out std_logic_vector(7 downto 0);
	DOE		:out std_logic;
	CSn		:in std_logic;
	ADR0	:in std_logic;
	RDn		:in std_logic;
	WRn		:in std_logic;
	INTn	:out std_logic;
	
	sndL	:out std_logic_vector(res-1 downto 0);
	sndR	:out std_logic_vector(res-1 downto 0);
	
	CT1		:out std_logic;
	CT2		:out std_logic;
	
	chenable:in std_logic_vector(7 downto 0)	:=(others=>'1');
	monout	:out std_logic_vector(15 downto 0);
	op0out	:out std_logic_vector(15 downto 0);
	op1out	:out std_logic_vector(15 downto 0);
	op2out	:out std_logic_vector(15 downto 0);
	op3out	:out std_logic_vector(15 downto 0);

	fmclk	:in std_logic;
	pclk	:in std_logic;
	rstn	:in std_logic
);
end OPM;

architecture rtl of OPM is
component OPNREG
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

component sintbl
port(
	addr	:in std_logic_vector(15 downto 0);
	
	dat		:out std_logic_vector(15 downto 0);

	clk		:in std_logic
);
end component;

component TLtbl
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component muls16xu16
port(
	ins		:in std_logic_vector(15 downto 0);
	inu		:in std_logic_vector(15 downto 0);
	
	q		:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic
);
end component;

component KEY2FNUM
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
END component;

component envcont
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

end component;

component  fmparram
generic(
	CHANNELS	:integer	:=8;
	SLOTS		:integer	:=4;
	PARWIDTH	:integer	:=5
);
port(
	wrchannel	:in integer range 0 to CHANNELS-1;
	wrslot		:in integer range 0 to SLOTS-1;
	wrdat		:in std_logic_vector(PARWIDTH-1 downto 0);
	wr			:in std_logic;
	clkw		:in std_logic;
	
	rdchannel	:in integer range 0 to CHANNELS-1;
	rdslot		:in integer range 0 to SLOTS-1;
	rddat		:out std_logic_vector(PARWIDTH-1 downto 0);
	clkr		:in std_logic
);
end component;

component OPMcreg
port(
	wrchannel	:in integer range 0 to 7;
	wrdat		:in std_logic_vector(7 downto 0);
	wrdatno		:in integer range 0 to 3;
	wr			:in std_logic;
	busy		:out std_logic;
	
	rdchannel	:in integer range 0 to 7;
	rddat0		:out std_logic_vector(7 downto 0);
	rddat1		:out std_logic_vector(7 downto 0);
	rddat2		:out std_logic_vector(7 downto 0);
	rddat3		:out std_logic_vector(7 downto 0);
	
	clkr		:in std_logic;
	clkw		:in std_logic;
	rstn		:in std_logic
);
end component;

component OPMsreg
port(
	wrchannel	:in integer range 0 to 7;
	wrslot		:in integer range 0 to 3;
	wrdat		:in std_logic_vector(7 downto 0);
	wrdatno		:in integer range 0 to 5;
	wr			:in std_logic;
	busy		:out std_logic;
	
	rdchannel	:in integer range 0 to 7;
	rdslot		:in integer range 0 to 3;
	rddat0		:out std_logic_vector(7 downto 0);
	rddat1		:out std_logic_vector(7 downto 0);
	rddat2		:out std_logic_vector(7 downto 0);
	rddat3		:out std_logic_vector(7 downto 0);
	rddat4		:out std_logic_vector(7 downto 0);
	rddat5		:out std_logic_vector(7 downto 0);
	
	clkr		:in std_logic;
	clkw		:in std_logic;
	rstn		:in std_logic
);
end component;

component addsat
generic(
	datwidth	:integer	:=16
);
port(
	INA		:in std_logic_vector(datwidth-1 downto 0);
	INB		:in std_logic_vector(datwidth-1 downto 0);
	
	OUTQ	:out std_logic_vector(datwidth-1 downto 0);
	OFLOW	:out std_logic;
	UFLOW	:out std_logic
);
end component;

signal	WRCHANNEL	:integer range 0 to 7;
signal	WRSLOT		:integer range 0 to 3;
signal	REGWR		:std_logic;
signal	CPU_RADR	:std_logic_Vector(7 downto 0);
signal	CPU_WDAT	:std_logic_Vector(7 downto 0);
signal	C0regwr,C1regwr,C2regwr,C3regwr	:std_logic;
signal	S0regwr,S1regwr,S2regwr,S3regwr,S4regwr,S5regwr	:std_logic;
signal	CWRNO	:integer range 0 to 3;
signal	SWRNO	:integer range 0 to 5;
signal	Cregwr,Sregwr	:std_logic;
signal	C0RDAT,C1RDAT,C2RDAT,C3RDAT	:std_logic_vector(7 downto 0);
signal	S0RDAT,S1RDAT,S2RDAT,S3RDAT,S4RDAT,S5RDAT	:std_logic_vector(7 downto 0);
signal	DINL	:std_logic_vector(7 downto 0);

signal	STATUS		:std_logic_vector(7 downto 0);
signal	BUSY		:std_logic;
signal	BUSYC,BUSYS,BUSYR	:std_logic;
signal	FLAG		:std_logic_vector(1 downto 0);
signal	TARST,TBRST	:std_logic;
signal	TAEN,TBEN	:std_logic;
signal	TALD,TBLD	:std_logic;
signal	TARDAT,TACOUNT		:std_logic_vector(9 downto 0);
signal	TBRDAT,TBCOUNT		:std_logic_vector(7 downto 0);
signal	LFORESET	:std_logic;
signal	NOISEEN		:std_logic;
signal	NOISEFREQ	:std_logic_vector(4 downto 0);
signal	LFOFREQ		:std_logic_vector(7 downto 0);
signal	LFOSEL		:std_logic_vector(1 downto 0);
signal	PMD,AMD		:std_logic_vector(6 downto 0);

signal	CHANNELNO	:integer range 0 to 7;
signal	SLOTNO		:integer range 0 to 3;

constant fslength	:integer	:=256;
signal	fscount		:integer range 0 to fslength-1;
signal	sft			:std_logic;
signal	fmsft		:std_logic;

signal	thitard,thitawd
					:std_logic_vector(15 downto 0);
signal	thitawr			:std_logic;
signal	elevrd,elevwd	:std_logic_vector(19 downto 0);
signal	elevwr			:std_logic;
signal	sin1a,sin2a,sin3a
					:std_logic_vector(15 downto 0);
signal	ooutrd,ooutwd
				:std_logic_vector(15 downto 0);
signal	ooutwr		:std_logic;
signal	toutx0,toutx1,toutx2,toutx3,
		toutc		:std_logic_vector(15 downto 0);
signal	coout		:std_logic_vector(15 downto 0);
signal	envsin	:std_logic_vector(15 downto 0);

signal	cenvst,nenvst	:envstate_t;

type FMSTATE_t is (
	FS_IDLE,
	FS_TIMER,
	FS_SLOTS,
	FS_MIX
);
signal	FMSTATE	:FMSTATE_t;
signal	intbgn	:std_logic;
signal	intend	:std_logic;
signal	thita	:std_logic_vector(15 downto 0);
signal	sinthita:std_logic_vector(15 downto 0);

type INTST_t is(
	IS_IDLE,
	IS_CALCFNUM,
	IS_CALCTHITA,
	IS_CALCENV,
	IS_CALCTL,
	IS_WAIT,
	IS_CMIX
);
signal	INTST	:INTST_t;
signal	TBPS	:integer range 0 to 15;

subtype KEY_TYPE is std_logic_vector(3 downto 0);
type KEY_ARRAY is array (natural range <>) of KEY_TYPE; 
signal	KEY	:KEY_ARRAY(0 to 7);
signal	keyc	:std_logic;
signal	PMS		:std_logic_vector(2 downto 0);
signal	AMS		:std_logic_vector(1 downto 0);

--frequency parameter
signal	CSM		:std_logic;
signal	Algo	:std_logic_vector(2 downto 0);
signal	FdBck	:std_logic_vector(2 downto 0);
signal	KC		:std_logic_vector(6 downto 0);
signal	KF		:std_logic_vector(5 downto 0);
signal	Blk		:std_logic_vector(2 downto 0);
signal	Fnum	:std_logic_vector(11 downto 0);
signal	Note	:std_logic_vector(1 downto 0);
signal	Mult	:std_logic_vector(3 downto 0);
signal	Detune	:std_logic_vector(2 downto 0);
signal	Detune2	:std_logic_vector(1 downto 0);
signal	SFnum	:std_logic_vector(15 downto 0);
signal	MSFnum	:std_logic_vector(15 downto 0);
signal	FBsrc	:std_logic_vector(15 downto 0);
signal	addfb	:std_logic_vector(15 downto 0);
signal	addfbm	:std_logic_vector(4 downto 0);
signal	outa,outb,outc	:std_logic_vector(15 downto 0);

signal	CHEN	:std_logic_vector(1 downto 0);

--enverope parameter
signal	AR		:std_logic_vector(4 downto 0);
signal	KS		:std_logic_vector(1 downto 0);
signal	DR		:std_logic_vector(4 downto 0);
signal	SL		:std_logic_vector(3 downto 0);
signal	RR		:std_logic_vector(3 downto 0);
signal	SR		:std_logic_vector(4 downto 0);
signal	SLEV	:std_logic_vector(15 downto 0);
signal	TL		:std_logic_vector(6 downto 0);
signal	AMSE	:std_logic;
signal	envcalc	:std_logic;
signal	TLaddr	:std_logic_vector(6 downto 0);
signal	TLval	:std_logic_vector(15 downto 0);
signal	TLlevel	:std_logic_vector(15 downto 0);
signal	SLlevel	:std_logic_vector(15 downto 0);

signal	add13,add23,add24,add234,add1234	:std_logic_vector(15 downto 0);
signal	SUM0,SUM1	:std_logic_vector(15 downto 0);
signal	sndadd00,sndadd01,sndadd10,sndadd11	:std_logic_vector(15 downto 0);

type envstate_array is array (natural range <>) of envstate_t; 
signal	envarray	:envstate_array(0 to 31);

subtype fbsrc_type is std_logic_vector(15 downto 0);
type fbsrc_array_type is array (natural range <>) of fbsrc_type;
signal	fbsrc_array	:fbsrc_array_type(0 to 7);
		
begin

	STATUS<=BUSY & "00000" & FLAG;
	
	process(fmclk,rstn)begin
		if(rstn='0')then
			sft<='0';
		elsif(fmclk' event and fmclk='1')then
			sft<=not sft;
		end if;
	end process;
	
	process(fmclk,rstn)begin
		if(rstn='0')then
			fmsft<='0';
			fscount<=fslength-1;
		elsif(fmclk' event and fmclk='1')then
			if(sft='1')then
				fmsft<='0';
				if(fscount>0)then
					fscount<=fscount-1;
				else
					fmsft<='1';
					fscount<=fslength-1;
				end if;
			end if;
		end if;
	end process;

	process(pclk,rstn)
	variable vchannel	:integer range 0 to 7;
	begin
		if(rstn='0')then
			BUSYR<='1';
			REGWR<='0';
			TARST<='0';
			TBRST<='0';
			TARDAT<=(others=>'0');
			TBRDAT<=(others=>'0');
			CPU_RADR<=(others=>'0');
			REGWR<='0';
			CT1<='0';
			CT2<='0';
			KEY<=(others=>x"0");
			LFORESET<='0';
			DINL<=(others=>'0');
			NOISEEN<='0';
			NOISEFREQ<=(others=>'0');
			CSM<='0';
			LFOFREQ<=(others=>'0');
			PMD<=(others=>'0');
			AMD<=(others=>'0');
			LFOSEL<=(others=>'0');
		elsif(pclk' event and pclk='1')then
			REGWR<='0';
			TARST<='0';
			TBRST<='0';
			if(BUSYR='1')then
				if(BUSYC='0' and BUSYS='0')then
					if(CPU_RADR/=x"ff")then
						CPU_RADR<=CPU_RADR+x"01";
						REGWR<='1';
					else
						CPU_RADR<=(others=>'0');
						BUSYR<='0';
					end if;
				end if;
			else
				if(CSn='0' and WRn='0')then
					if(ADR0='0')then
						CPU_RADR<=DIN;
					else
						REGWR<='1';
						DINL<=DIN;
						case CPU_RADR is
						when x"01" =>
							LFORESET<=DIN(1);
						when x"08" =>
							vchannel:=conv_integer(DIN(2 downto 0));
							KEY(vchannel)<=DIN(6 downto 3);
						when x"0f" =>
							NOISEEN<=DIN(7);
							NOISEFREQ<=DIN(4 downto 0);
						when x"10" =>
							TARDAT(9 downto 2)<=DIN;
						when x"11" =>
							TARDAT(1 downto 0)<=DIN(1 downto 0);
						when x"12" =>
							TBRDAT<=DIN;
						when x"14"=>
							TALD<=DIN(0);
							TBLD<=DIN(1);
							TAEN<=DIN(2);
							TBEN<=DIN(3);
							TARST<=DIN(4);
							TBRST<=DIN(5);
							CSM<=DIN(7);
						when x"18" =>
							LFOFREQ<=DIN;
						when x"19" =>
							if(DIN(7)='1')then
								PMD<=DIN(6 downto 0);
							else
								AMD<=DIN(6 downto 0);
							end if;
						when x"1b" =>
							CT1<=DIN(7);
							CT2<=DIN(6);
							LFOSEL<=DIN(1 downto 0);
						when others=>
						end case;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	CPU_WDAT<=x"00" when BUSYR='1' else DINL;

	DOUT<=STATUS;

	DOE<='1' when CSn='0' and RDn='0' else '0';
	
	C0regwr<=REGWR when CPU_RADR(7 downto 3)="00100" else '0';
	C1regwr<=REGWR when CPU_RADR(7 downto 3)="00101" else '0';
	C2regwr<=REGWR when CPU_RADR(7 downto 3)="00110" else '0';
	C3regwr<=REGWR when CPU_RADR(7 downto 3)="00111" else '0';
	S0regwr<=REGWR when CPU_RADR(7 downto 5)="010" else '0';
	S1regwr<=REGWR when CPU_RADR(7 downto 5)="011" else '0';
	S2regwr<=REGWR when CPU_RADR(7 downto 5)="100" else '0';
	S3regwr<=REGWR when CPU_RADR(7 downto 5)="101" else '0';
	S4regwr<=REGWR when CPU_RADR(7 downto 5)="110" else '0';
	S5regwr<=REGWR when CPU_RADR(7 downto 5)="111" else '0';
	
	WRCHANNEL<=conv_integer(CPU_RADR(2 downto 0));
	WRSLOT<=conv_integer(CPU_RADR(4 downto 3));
	Cregwr<=C0regwr or C1regwr or C2regwr or C3regwr;
	Sregwr<=S0regwr or S1regwr or S2regwr or S3regwr or S4regwr or S5regwr;
	CWRNO<=	0 when C0regwr='1' else
			1 when C1regwr='1' else
			2 when C2regwr='1' else
			3 when C3regwr='1' else
			0;
	SWRNO<=	0 when S0regwr='1' else
			1 when S1regwr='1' else
			2 when S2regwr='1' else
			3 when S3regwr='1' else
			4 when S4regwr='1' else
			5 when S5regwr='1' else
			0;
--	monout<=CHENWR & FLWR & CONWR & KCWR & KFWR & PMSWR & AMSWR & DT1WR & MULWR & TLWR & KSWR & ARWR & AMSEWR & DRWR & DT2WR & SRWR;

	Creg	:OPMcreg port map(WRCHANNEL,CPU_WDAT,CWRNO,Cregwr,BUSYC,CHANNELNO,C0RDAT,C1RDAT,C2RDAT,C3RDAT,fmclk,pclk,rstn);
	Sreg	:OPMsreg port map(WRCHANNEL,WRSLOT,CPU_WDAT,SWRNO,Sregwr,BUSYS,CHANNELNO,SLOTNO,S0RDAT,S1RDAT,S2RDAT,S3RDAT,S4RDAT,S5RDAT,fmclk,pclk,rstn);
	
	CHEN<=	C0RDAT(7 downto 6);
	FdBck<=	C0RDAT(5 downto 3);
	Algo<=	C0RDAT(2 downto 0);
	KC<=	C1RDAT(6 downto 0);
	KF<=	C2RDAT(7 downto 2);
	PMS<=	C3RDAT(6 downto 4);
	AMS<=	C3RDAT(1 downto 0);
	Detune<=S0RDAT(6 downto 4);
	Mult<=	S0RDAT(3 downto 0);
	TL<=	S1RDAT(6 downto 0);
	KS<=	S2RDAT(7 downto 6);
	AR<=	S2RDAT(4 downto 0);
	AMSE<=	S3RDAT(7);
	DR<=	S3RDAT(4 downto 0);
	Detune2<=S4RDAT(7 downto 6);
	SR<=	S4RDAT(4 downto 0);
	SL<=	S5RDAT(7 downto 4);
	RR<=	S5RDAT(3 downto 0);

	Blk<=KC(6 downto 4);
	K2F	:KEY2FNUM port map(KC(3 downto 0) & KF,fmclk,Fnum);
	
	BUSY<=BUSYC or BUSYS or BUSYR;
	
	process(fmclk,rstn)begin
		if(rstn='0')then
			FMSTATE<=FS_IDLE;
			intbgn<='0';
		elsif(fmclk' event and fmclk='1')then
			if(BUSYR='0' and sft='1')then
				intbgn<='0';
				if(fmsft='1')then
					FMSTATE<=FS_TIMER;
					intbgn<='1';
				else
					case FMSTATE is
	--				when FS_IDLE =>
					when FS_TIMER =>
						if(intend='1')then
							CHANNELNO<=0;
							SLOTNO<=0;
							FMSTATE<=FS_SLOTS;
							INTBGN<='1';
						end if;
					when FS_SLOTS =>
						if(intend='1')then
							case SLOTNO is
							when 0 =>
								SLOTNO<=2;
							when 1 =>
								SLOTNO<=3;
							when 2 =>
								SLOTNO<=1;
							when 3 =>
								if(CHANNELNO=7)then
									FMSTATE<=FS_MIX;
								else
									SLOTNO<=0;
									CHANNELNO<=CHANNELNO+1;
								end if;
							when others =>
							end case;
							INTBGN<='1';
						end if;
					when FS_MIX =>
						sndL<=SUM0(15 downto (16-res));
						sndR<=SUM1(15 downto (16-res));
						FMSTATE<=FS_IDLE;
					when others=>
						FMSTATE<=FS_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;
	
	thitareg	:fmparram generic map(8,4,16) port map(CHANNELNO,SLOTNO,thitawd,thitawr,fmclk,CHANNELNO,SLOTNO,thitard,fmclk);
	elevreg		:fmparram generic map(8,4,20) port map(CHANNELNO,SLOTNO,elevwd,elevwr,fmclk,CHANNELNO,SLOTNO,elevrd,fmclk);
	
	process(fmclk,rstn)
	variable vthita	:std_logic_vector(15 downto 0);
	variable addthita:std_logic_vector(15 downto 0);
	variable coutc	:std_logic_vector(15 downto 0);
	variable xtoutx0,xtoutx1,xtoutx2,xtoutx3	:std_logic_vector(15 downto 0);
	begin
		if(rstn='0')then
			INTST<=IS_IDLE;
			TBPS<=0;
			intend<='0';
			TACOUNT<=(others=>'0');
			TBCOUNT<=(others=>'0');
			FLAG<=(others=>'0');
			envcalc<='0';
			thitawd<=(others=>'0');
			thitawr<='0';
			elevwr<='0';
			fbsrc_array<=(others=>x"0000");
			TLlevel<=(others=>'0');
			SLlevel<=(others=>'0');
			TLaddr<=(others=>'0');
			sndadd00<=(others=>'0');
			sndadd01<=(others=>'0');
			sndadd10<=(others=>'0');
			sndadd11<=(others=>'0');
		elsif(fmclk' event and fmclk='1')then
			if(BUSY='0' and sft='1')then
				thitawr<='0';
				elevwr<='0';
				intend<='0';
				envcalc<='0';
				if(TARST='1')then
					FLAG(0)<='0';
				end if;
				if(TBRST='1')then
					FLAG(1)<='0';
				end if;
				intend<='0';
				case FMSTATE is
				when FS_TIMER =>
					if(intbgn='1')then
						if(TALD='0')then
							TACOUNT<=TARDAT;
						else
							if(TACOUNT="1111111111")then
								if(TAEN='1')then
									FLAG(0)<='1';
								end if;
								TACOUNT<=TARDAT;
							else
								TACOUNT<=TACOUNT+"0000000001";
							end if;
						end if;
						
						if(TBPS/=0)then
							TBPS<=TBPS-1;
						else
							TBPS<=15;
							if(TBLD='0')then
								TBCOUNT<=TBRDAT;
							else
								if(TBCOUNT=x"ff")then
									if(TBEN='1')then
										FLAG(1)<='1';
									end if;
									TBCOUNT<=TBRDAT;
								else
									TBCOUNT<=TBCOUNT+x"01";
								end if;
							end if;
						end if;
						intend<='1';
					end if;
				when FS_SLOTS =>
					if(intbgn='1')then
						if(SLOTNO=0)then
							INTST<=IS_CALCFNUM;
						else
							INTST<=IS_CALCTHITA;
						end if;
						TLaddr<='0' & SL & "00";
					else
						case INTST is
						when IS_CALCFNUM =>
							INTST<=IS_CALCTHITA;
						when IS_CALCTHITA =>
							SLlevel<=TLval;
							TLaddr<=TL;
							xtoutx0:=toutx0(11 downto 0) & "0000";
							xtoutx1:=toutx1(11 downto 0) & "0000";
							xtoutx2:=toutx2(11 downto 0) & "0000";
							vthita:=thitard+MSFnum;
							case SLOTNO is
							when 0 =>
								addthita:=addfb;
							when 2 =>
								case Algo is
								when "000" | "011" | "100" | "101" | "110"=>
									addthita:=xtoutx0;
								when others =>
									addthita:=(others=>'0');
								end case;
							when 1 =>
								case Algo is
								when "000" | "010" =>
									addthita:=xtoutx2;
								when "001" =>
									addthita:=xtoutx0+xtoutx2;
								when "101" =>
									addthita:=xtoutx0;
								when others =>
									addthita:=(others=>'0');
								end case;
							when 3 =>
								case Algo is
								when "000" | "001" | "100" =>
									addthita:=xtoutx1;
								when "010" =>
									addthita:=xtoutx0+xtoutx1;
								when "011" =>
									addthita:=xtoutx1+xtoutx2;
								when "101" =>
									addthita:=xtoutx0;
								when others =>
									addthita:=(others=>'0');
								end case;
							when others =>
								addthita:=(others=>'0');
							end case;
							if(keyc='0' and cenvst=es_OFF)then
								vthita:=(others=>'0');
							end if;
							thitawd<=vthita;
							thitawr<='1';
							thita<=vthita+addthita;
							INTST<=IS_CALCENV;
						when IS_CALCENV =>
							TLlevel<=TLval;
							elevwr<='1';
							INTST<=IS_WAIT;
						when IS_WAIT =>
							INTST<=IS_CALCTL;
						when IS_CALCTL =>
							case SLOTNO is
							when 0 =>
								toutx0<=toutc;
								fbsrc_array(CHANNELNO)<=toutc;
							when 1 =>
								toutx1<=toutc;
							when 2 =>
								toutx2<=toutc;
							when 3 =>
								toutx3<=toutc;
							when others =>
							end case;
							case SLOTNO is
							when 3 =>
								INTST<=IS_CMIX;
							when others =>
								INTST<=IS_IDLE;
								intend<='1';
							end case;
						when IS_CMIX =>
							case Algo is
							when "000" | "001" | "010" | "011" =>
								coutc:= toutx3;
							when "100" =>
								coutc:=add24;
							when "101" | "110" =>
								coutc:=add234;
							when "111" =>
								coutc:=add1234;
							when others=>
							end case;
							op0out<=toutx0;
							op1out<=toutx1;
							op2out<=toutx2;
							op3out<=toutx3;
							case CHANNELNO is
							when 0 =>
								sndadd01<=(others=>'0');
								sndadd11<=(others=>'0');
							when others =>
								sndadd01<=SUM0;
								sndadd11<=SUM1;
							end case;
							if(chenable(CHANNELNO)='1')then
								if(CHEN(0)='1')then
									sndadd00<=coutc(15) & coutc(15) & coutc(15) & coutc(15 downto 3);
								else
									sndadd00<=(others=>'0');
								end if;
								if(CHEN(1)='1')then
									sndadd10<=coutc(15) & coutc(15) & coutc(15) & coutc(15 downto 3);
								else
									sndadd10<=(others=>'0');
								end if;
							else
								sndadd00<=(others=>'0');
								sndadd10<=(others=>'0');
							end if;
							INTST<=IS_IDLE;
							intend<='1';
						when others =>
							INTST<=IS_IDLE;
						end case;
					end if;
				when others =>
					INTST<=IS_IDLE;
				end case;
			end if;
		end if;
	end process;

	addr13	:addsat generic map(16) port map(toutx0,toutx2,add13,open,open);
	addr23	:addsat generic map(16) port map(toutx1,toutx2,add23,open,open);
	addr24	:addsat generic map(16) port map(toutx1,toutx3,add24,open,open);
	addr234	:addsat generic map(16) port map(add23,toutx3,add234,open,open);
	addr1234:addsat generic map(16) port map(add13,add24,add1234,open,open);
	
	sadd0	:addsat generic map(16) port map(sndadd00,sndadd01,SUM0,open,open);
	sadd1	:addsat	generic map(16) port map(sndadd10,sndadd11,SUM1,open,open);
	
	SFnum<=	"0000" & Fnum 						when Blk="111" else
			"00000" & Fnum(11 downto 1)			when Blk="110" else
			"000000" & Fnum(11 downto 2)			when Blk="101" else
			"0000000" & Fnum(11 downto 3)		when Blk="100" else
			"00000000" & Fnum(11 downto 4)		when Blk="011" else
			"000000000" & Fnum(11 downto 5) 		when Blk="010" else
			"0000000000" & Fnum(11 downto 6) 	when Blk="001" else
			"00000000000" & Fnum(11 downto 7);
				
	process(SFnum,Mult)
	variable SUM	:std_logic_vector(15 downto 0);
	begin
		if(Mult=x"0")then
			SUM:='0' & SFnum(15 downto 1);
		else
			SUM:=(others=>'0');
			if(Mult(0)='1')then
				SUM:=SUM+SFnum;
			end if;
			if(Mult(1)='1')then
				SUM:=SUM+(SFnum(14 downto 0) & '0');
			end if;
			if(Mult(2)='1')then
				SUM:=SUM+(SFnum(13 downto 0) & "00");
			end if;
			if(Mult(3)='1')then
				SUM:=SUM+(SFnum(12 downto 0) & "000");
			end if;
		end if;
		MSFnum<=SUM;
	end process;

	FBsrc<=	fbsrc_array(CHANNELNO);

	addfbm<=(others=>FBsrc(15));
	addfb<=	addfbm(3 downto 0) & FBsrc(15 downto 4)		when FdBck="001" else
			addfbm(2 downto 0) & FBsrc(15 downto 3)		when FdBck="010" else
			addfbm(1 downto 0) & FBsrc(15 downto 2)		when FdBck="011" else
			addfbm(0) & FBsrc(15 downto 1)				when FdBck="100" else
			FBsrc										when FdBck="101" else
			FBsrc(14 downto 0) & '0'					when FdBck="110" else
			FBsrc(13 downto 0) & "00"					when FdBck="111" else
			(others=>'0');


	INTn<=not(FLAG(1) or FLAG(0)) ;
	
	cenvst<=envarray(CHANNELNO*4+SLOTNO);
			
	keyc<=	key(CHANNELNO)(SLOTNO);

	env	:envcont generic map(20) port map(
		KEY		=>keyc,
		AR		=>AR,
		DR		=>DR,
		SLlevel	=>SLlevel,
		RR		=>RR,
		SR		=>SR,
		
		CURSTATE	=>cenvst,
		NXTSTATE	=>nenvst,
		
		CURLEVEL	=>elevrd,
		NXTLEVEL	=>elevwd
	);
			
	sint	:sintbl port map(thita,sinthita,fmclk);
	
	
	TLC	:TLtbl port map(TLaddr,fmclk,TLval);
	envm	:muls16xu16 port map(sinthita,TLlevel,envsin,fmclk);
	tlm	:muls16xu16 port map(envsin,elevwd(19 downto 4),toutc,fmclk);
	monout<=TLlevel;
	
	process(fmclk,rstn)begin
		if(rstn='0')then
			envarray<=(others=>es_OFF);
		elsif(fmclk' event and fmclk='1')then
			if(elevwr='1')then
				envarray(CHANNELNO*4+SLOTNO)<=nenvst;
			end if;
		end if;
	end process;
	
	
end rtl;
