library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Z80-CTC (MK3882) top-level
entity z80ctc_top is
port(
 clock     : in  std_logic;
 clock_ena : in  std_logic;
 reset     : in  std_logic;

 din       : in  std_logic_vector(7 downto 0);
 dout      : out std_logic_vector(7 downto 0);
 cpu_din   : in  std_logic_vector(7 downto 0); -- mirror the input to the cpu, for RETI detection

 ce_n      : in  std_logic;
 cs        : in  std_logic_vector(1 downto 0);
 m1_n      : in  std_logic;
 iorq_n    : in  std_logic;
 rd_n      : in  std_logic;
 int_n     : out std_logic;

 trg0      : in  std_logic;
 to0       : out std_logic;

 trg1      : in  std_logic;
 to1       : out std_logic;

 trg2      : in  std_logic;
 to2       : out std_logic;

 trg3      : in  std_logic
 );
end z80ctc_top;

architecture struct of z80ctc_top is

 signal cpu_int_ack_n     : std_logic;
 signal ctc_int_n         : std_logic;

 signal ctc_controler_we  : std_logic;
 signal ctc_controler_do  : std_logic_vector(7 downto 0);
 signal ctc_int_ack       : std_logic;
 signal ctc_int_ack_phase : std_logic_vector(1 downto 0);

 signal ctc_counter_0_we  : std_logic;
 signal ctc_counter_0_do  : std_logic_vector(7 downto 0);
 signal ctc_counter_0_int : std_logic;

 signal ctc_counter_1_we  : std_logic;
 signal ctc_counter_1_do  : std_logic_vector(7 downto 0);
 signal ctc_counter_1_int : std_logic;

 signal ctc_counter_2_we  : std_logic;
 signal ctc_counter_2_do  : std_logic_vector(7 downto 0);
 signal ctc_counter_2_int : std_logic;

 signal ctc_counter_3_we  : std_logic;
 signal ctc_counter_3_do  : std_logic_vector(7 downto 0);
 signal ctc_counter_3_int : std_logic;

begin

process (clock, reset)
begin
	if reset = '1' then
		ctc_int_ack_phase <= "00";
	elsif rising_edge(clock) then
		-- decode ED4D (reti)
		if clock_ena = '1' and rd_n = '0' and m1_n = '0' then
			case ctc_int_ack_phase is
			when "00" => if cpu_din = x"ED" then ctc_int_ack_phase <= "01"; end if;
			when "01" => if cpu_din = x"4D" then ctc_int_ack_phase <= "11"; elsif cpu_din /= x"ED" then ctc_int_ack_phase <= "00"; end if;
			when "11" => if cpu_din = x"ED" then ctc_int_ack_phase <= "01"; elsif cpu_din /= x"4D" then ctc_int_ack_phase <= "00"; end if;
			when others => ctc_int_ack_phase <= "00";
			end case;
		end if;
	end if;
end process;

ctc_int_ack <= '1' when ctc_int_ack_phase = "11" else '0';
cpu_int_ack_n <= iorq_n or m1_n;

ctc_controler_we <= '1' when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '1' and cs = "00" else '0';
ctc_counter_0_we <= '1' when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '1' and cs = "00" else '0';
ctc_counter_1_we <= '1' when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '1' and cs = "01" else '0';
ctc_counter_2_we <= '1' when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '1' and cs = "10" else '0';
ctc_counter_3_we <= '1' when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '1' and cs = "11" else '0';

dout <= ctc_controler_do when cpu_int_ack_n = '0' and ctc_int_n = '0' else
        ctc_counter_0_do when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '0' and cs = "00" else
        ctc_counter_1_do when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '0' and cs = "01" else
        ctc_counter_2_do when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '0' and cs = "10" else
        ctc_counter_3_do when ce_n = '0' and iorq_n = '0' and m1_n = '1' and rd_n = '0' and cs = "11" else
        x"FF";

int_n <= ctc_int_n;

-- CTC interrupt controler Z80-CTC (MK3882)
ctc_controler : entity work.ctc_controler
port map(
 clock     => clock,
 clock_ena => clock_ena,
 reset     => reset,

 d_in      => din,
 load_data => ctc_controler_we,
 int_ack   => cpu_int_ack_n,
 int_end   => ctc_int_ack,

 int_pulse_0 => ctc_counter_0_int,
 int_pulse_1 => ctc_counter_1_int,
 int_pulse_2 => ctc_counter_2_int,
 int_pulse_3 => ctc_counter_3_int,

 d_out     => ctc_controler_do,
 int_n     => ctc_int_n
);

ctc_counter_0 : entity work.ctc_counter
port map(
 clock     => clock,
 clock_ena => clock_ena,
 reset     => reset,

 d_in      => din,
 load_data => ctc_counter_0_we,

 clk_trg   => trg0,

 d_out     => ctc_counter_0_do,
 zc_to     => to0,
 int_pulse => ctc_counter_0_int

);

ctc_counter_1 : entity work.ctc_counter
port map(
 clock     => clock,
 clock_ena => clock_ena,
 reset     => reset,

 d_in      => din,
 load_data => ctc_counter_1_we,

 clk_trg   => trg1,

 d_out     => ctc_counter_1_do,
 zc_to     => to1,
 int_pulse => ctc_counter_1_int

);

ctc_counter_2 : entity work.ctc_counter
port map(
 clock     => clock,
 clock_ena => clock_ena,
 reset     => reset,

 d_in      => din,
 load_data => ctc_counter_2_we,

 clk_trg   => trg2,

 d_out     => ctc_counter_2_do,
 zc_to     => to2,
 int_pulse => ctc_counter_2_int

);

ctc_counter_3 : entity work.ctc_counter
port map(
 clock     => clock,
 clock_ena => clock_ena,
 reset     => reset,

 d_in      => din,
 load_data => ctc_counter_3_we,

 clk_trg   => trg3,

 d_out     => ctc_counter_3_do,
 zc_to     => open,
 int_pulse => ctc_counter_3_int

);
end struct;
