--  statmach.vhd
--  VHDL code created by Xilinx's StateCAD 5.03
--  Fri Mar 02 10:41:39 2007

--  This VHDL code (for use with Xilinx XST) was generated using: 
--  binary encoded state assignment with structured code format.
--  Minimization is disabled,  implied else is enabled, 
--  and outputs are manually optimized.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY statmach IS
	PORT (clk,dcm_lock,lap_load,mode_in,reset,strtstop: IN std_logic;
		clken,lap_trigger,load,mode,rst : OUT std_logic);
END;

ARCHITECTURE behavior OF statmach IS
	SIGNAL sreg : std_logic_vector (3 DOWNTO 0);
	SIGNAL next_sreg : std_logic_vector (3 DOWNTO 0);
	CONSTANT clear : std_logic_vector (3 DOWNTO 0) :="0000";
	CONSTANT clock_init : std_logic_vector (3 DOWNTO 0) :="0001";
	CONSTANT clock_run : std_logic_vector (3 DOWNTO 0) :="0010";
	CONSTANT clock_start : std_logic_vector (3 DOWNTO 0) :="0011";
	CONSTANT clock_stop : std_logic_vector (3 DOWNTO 0) :="0100";
	CONSTANT load_state : std_logic_vector (3 DOWNTO 0) :="0101";
	CONSTANT load_wait : std_logic_vector (3 DOWNTO 0) :="0110";
	CONSTANT timer : std_logic_vector (3 DOWNTO 0) :="0111";
	CONSTANT timer_init : std_logic_vector (3 DOWNTO 0) :="1000";
	CONSTANT timer_run : std_logic_vector (3 DOWNTO 0) :="1001";
	CONSTANT timer_start : std_logic_vector (3 DOWNTO 0) :="1010";
	CONSTANT timer_stop : std_logic_vector (3 DOWNTO 0) :="1011";
	CONSTANT zero : std_logic_vector (3 DOWNTO 0) :="1100";

	SIGNAL sreg1 : std_logic_vector (1 DOWNTO 0);
	SIGNAL next_sreg1 : std_logic_vector (1 DOWNTO 0);
	CONSTANT end_trigger : std_logic_vector (1 DOWNTO 0) :="00";
	CONSTANT lap_wait : std_logic_vector (1 DOWNTO 0) :="01";
	CONSTANT trigger : std_logic_vector (1 DOWNTO 0) :="10";

	SIGNAL next_clken,next_lap_trigger,next_rst : std_logic;

	SIGNAL state_reset: std_logic;
