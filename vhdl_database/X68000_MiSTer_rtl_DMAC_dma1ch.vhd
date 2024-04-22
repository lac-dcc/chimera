LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dma1ch is
port(
	regaddr	:in std_logic_vector(5 downto 0);
	regrdat	:out std_logic_vector(15 downto 0);
	regwdat	:in std_logic_vector(15 downto 0);
	regrd	:in std_logic;
	regwr	:in std_logic_vector(1 downto 0);

	irq			:out std_logic;
	ivect		:out std_logic_vector(7 downto 0);
	iack		:in std_logic;

	busreq		:out std_logic;
	busact		:in std_logic;
	buschk		:out std_logic;
	reqg		:out std_logic;
	bt			:out std_logic_vector(1 downto 0);
	br			:out std_logic_vector(1 downto 0);
	pri			:out std_logic_vector(1 downto 0);
	b_indat		:in std_logic_vector(15 downto 0);
	b_outdat	:out std_logic_vector(15 downto 0);
	b_doe		:out std_logic;
	b_addr		:out std_logic_vector(23 downto 0);
	b_as		:out std_logic;
	b_rwn		:out std_logic;
	b_uds		:out std_logic;
	b_lds		:out std_logic;
	b_ack		:in std_logic;

	drq			:in std_logic;
	dack		:out std_logic;
	d_rd		:out std_logic;
	d_wr		:out std_logic;
	pcli		:in std_logic;
	pclo		:out std_logic;

	donei		:in std_logic;
	doneo		:out std_logic;

	dtc			:out std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end dma1ch;

architecture rtl of dma1ch is
signal	BUSADDR	:std_logic_vector(31 downto 0);
signal	S_COC	:std_logic;
signal	S_BTC	:std_logic;
signal	S_NDT	:std_logic;
signal	S_ERR	:std_logic;
signal	S_ACT	:std_logic;
signal	S_DIT	:std_logic;
signal	S_PCT	:std_logic;
signal	S_PCS	:std_logic;
signal	S_CER	:std_logic_vector(4 downto 0);

signal	S_COCset:std_logic;
signal	S_COCres:std_logic;
signal	S_BTCset:std_logic;
signal	S_BTCres:std_logic;
signal	S_NDTset:std_logic;
signal	S_NDTres:std_logic;
signal	S_ERRset:std_logic;
signal	S_ERRres:std_logic;
signal	S_DITset:std_logic;
signal	S_DITres:std_logic;
signal	S_PCTset:std_logic;
signal	S_PCTres:std_logic;

signal	DCR_XRM		:std_logic_vector(1 downto 0);
signal	DCR_DTYPE	:std_logic_vector(1 downto 0);
signal	DCR_DPS		:std_logic;
signal	DCR_PCL		:std_logic_vector(1 downto 0);
signal	OCR_DIR		:std_logic;
signal	OCR_BTD		:std_logic;
signal	OCR_SIZE	:std_logic_vector(1 downto 0);
signal	OCR_CHAIN	:std_logic_vector(1 downto 0);
signal	OCR_REQG	:std_logic_vector(1 downto 0);
signal	SCR_MAC		:std_logic_vector(1 downto 0);
signal	SCR_DAC		:std_logic_vector(1 downto 0);
signal	CCR_STR		:std_logic;
signal	CCR_CNT		:std_logic;
signal	CCR_HLT		:std_logic;
signal	CCR_SAB		:std_logic;
signal	CCR_INT		:std_logic;
signal	CPR_CP		:std_logic_vector(1 downto 0);
signal	NIV,EIV		:std_logic_vector(7 downto 0);
signal	MFC,DFC,BFC	:std_logic_vector(2 downto 0);
signal	MAR,DAR,BAR	:std_logic_vector(31 downto 0);
signal	MTC,BTC		:std_logic_vector(15 downto 0);

signal	MTC_dec		:std_logic;
signal	MTC_dec2		:std_logic;
signal	MTC_load	:std_logic;
signal	MTC_BTC		:std_logic;

signal	MAR_incb	:std_logic;
signal	MAR_decb	:std_logic;
signal	MAR_incw	:std_logic;
signal	MAR_decw	:std_logic;
signal	MAR_incl	:std_logic;
signal	MAR_decl	:std_logic;
signal	MAR_dec3	:std_logic;
signal	MAR_loadh	:std_logic;
signal	MAR_loadl	:std_logic;
signal	MAR_BAR		:std_logic;

signal	DAR_incb		:std_logic;
signal	DAR_decb		:std_logic;
signal	DAR_incw		:std_logic;
signal	DAR_decw		:std_logic;
signal	DAR_incl		:std_logic;
signal	DAR_decl		:std_logic;
signal	DAR_dec3		:std_logic;

signal	BTC_dec		:std_logic;

signal	BAR_loadh	:std_logic;
signal	BAR_loadl	:std_logic;
signal	BAR_inc		:std_logic;

signal	MFC_BFC		:std_logic;

signal	GCR_BT		:std_logic_vector(1 downto 0);
signal	GCR_BR		:std_logic_vector(1 downto 0);

signal	TXDAT		:std_logic_vector(31 downto 0);
signal	bytecnt		:integer range 0 to 3;

signal	int_comp	:std_logic;

signal	CHactive	:std_logic;
signal	CONTMODE	:std_logic;
signal	reqwait	:std_logic;
signal	packen	:std_logic;

type state_t is(
	ST_IDLE,
	ST_RQWAIT,
	ST_BUSWAIT,
	ST_SETSADDR,
	ST_READ,
	ST_CHDIR,
	ST_WRITE,
	ST_NEXT,
	ST_NBLOCK,
	ST_CONT,
	ST_CHAINBUSWAIT,
	ST_CHAINH,
	ST_CHAINHA,
	ST_CHAINL,
	ST_CHAINLA,
	ST_CHAINC,
	ST_CHAINCA,
	ST_CHAINNH,
	ST_CHAINNHA,
	ST_CHAINNL,
	ST_CHAINNLA,
	ST_BUSCONT,
	ST_WAIT
);
signal	STATE	:state_t;
signal	drqx	:std_logic;
signal	drqe	:std_logic;
signal	drqeclr:std_logic;
signal	ldrq	:std_logic;
signal	CONT	:std_logic;
signal	CONT_clr:std_logic;

signal	TERR_SET	:std_logic;
signal	CERR_SET	:std_logic;
signal	TERR_CNT	:std_logic;
signal	CERR_CNT	:std_logic;

signal	regrdatx	:std_logic_vector(15 downto 0);
signal	b_indatl	:std_logic_vector(15 downto 0);

component g_srff
port(
	set		:in std_logic;
	reset	:in std_logic;

	q		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;
begin

	dtc <= '0';
	pclo <= '0';

	S_NDTset <= '0';
	S_DITset <= '0';
	S_PCTset <= '0';

	COCR	:g_srff port map(S_COCset,S_COCres,S_COC,clk,ce,rstn);
	BTCR	:g_srff port map(S_BTCset,S_BTCres,S_BTC,clk,ce,rstn);
	NDTR	:g_srff port map(S_NDTset,S_NDTres,S_NDT,clk,ce,rstn);
	ERRR	:g_srff port map(S_ERRset,S_ERRres,S_ERR,clk,ce,rstn);
	DITR	:g_srff port map(S_DITset,S_DITres,S_DIT,clk,ce,rstn);
	PCTR	:g_srff port map(S_PCTset,S_PCTres,S_PCT,clk,ce,rstn);

	S_BTCres<=CCR_CNT;
	S_COCset<=int_comp;

	S_COCres<=regwdat(15) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';
--	S_BTCres<=regwdat(14) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';
	S_NDTres<=regwdat(13) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';
	S_ERRres<=regwdat(12) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';
	S_DITres<=regwdat(10) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';
	S_PCTres<=regwdat( 9) when regaddr(5 downto 1)="00000" and regwr(1)='1' else '0';

	process(clk,rstn)
	variable ldrqx	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				drqx<='0';
				drqe<='0';
				ldrqx:='0';
			elsif(ce = '1')then
				drqx<=drq;
				if(drqx='1' and ldrqx='0')then
					drqe<='1';
				elsif(drqeclr='1')then
					drqe<='0';
				end if;
				ldrqx:=drqx;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				DCR_XRM<=(others=>'0');
				DCR_DTYPE<=(others=>'0');
				DCR_DPS<='0';
				DCR_PCL<=(others=>'0');
				OCR_DIR<='0';
				OCR_BTD<='0';
				OCR_SIZE<=(others=>'0');
				OCR_CHAIN<=(others=>'0');
				OCR_REQG<=(others=>'0');
				SCR_MAC<=(others=>'0');
				SCR_DAC<=(others=>'0');
				CCR_STR<='0';
				CCR_CNT<='0';
				CCR_HLT<='0';
				CCR_SAB<='0';
				CCR_INT<='0';
				CPR_CP<=(others=>'0');
			elsif(ce = '1')then
				CCR_STR<='0';
				CCR_SAB<='0';
				case regaddr(5 downto 1) is
				when "00010" =>
					if(regwr(1)='1')then
						DCR_XRM<=regwdat(15 downto 14);
						DCR_DTYPE<=regwdat(13 downto 12);
						DCR_DPS<=regwdat(11);
						DCR_PCL<=regwdat(9 downto 8);
					end if;
					if(regwr(0)='1')then
						OCR_DIR<=regwdat(7);
						OCR_BTD<=regwdat(6);
						OCR_SIZE<=regwdat(5 downto 4);
						OCR_CHAIN<=regwdat(3 downto 2);
						OCR_REQG<=regwdat(1 downto 0);
					end if;
				when "00011" =>
					if(regwr(1)='1')then
						SCR_MAC<=regwdat(11 downto 10);
						SCR_DAC<=regwdat(9 downto 8);
					end if;
					if(regwr(0)='1')then
						CCR_STR<=regwdat(7);
						CCR_CNT<=regwdat(6);
						CCR_HLT<=regwdat(5);
						CCR_SAB<=regwdat(4);
						CCR_INT<=regwdat(3);
					end if;
				when "10010" =>
					if(regwr(0)='1')then
						NIV<=regwdat(7 downto 0);
					end if;
				when "10011" =>
					if(regwr(0)='1')then
						EIV<=regwdat(7 downto 0);
					end if;
				when "10110" =>
					if(regwr(0)='1')then
						CPR_CP<=regwdat(1 downto 0);
					end if;
				when others =>
				end case;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				b_indatl<=(others=>'0');
			elsif(ce = '1')then
				b_indatl<=b_indat;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				MTC<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="00101")then
					if(regwr(1)='1')then
						MTC(15 downto 8)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						MTC(7 downto 0)<=regwdat(7 downto 0);
					end if;
				end if;
				if(MTC_dec='1')then
					MTC<=MTC-x"0001";
				elsif(MTC_dec2='1')then
					MTC<=MTC-x"0002";
				elsif(MTC_load='1')then
					MTC<=b_indatl;
				elsif(MTC_BTC='1')then
					MTC<=BTC;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				MAR<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="00110")then
					if(regwr(1)='1')then
						MAR(31 downto 24)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						MAR(23 downto 16)<=regwdat(7 downto 0);
					end if;
				elsif(regaddr(5 downto 1)="00111")then
					if(regwr(1)='1')then
						MAR(15 downto 8)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						MAR(7 downto 0)<=regwdat(7 downto 0);
					end if;
				end if;
				if(MAR_incb='1')then
					MAR<=MAR+x"00000001";
				elsif(MAR_incw='1')then
					MAR<=MAR+x"00000002";
				elsif(MAR_incl='1')then
					MAR<=MAR+x"00000004";
				elsif(MAR_decb='1')then
					MAR<=MAR-x"00000001";
				elsif(MAR_decw='1')then
					MAR<=MAR-x"00000002";
				elsif(MAR_dec3='1')then
					MAR<=MAR-x"00000003";
				elsif(MAR_decl='1')then
					MAR<=MAR-x"00000004";
				elsif(MAR_loadh='1')then
					MAR(31 downto 16)<=b_indatl;
				elsif(MAR_loadl='1')then
					MAR(15 downto 0)<=b_indatl;
				elsif(MAR_BAR='1')then
					MAR<=BAR;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				DAR<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="01010")then
					if(regwr(1)='1')then
						DAR(31 downto 24)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						DAR(23 downto 16)<=regwdat(7 downto 0);
					end if;
				elsif(regaddr(5 downto 1)="01011")then
					if(regwr(1)='1')then
						DAR(15 downto 8)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						DAR(7 downto 0)<=regwdat(7 downto 0);
					end if;
				end if;
				if(DAR_incl='1')then
					DAR<=DAR+x"00000004";
				elsif(DAR_decl='1')then
					DAR<=DAR-x"00000004";
				elsif(DAR_dec3='1')then
					DAR<=DAR-x"00000003";
				elsif(DAR_incw='1')then
					DAR<=DAR+x"00000002";
				elsif(DAR_decw='1')then
					DAR<=DAR-x"00000002";
				elsif(DAR_incb='1')then
					DAR<=DAR+x"00000001";
				elsif(DAR_decb='1')then
					DAR<=DAR-x"00000001";
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				BTC<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="01101")then
					if(regwr(1)='1')then
						BTC(15 downto 8)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						BTC(7 downto 0)<=regwdat(7 downto 0);
					end if;
				end if;
				if(BTC_dec='1')then
					BTC<=BTC-x"0001";
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				BAR<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="01110")then
					if(regwr(1)='1')then
						BAR(31 downto 24)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						BAR(23 downto 16)<=regwdat(7 downto 0);
					end if;
				elsif(regaddr(5 downto 1)="01111")then
					if(regwr(1)='1')then
						BAR(15 downto 8)<=regwdat(15 downto 8);
					end if;
					if(regwr(0)='1')then
						BAR(7 downto 0)<=regwdat(7 downto 0);
					end if;
				end if;
				if(BAR_loadh='1')then
					BAR(31 downto 16)<=b_indatl;
				elsif(BAR_loadl='1')then
					BAR(15 downto 0)<=b_indatl;
				elsif(BAR_inc='1')then
					BAR<=BAR+x"00000006";
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				MFC<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="10100" and regwr(0)='1')then
					MFC<=regwdat(2 downto 0);
				elsif(MFC_BFC='1')then
					MFC<=BFC;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				DFC<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="11000" and regwr(0)='1')then
					DFC<=regwdat(2 downto 0);
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				BFC<=(others=>'0');
			elsif(ce = '1')then
				if(regaddr(5 downto 1)="11100" and regwr(0)='1')then
					BFC<=regwdat(2 downto 0);
				end if;
			end if;
		end if;
	end process;


	S_PCS<=pcli;

	S_ACT<='0' when STATE=ST_IDLE else '1';
	buschk<=reqwait when STATE=ST_BUSWAIT or STATE=ST_CHAINBUSWAIT else '0';

	GCR_BT <= (others => '0');
	GCR_BR <= (others => '0');
	
	regrdatx<=
		S_COC & S_BTC & S_NDT & S_ERR & S_ACT & S_DIT & S_PCT & S_PCS & "000" & S_CER when regaddr(5 downto 1)="00000" else
		DCR_XRM & DCR_DTYPE & DCR_DPS & '0' & DCR_PCL & OCR_DIR & OCR_BTD & OCR_SIZE & OCR_CHAIN & OCR_REQG when regaddr(5 downto 1)="00010" else
		"0000" & SCR_MAC & SCR_DAC & '0' & CCR_CNT & CCR_HLT & CCR_SAB & CCR_INT & "000" when regaddr(5 downto 1)="00011" else
		MTC when regaddr(5 downto 1)="00101" else
		MAR(31 downto 16) when regaddr(5 downto 1)="00110" else
		MAR(15 downto 0) when regaddr(5 downto 1)="00111" else
		DAR(31 downto 16) when regaddr(5 downto 1)="01010" else
		DAR(15 downto 0) when regaddr(5 downto 1)="01011" else
		BTC when regaddr(5 downto 1)="01101" else
		BAR(31 downto 16) when regaddr(5 downto 1)="01110" else
		BAR(15 downto 0) when regaddr(5 downto 1)="01111" else
		x"00" & "00000" & MFC when regaddr(5 downto 1)="10100" else
		x"00" & "00000" & DFC when regaddr(5 downto 1)="11000" else
		x"00" & "00000" & BFC when regaddr(5 downto 1)="11100" else
		x"00" & NIV when regaddr(5 downto 1)="10010" else
		x"00" & EIV when regaddr(5 downto 1)="10011" else
		x"00" & "000000" & CPR_CP when regaddr(5 downto 1)="10110" else
		x"000" & GCR_BT & GCR_BR when regaddr(5 downto 1)="11111" else
		x"0000";

