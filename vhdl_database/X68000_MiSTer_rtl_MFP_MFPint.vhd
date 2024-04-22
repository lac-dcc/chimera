library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MFPint is
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
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end MFPint;

architecture rtl of MFPint is
signal	IER		:std_logic_vector(15 downto 0);
signal	IPR		:std_logic_vector(15 downto 0);
signal	ISR		:std_logic_vector(15 downto 0);
signal	IMR		:std_logic_vector(15 downto 0);
signal	INTR	:std_logic_vector(15 downto 0);
signal	VECT	:std_logic_vector(3 downto 0);
signal	AEOI	:std_logic;
signal	INTn	:std_logic_vector(15 downto 0);
signal	INTx	:std_logic_vector(3 downto 0);
signal	INTxl	:std_logic_vector(3 downto 0);
signal	INTb	:std_logic;
signal	e_lnn	:std_logic_vector(15 downto 0);
begin
	INTn<=INTA7 & INTA6 & INTA5 & INTA4 & INTA3 & INTA2 & INTA1 & INTA0 & INTB7 & INTB6 & INTB5 & INTB4 & INTB3 & INTB2 & INTB1 & INTB0;
	e_lnn<=e_lnA7 & e_lnA6 & e_lnA5 & e_lnA4 & e_lnA3 & e_lnA2 & e_lnA1 & e_lnA0 & e_lnB7 & e_lnB6 & e_lnB5 & e_lnB4 & e_lnB3 & e_lnB2 & e_lnB1 & e_lnB0;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				IER<=(others=>'0');
			elsif(ce = '1')then
				if(IERAWR='1')then
					IER(15 downto 8)<=wdat;
				end if;
				if(IERBWR='1')then
					IER(7 downto 0)<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)
	variable iivack	:integer range 0 to 15;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				IPR<=(others=>'0');
			elsif(ce = '1')then
				for i in 0 to 15 loop
					if(IER(i)='0')then
						IPR(i)<='0';
					elsif(INTn(i)='1')then
						IPR(i)<='1';
					elsif(e_lnn(i)='0' and INTn(i)='0')then
						IPR(i)<='0';
					end if;
				end loop;
				if(IACK='1')then
					iivack:=conv_integer(IVACK(3 downto 0));
					IPR(iivack)<='0';
				elsif(IPRAWR='1')then
					IPR(15 downto 8)<=IPR(15 downto 8) and wdat;
				elsif(IPRBWR='1')then
					IPR(7 downto 0)<=IPR(7 downto 0) and wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)
	variable iivack	:integer range 0 to 15;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				ISR<=(others=>'0');
			elsif(ce = '1')then
				if(AEOI='1')then
					ISR<=(others=>'0');
				elsif(IACK='1')then
					ISR<=(others=>'0');
					iivack:=conv_integer(IVACK(3 downto 0));
					ISR(iivack)<='1';
				elsif(ISRAWR='1')then
					ISR(15 downto 8)<=ISR(15 downto 8) and wdat;
				elsif(ISRBWR='1')then
					ISR(7 downto 0)<=ISR(7 downto 0) and wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				IMR<=(others=>'0');
			elsif(ce = '1')then
				if(IMRAWR='1')then
					IMR(15 downto 8)<=wdat;
				end if;
				if(IMRBWR='1')then
					IMR(7 downto 0)<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				VECT<=(others=>'0');
				AEOI<='1';
			elsif(ce = '1')then
				if(VRWR='1')then
					VECT<=wdat(7 downto 4);
					AEOI<=not wdat(3);
				end if;
			end if;
		end if;
	end process;
	
	INTR<=IPR and IMR;
	process(INTR)begin
		INTb<='0';
		INTx<=(others=>'0');
		for i in 0 to 15 loop
			if(INTR(i)='1')then
				INTx<=conv_std_logic_vector(i,4);
				INTb<='1';
			end if;
		end loop;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				INTxl<=(others=>'0');
				INT<='0';
			elsif(ce = '1')then
				INT<=INTb;
				if(INTb='1')then
					INTxl<=INTx;
				end if;
			end if;
		end if;
	end process;
	
	rdat<=	IER(15 downto 8)when IERARD='1' else
			IER(7 downto 0) when IERBRD='1' else
			IPR(15 downto 8)when IPRARD='1' else
			IPR(7 downto 0)	when IPRBRD='1' else
			ISR(15 downto 8)when ISRARD='1' else
			ISR(7 downto 0)	when ISRBRD='1' else
			IMR(15 downto 8)when IMRARD='1' else
			IMR(7 downto 0)	when IMRBRD='1' else
			VECT & AEOI & "000" when VRRD='1' else
			(others=>'0');

	doe<=	'1'	when IERARD='1' else
			'1'	when IERBRD='1' else
			'1' when IPRARD='1' else
			'1' when IPRBRD='1' else
			'1' when ISRARD='1' else
			'1' when ISRBRD='1' else
			'1' when IMRARD='1' else
			'1' when IMRBRD='1' else
			'1' when VRRD='1' else
			'0';
	IVECT<=VECT & INTxl;

end rtl;