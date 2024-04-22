LIBRARY	IEEE,work;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.vcaddr_pkg.all;

entity vcreg is
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	doe		:out std_logic;
	
	htotal		:out std_logic_vector(7 downto 0);
	hsync		:out std_logic_vector(7 downto 0);
	hvbgn		:out std_logic_vector(7 downto 0);
	hvend		:out std_logic_vector(7 downto 0);
	vtotal		:out std_logic_vector(9 downto 0);
	vsync		:out std_logic_vector(9 downto 0);
	vvbgn		:out std_logic_vector(9 downto 0);
	vvend		:out std_logic_vector(9 downto 0);
	hadj		:out std_logic_vector(7 downto 0);
	intraster	:out std_logic_vector(9 downto 0);
	txtoffsetx	:out std_logic_vector(9 downto 0);
	txtoffsety	:out std_logic_vector(9 downto 0);
	g0offsetx	:out std_logic_vector(9 downto 0);
	g0offsety	:out std_logic_vector(9 downto 0);
	g1offsetx	:out std_logic_vector(8 downto 0);
	g1offsety	:out std_logic_vector(8 downto 0);
	g2offsetx	:out std_logic_vector(8 downto 0);
	g2offsety	:out std_logic_vector(8 downto 0);
	g3offsetx	:out std_logic_vector(8 downto 0);
	g3offsety	:out std_logic_vector(8 downto 0);
	siz			:out std_logic;
	col			:out std_logic_vector(1 downto 0);
	HF			:out std_logic;
	VD			:out std_logic_vector(1 downto 0);
	HD			:out std_logic_vector(1 downto 0);
	MEN			:out std_logic;
	SA			:out std_logic;
	AP			:out std_logic_vector(3 downto 0);
	CP			:out std_logic_vector(3 downto 0);
	csrc		:out std_logic_vector(7 downto 0);
	cdst		:out std_logic_vector(7 downto 0);
	tmask		:out std_logic_vector(15 downto 0);
	RCbgn		:out std_logic;
	RCend		:out std_logic;
	FCbgn		:out std_logic;
	FCend		:out std_logic;
	VIbgn		:out std_logic;
	VIend		:out std_logic;
	RCbusy		:in std_logic;
	FCbusy		:in std_logic;
	VIbusy		:in std_logic;
	GR_SIZE		:out std_logic;
	GR_CMODE	:out std_logic_vector(1 downto 0);
	PRI_SP		:out std_logic_vector(1 downto 0);
	PRI_TX		:out std_logic_vector(1 downto 0);
	PRI_GR		:out std_logic_vector(1 downto 0);
	GR_PRI		:out std_logic_vector(7 downto 0);
	GRPEN		:out std_logic_vector(4 downto 0);
	TXTEN		:out std_logic;
	SPREN		:out std_logic;
	DC          :out std_logic;
	GT			:out std_logic;
	GG			:out std_logic;
	BP			:out std_logic;
	HP			:out std_logic;
	EXON		:out std_logic;
	VHT			:out std_logic;
	AH			:out std_logic;
	YS			:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end vcreg;

