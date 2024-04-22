-------------------------------------------------------------------------------- 
-- Copyright (c) 2009 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: sdi_bitrep_20b.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2009-03-11 15:27:45-06 $
-- /___/   /\    Date Created: January 8, 2009
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: sdi_bitrep_20b.vhd,rcs $
-- Revision 1.0  2009-03-11 15:27:45-06  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs exclusively with Xilinx
-- products. Xilinx and its licensors make and you receive no warranties or 
-- conditions, express, implied, statutory or otherwise, and Xilinx specifically
-- disclaims any implied warranties of merchantability, non-infringement, or 
-- fitness for a particular purpose. Xilinx does not warrant that the functions 
-- contained in these designs will meet your requirements, or that the operation
-- of these designs will be uninterrupted or error free, or that defects in the 
-- Designs will be corrected. Furthermore, Xilinx does not warrant or make any 
-- representations regarding use or the results of the use of the designs in 
-- terms of correctness, accuracy, reliability, or otherwise. The designs are 
-- not covered by any other agreement that you may have with Xilinx. 
--
-- LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable 
-- for any damages, including without limitation direct, indirect, incidental, 
-- special, reliance or consequential damages arising from the use or operation 
-- of the designs or accompanying documentation, however caused and on any 
-- theory of liability. This limitation will apply even if Xilinx has been 
-- advised of the possibility of such damage. This limitation shall apply 
-- not-withstanding the failure of the essential purpose of any limited remedies
-- herein.
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- Description of module:
-- 
-- This module performs the bit replication of the incoming data, 11 times and 
-- sends out 20 bits on every clock cycle. This module requires an alternating
-- cadence of 5/6/5/6 on the clock enable (ce) input. The state machine 
-- automatically aligns itself regardless of whether the first step of the 
-- cadence is 5 or 6 when it starts up. If the 5/6/5/6 cadence gets out of step,
-- the state machine will realign itself and will also assert the align_err
-- output for one clock cycle.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity sdi_bitrep_20b is
    port (
        clk:        in  std_logic;                                       -- clock input
        rst:        in  std_logic;                                       -- async reset
        ce:         in  std_logic;                                       -- clock enable
        d:          in  std_logic_vector(9 downto 0);                    -- input data 
        q:          out std_logic_vector(19 downto 0) := (others => '0');-- output data 
        align_err:  out std_logic := '0' 
    );
end sdi_bitrep_20b;

architecture xilinx of sdi_bitrep_20b is

component mux12_wide
    generic (
        WIDTH:  integer := 10);
    port (
        d0 :    in  std_logic_vector(WIDTH-1 downto 0);
        d1 :    in  std_logic_vector(WIDTH-1 downto 0);
        d2 :    in  std_logic_vector(WIDTH-1 downto 0);
        d3 :    in  std_logic_vector(WIDTH-1 downto 0);
        d4 :    in  std_logic_vector(WIDTH-1 downto 0);
        d5 :    in  std_logic_vector(WIDTH-1 downto 0);
        d6 :    in  std_logic_vector(WIDTH-1 downto 0);
        d7 :    in  std_logic_vector(WIDTH-1 downto 0);
        d8 :    in  std_logic_vector(WIDTH-1 downto 0);
        d9 :    in  std_logic_vector(WIDTH-1 downto 0);
        d10 :   in  std_logic_vector(WIDTH-1 downto 0);
        d11 :   in  std_logic_vector(WIDTH-1 downto 0);
        sel :   in  std_logic_vector(3 downto 0);
        y :     out std_logic_vector(WIDTH-1 downto 0));
end component;

function repeat (n: natural; v: std_logic) return std_logic_vector is
    variable result: std_logic_vector(0 to n-1);
begin
    for i in 0 to n-1 loop
        result(i) := v;
    end loop;
    return result;
end;

attribute fsm_encoding : string;
 
subtype state is std_logic_vector(3 downto 0);

constant START : state  := X"F";
constant s0  :   state := X"0";
constant s1  :   state := X"1";
constant s2  :   state := X"2";
constant s3  :   state := X"3";
constant s4  :   state := X"4";
constant s5  :   state := X"5";
constant s6  :   state := X"6";
constant s7  :   state := X"7";
constant s8  :   state := X"8";
constant s9  :   state := X"9";
constant s10 :   state := X"A";
constant s5X :   state := X"B";

  
----------------------------------------------------------------------
-- Signal definitions
--

signal current_state :  state := START;
attribute fsm_encoding of current_state : signal is "USER";

signal next_state:      state;
signal in_reg :         std_logic_vector(9 downto 0) := (others => '0');
signal d_reg :          std_logic_vector(9 downto 0) := (others => '0');
signal b9_save :        std_logic := '0';
signal ce_dly :         std_logic := '0';
signal q_int :          std_logic_vector(19 downto 0);

