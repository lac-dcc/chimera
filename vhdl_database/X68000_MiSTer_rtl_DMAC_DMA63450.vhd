LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DMA63450 is
generic(
	BASEADDR	:std_logic_vector(23 downto 8)	:=x"e840"
);
port(
	addrin	:in std_logic_vector(23 downto 0);
	m_as	:in std_logic;
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	b_addr	:out std_logic_vector(23 downto 0);
	b_as	:out std_logic;
	b_rwn	:out std_logic;
	b_uds	:out std_logic;
	b_lds	:out std_logic;
	b_dout	:out std_logic_vector(15 downto 0);
	b_doe	:out std_logic;
	b_din	:in std_logic_vector(15 downto 0);
	b_ack	:in std_logic;
	b_conte	:out std_logic;

	drq0		:in std_logic;
	dack0		:out std_logic;
	pcli0		:in std_logic;
	pclo0		:out std_logic;
	doneo0		:out std_logic;

	drq1		:in std_logic;
	dack1		:out std_logic;
	pcli1		:in std_logic;
	pclo1		:out std_logic;
	doneo1		:out std_logic;

	drq2		:in std_logic;
	dack2		:out std_logic;
	pcli2		:in std_logic;
	pclo2		:out std_logic;
	doneo2		:out std_logic;

	drq3		:in std_logic;
	dack3		:out std_logic;
	pcli3		:in std_logic;
	pclo3		:out std_logic;
	doneo3		:out std_logic;

	d_rd		:out std_logic;
	d_wr		:out std_logic;

	donei		:in std_logic;

	dtc			:out std_logic;

	int			:out std_logic;
	ivect		:out std_logic_vector(7 downto 0);
	iack		:in std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);

end DMA63450;

architecture rtl of DMA63450 is
signal	rd		:std_logic;
signal	wr		:std_logic_vector(1 downto 0);
signal	regrdat0	:std_logic_vector(15 downto 0);
signal	regrdat1	:std_logic_vector(15 downto 0);
signal	regrdat2	:std_logic_vector(15 downto 0);
signal	regrdat3	:std_logic_vector(15 downto 0);
signal	regrdv	:std_logic_vector(3 downto 0);
signal	regwhv	:std_logic_vector(3 downto 0);
signal	regwlv	:std_logic_vector(3 downto 0);
signal	regw0,regw1,regw2,regw3	:std_logic_vector(1 downto 0);
signal	irqv	:std_logic_vector(3 downto 0);
signal	ivect0,ivect1,ivect2,ivect3		:std_logic_vector(7 downto 0);
signal	busreqv	:std_logic_vector(4 downto 0);
signal	busactv	:std_logic_vector(3 downto 0);
signal	reqgv:std_logic_vector(3 downto 0);
signal	buschkv	:std_logic_vector(4 downto 0);
signal	pri0,pri1,pri2,pri3		:std_logic_vector(3 downto 0);
signal	b_dout0,b_dout1,b_dout2,b_dout3	:std_logic_vector(15 downto 0);
signal	b_addr0,b_addr1,b_addr2,b_addr3	:std_logic_vector(23 downto 0);
signal	b_doev	:std_logic_vector(3 downto 0);
signal	b_asv	:std_logic_vector(3 downto 0);
signal	b_udsv	:std_logic_vector(3 downto 0);
signal	b_ldsv	:std_logic_vector(3 downto 0);
signal	b_rwnv	:std_logic_vector(3 downto 0);
signal	d_rdv	:std_logic_vector(3 downto 0);
signal	d_wrv	:std_logic_vector(3 downto 0);
signal	donev	:std_logic_vector(3 downto 0);
signal	actch	:integer range 0 to 4;
signal	lm_as	:std_logic;
signal	gc_bt	:std_logic_vector(1 downto 0);
signal	gc_br	:std_logic_vector(1 downto 0);
signal	bwcount	:integer range 0 to (128*16)-1;
signal	brcount	:integer range 0 to 127;
signal	blen		:integer range 0 to 128;
signal	bwtotal	:integer range 0 to (128*16)-1;
signal	bren	:std_logic;

component dma1ch
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
end component;

begin
	dtc <= '0';

	rd<=b_rd when addrin(23 downto 8)=BASEADDR else '0';
	wr<=b_wr when addrin(23 downto 8)=BASEADDR else "00";

	regrdv(0)<=	rd when addrin(7 downto 6)="00" else '0';
	regrdv(1)<=	rd when addrin(7 downto 6)="01" else '0';
	regrdv(2)<=	rd when addrin(7 downto 6)="10" else '0';
	regrdv(3)<=	rd when addrin(7 downto 6)="11" else '0';
