LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MFP is
generic(
	SCFREQ		:integer	:=20000		--kHz
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	datoe	:out std_logic;
	
	KBCLKIN	:in std_logic;
	KBCLKOUT:out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT:out std_logic;

	KBWAIT	:in std_logic;
	KBen	:out std_logic;
	KBLED	:out std_logic_vector(6 downto 0);

	kbsel	:in std_logic	:='0';
	kbout	:out std_logic_vector(7 downto 0);
	kbrx	:out std_logic;

	GPIPI7	:in std_logic;
	GPIPI6	:in std_logic;
	GPIPI5	:in std_logic;
	GPIPI4	:in std_logic;
	GPIPI3	:in std_logic;
	GPIPI2	:in std_logic;
	GPIPI1	:in std_logic;
	GPIPI0	:in std_logic;

	GPIPO7	:out std_logic;
	GPIPO6	:out std_logic;
	GPIPO5	:out std_logic;
	GPIPO4	:out std_logic;
	GPIPO3	:out std_logic;
	GPIPO2	:out std_logic;
	GPIPO1	:out std_logic;
	GPIPO0	:out std_logic;

	GPIPD7	:out std_logic;
	GPIPD6	:out std_logic;
	GPIPD5	:out std_logic;
	GPIPD4	:out std_logic;
	GPIPD3	:out std_logic;
	GPIPD2	:out std_logic;
	GPIPD1	:out std_logic;
	GPIPD0	:out std_logic;

	TAI		:in std_logic;
	TAO		:out std_logic;

	TBI		:in std_logic;
	TBO		:out std_logic;

	TCO		:out std_logic;

	TDO		:out std_logic;

	INT		:out std_logic;
	IVECT	:out std_logic_vector(7 downto 0);
	INTack	:in std_logic;
	IVack	:in std_logic_vector(7 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end MFP;

architecture rtl of MFP is
signal	addrx	:std_logic_vector(23 downto 0);

signal	GPIPrdat	:std_logic_vector(7 downto 0);
signal	GPIPdoe		:std_logic;
signal	GPIR	:std_logic;
signal	GPIW	:std_logic;
signal	GPIER	:std_logic;
signal	GPIEW	:std_logic;
signal	GPIDR	:std_logic;
signal	GPIDW	:std_logic;

signal	TIMERrdat	:std_logic_vector(7 downto 0);
signal	TIMERdoe	:std_logic;
signal	TACRRD	:std_logic;
signal	TACRWR	:std_logic;
signal	TBCRRD	:std_logic;
signal	TBCRWR	:std_logic;
signal	TCDCRRD	:std_logic;
signal	TCDCRWR	:std_logic;
signal	TADRRD	:std_logic;
signal	TADRWR	:std_logic;
signal	TBDRRD	:std_logic;
signal	TBDRWR	:std_logic;
signal	TCDRRD	:std_logic;
signal	TCDRWR	:std_logic;
signal	TDDRRD	:std_logic;
signal	TDDRWR	:std_logic;
constant TAE	:std_logic := '0';
constant TBE	:std_logic := '0';

signal	INTrdat		:std_logic_vector(7 downto 0);
signal	INTdoe		:std_logic;
signal	IERARD	:std_logic;
signal	IERBRD	:std_logic;
signal	IERAWR	:std_logic;
signal	IERBWR	:std_logic;
signal	IPRARD	:std_logic;
signal	IPRBRD	:std_logic;
signal	IPRAWR	:std_logic;
signal	IPRBWR	:std_logic;
signal	ISRARD	:std_logic;
signal	ISRBRD	:std_logic;
signal	ISRAWR	:std_logic;
signal	ISRBWR	:std_logic;
signal	IMRARD	:std_logic;
signal	IMRBRD	:std_logic;
signal	IMRAWR	:std_logic;
signal	IMRBWR	:std_logic;
signal	VRRD	:std_logic;
signal	VRWR	:std_logic;

signal	KB_rdat		:std_logic_vector(7 downto 0);
signal	KB_doe		:std_logic;
signal	KB_CONTRD	:std_logic;
signal	KB_CONTWR	:std_logic;
signal	KB_RXSTRD	:std_logic;
signal	KB_RXSTWR	:std_logic;
signal	KB_TXSTRD	:std_logic;
signal	KB_TXSTWR	:std_logic;
signal	KB_DATRD	:std_logic;
signal	KB_DATWR	:std_logic;

signal	INTB7	:std_logic;
signal	INTB6	:std_logic;
signal	INTB5	:std_logic;
signal	INTB4	:std_logic;
signal	INTB3	:std_logic;
signal	INTB2	:std_logic;
signal	INTB1	:std_logic;
signal	INTB0	:std_logic;
signal	INTA7	:std_logic;
signal	INTA6	:std_logic;
signal	INTA5	:std_logic;
signal	INTA4	:std_logic;
signal	INTA3	:std_logic;
signal	INTA2	:std_logic;
signal	INTA1	:std_logic;
signal	INTA0	:std_logic;

component GPIP
port(
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	doe		:out std_logic;
	GPIR	:in std_logic;
	GPIW	:in std_logic;
	GPIER	:in std_logic;
	GPIEW	:in std_logic;
	GPIDR	:in std_logic;
	GPIDW	:in std_logic;

	GPIPI7	:in std_logic;
	GPIPI6	:in std_logic;
	GPIPI5	:in std_logic;
	GPIPI4	:in std_logic;
	GPIPI3	:in std_logic;
	GPIPI2	:in std_logic;
	GPIPI1	:in std_logic;
	GPIPI0	:in std_logic;

	GPIPO7	:out std_logic;
	GPIPO6	:out std_logic;
	GPIPO5	:out std_logic;
	GPIPO4	:out std_logic;
	GPIPO3	:out std_logic;
	GPIPO2	:out std_logic;
	GPIPO1	:out std_logic;
	GPIPO0	:out std_logic;

	GPIPD7	:out std_logic;
	GPIPD6	:out std_logic;
	GPIPD5	:out std_logic;
	GPIPD4	:out std_logic;
	GPIPD3	:out std_logic;
	GPIPD2	:out std_logic;
	GPIPD1	:out std_logic;
	GPIPD0	:out std_logic;
	
	GPIPR7	:out std_logic;
	GPIPR6	:out std_logic;
	GPIPR5	:out std_logic;
	GPIPR4	:out std_logic;
	GPIPR3	:out std_logic;
	GPIPR2	:out std_logic;
	GPIPR1	:out std_logic;
	GPIPR0	:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic;
	rstn	:in std_logic
);
end component;

component MFPtimer
generic(
		SCFREQ		:integer	:=20000		--kHz
);
port(
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	doe		:out std_logic;
	INTA	:out std_logic;
	INTB	:out std_logic;
	INTC	:out std_logic;
	INTD	:out std_logic;
	
	TACRRD	:in std_logic;
	TACRWR	:in std_logic;
	TBCRRD	:in std_logic;
	TBCRWR	:in std_logic;
	TCDCRRD	:in std_logic;
	TCDCRWR	:in std_logic;
	TADRRD	:in std_logic;
	TADRWR	:in std_logic;
	TBDRRD	:in std_logic;
	TBDRWR	:in std_logic;
	TCDRRD	:in std_logic;
	TCDRWR	:in std_logic;
	TDDRRD	:in std_logic;
	TDDRWR	:in std_logic;

	TAI		:in std_logic;
	TAE		:in std_logic;
	TAO		:out std_logic;

	TBI		:in std_logic;
	TBE		:in std_logic;
	TBO		:out std_logic;

	TCO		:out std_logic;

	TDO		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic;
	rstn	:in std_logic
);
end component;

component MFPint
port(
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	doe		:out std_logic;
	IERARD	:in std_logic;
	IERBRD	:in std_logic;
	IERAWR	:in std_logic;
	IERBWR	:in std_logic;
	IPRARD	:in std_logic;
	IPRBRD	:in std_logic;
	IPRAWR	:in std_logic;
	IPRBWR	:in std_logic;
	ISRARD	:in std_logic;
	ISRBRD	:in std_logic;
	ISRAWR	:in std_logic;
	ISRBWR	:in std_logic;
	IMRARD	:in std_logic;
	IMRBRD	:in std_logic;
	IMRAWR	:in std_logic;
	IMRBWR	:in std_logic;
	VRRD	:in std_logic;
	VRWR	:in std_logic;
	
	INTA7	:in std_logic;
	INTA6	:in std_logic;
	INTA5	:in std_logic;
	INTA4	:in std_logic;
	INTA3	:in std_logic;
	INTA2	:in std_logic;
	INTA1	:in std_logic;
	INTA0	:in std_logic;

	INTB7	:in std_logic;
	INTB6	:in std_logic;
	INTB5	:in std_logic;
	INTB4	:in std_logic;
	INTB3	:in std_logic;
	INTB2	:in std_logic;
	INTB1	:in std_logic;
	INTB0	:in std_logic;

	e_lnA7	:in std_logic;
	e_lnA6	:in std_logic;
	e_lnA5	:in std_logic;
	e_lnA4	:in std_logic;
	e_lnA3	:in std_logic;
	e_lnA2	:in std_logic;
	e_lnA1	:in std_logic;
	e_lnA0	:in std_logic;

	e_lnB7	:in std_logic;
	e_lnB6	:in std_logic;
	e_lnB5	:in std_logic;
	e_lnB4	:in std_logic;
	e_lnB3	:in std_logic;
	e_lnB2	:in std_logic;
	e_lnB1	:in std_logic;
	e_lnB0	:in std_logic;

	INT		:out std_logic;
	IVECT	:out std_logic_vector(7 downto 0);
	IACK	:in std_logic;
	IVack	:in std_logic_vector(7 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic;
	rstn	:in std_logic
);
end component;

component KBCONV
generic(
	CLKCYC	:integer	:=20000;
	SFTCYC	:integer	:=400
);
port(
	DATIN	:in std_logic_vector(7 downto 0);
	DATOUT	:out std_logic_vector(7 downto 0);
	DOE		:out std_logic;
	CONTRD	:in std_logic;
	CONTWR	:in std_logic;
	RXSTRD	:in std_logic;
	RXSTWR	:in std_logic;
	TXSTRD	:in std_logic;
	TXSTWR	:in std_logic;
	DATRD	:in std_logic;
	DATWR	:in std_logic;
	KBWAIT	:in std_logic;
	KBen	:out std_logic;
	
	TXEMP	:out std_logic;
	RXED	:out std_logic;

	KBCLKIN	:in std_logic;
	KBCLKOUT:out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT:out std_logic;
	
	monout	:out std_logic_vector(7 downto 0);
	
	kbsel	:in std_logic	:='0';
	kbout	:out std_logic_vector(7 downto 0);
	kbrx	:out std_logic;

	LED		:out std_logic_vector(6 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic;
	rstn	:in std_logic
);
end component;

begin
	addrx<=addr(23 downto 1) & '1';
	rdat	<=	"10000001"	when addr=x"e8802d" else
				GPIPrdat	when GPIPdoe='1' else
				TIMERrdat	when TIMERdoe='1' else
				KB_rdat		when KB_doe='1' else
				INTrdat		when INTdoe='1' else
				x"00";
	
	datoe<=	'1' when addrx=x"e8802d" and rd='1' else
	GPIPdoe or TIMERdoe or KB_doe or INTdoe;
	
	GPIR<=	'1' when addrx=x"e88001" and rd='1' else '0';
	GPIW<=	'1' when addrx=x"e88001" and wr='1' else '0';
	GPIER<=	'1' when addrx=x"e88003" and rd='1' else '0';
	GPIEW<=	'1' when addrx=x"e88003" and wr='1' else '0';
	GPIDR<=	'1' when addrx=x"e88005" and rd='1' else '0';
	GPIDW<=	'1' when addrx=x"e88005" and wr='1' else '0';
	IERARD<='1' when addrx=x"e88007" and rd='1' else '0';
	IERAWR<='1' when addrx=x"e88007" and wr='1' else '0';
	IERBRD<='1' when addrx=x"e88009" and rd='1' else '0';
	IERBWR<='1' when addrx=x"e88009" and wr='1' else '0';
	IPRARD<='1' when addrx=x"e8800b" and rd='1' else '0';
	IPRAWR<='1' when addrx=x"e8800b" and wr='1' else '0';
	IPRBRD<='1' when addrx=x"e8800d" and rd='1' else '0';
	IPRBWR<='1' when addrx=x"e8800d" and wr='1' else '0';
	ISRARD<='1' when addrx=x"e8800f" and rd='1' else '0';
	ISRAWR<='1' when addrx=x"e8800f" and wr='1' else '0';
	ISRBRD<='1' when addrx=x"e88011" and rd='1' else '0';
	ISRBWR<='1' when addrx=x"e88011" and wr='1' else '0';
	IMRARD<='1' when addrx=x"e88013" and rd='1' else '0';
	IMRAWR<='1' when addrx=x"e88013" and wr='1' else '0';
	IMRBRD<='1' when addrx=x"e88015" and rd='1' else '0';
	IMRBWR<='1' when addrx=x"e88015" and wr='1' else '0';
	VRRD  <='1' when addrx=x"e88017" and rd='1' else '0';
	VRWR  <='1' when addrx=x"e88017" and wr='1' else '0';
	TACRRD<='1' when addrx=x"e88019" and rd='1' else '0';
	TACRWR<='1' when addrx=x"e88019" and wr='1' else '0';
	TBCRRD<='1' when addrx=x"e8801b" and rd='1' else '0';
	TBCRWR<='1' when addrx=x"e8801b" and wr='1' else '0';
	TCDCRRD<='1' when addrx=x"e8801d" and rd='1' else '0';
	TCDCRWR<='1' when addrx=x"e8801d" and wr='1' else '0';
	TADRRD<='1' when addrx=x"e8801f" and rd='1' else '0';
	TADRWR<='1' when addrx=x"e8801f" and wr='1' else '0';
	TBDRRD<='1' when addrx=x"e88021" and rd='1' else '0';
	TBDRWR<='1' when addrx=x"e88021" and wr='1' else '0';
	TCDRRD<='1' when addrx=x"e88023" and rd='1' else '0';
	TCDRWR<='1' when addrx=x"e88023" and wr='1' else '0';
	TDDRRD<='1' when addrx=x"e88025" and rd='1' else '0';
	TDDRWR<='1' when addrx=x"e88025" and wr='1' else '0';
	KB_CONTRD<='1' when addrx=x"e88029" and rd='1' else '0';
	KB_CONTWR<='1' when addrx=x"e88029" and wr='1' else '0';
	KB_RXSTRD<='1' when addrx=x"e8802b" and rd='1' else '0';
	KB_RXSTWR<='1' when addrx=x"e8802b" and wr='1' else '0';
	KB_TXSTRD<='1' when addrx=x"e8802d" and rd='1' else '0';
	KB_TXSTWR<='1' when addrx=x"e8802d" and wr='1' else '0';
	KB_DATRD<='1' when addrx=x"e8802f" and rd='1' else '0';
	KB_DATWR<='1' when addrx=x"e8802f" and wr='1' else '0';

	GPIPU	:GPIP port map(
		rdat	=>GPIPrdat,
		wdat	=>wdat,
		doe		=>GPIPdoe,
		GPIR	=>GPIR,
		GPIW	=>GPIW,
		GPIER	=>GPIER,
		GPIEW	=>GPIEW,
		GPIDR	=>GPIDR,
		GPIDW	=>GPIDW,

		GPIPI7	=>GPIPI7,
		GPIPI6	=>GPIPI6,
		GPIPI5	=>GPIPI5,
		GPIPI4	=>GPIPI4,
		GPIPI3	=>GPIPI3,
		GPIPI2	=>GPIPI2,
		GPIPI1	=>GPIPI1,
		GPIPI0	=>GPIPI0,
		
		GPIPO7	=>GPIPO7,
		GPIPO6	=>GPIPO6,
		GPIPO5	=>GPIPO5,
		GPIPO4	=>GPIPO4,
		GPIPO3	=>GPIPO3,
		GPIPO2	=>GPIPO2,
		GPIPO1	=>GPIPO1,
		GPIPO0	=>GPIPO0,

		GPIPD7	=>GPIPD7,
		GPIPD6	=>GPIPD6,
		GPIPD5	=>GPIPD5,
		GPIPD4	=>GPIPD4,
		GPIPD3	=>GPIPD3,
		GPIPD2	=>GPIPD2,
		GPIPD1	=>GPIPD1,
		GPIPD0	=>GPIPD0,
		
		GPIPR7	=>INTA7,
		GPIPR6	=>INTA6,
		GPIPR5	=>INTB7,
		GPIPR4	=>INTB6,
		GPIPR3	=>INTB3,
		GPIPR2	=>INTB2,
		GPIPR1	=>INTB1,
		GPIPR0	=>INTB0,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	
	TIMERU	:MFPtimer generic map(SCFREQ) port map(
		rdat	=>TIMERrdat,
		wdat	=>wdat,
		doe		=>TIMERdoe,
		INTA	=>INTA5,
		INTB	=>INTA0,
		INTC	=>INTB5,
		INTD	=>INTB4,
		
		TACRRD	=>TACRRD,
		TACRWR	=>TACRWR,
		TBCRRD	=>TBCRRD,
		TBCRWR	=>TBCRWR,
		TCDCRRD	=>TCDCRRD,
		TCDCRWR	=>TCDCRWR,
		TADRRD	=>TADRRD,
		TADRWR	=>TADRWR,
		TBDRRD	=>TBDRRD,
		TBDRWR	=>TBDRWR,
		TCDRRD	=>TCDRRD,
		TCDRWR	=>TCDRWR,
		TDDRRD	=>TDDRRD,
		TDDRWR	=>TDDRWR,

		TAI		=>TAI,
		TAE		=>TAE,
		TAO		=>TAO,

		TBI		=>TBI,
		TBE		=>TBE,
		TBO		=>TBO,

		TCO		=>TCO,

		TDO		=>TDO,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	
	KB	:KBCONV generic map(SCFREQ,400) port map(
		DATIN	=>wdat,
		DATOUT	=>KB_rdat,
		DOE		=>KB_doe,
		CONTRD	=>KB_CONTRD,
		CONTWR	=>KB_CONTWR,
		RXSTRD	=>KB_RXSTRD,
		RXSTWR	=>KB_RXSTWR,
		TXSTRD	=>KB_TXSTRD,
		TXSTWR	=>KB_TXSTWR,
		DATRD	=>KB_DATRD,
		DATWR	=>KB_DATWR,
		KBWAIT	=>KBWAIT,
		KBen	=>KBen,
		
		TXEMP	=>INTA2,
		RXED	=>INTA4,

		KBCLKIN	=>KBCLKIN,
		KBCLKOUT=>KBCLKOUT,
		KBDATIN	=>KBDATIN,
		KBDATOUT=>KBDATOUT,
		
		monout	=>open,
		
		kbsel	=>kbsel,
		kbout	=>kbout,
		kbrx	=>kbrx,

		LED		=>KBLED,
		
		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);

	INTU	:MFPint port map(
		rdat	=>INTrdat,
		wdat	=>wdat,
		doe		=>INTdoe,
		IERARD	=>IERARD,
		IERBRD	=>IERBRD,
		IERAWR	=>IERAWR,
		IERBWR	=>IERBWR,
		IPRARD	=>IPRARD,
		IPRBRD	=>IPRBRD,
		IPRAWR	=>IPRAWR,
		IPRBWR	=>IPRBWR,
		ISRARD	=>ISRARD,
		ISRBRD	=>ISRBRD,
		ISRAWR	=>ISRAWR,
		ISRBWR	=>ISRBWR,
		IMRARD	=>IMRARD,
		IMRBRD	=>IMRBRD,
		IMRAWR	=>IMRAWR,
		IMRBWR	=>IMRBWR,
		VRRD	=>VRRD,
		VRWR	=>VRWR,
		
		INTA7	=>INTA7,
		INTA6	=>INTA6,
		INTA5	=>INTA5,
		INTA4	=>INTA4,
		INTA3	=>INTA3,
		INTA2	=>INTA2,
		INTA1	=>INTA1,
		INTA0	=>INTA0,
		INTB7	=>INTB7,
		INTB6	=>INTB6,
		INTB5	=>INTB5,
		INTB4	=>INTB4,
		INTB3	=>INTB3,
		INTB2	=>INTB2,
		INTB1	=>INTB1,
		INTB0	=>INTB0,

		e_lnA7	=>'1',
		e_lnA6	=>'1',
		e_lnA5	=>'1',
		e_lnA4	=>'0',
		e_lnA3	=>'1',
		e_lnA2	=>'0',
		e_lnA1	=>'1',
		e_lnA0	=>'1',

		e_lnB7	=>'1',
		e_lnB6	=>'1',
		e_lnB5	=>'1',
		e_lnB4	=>'1',
		e_lnB3	=>'1',
		e_lnB2	=>'1',
		e_lnB1	=>'1',
		e_lnB0	=>'1',

		INT		=>INT,
		IVECT	=>IVECT,
		IACK	=>INTack,
		IVACK	=>IVack,
			
		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);

	INTA3<='0';
	INTA1<='0';

end rtl;