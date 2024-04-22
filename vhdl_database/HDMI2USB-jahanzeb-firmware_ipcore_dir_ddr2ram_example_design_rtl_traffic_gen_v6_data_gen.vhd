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
-- /___/  \  /    Vendor             : Xilinx
-- \   \   \/     Version            : %version
--  \   \         Application        : MIG
--  /   /         Filename           : v6_data_gen.vhd
-- /___/   /\     Date Last Modified : $Date: 2011/06/02 07:16:43 $
-- \   \  /  \    Date Created       : Jul 03 2009
--  \___\/\___\
--
-- Device       : Virtex6
-- Design Name  : DDR2/DDR3
-- Purpose      : This module generates different data pattern as described in
--                parameter DATA_PATTERN and is set up for Virtex 6 family.
-- Reference    :
-- Revision History:
--*****************************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity v6_data_gen is
   generic (
      EYE_TEST        : string := "FALSE";
      ADDR_WIDTH      : integer := 32;
      MEM_BURST_LEN   : integer := 8;
      BL_WIDTH        : integer := 6;
      DWIDTH          : integer := 288;
      DATA_PATTERN    : string := "DGEN_ALL"; --"DGEN_HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"
      NUM_DQ_PINS     : integer := 72;
      COLUMN_WIDTH    : integer := 10;
      SEL_VICTIM_LINE : integer := 3 -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern
   );
   port (
      clk_i           : in std_logic;
      rst_i           : in std_logic;
      prbs_fseed_i    : in std_logic_vector(31 downto 0);
      data_mode_i     : in std_logic_vector(3 downto 0);
      data_rdy_i      : in std_logic;
      cmd_startA      : in std_logic;
      cmd_startB      : in std_logic;
      cmd_startC      : in std_logic;
      cmd_startD      : in std_logic;
      cmd_startE      : in std_logic;
      m_addr_i        : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
      fixed_data_i    : in std_logic_vector(DWIDTH-1 downto 0);
      addr_i          : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
      user_burst_cnt  : in std_logic_vector(6 downto 0);
      fifo_rdy_i      : in std_logic;
      data_o          : out std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0)
   );
end entity v6_data_gen;

architecture trans of v6_data_gen is

component data_prbs_gen is
   generic (
      EYE_TEST        : string := "FALSE";
      PRBS_WIDTH      : integer := 32;
      SEED_WIDTH      : integer := 32
     );
   port (
      clk_i           : in std_logic;
      clk_en          : in std_logic;
      rst_i           : in std_logic;
      prbs_fseed_i    : in std_logic_vector(31 downto 0);
      prbs_seed_init  : in std_logic;
      prbs_seed_i     : in std_logic_vector(PRBS_WIDTH - 1 downto 0);

      prbs_o          : out std_logic_vector(PRBS_WIDTH - 1 downto 0)
   );