--regrdv(1)<='0';
--regrdv(2)<='0';
--regrdv(3)<='0';

	regwhv(0)<=	wr(1) when addrin(7 downto 6)="00" else '0';
	regwhv(1)<=	wr(1) when addrin(7 downto 6)="01" else '0';
	regwhv(2)<=	wr(1) when addrin(7 downto 6)="10" else '0';
	regwhv(3)<=	wr(1) when addrin(7 downto 6)="11" else '0';
--regwhv(1)<='0';
--regwhv(2)<='0';
--regwhv(3)<='0';

	regwlv(0)<=	wr(0) when addrin(7 downto 6)="00" else '0';
	regwlv(1)<=	wr(0) when addrin(7 downto 6)="01" else '0';
	regwlv(2)<=	wr(0) when addrin(7 downto 6)="10" else '0';
	regwlv(3)<=	wr(0) when addrin(7 downto 6)="11" else '0';
--regwlv(1)<='0';
--regwlv(2)<='0';
--regwlv(3)<='0';

	regw0<=regwhv(0) & regwlv(0);
	regw1<=regwhv(1) & regwlv(1);
	regw2<=regwhv(2) & regwlv(2);
	regw3<=regwhv(3) & regwlv(3);


	process(clk,rstn)
	variable	channel	:integer range 0 to 4;
	variable	c_pri	:std_logic_vector(3 downto 0);
	variable	n_pri	:std_logic_vector(3 downto 0);
