--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.	   
--
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: afifo.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:34 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose:  A generic synchronous fifo.
-- Reference:
-- Revision History: 2009/01/09  corrected signal "buf_avail" and "almost_full" equation.

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   use ieee.numeric_std.all;



ENTITY afifo IS
   GENERIC (
      TCQ         : TIME   := 100 ps;
      DSIZE       : INTEGER := 32;
      FIFO_DEPTH  : INTEGER := 16;
      ASIZE       : INTEGER := 4;
      SYNC        : INTEGER := 1
   );
   PORT (
      wr_clk      : IN STD_LOGIC;
      rst         : IN STD_LOGIC;
      wr_en       : IN STD_LOGIC;
      wr_data     : IN STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      rd_en       : IN STD_LOGIC;
      rd_clk      : IN STD_LOGIC;
      rd_data     : OUT STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      full        : OUT STD_LOGIC;
      empty       : OUT STD_LOGIC;
      almost_full : OUT STD_LOGIC
   );
END afifo;

ARCHITECTURE trans OF afifo IS
   TYPE mem_array IS ARRAY (0 TO FIFO_DEPTH ) OF STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);

   
   
   SIGNAL mem                     : mem_array;
   
   SIGNAL rd_gray_nxt             : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL rd_gray                 : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL rd_capture_ptr          : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL pre_rd_capture_gray_ptr : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL rd_capture_gray_ptr     : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wr_gray                 : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wr_gray_nxt             : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   
   SIGNAL wr_capture_ptr          : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL pre_wr_capture_gray_ptr : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wr_capture_gray_ptr     : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL buf_avail               : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL buf_filled              : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wr_addr                 : STD_LOGIC_VECTOR(ASIZE - 1 DOWNTO 0);
   SIGNAL rd_addr                 : STD_LOGIC_VECTOR(ASIZE - 1 DOWNTO 0);
   
   SIGNAL wr_ptr                  : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL rd_ptr                  : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL i                       : INTEGER;
   SIGNAL j                       : INTEGER;
   SIGNAL k                       : INTEGER;
   
   SIGNAL rd_strobe               : STD_LOGIC;
   
   SIGNAL n                       : INTEGER;
   SIGNAL rd_ptr_tmp              : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   
   SIGNAL wbin                    : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wgraynext               : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL wbinnext                : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL ZERO                    : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);
   SIGNAL ONE                     : STD_LOGIC_VECTOR(ASIZE DOWNTO 0);

   -- Declare intermediate signals for referenced outputs
   SIGNAL full_xhdl1              : STD_LOGIC;
   SIGNAL almost_full_int             : STD_LOGIC;
   SIGNAL empty_xhdl0             : STD_LOGIC;
BEGIN
   -- Drive referenced outputs
   ZERO <= std_logic_vector(to_unsigned(0,(ASIZE+1)));
   ONE <= std_logic_vector(to_unsigned(1,(ASIZE+1)));

   full <= full_xhdl1;
   empty <= empty_xhdl0;
   xhdl3 : IF (SYNC = 1) GENERATE
      PROCESS (rd_ptr)
      BEGIN
         rd_capture_ptr <= rd_ptr;
      END PROCESS;      
   END GENERATE;




   xhdl4 : IF (SYNC = 1) GENERATE
      PROCESS (wr_ptr)
      BEGIN
         wr_capture_ptr <= wr_ptr;
      END PROCESS;      
   END GENERATE;

   wr_addr <= wr_ptr(ASIZE-1 DOWNTO 0);
   rd_data <= mem(conv_integer(rd_addr));



   PROCESS (wr_clk)
   BEGIN
      IF (wr_clk'EVENT AND wr_clk = '1') THEN
         IF ((wr_en AND NOT(full_xhdl1)) = '1') THEN
            mem(to_integer(unsigned(wr_addr))) <= wr_data;
         END IF;
      END IF;
   END PROCESS;
   
   rd_addr <= rd_ptr(ASIZE - 1 DOWNTO 0);
   rd_strobe <= rd_en AND NOT(empty_xhdl0);
   PROCESS (rd_ptr)
   BEGIN
      rd_gray_nxt(ASIZE) <= rd_ptr(ASIZE);
      FOR n IN 0 TO  ASIZE - 1 LOOP
         rd_gray_nxt(n) <= rd_ptr(n) XOR rd_ptr(n + 1);
      END LOOP;
   END PROCESS;
   
   PROCESS (rd_clk)
   BEGIN
      IF (rd_clk'EVENT AND rd_clk = '1') THEN
         IF (rst = '1') THEN
            rd_ptr <= (others=> '0');
            rd_gray <= (others=> '0');
         ELSE
            IF (rd_strobe = '1') THEN
               rd_ptr <= rd_ptr + 1;
            END IF;
            rd_ptr_tmp <= rd_ptr;
            rd_gray <= rd_gray_nxt;
         END IF;
      END IF;
   END PROCESS;
   
   buf_filled <= wr_capture_ptr - rd_ptr;
   PROCESS (rd_clk)
   BEGIN
      IF (rd_clk'EVENT AND rd_clk = '1') THEN
         IF (rst = '1') THEN
            empty_xhdl0 <= '1';
         ELSIF ((buf_filled = ZERO) OR (buf_filled = ONE AND rd_strobe = '1')) THEN
            empty_xhdl0 <= '1';
         ELSE
            empty_xhdl0 <= '0';
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (rd_clk)
   BEGIN
      IF (rd_clk'EVENT AND rd_clk = '1') THEN
         IF (rst = '1') THEN
            wr_ptr <= (others => '0');
            wr_gray <= (others => '0');
         ELSE
            IF (wr_en = '1') THEN
               
               wr_ptr <= wr_ptr + 1;
            END IF;
            wr_gray <= wr_gray_nxt;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (wr_ptr)
   BEGIN
      wr_gray_nxt(ASIZE) <= wr_ptr(ASIZE);
      FOR n IN 0 TO  ASIZE - 1 LOOP
         wr_gray_nxt(n) <= wr_ptr(n) XOR wr_ptr(n + 1);
      END LOOP;
   END PROCESS;
   
   buf_avail <= rd_capture_ptr + FIFO_DEPTH - wr_ptr;
  
   
   PROCESS (wr_clk)
   BEGIN
      IF (wr_clk'EVENT AND wr_clk = '1') THEN
         IF (rst = '1') THEN
            full_xhdl1 <= '0';
         ELSIF ((buf_avail = ZERO) OR (buf_avail = ONE AND wr_en = '1')) THEN
            full_xhdl1 <= '1';
         ELSE
            full_xhdl1 <= '0';
         END IF;
      END IF;
   END PROCESS;
   
   almost_full <= almost_full_int;
   PROCESS (wr_clk)
   BEGIN
      IF (wr_clk'EVENT AND wr_clk = '1') THEN
         IF (rst = '1') THEN
            almost_full_int <= '0';

         ELSIF (buf_avail <=  3 AND wr_en = '1') THEN  --FIFO_DEPTH
         
            almost_full_int <= '1';
         ELSE
            almost_full_int <= '0';
         END IF;
      END IF;
   END PROCESS;
   

   
END trans;


