------------------------------------------------------------------------------------
--state machine:
--1) idle: wait for the period to start the ping sensing
--2) trigger: send the 10us trigger pulse 
--3) wait echo: wait for the echo high edge, if timeout_cnt reaches 50ms, restart
--4) echo count: echo rising edge received begin count, end count when echo falling edge, if timeout_cnt reaches 50ms, restart
--5) wait next: wait for timeout to reach 50ms.
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity ping_sensor_v2  is
generic (CLK_FREQ_NS : positive := 20);
port( 	clk : in std_logic;
		reset: in std_logic;
		--ping signals
		ping_io: inout std_logic;  	--tristate option usage
		--trigger_out: out std_logic;	--trigger output signal (if not using trisate)
		--echo_in: in std_logic;  	--echo in signal (if not using trisate)
		echo_length : out std_logic_vector(15 downto 0);
		ping_enable: in std_logic;
		echo_done_out: out std_logic;
		state_debug: out std_logic_vector(2 downto 0);
		timeout: out std_logic;
		busy : out std_logic 
);
end ping_sensor_v2 ;

architecture Behavioral of ping_sensor_v2 is
	type state_type is (idle, trigger, echo_wait, echo_cnt, echo_wait_low, wait_next); --,wait_sample_period);
	signal state_reg, state_next: state_type;
	
	--@50Mhz
	constant VAL_1us :integer:= 1_000/CLK_FREQ_NS;
	constant VAL_WAIT_NEXT_PING: integer := 5000; -- found that at least 170 us need on the parallax sensor.
	constant VAL_10us :integer:= 10 ; 	--10us 
	constant TIMEOUT_VAL: integer := 50_000; --50ms
	
	signal echo_reading_r: unsigned(31 downto 0);
		
	--general purpose 1us counter used in state machine
	signal cnt_us_r: unsigned(31 downto 0);
	signal cnt_us_rst, cnt_us_rst_r: std_logic;
	
	signal trigger_out_n, echo_done : std_logic ;
	
	--usec counter signals
	signal end_usec, load_usec_counter : std_logic ;
	signal usec_counter : std_logic_vector(31 downto 0);
		
	--IF USING TRISTATE VALUES
	signal echo_in, trigger_out: std_logic;
	
	signal trigger_out_temp: std_logic;
	
	signal echo_in_r: std_logic;
	
	
begin	
--tristate option
ping_io <= trigger_out when state_reg = trigger else 'Z';
echo_in <= ping_io;		--io set to input, assign internal signal

--registers
process(clk, reset)
begin
	if reset = '1' then
		state_reg <= idle;
		echo_in_r <= '0';
	elsif clk'event and clk = '1' then
		state_reg <= state_next;
		echo_in_r <= echo_in;
	end if;
end process ;

process(state_reg, ping_enable, echo_in_r,cnt_us_r, end_usec)
begin
	state_next <= state_reg;
	cnt_us_rst <= '0';
	state_debug <= "000";
	case state_reg is 
		
		when idle => 
			state_debug <= "001";
			if (ping_enable = '1') then	--start trigger sequence
				state_next <= trigger;	
				cnt_us_rst <= '1';
			end if;
								
		when trigger =>
			state_debug <= "010";
			--if (cnt_us_r >= VAL_10US) then
			if (cnt_us_r >= VAL_10US and end_usec = '1') then
				state_next <= echo_wait;
				cnt_us_rst <= '1';
			end if;	
					
		when echo_wait =>	--wait for echo to go high
			state_debug <= "011";
			if (echo_in_r = '1' and end_usec = '1') then		--echo went high
				state_next <= echo_cnt;	
				cnt_us_rst <= '1';
			--elsif (cnt_us_r >= TIMEOUT_VAL) then
			elsif (cnt_us_r >= TIMEOUT_VAL and end_usec = '1') then
				--state_next <= idle;
				state_next <= wait_next;
				cnt_us_rst <= '1';
			end if;	
			
		when echo_cnt =>					--cnt length of echo pulse
			state_debug <= "100";
			if (echo_in_r = '0' and end_usec = '1') then		--ECHO received - DONE!
				state_next <= wait_next;
				cnt_us_rst <= '1';
			--elsif (cnt_us_r >= TIMEOUT_VAL ) then
			elsif (cnt_us_r >= TIMEOUT_VAL and end_usec = '1') then	--check to see if the timeout
				--state_next <= idle;
				state_next <= echo_wait_low;
				cnt_us_rst <= '1';
			end if;				

		when echo_wait_low	=>	--this will wait to ensure echo has gone low, sr04 will timeout @200ms with echo high
			state_debug <= "110";
			if(echo_in_r = '0' and end_usec = '1') then
				cnt_us_rst <= '1';
				state_next <= wait_next;
			end if;
			
		when	wait_next	=>	-- wait end of timeout to start next measurement
			state_debug <= "101";
			--if (cnt_us_r >= VAL_WAIT_NEXT_PING ) then
			if (cnt_us_r >= VAL_WAIT_NEXT_PING and end_usec = '1') then  --putting lower values here throws wrencn in the works
			--if (timeout_cnt_r >= VAL_WAIT_NEXT_PING) then  --wait minmum amount of time until next reading
				state_next  <= idle;
				cnt_us_rst <= '1';
			end if;	
	end case;