--	variable	lm_as	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				pri0(1 downto 0)<="00";
				pri1(1 downto 0)<="00";
				pri2(1 downto 0)<="00";
				pri3(1 downto 0)<="00";
				actch<=4;
	--			lm_as:='1';
			elsif(ce = '1')then
				c_pri:="1111";
				channel:=4;
				for i in 0 to 3 loop
					case i is
					when 0 =>
						n_pri:=pri0;
					when 1 =>
						n_pri:=pri1;
					when 2 =>
						n_pri:=pri2;
					when 3 =>
						n_pri:=pri3;
					when others =>
						n_pri:="1111";
					end case;
					if(busreqv(i)='1' and (reqgv(i)='0' or bren='1') and n_pri<=c_pri)then
						channel:=i;
						c_pri:=n_pri;
					end if;
				end loop;
				if(buschkv(actch)='1' or busreqv(actch)='0')then
	--				if((lm_as='0' and m_as='1') or actch/=4)then
						actch<=channel;
						case channel is
						when 0 =>
							busactv<="0001";
							pri0(1 downto 0)<="11";
							if(pri1(1 downto 0)/="00")then
								pri1(1 downto 0)<=pri1(1 downto 0)-"01";
							end if;
							if(pri2(1 downto 0)/="00")then
								pri2(1 downto 0)<=pri2(1 downto 0)-"01";
							end if;
							if(pri3(1 downto 0)/="00")then
								pri3(1 downto 0)<=pri3(1 downto 0)-"01";
							end if;
						when 1 =>
							busactv<="0010";
							pri1(1 downto 0)<="11";
							if(pri0(1 downto 0)/="00")then
								pri0(1 downto 0)<=pri0(1 downto 0)-"01";
							end if;
							if(pri2(1 downto 0)/="00")then
								pri2(1 downto 0)<=pri2(1 downto 0)-"01";
							end if;
							if(pri3(1 downto 0)/="00")then
								pri3(1 downto 0)<=pri3(1 downto 0)-"01";
							end if;
						when 2 =>
							busactv<="0100";
							pri2(1 downto 0)<="11";
							if(pri0(1 downto 0)/="00")then
								pri0(1 downto 0)<=pri0(1 downto 0)-"01";
							end if;
							if(pri1(1 downto 0)/="00")then
								pri1(1 downto 0)<=pri1(1 downto 0)-"01";
							end if;
							if(pri3(1 downto 0)/="00")then
								pri3(1 downto 0)<=pri3(1 downto 0)-"01";
							end if;
						when 3 =>
							busactv<="1000";
							pri3(1 downto 0)<="11";
							if(pri0(1 downto 0)/="00")then
								pri0(1 downto 0)<=pri0(1 downto 0)-"01";
							end if;
							if(pri1(1 downto 0)/="00")then
								pri1(1 downto 0)<=pri1(1 downto 0)-"01";
							end if;
							if(pri2(1 downto 0)/="00")then
								pri2(1 downto 0)<=pri2(1 downto 0)-"01";
							end if;
						when others =>
							busactv<="0000";
						end case;
	--				end if;
	--			elsif(busreqv(actch)='0')then
	--				actch<=4;
	--				busactv<="0000";
				end if;
	--			lm_as:=m_as;
			end if;
		end if;
	end process;

	ch0	:dma1ch port map(
		regaddr		=>addrin(5 downto 0),
		regrdat		=>regrdat0,
		regwdat		=>b_din,
		regrd		=>regrdv(0),
		regwr		=>regw0,

		irq			=>irqv(0),
		ivect		=>ivect0,
		iack		=>iack,

		busreq		=>busreqv(0),
		busact		=>busactv(0),
		buschk		=>buschkv(0),
		reqg		=>reqgv(0),
		bt			=>open,
		br			=>open,
		pri			=>pri0(3 downto 2),
		b_indat		=>b_din,
		b_outdat	=>b_dout0,
		b_doe		=>b_doev(0),
		b_addr		=>b_addr0,
		b_as		=>b_asv(0),
		b_rwn		=>b_rwnv(0),
		b_uds		=>b_udsv(0),
		b_lds		=>b_ldsv(0),
		b_ack		=>b_ack,

		drq			=>drq0,
		dack		=>dack0,
		d_rd		=>d_rdv(0),
		d_wr		=>d_wrv(0),
		pcli		=>pcli0,
		pclo		=>pclo0,

		donei		=>donei,
		doneo		=>donev(0),

		dtc			=>open,

		clk			=>clk,
		ce          =>ce,
		rstn		=>rstn
	);

	ch1	:dma1ch port map(
		regaddr		=>addrin(5 downto 0),
		regrdat		=>regrdat1,
		regwdat		=>b_din,
		regrd		=>regrdv(1),
		regwr		=>regw1,

		irq			=>irqv(1),
		ivect		=>ivect1,
		iack		=>iack,

		busreq		=>busreqv(1),
		busact		=>busactv(1),
		buschk		=>buschkv(1),
		reqg		=>reqgv(1),
		bt			=>open,
		br			=>open,
		pri			=>pri1(3 downto 2),
		b_indat		=>b_din,
		b_outdat	=>b_dout1,
		b_doe		=>b_doev(1),
		b_addr		=>b_addr1,
		b_as		=>b_asv(1),
		b_rwn		=>b_rwnv(1),
		b_uds		=>b_udsv(1),
		b_lds		=>b_ldsv(1),
		b_ack		=>b_ack,

		drq			=>drq1,
		dack		=>dack1,
		d_rd		=>d_rdv(1),
		d_wr		=>d_wrv(1),
		pcli		=>pcli1,
		pclo		=>pclo1,

		donei		=>donei,
		doneo		=>donev(1),

		dtc			=>open,

		clk			=>clk,
		ce          =>ce,
		rstn		=>rstn
	);

	ch2	:dma1ch port map(
		regaddr		=>addrin(5 downto 0),
		regrdat		=>regrdat2,
		regwdat		=>b_din,
		regrd		=>regrdv(2),
		regwr		=>regw2,

		irq			=>irqv(2),
		ivect		=>ivect2,
		iack		=>iack,

		busreq		=>busreqv(2),
		busact		=>busactv(2),
		buschk		=>buschkv(2),
		reqg		=>reqgv(2),
		bt			=>open,
		br			=>open,
		pri			=>pri2(3 downto 2),
		b_indat		=>b_din,
		b_outdat	=>b_dout2,
		b_doe		=>b_doev(2),
		b_addr		=>b_addr2,
		b_as		=>b_asv(2),
		b_rwn		=>b_rwnv(2),
		b_uds		=>b_udsv(2),
		b_lds		=>b_ldsv(2),
		b_ack		=>b_ack,

		drq			=>drq2,
		dack		=>dack2,
		d_rd		=>d_rdv(2),
		d_wr		=>d_wrv(2),
		pcli		=>pcli2,
		pclo		=>pclo2,

		donei		=>donei,
		doneo		=>donev(2),

		dtc			=>open,

		clk			=>clk,
		ce          =>ce,
		rstn		=>rstn
	);

	ch3	:dma1ch port map(
		regaddr		=>addrin(5 downto 0),
		regrdat		=>regrdat3,
		regwdat		=>b_din,
		regrd		=>regrdv(3),
		regwr		=>regw3,

		irq			=>irqv(3),
		ivect		=>ivect3,
		iack		=>iack,

		busreq		=>busreqv(3),
		busact		=>busactv(3),
		buschk		=>buschkv(3),
		reqg		=>reqgv(3),
		bt			=>gc_bt,
		br			=>gc_br,
		pri			=>pri3(3 downto 2),
		b_indat		=>b_din,
		b_outdat	=>b_dout3,
		b_doe		=>b_doev(3),
		b_addr		=>b_addr3,
		b_as		=>b_asv(3),
		b_rwn		=>b_rwnv(3),
		b_uds		=>b_udsv(3),
		b_lds		=>b_ldsv(3),
		b_ack		=>b_ack,

		drq			=>drq3,
		dack		=>dack3,
		d_rd		=>d_rdv(3),
		d_wr		=>d_wrv(3),
		pcli		=>pcli3,
		pclo		=>pclo3,

		donei		=>donei,
		doneo		=>donev(3),

		dtc			=>open,

		clk			=>clk,
		ce          =>ce,
		rstn		=>rstn
	);
	busreqv(4)<='1';
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				lm_as<='0';
			elsif(ce = '1')then
				lm_as<=m_as;
			end if;
		end if;
	end process;
	buschkv(4)<='1' when (lm_as='0' and m_as='1') else '0';

	int<=irqv(3) or irqv(2) or irqv(1) or irqv(0);
	ivect<=	ivect0 when irqv(0)='1' else
			ivect1 when irqv(1)='1' else
			ivect2 when irqv(2)='1' else
			ivect3 when irqv(3)='1' else
			x"00";

	b_addr<=b_addr0	when actch=0 else
			b_addr1	when actch=1 else
			b_addr2 when actch=2 else
			b_addr3 when actch=3 else
			(others=>'0');

	b_dout<=b_dout0	when actch=0 else
			b_dout1 when actch=1 else
			b_dout2 when actch=2 else
			b_dout3 when actch=3 else
			regrdat0 when regrdv(0)='1' else
			regrdat1 when regrdv(1)='1' else
			regrdat2 when regrdv(2)='1' else
			regrdat3 when regrdv(3)='1' else
			(others=>'0');
	b_doe<=	b_doev(0) when actch=0 else
			b_doev(1) when actch=1 else
			b_doev(2) when actch=2 else
			b_doev(3) when actch=3 else
			'1' when regrdv(0)='1' else
			'1' when regrdv(1)='1' else
			'1' when regrdv(2)='1' else
			'1' when regrdv(3)='1' else
			'0';

	b_as<=	b_asv(0) when actch=0 else
			b_asv(1) when actch=1 else
			b_asv(2) when actch=2 else
			b_asv(3) when actch=3 else
			'1';

	b_rwn<=	b_rwnv(0) when actch=0 else
			b_rwnv(1) when actch=1 else
			b_rwnv(2) when actch=2 else
			b_rwnv(3) when actch=3 else
			'1';

	b_uds<=	b_udsv(0) when actch=0 else
			b_udsv(1) when actch=1 else
			b_udsv(2) when actch=2 else
			b_udsv(3) when actch=3 else
			'1';

	b_lds<=	b_ldsv(0) when actch=0 else
			b_ldsv(1) when actch=1 else
			b_ldsv(2) when actch=2 else
			b_ldsv(3) when actch=3 else
			'1';

	b_conte<='0' when actch=4 else '1';

	d_rd<=	d_rdv(0) when actch=0 else
			d_rdv(1) when actch=1 else
			d_rdv(2) when actch=2 else
			d_rdv(3) when actch=3 else
			'0';

	d_wr<=	d_wrv(0) when actch=0 else
			d_wrv(1) when actch=1 else
			d_wrv(2) when actch=2 else
			d_wrv(3) when actch=3 else
			'0';

	doneo0<=	donev(0);-- when actch=0 else
	doneo1<=	donev(1);-- when actch=1 else
	doneo2<=	donev(2);-- when actch=2 else
	doneo3<=	donev(3);-- when actch=3 else
--			'0';

	blen<=	16		when gc_bt="00" else
				32		when gc_bt="01" else
				64		when gc_bt="10" else
				128	when gc_bt="11" else
				0;

	bwtotal<=	(blen*2)-1 when gc_br="00" else
					(blen*4)-1 when gc_br="01" else
					(blen*8)-1 when gc_br="10" else
					(blen*16)-1 when gc_br="11" else
					0;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				bwcount<=0;
				bren<='1';
			elsif(ce = '1')then
				if(actch/=4)then
					if(brcount<(blen-1))then
						brcount<=brcount+1;
					else
						bren<='0';
					end if;
				end if;
				if(bwcount<bwtotal)then
					bwcount<=bwcount+1;
				else
					bwcount<=0;
					brcount<=0;
					bren<='1';
				end if;
			end if;
		end if;
	end process;

end rtl;
