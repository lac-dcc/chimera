-- Sound synth board for King & Balloon

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity kb_synth is
	port (
		reset_n  : in  std_logic;
		clk : in  std_logic;
		in0 : in  std_logic;
		in1 : in  std_logic;
		in2 : in  std_logic;
		in3 : in  std_logic;
		speech_out   : out std_logic_vector(7 downto 0)
	);
end kb_synth;

architecture RTL of kb_synth is

signal cpu_ce : std_logic;
signal cpu_ce_cnt : unsigned(2 downto 0);
signal cpu_addr : std_logic_vector(15 downto 0);
signal cpu_di : std_logic_vector(7 downto 0);
signal cpu_do : std_logic_vector(7 downto 0);
signal ram_do : std_logic_vector(7 downto 0);
signal rom4_do : std_logic_vector(7 downto 0);
signal rom5_do : std_logic_vector(7 downto 0);
signal rom6_do : std_logic_vector(7 downto 0);
signal mreq_n : std_logic;
signal iorq_n : std_logic;
signal rd_n : std_logic;
signal wr_n : std_logic;

signal ram_ce : std_logic;
signal ram_wr : std_logic;
signal rom4_ce : std_logic;
signal rom5_ce : std_logic;
signal rom6_ce : std_logic;
signal buf_do : std_logic_vector(7 downto 0);
signal buf_ce_n : std_logic;

begin

	cpu_di <= ram_do when ram_ce = '1' else
	         rom4_do when rom4_ce = '1' else
	         rom5_do when rom5_ce = '1' else
	         rom6_do when rom6_ce = '1' else
	          buf_do when buf_ce_n = '0' else
	         "00000000";

	-- clk/5 = 12MHz/5 = 2.4MHz (originally 5MHz/2)
	process(clk, reset_n)
	begin
		if reset_n = '0' then
			cpu_ce <= '0';
			cpu_ce_cnt <= (others => '0');
		elsif rising_edge(clk) then
			cpu_ce_cnt <= cpu_ce_cnt + 1;
			cpu_ce <= '0';
			if cpu_ce_cnt = 4 then
				cpu_ce <= '1';
				cpu_ce_cnt <= (others => '0');
			end if;
		end if;
	end process;

	cpu : entity work.T80se
	port map (
		RESET_n      => reset_n,
		CLK_n        => clk,
		CLKEN        => cpu_ce,
		WAIT_n       => '1',
		INT_n        => '1',
		NMI_n        => '1',
		BUSRQ_n      => '1',		
		MREQ_n       => mreq_n,
		IORQ_n       => iorq_n,
		RD_n         => rd_n,
		WR_n         => wr_n,		
		A            => cpu_addr,
		DI           => cpu_di,
		DO           => cpu_do
	);

	ram_ce <= cpu_addr(13) and not mreq_n;
	ram_wr <= not wr_n and ram_ce;

	ram_inst : entity work.spram generic map(10,8)
	port map (
		address  	 => cpu_addr(9 downto 0),
		clock    	 => clk,
		data     	 => cpu_do,
		wren       => ram_wr,
		q          => ram_do
	);

	rom4_ce <= '1' when rd_n = '0' and mreq_n = '0' and cpu_addr(13 downto 11) = "000" else '0';
	rom4_inst : entity work.kbe1_IC4
	port map (
		clk    	 	 => clk,
		addr  	 	 => cpu_addr(10 downto 0),
		data			 => rom4_do
	);

	rom5_ce <= '1' when rd_n = '0' and mreq_n = '0' and cpu_addr(13 downto 11) = "001" else '0';
	rom5_inst : entity work.kbe2_IC5
	port map (
		clk    	 	 => clk,
		addr  	 	 => cpu_addr(10 downto 0),
		data			 => rom5_do
	);

	rom6_ce <= '1' when rd_n = '0' and mreq_n = '0' and cpu_addr(13 downto 11) = "010" else '0';
	rom6_inst : entity work.kbe3_IC6
	port map (
		clk    	 	 => clk,
		addr  	 	 => cpu_addr(10 downto 0),
		data			 => rom6_do
	);

	process(clk, reset_n)
	begin
		if reset_n = '0' then
			speech_out <= (others => '0');
		elsif rising_edge(clk) then
			if iorq_n = '0' and wr_n = '0' then
				speech_out <= cpu_do;
			end if;
		end if;
	end process;

	buf_ce_n <= rd_n or iorq_n;
	buf_do <= "1111"&in3&in2&in1&in0;

end RTL;