architecture rtl of vcreg is
signal	rhtotal		:std_logic_vector(7 downto 0);
signal	rhsync		:std_logic_vector(7 downto 0);
signal	rhvbgn		:std_logic_vector(7 downto 0);
signal	rhvend		:std_logic_vector(7 downto 0);
signal	rvtotal		:std_logic_vector(9 downto 0);
signal	rvsync		:std_logic_vector(9 downto 0);
signal	rvvbgn		:std_logic_vector(9 downto 0);
signal	rvvend		:std_logic_vector(9 downto 0);
signal	rhadj		:std_logic_vector(7 downto 0);
signal	rintraster	:std_logic_vector(9 downto 0);
signal	rtxtoffsetx	:std_logic_vector(9 downto 0);
signal	rtxtoffsety	:std_logic_vector(9 downto 0);
signal	rg0offsetx	:std_logic_vector(9 downto 0);
signal	rg0offsety	:std_logic_vector(9 downto 0);
signal	rg1offsetx	:std_logic_vector(8 downto 0);
signal	rg1offsety	:std_logic_vector(8 downto 0);
signal	rg2offsetx	:std_logic_vector(8 downto 0);
signal	rg2offsety	:std_logic_vector(8 downto 0);
signal	rg3offsetx	:std_logic_vector(8 downto 0);
signal	rg3offsety	:std_logic_vector(8 downto 0);
signal	rsiz		:std_logic;
signal	rcol		:std_logic_vector(1 downto 0);
signal	rHF			:std_logic;
signal	rVD			:std_logic_vector(1 downto 0);
signal	rHD			:std_logic_vector(1 downto 0);
signal	rMEN		:std_logic;
signal	rSA			:std_logic;
signal	rAP			:std_logic_vector(3 downto 0);
signal	rCP			:std_logic_vector(3 downto 0);
signal	rcsrc		:std_logic_vector(7 downto 0);
signal	rcdst		:std_logic_vector(7 downto 0);
signal	rtmask		:std_logic_vector(15 downto 0);
signal	rGR_SIZE	:std_logic;
signal	rGR_CMODE	:std_logic_vector(1 downto 0);
signal	rPRI_SP		:std_logic_vector(1 downto 0);
signal	rPRI_TX		:std_logic_vector(1 downto 0);
signal	rPRI_GR		:std_logic_vector(1 downto 0);
signal	rGR_PRI		:std_logic_vector(7 downto 0);
signal	rGRPEN		:std_logic_vector(4 downto 0);
signal	rTXTEN		:std_logic;
signal	rSPREN		:std_logic;
signal	rGT			:std_logic;
signal	rGG			:std_logic;
signal	rBP			:std_logic;
signal	rHP			:std_logic;
signal	rEXON		:std_logic;
signal	rVHT		:std_logic;
signal	rAH			:std_logic;
signal	rYS			:std_logic;
signal  rDC         :std_logic;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				rhtotal		<=(others=>'0');
				rhsync		<=(others=>'0');
				rhvbgn		<=(others=>'0');
				rhvend		<=(others=>'0');
				rvtotal		<=(others=>'0');
				rvsync		<=(others=>'0');
				rvvbgn		<=(others=>'0');
				rvvend		<=(others=>'0');
				rhadj		<=(others=>'0');
				rintraster	<=(others=>'0');
				rtxtoffsetx	<=(others=>'0');
				rtxtoffsety	<=(others=>'0');
				rg0offsetx	<=(others=>'0');
				rg0offsety	<=(others=>'0');
				rg1offsetx	<=(others=>'0');
				rg1offsety	<=(others=>'0');
				rg2offsetx	<=(others=>'0');
				rg2offsety	<=(others=>'0');
				rg3offsetx	<=(others=>'0');
				rg3offsety	<=(others=>'0');
				rsiz		<='0';
				rcol		<=(others=>'0');
				rHF			<='0';
				rVD			<=(others=>'0');
				rDC         <='0';
				rHD			<=(others=>'0');
				rMEN		<='0';
				rSA			<='0';
				rAP			<=(others=>'0');
				rCP			<=(others=>'0');
				rcsrc		<=(others=>'0');
				rcdst		<=(others=>'0');
				rGR_SIZE	<='0';
				rGR_CMODE	<=(others=>'0');
				rGR_PRI		<=(others=>'0');
				rGRPEN		<=(others=>'0');
				rTXTEN		<='0';
				rSPREN		<='0';
				rGT			<='0';
				rGG			<='0';
				rBP			<='0';
				rHP			<='0';
				rEXON		<='0';
				rVHT		<='0';
				rAH			<='0';
				rYS			<='0';
			elsif(ce = '1')then
				case addr(23 downto 1) is
				when SYS_DC(23 downto 1) =>
					if(wr(0)='1')then
						rDC<=wdat(1);
					end if;
				when VC_R00(23 downto 1) =>
					if(wr(0)='1')then
						rhtotal(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R01(23 downto 1) =>
					if(wr(0)='1')then
						rhsync(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R02(23 downto 1) =>
					if(wr(0)='1')then
						rhvbgn(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R03(23 downto 1) =>
					if(wr(0)='1')then
						rhvend(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R04(23 downto 1) =>
					if(wr(1)='1')then
						rvtotal(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rvtotal(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R05(23 downto 1) =>
					if(wr(1)='1')then
						rvsync(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rvsync(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R06(23 downto 1) =>
					if(wr(1)='1')then
						rvvbgn(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rvvbgn(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R07(23 downto 1) =>
					if(wr(1)='1')then
						rvvend(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rvvend(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R08(23 downto 1) =>
					if(wr(0)='1')then
						rhadj(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R09(23 downto 1) =>
					if(wr(1)='1')then
						rintraster(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rintraster(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R10(23 downto 1) =>
					if(wr(1)='1')then
						rtxtoffsetx(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rtxtoffsetx(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R11(23 downto 1) =>
					if(wr(1)='1')then
						rtxtoffsety(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rtxtoffsety(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R12(23 downto 1) =>
					if(wr(1)='1')then
						rg0offsetx(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rg0offsetx(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R13(23 downto 1) =>
					if(wr(1)='1')then
						rg0offsety(9 downto 8)<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rg0offsety(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R14(23 downto 1) =>
					if(wr(1)='1')then
						rg1offsetx(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg1offsetx(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R15(23 downto 1) =>
					if(wr(1)='1')then
						rg1offsety(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg1offsety(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R16(23 downto 1) =>
					if(wr(1)='1')then
						rg2offsetx(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg2offsetx(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R17(23 downto 1) =>
					if(wr(1)='1')then
						rg2offsety(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg2offsety(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R18(23 downto 1) =>
					if(wr(1)='1')then
						rg3offsetx(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg3offsetx(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R19(23 downto 1) =>
					if(wr(1)='1')then
						rg3offsety(8)<=wdat(8);
					end if;
					if(wr(0)='1')then
						rg3offsety(7 downto 0)<=wdat(7 downto 0);
					end if;
				when VC_R20(23 downto 1) =>
					if(wr(1)='1')then
						rsiz<=wdat(10);
						rcol<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rHF<=wdat(4);
						rVD<=wdat(3 downto 2);
						rHD<=wdat(1 downto 0);
					end if;
				when VC_R21(23 downto 1) =>
					if(wr(1)='1')then
						rMEN<=wdat(9);
						rSA<=wdat(8);
					end if;
					if(wr(0)='1')then
						rAP<=wdat(7 downto 4);
						rCP<=wdat(3 downto 0);
					end if;
				when VC_R22(23 downto 1) =>
					if(wr(1)='1')then
						rcsrc<=wdat(15 downto 8);
					end if;
					if(wr(0)='1')then
						rcdst<=wdat(7 downto 0);
					end if;
				when VC_R23(23 downto 1) =>
					if(wr(1)='1')then
						rtmask(15 downto 8)<=wdat(15 downto 8);
					end if;
					if(wr(0)='1')then
						rtmask(7 downto 0)<=wdat(7 downto 0);
					end if;

				when others =>
				end case;

				case addr(23 downto 8) is
					when VC_R0s(15 downto 0) =>
					if(wr(0)='1')then
						rGR_SIZE<=wdat(2);
						rGR_CMODE<=wdat(1 downto 0);
					end if;
				when VC_R1s(15 downto 0) =>
					if(wr(1)='1')then
						rPRI_SP<=wdat(13 downto 12);
						rPRI_TX<=wdat(11 downto 10);
						rPRI_GR<=wdat(9 downto 8);
					end if;
					if(wr(0)='1')then
						rGR_PRI<=wdat(7 downto 0);
					end if;
				when VC_R2s(15 downto 0) =>
					if(wr(1)='1')then
						rYS<=wdat(15);
						rAH<=wdat(14);
						rVHT<=wdat(13);
						rEXON<=wdat(12);
						rHP<=wdat(11);
						rBP<=wdat(10);
						rGG<=wdat(9);
						rGT<=wdat(8);
					end if;
					if(wr(0)='1')then
						rSPREN<=wdat(6);
						rTXTEN<=wdat(5);
						rGRPEN<=wdat(4 downto 0);
					end if;
				when others =>
				end case;
			end if;
		end if;
	end process;
	
	RCbgn<='1' when addr(23 downto 1)=addr_RC(23 downto 1) and wr(0)='1' and wdat(3)='1' else '0';
	RCend<='1' when addr(23 downto 1)=addr_RC(23 downto 1) and wr(0)='1' and wdat(3)='0' else '0';
	FCbgn<='1' when addr(23 downto 1)=addr_FC(23 downto 1) and wr(0)='1' and wdat(1)='1' else '0';
	FCend<='1' when addr(23 downto 1)=addr_FC(23 downto 1) and wr(0)='1' and wdat(1)='0' else '0';
	VIbgn<='1' when addr(23 downto 1)=addr_VI(23 downto 1) and wr(0)='1' and wdat(0)='1' else '0';
	VIend<='1' when addr(23 downto 1)=addr_VI(23 downto 1) and wr(0)='1' and wdat(0)='0' else '0';
	
	htotal		<=rhtotal;
	hsync		<=rhsync;
	hvbgn		<=rhvbgn;
	hvend		<=rhvend;
	vtotal		<=rvtotal;
	vsync		<=rvsync;
	vvbgn		<=rvvbgn;
	vvend		<=rvvend;
	hadj		<=rhadj;
	intraster	<=rintraster;
	txtoffsetx	<=rtxtoffsetx;
	txtoffsety	<=rtxtoffsety;
	g0offsetx	<=rg0offsetx;
	g0offsety	<=rg0offsety;
	g1offsetx	<=rg1offsetx;
	g1offsety	<=rg1offsety;
	g2offsetx	<=rg2offsetx;
	g2offsety	<=rg2offsety;
	g3offsetx	<=rg3offsetx;
	g3offsety	<=rg3offsety;
	siz			<=rsiz;
	col			<=rcol;
	HF			<=rHF;
	VD			<=rVD;
	HD			<=rHD;
	MEN			<=rMEN;
	SA			<=rSA;
	AP			<=rAP;
	CP			<=rCP;
	csrc		<=rcsrc;
	cdst		<=rcdst;
	tmask		<=rtmask;
	GR_SIZE		<=rGR_SIZE;
	GR_CMODE	<=rGR_CMODE;
	PRI_SP		<=rPRI_SP;
	PRI_TX		<=rPRI_TX;
	PRI_GR		<=rPRI_GR;
	GR_PRI		<=rGR_PRI;
	GRPEN		<=rGRPEN;
	TXTEN		<=rTXTEN;
	SPREN		<=rSPREN;
	DC          <=rDC;
	GT			<=rGT;
	GG			<=rGG;
	BP			<=rBP;
	HP			<=rHP;
	EXON		<=rEXON;
	VHT			<=rVHT;
	AH			<=rAH;
	YS			<=rYS;
	
	rdat<=
		"00000000" &	rhtotal		when addr(23 downto 1)=VC_R00(23 downto 1) else
		"00000000" &	rhsync		when addr(23 downto 1)=VC_R01(23 downto 1) else
		"00000000" &	rhvbgn		when addr(23 downto 1)=VC_R02(23 downto 1) else
		"00000000" &	rhvend		when addr(23 downto 1)=VC_R03(23 downto 1) else
		"000000" &		rvtotal		when addr(23 downto 1)=VC_R04(23 downto 1) else
		"000000" &		rvsync		when addr(23 downto 1)=VC_R05(23 downto 1) else
		"000000" &		rvvbgn		when addr(23 downto 1)=VC_R06(23 downto 1) else
		"000000" &		rvvend		when addr(23 downto 1)=VC_R07(23 downto 1) else
		"00000000" &	rhadj		when addr(23 downto 1)=VC_R08(23 downto 1) else
		"000000" &		rintraster	when addr(23 downto 1)=VC_R09(23 downto 1) else
		"000000"&		rtxtoffsetx	when addr(23 downto 1)=VC_R10(23 downto 1) else
		"000000" &		rtxtoffsety	when addr(23 downto 1)=VC_R11(23 downto 1) else
		"000000" &		rg0offsetx	when addr(23 downto 1)=VC_R12(23 downto 1) else
		"000000" &		rg0offsety	when addr(23 downto 1)=VC_R13(23 downto 1) else
		"0000000" &		rg1offsetx	when addr(23 downto 1)=VC_R14(23 downto 1) else
		"0000000" &		rg1offsety	when addr(23 downto 1)=VC_R15(23 downto 1) else
		"0000000" &		rg2offsetx	when addr(23 downto 1)=VC_R16(23 downto 1) else
		"0000000" &		rg2offsety	when addr(23 downto 1)=VC_R17(23 downto 1) else
		"0000000" &		rg3offsetx	when addr(23 downto 1)=VC_R18(23 downto 1) else
		"0000000" &		rg3offsety	when addr(23 downto 1)=VC_R19(23 downto 1) else
		"00000" & rsiz & rcol	& "000" & rHF & rVD & rHD	when addr(23 downto 1)=VC_R20(23 downto 1) else
		"000000" & rMEN & rSA & rAP &  rCP	when addr(23 downto 1)=VC_R21(23 downto 1) else
		rcsrc & rcdst	when addr(23 downto 1)=VC_R22(23 downto 1) else
		rtmask						when addr(23 downto 1)=VC_R23(23 downto 1) else
		"000000000000" & RCbusy & '0' &FCbusy & VIbusy	when addr(23 downto 1)=VC_RCONT(23 downto 1) else
		x"000" & '0' & rGR_SIZE & rGR_CMODE when addr(23 downto 1)=VC_R0(23 downto 1) else
		"00" & rPRI_SP & rPRI_TX & rPRI_GR & rGR_PRI when addr(23 downto 1)=VC_R1(23 downto 1) else
		rYS & rAH & rVHT & rEXON & rHP & rBP & rGG & rGT & '0' & rSPREN & rTXTEN & rGRPEN when addr(23 downto 1)=VC_R2(23 downto 1) else
		(others=>'1');
	
	doe<=	'0' when rd='0' else
			'1' when addr(23 downto 1)=VC_R00(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R01(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R02(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R03(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R04(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R05(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R06(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R07(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R08(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R09(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R10(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R11(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R12(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R13(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R14(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R15(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R16(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R17(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R18(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R19(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R20(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R21(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R22(23 downto 1) else
			'1' when addr(23 downto 1)=VC_RCONT(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R0(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R1(23 downto 1) else
			'1' when addr(23 downto 1)=VC_R2(23 downto 1) else
			'0';
end rtl;
