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
-------------------------------------------------------------------------------
-- An IEEE-754 compliant arbitrary-precision pipelined float-to-float
-- converter which is basically, a pipelined version of the resize function
-- described in the ahir_ieee_proposed VHDL library float_pkg_c.vhd
-- originally written by David Bishop (dbishop@vhdl.org)
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir_ieee_proposed;
use ahir_ieee_proposed.float_pkg.all;
use ahir_ieee_proposed.math_utility_pkg.all;

library ahir;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity GenericFloatToFloat is
  generic (name: string; 
	   tag_width : integer := 8;
           in_exponent_width: integer := 11;
           in_fraction_width : integer := 52;
           out_exponent_width: integer := 8;
           out_fraction_width : integer := 23;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize_in : BOOLEAN := float_denormalize;  -- Use IEEE extended FP           
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
  port(
    INF: in std_logic_vector((in_exponent_width+in_fraction_width) downto 0);
    OUTF: out std_logic_vector((out_exponent_width+out_fraction_width) downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    f2fi_rdy, f2fo_rdy: out std_logic);
end entity;

-- works, also when synthesized by xst 10.1.  xst 9.2is seems
-- to produce incorrect circuits.
architecture rtl of GenericFloatToFloat is
        signal stage_full: std_logic_vector(1 to 2);
	signal pipeline_stall: std_logic;
	signal in_arg  : UNRESOLVED_float (in_exponent_width downto -in_fraction_width);

	signal sign_sig: std_logic;
    	signal expon_in_sig          : SIGNED (in_exponent_width-1 downto 0);
    	signal fract_in_sig          : UNSIGNED (in_fraction_width downto 0);
    	signal expon_out_sig         : SIGNED (out_exponent_width-1 downto 0);  -- output fract
    	signal fract_out_sig         : UNSIGNED (out_fraction_width downto 0);  -- output fract

	signal normalizer_result_out : std_logic_vector(OUTF'length-1 downto 0);
	signal normalizer_tag_in, normalizer_tag_out: std_logic_vector((tag_width + OUTF'length) downto 0);
begin

	in_arg <= to_float (INF, in_exponent_width, in_fraction_width);

	pipeline_stall <= stage_full(2) and (not accept_rdy);
	f2fo_rdy <= stage_full(2);
	f2fi_rdy <=  not pipeline_stall;

	-- stage 1 upto normalizer..
	process(clk, reset, pipeline_stall, stage_full, fract_in_sig)
    		variable result            : UNRESOLVED_float (out_exponent_width downto -out_fraction_width);
                                        -- result value
    		variable fptype            : valid_fpstate;
    		variable expon_in          : SIGNED (in_exponent_width-1 downto 0);
    		variable fract_in          : UNSIGNED (in_fraction_width downto 0);
    		variable round             : BOOLEAN;
    		variable expon_out         : SIGNED (out_exponent_width-1 downto 0);  -- output fract
    		variable fract_out         : UNSIGNED (out_fraction_width downto 0);  -- output fract
    		variable nguard            : NATURAL;
		variable use_normalizer : std_logic;
		variable fract_in_sign: std_logic;
    		constant check_error    : BOOLEAN    := float_check_error;
	begin
		result := (others => '0');
		expon_in := (others => '0');
		expon_out := (others => '0');
		fract_in := (others => '0');
		fract_out := (others => '0');
		nguard := 0;
		use_normalizer := '0';
		fract_in_sign := INF(in_exponent_width + in_fraction_width);

    		fptype := classfp(in_arg, check_error);
    		if ((fptype = pos_denormal or fptype = neg_denormal) and denormalize_in
        		and (in_exponent_width < out_exponent_width
             			or in_fraction_width < out_fraction_width))
      				or in_exponent_width > out_exponent_width
      				or in_fraction_width > out_fraction_width then
      			-- size reduction
      			classcase : case fptype is
        			when isx =>
          			  result := (others => 'X');
        			when nan | quiet_nan =>
          			  result := qnanfp (fraction_width => out_fraction_width,
                            				exponent_width => out_exponent_width);
        			when pos_inf =>
          			  result := pos_inffp (fraction_width => out_fraction_width,
                               				exponent_width => out_exponent_width);
        			when neg_inf =>
          			  result := neg_inffp (fraction_width => out_fraction_width,
                               				exponent_width => out_exponent_width);
        			when pos_zero | neg_zero =>
          			   result := zerofp (fraction_width => out_fraction_width,   -- hate -0
                            					exponent_width => out_exponent_width);
        			when others =>
          				break_number (
            					arg         => in_arg,
            					fptyp       => fptype,
            					denormalize => denormalize_in,
            					fract       => fract_in,
            					expon       => expon_in);
       					if out_fraction_width > in_fraction_width and denormalize_in then
						use_normalizer := '1';
           					-- You only get here if you have a denormal input
       						fract_out := (others => '0');              -- pad with zeros
       						fract_out (out_fraction_width downto
                       							out_fraction_width - in_fraction_width) := fract_in;
       						nguard := 0;
       					else
						use_normalizer := '1';
              					nguard := in_fraction_width - out_fraction_width;
          				end if;
      			end case classcase;
    		else                                -- size increase or the same size
      			if out_exponent_width > in_exponent_width then
        			expon_in := SIGNED(in_arg (in_exponent_width-1 downto 0));
        			if fptype = pos_zero or fptype = neg_zero then
          				result (out_exponent_width-1 downto 0) := (others => '0');
        			elsif expon_in = -1 then        -- inf or nan (shorts out check_error)
          				result (out_exponent_width-1 downto 0) := (others => '1');
        			else
          			-- invert top BIT
          				expon_in(expon_in'high)            := not expon_in(expon_in'high);
          				expon_out := resize (expon_in, expon_out'length);  -- signed expand
          			-- Flip it back.
          				expon_out(expon_out'high)          := not expon_out(expon_out'high);
          				result (out_exponent_width-1 downto 0) := UNRESOLVED_float(expon_out);
        			end if;
        			result (out_exponent_width) := in_arg (in_exponent_width);     -- sign
      			else                              -- exponent_width = in_exponent_width
        			result (out_exponent_width downto 0) := in_arg (in_exponent_width downto 0);
      			end if;
      			if out_fraction_width > in_fraction_width then
        			result (-1 downto -out_fraction_width) := (others => '0');  -- zeros
        			result (-1 downto -in_fraction_width) :=
          						in_arg (-1 downto -in_fraction_width);
      			else                              -- fraction_width = in_fraciton_width
        			result (-1 downto -out_fraction_width) :=
          						in_arg (-1 downto -in_fraction_width);
      			end if;
    		end if;
	
		if(clk'event and clk = '1') then
			if(reset = '1') then
				stage_full(1) <= '0';
				fract_in_sig <= (others => '0');
				fract_out_sig <= (others => '0');
				expon_in_sig <= (others => '0');
				expon_out_sig <= (others => '0');
				sign_sig <= '0';
				normalizer_tag_in <= (others =>  '0');
			elsif (pipeline_stall = '0') then
				fract_in_sig <= fract_in;
				fract_out_sig <= fract_out;
				expon_in_sig <= expon_in;
				expon_out_sig <= expon_out;
				normalizer_tag_in(0) <= use_normalizer;
				normalizer_tag_in((tag_width + result'length) downto 1) <= (tag_in & to_slv(result));
				sign_sig <= fract_in_sign;
				stage_full(1) <= env_rdy;
			end if;
		end if;
	end process;


	f2D: if (out_fraction_width >= in_fraction_width) generate
	    blk: block
			signal normalizer_fract: unsigned(out_fraction_width downto 0);
	    begin
		
		process(fract_in_sig)
		begin
			normalizer_fract  <=   (others => '0');
			normalizer_fract(in_fraction_width downto 0) <= fract_in_sig;
		end process;

		process(clk,reset,  pipeline_stall,  stage_full,  normalizer_fract)
    			variable result    : UNRESOLVED_float (out_exponent_width downto -out_fraction_width);
		begin
			result :=
				normalize (fract => normalizer_fract, 
						expon => expon_in_sig,
						sign => sign_sig,
						fraction_width => out_fraction_width,
						exponent_width => out_exponent_width,
						round_style => round_style,
						denormalize => denormalize,
						nguard => 0);

			if(clk'event and clk = '1') then
				if(reset = '1') then
					stage_full(2) <= '0';
					normalizer_tag_out <= (others => '0');
				elsif (pipeline_stall = '0') then
					stage_full(2) <= stage_full(1);
					normalizer_result_out <= to_slv(result);
					normalizer_tag_out <= normalizer_tag_in;	
				end if;
			end if;
		end process;
	    end block;
        end generate f2D;

	D2f: if (out_fraction_width < in_fraction_width) generate
		process(clk, reset, pipeline_stall, fract_in_sig, expon_in_sig, sign_sig)
    			variable result    : UNRESOLVED_float (out_exponent_width downto -out_fraction_width);
		begin
			result :=
				normalize (fract => fract_in_sig, 
						expon => expon_in_sig,
						sign => sign_sig,
						fraction_width => out_fraction_width,
						exponent_width => out_exponent_width,
						round_style => round_style,
						denormalize => denormalize,
						nguard => (in_fraction_width - out_fraction_width));

			if(clk'event and clk = '1') then
				if(reset = '1') then
					stage_full(2) <= '0';
					normalizer_tag_out <= (others => '0');
				elsif (pipeline_stall = '0') then
					stage_full(2) <= stage_full(1);
					normalizer_result_out <= to_slv(result);
					normalizer_tag_out <= normalizer_tag_in;	
				end if;
			end if;
		end process;
	end generate D2f;

	-- output multiplexor.
	OUTF <= normalizer_tag_out(OUTF'length downto 1) when
			(normalizer_tag_out(0) = '0')  else  normalizer_result_out;
	tag_out <= normalizer_tag_out((tag_width + OUTF'length) downto (OUTF'length + 1));
end rtl;
