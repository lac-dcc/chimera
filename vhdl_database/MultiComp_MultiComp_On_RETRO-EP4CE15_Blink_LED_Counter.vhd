----------------------------------------------------
-- VHDL code for n-bit counter (ESD figure 2.6)
-- by Weijun Zhang, 04/2001
--
-- this is the behavior description of n-bit counter
-- another way can be used is FSM model. 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counter is

generic(n: natural :=28);
port(	
	clock:	in std_logic;
	clear:	in std_logic;
	count:	in std_logic;
	Q:	out std_logic_vector(n-1 downto 0)
);
end counter;

----------------------------------------------------

architecture behv of counter is		 	  
	
    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the counter

    process(clock, count, clear)
    begin
	if clear = '1' then
 	    Pre_Q <= Pre_Q - Pre_Q;
	elsif (clock='1' and clock'event) then
	    if count = '1' then
		Pre_Q <= Pre_Q + 1;
	    end if;
	end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;

end behv;

-----------------------------------------------------

-- Finite State Machine

-----------------------------------------------------
-- VHDL FSM (Finite State Machine) modeling
-- (ESD book Figure 2.7)
-- by Weijun Zhang, 04/2001
--
-- FSM model consists of two concurrent processes
-- state_reg and comb_logic
-- we use case statement to describe the state 
-- transistion. All the inputs and signals are
-- put into the process sensitive list.  
-----------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;

-----------------------------------------------------

entity seq_design is
port(	a:		in std_logic;
	clock:		in std_logic;
	reset:		in std_logic;
	x:		out std_logic
);
end seq_design;

-----------------------------------------------------

architecture FSM of seq_design is

    -- define the states of FSM model

    type state_type is (S0, S1, S2, S3);
    signal next_state, current_state: state_type;

begin
    
    -- cocurrent process#1: state registers
    state_reg: process(clock, reset)
    begin

	if (reset='1') then
            current_state <= S0;
	elsif (clock'event and clock='1') then
	    current_state <= next_state;
	end if;

    end process;						  

    -- cocurrent process#2: combinational logic
    comb_logic: process(current_state, a)
    begin

	-- use case statement to show the 
	-- state transistion

	case current_state is

	    when S0 =>	x <= '0';
			if a='0' then
			    next_state <= S0;
			elsif a ='1' then
			    next_state <= S1;
			end if;

	    when S1 =>	x <= '0';
			if a='0' then 
			    next_state <= S1;
			elsif a='1' then 
			    next_state <= S2;
			end if;

	    when S2 =>	x <= '0';
			if a='0' then
			    next_state <= S2;
			elsif a='1' then
			    next_state <= S3;
			end if;

	    when S3 =>	x <= '1';
			if a='0' then 
			    next_state <= S3;
			elsif a='1' then 
			    next_state <= S0;
			end if;

	    when others =>
			x <= '0';
			next_state <= S0;

	end case;

    end process;

end FSM;

-----------------------------------------------------