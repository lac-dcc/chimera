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
-- An IEEE-754 compliant arbitrary-precision normalizer
-- originally written by David Bishop (dbishop@vhdl.org)
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;

library ahir;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;


entity GenericFloatingPointNormalizer is
  generic (name:string; 
	   tag_width : integer := 8;
           exponent_width: integer := 11;
           fraction_width : integer := 52;
           round_style : round_type := float_round_style;  -- rounding option
           nguard       : NATURAL := float_guard_bits;  -- number of guard bits
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
  port(
    fract  :in  unsigned(fraction_width+nguard+1 downto 0);
    expon  :in  signed(exponent_width+1 downto 0);
    sign   :in  std_ulogic;
    sticky :in  std_ulogic;
    tag_in :in  std_logic_vector(tag_width-1 downto 0);
    tag_out:out std_logic_vector(tag_width-1 downto 0);
    in_rdy :in  std_ulogic;
    out_rdy:out std_ulogic;
    stall  :in  std_ulogic;
    clk    :in  std_ulogic;
    reset  :in  std_ulogic;
    normalized_result :out UNRESOLVED_float (exponent_width downto -fraction_width)  -- result
   );
end entity;


architecture Simple of GenericFloatingPointNormalizer is

begin

	process(clk)
    	   variable result : UNRESOLVED_float (exponent_width downto -fraction_width);
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				out_rdy <= '0';
			elsif(stall = '0') then

				result := 
					normalize(fract,expon,sign,sticky,
					   	exponent_width, fraction_width,
						round_style, denormalize, 
						nguard);
				normalized_result <= result;

				tag_out <= tag_in;
				out_rdy <= in_rdy;
			end if;

			
		end if;
	end process;
end Simple;


-- this is the real stuff.
architecture rtl of GenericFloatingPointNormalizer is
    constant num_stages: integer := 6;
    constant operand_width: integer := fract'length;

    signal stage_full: std_logic_vector(0 to num_stages);

    type TagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
    signal stage_tags: TagArray(0 to num_stages);

    signal expon_1  : signed(exponent_width+1 downto 0);
    signal fract_1,fract_2,fract_3  :  unsigned(fraction_width+nguard+1 downto 0);
    signal round_1, zerores_1, infres_1 : BOOLEAN;
    signal round_2, zerores_2, infres_2 : BOOLEAN;

    signal shiftr_1,shiftr_2,shiftr_3     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount

    signal exp_1,exp_2,exp_3        : SIGNED (exponent_width+1 downto 0);  -- exponent

    signal sticky_1,sticky_2, sticky_3    : STD_ULOGIC;   -- versions of sticky
    signal sign_1,sign_2, sign_3    : STD_ULOGIC;   -- versions of sign

    signal result_1,result_2,result_3, result_6: 
		UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    signal exceptional_result_flag_3: std_ulogic;

    signal shift_in, shift_out : unsigned(fraction_width+nguard+1 downto 0);
    signal shift_tag_in, shift_tag_out : 
		std_logic_vector(tag_width+expon'length+normalized_result'length+4-1 downto 0);
    signal shift_amount: unsigned(Ceil_Log2(fract'length)-1 downto 0);

begin

  stage_full(0) <= in_rdy;
  out_rdy <= stage_full(num_stages);

  stage_tags(0) <= tag_in;
  tag_out <= stage_tags(num_stages);

  normalized_result <= result_6;

  -------------------------------------------------------------------------------------------------------------
  -- stage 1: left-most 1
  -------------------------------------------------------------------------------------------------------------
  -- stage 1: find leftmost 1.
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
  begin  -- function normalize
    zerores := false;
    infres  := false;
    round   := false;
    shiftr  := find_leftmost (to_01(fract), '1')     -- Find the first "1"
               - fraction_width - nguard;  -- subtract the length we want
    exp := resize (expon, exp'length) + shiftr;
    if(clk'event and clk = '1') then
	if(reset = '1') then
		stage_full(1) <= '0';
	elsif(stall = '0') then
		zerores_1 <= zerores;
		infres_1  <= infres;
		round_1   <= round;
		shiftr_1  <= shiftr;
		exp_1 <= exp;
		fract_1 <= fract;
		sticky_1 <= sticky;
		sign_1 <= sign;
		expon_1 <= expon;
		stage_full(1) <= stage_full(0);
		stage_tags(1) <= stage_tags(0);
	end if;
    end if;
  end process;

  
  -------------------------------------------------------------------------------------------------------------
  -- stage 2,3,4: merged
  -------------------------------------------------------------------------------------------------------------
  process(fract_1, zerores_1, infres_1, round_1, shiftr_1, exp_1, expon_1, stage_full(1), stage_tags(1))
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
  begin  -- function normalize
    zerores := zerores_1;
    infres  := infres_1;
    round   := round_1;
    shiftr  := shiftr_1;
    exp     := exp_1;

    if (or_reduce (fract_1) = '0') then   -- Zero
      zerores := true;
    elsif ((exp <= -resize(expon_base, exp'length)-1) and denormalize)
      or ((exp < -resize(expon_base, exp'length)-1) and not denormalize) then
      if (exp >= -resize(expon_base, exp'length)-fraction_width-1)
        and denormalize then
        exp    := -resize(expon_base, exp'length)-1;
        shiftr := -to_integer (expon_1 + expon_base);  -- new shift
      else                              -- return zero
        zerores := true;
      end if;
    elsif (exp > expon_base-1) then     -- infinity
      infres := true;
    end if;

    -- pass it to the next stage, combinationally..
    zerores_2 <= zerores;
    infres_2 <= infres;
    round_2 <= round;
    shiftr_2 <= shiftr;
    exp_2 <= exp;
    fract_2 <= fract_1;
    sticky_2 <= sticky_1;
    sign_2 <= sign_1;
    stage_full(2) <= stage_full(1);
    stage_tags(2) <= stage_tags(1);
  end process;

  -- stage 3: exceptional cases
  process(zerores_2, infres_2, round_2, shiftr_2, exp_2, fract_2, sticky_2, stage_full(2), stage_tags(2))
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
    variable exceptional_result_flag: std_ulogic;
  begin  -- function normalize
    zerores := zerores_2;
    infres  := infres_2;
    round   := round_2;
    shiftr  := shiftr_2;
    exp     := exp_2;
    exceptional_result_flag := '0';
    result := (others => '0');

    if zerores then
      exceptional_result_flag := '1';
      result := zerofp (fraction_width => fraction_width,
                        exponent_width => exponent_width);
    elsif infres then
      exceptional_result_flag := '1';
      result := pos_inffp (fraction_width => fraction_width,
                           exponent_width => exponent_width);
    end if;
  
    fract_3 <= fract_2;	
    sticky_3 <= sticky_2;
    shiftr_3 <= shiftr;
    exp_3 <= exp;
    exceptional_result_flag_3 <= exceptional_result_flag;
    result_3 <= result;
    sign_3 <= sign_2;
    stage_full(3) <= stage_full(2);
    stage_tags(3) <= stage_tags(2);
  end process;

  
  -- stage 4:  prepare data for shifter.
  process(fract_3, sticky_3, shiftr_3, exp_3, exceptional_result_flag_3, result_3, sign_3, stage_full(3), stage_tags(3))
        variable reverse_flag, stickyx: std_ulogic;
        variable shiftu: unsigned(Ceil_Log2(fract'length)-1 downto 0);
        variable tmp: natural;
  begin 
   -- some variables depend on shift_3.
   if(shiftr_3 <= 0) then
	reverse_flag := '1';
        tmp := - shiftr_3;
	shiftu := to_unsigned(tmp,shiftu'length);
	stickyx := sticky_3;
   else 
        reverse_flag := '0';
	tmp := shiftr_3;
	shiftu := to_unsigned(tmp, shiftu'length);
	stickyx := sticky_3 or smallfract(fract_3, shiftr_3-1);
   end if;
    
    --- break 3 -----
   if(shiftr_3 <= 0) then
	shift_in <= reverse(fract_3);
   else
	shift_in <= fract_3;
   end if;
  
   shift_amount <= shiftu;

   shift_tag_in(shift_tag_in'high downto 4) <= std_logic_vector(stage_tags(3)) & 
			std_logic_vector(exp_3) & Float_To_SLV(result_3);
   shift_tag_in(3) <=  sign_3;
   shift_tag_in(2) <=  exceptional_result_flag_3;
   shift_tag_in(1) <=  reverse_flag;
   shift_tag_in(0) <=  stickyx;
   stage_full(4) <= stage_full(3);
   stage_tags(4) <= stage_tags(3);
  end process;
  
  ----------------------------------------------------------------------------------------------------------------
  -- stage 5: shifter:  sfract := fract srl shiftr;   
  ----------------------------------------------------------------------------------------------------------------
  us: UnsignedShifter generic map(name=> name & "-us", shift_right_flag => true,
					tag_width => shift_tag_in'length,
					operand_width => shift_in'length,
					shift_amount_width => shift_amount'length)
		port map(L => shift_in, R => shift_amount, RESULT => shift_out,
				clk => clk, reset => reset,
				in_rdy => stage_full(4),
				out_rdy => stage_full(5),
				stall => stall,
				tag_in => shift_tag_in,
				tag_out => shift_tag_out);


  ----------------------------------------------------------------------------------------------------------------
  -- stage 6: round.
  ----------------------------------------------------------------------------------------------------------------
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result_exceptional   : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
    variable exceptional_result_flag, reverse_flag: std_ulogic;
    variable shiftu : unsigned(Ceil_Log2(fract'length)-1 downto 0);
    variable signx: std_ulogic;
  begin  -- function normalize
    exp   := signed(shift_tag_out((shift_tag_out'high - tag_width) downto 
		(shift_tag_out'high - (tag_width+exp'length-1))));	
    result_exceptional := to_float(shift_tag_out((shift_tag_out'high - 
					(tag_width + exp'length)) downto 
				(shift_tag_out'high - (tag_width+exp'length+result'length-1))),
				exponent_width, fraction_width);	
    signx := shift_tag_out(3);
    exceptional_result_flag := shift_tag_out(2);
    reverse_flag := shift_tag_out(1);
    stickyx := shift_tag_out(0);
    result := (others => '0');
    rfract := (others => '0');

    if reverse_flag = '0' then
        sfract := shift_out;
    else
    	sfract := reverse(shift_out);
    end if;

    if nguard > 0 then
      round := check_round (
        fract_in    => sfract (nguard),
        sign        => signx,
        remainder   => sfract(nguard-1 downto 0),
        sticky      => stickyx,
        round_style => round_style);
    end if;
    if round then
      fp_round(fract_in  => sfract (fraction_width-1+nguard downto nguard),
               expon_in  => exp(rexp'range),
               fract_out => rfract,
               expon_out => rexp);
    else
      rfract := sfract (fraction_width-1+nguard downto nguard);
      rexp   := exp(rexp'range);
    end if;
      --- break 5 ----
      -- result
    rexpon := UNSIGNED (rexp(exponent_width-1 downto 0));
    rexpon (exponent_width-1)          := not rexpon(exponent_width-1);
    result (rexpon'range)              := UNRESOLVED_float(rexpon);
    result (-1 downto -fraction_width) := UNRESOLVED_float(rfract);

    result (exponent_width) := signx;    -- sign BIT

    if(clk'event and clk = '1') then
	if(reset = '1') then
		stage_full(6) <= '0';
	elsif (stall = '0') then
		if(exceptional_result_flag = '0') then
			result_6 <= result;
		else
			result_6 <= result_exceptional;
		end if;
		stage_full(6) <= stage_full(5);
		stage_tags(6) <= shift_tag_out(shift_tag_out'high downto 
					(shift_tag_out'high - (tag_width-1)));
	end if;
    end if;
  end process;

end rtl;


