------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitGuardInterface is
	generic (name: string; nreqs: integer; buffering:IntegerArray; use_guards: BooleanArray; 
			sample_only: Boolean; update_only: Boolean);
	port (sr_in: in BooleanArray(nreqs-1 downto 0);
	      sa_out: out BooleanArray(nreqs-1 downto 0); 
	      sr_out: out BooleanArray(nreqs-1 downto 0);
	      sa_in: in BooleanArray(nreqs-1 downto 0); 
	      cr_in: in BooleanArray(nreqs-1 downto 0);
	      ca_out: out BooleanArray(nreqs-1 downto 0); 
	      cr_out: out BooleanArray(nreqs-1 downto 0);
	      ca_in: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of SplitGuardInterface is
	constant gFlags: BooleanArray(nreqs-1 downto 0) := use_guards;
	constant gBufs: IntegerArray(nreqs-1 downto 0) := buffering;
begin
	BaseGen: for I in nreqs-1 downto 0 generate

	     gCase: if gFlags(I) generate
		SampleOnly: if sample_only generate
		   sgis: SplitSampleGuardInterfaceBase
			generic map (name => name & "-gCase-SampleOnly-sgis-" & Convert_To_String(I), buffering => gBufs(I))
			port map(sr_in => sr_in(I),
				 sr_out => sr_out(I),
				 sa_in => sa_in(I),
				 sa_out => sa_out(I),
				 cr_in => cr_in(I),
				 cr_out => cr_out(I),
				 ca_in => ca_in(I),
				 ca_out => ca_out(I),
				 guard_interface => guards(I),
				 clk => clk, reset => reset);
		end generate SampleOnly;

		UpdateOnly: if update_only generate
		   sgiu: SplitUpdateGuardInterfaceBase
			generic map (name => name & "-gCase-UpdateOnly-sgiu-" & Convert_To_String(I), buffering => gBufs(I))
			port map(sr_in => sr_in(I),
				 sr_out => sr_out(I),
				 sa_in => sa_in(I),
				 sa_out => sa_out(I),
				 cr_in => cr_in(I),
				 cr_out => cr_out(I),
				 ca_in => ca_in(I),
				 ca_out => ca_out(I),
				 guard_interface => guards(I),
				 clk => clk, reset => reset);
		end generate UpdateOnly;

		SampleAndUpdate: if (not (sample_only or update_only)) generate
		   sgi: SplitGuardInterfaceBase
			generic map (name => name & "-gCase-SampleAndUpdate-sgiu-" & Convert_To_String(I), buffering => gBufs(I))
			port map(sr_in => sr_in(I),
				 sr_out => sr_out(I),
				 sa_in => sa_in(I),
				 sa_out => sa_out(I),
				 cr_in => cr_in(I),
				 cr_out => cr_out(I),
				 ca_in => ca_in(I),
				 ca_out => ca_out(I),
				 guard_interface => guards(I),
				 clk => clk, reset => reset);
		end generate SampleAndUpdate;

              end generate gCase;
	   
 	      noG: if not gFlags(I) generate
		 sr_out(I) <= sr_in(I);
		 sa_out(I) <= sa_in(I);
		 cr_out(I) <= cr_in(I);
		 ca_out(I) <= ca_in(I);
              end generate noG;
        end generate;

end Behave;
