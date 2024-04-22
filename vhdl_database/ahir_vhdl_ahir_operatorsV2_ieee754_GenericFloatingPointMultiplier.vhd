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
-- An IEEE-754 compliant arbitrary-precision pipelined multiplier
-- which is basically, a pipelined version of the multiply function
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


entity GenericFloatingPointMultiplier is
  generic (name:string;
	  tag_width : integer := 8;
           exponent_width: integer := 11;
           fraction_width : integer := 52;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
  port(
    INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
    OUTMUL: out std_logic_vector((exponent_width+fraction_width) downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

-- works, also when synthesized by xst 10.1.  xst 9.2is seems
-- to produce incorrect circuits.
architecture rtl of GenericFloatingPointMultiplier is

  constant operand_width : integer := exponent_width+fraction_width+1;

  signal lp, rp             : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input  
  signal pipeline_stall : std_logic;
  signal stage_full : std_logic_vector(0 to 4);


  constant multguard        : NATURAL := addguard;           -- guard bits


  -- stage 0 outputs.
  signal tag0: std_logic_vector(tag_width-1 downto 0);
  signal  l, r             : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input  

  -- stage 1 outputs
  signal lfptype_1, rfptype_1 : valid_fpstate;
  signal fpresult_1         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal fractl_1, fractr_1   : UNSIGNED (fraction_width downto 0);  -- fractions
  signal rfract_1           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
  signal sfract_1           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
  signal shifty_1           : INTEGER;      -- denormal shift
  signal exponl_1, exponr_1   : SIGNED (exponent_width-1 downto 0);  -- exponents
  signal rexpon_1           : SIGNED (exponent_width+1 downto 0);  -- result exponent
  signal fp_sign_1          : STD_ULOGIC;   -- sign of result
  signal lresize_1, rresize_1 : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal sticky_1           : STD_ULOGIC;   -- Holds precision for rounding
  signal exceptional_result_1  : std_logic;
  
  signal tag1: std_logic_vector(tag_width-1 downto 0);
  signal tag1_extended : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1+1-1 downto 0);  

  -- stage 2 outputs (note stage 2 itelf is a pipelined array multiplier)
  signal rfract_2           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction  
  signal tag2_extended : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1+1-1 downto 0);

  -- normalizer
  signal normalizer_tag_in, normalizer_tag_out: std_logic_vector(tag_width+fpresult_1'length downto 0);
  signal fpresult_3         : UNRESOLVED_float (exponent_width downto -fraction_width);

  -- stage 4 outputs.
  signal tag4: std_logic_vector(tag_width-1 downto 0);  
  signal fpresult_4         : std_logic_vector((exponent_width+fraction_width) downto 0);
  
begin

  pipeline_stall <= stage_full(4) and (not accept_rdy);
  muli_rdy <= not pipeline_stall;
  mulo_rdy <= stage_full(4);
  tag_out <= tag4;

  -- construct l,r.
  lp <= to_float(INA, exponent_width, fraction_width);
  rp <= to_float(INB, exponent_width, fraction_width);

  -- return slv.
  OUTMUL <= fpresult_4;

  -----------------------------------------------------------------------------
  -- Stage 0: register inputs.
  -----------------------------------------------------------------------------
  process(clk, reset, pipeline_stall, stage_full, env_rdy)
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
  process(clk, reset, pipeline_stall, stage_full, l, r)
    variable active_v : std_logic;
    variable exceptional_result: std_ulogic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width downto 0);  -- fractions
    variable rfract           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
    variable sfract           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
    variable shifty           : INTEGER;      -- denormal shift
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable fp_sign          : STD_ULOGIC;   -- sign of result
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable sticky           : STD_ULOGIC;   -- Holds precision for rounding
  begin
    exceptional_result := '0';    
    fp_sign := '0';
    rexpon := (others => '0');
    exponl := (others => '0');
    exponr := (others => '0');
    shifty := 0;
    fractl := (others => '0');
    fractr := (others => '0');
    lfptype := isx;
    rfptype := isx;
    fpresult := (others => '0');
     
    if (fraction_width = 0 or l'length < 7 or r'length < 7) then
      lfptype := isx;
      exceptional_result := '1';
    else
      lfptype := classfp (l, check_error);
      rfptype := classfp (r, check_error);
    end if;
    if (lfptype = isx or rfptype = isx) then
      fpresult := (others => 'X');
      exceptional_result := '1';      
    elsif ((lfptype = nan or lfptype = quiet_nan or
            rfptype = nan or rfptype = quiet_nan)) then
      -- Return quiet NAN, IEEE754-1985-7.1,1
      exceptional_result := '1';      
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (((lfptype = pos_inf or lfptype = neg_inf) and
            (rfptype = pos_zero or rfptype = neg_zero)) or
           ((rfptype = pos_inf or rfptype = neg_inf) and
            (lfptype = pos_zero or lfptype = neg_zero))) then    -- 0 * inf
      -- Return quiet NAN, IEEE754-1985-7.1,3
      exceptional_result := '1';      
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (lfptype = pos_inf or rfptype = pos_inf
           or lfptype = neg_inf or rfptype = neg_inf) then  -- x * inf = inf
      exceptional_result := '1';      
      fpresult := pos_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
      -- figure out the sign
      fp_sign := l(l'high) xor r(r'high);     -- figure out the sign
      fpresult (exponent_width) := fp_sign;
    else
      fp_sign := l(l'high) xor r(r'high);     -- figure out the sign
     
      -- mpd: this resize seems unnecessary..
      --lresize := resize (arg            => to_x01(l),
                         --exponent_width => exponent_width,
                         --fraction_width => fraction_width,
                         --denormalize_in => denormalize,
                         --denormalize    => denormalize);
      lresize := to_X01(l);

      lfptype := classfp (lresize, false);    -- errors already checked
      
      -- mpd: this resize is not necessary?
      -- rresize := resize (arg            => to_x01(r),
                         -- exponent_width => exponent_width,
                         -- fraction_width => fraction_width,
                         -- denormalize_in => denormalize,
                         -- denormalize    => denormalize);
      rresize := to_X01(r);
      rfptype := classfp (rresize, false);    -- errors already checked

      break_number (
        arg         => lresize,
        fptyp       => lfptype,
        denormalize => denormalize,
        fract       => fractl,
        expon       => exponl);
      break_number (
        arg         => rresize,
        fptyp       => rfptype,
        denormalize => denormalize,
        fract       => fractr,
        expon       => exponr);

      -- TODO: this shifter slows things down. perhaps its better to break
      --       and add a new stage at this point.
      if (rfptype = pos_denormal or rfptype = neg_denormal) then
        shifty := fraction_width - find_leftmost(fractr, '1');
        fractr := shift_left (fractr, shifty);
      elsif (lfptype = pos_denormal or lfptype = neg_denormal) then
        shifty := fraction_width - find_leftmost(fractl, '1');
        fractl := shift_left (fractl, shifty);
      else
        shifty := 0;
        -- Note that a denormal number * a denormal number is always zero.
      end if;
      -- multiply
      -- add the exponents
      rexpon := resize (exponl, rexpon'length) + exponr - shifty + 1;
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
        fractl_1 <= fractl;
        fractr_1 <= fractr;
        rexpon_1 <= rexpon;
        fp_sign_1 <= fp_sign;
        exceptional_result_1 <= exceptional_result;
      end if;      
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 2: instantiate array multiplier
  -----------------------------------------------------------------------------
  process(tag1, fpresult_1, rexpon_1, fp_sign_1, exceptional_result_1, fp_sign_1, exceptional_result_1)
    variable tex : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1 downto 0);
    variable fp_slv : std_logic_vector(operand_width-1 downto 0);
    variable pad_bits : std_logic_vector(1 downto 0);
  begin

    fp_slv(operand_width-1) := fpresult_1(exponent_width);
    fp_slv(operand_width-2 downto fraction_width) := to_slv(fpresult_1(exponent_width-1 downto 0));
    fp_slv(fraction_width-1 downto 0) := to_slv(fpresult_1(-1 downto -fraction_width));

    pad_bits(1) := fp_sign_1;
    pad_bits(0) := exceptional_result_1;
    
    tex := tag1 & fp_slv & to_slv(rexpon_1) & pad_bits;
    
    tag1_extended <= tex;
  end process;
  
  amul : UnsignedMultiplier
    generic map (name => name & "-amul", tag_width => tag_width+operand_width+(exponent_width+2)+2,
                 operand_width => fraction_width+1,
		 chunk_width => 32)
    port map (
      L       => fractl_1,
      R       => fractR_1,
      RESULT  => rfract_2,
      clk     => clk,
      reset   => reset,
      in_rdy  => stage_full(1),
      out_rdy => stage_full(2),
      stall   => pipeline_stall,
      tag_in  => tag1_extended,
      tag_out => tag2_extended);
    


  -----------------------------------------------------------------------------
  -- Stage 3: normalize... 
  -----------------------------------------------------------------------------
  Normalizer: block
    signal rfract           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
    signal sfract           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
    signal rexpon           : SIGNED (exponent_width+1 downto 0);  -- result exponent
    signal fp_sign          : STD_ULOGIC;   -- sign of result
    signal sticky           : STD_ULOGIC;   -- Holds precision for rounding
    signal raw_tag          : std_logic_vector(tag_width-1 downto 0);
    signal fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    signal exceptional_result: std_logic;
  begin
    raw_tag <= tag2_extended((tag_width+operand_width+exponent_width+3) downto (operand_width+exponent_width+4));
    fpresult <= to_float(tag2_extended(operand_width+exponent_width+3 downto exponent_width+4), exponent_width, fraction_width);
    rexpon <= to_signed(tag2_extended(exponent_width+3 downto 2));
    fp_sign <= tag2_extended(1);
    exceptional_result <= tag2_extended(0);
    
    rfract <= rfract_2;
    sfract <= rfract (rfract'high downto
                      rfract'high - (fraction_width+1+multguard));
    sticky <= or_reduce (rfract (rfract'high-(fraction_width+1+multguard)
                                 downto 0));

    normalizer_tag_in(normalizer_tag_in'high downto 1) <= 
		raw_tag & Float_To_SLV(fpresult);
    normalizer_tag_in(0) <= exceptional_result;
   	
    normalizer: GenericFloatingPointNormalizer
		generic map (name => name & "-normalizer", tag_width => normalizer_tag_in'length,
				exponent_width => exponent_width,
				fraction_width => fraction_width,
				round_style => float_round_style,
				nguard => multguard,
				denormalize => denormalize)
		port map(fract => sfract,
			 expon => rexpon,
			 sign => fp_sign,
			 sticky => sticky,
			 in_rdy  => stage_full(2),
			 out_rdy => stage_full(3),
			 stall => pipeline_stall,
			 clk => clk,
			 reset => reset,
			 tag_in => normalizer_tag_in,
			 tag_out => normalizer_tag_out,
			 normalized_result => fpresult_3);
  end block;

  -----------------------------------------------------------------------------
  -- Stage 4: final multiplexor... 
  -----------------------------------------------------------------------------
  process(clk, reset, pipeline_stall, stage_full, normalizer_tag_out, fpresult_3)
    variable active_v : std_logic;
    variable exceptional_result: std_ulogic;
    variable fpresult, fpresult_normalized   : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable raw_tag          : std_logic_vector(tag_width-1 downto 0);
    
  begin

    raw_tag := normalizer_tag_out(tag_width+operand_width downto operand_width+1);
    fpresult := to_float(normalizer_tag_out(operand_width downto 1), exponent_width, fraction_width);
    exceptional_result := normalizer_tag_out(0);
    
   fpresult_normalized := fpresult_3;

    active_v := stage_full(3) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(4) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(4) <= stage_full(3);
      end if;

      if(active_v = '1') then
        tag4 <= raw_tag;

        if(exceptional_result = '1') then
          fpresult_4 <= to_slv(fpresult);
	else
          fpresult_4 <= to_slv(fpresult_normalized);
        end if;
        
      end if;      
    end if;
  end process;
  
end rtl;
