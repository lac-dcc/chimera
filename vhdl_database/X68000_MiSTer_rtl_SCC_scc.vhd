LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scc is
generic(
	CLKCYC	:integer	:=20000
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	wdat	:in std_logic_vector(7 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	doe		:out std_logic;
	int		:out std_logic;
	ivect	:out std_logic_vector(7 downto 0);
	iack	:in std_logic;

	mclkin	:in std_logic;
	mclkout	:out std_logic;
	mdatin	:in std_logic;
	mdatout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end scc;

architecture rtl of scc is
signal	regAno,regBno	:std_logic_vector(3 downto 0);
signal	regAwr,regBwr	:std_logic;
signal	cmdArd	:std_logic;
signal	cmdAwr	:std_logic;
signal	datArd	:std_logic;
signal	datAwr	:std_logic;
signal	cmdBrd	:std_logic;
signal	cmdBwr	:std_logic;
signal	datBrd	:std_logic;
signal	datBwr	:std_logic;
signal	addrx	:std_logic_vector(23 downto 0);

signal	iVectR	:std_logic_vector(7 downto 0);
signal	iVectM	:std_logic_vector(7 downto 0);
signal	iVectSel:std_logic;
signal	iVectSta:std_logic_vector(2 downto 0);
signal	iVectSelSta:std_logic_vector(7 downto 0);
signal	inten	:std_logic;
signal	ivectb	:std_logic_vector(7 downto 0);
signal	m_int	:std_logic;
signal	m_inten	:std_logic;
signal	vectsel	:std_logic;

signal	m_lrts	:std_logic;
signal	m_req	:std_logic;
signal	m_rxed	:std_logic;
signal	m_rdat	:std_logic_vector(7 downto 0);

signal	regArdat	:std_logic_vector(7 downto 0);
signal	regBrdat	:std_logic_vector(7 downto 0);
signal	rxextB	:std_logic;
signal	rddatB,lrddatB	:std_logic;

component sccreg
port(
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;
	rd		:in std_logic;
	
	regno	:out std_logic_vector(3 downto 0);
	regwr	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component MOUSECONV is
generic(
	CLKCYC	:integer	:=20000;
	SFTCYC	:integer	:=400
);
port(
	REQ		:in std_logic;
	DATOUT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;

	MCLKIN	:in std_logic;
	MCLKOUT:out std_logic;
	MDATIN	:in std_logic;
	MDATOUT:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin
	addrx<=addr(23 downto 1) & '1';
	cmdBwr<='1' when addrx=x"e98001" and wr='1' else '0';
	cmdBrd<='1' when addrx=x"e98001" and rd='1' else '0';
	--datBwr<='1' when addrx=x"e98003" and wr='1' else '0';
	datBrd<='1' when addrx=x"e98003" and rd='1' else '0';
	cmdAwr<='1' when addrx=x"e98005" and wr='1' else '0';
	cmdArd<='1' when addrx=x"e98005" and rd='1' else '0';
	--datAwr<='1' when addrx=x"e98007" and wr='1' else '0';
	datArd<='1' when addrx=x"e98007" and rd='1' else '0';
	
	regA :sccreg port map(wdat,cmdAwr,cmdArd,regAno,regAwr,clk,ce,rstn);
	regB :sccreg port map(wdat,cmdBwr,cmdBrd,regBno,regBwr,clk,ce,rstn);

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				iVectR<=(others=>'0');
			elsif(ce = '1')then
				if(regAno=x"2" and regAwr='1')then
					iVectR<=wdat;
				elsif(regBno=x"2" and regBwr='1')then
					iVectR<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				iVectSel<='0';
				inten<='0';
				vectsel<='0';
			elsif(ce = '1')then
				if((regAno=x"9" and regAwr='1') or (regBno=x"9" and regBwr='1'))then
					iVectSel<=wdat(4);
					inten<=wdat(3);
					vectsel<=wdat(0);
				end if;
			end if;
		end if;
	end process;
	
	ivectb<=	iVectR when vectsel='0' else
				(iVectR and iVectM) or iVectSelSta;
	
	iVectM<="10001111" when iVectSel='1' else
			"11110001";
	
	iVectSelSta<=	'0' & iVectSta & "0000" when iVectsel='1' else
					"0000" & iVectSta & '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				m_lrts<='0';
				m_req<='0';
			elsif(ce = '1')then
				m_req<='0';
				if(regBno=x"5" and regBwr='1')then
					m_lrts<=wdat(1);
					if(wdat(1)='0' and m_lrts='1')then
						m_req<='1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				m_int<='0';
				iVectSta<=(others=>'0');
			elsif(ce = '1')then
				if(regBno=x"0" and regBwr='1' and wdat(5 downto 3)="111")then
					m_int<='0';
				elsif(iack='1')then
					m_int<='0';
				elsif(m_rxed='1')then
					if(m_inten='1')then
						m_int<='1';
					end if;
					iVectSta<="010";
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				m_inten<='0';
			elsif(ce = '1')then
				if(regBno=x"1" and regBwr='1')then
					if(wdat(4 downto 3)="00")then
						m_inten<='0';
					else
						m_inten<='1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	int<=inten and m_int;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				rddatB<='0';
				lrddatB<='0';
				rxextB<='0';
			elsif(ce = '1')then
				if(regBno=x"8" and cmdBrd='1')then
					rddatB<='1';
				elsif(datBrd='1')then
					rddatB<='1';
				else
					rddatB<='0';
				end if;
				
				if(m_rxed='1')then
					rxextB<='1';
				elsif(rddatB='0' and lrddatB='1')then
					rxextB<='0';
				end if;
			end if;
		end if;
	end process;
	
	regArdat<=
		iVectR when regAno=x"2" else
		x"00";
	
	regBrdat<=
		"0000000" & rxextB when regBno=x"0" else
		ivectb when regBno=x"2" else
		m_rdat when regBno=x"8" else
		x"00";
		
	rdat<=
		regArdat	when cmdArd='1' else
		x"00"		when datArd='1' else
		regBrdat	when cmdBrd='1' else
		m_rdat		when datBrd='1' else
		x"00";
	
	doe<=	'1'	when cmdArd='1' else
			'1' when datArd='1' else
			'1' when cmdBrd='1' else
			'1' when datBrd='1' else
			'0';
		
	mouse	:MOUSECONV generic map(
		CLKCYC	=>CLKCYC,
		SFTCYC	=>400
		)port map(
		REQ		=>m_req,
		DATOUT	=>m_rdat,
		RXED	=>m_rxed,

		MCLKIN	=>mclkin,
		MCLKOUT	=>mclkout,
		MDATIN	=>mdatin,
		MDATOUT	=>mdatout,
		
		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	
	ivect<=ivectb;
end rtl;
