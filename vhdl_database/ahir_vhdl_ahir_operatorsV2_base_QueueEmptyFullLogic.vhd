library ieee;
use ieee.std_logic_1164.all;

entity QueueEmptyFullLogic is
	port (clk, reset: in std_logic;
		read,write,eq_flag: in boolean;
		full, empty: out boolean);
end entity;

architecture FSM of QueueEmptyFullLogic is

    type QFsmState is (EMPTYSTATE, INBETWEENSTATE, FULLSTATE);
    signal fsm_state: QFsmState;

begin
    
    process(clk, reset, fsm_state, read, write, eq_flag)
	variable ptrs_equal: boolean;
	variable next_fsm_state : QFsmState;
	variable full_var, empty_var: boolean;
    begin
	ptrs_equal := eq_flag;
	next_fsm_state := fsm_state;
	full_var := false;
	empty_var := false;
	case fsm_state is
		when EMPTYSTATE =>
			empty_var := true;
			if(write and (not read)) then
				next_fsm_state := INBETWEENSTATE;
			end if;
		when INBETWEENSTATE =>
			if(read and (not write) and
					ptrs_equal) then
				next_fsm_state := EMPTYSTATE;
			elsif ((not read) and write and
					ptrs_equal) then
				next_fsm_state := FULLSTATE;
			end if;
		when FULLSTATE => 
			full_var := true;
			if(read and (not write)) then
				next_fsm_state := INBETWEENSTATE;
			end if;
	end case;

	full <= full_var;
	empty <= empty_var;
			
			
 	if(clk'event and clk ='1') then
		if(reset = '1') then
			fsm_state <= EMPTYSTATE;
		else
			fsm_state <= next_fsm_state;
		end if;
	end if;

    end process;
end architecture FSM;