BEGIN
	PROCESS (clk, state_reset, next_sreg, next_clken, next_rst)
	BEGIN
		IF ( state_reset='1' ) THEN
			sreg <= clear;
			clken <= '0';
			rst <= '1';
		ELSIF clk='1' AND clk'event THEN
			sreg <= next_sreg;
			clken <= next_clken;
			rst <= next_rst;
		END IF;
	END PROCESS;

	PROCESS (clk, next_sreg1, next_lap_trigger)
	BEGIN
		IF clk='1' AND clk'event THEN
			sreg1 <= next_sreg1;
			lap_trigger <= next_lap_trigger;
		END IF;
	END PROCESS;

	PROCESS (sreg,sreg1,lap_load,mode_in,state_reset,strtstop)
	BEGIN
		next_clken <= '0'; next_lap_trigger <= '0'; load <= '0'; mode <= '0'; 
			next_rst <= '0'; 

		next_sreg<=clear;
		next_sreg1<=end_trigger;

		CASE sreg IS
			WHEN clear =>
				mode<='0';
				load<='0';
				IF  TRUE THEN
					next_sreg<=zero;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=clear;
					next_clken<='0';
					next_rst<='1';
				END IF;
			WHEN clock_init =>
				mode<='1';
				load<='0';
				IF  NOT ( (( strtstop='1' ) ) OR  (( mode_in='1' ) AND ( strtstop='0' ) )
					 ) THEN
					next_sreg<=clock_init;
					next_rst<='0';
					next_clken<='0';
				END IF;
				IF ( strtstop='1' ) THEN
					next_sreg<=clock_start;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( mode_in='1' ) AND ( strtstop='0' ) THEN
					next_sreg<=timer;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN clock_run =>
				mode<='1';
				load<='0';
				IF  NOT ( (( strtstop='0' ) ) OR  (( strtstop='1' ) ) ) THEN
					next_sreg<=clock_run;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( strtstop='0' ) THEN
					next_sreg<=clock_run;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( strtstop='1' ) THEN
					next_sreg<=clock_stop;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN clock_start =>
				mode<='1';
				load<='0';
				IF  NOT ( (( strtstop='1' ) ) OR  (( strtstop='0' ) ) ) THEN
					next_sreg<=clock_start;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( strtstop='1' ) THEN
					next_sreg<=clock_start;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( strtstop='0' ) THEN
					next_sreg<=clock_run;
					next_rst<='0';
					next_clken<='1';
				END IF;
			WHEN clock_stop =>
				mode<='1';
				load<='0';
				IF ( strtstop='0' ) THEN
					next_sreg<=clock_init;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=clock_stop;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN load_state =>
				mode<='0';
				load<='1';
				IF  TRUE THEN
					next_sreg<=load_wait;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=load_state;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN load_wait =>
				mode<='0';
				load<='0';
				IF ( lap_load='0' ) THEN
					next_sreg<=timer_init;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=load_wait;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN timer =>
				mode<='0';
				load<='0';
				IF ( mode_in='0' ) THEN
					next_sreg<=timer_init;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=timer;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN timer_init =>
				mode<='0';
				load<='0';
				IF  NOT ( (( strtstop='1' ) AND ( lap_load='0' ) ) OR  (( lap_load='1' ) 
					) OR  (( mode_in='1' ) AND ( lap_load='0' ) AND ( strtstop='0' ) ) ) THEN
					next_sreg<=timer_init;
					next_rst<='0';
					next_clken<='0';
				END IF;
				IF ( strtstop='1' ) AND ( lap_load='0' ) THEN
					next_sreg<=timer_start;
					next_rst<='0';
					next_clken<='1';
				END IF;
				IF ( lap_load='1' ) THEN
					next_sreg<=load_state;
					next_rst<='0';
					next_clken<='0';
				END IF;
				IF ( mode_in='1' ) AND ( lap_load='0' ) AND ( strtstop='0' ) THEN
					next_sreg<=zero;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN timer_run =>
				mode<='0';
				load<='0';
				IF ( strtstop='1' ) THEN
					next_sreg<=timer_stop;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=timer_run;
					next_rst<='0';
					next_clken<='1';
				END IF;
			WHEN timer_start =>
				mode<='0';
				load<='0';
				IF ( strtstop='0' ) THEN
					next_sreg<=timer_run;
					next_rst<='0';
					next_clken<='1';
				 ELSE
					next_sreg<=timer_start;
					next_rst<='0';
					next_clken<='1';
				END IF;
			WHEN timer_stop =>
				mode<='0';
				load<='0';
				IF ( strtstop='0' ) THEN
					next_sreg<=timer_init;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=timer_stop;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN zero =>
				mode<='1';
				load<='0';
				IF ( mode_in='0' ) THEN
					next_sreg<=clock_init;
					next_rst<='0';
					next_clken<='0';
				 ELSE
					next_sreg<=zero;
					next_rst<='0';
					next_clken<='0';
				END IF;
			WHEN OTHERS =>
		END CASE;

		IF ( state_reset='1' ) THEN
			next_sreg1<=lap_wait;
			next_lap_trigger<='0';
		ELSE
			CASE sreg1 IS
				WHEN end_trigger =>
					IF ( lap_load='0' ) THEN
						next_sreg1<=lap_wait;
						next_lap_trigger<='0';
					 ELSE
						next_sreg1<=end_trigger;
						next_lap_trigger<='0';
					END IF;
				WHEN lap_wait =>
					IF ( lap_load='1' ) THEN
						next_sreg1<=trigger;
						next_lap_trigger<='1';
					 ELSE
						next_sreg1<=lap_wait;
						next_lap_trigger<='0';
					END IF;
				WHEN trigger =>
					IF  TRUE THEN
						next_sreg1<=end_trigger;
						next_lap_trigger<='0';
					 ELSE
						next_sreg1<=trigger;
						next_lap_trigger<='1';
					END IF;
				WHEN OTHERS =>
			END CASE;
		END IF;
	END PROCESS;

	PROCESS (dcm_lock,reset)
	BEGIN
		IF ( NOT (( dcm_lock='1' ) ) AND ( reset='1' )) THEN state_reset<='1';
		ELSE state_reset<='0';
		END IF;
	END PROCESS;
END behavior;
