LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IOcont is
port(
	addr		:in std_logic_vector(23 downto 0);
	rdat		:out std_logic_vector(7 downto 0);
	wdat		:in std_logic_vector(7 downto 0);
	rd			:in std_logic;
	wr			:in std_logic;
	datoe		:out std_logic;
	int			:out std_logic;
	ivect		:out std_logic_vector(7 downto 0);
	iack		:in std_logic;
	iackvect	:in std_logic_vector(7 downto 0);
	
	fd_dcontsel	:out std_logic_vector(3 downto 0);
	fd_drvled	:out std_logic_vector(3 downto 0);
	fd_drveject	:out std_logic_vector(3 downto 0);
	fd_drvejen	:out std_logic_vector(3 downto 0);
	fd_diskin	:in std_logic_vector(3 downto 0);
	fd_diskerr	:in std_logic_vector(3 downto 0);
	
	fd_drvsel	:out std_logic_vector(3 downto 0);
	fd_usel		:out std_logic_vector(1 downto 0);
	fd_drvhd	:out std_logic;
	fd_drvmt	:out std_logic;
	
	fd_feject	:out std_logic_vector(3 downto 0);
	fd_LED		:out std_logic_vector(3 downto 0);
	fd_lock		:out std_logic_vector(3 downto 0);
	
	fdc_cs		:out std_logic;
	fdc_int		:in std_logic;

	hdd_int		:in std_logic;
	prn_int		:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end IOcont;

architecture rtl of IOcont is
signal	INTVECT	:std_logic_vector(7 downto 2);
signal	INTx	:std_logic_vector(3 downto 0);
signal	INTmask	:std_logic_vector(3 downto 0);
signal	INTn	:std_logic_vector(1 downto 0);
signal	fdd_int	:std_logic;
signal	fdd_intt:std_logic;
signal	ADDRx	:std_logic_vector(23 downto 0);
signal	fdcsel	:std_logic_vector(3 downto 0);
signal	diskin	:std_logic;
signal	errdisk	:std_logic;
signal	indiskor:std_logic;
signal	iackl	:std_logic;
signal	indiskl	:std_logic_vector(3 downto 0);
signal	lindiskl:std_logic_vector(3 downto 0);
signal	diskins	:std_logic_vector(3 downto 0);
signal	diskeject:std_logic_vector(3 downto 0);
signal	fdcedge	:std_logic_vector(3 downto 0);
signal	fdc_ejec:std_logic;
signal	fdc_ledc:std_logic;
signal	fdc_lockc:std_logic;
begin
	ADDRx<=addr(23 downto 1) & '1';
	INTx<=hdd_int & fdc_int & fdd_int & prn_int;
	
	fd_dcontsel	<= (others => '0');
	fd_drvled	<= (others => '0');
	fd_drveject	<= (others => '0');
	fd_drvejen	<= (others => '0');
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				indiskl<=(others=>'0');
				lindiskl<=(others=>'0');
			elsif(ce = '1')then
				lindiskl<=indiskl;
				indiskl<=fd_diskin;
				for i in 0 to 3 loop
					if(lindiskl(i)='0' and indiskl(i)='1')then
						diskins(i)<='1';
					else
						diskins(i)<='0';
					end if;
					if(lindiskl(i)='1' and indiskl(i)='0')then
						diskeject(i)<='1';
					else
						diskeject(i)<='0';
					end if;
				end loop;
			end if;
		end if;
	end process;
	
	fdd_intt<=diskins(3) or diskins(2) or diskins(1) or diskins(0) or diskeject(3) or diskeject(2) or diskeject(1) or diskeject(0);
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				fdd_int<='0';
				iackl<='0';
			elsif(ce = '1')then
				iackl<=iack;
				if(fdd_intt='1')then
					fdd_int<='1';
				elsif(iackl='1' and iackvect(1 downto 0)="01")then
					fdd_int<='0';
				end if;
			end if;
		end if;
	end process;
		
	rdat<=	fdc_int & fdd_int & prn_int & hdd_int & INTmask when ADDRx=x"e9c001" else
			INTVECT & "00" when ADDRx=x"e9c003" else
			diskin & errdisk & "000000" when ADDRx=x"e94005" else
			(others=>'0');

	datoe<=	'0' when rd='0' else
			'1' when ADDRx=x"e9c001" else
			'1' when ADDRx=x"e9c003" else
			'1' when ADDRx=x"e94005" else
			'0';
	
	diskin<=(fdcsel(3) and fd_diskin(3)) or (fdcsel(2) and fd_diskin(2)) or (fdcsel(1) and fd_diskin(1)) or (fdcsel(0) and fd_diskin(0));
	errdisk<=(fdcsel(3) and fd_diskerr(3)) or (fdcsel(2) and fd_diskerr(2)) or (fdcsel(1) and fd_diskerr(1)) or (fdcsel(0) and fd_diskerr(0));
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				INTn<=(others=>'0');
				int<='0';
			elsif(ce = '1')then
				int<='0';
				INTn<=(others=>'0');
				for i in 0 to 3 loop
					if(INTmask(i)='1' and INTx(i)='1')then
						case i is
						when 0 =>
							INTn<="11";
						when 1 =>
							INTn<="01";
						when 2 =>
							INTn<="00";
						when 3 =>
							INTn<="10";
						when others =>
							INTn<="00";
						end case;
						int<='1';
					end if;
				end loop;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				INTmask<=(others=>'0');
			elsif(ce = '1')then
				if(ADDRx=x"e9c001" and wr='1')then
					INTmask<=wdat(3 downto 0);
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				INTVECT<=(others=>'0');
			elsif(ce = '1')then
				if(ADDRx=x"e9c003" and wr='1')then
					INTVECT<=wdat(7 downto 2);
				end if;
			end if;
		end if;
	end process;
	ivect<=INTVECT & INTn;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				fd_drvsel<="0001";
				fd_drvhd<='0';
				fd_drvmt<='0';
				fd_usel<="00";
			elsif(ce = '1')then
				if(ADDRx=x"e94007" and wr='1')then
					case wdat(1 downto 0) is
					when "00" =>
						fd_drvsel<="0001";
					when "01" =>
						fd_drvsel<="0010";
					when "10" =>
						fd_drvsel<="0100";
					when "11" =>
						fd_drvsel<="1000";
					when others =>
						fd_drvsel<="0000";
					end case;
					fd_usel<=wdat(1 downto 0);
					fd_drvhd<=wdat(4);
					fd_drvmt<=wdat(7);
				end if;
			end if;
		end if;
	end process;
	
	fdc_cs<='1' when ADDRx=x"e94001" else
			'1' when ADDRx=x"e94003" else
			'0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				fdcsel<=(others=>'0');
				fdcedge<=(others=>'0');
				fdc_ejec<='0';
				fdc_lockc<='0';
				fdc_ledc<='0';
			elsif(ce = '1')then
				fdcedge<=(others=>'0');
				if(ADDRx=x"e94005" and wr='1')then
					fdcsel<=wdat(3 downto 0);
					for i in 0 to 3 loop
						if(fdcsel(i)='1' and wdat(i)='0')then
							fdcedge(i)<='1';
						end if;
					end loop;
					fdc_ejec<=wdat(5);
					fdc_lockc<=wdat(6);
					fdc_ledc<=wdat(7);
				end if;
			end if;
		end if;
	end process;

	fd_feject<=fdcedge when fdc_ejec='1' else (others=>'0');
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				fd_LED<=(others=>'0');
				fd_lock<=(others=>'0');
			elsif(ce = '1')then
				for i in 0 to 3 loop
					if(fdcedge(i)='1')then
						fd_LED(i)<=fdc_ledc;
						fd_lock(i)<=fdc_lockc;
					end if;
				end loop;
			end if;
		end if;
	end process;
end rtl;
	