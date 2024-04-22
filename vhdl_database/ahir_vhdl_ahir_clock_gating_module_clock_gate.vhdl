library std;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

entity module_clock_gate is
	port (reset, start_req, 
		start_ack, fin_req, fin_ack, clock_in: in std_logic;
		clock_out : out std_logic);
end entity module_clock_gate;

architecture behavioural of module_clock_gate is
	signal clock_enable_raw, clock_enable: std_logic;
	type FsmState is (RESET_STATE, IDLE, STARTED, WORKING);
	signal fsm_state: FsmState;
	signal job_counter: integer;
begin

       -------------------------------------------------------------------
       -- clock enabler.
       -------------------------------------------------------------------
       cgInst: clock_gater
			port map (clock_in => clock_in,
					clock_enable => clock_enable_raw,
					clock_out => clock_out);
	-------------------------------------------------------
	-- FSM.  If there is something going on inside, enable
	-- the clock...
	-------------------------------------------------------
	process(clock_in, reset, start_req, start_ack, fin_req, fin_ack)

		variable next_fsm_state_var: FsmState;
		variable incr_counter_var, decr_counter_var: boolean;
		variable clock_enable_raw_var: std_logic;

	begin
		next_fsm_state_var := fsm_state;
		incr_counter_var := false;
		decr_counter_var := false;
		clock_enable_raw_var := '0';

		case fsm_state is 
			when RESET_STATE =>
				--
				-- enable in reset state to ensure that
				-- reset gets applied correctly....
				--
				clock_enable_raw_var := '1';
				if(reset = '0') then 
					next_fsm_state_var := IDLE;
				end if;
			when IDLE => 
				if(start_req = '1') then
					clock_enable_raw_var := '1';

					if(start_ack = '1') then
						incr_counter_var := true;
						next_fsm_state_var := 	WORKING;
					else
						next_fsm_state_var := STARTED;
					end if;
				end if;
			when STARTED =>

				clock_enable_raw_var := '1';
				if(start_ack = '1') then
					incr_counter_var := true;
					next_fsm_state_var := WORKING;
				end if;

			when WORKING =>
				clock_enable_raw_var := '1';
				incr_counter_var := ((start_req = '1') and (start_ack = '1'));
				decr_counter_var := ((fin_req = '1') and (fin_ack = '1'));
				if((job_counter = 0) and (start_req = '0')) then
					next_fsm_state_var := IDLE;
				end if;
		end case;

		clock_enable_raw <= clock_enable_raw_var;
		if (clock_in'event and (clock_in = '1')) then
			if(reset = '1') then
				fsm_state <= RESET_STATE;
				job_counter <= 0;
			else
				fsm_state <= next_fsm_state_var;
				if(incr_counter_var and (not decr_counter_var)) then
					job_counter <= job_counter + 1;
				elsif ((not incr_counter_var) and decr_counter_var) then
					job_counter <= job_counter - 1;
				end if;
			end if;
		end if;
	end process;
	
end behavioural;