signal d0 :             std_logic_vector(19 downto 0);
signal d1 :             std_logic_vector(19 downto 0);
signal d2 :             std_logic_vector(19 downto 0);
signal d3 :             std_logic_vector(19 downto 0);
signal d4 :             std_logic_vector(19 downto 0);
signal d5 :             std_logic_vector(19 downto 0);
signal d6 :             std_logic_vector(19 downto 0);
signal d7 :             std_logic_vector(19 downto 0);
signal d8 :             std_logic_vector(19 downto 0);
signal d9 :             std_logic_vector(19 downto 0);
signal d10 :            std_logic_vector(19 downto 0);
signal d11 :            std_logic_vector(19 downto 0);

begin

--
-- Input registers
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            in_reg <= d;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        ce_dly <= ce;
    end if;
end process;        
    
process(clk)
begin
    if rising_edge(clk) then
        if ce_dly = '1' then
            d_reg <= in_reg;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce_dly = '1' then
            b9_save <= d_reg(9);
        end if;
    end if;
end process;

--
-- FSM: current_state register
--
-- This code implements the current state register. It loads with the S0
-- state on reset and the next_state value with each rising clock edge.
--
process(clk, rst)
begin
    if rst ='1' then
        current_state <= START;
    elsif rising_edge(clk) then
        current_state <= next_state;
    end if;
end process;


-- FSM: next_state logic
--
-- This case statement generates the next_state value for the FSM based on
-- the current_state and the various FSM inputs.
--        
process(current_state, ce_dly)
begin
    case current_state is
        when START =>   if ce_dly = '1' then
                            next_state <= s0;
                        else
                            next_state <= START;
                        end if;

        when s0 =>      next_state <= s1;

        when s1 =>      next_state <= s2;

        when s2 =>      next_state <= s3;

        when s3 =>      next_state <= s4;

        when s4 =>      if ce_dly = '1' then
                            next_state <= s5;
                        else
                            next_state <= s5X;
                        end if;

        when s5 =>      next_state <= s6;

        when s5X =>     next_state <= s6;

        when s6 =>      next_state <= s7;

        when s7 =>      next_state <= s8;

        when s8 =>      next_state <= s9;

        when s9 =>      next_state <= s10;

        when s10 =>     if ce_dly = '1' then
                            next_state <= s0;
                        else
                            next_state <= START;
                        end if;

        when others =>  next_state <= START;
    end case;
end process;

--
-- Output mux
--
-- Use the current state encoding to select the output bits.
--

d0  <= (repeat(9, d_reg(1))  & repeat(11, d_reg(0)));
d1  <= (repeat(7, d_reg(3))  & repeat(11, d_reg(2)) & repeat(2, d_reg(1)));
d2  <= (repeat(5, d_reg(5))  & repeat(11, d_reg(4)) & repeat(4, d_reg(3)));
d3  <= (repeat(3, d_reg(7))  & repeat(11, d_reg(6)) & repeat(6, d_reg(5)));
d4  <= (          d_reg(9)   & repeat(11, d_reg(8)) & repeat(8, d_reg(7)));
d5  <= (repeat(10,d_reg(0))  & repeat(10, b9_save));
d6  <= (repeat(8, d_reg(2))  & repeat(11, d_reg(1)) &           d_reg(0));
d7  <= (repeat(6, d_reg(4))  & repeat(11, d_reg(3)) & repeat(3, d_reg(2)));
d8  <= (repeat(4, d_reg(6))  & repeat(11, d_reg(5)) & repeat(5, d_reg(4)));
d9  <= (repeat(2, d_reg(8))  & repeat(11, d_reg(7)) & repeat(7, d_reg(6)));
d10 <= (repeat(11,d_reg(9))  & repeat(9,  d_reg(8)));
d11 <= (repeat(10,in_reg(0)) & repeat(10, d_reg(9)));

OUTMUX : mux12_wide
generic map (
    WIDTH   => 20)
port map (
    d0      => d0,
    d1      => d1,
    d2      => d2,
    d3      => d3,
    d4      => d4,
    d5      => d5,
    d6      => d6,
    d7      => d7,
    d8      => d8,
    d9      => d9,
    d10     => d10,
    d11     => d11,
    sel     => current_state,
    y       => q_int);

process(clk)
begin
    if rising_edge(clk) then
        q <= q_int;
    end if;
end process;
    
process(clk)
begin
    if rising_edge(clk) then
        if (current_state = s10 or current_state = s5X) and ce_dly = '0' then
            align_err <= '1';
        else
            align_err <= '0';
        end if;
    end if;
end process;        

end xilinx;