----------------------------------------------------------------------------------
-- Module Name: test_800_600_source.vhd - Behavioral
--
-- Description: Generate a VGA style 800x600 signal for testing (wih 40MHz cloc)
----
----------------------------------------------------------------------------------
-- FPGA_DisplayPort from https://github.com/hamsternz/FPGA_DisplayPort
------------------------------------------------------------------------------------
-- The MIT License (MIT)
-- 
-- Copyright (c) 2015 Michael Alan Field <hamster@snap.net.nz>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
------------------------------------------------------------------------------------
----- Want to say thanks? ----------------------------------------------------------
------------------------------------------------------------------------------------
--
-- This design has taken many hours - 3 months of work. I'm more than happy
-- to share it if you can make use of it. It is released under the MIT license,
-- so you are not under any onus to say thanks, but....
-- 
-- If you what to say thanks for this design either drop me an email, or how about 
-- trying PayPal to my email (hamster@snap.net.nz)?
--
--  Educational use - Enough for a beer
--  Hobbyist use    - Enough for a pizza
--  Research use    - Enough to take the family out to dinner
--  Commercial use  - A weeks pay for an engineer (I wish!)
--------------------------------------------------------------------------------------
--  Ver | Date       | Change
--------+------------+---------------------------------------------------------------
--  0.1 | 2015-10-13 | Initial Version
------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_800_600_source is
    Port ( clk40  : in  STD_LOGIC;
           hblank : out  STD_LOGIC := '0';
           hsync  : out  STD_LOGIC := '0';
           vblank : out  STD_LOGIC := '0';
           vsync  : out  STD_LOGIC := '0';
           data   : out  STD_LOGIC_VECTOR (23 downto 0) := (others => '0'));
end test_800_600_source;

architecture Behavioral of test_800_600_source is
   signal hcount : unsigned(10 downto 0) := (others => '0');
   signal vcount : unsigned(10 downto 0) := (others => '0');
   
   constant h_total       : unsigned(11 downto 0) := to_unsigned(1056,12);
   constant h_visible     : unsigned(10 downto 0) := to_unsigned( 800,11);
   constant h_sync_width  : unsigned(10 downto 0) := to_unsigned( 128,11);
   constant h_back_width  : unsigned(10 downto 0) := to_unsigned(  88,11);

   constant v_total       : unsigned(11 downto 0) := to_unsigned( 628,12);
   constant v_visible     : unsigned(10 downto 0) := to_unsigned( 600,11);
   constant v_sync_width  : unsigned(10 downto 0) := to_unsigned(   4,11);
   constant v_back_width  : unsigned(10 downto 0) := to_unsigned(  23,11);
   signal   pixel_count   : unsigned(10 downto 0) := (others => '0');
begin

process(clk40) 
   begin
      if rising_edge(clk40) then
         ----------------------------
         -- Generate the data signals
         ----------------------------
         hblank <= '0';
         hsync  <= '0';
         data(10 downto 0) <= std_logic_vector(pixel_count);
         pixel_count <= pixel_count+1;
         if hcount < h_sync_width then
            hsync <= '1';
         end if;

         if hcount < h_sync_width+h_back_width then
            hblank <= '1';
            pixel_count <= (others => '0');
            data(10 downto 0) <=  (others => '0');
         end if;
         if hcount > h_sync_width+h_back_width+h_visible-1 then
            hblank <= '1';
            pixel_count <= (others => '0');
            data(10 downto 0) <=  (others => '0');
         end if;

         vblank <= '0';
         vsync  <= '0';
         if vcount < v_sync_width then
            vsync <= '1';
         end if;

         if vcount < v_sync_width+v_back_width then
            vblank <= '1';
         end if;
         
         if vcount > v_sync_width+v_back_width+v_visible-1 then
            vblank <= '1';
         end if;
  
            -----------------------
            -- Update the counters
            -----------------------
         if hcount = h_total-1 then 
            hcount <= (others => '0');
            if vcount = v_total-1 then
               vcount <= (others => '0');
            else
               vcount <= vcount + 1;
            end if;
         else
            hcount <= hcount + 1;
         end if;
      end if;
   end process;
end Behavioral;

