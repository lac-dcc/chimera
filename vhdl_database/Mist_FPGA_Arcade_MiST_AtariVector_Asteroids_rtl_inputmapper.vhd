library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.pace_pkg.all;

entity inputmapper is
	generic
	(
    NUM_DIPS    : integer := 8;
		NUM_INPUTS  : integer := 2
	);
	port
	(
    clk       : in     std_logic;
    rst_n     : in     std_logic;

    -- inputs from keyboard controller
    reset     : in     std_logic;
    key_down  : in     std_logic;
    key_up    : in     std_logic;
    data      : in     std_logic_vector(7 downto 0);
		-- JAMMA interface
		jamma			: in from_JAMMA_t;

    -- user outputs
    dips			: in		std_logic_vector(NUM_DIPS-1 downto 0);
    inputs		: out   from_MAPPED_INPUTS_t(0 to NUM_INPUTS-1)
	);
	end inputmapper;

architecture SYN of inputmapper is

begin

    latchInputs: process (clk, rst_n)
			variable jamma_v : from_MAPPED_INPUTS_t(0 to NUM_INPUTS-1);
    begin

         -- note: all inputs are active LOW
        if rst_n = '0' then
					for i in 0 to NUM_INPUTS-2 loop
						jamma_v(i).d := (others =>'1');

					end loop;
          -- special keys
          jamma_v(NUM_INPUTS-1).d := (others => '1');


        elsif rising_edge (clk) then

					-- handle JAMMA inputs
					jamma_v(0).d(0) := jamma.p(1).up;
					jamma_v(1).d(0) := jamma.p(1).up;
					jamma_v(0).d(1) := jamma.p(1).down;
					jamma_v(1).d(1) := jamma.p(1).down;
					jamma_v(0).d(2) := jamma.p(1).left;
					jamma_v(1).d(2) := jamma.p(1).left;
					jamma_v(0).d(3) := jamma.p(1).right;
					jamma_v(1).d(3) := jamma.p(1).right;
					jamma_v(0).d(4) := jamma.coin(1);
					jamma_v(0).d(5) := jamma.coin(2);
					jamma_v(0).d(7) := jamma.p(1).button(1);
					jamma_v(1).d(4) := jamma.service;
					jamma_v(1).d(5) := jamma.p(1).start;
					jamma_v(1).d(6) := jamma.p(2).start;


end if; 
    end process latchInputs;

end SYN;


