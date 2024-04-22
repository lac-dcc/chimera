library IEEE,work;
use IEEE.std_logic_1164.all;
use	IEEE.std_logic_unsigned.all;

entity INTcont is
generic(
	INText	:integer	:=3
);
port(
	int7	:in std_logic	:='0';
	vect7	:in std_logic_vector(7 downto 0)	:=x"1f";
	iack7	:out std_logic;
	e_ln7	:in std_logic	:='1';
	ivack7	:out std_logic_vector(7 downto 0);

	int6	:in std_logic	:='0';
	vect6	:in std_logic_vector(7 downto 0)	:=x"1e";
	iack6	:out std_logic;
	e_ln6	:in std_logic	:='1';
	ivack6	:out std_logic_vector(7 downto 0);

	int5	:in std_logic	:='0';
	vect5	:in std_logic_vector(7 downto 0)	:=x"1d";
	iack5	:out std_logic;
	e_ln5	:in std_logic	:='1';
	ivack5	:out std_logic_vector(7 downto 0);

	int4	:in std_logic	:='0';
	vect4	:in std_logic_vector(7 downto 0)	:=x"1c";
	iack4	:out std_logic;
	e_ln4	:in std_logic	:='1';
	ivack4	:out std_logic_vector(7 downto 0);

	int3	:in std_logic	:='0';
	vect3	:in std_logic_vector(7 downto 0)	:=x"1b";
	iack3	:out std_logic;
	e_ln3	:in std_logic	:='1';
	ivack3	:out std_logic_vector(7 downto 0);

	int2	:in std_logic	:='0';
	vect2	:in std_logic_vector(7 downto 0)	:=x"1a";
	iack2	:out std_logic;
	e_ln2	:in std_logic	:='1';
	ivack2	:out std_logic_vector(7 downto 0);

	int1	:in std_logic	:='0';
	vect1	:in std_logic_vector(7 downto 0)	:=x"19";
	iack1	:out std_logic;
	e_ln1	:in std_logic	:='1';
	ivack1	:out std_logic_vector(7 downto 0);

	IPL		:out std_logic_vector(2 downto 0);
	addrin	:in std_logic_vector(23 downto 0);
	addrout	:out std_logic_vector(23 downto 0);
	rw		:in std_logic;
	dtack	:in std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end INTcont;
architecture rtl of INTcont is
signal	INTnum	:std_logic_vector(2 downto 0);
signal	vINT	:std_logic_vector(7 downto 1);
signal	sINT	:std_logic_vector(7 downto 1);
signal	lINT	:std_logic_vector(7 downto 1);
signal	ve_ln	:std_logic_vector(7 downto 1);
signal	INTe	:std_logic_vector(7 downto 1);
signal	INTclr	:std_logic_vector(2 downto 0);
signal	lINTclr	:std_logic_vector(2 downto 0);
signal	INTact	:std_logic_vector(2 downto 0);

type vect_t is array(7 downto 1) of std_logic_vector(7 downto 0);
signal	svectv	:vect_t;
signal	vectl		:vect_t;
signal	vectv		:vect_t;
signal	ivackv	:vect_t;
signal	ldtack	:std_logic;
signal	ackcount:integer range 0 to INText;
signal	INTen	:std_logic;
signal	iackv	:std_logic_vector(7 downto 1);
begin

	vINT<=int7 & int6 & int5 & int4 & int3 & int2 & int1;
	ve_ln<=e_ln7 & e_ln6 & e_ln5 & e_ln4 & e_ln3 & e_ln2 & e_ln1;

	INTnum<=
			"000"	when INTe(7)='1' else
			"001"	when INTe(6)='1' else
			"010"	when INTe(5)='1' else
			"011"	when INTe(4)='1' else
			"100"	when INTe(3)='1' else
			"101"	when INTe(2)='1' else
			"110"	when INTe(1)='1' else
			"111";

	vectv(7)<=vect7;
	vectv(6)<=vect6;
	vectv(5)<=vect5;
	vectv(4)<=vect4;
	vectv(3)<=vect3;
	vectv(2)<=vect2;
	vectv(1)<=vect1;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ldtack<='1';
				ackcount<=0;
			elsif(ce = '1')then
				ldtack<=dtack;
				if(INTclr/="000")then
					ackcount<=INText;
					INTact<=INTclr;
				elsif(dtack='1' and ldtack='0' and ackcount>0)then
					ackcount<=ackcount-1;
				end if;
			end if;
		end if;
	end process;
	INTen<='1' when INTclr/="000" or ackcount>0 else '0';
--	INTen<='1';
	addrout<=
			addrin	when rw='0' else	--or INTen='0'
			"00000000000000" & vectl(7) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011111"  else
			"00000000000000" & vectl(6) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011110"  else
			"00000000000000" & vectl(5) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011101"  else
			"00000000000000" & vectl(4) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011100"  else
			"00000000000000" & vectl(3) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011011"  else
			"00000000000000" & vectl(2) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011010"  else
			"00000000000000" & vectl(1) & addrin(1 downto 0) when addrin(23 downto 2)="0000000000000000011001"  else
			addrin;

	INTclr<=
			"000"	when rw='0' else
			"111"	when INTe(7)='1' and addrin(23 downto 2)="0000000000000000011111"  else
			"110"	when INTe(6)='1' and addrin(23 downto 2)="0000000000000000011110"  else
			"101"	when INTe(5)='1' and addrin(23 downto 2)="0000000000000000011101"  else
			"100"	when INTe(4)='1' and addrin(23 downto 2)="0000000000000000011100"  else
			"011"	when INTe(3)='1' and addrin(23 downto 2)="0000000000000000011011"  else
			"010"	when INTe(2)='1' and addrin(23 downto 2)="0000000000000000011010"  else
			"001"	when INTe(1)='1' and addrin(23 downto 2)="0000000000000000011001"  else
			"000";

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				sINT<=(others=>'0');
				lINT<=(others=>'0');
				--lINTclr<=(others=>'0');
				--svectv<=(others=>x"00");
			elsif(ce = '1')then
				sINT<=vINT;
				lINT<=sINT;
				--lINTclr<=INTclr;
				--svectv<=vectv;
			end if;
		end if;
	end process;

	process(clk,rstn)
	variable iINTact	:integer range 0 to 7;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				INTe<=(others=>'0');
			elsif(ce = '1')then
				iINTact:=conv_integer(INTact);
				for i in 1 to 7 loop
					if(ve_ln(i)='1')then
						if(sINT(i)='1' and lINT(i)='0')then
							INTe(i)<='1';
						else
							if(i=iINTact and ackcount=1)then
								INTe(i)<='0';
							end if;
						end if;
					else
						INTe(i)<=sINT(i);
					end if;
				end loop;
			end if;
		end if;
	end process;

--	process(clk,rstn)
--	variable ilintclr	:integer range 0 to 7;
--	begin
--		if(rstn='0')then
--			INTe<=(others=>'0');
--		elsif(ce = '1')then
--			for i in 1 to 7 loop
--				if(sINT(i)='1' and lINT(i)='0')then
--					INTe(i)<='1';
--				elsif(sINT(i)='0')then
--					INTe(i)<='0';
--				end if;
--			end loop;
--			if(INTclr="000")then
--				ilintclr:=conv_integer(lintclr);
--				if(ilintclr>0)then
--					if(e_ln(ilintclr)='1')then
--						INTe(ilintclr)<='0';
--					end if;
--				end if;
--			end if;
--		end if;
--	end process;

	process(clk,rstn)
	variable iintact	:integer range 0 to 7;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				iackv<=(others=>'0');
			elsif(ce = '1')then
				iackv<=(others=>'0');
				if(ackcount=1)then
					iintact:=conv_integer(INTact);
					if(iintact>0)then
						iackv(iintact)<='1';
					end if;
				end if;
			end if;
		end if;
	end process;


	process(clk,rstn)
	variable iintclr	:integer range 0 to 7;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				vectl<=(others=>x"00");
				ivackv<=(others=>x"00");
			elsif(ce = '1')then
				iintclr:=conv_integer(INTclr);
				for i in 1 to 7 loop
					if(iintclr/=i and inten='0')then
						vectl(i)<=vectv(i);
					elsif(iintclr=i)then
						ivackv(i)<=vectl(i);
					end if;
	--				if(sint(i)='1' and lint(i)='0')then
	--					vectl(i)<=svectv(i);
	--				end if;
				end loop;
	--			if(iintclr>0)then
	--				ivackv(iintclr)<=vectl(iintclr);
	--			end if;
			end if;
		end if;
	end process;

	IPL<=INTnum;

	iack7<=iackv(7);
	iack6<=iackv(6);
	iack5<=iackv(5);
	iack4<=iackv(4);
	iack3<=iackv(3);
	iack2<=iackv(2);
	iack1<=iackv(1);

	ivack7<=ivackv(7);
	ivack6<=ivackv(6);
	ivack5<=ivackv(5);
	ivack4<=ivackv(4);
	ivack3<=ivackv(3);
	ivack2<=ivackv(2);
	ivack1<=ivackv(1);

end rtl;

