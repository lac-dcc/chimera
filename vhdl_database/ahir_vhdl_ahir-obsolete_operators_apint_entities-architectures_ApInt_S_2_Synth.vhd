library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
use ahir.Components.all;

entity ApInt_S_2_Synth is
   generic (num_req: integer := 5; data_width: integer := 32);
   port (x, y: in ApIntArray(num_req-1 downto 0, data_width-1 downto 0);
	 clk, reset: in std_logic;
	 reqR, reqC: in BooleanArray(num_req-1 downto 0);
	ack R, ackC: out BooleanArray(num_req-1 downto 0);
	 z : out ApIntArray(num_req-1 downto 0, data_width-1 downto 0));
end ApInt_S_2_Synth;

architecture Behave of ApInt_S_2_Synth is
    constant def_colouring: NaturalArray(num_req-1 downto 0) := (0 => 0, others => 1);
begin

     --------------------------------------------------------------------------
     -- component instantiations
     --------------------------------------------------------------------------
     op2: ApInt_S_2
       generic map (colouring   => def_colouring)
       port map (
         reqR => reqL,
	 ackR => ackL,
	 reqC => reqR,
 	 ackC => ackR,
	 x => x,
	 y => y,
	 z => z,
	 clk => clock,
	 reset => reset);
end Behave;

configuration ApIntAdd_Synth of ApInt_S_2_Synth is

  for Behave
    for op2 : ApInt_S_2
      use configuration ahir.ApIntAdd;
    end for;
  end for;

end ApIntAdd_Synth;
