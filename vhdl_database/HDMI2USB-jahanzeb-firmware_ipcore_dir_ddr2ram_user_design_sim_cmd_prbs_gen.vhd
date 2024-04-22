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
--  /   /         Filename: cmd_prbs_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:37 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose:  This moduel use LFSR to generate random address, isntructions 
--          or burst_length.
-- Reference:
-- Revision History:

--*****************************************************************************


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;


ENTITY cmd_prbs_gen IS
   GENERIC (
      TCQ                  : time := 100 ps;   
      FAMILY               : STRING := "SPARTAN6";
      ADDR_WIDTH           : INTEGER := 29;
      DWIDTH               : INTEGER := 32;
      PRBS_CMD             : STRING := "ADDRESS";
      PRBS_WIDTH           : INTEGER := 64;
      SEED_WIDTH           : INTEGER := 32;      

      PRBS_EADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"FFFFD000";
      PRBS_SADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_EADDR           : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_SADDR           : std_logic_vector(31 downto 0)  := X"00002000"
   );
   PORT (
      
      clk_i                : IN STD_LOGIC;
      prbs_seed_init       : IN STD_LOGIC;
      clk_en               : IN STD_LOGIC;
      prbs_seed_i          : IN STD_LOGIC_VECTOR(SEED_WIDTH - 1 DOWNTO 0);
      
      prbs_o               : OUT STD_LOGIC_VECTOR(SEED_WIDTH - 1 DOWNTO 0)
   );
END cmd_prbs_gen;

ARCHITECTURE trans OF cmd_prbs_gen IS
   SIGNAL ZEROS  : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
   SIGNAL prbs   : STD_LOGIC_VECTOR(SEED_WIDTH - 1 DOWNTO 0);
   SIGNAL lfsr_q : STD_LOGIC_VECTOR(PRBS_WIDTH DOWNTO 1);

 function logb2 (val : integer) return integer is
  variable vec_con : integer;
  variable rtn : integer := 1;
  begin
    vec_con  := val;
    for index in 0 to 31 loop
      if(vec_con = 1) then
        rtn := rtn + 1;
        return(rtn);
      end if;
      vec_con := vec_con/2;
      rtn := rtn + 1;
    end loop;
  end function logb2;


BEGIN
   
   ZEROS <= std_logic_vector(to_unsigned(0,ADDR_WIDTH));
   
   xhdl0 : IF (PRBS_CMD = "ADDRESS" AND PRBS_WIDTH = 64) GENERATE
      
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (prbs_seed_init = '1') THEN
               lfsr_q <= ('0' & ("0000000000000000000000000000000" & prbs_seed_i)) ;
            ELSIF (clk_en = '1') THEN
               lfsr_q(64) <= lfsr_q(64) XOR lfsr_q(63) ;
               lfsr_q(63) <= lfsr_q(62) ;
               lfsr_q(62) <= lfsr_q(64) XOR lfsr_q(61) ;
               
               lfsr_q(61) <= lfsr_q(64) XOR lfsr_q(60) ;
               
               lfsr_q(60 DOWNTO 2) <= lfsr_q(59 DOWNTO 1) ;
               lfsr_q(1) <= lfsr_q(64) ;
            END IF;
         END IF;
      END PROCESS;
      
      
      PROCESS (lfsr_q(32 DOWNTO 1))
      BEGIN
         prbs <= lfsr_q(32 DOWNTO 1);
      END PROCESS;
      
   END GENERATE;
   
   
   xhdl1 : IF (PRBS_CMD = "ADDRESS" AND PRBS_WIDTH = 32) GENERATE
      
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (prbs_seed_init = '1') THEN
               lfsr_q <= prbs_seed_i ;
            ELSIF (clk_en = '1') THEN
               
               lfsr_q(32 DOWNTO 9) <= lfsr_q(31 DOWNTO 8) ;
               lfsr_q(8) <= lfsr_q(32) XOR lfsr_q(7) ;
               lfsr_q(7) <= lfsr_q(32) XOR lfsr_q(6) ;
               
               lfsr_q(6 DOWNTO 4) <= lfsr_q(5 DOWNTO 3) ;
               lfsr_q(3) <= lfsr_q(32) XOR lfsr_q(2) ;
               lfsr_q(2) <= lfsr_q(1) ;
               
               lfsr_q(1) <= lfsr_q(32) ;
            END IF;
         END IF;
      END PROCESS;
      
      
      
      PROCESS (lfsr_q(32 DOWNTO 1))
      BEGIN

        IF (FAMILY = "SPARTAN6") THEN
          FOR i IN (logb2(DWIDTH) + 1) TO  SEED_WIDTH - 1 LOOP
            IF (PRBS_SADDR_MASK_POS(i) = '1') THEN
                          prbs(i) <= PRBS_SADDR(i) OR lfsr_q(i + 1);
            ELSIF (PRBS_EADDR_MASK_POS(i) = '1') THEN
                          prbs(i) <= PRBS_EADDR(i) AND lfsr_q(i + 1);
            ELSE
              prbs(i) <= lfsr_q(i + 1);
            END IF;
          END LOOP;
          prbs(logb2(DWIDTH) downto 0) <= (others => '0');
        ELSE 
          FOR i IN (logb2(DWIDTH) - 4) TO  SEED_WIDTH - 1 LOOP
            IF (PRBS_SADDR_MASK_POS(i) = '1') THEN
                          prbs(i) <= PRBS_SADDR(i) OR lfsr_q(i + 1);
            ELSIF (PRBS_EADDR_MASK_POS(i) = '1') THEN
                          prbs(i) <= PRBS_EADDR(i) AND lfsr_q(i + 1);
            ELSE
              prbs(i) <= lfsr_q(i + 1);
            END IF;
          END LOOP;
         prbs(logb2(DWIDTH) downto 0) <= (others => '0');
        END IF;

      END PROCESS;
      
      
   END GENERATE;
   
   
   xhdl2 : IF (PRBS_CMD = "INSTR" OR PRBS_CMD = "BLEN") GENERATE
      
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (prbs_seed_init = '1') THEN
               lfsr_q <= ("00000" & prbs_seed_i(14 DOWNTO 0)) ;
            ELSIF (clk_en = '1') THEN
               
               lfsr_q(20) <= lfsr_q(19) ;
               
               lfsr_q(19) <= lfsr_q(18) ;
               
               lfsr_q(18) <= lfsr_q(20) XOR lfsr_q(17) ;
               lfsr_q(17 DOWNTO 2) <= lfsr_q(16 DOWNTO 1) ;
               
               lfsr_q(1) <= lfsr_q(20) ;
            END IF;
         END IF;
      END PROCESS;
      
      
      PROCESS (lfsr_q(SEED_WIDTH - 1 DOWNTO 1), ZEROS)
      BEGIN
            prbs <= (ZEROS(SEED_WIDTH - 1 DOWNTO 6) & lfsr_q(6 DOWNTO 1));
      END PROCESS;
      
      
   END GENERATE;
   
   prbs_o <= prbs;
   
END trans;



