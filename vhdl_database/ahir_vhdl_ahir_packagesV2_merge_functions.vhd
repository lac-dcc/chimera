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

library ahir;
use ahir.mem_function_pack.all;

package merge_functions is
  type NaturalArray is array (natural range <>) of natural;

  function Total_Intermediate_Width(constant x,y: natural) return natural;
  function Stage_Width (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  function Left_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  function Right_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  
  --constant c_group_left_id : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Left_Ids(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Left_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;
  
  --constant c_group_right_id : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Left_Ids(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Right_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;
  
  --constant c_group_sizes : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Sizes(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Sizes (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;

  function Nonzero_Count (
    constant x : NaturalArray)
    return natural;

  procedure Select_Best_Index(time_stamp_vector : in std_logic_vector;
                              data_vector: in std_logic_vector;
			      valid_vector      : in std_logic_vector;
			      best_time_stamp   : out std_logic_vector;
                              best_data : out std_logic_vector;
                              sel_vector: out std_logic_vector;
                              valid_flag: out std_logic);
end merge_functions;

package body merge_functions is

  function Total_Intermediate_Width(constant x,y: natural)
    return natural is
    variable ret_val,tval : natural;
  begin
    ret_val := x;
    tval := x;
    
    while tval > 1 loop
      tval := Ceiling(tval,y);
      ret_val := ret_val + tval;
    end loop;  -- I

    -- for the output.
    ret_val := ret_val + 1;
    return(ret_val);
  end function Total_Intermediate_Width;

  function Stage_Width (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var,tval : natural;
  begin  -- Stage_Width
    ret_var := stage0_width;
    tval := mux_degree;
    if(stage_id > 0) then
      for I  in 1 to stage_id loop
        ret_var := Ceiling(ret_var,tval);
      end loop;  -- I
    end if;
    return(ret_var);
  end Stage_Width;
  
  -- index in intermediate array from which input to stage_id begins
  function Left_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var,offset,tval : natural;
  begin  
    if(stage_id = 0) then
      ret_var := 0;
    else
      ret_var := Right_Index(stage_id-1,mux_degree,stage0_width) + 1;
    end if;
    return(ret_var);
  end Left_Index;

  function Right_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var: natural;
  begin  
    ret_var := Left_Index(stage_id,mux_degree,stage0_width)  +
               Stage_Width(stage_id,mux_degree,stage0_width) - 1;
    return(ret_var);
  end Right_Index;

  function Calculate_Group_Left_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);    

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "left-id called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => x);
    if(xsize >= ysize) then
      for I in x-1 downto 0 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        if(ret_var(index) = x) then
          ret_var(index) := I;
        end if;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-left-id " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Left_Ids;
  

  function Calculate_Group_Right_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);    

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "right-id called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => x);
    if(xsize >= ysize) then
      for I in 0 to x-1 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        if(ret_var(index) = x) then
          ret_var(index) := I;
        end if;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-right-id " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Right_Ids;


  function Calculate_Group_Sizes (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "group-sizes called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => 0);
    if(xsize >= ysize) then 
      for I in x-1 downto 0 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        ret_var(index) := ret_var(index) + 1;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-size " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Sizes;

  function Nonzero_Count (
    constant x : NaturalArray)
    return natural is
    variable ret_var : natural;
    alias lx : NaturalArray(1 to x'length) is x;
  begin
    ret_var := 0;
    for I in 1 to x'length loop
      if(lx(I) > 0) then
        ret_var := ret_var + 1;
      end if;
    end loop;  -- I
--    assert false report "non-zero-count " & Convert_To_String(ret_var) severity note;
    return(ret_var);
  end Nonzero_Count;
    
  procedure Select_Best_Index(time_stamp_vector : in std_logic_vector;
                              data_vector: in std_logic_vector;
			      valid_vector      : in std_logic_vector;
			      best_time_stamp   : out std_logic_vector;
                              best_data : out std_logic_vector;
                              sel_vector: out std_logic_vector;
                              valid_flag: out std_logic)
  is
	constant mid_point: integer := valid_vector'length / 2;
        constant time_stamp_width : integer := best_time_stamp'length;
        constant data_width : integer := best_data'length;
        
        alias ltv: std_logic_vector(1 to time_stamp_vector'length) is time_stamp_vector;
        alias ld: std_logic_vector(1 to data_vector'length) is data_vector;
	alias lv: std_logic_vector(1 to valid_vector'length) is valid_vector;

	variable uindex, hindex: integer;
	variable ubest, hbest: std_logic_vector(1 to time_stamp_width);
        variable ud, hd: std_logic_vector(1 to data_width);
        variable sv : std_logic_vector(1 to lv'length) ;
        variable uvalid,hvalid : std_logic;
  begin
        sv := (others => '0');
        valid_flag := '0';
	best_time_stamp := ltv(1 to time_stamp_width);
        best_data := ld(1 to data_width);

	if(valid_vector'length = 1) then
		if(lv(1) = '1') then
                        sv(1) := '1';
                        valid_flag := '1';
		end if;	
	elsif(valid_vector'length = 2) then
		if(lv(1) = '1' and lv(2) = '1') then
			if(IsGreaterThan(ltv(1 to time_stamp_width),ltv(time_stamp_width+1 to (2*time_stamp_width)))) then
				best_time_stamp := ltv(time_stamp_width+1 to 2*time_stamp_width);
                                best_data := ld(data_width+1 to 2*data_width);
                                sv(2) := '1';
			else
                                sv(1) := '1';
			end if;
                        valid_flag := '1';
		elsif(lv(1) = '1') then
                        sv(1) := '1';
                        valid_flag := '1';
		elsif(lv(2) = '1') then
			best_time_stamp := ltv(time_stamp_width+1 to 2*time_stamp_width);
                        best_data := ld(data_width+1 to 2*data_width);
                        sv(2) := '1';
                        valid_flag := '1';
		end if;
	else
		Select_Best_Index(ltv(1 to mid_point*time_stamp_width),
                                  ld(1 to mid_point*data_width),
                                  lv(1 to mid_point),
                                  ubest,
                                  ud,
                                  sv(1 to mid_point),
                                  uvalid);
                
		Select_Best_Index(ltv((mid_point*time_stamp_width)+1 to ltv'length),
                                  ld((mid_point*data_width)+1 to ld'length),
                                  lv(mid_point+1 to lv'length),
                                  hbest,
                                  hd,
                                  sv(mid_point+1 to sv'length),
                                  hvalid);
                
		if(uvalid = '1' and hvalid = '1') then
			if(IsGreaterThan(hbest,ubest)) then
				best_time_stamp := ubest;
                                best_data := ud;
                                sv(mid_point + 1 to sv'length) := (others => '0');
			else
				best_time_stamp := hbest;
                                best_data := hd;
                                sv(1 to mid_point) := (others => '0');
			end if;
                        valid_flag := '1';
		elsif (hvalid = '1' ) then
			best_time_stamp := hbest;
                        best_data := hd;
                        sv(1 to mid_point) := (others => '0');
                        valid_flag := '1';
		elsif(uvalid = '1') then
			best_time_stamp := ubest;
                        best_data := ud;
                        sv(mid_point + 1 to sv'length) := (others => '0');
                        valid_flag := '1';
		end if;
	end if;
        sel_vector := sv;
  end Select_Best_Index;
end merge_functions;
