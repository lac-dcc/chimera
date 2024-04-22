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
-- An IEEE-754 compliant arbitrary-precision pipelined adder/subtractor
-- which is basically, a 3-stage pipelined version of the add function
-- described in the ieee_proposed VHDL library float_pkg_c.vhd
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


entity GenericFloatingPointAdderSubtractor is
  generic (name: string; tag_width : integer := 8;
           exponent_width: integer := 8;
           fraction_width : integer := 23;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP           
	   use_as_subtractor: BOOLEAN := false
           );
  port(
    INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
    OUTADD: out std_logic_vector((exponent_width+fraction_width) downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    addi_rdy, addo_rdy: out std_logic);
end entity;


-- architecture trivial of GenericFloatingPointAdderSubtractor is
	-- 
	-- signal stage_full, stall: std_logic;
  	-- signal lp, rp   : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input
-- begin
  -- -- construct l,r (user registers)
  -- lp <= to_float(INA, exponent_width, fraction_width);
 -- 
  -- AsAdder: if (not use_as_subtractor) generate
  	-- rp <= to_float(INB, exponent_width, fraction_width);
  -- end generate AsAdder;
-- 
  -- AsSubtractor: if (use_as_subtractor) generate
        -- process(INB)
           -- variable btmp: UNRESOLVED_float(exponent_width downto -fraction_width);
        -- begin
	   -- btmp := to_float(INB, exponent_width, fraction_width);
  	   -- rp <= - btmp;
	-- end process;
  -- end generate AsSubtractor;
-- 
  -- stall <= stage_full and (not accept_rdy);
  -- addi_rdy <= not stall;
  -- addo_rdy <= stage_full;
-- 
  -- process(clk)
  -- begin
	-- if(clk'event and clk = '1') then
		-- if(reset = '1') then
			-- stage_full <= '0';
		-- elsif stall = '0' then
			-- stage_full <= env_rdy;
		-- end if;
-- 
		-- if(stall = '0') then
			-- OUTADD <= to_slv(lp + rp);
		-- end if;
	-- end if;
  -- end process;
-- 
-- 
-- end trivial;


-- this is the pipelined version. works, and when synthesized
-- by xst 10.1 is ok.  synthesis produces incorrect circuit with
-- xst 9.2i.
architecture rtl of GenericFloatingPointAdderSubtractor is
  signal  l, r, l_1, r_1, lp, rp   : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input
  
  signal pipeline_stall : std_logic;
  signal stage_full : std_logic_vector(0 to 7);
  signal tag0, tag1, tag2, tag3, tag4, tag5, tag6, tag7: std_logic_vector(tag_width-1 downto 0);

  signal fpresult_1         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal fractl_1, fractr_1   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
  signal exponr_1, exponl_1 : SIGNED (exponent_width-1 downto 0);  -- result exponent
  signal sign_1             : STD_ULOGIC;   -- sign of the output
  signal exceptional_result_1 : std_ulogic; 
  signal shift_too_low_1, shift_too_high_1, shift_eq_zero_1, shift_lt_zero_1, shift_gt_zero_1: boolean;
  signal shiftx_1           : SIGNED (exponent_width downto 0);  -- shift fractions

  signal use_shifter_2  : std_ulogic;
  signal shifter_in_2, shifter_out   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
  signal shift_amount_2 : SIGNED (exponent_width downto 0);  -- shift fractions
  
  signal fpresult_2         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal rexpon_2           : SIGNED (exponent_width downto 0);  -- result exponent
  signal fractc_2, fracts_2 : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
  signal leftright_2 : boolean;
  signal sticky_2_vector: std_logic_vector(0 to 4);
  signal sticky_2: std_logic;
  signal exceptional_result_2 : std_ulogic; 
  signal sign_l_2, sign_r_2: std_ulogic;




  signal shifter_tag_in, shifter_tag_out: 
		std_logic_vector(tag_width + fpresult_2'length + fractc_2'length + fracts_2'length
				+ rexpon_2'length + 7 - 1 downto 0);
  signal shifter_full: std_logic;

  signal fpresult_4         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal addL_4             : UNSIGNED (fraction_width+1+addguard downto 0);
  signal addR_4             : UNSIGNED (fraction_width+1+addguard downto 0);
  signal subtract_4         : std_logic;
  signal rexpon_4           : SIGNED (exponent_width downto 0);  -- result exponent
  signal sign_4             : STD_ULOGIC;   -- sign of the output
  signal sticky_4           : STD_ULOGIC;   -- Holds precision for rounding
  signal exceptional_result_4 : std_ulogic; 

  signal ufract_5           : UNSIGNED (fraction_width+1+addguard downto 0);
  signal fpresult_5         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal adder_tag_in, adder_tag_out :
		std_logic_vector(tag_width + fpresult_4'length + rexpon_4'length + 3 - 1 downto 0);

  signal normalizer_tag_in, normalizer_tag_out: std_logic_vector(tag_width + fpresult_4'length downto 0);

  signal fpresult_6         : UNRESOLVED_float (exponent_width downto -fraction_width);

  signal fpresult_7         : std_logic_vector((exponent_width+fraction_width) downto 0);
  
  type FracMaskArray is array (natural range <> ) of unsigned(fractl_1'length-1 downto 0);
  function BuildFracMasks(width: natural) return FracMaskArray is
	variable ret_var: FracMaskArray(width-1 downto 0);
  begin
	for I in 0 to width-1 loop
		ret_var(I) := (others => '0');
		for J in 0 to I loop
			ret_var(I)(J) := '1';
		end loop;
	end loop;
	return(ret_var);
  end function BuildFracMasks;

  constant frac_masks: FracMaskArray(fractl_1'high downto fractl_1'low) := BuildFracMasks(fractl_1'length);
  constant SH: integer := frac_masks'high;
  constant SL: integer := frac_masks'low;
  function SelectFracMask(constant masks: FracMaskArray; shiftx: integer) 
	return unsigned is
	variable ret_mask: unsigned(SH downto SL);
  begin
	ret_mask := (others => '1');
	if(shiftx <= SH) then
		ret_mask := masks(shiftx);
	elsif (shiftx < 0) then
		ret_mask := (others => '0');
	end if;
	return(ret_mask);
  end function SelectFracMask;
begin

  pipeline_stall <= stage_full(7) and (not accept_rdy);
  addi_rdy <= not pipeline_stall;
  addo_rdy <= stage_full(7);
  tag_out <= tag7;

  -- construct l,r (user registers)
  lp <= to_float(INA, exponent_width, fraction_width);
 
  AsAdder: if (not use_as_subtractor) generate
  	rp <= to_float(INB, exponent_width, fraction_width);
  end generate AsAdder;

  AsSubtractor: if (use_as_subtractor) generate
        process(INB)
           variable btmp: UNRESOLVED_float(exponent_width downto -fraction_width);
        begin
	   btmp := to_float(INB, exponent_width, fraction_width);
  	   rp <= - btmp;
	end process;
  end generate AsSubtractor;

  -- return slv.
  OUTADD <= fpresult_7;

  -----------------------------------------------------------------------------
  -- Stage 0: register inputs.
  -----------------------------------------------------------------------------
  process(clk, env_rdy, pipeline_stall, reset)
    variable active_v : std_logic;
  begin
    active_v := env_rdy and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
      	stage_full(0) <= '0';
      elsif (pipeline_stall = '0') then
        stage_full(0) <= env_rdy;
      end if;

      if(active_v = '1') then
        tag0 <= tag_in;
        l <= lp;
        r <= rp;
      end if;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Stage 1: detect NaN, deNorm, align exponents.
  -----------------------------------------------------------------------------
  process(clk, l, r, reset, pipeline_stall, stage_full)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable sign             : STD_ULOGIC;   -- sign of the output
    variable leftright        : BOOLEAN;      -- left or right used
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result: std_ulogic;

    variable shift_too_low : boolean;
    variable shift_lt_zero : boolean;
    variable shift_eq_zero : boolean;
    variable shift_too_high : boolean;
    variable shift_gt_zero : boolean;

    variable sticky           : std_logic_vector(0 to 4);   -- Holds precision for rounding
  begin

    exceptional_result := '0';
    sticky := (others => '0');
    leftright := false;
    fracts := (others => '0');
    fractc := (others => '0');
    rexpon := (others => '0');
    fpresult := (others => '0');
   
    fractr := (others => '0');
    fractl := (others => '0');

    shift_too_low := false;
    shift_lt_zero := false;
    shift_eq_zero := false;
    shift_too_high := false;
    shift_gt_zero := false;
  
    exponl := (others => '0');
    exponr := (others => '0');

    shiftx := (others => '0');

    ---------------------------------------------------------------------------
    -- will need to set appropriate flags here!
    ---------------------------------------------------------------------------
    if (fraction_width = 0 or l'length < 7 or r'length < 7) then
      lfptype := isx;
    else
      lfptype := classfp (l, check_error);
      rfptype := classfp (r, check_error);
    end if;
    if (lfptype = isx or rfptype = isx) then
      fpresult := (others => 'X');
      exceptional_result := '1';
    elsif (lfptype = nan or lfptype = quiet_nan or
           rfptype = nan or rfptype = quiet_nan)
      -- Return quiet NAN, IEEE754-1985-7.1,1
      or (lfptype = pos_inf and rfptype = neg_inf)
      or (lfptype = neg_inf and rfptype = pos_inf) then
      -- Return quiet NAN, IEEE754-1985-7.1,2
      exceptional_result := '1';
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (lfptype = pos_inf or rfptype = pos_inf) then   -- x + inf = inf
      exceptional_result := '1';
      fpresult := pos_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    elsif (lfptype = neg_inf or rfptype = neg_inf) then   -- x - inf = -inf
      exceptional_result := '1';
      fpresult := neg_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    elsif (lfptype = neg_zero and rfptype = neg_zero) then   -- -0 + -0 = -0
      exceptional_result := '1';
      fpresult := neg_zerofp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    else 
      lresize := resize (arg            => to_x01(l),
                           exponent_width => exponent_width,
                           fraction_width => fraction_width,
                           denormalize_in => denormalize,
                           denormalize    => denormalize);
      lfptype := classfp (lresize, false);    -- errors already checked
      rresize := resize (arg            => to_x01(r),
                           exponent_width => exponent_width,
                           fraction_width => fraction_width,
                           denormalize_in => denormalize,
                           denormalize    => denormalize);
      rfptype := classfp (rresize, false);    -- errors already checked
      break_number (
          arg         => lresize,
          fptyp       => lfptype,
          denormalize => denormalize,
          fract       => ulfract,
          expon       => exponl);
      fractl := (others => '0');
      fractl (fraction_width+addguard downto addguard) := ulfract;
      break_number (
        arg         => rresize,
        fptyp       => rfptype,
        denormalize => denormalize,
        fract       => urfract,
        expon       => exponr);
      fractr := (others => '0');
      fractr (fraction_width+addguard downto addguard) := urfract;
  
      shiftx := (exponl(exponent_width-1) & exponl) - exponr;
  
      shift_too_low := (shiftx < -fractl'high);
      shift_lt_zero := (shiftx < 0);
      shift_eq_zero := (shiftx = 0);
      shift_too_high := (shiftx > fractl'high);
      shift_gt_zero := (shiftx > 0);
    end if;

    active_v := stage_full(0) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(1) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(1) <= stage_full(0);
      end if;

      if(active_v = '1') then
        tag1 <= tag0;
        fpresult_1 <= fpresult;
        fractr_1 <= fractr;
        fractl_1 <= fractl;
        exponr_1 <= exponr;
 	exponl_1 <= exponl;
        exceptional_result_1 <= exceptional_result;
        l_1 <= l;
        r_1 <= r;

	shift_too_low_1 <= shift_too_low;
	shift_lt_zero_1 <= shift_lt_zero;
	shift_eq_zero_1 <= shift_eq_zero;
	shift_too_high_1 <= shift_too_high;
	shift_gt_zero_1 <= shift_gt_zero;

        shiftx_1 <= shiftx;
      end if;        
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 2: detect NaN, deNorm, align exponents.
  -----------------------------------------------------------------------------
  process(clk, reset, pipeline_stall, stage_full, fpresult_1, fractr_1, exceptional_result_1, shift_too_low_1, shift_lt_zero_1, shift_eq_zero_1,
				shift_too_high_1, shift_gt_zero_1, shiftx_1, exponr_1, exponl_1)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable leftright        : BOOLEAN;      -- left or right used
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result: std_ulogic;

    -- to get stuff to the shifter.
    variable use_shifter  : std_ulogic;
    variable shifter_in   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable shift_amount : SIGNED (exponent_width downto 0);  -- shift fractions

    variable shift_too_low : boolean;
    variable shift_lt_zero : boolean;
    variable shift_eq_zero : boolean;
    variable shift_too_high : boolean;
    variable shift_gt_zero : boolean;

    variable sticky           : std_logic_vector(0 to 4);   -- Holds precision for rounding
  begin
    fpresult := fpresult_1;

    fractr   := fractr_1;
    fractl   := fractl_1;

    rexpon   := (others => '0');


    exceptional_result := exceptional_result_1;

    shift_too_low := shift_too_low_1;
    shift_lt_zero := shift_lt_zero_1;
    shift_eq_zero := shift_eq_zero_1;
    shift_too_high := shift_too_high_1;
    shift_gt_zero := shift_gt_zero_1;
     
    shiftx := shiftx_1;

    exponr   := exponr_1;
    exponl   := exponl_1;
    fractc := (others => '0');
    fracts := (others => '0');
    leftright := false;
    sticky := (others => '0');
    use_shifter := '0';

    shifter_in := (others  => '0');
    shift_amount :=  (others => '0');

    if shift_too_low then
        rexpon    := exponr(exponent_width-1) & exponr;
        fractc    := fractr;
        fracts    := (others => '0');   -- add zero
        leftright := false;
        sticky(0)    := or_reduce (fractl);
    elsif shift_lt_zero then
        shiftx    := - shiftx;

        shift_amount := shiftx;
        use_shifter := '1';
        shifter_in := fractl;

        -- fracts    := shift_right (fractl, to_integer(shiftx));
        fractc    := fractr;
        rexpon    := exponr(exponent_width-1) & exponr;
        leftright := false;
        --sticky(1)    := smallfract (fractl, to_integer(shiftx));
        sticky(1)    := OrReduce(fractl and SelectFracMask(frac_masks,to_integer(shiftx)));
    elsif shift_eq_zero then
        rexpon := exponl(exponent_width-1) & exponl;
        sticky(2) := '0';
        if fractr > fractl then
          fractc    := fractr;
          fracts    := fractl;
          leftright := false;
        else
          fractc    := fractl;
          fracts    := fractr;
          leftright := true;
        end if;
    elsif shift_too_high then
        rexpon    := exponl(exponent_width-1) & exponl;
        fracts    := (others => '0');   -- add zero
        fractc    := fractl;
        leftright := true;
        sticky(3)    := or_reduce (fractr);
    elsif shift_gt_zero then

        shift_amount := shiftx;
        use_shifter := '1';
        shifter_in := fractr;

        -- fracts    := shift_right (fractr, to_integer(shiftx));
        fractc    := fractl;
        rexpon    := exponl(exponent_width-1) & exponl;
        leftright := true;
        -- sticky(4) := smallfract (fractr, to_integer(shiftx));
        sticky(1)    := OrReduce(fractr and SelectFracMask(frac_masks,to_integer(shiftx)));
    end if;
    
    active_v := stage_full(1) and not (pipeline_stall or reset);

    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(2) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(2) <= stage_full(1);
      end if;

      if(active_v = '1') then
        tag2 <= tag1;

        fpresult_2 <= fpresult;
        fractc_2 <= fractc;
        fracts_2 <= fracts;
        rexpon_2 <= rexpon;
        leftright_2 <= leftright;
        sticky_2_vector <= sticky;
        exceptional_result_2 <= exceptional_result;
	use_shifter_2 <= use_shifter;
        sign_l_2 <= l_1(l'high);
        sign_r_2 <= r_1(r'high);


	shift_amount_2 <= shift_amount;
	shifter_in_2 <= shifter_in;

        
      end if;        
    end if;
  end process;

  sticky_2 <= OrReduce(sticky_2_vector);

  -----------------------------------------------------------------------------
  -- stage 3: shifter.
  -----------------------------------------------------------------------------
  process(tag2, fpresult_2, fractc_2, fracts_2,rexpon_2, leftright_2,
		exceptional_result_2, use_shifter_2, sign_l_2, sign_r_2, sticky_2)
  begin
        -- concatenate the tag as well!
  	shifter_tag_in(shifter_tag_in'high downto 7) <= 
		tag2 & 
		Float_To_SLV(fpresult_2) & std_logic_vector(fractc_2) &
			std_logic_vector(fracts_2) & std_logic_vector(rexpon_2);
	shifter_tag_in(6) <= '0'; -- unused.
	if(leftright_2) then
		shifter_tag_in(5) <= '1';
	else
		shifter_tag_in(5) <= '0';
	end if;
	shifter_tag_in(4) <= sticky_2;
	shifter_tag_in(3) <= exceptional_result_2;
	shifter_tag_in(2) <= sign_l_2;
	shifter_tag_in(1) <= sign_r_2;
	shifter_tag_in(0) <= use_shifter_2;
 end process;

  shifter: UnsignedShifter generic map(name => name & "-shifter", 
					shift_right_flag => true,
					tag_width => shifter_tag_in'length,
					operand_width => shifter_in_2'length,
					shift_amount_width => shift_amount_2'length)
		port map( L => shifter_in_2, R => unsigned(shift_amount_2),
				RESULT => shifter_out,
				clk => clk, reset => reset,
				in_rdy => stage_full(2),
				out_rdy => stage_full(3),
				stall => pipeline_stall,
				tag_in => shifter_tag_in,
				tag_out => shifter_tag_out);


  -----------------------------------------------------------------------------
  -- Stage 4: prepare date for mantissa adder
  -----------------------------------------------------------------------------
  process(clk, reset, pipeline_stall, stage_full, shifter_out, shifter_tag_out)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable sign,sign_l,sign_r          : STD_ULOGIC;   -- sign of the output
    variable leftright        : BOOLEAN;      -- left or right used
    variable sticky           : STD_ULOGIC;   -- Holds precision for rounding
    variable exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    variable tagv: std_logic_vector(tag_width-1 downto 0);
    variable use_shifter: std_logic;

    variable addL, addR : UNSIGNED (fraction_width+1+addguard downto 0); 
    variable subtract_v : std_logic;
    
  begin

    subtract_v := '0';
    addL := (others => '0');
    addR := (others => '0');

    tagv := shifter_tag_out(shifter_tag_out'high downto (shifter_tag_out'high - (tag_width-1)));
    fpresult := to_float(shifter_tag_out(shifter_tag_out'high - tag_width downto 
					(shifter_tag_out'high-(tag_width + fpresult'length - 1))),
					exponent_width, fraction_width);

    fractc := unsigned(shifter_tag_out((shifter_tag_out'high- (tag_width + fpresult'length)) downto 
					(shifter_tag_out'high-
						(tag_width + fpresult'length+fractc'length - 1))));
    fracts :=  unsigned(shifter_tag_out((shifter_tag_out'high-
					(tag_width + fpresult'length+fractc'length)) downto 
					(shifter_tag_out'high-
						(tag_width + fpresult'length+(2*fractc'length) - 1))));
    rexpon :=   signed(shifter_tag_out((shifter_tag_out'high-
					(tag_width + fpresult'length+(2*fractc'length))) downto 
					(shifter_tag_out'high-
					(tag_width + fpresult'length+(2*fractc'length)+rexpon'length-1))));

    sign := '0';

    if(shifter_tag_out(5)= '1') then
	leftright := true;
    else
	leftright := false;
    end if;
    sticky := shifter_tag_out(4);
    exceptional_result := shifter_tag_out(3);
    sign_l := shifter_tag_out(2);
    sign_r := shifter_tag_out(1);
    use_shifter := shifter_tag_out(0);

    if(use_shifter = '1') then
       fracts := shifter_out;
    end if;

      -- add
    fracts (0) := fracts (0) or sticky;     -- Or the sticky bit into the LSB

    -- inputs to the adder
    addL := fractc;
    addR := fracts;
    if sign_l = sign_r then
      -- ufract := fractc + fracts;
      sign   := sign_l;
    else                              -- signs are different
      subtract_v := '1';
      -- ufract := fractc - fracts;      -- always positive result
      if leftright then               -- Figure out which sign to use
        sign := sign_l;
      else
        sign := sign_r;
      end if;
    end if;
   

    active_v := stage_full(3) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(4) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(4) <= stage_full(3);
      end if;

      if(active_v = '1') then
        tag4 <= tagv;
        fpresult_4 <= fpresult;
        rexpon_4 <= rexpon;
        sign_4 <= sign;
        sticky_4 <= sticky;
        exceptional_result_4 <= exceptional_result;
        addL_4 <= addL;
	addR_4 <= addR;
	subtract_4 <= subtract_v;
      end if;      
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 5: mantissa adder.
  -----------------------------------------------------------------------------
  process(tag4, fpresult_4, rexpon_4, sign_4, sticky_4, exceptional_result_4)
  begin
	adder_tag_in(adder_tag_in'high downto 3)
		<= tag4 & Float_To_SLV(fpresult_4) & std_logic_vector(rexpon_4);
	adder_tag_in(2) <= sign_4;
	adder_tag_in(1) <= sticky_4;
	adder_tag_in(0) <= exceptional_result_4;
  end process;

  adder: UnsignedAdderSubtractor
		generic map(name => name & "-adder",
				tag_width => adder_tag_in'length,
				operand_width => addL_4'length,
				chunk_width => 32)
		port map( L => addL_4, R => addR_4, RESULT => ufract_5,
				subtract_op => subtract_4,
				clk => clk, reset => reset,
				in_rdy => stage_full(4),
				out_rdy => stage_full(5),
				stall => pipeline_stall,
				tag_in => adder_tag_in,
				tag_out => adder_tag_out);
				

  -----------------------------------------------------------------------------
  -- Stage 6: normalize.
  -----------------------------------------------------------------------------
  normalizer: block
    signal tagv: std_logic_vector(tag_width-1 downto 0);
    signal fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    signal rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    signal rexpon_padded    : SIGNED (exponent_width+1 downto 0);  -- result exponent
    signal sign             : STD_ULOGIC;   -- sign of the output
    signal sticky           : STD_ULOGIC;   -- Holds precision for rounding
    signal exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    signal ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
  begin
    tagv <= adder_tag_out(adder_tag_out'high downto (adder_tag_out'high - (tagv'length-1)));
    fpresult <= to_float(adder_tag_out((adder_tag_out'high - tagv'length) downto 
				(adder_tag_out'high - (tagv'length+fpresult'length-1))),
			exponent_width, fraction_width);
    rexpon <= signed(adder_tag_out((adder_tag_out'high - (tagv'length+fpresult'length)) downto 
				(adder_tag_out'high - (tagv'length+fpresult'length+rexpon'length-1))));
    rexpon_padded <= resize(rexpon,exponent_width+2);
    ufract <= ufract_5;

    -- zero fraction => sign = '0'
    sign <= '0' when or_reduce(ufract) = '0' else adder_tag_out(2);

    sticky <= adder_tag_out(1);
    exceptional_result <= adder_tag_out(0);

    
    normalizer_tag_in(normalizer_tag_in'high downto 1) <= tagv & Float_To_SLV(fpresult);
    normalizer_tag_in(0) <= exceptional_result;

    normalizer: GenericFloatingPointNormalizer
		generic map (name => name & "-normalizer",
				tag_width => normalizer_tag_in'length,
				exponent_width => exponent_width,
				fraction_width => fraction_width,
				round_style => float_round_style,
				nguard => addguard,
				denormalize => denormalize)
		port map(fract => ufract,
			 expon => rexpon_padded,
			 sign => sign,
			 sticky => sticky,
			 in_rdy  => stage_full(5),
			 out_rdy => stage_full(6),
			 stall => pipeline_stall,
			 clk => clk,
			 reset => reset,
			 tag_in => normalizer_tag_in,
			 tag_out => normalizer_tag_out,
			 normalized_result => fpresult_6);
  end block;

  -----------------------------------------------------------------------------
  -- Stage 7: multiplexor.
  -----------------------------------------------------------------------------
  process(clk, reset, pipeline_stall, stage_full, normalizer_tag_out)
    variable active_v : std_logic;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fpresult_normalized         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    variable tagv: std_logic_vector(tag_width-1 downto 0);
  begin

    tagv := normalizer_tag_out(normalizer_tag_out'high downto (normalizer_tag_out'high - (tagv'length-1)));
    fpresult := to_float(normalizer_tag_out((normalizer_tag_out'high - tagv'length) downto 
				(normalizer_tag_out'high - (tagv'length+fpresult'length-1))),
			exponent_width, fraction_width);
    exceptional_result := normalizer_tag_out(0);

    active_v := stage_full(6) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(7) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(7) <= stage_full(6);
      end if;

      if(active_v = '1') then
        tag7 <= tagv;
    	if(exceptional_result = '1') then 
        	fpresult_7 <= to_slv(fpresult);
	else
        	fpresult_7 <= to_slv(fpresult_6);
	end if;
      end if;
    end if;
  end process;
  
end rtl;


