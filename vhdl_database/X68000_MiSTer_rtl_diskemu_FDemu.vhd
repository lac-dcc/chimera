LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.FDC_timing.all;

entity FDemu is
generic(
	sysclk		:integer	:=10000;
	fdwait		:integer	:=10
);
port(
	ramaddr	:out std_logic_vector(23 downto 0);
	ramrdat	:in std_logic_vector(15 downto 0);
	ramwdat	:out std_logic_vector(15 downto 0);
	ramwr	:out std_logic;
	ramwait	:in std_logic;

	rdfdmode	:in std_logic_vector(7 downto 0);
	curfdmode	:out std_logic_vector(7 downto 0);
	modeset		:in std_logic_vector(3 downto 0);
	wrote		:out std_logic_vector(3 downto 0);
	wprot		:in std_logic_vector(3 downto 0);
	tracklen	:out std_logic_vector(13 downto 0);

	USEL	:in std_logic_vector(1 downto 0);
	MOTOR	:in std_logic;
	WRENn	:in std_logic;		--pin24
	WRBITn	:in std_logic;		--pin22
	WRFDMODE:in std_logic_vector(1 downto 0);
	WRMFM	:in std_logic;
	RDBITn	:out std_logic;		--pin30
	STEPn	:in std_logic;		--pin20
	SDIRn	:in std_logic;		--pin18
	track0n	:out std_logic;		--pin26
	indexn	:out std_logic;		--pin8
	siden	:in std_logic;		--pin32

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end FDemu;

architecture rtl of FDemu is
constant 	maxbwidth	:integer	:=4000*sysclk/1000000;
signal	TRAMRDDAT		:std_logic_vector(8 downto 0);
signal	RDMFM		:std_logic;
signal	deminit		:std_logic;
signal	dembreak	:std_logic;
signal	fmrxdat		:std_logic_vector(7 downto 0);
signal	fmrxed		:std_logic;
signal	fmmf8det	:std_logic;
signal	fmmfbdet	:std_logic;
signal	fmmfcdet	:std_logic;
signal	fmmfedet	:std_logic;
signal	fmcurwid	:integer range 0 to maxbwidth*2;
signal	mfmrxdat	:std_logic_vector(7 downto 0);
signal	mfmrxed		:std_logic;
signal	rxed		:std_logic;
signal	mfmma1det	:std_logic;
signal	mfmmc2det	:std_logic;
signal	mfmcurwid	:integer range 0 to maxbwidth;
signal	fmrxbit		:std_logic;
signal	mfmrxbit	:std_logic;

signal	fmdeminit	:std_logic;
signal	mfmdeminit	:std_logic;
signal	txdat		:std_logic_vector(7 downto 0);
signal	mcrdat		:std_logic;
signal	txwr		:std_logic;
signal	fmtxwr		:std_logic;
signal	mfmtxwr		:std_logic;
signal	fmmf8wr		:std_logic;
signal	fmmfbwr		:std_logic;
signal	fmmfcwr		:std_logic;
signal	fmmfewr		:std_logic;
signal	mfmma1wr	:std_logic;
signal	mfmmc2wr	:std_logic;
signal	fmtxemp		:std_logic;
signal	mfmtxemp	:std_logic;
signal	txemp		:std_logic;
signal	fmwrbit		:std_logic;
signal	mfmwrbit	:std_logic;
signal	txwrbit		:std_logic;
signal	txwrbitex	:std_logic;
signal	fmtxend		:std_logic;
signal	mfmtxend	:std_logic;
signal	txend		:std_logic;
signal	modsftfm		:std_logic;
signal	modsftmfm		:std_logic;
signal	modbreak	:std_logic;

signal	curpos		:std_logic_vector(13 downto 0);
signal	lcurpos		:std_logic_vector(13 downto 0);

signal	bitlenr,bitlenw		:integer range 0 to maxbwidth;

signal	curtrack	:std_logic_vector(6 downto 0);
signal	curtrack0	:std_logic_vector(6 downto 0);
signal	curtrack1	:std_logic_vector(6 downto 0);
signal	curtrack2	:std_logic_vector(6 downto 0);
signal	curtrack3	:std_logic_vector(6 downto 0);
signal	tracklenx	:std_logic_vector(13 downto 0);
signal	tracklen0	:std_logic_vector(13 downto 0);
signal	tracklen1	:std_logic_vector(13 downto 0);
signal	tracklen2	:std_logic_vector(13 downto 0);
signal	tracklen3	:std_logic_vector(13 downto 0);

signal	fdmode0	:std_logic_vector(1 downto 0);
signal	fdmode1	:std_logic_vector(1 downto 0);
signal	fdmode2	:std_logic_vector(1 downto 0);
signal	fdmode3	:std_logic_vector(1 downto 0);
signal	selfdmode:std_logic_vector(1 downto 0);

signal	rxwr	:std_logic;
signal	GAPS	:integer	range 0 to 31;
signal	SYNCS	:integer	range 0 to 15;
signal	GAPDAT	:std_logic_vector(7 downto 0);
signal	GSDAT	:std_logic_vector(7 downto 0);
signal	GSwrite	:std_logic;
constant extcount	:integer	:=(sysclk*WR_WIDTH)/1000000;

component fmmod
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txmf8	:in std_logic;
	txmfb	:in std_logic;
	txmfc	:in std_logic;
	txmfe	:in std_logic;
	break	:in std_logic;

	txemp	:out std_logic;
	txend	:out std_logic;

	bitout	:out std_logic;
	writeen	:out std_logic;

	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component mfmmod
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txma1	:in std_logic;
	txmc2	:in std_logic;
	break	:in std_logic;

	txemp	:out std_logic;
	txend	:out std_logic;

	bitout	:out std_logic;
	writeen	:out std_logic;

	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component fmdem
generic(
	bwidth	:integer	:=22
);
port(
	bitlen	:in integer range 0 to bwidth;

	datin	:in std_logic;

	init	:in std_logic;
	break	:in std_logic;

	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMF8	:out std_logic;
	DetMFB	:out std_logic;
	DetMFC	:out std_logic;
	DetMFE	:out std_logic;
	broken	:out std_logic;

	curlen	:out integer range 0 to bwidth*2;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component mfmdem
generic(
	bwidth	:integer	:=22
);
port(
	bitlen	:in integer range 0 to bwidth;

	datin	:in std_logic;

	init	:in std_logic;
	break	:in std_logic;

	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMA1	:out std_logic;
	DetMC2	:out std_logic;
	broken	:out std_logic;

	curlen	:out integer range 0 to bwidth*2;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sftgen
generic(
	maxlen	:integer	:=100
);
port(
	len		:in integer range 0 to maxlen;
	sft		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component signext
generic(
	extmax	:integer	:=10
);
port(
	len		:in integer range 0 to extmax;
	signin	:in std_logic;

	signout	:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component mkgapsync
port(
	GAPS	:in integer	range 0 to 31;
	SYNCS	:in integer	range 0 to 15;

	GAPDAT	:in std_logic_vector(7 downto 0);

	WRENn		:in std_logic;

	MKEN		:out std_logic;
	MKDAT		:out std_logic_vector(7 downto 0);
	MK			:out std_logic;
	MKDONE	:in std_logic	:='1';

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				fdmode0<="00";
				fdmode1<="00";
				fdmode2<="00";
				fdmode3<="00";
			elsif(ce = '1')then
				if(modeset(0)='1')then
					fdmode0<=rdfdmode(1 downto 0);
				end if;
				if(modeset(1)='1')then
					fdmode1<=rdfdmode(3 downto 2);
				end if;
				if(modeset(2)='1')then
					fdmode2<=rdfdmode(5 downto 4);
				end if;
				if(modeset(3)='1')then
					fdmode3<=rdfdmode(7 downto 6);
				end if;
				if(rxed='1')then
					case USEL is
					when "00" =>
						fdmode0<=WRFDMODE;
					when "01" =>
						fdmode1<=WRFDMODE;
					when "10" =>
						fdmode2<=WRFDMODE;
					when "11" =>
						fdmode3<=WRFDMODE;
					when others =>
					end case;
				end if;
			end if;
		end if;
	end process;


	selfdmode<=	fdmode0	when USEL="00" else
					fdmode1	when USEL="01" else
					fdmode2	when USEL="10" else
					fdmode3	when USEL="11" else
					"00";
	curfdmode<=fdmode3 & fdmode2 & fdmode1 & fdmode0;

	bitlenr<=	4000*sysclk/1000000	when selfdmode(1)='0' else 2000*sysclk/1000000;

	bitlenw<=	4000*sysclk/1000000	when WRFDMODE(1)='0' else 2000*sysclk/1000000;

	tracklen0<=	conv_std_logic_vector( 6250,14) when fdmode0="00" else
				conv_std_logic_vector( 6250,14) when fdmode0="01" else
				conv_std_logic_vector(10416,14) when fdmode0="10" else
				conv_std_logic_vector(12500,14) when fdmode0="11" else
				(others=>'0');
	tracklen1<=	conv_std_logic_vector( 6250,14) when fdmode1="00" else
				conv_std_logic_vector( 6250,14) when fdmode1="01" else
				conv_std_logic_vector(10416,14) when fdmode1="10" else
				conv_std_logic_vector(12500,14) when fdmode1="11" else
				(others=>'0');
	tracklen2<=	conv_std_logic_vector( 6250,14) when fdmode2="00" else
				conv_std_logic_vector( 6250,14) when fdmode2="01" else
				conv_std_logic_vector(10416,14) when fdmode2="10" else
				conv_std_logic_vector(12500,14) when fdmode2="11" else
				(others=>'0');
	tracklen3<=	conv_std_logic_vector( 6250,14) when fdmode3="00" else
				conv_std_logic_vector( 6250,14) when fdmode3="01" else
				conv_std_logic_vector(10416,14) when fdmode3="10" else
				conv_std_logic_vector(12500,14) when fdmode3="11" else
				(others=>'0');
	tracklenx<=	tracklen0	when USEL="00" else
				tracklen1	when USEL="01" else
				tracklen2	when USEL="10" else
				tracklen3	when USEL="11" else
				(others=>'0');
	tracklen<=tracklenx;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				txwr<='0';
			elsif(ce = '1')then
				txwr<='0';
				if(MOTOR='1')then
					if(WRENn='1' and txemp='1')then
						if(WRENn='1')then
							txwr<='1';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				curpos<=(others=>'0');
			elsif(ce = '1')then
				if(txwr='1' or (WRENn='0' and rxed='1'))then
					if(curpos>=tracklenx-1)then
						curpos<=(others=>'0');
					else
						curpos<=curpos+1;
					end if;
				end if;
			end if;
		end if;
	end process;


	txdat<=ramrdat(7 downto 0);
	mcrdat<=ramrdat(8);
	RDMFM<=ramrdat(9);

	fmtxwr<=	'0' when RDMFM='1' else
				'0' when mcrdat='1' else
				txwr;
	fmmf8wr<=	'0' when RDMFM='1' else
				'0' when mcrdat='0' else
				'1' when txdat=x"f8" and txwr='1' else
				'0';

	fmmfbwr<=	'0' when RDMFM='1' else
				'0' when mcrdat='0' else
				'1' when txdat=x"fb" and txwr='1' else
				'0';

	fmmfcwr<=	'0' when RDMFM='1' else
				'0' when mcrdat='0' else
				'1' when txdat=x"fc" and txwr='1' else
				'0';

	fmmfewr<=	'0' when RDMFM='1' else
				'0' when mcrdat='0' else
				'1' when txdat=x"fe" and txwr='1' else
				'0';

	mfmtxwr<=	'0' when RDMFM='0' else
				'0' when mcrdat='1' else
				txwr;

	mfmma1wr<=	'0' when RDMFM='0' else
				'0' when mcrdat='0' else
				'1' when txdat=x"a1" and txwr='1' else
				'0';

	mfmmc2wr<=	'0' when RDMFM='0' else
				'0' when mcrdat='0' else
				'1' when txdat=x"c2" and txwr='1' else
				'0';

	indexn<='0' when curpos="00000000000000" else '1';

	wsftfm	:sftgen generic map(maxbwidth) port map(bitlenr,modsftfm,clk,ce,rstn);
	wsftmfm	:sftgen generic map(maxbwidth/2) port map(bitlenr/2,modsftmfm,clk,ce,rstn);

	fmtx	:fmmod port map(
		txdat	=>txdat,
		txwr	=>fmtxwr,
		txmf8	=>fmmf8wr,
		txmfb	=>fmmfbwr,
		txmfc	=>fmmfcwr,
		txmfe	=>fmmfewr,
		break	=>'0',

		txemp	=>fmtxemp,
		--txend	=>fmtxend,

		bitout	=>fmwrbit,
		writeen	=>open,

		sft		=>modsftfm,
		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);

	mfmtx	:mfmmod port map(
		txdat	=>txdat,
		txwr	=>mfmtxwr,
		txma1	=>mfmma1wr,
		txmc2	=>mfmmc2wr,
		break	=>'0',

		txemp	=>mfmtxemp,
		--txend	=>mfmtxend,

		bitout	=>mfmwrbit,
		writeen	=>open,

		sft		=>modsftmfm,
		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	txemp<=fmtxemp and mfmtxemp;
	txwrbit<=fmwrbit or mfmwrbit;
	wdatext	:signext generic map(extcount) port map(extcount,txwrbit,txwrbitex,clk,ce,rstn);

	RDBITn<=not txwrbitex;

	fmrxbit<=not WRBITn when WRMFM='0' and WRENn='0' else '0';
	mfmrxbit<=not WRBITn when WRMFM='1' and WRENn='0' else '0';

	process(clk,rstn)
	variable lREADY	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				lREADY:='0';
				fmdeminit<='0';
				mfmdeminit<='0';
			elsif(ce = '1')then
				fmdeminit<='0';
				mfmdeminit<='0';
				if(MOTOR='1' and lREADY='0')then
					if(WRMFM='0')then
						fmdeminit<='1';
					else
						mfmdeminit<='1';
					end if;
				end if;
				lREADY:=MOTOR;
			end if;
		end if;
	end process;

	fmrx	:fmdem generic map(maxbwidth) port map(
		bitlen	=>bitlenw,

		datin	=>fmrxbit,

		init	=>fmdeminit,
		break	=>WRENn,

		RXDAT	=>fmrxdat,
		RXED	=>fmrxed,
		DetMF8	=>fmmf8det,
		DetMFB	=>fmmfbdet,
		DetMFC	=>fmmfcdet,
		DetMFE	=>fmmfedet,

		curlen	=>open,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);

	mfmrx	:mfmdem generic map(maxbwidth/2)port map(
		bitlen	=>bitlenw/2,

		datin	=>mfmrxbit,

		init	=>mfmdeminit,
		break	=>WRENn,

		RXDAT	=>mfmrxdat,
		RXED	=>mfmrxed,
		DetMA1	=>mfmma1det,
		DetMC2	=>mfmmc2det,

		curlen	=>open,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);

	GAPS<=	4 when WRMFM='0' else 8;
	SYNCS<=	6 when WRMFM='0' else 12;
	GAPDAT<=x"ff" when WRMFM='0' else x"4e";

	GS	:mkgapsync port map(
		GAPS	=>GAPS,
		SYNCS	=>SYNCS,

		GAPDAT	=>GAPDAT,

		WRENn	=>WRENn,

		MKEN	=>open,
		MKDAT	=>GSDAT,
		MK		=>GSwrite,
		MKDONE	=>rxed,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);


	process(clk,rstn)
	variable wrbusy	:std_logic;
	variable mwait		:integer range 0 to 3;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				ramwr<='0';
				rxed<='0';
				wrbusy:='0';
				mwait:=0;
			elsif(ce = '1')then
				rxed<='0';
				if(rxwr='1')then
					wrbusy:='1';
					ramwr<='1';
					mwait:=3;
				elsif(mwait>0)then
					mwait:=mwait-1;
				elsif(wrbusy='1')then
					if(ramwait='0')then
						ramwr<='0';
						rxed<='1';
						wrbusy:='0';
					end if;
				end if;
			end if;
		end if;
	end process;


	process(clk,rstn)
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				ramwdat<=(others=>'0');
				rxwr<='0';
				wrote<=(others=>'0');
			elsif(ce = '1')then
				rxwr<='0';
				wrote<=(others=>'0');
				if(wprot(conv_integer(USEL))='0')then
					if(WRMFM='0')then
						if(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1' or fmrxed='1' or GSwrite='1')then
							if(fmmf8det='1')then
								ramwdat<=x"05f8";
							end if;
							if(fmmfbdet='1')then
								ramwdat<=x"05fb";
							end if;
							if(fmmfcdet='1')then
								ramwdat<=x"05fc";
							end if;
							if(fmmfedet='1')then
								ramwdat<=x"05fe";
							end if;
							if(fmrxed='1')then
								ramwdat<=x"04" & fmrxdat;
							end if;
							if(GSwrite='1')then
								ramwdat<=x"04" & GSDAT;
							end if;
							rxwr<='1';
							wrote(conv_integer(USEL))<='1';
						end if;
					else
						if(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1' or GSwrite='1')then
							if(mfmma1det='1')then
								ramwdat<=x"07a1";
							end if;
							if(mfmmc2det='1')then
								ramwdat<=x"07c2";
							end if;
							if(mfmrxed='1')then
								ramwdat<=x"06" & mfmrxdat;
							end if;
							if(GSwrite='1')then
								ramwdat<=x"06" & GSDAT;
							end if;
							rxwr<='1';
							wrote(conv_integer(USEL))<='1';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)
	variable lSTEPn		:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				curtrack0<=(others=>'1');
				curtrack1<=(others=>'1');
				curtrack2<=(others=>'1');
				curtrack3<=(others=>'1');
				lSTEPn:='1';
			elsif(ce = '1')then
				if(lSTEPn='1' and STEPn='0')then
					if(SDIRn='0')then
						case USEL is
						when "00" =>
							curtrack0<=curtrack0+1;
						when "01" =>
							curtrack1<=curtrack1+1;
						when "10" =>
							curtrack2<=curtrack2+1;
						when "11" =>
							curtrack3<=curtrack3+1;
						when others =>
						end case;
					else
						case USEL is
						when "00" =>
							if(curtrack0>0)then
								curtrack0<=curtrack0-1;
							end if;
						when "01" =>
							if(curtrack1>0)then
								curtrack1<=curtrack1-1;
							end if;
						when "10" =>
							if(curtrack2>0)then
								curtrack2<=curtrack2-1;
							end if;
						when "11" =>
							if(curtrack3>0)then
								curtrack3<=curtrack3-1;
							end if;
						when others =>
						end case;
					end if;
				end if;
				lSTEPn:=STEPn;
			end if;
		end if;
	end process;

	track0n<='0' when curtrack0="0000000" and USEL="00" else
				'0' when curtrack1="0000000" and USEL="01" else
				'0' when curtrack2="0000000" and USEL="10" else
				'0' when curtrack3="0000000" and USEL="11" else
				'1';
	curtrack<=	curtrack0	when USEL="00" else
				curtrack1	when USEL="01" else
				curtrack2	when USEL="10" else
				curtrack3	when USEL="11" else
				(others=>'1');
	ramaddr<=USEL & curtrack & not siden & curpos;

end rtl;