end component;

   constant ALL_0               : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0) := (others => '0');
   signal prbs_data             : std_logic_vector(31 downto 0);
   signal acounts               : std_logic_vector(35 downto 0);
   signal adata                 : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal hdata                 : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal ndata                 : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal w1data                : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal w0data                : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal data                  : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal tstpts                : std_logic_vector(7 downto 0);
   signal burst_count_reached2  : std_logic;
   signal data_valid            : std_logic;
   signal walk_cnt              : std_logic_vector(2 downto 0);
   signal user_address          : std_logic_vector(ADDR_WIDTH - 1 downto 0);
   signal sel_w1gen_logic       : std_logic;
   --signal BLANK                 : std_logic_vector(7 downto 0);
   --signal SHIFT_0               : std_logic_vector(7 downto 0);
   --signal SHIFT_1               : std_logic_vector(7 downto 0);
   --signal SHIFT_2               : std_logic_vector(7 downto 0);
   --signal SHIFT_3               : std_logic_vector(7 downto 0);
   --signal SHIFT_4               : std_logic_vector(7 downto 0);
   --signal SHIFT_5               : std_logic_vector(7 downto 0);
   --signal SHIFT_6               : std_logic_vector(7 downto 0);
   --signal SHIFT_7               : std_logic_vector(7 downto 0);
   signal sel_victimline_r      : std_logic_vector(4 * NUM_DQ_PINS - 1 downto 0);
   signal data_clk_en           : std_logic;
   signal full_prbs_data        : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal h_prbsdata            : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
   signal i                     : integer;
   signal j                     : integer;

   signal data_mode_rr_a        : std_logic_vector(3 downto 0);
   signal data_mode_rr_b        : std_logic_vector(3 downto 0);
   signal data_mode_rr_c        : std_logic_vector(3 downto 0);
   signal prbs_seed_i           : std_logic_vector(31 downto 0);

  function concat ( in1 : integer;
                    in2 : std_logic_vector) return std_logic_vector is
  variable rang : integer := in2'length;
  variable temp : std_logic_vector(in1*rang-1 downto 0);
  begin
    for i in 0 to in1-1 loop
      temp(rang*(i+1)-1 downto rang*i) := in2;
    end loop;

  return temp;
  end function;


  function Data_Gen ( int       : integer
                     ) return std_logic_vector is

    variable data_bus : std_logic_vector(4*NUM_DQ_PINS-1 downto 0) := (others => '0');
    variable j : integer;
  begin
    j := int/2;
      if((int mod 2) = 1) then

       data_bus((0*NUM_DQ_PINS+j*8)+7 downto (0*NUM_DQ_PINS+j*8)) := "00010000";
       data_bus((1*NUM_DQ_PINS+j*8)+7 downto (1*NUM_DQ_PINS+j*8)) := "00100000";
       data_bus((2*NUM_DQ_PINS+j*8)+7 downto (2*NUM_DQ_PINS+j*8)) := "01000000";
       data_bus((3*NUM_DQ_PINS+j*8)+7 downto (3*NUM_DQ_PINS+j*8)) := "10000000";
     else
       data_bus((0*NUM_DQ_PINS+j*8)+7 downto (0*NUM_DQ_PINS+j*8)) := "00000001";
       data_bus((1*NUM_DQ_PINS+j*8)+7 downto (1*NUM_DQ_PINS+j*8)) := "00000010";
       data_bus((2*NUM_DQ_PINS+j*8)+7 downto (2*NUM_DQ_PINS+j*8)) := "00000100";
       data_bus((3*NUM_DQ_PINS+j*8)+7 downto (3*NUM_DQ_PINS+j*8)) := "00001000";
     end if;



    return data_bus;
  end function;

  function Data_GenW0 ( int       : integer) return std_logic_vector is

    variable data_bus : std_logic_vector(4*NUM_DQ_PINS-1 downto 0) := (others => '0');
    variable j : integer;
  begin
    j := int/2;
      if((int mod 2) = 1) then
        data_bus((0*NUM_DQ_PINS+j*8)+7 downto (0*NUM_DQ_PINS+j*8)) := "11101111";
        data_bus((1*NUM_DQ_PINS+j*8)+7 downto (1*NUM_DQ_PINS+j*8)) := "11011111";
        data_bus((2*NUM_DQ_PINS+j*8)+7 downto (2*NUM_DQ_PINS+j*8)) := "10111111";
        data_bus((3*NUM_DQ_PINS+j*8)+7 downto (3*NUM_DQ_PINS+j*8)) := "01111111";
      else
        data_bus((0*NUM_DQ_PINS+j*8)+7 downto (0*NUM_DQ_PINS+j*8)) := "11111110";
        data_bus((1*NUM_DQ_PINS+j*8)+7 downto (1*NUM_DQ_PINS+j*8)) := "11111101";
        data_bus((2*NUM_DQ_PINS+j*8)+7 downto (2*NUM_DQ_PINS+j*8)) := "11111011";
        data_bus((3*NUM_DQ_PINS+j*8)+7 downto (3*NUM_DQ_PINS+j*8)) := "11110111";
      end if;

    return data_bus;
  end function;

  

begin
   data_o         <= data;
   full_prbs_data <= concat(DWIDTH/32,prbs_data);

   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         data_mode_rr_a <= data_mode_i;
         data_mode_rr_b <= data_mode_i;
         data_mode_rr_c <= data_mode_i;
      end if;
   end process;


   process (data_mode_rr_a, h_prbsdata, fixed_data_i, adata, hdata, ndata, w1data, full_prbs_data)
   begin
      case data_mode_rr_a is
         when "0000" =>
            data <= h_prbsdata;
         when "0001" =>     --  "0001" = fixed data
            data <= fixed_data_i;
         when "0010" =>     --  "0010" = address as data
            data <= adata;
         when "0011" =>     --  "0011" = hammer
            data <= hdata;
         when "0100" =>     --  "0100" = neighbour
            data <= ndata;
         when "0101" =>     --  "0101" = walking 1's
            data <= w1data;
            
         when "0110" =>     --  "0110" = walking 0's
            data <= w1data;
         when "0111" =>     --  "0111" = prbs
            data <= full_prbs_data;
         when others =>
            data <= (others => '0');
      end case;
   end process;

