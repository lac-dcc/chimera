-------------------------------------------------------------------------------
-- Copyright (C) 2009 OutputLogic.com 
-- This source file may be used and distributed without restriction 
-- provided that this copyright statement is not removed from the file 
-- and that any derivative work contains the original copyright notice 
-- and the associated disclaimer. 
-- 
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS 
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED	
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE. 
-------------------------------------------------------------------------------
-- CRC module for data(15:0)
--   lfsr(31:0)=1+x^1+x^2+x^4+x^5+x^7+x^8+x^10+x^11+x^12+x^16+x^22+x^23+x^26+x^32;
-------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;

entity crc_16 is 
  port ( 
    data_in : in std_logic_vector (15 downto 0);
    crc_in  : in std_logic_vector(31 downto 0);
    crc_out : out std_logic_vector (31 downto 0));
end crc_16;

architecture imp_crc_16 of crc_16 is	
  signal lfsr_q: std_logic_vector (31 downto 0);	
  signal lfsr_c: std_logic_vector (31 downto 0);	
begin	
    --crc_out <= lfsr_q;
    lfsr_q <= crc_in;

    lfsr_c(0) <= lfsr_q(16) xor lfsr_q(22) xor lfsr_q(25) xor lfsr_q(26) xor lfsr_q(28) xor data_in(0) xor data_in(6) xor data_in(9) xor data_in(10) xor data_in(12);
    lfsr_c(1) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(25) xor lfsr_q(27) xor lfsr_q(28) xor lfsr_q(29) xor data_in(0) xor data_in(1) xor data_in(6) xor data_in(7) xor data_in(9) xor data_in(11) xor data_in(12) xor data_in(13);
    lfsr_c(2) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(18) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(25) xor lfsr_q(29) xor lfsr_q(30) xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(6) xor data_in(7) xor data_in(8) xor data_in(9) xor data_in(13) xor data_in(14);
    lfsr_c(3) <= lfsr_q(17) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(25) xor lfsr_q(26) xor lfsr_q(30) xor lfsr_q(31) xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(7) xor data_in(8) xor data_in(9) xor data_in(10) xor data_in(14) xor data_in(15);
    lfsr_c(4) <= lfsr_q(16) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(22) xor lfsr_q(24) xor lfsr_q(27) xor lfsr_q(28) xor lfsr_q(31) xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(6) xor data_in(8) xor data_in(11) xor data_in(12) xor data_in(15);
    lfsr_c(5) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(26) xor lfsr_q(29) xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(7) xor data_in(10) xor data_in(13);
    lfsr_c(6) <= lfsr_q(17) xor lfsr_q(18) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(27) xor lfsr_q(30) xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(7) xor data_in(8) xor data_in(11) xor data_in(14);
    lfsr_c(7) <= lfsr_q(16) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(21) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(26) xor lfsr_q(31) xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(7) xor data_in(8) xor data_in(10) xor data_in(15);
    lfsr_c(8) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(24) xor lfsr_q(26) xor lfsr_q(27) xor lfsr_q(28) xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4) xor data_in(8) xor data_in(10) xor data_in(11) xor data_in(12);
    lfsr_c(9) <= lfsr_q(17) xor lfsr_q(18) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(25) xor lfsr_q(27) xor lfsr_q(28) xor lfsr_q(29) xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5) xor data_in(9) xor data_in(11) xor data_in(12) xor data_in(13);
    lfsr_c(10) <= lfsr_q(16) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(21) xor lfsr_q(25) xor lfsr_q(29) xor lfsr_q(30) xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(9) xor data_in(13) xor data_in(14);
    lfsr_c(11) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(25) xor lfsr_q(28) xor lfsr_q(30) xor lfsr_q(31) xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4) xor data_in(9) xor data_in(12) xor data_in(14) xor data_in(15);
    lfsr_c(12) <= lfsr_q(16) xor lfsr_q(17) xor lfsr_q(18) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(25) xor lfsr_q(28) xor lfsr_q(29) xor lfsr_q(31) xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(9) xor data_in(12) xor data_in(13) xor data_in(15);
    lfsr_c(13) <= lfsr_q(17) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(26) xor lfsr_q(29) xor lfsr_q(30) xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(6) xor data_in(7) xor data_in(10) xor data_in(13) xor data_in(14);
    lfsr_c(14) <= lfsr_q(18) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(27) xor lfsr_q(30) xor lfsr_q(31) xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(6) xor data_in(7) xor data_in(8) xor data_in(11) xor data_in(14) xor data_in(15);
    lfsr_c(15) <= lfsr_q(19) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(25) xor lfsr_q(28) xor lfsr_q(31) xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(7) xor data_in(8) xor data_in(9) xor data_in(12) xor data_in(15);
    lfsr_c(16) <= lfsr_q(0) xor lfsr_q(16) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(24) xor lfsr_q(28) xor lfsr_q(29) xor data_in(0) xor data_in(4) xor data_in(5) xor data_in(8) xor data_in(12) xor data_in(13);
    lfsr_c(17) <= lfsr_q(1) xor lfsr_q(17) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(25) xor lfsr_q(29) xor lfsr_q(30) xor data_in(1) xor data_in(5) xor data_in(6) xor data_in(9) xor data_in(13) xor data_in(14);
    lfsr_c(18) <= lfsr_q(2) xor lfsr_q(18) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(26) xor lfsr_q(30) xor lfsr_q(31) xor data_in(2) xor data_in(6) xor data_in(7) xor data_in(10) xor data_in(14) xor data_in(15);
    lfsr_c(19) <= lfsr_q(3) xor lfsr_q(19) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(27) xor lfsr_q(31) xor data_in(3) xor data_in(7) xor data_in(8) xor data_in(11) xor data_in(15);
    lfsr_c(20) <= lfsr_q(4) xor lfsr_q(20) xor lfsr_q(24) xor lfsr_q(25) xor lfsr_q(28) xor data_in(4) xor data_in(8) xor data_in(9) xor data_in(12);
    lfsr_c(21) <= lfsr_q(5) xor lfsr_q(21) xor lfsr_q(25) xor lfsr_q(26) xor lfsr_q(29) xor data_in(5) xor data_in(9) xor data_in(10) xor data_in(13);
    lfsr_c(22) <= lfsr_q(6) xor lfsr_q(16) xor lfsr_q(25) xor lfsr_q(27) xor lfsr_q(28) xor lfsr_q(30) xor data_in(0) xor data_in(9) xor data_in(11) xor data_in(12) xor data_in(14);
    lfsr_c(23) <= lfsr_q(7) xor lfsr_q(16) xor lfsr_q(17) xor lfsr_q(22) xor lfsr_q(25) xor lfsr_q(29) xor lfsr_q(31) xor data_in(0) xor data_in(1) xor data_in(6) xor data_in(9) xor data_in(13) xor data_in(15);
    lfsr_c(24) <= lfsr_q(8) xor lfsr_q(17) xor lfsr_q(18) xor lfsr_q(23) xor lfsr_q(26) xor lfsr_q(30) xor data_in(1) xor data_in(2) xor data_in(7) xor data_in(10) xor data_in(14);
    lfsr_c(25) <= lfsr_q(9) xor lfsr_q(18) xor lfsr_q(19) xor lfsr_q(24) xor lfsr_q(27) xor lfsr_q(31) xor data_in(2) xor data_in(3) xor data_in(8) xor data_in(11) xor data_in(15);
    lfsr_c(26) <= lfsr_q(10) xor lfsr_q(16) xor lfsr_q(19) xor lfsr_q(20) xor lfsr_q(22) xor lfsr_q(26) xor data_in(0) xor data_in(3) xor data_in(4) xor data_in(6) xor data_in(10);
    lfsr_c(27) <= lfsr_q(11) xor lfsr_q(17) xor lfsr_q(20) xor lfsr_q(21) xor lfsr_q(23) xor lfsr_q(27) xor data_in(1) xor data_in(4) xor data_in(5) xor data_in(7) xor data_in(11);
    lfsr_c(28) <= lfsr_q(12) xor lfsr_q(18) xor lfsr_q(21) xor lfsr_q(22) xor lfsr_q(24) xor lfsr_q(28) xor data_in(2) xor data_in(5) xor data_in(6) xor data_in(8) xor data_in(12);
    lfsr_c(29) <= lfsr_q(13) xor lfsr_q(19) xor lfsr_q(22) xor lfsr_q(23) xor lfsr_q(25) xor lfsr_q(29) xor data_in(3) xor data_in(6) xor data_in(7) xor data_in(9) xor data_in(13);
    lfsr_c(30) <= lfsr_q(14) xor lfsr_q(20) xor lfsr_q(23) xor lfsr_q(24) xor lfsr_q(26) xor lfsr_q(30) xor data_in(4) xor data_in(7) xor data_in(8) xor data_in(10) xor data_in(14);
    lfsr_c(31) <= lfsr_q(15) xor lfsr_q(21) xor lfsr_q(24) xor lfsr_q(25) xor lfsr_q(27) xor lfsr_q(31) xor data_in(5) xor data_in(8) xor data_in(9) xor data_in(11) xor data_in(15);

    crc_out <= lfsr_c;

--    process (clk,rst) begin 
--      if (rst = '1') then 
--        lfsr_q <= b"11111111111111111111111111111111";
--      elsif (clk'EVENT and clk = '1') then 
--        if (crc_en = '1') then 
--          lfsr_q <= lfsr_c; 
--       	end if; 
--      end if; 
--    end process; 
end architecture imp_crc_16; 