--	process(clk)begin
--		if(ce = '1')then
			regrdat<=regrdatx;
--		end if;
--	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				CHactive<='0';
			elsif(ce = '1')then
				if(CCR_STR='1')then
					CHactive<='1';
				elsif(CCR_SAB='1')then
					CHactive<='0';
				elsif(int_comp='1')then
					CHactive<='0';
				end if;
			end if;
		end if;
	end process;

	packen<=	'0' when OCR_SIZE/="00" else
				'0' when DCR_DPS='0' else
				'0' when MTC<x"0002" else
				'1' when DAR(0)='0' and MAR(0)='0' and SCR_DAC(1)='0' and SCR_MAC(1)='0' else
				'1' when DAR(0)='1' and MAR(0)='1' and SCR_DAC(1)='1' and SCR_MAC(1)='1' else
				'0';

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				STATE<=ST_IDLE;
				busreq<='0';
				--ldrq<='0';
				dack<='0';
				BUSADDR<=(others=>'0');
				b_outdat<=(others=>'0');
				b_doe<='0';
				b_as<='1';
				b_rwn<='1';
				b_uds<='1';
				b_lds<='1';
				d_rd<='0';
				d_wr<='0';
				TXDAT<=(others=>'0');
				bytecnt<=0;

				MTC_dec		<='0';
				MTC_dec2		<='0';
				MTC_load	<='0';
				MTC_BTC		<='0';

				MAR_incb	<='0';
				MAR_decb	<='0';
				MAR_incw	<='0';
				MAR_decw	<='0';
				MAR_incl	<='0';
				MAR_decl	<='0';
				MAR_loadh	<='0';
				MAR_loadl	<='0';
				MAR_BAR		<='0';

				DAR_incb		<='0';
				DAR_decb		<='0';
				DAR_incw		<='0';
				DAR_decw		<='0';
				DAR_incl		<='0';
				DAR_decl		<='0';

				BTC_dec		<='0';

				BAR_loadh	<='0';
				BAR_loadl	<='0';
				BAR_inc		<='0';

				MFC_BFC		<='0';

				CONT_clr<='0';
				int_comp<='0';
				S_BTCset<='0';
				CONTMODE<='0';
				reqwait<='0';
				drqeclr<='0';
			elsif(ce = '1')then
				MTC_dec		<='0';
				MTC_dec2		<='0';
				MTC_load	<='0';
				MTC_BTC		<='0';
				MAR_incb	<='0';
				MAR_decb	<='0';
				MAR_incw	<='0';
				MAR_decw	<='0';
				MAR_incl	<='0';
				MAR_decl	<='0';
				MAR_dec3	<='0';
				MAR_loadh	<='0';
				MAR_loadl	<='0';
				MAR_BAR		<='0';
				DAR_incb		<='0';
				DAR_decb		<='0';
				DAR_incw		<='0';
				DAR_decw		<='0';
				DAR_incl		<='0';
				DAR_decl		<='0';
				DAR_dec3		<='0';
				BTC_dec		<='0';
				BAR_loadh	<='0';
				BAR_loadl	<='0';
				BAR_inc		<='0';
				MFC_BFC		<='0';
				CONT_clr<='0';
				--ldrq<=drqx;
				int_comp<='0';
				S_BTCset<='0';
				drqeclr<='0';
				if(reqwait='1')then
					reqwait<='0';
				else
					case STATE is
					when ST_IDLE =>
						if(CHactive='1')then
							drqeclr<='1';
							CONTMODE<='0';
							if(OCR_CHAIN(1)='1')then
								busreq<='1';
								STATE<=ST_CHAINBUSWAIT;
								reqwait<='1';
							else
								state<=st_RQWAIT;
							end if;
						end if;
					when ST_RQWAIT =>
						if(CHactive='0')then
							STATE<=ST_IDLE;
						else
							case OCR_REQG is
							when "00" | "01" =>
								busreq<='1';
								bytecnt<=0;
								STATE<=ST_BUSWAIT;
								reqwait<='1';
							when "10" =>
								case DCR_XRM is
								when "10" | "11"=>
									if(drqe='1' and drqx='1')then
										busreq<='1';
										bytecnt<=0;
										STATE<=ST_BUSWAIT;
										reqwait<='1';
										drqeclr<='1';
									end if;
								when others =>
									if(drqx='1')then
										busreq<='1';
										bytecnt<=0;
										STATE<=ST_BUSWAIT;
										reqwait<='1';
										drqeclr<='1';
									end if;
								end case;
							when "11" =>
								case DCR_XRM is
								when "10" | "11" =>
									if((drqe='1' and drqx='1') or CONTMODE='0')then
										busreq<='1';
										CONTMODE<='1';
										STATE<=ST_BUSWAIT;
										reqwait<='1';
										drqeclr<='1';
									end if;
								when others =>
									if(drqx='1' or CONTMODE='0')then
										busreq<='1';
										CONTMODE<='1';
										STATE<=ST_BUSWAIT;
										reqwait<='1';
										drqeclr<='1';
									end if;
								end case;
							when others =>
								STATE<=ST_IDLE;
							end case;
						end if;
					when ST_BUSWAIT =>
						busreq<='1';
						if(busact='1')then
							if(DCR_DTYPE(1)='1')then	--single address
								if(OCR_DIR='0')then		--MEM->DEV
									BUSADDR<=MAR;
									b_as<='0';
									b_rwn<='1';
									if(DCR_DPS='1')then	--16bit
										b_lds<='0';
										b_uds<='0';
									else				--8bit
										b_uds<=MAR(0);
										b_lds<=not MAR(0);
									end if;
								else					--DEV->MEM
									dack<='1';
									d_rd<='1';
									BUSADDR<=MAR;
									b_lds<='0';
								end if;
							else	--dual address
								if(OCR_DIR='0')then
									BUSADDR<=MAR;
								else
									BUSADDR<=DAR;
								end if;
								b_as<='0';
								b_rwn<='1';
								b_uds<='0';
								b_lds<='0';
							end if;
							STATE<=ST_READ;
						end if;
					when ST_READ =>
						if(DCR_DTYPE(1)='1')then
							if(OCR_DIR='1')then
								if(DCR_DPS='1')then
									b_uds<='0';
									b_lds<='0';
								else
									b_uds<=MAR(0);
									b_lds<=not MAR(0);
								end if;
								STATE<=ST_WRITE;
							else
								if(b_ack='0')then
									dack<='1';
									d_wr<='1';
									STATE<=ST_WRITE;
								end if;
							end if;
						else
							if(b_ack='0')then
								b_as<='1';
								b_rwn<='1';
								b_uds<='1';
								b_lds<='1';
								if(OCR_DIR='0')then
									BUSADDR<=DAR;
									if(MAR(0)='0')then
										TXDAT(7 downto 0)<=b_indat(15 downto 8);
									else
										TXDAT(7 downto 0)<=b_indat(7 downto 0);
									end if;
								else
									BUSADDR<=MAR;
									if(DAR(0)='0')then
										TXDAT(7 downto 0)<=b_indat(15 downto 8);
									else
										TXDAT(7 downto 0)<=b_indat(7 downto 0);
									end if;
								end if;
								if(OCR_SIZE="01" or OCR_SIZE="10" or packen='1')then
									TXDAT(15 downto 0)<=b_indat;
								end if;
								STATE<=ST_CHDIR;
							end if;
						end if;
					when ST_CHDIR =>
						b_as<='0';
						b_rwn<='0';
						if(OCR_SIZE="01" or OCR_SIZE="10" or packen='1')then
							b_uds<='0';
							b_lds<='0';
							b_outdat<=TXDAT(15 downto 0);
							b_doe<='1';
						else
							if(OCR_DIR='0')then
								b_uds<=DAR(0);
								b_lds<=not DAR(0);
							else
								b_uds<=MAR(0);
								b_lds<=not MAR(0);
							end if;
							b_outdat<=TXDAT(7 downto 0) & TXDAT(7 downto 0);
							b_doe<='1';
						end if;
						STATE<=ST_WRITE;
					when ST_WRITE =>
						if(DCR_DTYPE(1)='1' and OCR_DIR='0')then	--single address & MEM->DEV
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							b_doe<='0';
							d_rd<='0';
							d_wr<='0';
							STATE<=ST_NEXT;
						elsif(b_ack='0')then
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							b_doe<='0';
							d_rd<='0';
							d_wr<='0';
							STATE<=ST_NEXT;
						end if;
					when ST_NEXT =>
						case SCR_MAC is
						when "01" =>
							if(packen='1')then
								MAR_incw<='1';
							else
								case OCR_SIZE is
								when "00" | "11" =>
									MAR_incb<='1';
								when "01" =>
									MAR_incw<='1';
								when "10" =>
									MAR_incl<='1';
								when others =>
								end case;
							end if;
						when "10" =>
							if(packen='1')then
								MAR_decw<='1';
							else
								case OCR_SIZE is
								when "00" | "11" =>
									MAR_decb<='1';
								when "01" =>
									MAR_decw<='1';
								when "10" =>
									MAR_decl<='1';
								when others =>
								end case;
							end if;
						when others =>
						end case;

						case SCR_DAC is
						when "01" =>
							if(DCR_DPS='0')then
								DAR_incw<='1';
							elsif(OCR_SIZE="01" or packen='1')then
								DAR_incw<='1';
							elsif(OCR_SIZE="10")then
								DAR_incl<='1';
							else
								DAR_incb<='1';
							end if;
						when "10" =>
							if(DCR_DPS='0')then
								DAR_decw<='1';
							elsif(OCR_SIZE="01" or packen='1')then
								DAR_decw<='1';
							elsif(OCR_SIZE="10")then
								DAR_decl<='1';
							else
								DAR_decb<='1';
							end if;
						when others =>
						end case;
						if(DCR_DPS='1')then	--16bit
							case OCR_SIZE is
							when "00" | "01" | "11" =>
								if(packen='1')then
									MTC_dec2<='1';
								else
									MTC_dec<='1';
								end if;
								if(MTC=x"0001" or (packen='1' and MTC=x"0002"))then
									if(CCR_CNT='1')then
										S_BTCset<='1';
										STATE<=ST_NBLOCK;
									elsif(OCR_CHAIN(1)='1')then
										STATE<=ST_NBLOCK;
									else
										busreq<='0';
										int_comp<='1';
										STATE<=ST_IDLE;
									end if;
								else
									--STATE<=ST_CONT;
									case OCR_REQG is
									when "00" | "01" =>
										STATE<=ST_BUSWAIT;
										reqwait<='1';
									when "10" | "11" =>
										busreq<='0';
										STATE<=ST_RQWAIT;
									when others =>
									end case;
								end if;
							when "10" =>
								bytecnt<=bytecnt+2;
								if(bytecnt=2)then
									MAR_decw<='1';
									DAR_decw<='1';
									bytecnt<=0;
									MTC_dec<='1';
									if(MTC=x"0001")then
										if(CCR_CNT='1')then
											S_BTCset<='1';
											STATE<=ST_NBLOCK;
										elsif(OCR_CHAIN(1)='1')then
											STATE<=ST_NBLOCK;
										else
											busreq<='0';
											int_comp<='1';
											STATE<=ST_IDLE;
										end if;
									else
										--STATE<=ST_CONT;
										case OCR_REQG is
										when "00" | "01" =>
											STATE<=ST_BUSWAIT;
											reqwait<='1';
										when "10" | "11" =>
											busreq<='0';
											STATE<=ST_RQWAIT;
										when others =>
										end case;
									end if;
								else
									MAR_incw<='1';
									DAR_incw<='1';
									STATE<=ST_BUSWAIT;
									reqwait<='1';
								end if;
							when others =>
								STATE<=ST_IDLE;
							end case;
						else				--8bit
							case OCR_SIZE is
							when "00" | "11" =>
								MTC_dec<='1';
								if(MTC=x"0001")then
									if(CCR_CNT='1')then
										S_BTCset<='1';
										STATE<=ST_NBLOCK;
									elsif(OCR_CHAIN(1)='1')then
										STATE<=ST_NBLOCK;
									else
										busreq<='0';
										int_comp<='1';
										STATE<=ST_IDLE;
									end if;
								else
										--STATE<=ST_CONT;
									case OCR_REQG is
									when "00" | "01" =>
										STATE<=ST_BUSWAIT;
										reqwait<='1';
									when "10" | "11" =>
										busreq<='0';
										STATE<=ST_RQWAIT;
									when others =>
									end case;
								end if;
							when "01" =>
								bytecnt<=bytecnt+1;
								if(bytecnt=1)then
									bytecnt<=0;
									MTC_dec<='1';
									if(MTC=x"0001")then
										if(CCR_CNT='1')then
											S_BTCset<='1';
											STATE<=ST_NBLOCK;
										elsif(OCR_CHAIN(1)='1')then
											STATE<=ST_NBLOCK;
										else
											busreq<='0';
											int_comp<='1';
											STATE<=ST_IDLE;
										end if;
									else
										--STATE<=ST_CONT;
										case OCR_REQG is
										when "00" | "01" =>
											STATE<=ST_BUSWAIT;
											reqwait<='1';
										when "10" | "11" =>
											busreq<='0';
											STATE<=ST_RQWAIT;
										when others =>
										end case;
									end if;
								else
									STATE<=ST_BUSWAIT;
									reqwait<='1';
								end if;
							when "10" =>
								bytecnt<=bytecnt+1;
								if(bytecnt=3)then
									MAR_dec3<='1';
									DAR_dec3<='1';
									bytecnt<=0;
									MTC_dec<='1';
									if(MTC=x"0001")then
										STATE<=ST_NBLOCK;
									else
										--STATE<=ST_CONT;
										case OCR_REQG is
										when "00" | "01" =>
											STATE<=ST_BUSWAIT;
											reqwait<='1';
										when "10" | "11" =>
											busreq<='0';
											STATE<=ST_RQWAIT;
										when others =>
										end case;
									end if;
								else
									MAR_incb<='1';
									DAR_incb<='1';
									STATE<=ST_BUSWAIT;
									reqwait<='1';
								end if;
							when others =>
								busreq<='0';
								STATE<=ST_IDLE;
							end case;
						end if;
					when ST_NBLOCK =>
						case OCR_CHAIN is
						when "00" =>
							if(CONT='1')then
								CONT_clr<='1';
								MTC_BTC<='1';
								MFC_BFC<='1';
								STATE<=ST_BUSCONT;
							else
								int_comp<='1';
								busreq<='0';
								STATE<=ST_IDLE;
							end if;
						when "10" =>
							if(BTC=x"0001")then
								int_comp<='1';
								busreq<='0';
								STATE<=ST_IDLE;
							else
								BUSADDR<=BAR;
								STATE<=ST_CHAINH;
							end if;
							BTC_dec<='1';
						when "11" =>
							if(BAR=x"00000000")then
								int_comp<='1';
								busreq<='0';
								STATE<=ST_IDLE;
							else
								BUSADDR<=BAR;
								STATE<=ST_CHAINH;
							end if;
						when others =>
							busreq<='0';
							STATE<=ST_IDLE;
						end case;
					when ST_CHAINBUSWAIT =>
						if(CHactive='1')then
							busreq<='1';
							if(busact='1')then
								BUSADDR<=BAR;
								STATE<=ST_CHAINH;
							end if;
						else
							busreq<='0';
							STATE<=ST_IDLE;
						end if;
					when ST_CHAINH =>
							b_as<='0';
							b_rwn<='1';
							b_uds<='0';
							b_lds<='0';
							STATE<=ST_CHAINHA;
					when ST_CHAINHA =>
						if(b_ack='0')then
							MAR_loadh<='1';
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							BUSADDR<=BAR+x"00000002";
							STATE<=ST_CHAINL;
						end if;
					when ST_CHAINL =>
						b_as<='0';
						b_rwn<='1';
						b_uds<='0';
						b_lds<='0';
						STATE<=ST_CHAINLA;
					when ST_CHAINLA =>
						if(b_ack='0')then
							MAR_loadl<='1';
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							BUSADDR<=BAR+x"00000004";
							STATE<=ST_CHAINC;
						end if;
					when ST_CHAINC =>
						b_as<='0';
						b_rwn<='1';
						b_uds<='0';
						b_lds<='0';
						STATE<=ST_CHAINCA;
					when ST_CHAINCA =>
						if(b_ack='0')then
							MTC_load<='1';
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							if(OCR_CHAIN="11")then
								BUSADDR<=BAR+x"00000006";
								STATE<=ST_CHAINNH;
							else
								BAR_inc<='1';
								STATE<=ST_BUSCONT;
							end if;
						end if;
					when ST_CHAINNH =>
						b_as<='0';
						b_rwn<='1';
						b_uds<='0';
						b_lds<='0';
						STATE<=ST_CHAINNHA;
					when ST_CHAINNHA =>
						if(b_ack='0')then
							BAR_loadh<='1';
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							BUSADDR<=BAR+x"00000008";
							STATE<=ST_CHAINNL;
						end if;
					when ST_CHAINNL =>
						b_as<='0';
						b_rwn<='1';
						b_uds<='0';
						b_lds<='0';
						STATE<=ST_CHAINNLA;
					when ST_CHAINNLA =>
						if(b_ack='0')then
							BAR_loadl<='1';
							b_as<='1';
							b_rwn<='1';
							b_uds<='1';
							b_lds<='1';
							STATE<=ST_BUSCONT;
						end if;
	--				when ST_CONT =>
	--					case OCR_REQG is
	--					when "00" | "01" =>
	--						STATE<=ST_BUSWAIT;
	--						reqwait<='1';
	--					when "10" | "11" =>
	--						busreq<='0';
	--						STATE<=ST_RQWAIT;
	--					when others =>
	--					end case;
					when ST_BUSCONT =>
						if(MAR=x"00000000")then
							int_comp<='1';
							busreq<='0';
							STATE<=ST_IDLE;
						else
							busreq<='0';
							STATE<=ST_RQWAIT;
						end if;
					when others =>
						STATE<=ST_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)
	variable lCNT	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				CONT<='0';
				TERR_CNT<='0';
				CERR_CNT<='0';
				lCNT:='0';
			elsif(ce = '1')then
				TERR_CNT<='0';
				CERR_CNT<='0';
				if(lCNT='0' and CCR_CNT='1')then
					if(OCR_CHAIN(1)='1' and S_ACT='0')then
						TERR_CNT<='1';
					elsif(OCR_CHAIN(1)='1')then
						CERR_CNT<='1';
					else
						CONT<='1';
					end if;
				elsif(CONT_clr='1')then
					CONT<='0';
				end if;
				lCNT:=CCR_CNT;
			end if;
		end if;
	end process;

	CERR_SET<=CERR_CNT;
	TERR_SET<=TERR_CNT;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				S_ERRset<='0';
				S_CER<=(others=>'0');
			elsif(ce = '1')then
				S_ERRset<='0';
				if(CERR_SET='1')then
					S_CER<="00001";
					S_ERRset<='1';
				elsif(TERR_SET='1')then
					S_CER<="00010";
					S_ERRset<='1';
				elsif(int_comp='1')then
					S_CER<="00000";
				end if;
			end if;
		end if;
	end process;


	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				irq<='0';
				ivect<=(others=>'0');
			elsif(ce = '1')then
				if(int_comp='1')then
					irq<='1';
					ivect<=NIV;
				elsif(S_BTCset='1')then
					irq<='1';
					ivect<=NIV;
				elsif(S_ERRset='1')then
					irq<='1';
					ivect<=EIV;
				elsif(iack='1')then
					irq<='0';
					ivect<=(others=>'0');
				end if;
				if(CCR_INT='0')then
					irq<='0';
				end if;
			end if;
		end if;
	end process;

	reqg<='1' when OCR_REQG="00" else '0';
	pri<=CPR_CP;
	b_addr<=BUSADDR(23 downto 0);

	doneo<=int_comp;

	bt<=GCR_BT;
	BR<=GCR_BR;

end rtl;