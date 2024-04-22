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

entity ping_sensor  is
generic (CLK_FREQ_NS : positive := 20);
port( 	clk : in std_logic;
		reset: in std_logic;
		--ping signals
		ping_io: inout std_logic;  	--tristate option usage
		echo_length : out std_logic_vector(15 downto 0);
		ping_enable: in std_logic;
		echo_done_out: out std_logic;
		state_debug: out std_logic_vector(2 downto 0);
		timeout: out std_logic;
		busy : out std_logic 
);
end ping_sensor ;

architecture Behavioral of ping_sensor is
	type state_type is (idle, trigger_on, trigger_off, echo_wait, echo_cnt, echo_wait_low, wait_next); --,wait_sample_period);
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
	signal timeout_q : std_logic ;
	--usec counter signals
	signal end_usec, load_usec_counter : std_logic ;
	signal usec_counter : std_logic_vector(31 downto 0);
		
	--IF USING TRISTATE VALUES
	signal echo_in, trigger_out: std_logic;
	
	signal trigger_out_temp: std_logic;
	
	signal echo_in_r: std_logic;
	signal echo_in_debounced: std_logic_vector(7 downto 0);
	
	
	
begin	


--tristate option
with state_reg select
	ping_io <= '1' when trigger_on,
				  'Z' when echo_wait,
				  'Z' when echo_cnt,
				  'Z' when echo_wait_low,
				  '0' when others ;
with state_reg select
	echo_in <= ping_io when echo_wait,
				  ping_io when echo_cnt,
				  '0' when others ;

-- input latch
process(clk, reset)
begin
	if reset = '1' then
		echo_in_r <= '0';
		echo_in_debounced <= (others => '0');
	elsif clk'event and clk = '1' then
		echo_in_debounced(echo_in_debounced'high downto 1) <=  echo_in_debounced((echo_in_debounced'high-1) downto 0);
		echo_in_debounced(0) <= echo_in ;
		if echo_in_debounced = 0 then 
			echo_in_r <= '0' ;
		elsif echo_in_debounced = X"FF" then
			echo_in_r <= '1';
		end if ;
	end if;
end process ;


--state register
process(clk, reset)
begin
	if reset = '1' then
		state_reg <= idle;
	elsif clk'event and clk = '1' then
		state_reg <= state_next;
	end if;
end process ;

process(state_reg, ping_enable, echo_in_r,cnt_us_r, end_usec, timeout_q)
begin
	state_next <= state_reg;
	case state_reg is 		
		when idle => 
			if (ping_enable = '1') then	--start trigger sequence
				state_next <= trigger_on;	
			end if;		
		when trigger_on =>
			if (cnt_us_r >= VAL_10US and end_usec = '1') then
				state_next <= trigger_off;
			end if;	
		when trigger_off =>
			if (cnt_us_r >= VAL_10US and end_usec = '1') then
				state_next <= echo_wait;
			end if;		
		when echo_wait =>	--wait for echo to go high
			if (echo_in_r = '1' and end_usec = '1') then		--echo went high
				state_next <= echo_cnt;	
			elsif timeout_q = '1' then
				state_next <= wait_next;
			end if;	
			
		when echo_cnt =>					--cnt length of echo pulse
			if (echo_in_r = '0' and end_usec = '1') then		--ECHO received - DONE!
				state_next <= wait_next;
			elsif  timeout_q = '1' then	--check to see if the timeout
				state_next <= echo_wait_low;
			end if;				

		when echo_wait_low	=>	--this will wait to ensure echo has gone low, sr04 will timeout @200ms with echo high
			if(echo_in_r = '0' and end_usec = '1') then
				state_next <= wait_next;
			end if;
		when	wait_next	=>	-- wait end of timeout to start next measurement
			if (cnt_us_r >= VAL_WAIT_NEXT_PING and end_usec = '1') then  --putting lower values here throws wrencn in the works
				state_next  <= idle;
			end if;	
	end case;
end process;


 with state_reg select
 state_debug <= "000" when idle,
					 "001" when trigger_on,
					 "010" when trigger_off,
					 "011" when echo_wait,
					 "100" when echo_cnt,
					 "101" when echo_wait_low,
					 "110" when others ;


cnt_us_rst <= '1' when state_reg = idle else
				  '1' when state_next /= state_reg else
				  '0';
			
					 
echo_done <= '1' when state_reg = echo_cnt and echo_in_r = '0' else	
				'0' ;
				 
timeout_q <= '1' when state_reg = echo_wait and cnt_us_r >= TIMEOUT_VAL else	
			  '1' when state_reg = echo_cnt and cnt_us_r >= TIMEOUT_VAL else
			  '0' ;
timeout <= timeout_q ;
			  
busy <= '0' when state_reg = idle and ping_enable = '0' else
			'1' ;

-- usec  counter 
process(clk, reset)
begin
	if reset = '1' then
		cnt_us_r <= (others => '0');
	elsif clk'event and clk = '1' then
		if cnt_us_rst = '1' then		
			cnt_us_r  <= (others => '0');
		elsif end_usec = '1' then
			cnt_us_r  <= cnt_us_r  + 1 ;
		end if ;
	end if ;
end process ;

-- main clock divider to generate usec period
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


