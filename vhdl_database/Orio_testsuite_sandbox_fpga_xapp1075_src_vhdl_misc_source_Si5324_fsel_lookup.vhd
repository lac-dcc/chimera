-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: Si5324_fsel_lookup.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-01-11 10:29:17-07 $
-- /___/   /\    Date Created: January 5, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: Si5324_fsel_lookup.vhd,rcs $
-- Revision 1.0  2010-01-11 10:29:17-07  jsnow
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
-- This module converts the Si5324 input and output frequency select values into
-- an 8-bit frequency select number that is sent to the AVB FMC card to select
-- the programming for the Si5324.
-- 
-- For out_fsel values of 7 or less, the mapping is just a concatenation of
-- {out_fsel[2:0], in_fsel} which corresponds to the original 8-bit direct 
-- mapping implemented in early versions of the AVB FMC code. If out_fsel[3] is
-- 1, then there is a mapping process that goes on to fit these other mapping 
-- values into unused code spaces in the sparse 256-entry programming lookup 
-- table.
-- 
-- When the concatenation method is used, the select signals are delayed by one
-- clock cycle to correspond to the 1 clock cycle latency through the mapping 
-- path.
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Si5324_fsel_lookup is
port (
    clk:            in  std_logic;                      -- clock input
    out_fsel:       in  std_logic_vector(3 downto 0);   -- selects the output frequency
    in_fsel:        in  std_logic_vector(4 downto 0);   -- selects the input frequency
    fsel:           out std_logic_vector(7 downto 0));  -- frequency select value
end Si5324_fsel_lookup;

architecture xilinx of Si5324_fsel_lookup is
    
signal lookup_rom :     std_logic_vector(7 downto 0) := (others => '0');
signal out_fsel_reg :   std_logic_vector(3 downto 0) := (others => '0');
signal in_fsel_reg :    std_logic_vector(4 downto 0) := (others => '0');

begin

process(clk)
begin
    if rising_edge(clk) then
        out_fsel_reg <= out_fsel;
        in_fsel_reg <= in_fsel;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if out_fsel(2 downto 0) = "000" then
            case in_fsel is
                when "10111" => lookup_rom <= std_logic_vector(to_unsigned(247, lookup_rom'length));
                when "11000" => lookup_rom <= std_logic_vector(to_unsigned(248, lookup_rom'length));
                when "11001" => lookup_rom <= std_logic_vector(to_unsigned(249, lookup_rom'length));
                when "11010" => lookup_rom <= std_logic_vector(to_unsigned(250, lookup_rom'length));
                when "11011" => lookup_rom <= std_logic_vector(to_unsigned(251, lookup_rom'length));
                when "11100" => lookup_rom <= std_logic_vector(to_unsigned(252, lookup_rom'length));
                when others  => lookup_rom <= std_logic_vector(to_unsigned(247, lookup_rom'length));
            end case;
        elsif out_fsel(2 downto 0) = "001" then
            case in_fsel is
                when "10111" => lookup_rom <= std_logic_vector(to_unsigned(209, lookup_rom'length));
                when "11000" => lookup_rom <= std_logic_vector(to_unsigned(210, lookup_rom'length));
                when "11001" => lookup_rom <= std_logic_vector(to_unsigned(211, lookup_rom'length));
                when "11010" => lookup_rom <= std_logic_vector(to_unsigned(212, lookup_rom'length));
                when "11011" => lookup_rom <= std_logic_vector(to_unsigned(213, lookup_rom'length));
                when "11100" => lookup_rom <= std_logic_vector(to_unsigned(214, lookup_rom'length));
                when others  => lookup_rom <= std_logic_vector(to_unsigned(209, lookup_rom'length));
            end case;
        elsif out_fsel(2 downto 0) = "010" then
            lookup_rom <= std_logic_vector(to_unsigned(255, lookup_rom'length));
        else
            lookup_rom <= (others => '0');
        end if;
    end if;
end process;

fsel <= lookup_rom when out_fsel_reg(3) = '1' else (out_fsel_reg(2 downto 0) & in_fsel_reg);

end xilinx;