--   process (data_mode_rr_a, h_prbsdata, fixed_data_i, adata, hdata, ndata, w1data, full_prbs_data)
--   begin
--      case data_mode_rr_a is
--         when "0000" =>
--            data <= h_prbsdata;
--         when "0001" =>     --  "0001" = fixed data
--             data <= fixed_data_i;
--         when "0010" =>     --  "0010" = address as data
--            data <= adata;
--         when "0011" =>     --  "0011" = hammer
--            data <= hdata;
--         when "0100" =>     --  "0100" = neighbour
--            data <= ndata;
--         when "0111" =>     --  "0111" = prbs
--            data <= full_prbs_data;
--         when others =>
--            data <= w1data;
--      end case;
--   end process;

   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (data_mode_rr_c(2 downto 0) = "101" or data_mode_rr_c(2 downto 0) = "100" or data_mode_rr_c(2 downto 0) = "110") then -- WALKING PATTERN
            sel_w1gen_logic <= '1';
         else
            sel_w1gen_logic <= '0';
         end if;
      end if;
   end process;

   WALKING_ONE_8_PATTERN : if (NUM_DQ_PINS = 8 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if (fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(3) is

                 when '0' =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                   else
                       w1data <= Data_GenW0(0);
                   end if;
                 when '1' =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                   else
                       w1data <= Data_GenW0(1);
                   end if;
                 when others =>
                   w1data <= (others => '0');

                 end case;
               end if;
             elsif (MEM_BURST_LEN = 8) then
               w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
               w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
               w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
               w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
             end if;
           end if;
         end if;
       end process;
     end generate;

   WALKING_ONE_16_PATTERN : if (NUM_DQ_PINS = 16 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(4 downto 3) is

                 when "00" =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                   else
                       w1data <= Data_GenW0(0);
                   end if;

                 when "01" =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                   else
                       w1data <= Data_GenW0(1);
                   end if;

                 when "10" =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(2);
                   else
                       w1data <= Data_GenW0(2);
                   end if;

                 when "11" =>
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                   else
                       w1data <= Data_GenW0(3);
                   end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_24_PATTERN : if (NUM_DQ_PINS = 24 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(7 downto 3) is

                 when "00000" | "00110" | "01100" |
                      "10010" | "11000" | "11110" =>
            --       when  "10010" | "11000"=> 
   
                   if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                   else
                       w1data <= Data_GenW0(0);
                   end if;

                when "00001" | "00111" | "01101" |
                     "10011" | "11001" | "11111" =>
                  if (data_mode_i = "0101") then
                      w1data <= Data_Gen(1);
                  else
                      w1data <= Data_GenW0(1);
                  end if;

                 when "00010" | "01000" | "01110" |  --2,8,14,20,26  
                      "10100" | "11010"           =>
 
                   if (data_mode_i = "0101") then
                         w1data <= Data_Gen(2);
                   else
                       w1data <= Data_GenW0(2);
                   end if;

                 when "00011" | "01001" | "01111" |  --3,9,15,21,27
                    "10101" | "11011"           =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                 else
                     w1data <= Data_GenW0(3);
                 end if;

               when "00100" | "01010" | "10000" |
                    "10110" | "11100"           =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(4);
                 else
                     w1data <= Data_GenW0(4);
                 end if;

               when "00101" | "01011" | "10001" |
                    "10111" | "11101"           =>
                  
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(5);
                 else
                     w1data <= Data_GenW0(5);
                 end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;  -- cmd_startC
         end if; --if ( fifo_rdy_i = '1' or cmd_startC = '1')
       end if;  -- clk
     end process;
   end generate;

   WALKING_ONE_32_PATTERN : if (NUM_DQ_PINS = 32 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(6 downto 4) is

                 when "000" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                 else
                     w1data <= Data_GenW0(0);
                 end if;

                 when "001" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                 else
                     w1data <= Data_GenW0(1);
                 end if;

                 when "010" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(2);
                 else
                     w1data <= Data_GenW0(2);
                 end if;

                 when "011" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                 else
                     w1data <= Data_GenW0(3);
                 end if;

                 when "100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(4);
                 else
                     w1data <= Data_GenW0(4);
                 end if;

                 when "101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(5);
                 else
                     w1data <= Data_GenW0(5);
                 end if;

                 when "110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(6);
                 else
                     w1data <= Data_GenW0(6);
                 end if;

                 when "111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(7);
                 else
                     w1data <= Data_GenW0(7);
                 end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;
--
   WALKING_ONE_40_PATTERN : if (NUM_DQ_PINS = 40 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(7 downto 4) is

                 when "0000" | "1010" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                 else
                     w1data <= Data_GenW0(0);
                 end if;

                 when "0001" | "1011" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                 else
                     w1data <= Data_GenW0(1);
                 end if;

                 when "0010" | "1100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(2);
                 else
                     w1data <= Data_GenW0(2);
                 end if;

                 when "0011" | "1101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                 else
                     w1data <= Data_GenW0(3);
                 end if;

                 when "0100" | "1110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(4);
                 else
                     w1data <= Data_GenW0(4);
                 end if;

                 when "0101" | "1111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(5);
                 else
                     w1data <= Data_GenW0(7);
                 end if;

                 when "0110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(6);
                 else
                     w1data <= Data_GenW0(6);
                 end if;

                 when "0111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(7);
                 else
                     w1data <= Data_GenW0(7);
                 end if;

                 when "1000" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(8);
                 else
                     w1data <= Data_GenW0(8);
                 end if;

                 when "1001" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(9);
                 else
                     w1data <= Data_GenW0(9);
                 end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_48_PATTERN : 
   if (NUM_DQ_PINS = 48 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(7 downto 4) is

                 when "0000" | "1100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                 else
                     w1data <= Data_GenW0(0);
                 end if;

                 when "0001" | "1101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                 else
                     w1data <= Data_GenW0(1);
                 end if;

                 when "0010" | "1110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(2);
                 else
                     w1data <= Data_GenW0(2);
                 end if;

                 when "0011" | "1111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                 else
                     w1data <= Data_GenW0(3);
                 end if;

                 when "0100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(4);
                 else
                     w1data <= Data_GenW0(4);
                 end if;

                 when "0101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(5);
                 else
                     w1data <= Data_GenW0(5);
                 end if;

                 when "0110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(6);
                 else
                     w1data <= Data_GenW0(6);
                 end if;

                 when "0111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(7);
                 else
                     w1data <= Data_GenW0(7);
                 end if;

                 when "1000" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(8);
                 else
                     w1data <= Data_GenW0(8);
                 end if;

                 when "1001" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(9);
                 else
                     w1data <= Data_GenW0(9);
                 end if;

                 when "1010" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(10);
                 else
                     w1data <= Data_GenW0(10);
                 end if;

                 when "1011" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(11);
                 else
                     w1data <= Data_GenW0(11);
                 end if;
--
                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;


WALKING_ONE_56_PATTERN:
    if (NUM_DQ_PINS = 56 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(8 downto 5) is

                 when "0000" | "1110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(0);
                 else
                     w1data <= Data_GenW0(0);
                 end if;


                 when "0001" | "1111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(1);
                 else
                     w1data <= Data_GenW0(1);
                 end if;


                 when "0010" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(2);
                 else
                     w1data <= Data_GenW0(2);
                 end if;


                 when "0011" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(3);
                 else
                     w1data <= Data_GenW0(3);
                 end if;
                 when "0100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(4);
                 else 
                     w1data <= Data_GenW0(4);
                 end if;

                 when "0101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(5);
                 else
                     w1data <= Data_GenW0(5);
                 end if;

                 when "0110" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(6);
                 else 
                     w1data <= Data_GenW0(6);
                 end if;

                 when "0111" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(7);
                 else
                     w1data <= Data_GenW0(7);
                 end if;

                 when "1000" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(8);
                 else
                     w1data <= Data_GenW0(8);
                 end if;

                 when "1001" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(9);
                 else
                     w1data <= Data_GenW0(9);
                 end if;

                 when "1010" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(10);
                 else
                     w1data <= Data_GenW0(10);
                 end if;
                 when "1011" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(11);
                 else
                     w1data <= Data_GenW0(11);
                 end if;

                 when "1100" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(12);
                 else
                     w1data <= Data_GenW0(12);
                 end if;

                 when "1101" =>
                 if (data_mode_i = "0101") then
                       w1data <= Data_Gen(13);
                 else
                     w1data <= Data_GenW0(13);
                 end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;
--
WALKING_ONE_64_PATTERN :
if (NUM_DQ_PINS = 64 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(8 downto 5) is

                 when "0000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(0);
                     else
                         w1data <= Data_GenW0(0);
                     end if;

                 when "0001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(1);
                     else
                         w1data <= Data_GenW0(1);
                     end if;

                 when "0010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(2);
                     else
                         w1data <= Data_GenW0(2);
                     end if;

                 when "0011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(3);
                     else
                         w1data <= Data_GenW0(3);
                     end if;

                 when "0100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(4);
                     else
                         w1data <= Data_GenW0(4);
                     end if;

                 when "0101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(5);
                     else
                         w1data <= Data_GenW0(5);
                     end if;

                 when "0110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(6);
                     else
                         w1data <= Data_GenW0(6);
                     end if;

                 when "0111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(7);
                     else
                         w1data <= Data_GenW0(7);
                     end if;

                 when "1000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(8);
                     else
                         w1data <= Data_GenW0(8);
                     end if;

                 when "1001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(9);
                     else
                         w1data <= Data_GenW0(9);
                     end if;

                 when "1010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(10);
                     else
                         w1data <= Data_GenW0(10);
                     end if;

                 when "1011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(11);
                     else
                         w1data <= Data_GenW0(11);
                     end if;

                 when "1100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(12);
                     else
                         w1data <= Data_GenW0(12);
                     end if;

                 when "1101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(13);
                     else
                         w1data <= Data_GenW0(13);
                     end if;

                 when "1110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(14);
                     else
                         w1data <= Data_GenW0(14);
                     end if;

                 when "1111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(15);
                     else
                         w1data <= Data_GenW0(15);
                     end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;
WALKING_ONE_72_PATTERN :
   if (NUM_DQ_PINS = 72 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "10010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(0);
                     else
                         w1data <= Data_GenW0(0);
                     end if;

                 when "00001" | "10011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(1);
                     else
                         w1data <= Data_GenW0(1);
                     end if;

                 when "00010" | "10100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(2);
                     else
                         w1data <= Data_GenW0(2);
                     end if;

                 when "00011" | "10101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(3);
                     else
                         w1data <= Data_GenW0(3);
                     end if;

                 when "00100" | "10110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(4);
                     else
                         w1data <= Data_GenW0(4);
                     end if;

                 when "00101" | "10111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(5);
                     else
                         w1data <= Data_GenW0(5);
                     end if;

                 when "00110" | "11000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(6);
                     else
                         w1data <= Data_GenW0(6);
                     end if;

                 when "00111" | "11001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(7);
                     else
                         w1data <= Data_GenW0(7);
                     end if;

                 when "01000" | "11010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(8);
                     else
                         w1data <= Data_GenW0(8);
                     end if;

                 when "01001" | "11011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(9);
                     else
                         w1data <= Data_GenW0(9);
                     end if;

                 when "01010" |  "11100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(10);
                     else
                         w1data <= Data_GenW0(10);
                     end if;

                 when "01011" | "11101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(11);
                     else
                         w1data <= Data_GenW0(11);
                     end if;

                 when "01100" | "11110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(12);
                     else
                         w1data <= Data_GenW0(12);
                     end if;

                 when "01101" | "11111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(13);
                     else
                         w1data <= Data_GenW0(13);
                     end if;

                 when "01110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(14);
                     else
                         w1data <= Data_GenW0(14);
                     end if;

                 when "01111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(15);
                     else
                         w1data <= Data_GenW0(15);
                     end if;

                 when "10000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(16);
                     else
                         w1data <= Data_GenW0(16);
                     end if;

                 when "10001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(17);
                     else
                         w1data <= Data_GenW0(17);
                     end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

WALKING_ONE_80_PATTERN :

   if (NUM_DQ_PINS = 80 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "10100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(0);
                     else
                         w1data <= Data_GenW0(0);
                     end if;

                 when "00001" | "10101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(1);
                     else
                         w1data <= Data_GenW0(1);
                     end if;

                 when "00010" | "10110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(2);
                     else
                         w1data <= Data_GenW0(2);
                     end if;

                 when "00011" | "10111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(3);
                     else
                         w1data <= Data_GenW0(3);
                     end if;

                 when "00100" | "11000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(4);
                     else
                         w1data <= Data_GenW0(4);
                     end if;

                 when "00101" | "11001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(5);
                     else
                         w1data <= Data_GenW0(5);
                     end if;

                 when "00110" | "11010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(6);
                     else
                         w1data <= Data_GenW0(6);
                     end if;

                 when "00111" | "11011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(7);
                     else
                         w1data <= Data_GenW0(7);
                     end if;

                 when "01000" | "11100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(8);
                     else
                         w1data <= Data_GenW0(8);
                     end if;

                 when "01001" | "11101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(9);
                     else
                         w1data <= Data_GenW0(9);
                     end if;

                 when "01010" |  "11110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(10);
                     else
                         w1data <= Data_GenW0(10);
                     end if;

                 when "01011" | "11111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(11);
                     else
                         w1data <= Data_GenW0(11);
                     end if;

                 when "01100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(12);
                     else
                         w1data <= Data_GenW0(12);
                     end if;

                 when "01101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(13);
                     else
                         w1data <= Data_GenW0(13);
                     end if;

                 when "01110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(14);
                     else
                         w1data <= Data_GenW0(14);
                     end if;

                 when "01111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(15);
                     else
                         w1data <= Data_GenW0(15);
                     end if;

                 when "10000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(16);
                     else
                         w1data <= Data_GenW0(16);
                     end if;

                 when "10001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(17);
                     else
                         w1data <= Data_GenW0(17);
                     end if;

                 when "10010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(18);
                     else
                         w1data <= Data_GenW0(18);
                     end if;

                 when "10011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(19);
                     else
                         w1data <= Data_GenW0(19);
                     end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

WALKING_ONE_88_PATTERN:
     if (NUM_DQ_PINS = 88 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" | "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" | "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" | "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" | "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" | "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" | "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" | "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" | "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;

                 when "01001" | "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;


WALKING_ONE_96_PATTERN:
     if (NUM_DQ_PINS = 96 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" | "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" | "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" | "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" | "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" | "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" | "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" | "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else 
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;

                 when "01001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(22);
                       else
                           w1data <= Data_GenW0(22);
                       end if;

                 when "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_104_PATTERN:
     if (NUM_DQ_PINS = 104 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" | "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" | "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" | "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" | "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" | "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;

                 when "01001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(22);
                       else
                           w1data <= Data_GenW0(22);
                       end if;

                 when "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;

                 when "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(24);
                       else
                           w1data <= Data_GenW0(24);
                       end if;

                 when "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_112_PATTERN:
      if (NUM_DQ_PINS = 112 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" | "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" | "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" | "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;

                 when "01001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(22);
                       else
                           w1data <= Data_GenW0(22);
                       end if;

                 when "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;

                 when "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(24);
                       else
                           w1data <= Data_GenW0(24);
                       end if;

                 when "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;

                 when "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(26);
                       else
                           w1data <= Data_GenW0(26);
                       end if;

                 when "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(27);
                       else
                           w1data <= Data_GenW0(27);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_120_PATTERN:
      if (NUM_DQ_PINS = 120 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(9 downto 5) is

                 when "00000" | "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" | "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if; 

                 when "01001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(22);
                       else
                           w1data <= Data_GenW0(22);
                       end if;

                 when "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;

                 when "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(24);
                       else
                           w1data <= Data_GenW0(24);
                       end if;

                 when "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;

                 when "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(26);
                       else
                           w1data <= Data_GenW0(26);
                       end if;

                 when "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(27);
                       else
                           w1data <= Data_GenW0(27);
                       end if;

                 when "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(28);
                       else
                           w1data <= Data_GenW0(28);
                       end if;

                 when "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(29);
                       else
                           w1data <= Data_GenW0(29);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_128_PATTERN:
     if (NUM_DQ_PINS = 128 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(10 downto 6) is

                 when "00000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "00001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else
                           w1data <= Data_GenW0(1);
                       end if;

                 when "00010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "00011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "00100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "00101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "00110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;

                 when "00111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;

                 when "01000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;

                 when "01001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;

                 when "01010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;

                 when "01011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;

                 when "01100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;

                 when "01101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;

                 when "01110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;

                 when "01111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;

                 when "10000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(16);
                       else
                           w1data <= Data_GenW0(16);
                       end if;

                 when "10001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(17);
                       else
                           w1data <= Data_GenW0(17);
                       end if;

                 when "10010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(18);
                       else
                           w1data <= Data_GenW0(18);
                       end if;

                 when "10011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(19);
                       else
                           w1data <= Data_GenW0(19);
                       end if;

                 when "10100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(20);
                       else
                           w1data <= Data_GenW0(20);
                       end if;

                 when "10101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(21);
                       else
                           w1data <= Data_GenW0(21);
                       end if;

                 when "10110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(22);
                       else
                           w1data <= Data_GenW0(22);
                       end if;

                 when "10111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;

                 when "11000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(24);
                       else
                           w1data <= Data_GenW0(24);
                       end if;

                 when "11001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;

                 when "11010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(26);
                       else
                           w1data <= Data_GenW0(26);
                       end if;

                 when "11011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(27);
                       else
                           w1data <= Data_GenW0(27);
                       end if;

                 when "11100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(28);
                       else
                           w1data <= Data_GenW0(28);
                       end if;

                 when "11101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(29);
                       else
                           w1data <= Data_GenW0(29);
                       end if;

                 when "11110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(30);
                       else
                           w1data <= Data_GenW0(30);
                       end if;

                 when "11111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(31);
                       else
                           w1data <= Data_GenW0(31);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_136_PATTERN:
     if (NUM_DQ_PINS = 136 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(11 downto 6) is

                 when "000000"  =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

               when "000001" | "100011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(1);
                     else
                         w1data <= Data_GenW0(1);
                     end if;

               when "000010" | "100100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(2);
                     else
                         w1data <= Data_GenW0(2);
                     end if;
           
               when "000011" | "100101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(3);
                     else
                         w1data <= Data_GenW0(3);
                     end if;
           
               when "000100" | "100110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(4);
                     else 
                         w1data <= Data_GenW0(4);
                     end if;
           
               when "000101" | "100111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(5);
                     else
                         w1data <= Data_GenW0(5);
                     end if;
           
               when "000110" | "101000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(6);
                     else
                         w1data <= Data_GenW0(6);
                     end if;
           
               when "000111" | "101001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(7);
                     else
                         w1data <= Data_GenW0(7);
                     end if;
           
               when "001000" | "101010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(8);
                     else
                         w1data <= Data_GenW0(8);
                     end if;
           
                 when "001001" | "101011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;
           
                 when "001010" | "101100" =>
                       if (data_mode_i = "0101") then
                           w1data <= Data_Gen(10);
                     else
                         w1data <= Data_GenW0(10);
                     end if;
           
               when "001011" | "101101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(11);
                     else
                         w1data <= Data_GenW0(11);
                     end if;
           
               when "001100" | "101110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(12);
                     else
                         w1data <= Data_GenW0(12);
                     end if;
           
               when "001101" | "101111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(13);
                     else
                         w1data <= Data_GenW0(13);
                     end if;
           
               when "001110" | "110000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(14);
                     else
                         w1data <= Data_GenW0(14);
                     end if;
           
               when "001111" | "110001" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(15);
                     else
                         w1data <= Data_GenW0(15);
                     end if;
           
               when "010000" | "110010" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(16);
                     else
                         w1data <= Data_GenW0(16);
                     end if;
           
               when "010001" | "110011" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(17);
                     else
                         w1data <= Data_GenW0(17);
                     end if;
           
               when "010010" | "110100" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(18);
                     else
                         w1data <= Data_GenW0(18);
                     end if;
           
               when "010011" | "110101" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(19);
                     else
                         w1data <= Data_GenW0(19);
                     end if;
           
               when "010100" | "110110" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(20);
                     else
                         w1data <= Data_GenW0(20);
                     end if;
           
               when "010101" | "110111" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(21);
                     else
                         w1data <= Data_GenW0(21);
                     end if;
           
               when "010110" | "111000" =>
                     if (data_mode_i = "0101") then
                           w1data <= Data_Gen(22);
                     else
                         w1data <= Data_GenW0(22);
                     end if;
           
               when "010111" | "111001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(23);
                       else
                           w1data <= Data_GenW0(23);
                       end if;
        
                 when "011000" | "111010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(24);
                       else
                           w1data <= Data_GenW0(24);
                       end if;
        
                 when "011001" | "111011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;
        
                 when "011010" | "111100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(26);
                       else
                           w1data <= Data_GenW0(26);
                       end if;
        
                 when "011011" | "111101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(27);
                       else
                           w1data <= Data_GenW0(27);
                       end if;
        
                 when "011100" | "111110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(28);
                       else
                           w1data <= Data_GenW0(28);
                       end if;
        
                 when "011101" | "111111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(29);
                       else
                           w1data <= Data_GenW0(29);
                       end if;
        
                 when "011110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(30);
                       else
                           w1data <= Data_GenW0(30);
                       end if;
        
                 when "011111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(31);
                       else
                           w1data <= Data_GenW0(31);
                       end if;
        
                 when "100000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(32);
                       else
                           w1data <= Data_GenW0(32);
                       end if;
        
                 when "100001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(33);
                       else
                           w1data <= Data_GenW0(33);
                       end if;

                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;

   WALKING_ONE_144_PATTERN:
      if (NUM_DQ_PINS = 144 and (DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_NEIGHBOR" or DATA_PATTERN = "DGEN_ALL")) generate

     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if ( fifo_rdy_i = '1' or cmd_startC = '1') then
           if (cmd_startC = '1') then
             if (sel_w1gen_logic = '1') then
               case addr_i(11 downto 6) is

                 when "000000" | "100100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(0);
                       else
                           w1data <= Data_GenW0(0);
                       end if;

                 when "000001" | "100101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(1);
                       else 
                           w1data <= Data_GenW0(1);
                       end if;

                 when "000010" | "100110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(2);
                       else
                           w1data <= Data_GenW0(2);
                       end if;

                 when "000011" | "100111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(3);
                       else
                           w1data <= Data_GenW0(3);
                       end if;

                 when "000100" | "101000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(4);
                       else
                           w1data <= Data_GenW0(4);
                       end if;

                 when "000101" | "101001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(5);
                       else
                           w1data <= Data_GenW0(5);
                       end if;

                 when "000110" | "101010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(6);
                       else
                           w1data <= Data_GenW0(6);
                       end if;
                 when "000111" | "101011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(7);
                       else
                           w1data <= Data_GenW0(7);
                       end if;
         
                 when "001000" | "101100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(8);
                       else
                           w1data <= Data_GenW0(8);
                       end if;
         
                 when "001001" | "101101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(9);
                       else
                           w1data <= Data_GenW0(9);
                       end if;
         
                 when "001010" | "101110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(10);
                       else
                           w1data <= Data_GenW0(10);
                       end if;
         
                 when "001011" | "101111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(11);
                       else
                           w1data <= Data_GenW0(11);
                       end if;
         
                 when "001100" | "110000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(12);
                       else
                           w1data <= Data_GenW0(12);
                       end if;
         
                 when "001101" | "110001" =>
                     if (data_mode_i = "0101") then
                             w1data <= Data_Gen(13);
                       else
                           w1data <= Data_GenW0(13);
                       end if;
         
                 when "001110" | "110010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(14);
                       else
                           w1data <= Data_GenW0(14);
                       end if;
         
                 when "001111" | "110011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(15);
                       else
                           w1data <= Data_GenW0(15);
                       end if;
         
                when "010000" | "110100" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(16);
                      else
                          w1data <= Data_GenW0(16);
                      end if;
         
                when "010001" | "110101" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(17);
                      else
                          w1data <= Data_GenW0(17);
                      end if;
         
                when "010010" | "110110" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(18);
                      else
                          w1data <= Data_GenW0(18);
                      end if;
         
                when "010011" | "110111" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(19);
                      else
                          w1data <= Data_GenW0(19);
                      end if;
         
                when "010100" | "111000" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(20);
                      else
                          w1data <= Data_GenW0(20);
                      end if;
         
                when "010101" | "111001" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(21);
                      else
                          w1data <= Data_GenW0(21);
                      end if;
         
                when "010110" | "111010" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(22);
                      else
                          w1data <= Data_GenW0(22);
                      end if;
         
                when "010111" | "111011" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(23);
                      else
                          w1data <= Data_GenW0(23);
                      end if;
         
                when "011000" | "111100" =>
                      if (data_mode_i = "0101") then
                            w1data <= Data_Gen(24);
                      else
                          w1data <= Data_GenW0(24);
                      end if;
         
                 when "011001" | "111101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(25);
                       else
                           w1data <= Data_GenW0(25);
                       end if;
         
                 when "011010" | "111110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(26);
                       else
                           w1data <= Data_GenW0(26);
                       end if;
         
                 when "011011" | "111111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(27);
                       else
                           w1data <= Data_GenW0(27);
                       end if;
         
                 when "011100" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(28);
                       else
                           w1data <= Data_GenW0(28);
                       end if;
         
                 when "011101" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(29);
                       else
                           w1data <= Data_GenW0(29);
                       end if;
         
                 when "011110" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(30);
                       else
                           w1data <= Data_GenW0(30);
                       end if;
         
                 when "011111" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(31);
                       else
                           w1data <= Data_GenW0(31);
                       end if;
         
                 when "100000" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(32);
                       else
                           w1data <= Data_GenW0(32);
                       end if;
         
                 when "100001" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(33);
                       else
                           w1data <= Data_GenW0(33);
                       end if;
         
                 when "100010" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(34);
                       else
                           w1data <= Data_GenW0(34);
                       end if;
         
                 when "100011" =>
                       if (data_mode_i = "0101") then
                             w1data <= Data_Gen(35);
                       else
                           w1data <= Data_GenW0(35);
                       end if;
         
                 when others =>
                   w1data <= (others => '0');

               end case;
             end if;
           elsif (MEM_BURST_LEN = 8) then
             w1data(4 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS) <= (w1data(4 * NUM_DQ_PINS - 5 downto 3 * NUM_DQ_PINS) & w1data(4 * NUM_DQ_PINS - 1 downto 4 * NUM_DQ_PINS - 4));
             w1data(3 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS) <= (w1data(3 * NUM_DQ_PINS - 5 downto 2 * NUM_DQ_PINS) & w1data(3 * NUM_DQ_PINS - 1 downto 3 * NUM_DQ_PINS - 4));
             w1data(2 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS) <= (w1data(2 * NUM_DQ_PINS - 5 downto 1 * NUM_DQ_PINS) & w1data(2 * NUM_DQ_PINS - 1 downto 2 * NUM_DQ_PINS - 4));
             w1data(1 * NUM_DQ_PINS - 1 downto 0 * NUM_DQ_PINS) <= (w1data(1 * NUM_DQ_PINS - 5 downto 0 * NUM_DQ_PINS) & w1data(1 * NUM_DQ_PINS - 1 downto 1 * NUM_DQ_PINS - 4));
           end if;
         end if;
       end if;
     end process;
   end generate;


   process (clk_i)
   begin
     if (clk_i'event and clk_i = '1') then
       for i in 0 to  4 * NUM_DQ_PINS - 1 loop
         if (i = SEL_VICTIM_LINE or (i - NUM_DQ_PINS) = SEL_VICTIM_LINE or (i - (NUM_DQ_PINS * 2)) = SEL_VICTIM_LINE or (i - (NUM_DQ_PINS * 3)) = SEL_VICTIM_LINE) then
           hdata(i) <= '1';
         elsif (i >= 0 and i <= 1 * NUM_DQ_PINS - 1) then
           hdata(i) <= '1';
         elsif (i >= 1 * NUM_DQ_PINS and i <= 2 * NUM_DQ_PINS - 1) then
           hdata(i) <= '0';
         elsif (i >= 2 * NUM_DQ_PINS and i <= 3 * NUM_DQ_PINS - 1) then
           hdata(i) <= '1';
         elsif (i >= 3 * NUM_DQ_PINS and i <= 4 * NUM_DQ_PINS - 1) then
           hdata(i) <= '0';
         else
           hdata(i) <= '1';
         end if;
       end loop;
     end if;
   end process;

   process (w1data, hdata)
   begin
      for i in 0 to 4 * NUM_DQ_PINS - 1 loop
         ndata(i) <= hdata(i) xor w1data(i);
      end loop;
   end process;

   process (full_prbs_data, hdata)
   begin
     for i in 0 to  4 * NUM_DQ_PINS - 1 loop
       if (i = SEL_VICTIM_LINE or (i - NUM_DQ_PINS) = SEL_VICTIM_LINE or (i - (NUM_DQ_PINS * 2)) = SEL_VICTIM_LINE or (i - (NUM_DQ_PINS * 3)) = SEL_VICTIM_LINE) then
         h_prbsdata(i) <= full_prbs_data(SEL_VICTIM_LINE);
       else
         h_prbsdata(i) <= hdata(i);
       end if;
     end loop;
   end process;

   addr_pattern : if (DATA_PATTERN = "DGEN_ADDR" or DATA_PATTERN = "DGEN_ALL") generate
     process (clk_i)
     begin
       if (clk_i'event and clk_i = '1') then
         if (cmd_startD = '1') then
           acounts <= ("0000" & addr_i);
         elsif (fifo_rdy_i = '1' and data_rdy_i = '1' and MEM_BURST_LEN = 8 ) then
           if (NUM_DQ_PINS = 8 ) then
             acounts <= acounts + X"000000004";
           elsif (NUM_DQ_PINS = 16 and NUM_DQ_PINS < 32) then
             acounts <= acounts + X"000000008";
           elsif (NUM_DQ_PINS >= 32 and NUM_DQ_PINS < 64) then
             acounts <= acounts +  X"000000010";
           elsif (NUM_DQ_PINS >= 64 and NUM_DQ_PINS < 128) then
             acounts <= acounts + X"000000020";
           elsif (NUM_DQ_PINS >= 128 and NUM_DQ_PINS < 256) then
             acounts <= acounts + X"000000040";
           end if;
         end if;
       end if;
     end process;

     adata <= concat(DWIDTH/32,acounts(31 downto 0)); -- DWIDTH = 4 * NUM_DQ_PINS

     end generate;

     -- When doing eye_test, traffic gen only does write and want to
     -- keep the prbs random and address is fixed at a location.
     d_clk_en1 : if (EYE_TEST = "TRUE") generate
        data_clk_en <= '1'; --fifo_rdy_i && data_rdy_i && user_burst_cnt > 6'd1;
     end generate;

     d_clk_en2 : if (EYE_TEST = "FALSE") generate
        data_clk_en <= (fifo_rdy_i and data_rdy_i) when (user_burst_cnt > "0000001") else '0';
     end generate;

     prbs_pattern : if (DATA_PATTERN = "DGEN_PRBS" or DATA_PATTERN = "DGEN_ALL") generate

        -- PRBS DATA GENERATION
        -- xor all the tap positions before feedback to 1st stage.
        prbs_seed_i <= (m_addr_i(6) & m_addr_i(31) & m_addr_i(8) & m_addr_i(22) & m_addr_i(9) & m_addr_i(24) & m_addr_i(21) & m_addr_i(23) & m_addr_i(18) & m_addr_i(10) & m_addr_i(20) & m_addr_i(17) & m_addr_i(13) & m_addr_i(16) & m_addr_i(12) & m_addr_i(4) & m_addr_i(15 downto 0)); --(m_addr_i[31:0]),

        data_prbs_gen_inst : data_prbs_gen
           generic map (
              PRBS_WIDTH  => 32,
              SEED_WIDTH  => 32,
              EYE_TEST    => EYE_TEST
           )
           port map (
              clk_i           => clk_i,
              rst_i           => rst_i,
              clk_en          => data_clk_en,
              prbs_fseed_i    => prbs_fseed_i,
              prbs_seed_init  => cmd_startE,
              prbs_seed_i     => prbs_seed_i,
              prbs_o          => prbs_data
           );

     end generate;

end architecture trans;
