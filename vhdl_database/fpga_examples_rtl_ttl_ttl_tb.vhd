library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ttl_pkg.all;

entity ttl_tb is
end entity;

architecture tb of ttl_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	signal cnt_reg : unsigned(14 downto 0) := (others => '0');
	signal row : unsigned(15 downto 0) := (others => '0');

	signal a : ttl_t := FLOAT;
	signal b : ttl_t := FLOAT;
	signal c : ttl_t;
	signal u : ttl_t;
	signal t_or : ttl_t;
	signal t_xor : ttl_t;
	signal nand_out : ttl_t;
	signal out7410 : ttl_t;
	signal out7411 : ttl_t;
begin
	clk <= stop or (not clk) after 5 ns;

	-- "Running light" to be able to quickly test demuxes
	row(0) <= '1' when cnt_reg(11 downto 8) = "0000" else '0';
	row(1) <= '1' when cnt_reg(11 downto 8) = "0001" else '0';
	row(2) <= '1' when cnt_reg(11 downto 8) = "0010" else '0';
	row(3) <= '1' when cnt_reg(11 downto 8) = "0011" else '0';
	row(4) <= '1' when cnt_reg(11 downto 8) = "0100" else '0';
	row(5) <= '1' when cnt_reg(11 downto 8) = "0101" else '0';
	row(6) <= '1' when cnt_reg(11 downto 8) = "0110" else '0';
	row(7) <= '1' when cnt_reg(11 downto 8) = "0111" else '0';
	row(8) <= '1' when cnt_reg(11 downto 8) = "1000" else '0';
	row(9) <= '1' when cnt_reg(11 downto 8) = "1001" else '0';
	row(10) <= '1' when cnt_reg(11 downto 8) = "1010" else '0';
	row(11) <= '1' when cnt_reg(11 downto 8) = "1011" else '0';
	row(12) <= '1' when cnt_reg(11 downto 8) = "1100" else '0';
	row(13) <= '1' when cnt_reg(11 downto 8) = "1101" else '0';
	row(14) <= '1' when cnt_reg(11 downto 8) = "1110" else '0';
	row(15) <= '1' when cnt_reg(11 downto 8) = "1111" else '0';

	process(clk)
	begin
		if rising_edge(clk) then
			cnt_reg <= cnt_reg + 1;
		end if;
	end process;

	process(a,b)
	begin
		c <= a + b;
		u <= a + b + PULLUP + FLOAT;
	end process;

	ttl_7400_inst : entity work.ttl_7400
		port map (emuclk => clk,
			p1 => a, p2 => b, p3 => nand_out,
			p4 => VCC, p5 => VCC, p9 => VCC, p10 => VCC, p12 => VCC, p13 => VCC);

	ttl_7410_inst : entity work.ttl_7410
		port map (emuclk => clk,
			p1 => std2ttl(cnt_reg(3)), p2 => std2ttl(cnt_reg(4)), p13 => std2ttl(cnt_reg(5)), p12 => out7410,
			p3 => VCC, p4 => VCC, p5 => VCC, p9 => VCC, p10 => VCC, p11 => VCC);

	ttl_7411_inst : entity work.ttl_7411
		port map (emuclk => clk,
			p1 => std2ttl(cnt_reg(3)), p2 => std2ttl(cnt_reg(4)), p13 => std2ttl(cnt_reg(5)), p12 => out7411,
			p3 => VCC, p4 => VCC, p5 => VCC, p9 => VCC, p10 => VCC, p11 => VCC);

	ttl_7474_blk : block
		signal q : ttl_t;
		signal nq : ttl_t;
	begin
		ttl_7474_inst : entity work.ttl_7474
			port map (emuclk => clk,
				p1 => VCC, p2 => nq, p3 => std2ttl(cnt_reg(3)), p4 => VCC, p5 => q, p6 => nq,
				p10 => VCC, p11 => VCC, p12 => VCC, p13 => VCC);
	end block;

	ttl_7485_inst : entity work.ttl_7485
		port map (emuclk => clk,
			p2 => std2ttl(cnt_reg(3)), p3 => std2ttl(cnt_reg(4)), p4 => std2ttl(cnt_reg(5)),
			p9 => std2ttl(cnt_reg(6)), p11 => std2ttl(cnt_reg(7)), p14 => std2ttl(cnt_reg(8)), p1 => std2ttl(cnt_reg(9)),
			p10 => std2ttl(cnt_reg(10)), p12 => std2ttl(cnt_reg(11)), p13 => std2ttl(cnt_reg(12)), p15 => std2ttl(cnt_reg(13)));

	ttl_74138_inst : entity work.ttl_74138
		port map (emuclk => clk,
			p1 => std2ttl(cnt_reg(3)), p2 => std2ttl(cnt_reg(4)), p3 => std2ttl(cnt_reg(5)),
			p4 => std2ttl(cnt_reg(6)), p5 => std2ttl(cnt_reg(7)), p6 => std2ttl(cnt_reg(8)));

	ttl_74139_inst : entity work.ttl_74139
		port map (emuclk => clk,
			p1 => std2ttl(cnt_reg(3)), p2 => std2ttl(cnt_reg(4)), p3 => std2ttl(cnt_reg(5)),
			p13 => std2ttl(cnt_reg(5)), p14 => std2ttl(cnt_reg(4)), p15 => std2ttl(cnt_reg(3)));

	ttl_74151_inst : entity work.ttl_74151
		port map (emuclk => clk,
			p4 => std2ttl(row(0)), p3 => std2ttl(row(1)), p2 => std2ttl(row(2)), p1 => std2ttl(row(3)),
			p15 => std2ttl(row(4)), p14 => std2ttl(row(5)), p13 => std2ttl(row(6)), p12 => std2ttl(row(7)),
			p7 => std2ttl(cnt_reg(3)), p11 => std2ttl(cnt_reg(4)), p10 => std2ttl(cnt_reg(5)), p9 => std2ttl(cnt_reg(6)));

	ttl_74163_inst : entity work.ttl_74163
		port map (emuclk => clk,
			p1 => std2ttl(cnt_reg(8)), p2 => std2ttl(cnt_reg(3)),
			p3 => ZERO, p4 => ZERO, p5 => ZERO, p6 => ZERO, p7 => ONE, p9 => ONE, p10 => ONE);

	ttl_74166_inst : entity work.ttl_74166
		port map (emuclk => clk,
			p7 => std2ttl(cnt_reg(3)), p6 => ZERO, p15 => std2ttl(cnt_reg(9)), p9 => std2ttl(cnt_reg(10)), p1 => ONE,
			p2 => ZERO, p3 => ONE, p4 => ONE, p5 => ZERO, p10 => ZERO, p11 => ONE, P12 => ZERO, p14 => ONE);

	ttl_74283_inst : entity work.ttl_74283
		port map (emuclk => clk,
			p5 => std2ttl(cnt_reg(3)), p3 => std2ttl(cnt_reg(4)), p14 => std2ttl(cnt_reg(5)), p12 => std2ttl(cnt_reg(6)), 
			p6 => std2ttl(cnt_reg(7)), p2 => std2ttl(cnt_reg(8)), p15 => std2ttl(cnt_reg(9)), p11 => std2ttl(cnt_reg(10)), 
			p7 => std2ttl(cnt_reg(11)));

	t_or <= a or b;
	t_xor <= a xor b;


	process
	begin
		a <= FLOAT;
		b <= FLOAT;
		wait for 100 ns;
		a <= ZERO;
		wait for 100 ns;
		a <= ONE;
		wait for 100 ns;
		a <= PULLUP;
		wait for 100 ns;
		b <= ZERO;
		wait for 100 ns;
		b <= ONE;
		wait for 100 ns;
		b <= GND;
		wait for 100 ns;

		wait for 100 us;

		stop <= '1';
		wait;

	end process;
end architecture;