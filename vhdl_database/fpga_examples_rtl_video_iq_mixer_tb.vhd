library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity iq_mixer_tb is
end entity;

-- -----------------------------------------------------------------------

architecture tb of iq_mixer_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';

	type test_t is record
			name : string(1 to 16);

			phase_i : unsigned(3 downto 0);
			phase_q : unsigned(3 downto 0);
			in_y : unsigned(7 downto 0);
			in_i : signed(7 downto 0);
			in_q : signed(7 downto 0);

			black : std_logic;
			sync : std_logic;
		end record;
	signal video : unsigned(7 downto 0);

	signal test_reg : test_t := (
		"                ",
		"0000", "0000",
		"00000000", "00000000", "00000000",
		'0', '0');

	procedure wait_clk is
	begin
		if clk = '1' then
			wait until clk = '0';
		end if;
		wait until clk = '1';
	end procedure;

	procedure phase_cycle(signal t : inout test_t) is
	begin
		phase_loop : for i in 0 to 15 loop
			wait_clk;
			t.phase_i <= t.phase_i + 1;
			t.phase_q <= t.phase_q + 1;
		end loop;
	end procedure;

begin
	clk <= (not stop) and (not clk) after 5 ns;

	iq_mixer_inst : entity work.iq_mixer
		generic map (
			black_level => "00010000"
		)
		port map (
			clk => clk,
			phase_i => test_reg.phase_i,
			phase_q => test_reg.phase_q,
			in_y => test_reg.in_y,
			in_i => test_reg.in_i,
			in_q => test_reg.in_q,

			black => test_reg.black,
			sync => test_reg.sync,

			video => video
		);

	process
	begin
		phase_cycle(test_reg);
		test_reg.in_y <= "10000000";
		phase_cycle(test_reg);
		i_ampl_loop : for i in -128 to 127 loop
			test_reg.in_i <= to_signed(i, 8);
			phase_cycle(test_reg);
		end loop;

		test_reg.phase_i <= X"0";
		test_reg.phase_q <= X"4";
		test_reg.in_i <= to_signed(16, 8);
		q_ampl_loop : for i in -128 to 127 loop
			test_reg.in_q <= to_signed(i, 8);
			phase_cycle(test_reg);
		end loop;

		test_reg.name <= "BLACK LEVEL     ";
		test_reg.black <= '1';
		phase_cycle(test_reg);

		test_reg.name <= "SYNC            ";
		test_reg.sync <= '1';
		phase_cycle(test_reg);

		stop <= '1';
		wait;
	end process;
end architecture;