end process;


-- with state_reg select
-- state_debug <= "00" when idle,
						-- "01" when trigger,
						-- "10" when echo_wait,
						-- "11" when echo_cnt,
						-- "00" when others ;

-- cnt_us_rst <= 		'1' when state_reg = idle else
					-- '1' when state_reg = trigger and cnt_us_r >= VAL_10US else  --reset the timeout after trigger is sent
					-- '1' when state_reg = echo_wait and echo_in = '1' else
					-- '1' when state_reg = echo_wait and cnt_us_r >= TIMEOUT_VAL else  --timeout
					-- '1' when state_reg = echo_cnt and echo_in = '0' else  --restart counter when entering wait_next state.
					-- '1' when state_reg = echo_cnt and cnt_us_r >= TIMEOUT_VAL else 
					-- '0' ;				
						 						 
trigger_out_n <= '1' when state_reg = trigger else
					'0' ;
					 
echo_done <= '1' when state_reg = echo_cnt and echo_in_r = '0' else	
				'0' ;
				 
timeout <= '1' when state_reg = echo_wait and cnt_us_r >= TIMEOUT_VAL else	
			  '1' when state_reg = echo_cnt and cnt_us_r >= TIMEOUT_VAL else
			  '0' ;
			  
busy <= '0' when state_reg = idle and ping_enable = '0' else
			'1' ;

-- cnt_us_r  counter 
process(clk, reset)
begin
	if reset = '1' then
		cnt_us_r <= (others => '0');
	elsif clk'event and clk = '1' then
		--if cnt_us_rst_r = '1' then		--trying to use latched rst to see if helps with value.... nope
		if cnt_us_rst = '1' then		
			cnt_us_r  <= (others => '0');
		elsif end_usec = '1' then
			cnt_us_r  <= cnt_us_r  + 1 ;
			--This was not here.  Was creating a latch?
		end if ;
	end if ;
end process ;

-- usec counter
process(clk, reset)
begin
	if reset = '1' then
		usec_counter <= std_logic_vector(to_unsigned(VAL_1us-1, 32));
	elsif clk'event and clk = '1' then
		if load_usec_counter = '1' then
			usec_counter <= std_logic_vector(to_unsigned(VAL_1us-1, 32));
		else
			usec_counter <= usec_counter - 1 ;
		end if ;
	end if ;
end process ;
end_usec 		<= '1' when usec_counter = 0 else
					'0' ;
load_usec_counter <= '1' when state_reg = idle else
							end_usec;

--result latch
process(clk, reset)
begin
	if reset = '1' then
		echo_reading_r <= (others => '0');
	elsif clk'event and clk = '1' then
		if echo_done = '1' then
			echo_reading_r <= cnt_us_r;
		end if ;
	end if ;
end process ;


--register drving trigger out
process(clk, reset)
begin
	if reset = '1' then
		trigger_out <= '0';
	elsif clk'event and clk = '1' then
		trigger_out <= trigger_out_n ;
	end if ;
end process ;

--register latch the reset signal, getting glic
process(clk, reset)
begin
	if reset = '1' then
		cnt_us_rst_r <= '0';
	elsif clk'event and clk = '1' then
		cnt_us_rst_r <= cnt_us_rst ;
	end if ;
end process ;

						
echo_length <= std_logic_vector(echo_reading_r(15 downto 0)) ;						
echo_done_out <= echo_done;

end Behavioral;


