---------------------------------------------------------------------------------
-- Z80-CTC counter by Dar (darfpga@aol.fr) (19/10/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ctc_counter is
port(
 clock     : in std_logic;
 clock_ena : in std_logic;
 reset     : in std_logic;

 d_in      : in std_logic_vector( 7 downto 0);
 load_data : in std_logic;

 clk_trg   : in std_logic;

 d_out     : out std_logic_vector(7 downto 0);
 zc_to     : out std_logic;
 int_pulse : out std_logic

 );
end ctc_counter;

architecture struct of ctc_counter is

 signal control_word : std_logic_vector(7 downto 0);
 signal wait_for_time_constant : std_logic;
 signal time_constant_loaded : std_logic;
 signal restart_on_next_clock : std_logic;
 signal restart_on_next_trigger : std_logic;

 signal prescale_max : std_logic_vector(7 downto 0);
 signal prescale_in  : std_logic_vector(7 downto 0) := (others => '0');
 signal count_max    : std_logic_vector(7 downto 0);
 signal count_in     : std_logic_vector(7 downto 0) := (others => '0');
 signal zc_to_in     : std_logic;
 signal clk_trg_in   : std_logic;
 signal clk_trg_r    : std_logic;
 signal trigger      : std_logic;
 signal trigger_clk  : std_logic;
 signal count_ena    : std_logic;
 signal load_data_r  : std_logic; -- make sure load_data toggles to get one new data

begin

prescale_max <= 
	(others => '0') when control_word(6) = '1' else  -- counter mode (prescale max = 0)
	X"0F" when control_word(6 downto 5) = "00" else  -- timer mode prescale 16
	X"FF";                                           -- timer mode prescale 256

clk_trg_in <= clk_trg xor control_word(4);

d_out <= count_in(7 downto 0);

zc_to <= zc_to_in;
int_pulse <= zc_to_in when control_word(7) = '1' else '0';

process (reset, clock)
begin

	if reset = '1' then -- hardware reset
		count_ena <= '0';
		wait_for_time_constant <= '0';
		time_constant_loaded <= '0';
		restart_on_next_clock <= '0';
		restart_on_next_trigger <= '0';
		count_in  <= (others=> '0');
		zc_to_in <= '0';
		clk_trg_r <= '0';
	else
		if rising_edge(clock) then
			if clock_ena = '1' then
				trigger <= '0';
				trigger_clk <= '0';
				if trigger_clk = '0' and trigger = '1' then
					trigger_clk <= '1';
				end if;
				load_data_r <= load_data;

				if (restart_on_next_trigger = '1' and trigger = '1') or (restart_on_next_clock = '1') then
					restart_on_next_clock <= '0';
					restart_on_next_trigger <= '0';
					count_ena   <= '1';
					count_in    <= count_max;
					prescale_in <= prescale_max;
				end if;

				if load_data = '1' and load_data_r = '0' then
				
					if wait_for_time_constant = '1' then
						wait_for_time_constant <= '0';
						time_constant_loaded   <= '1';
						count_max <= d_in;

						if control_word(6) = '0' and count_ena = '0' then -- in timer mode, if count was stooped
							if control_word(3) = '0' then -- auto start when time_constant loaded
								restart_on_next_clock <= '1';
							else                          -- wait for trigger to start
								restart_on_next_trigger <= '1';
							end if;
						end if;
						if control_word(6) = '1' then -- in trigger mode reload the counter immediately, 
						                              -- otherwise the first period will undefined
							prescale_in <= (others => '0');
							count_in    <= d_in;
						end if;
					else -- not waiting for time constant

						if d_in(0) = '1' then -- check if its a control world
							control_word <= d_in;
							wait_for_time_constant <= d_in(2);
							restart_on_next_clock <= '0';
							restart_on_next_trigger <= '0';

							if d_in(1) = '1' then -- software reset
								count_ena <= '0';
								time_constant_loaded <= '0';
								zc_to_in <= '0';
--								zc_to_in_r <= '0';
								clk_trg_r <= clk_trg xor d_in(4);
							end if;
						end if;

					end if;

				end if; -- end load data

				-- counter 
				zc_to_in <= '0';
				if ((control_word(6) = '1' and trigger_clk = '0' and trigger = '1') or -- rising edge of trigger_clk
					 (control_word(6) = '0' and count_ena = '1') ) and time_constant_loaded = '1' then
					if prescale_in = 0 then
						prescale_in <= prescale_max;
						if count_in = 1 then
							zc_to_in <= '1';
							count_in <= count_max;
						else
							count_in <= count_in - '1';
						end if;
					else
						prescale_in <= prescale_in - '1';
					end if;
				end if; 

			end if;

			-- detecting of trg input is asynchronous,
			-- but eventually it's synchronized to the timer clock (clock_ena) via trigger_clk
			clk_trg_r <= clk_trg_in;
			if clk_trg_in = '0' and clk_trg_r = '1' then
				trigger <= '1';
			end if;

		end if;
	end if;
end process;

end struct;
