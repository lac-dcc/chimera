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
--  /   /         Filename: iodrp_controller.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:17:25 $
-- \   \  /  \    Date Created: Mon Feb 9 2009
--  \___\/\___\
--
--Device: Spartan6
--Design Name: DDR/DDR2/DDR3/LPDDR
--Purpose:  Xilinx reference design for IODRP controller for v0.9 device
--
--Reference:
--
--    Revision: Date:       Comment
--    1.0:      02/06/09:   Initial version for MIG wrapper.
--    1.1:      02/01/09:   updates to indentations.
--    1.2:      02/12/09:   changed non-blocking assignments to blocking ones
--                          for state machine always block.  Also, assigned
--                          intial value to load_shift_n to avoid latch
-- End Revision
--*******************************************************************************

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;

entity iodrp_controller is
      --output to IODRP SDI pin
      --input from IODRP SDO pin
      
      -- Register where memcell_address is captured during the READY state
      -- Register which stores the write data until it is ready to be shifted out
      -- The shift register which shifts out SDO and shifts in SDI.
      -- This register is loaded before the address or data phase, but continues
      -- to shift for a writeback of read data
      -- The signal which causes shift_through_reg to load the new value from data_out_mux, or continue to shift data in from DRP_SDO
      -- The signal which indicates where the shift_through_reg should load from.  0 -> data_reg  1 -> memcell_addr_reg
      -- The counter for which bit is being shifted during address or data phase
      -- This is set after the first address phase has executed
      
      --  (* FSM_ENCODING="GRAY" *) reg [2:0] state, nextstate;
      
      -- The mux which selects between data_reg and memcell_addr_reg for sending to shift_through_reg
      -- added so that DRP_SDI output is only active when DRP_CS is active
      
   port (
      memcell_address    : in std_logic_vector(7 downto 0);
      write_data         : in std_logic_vector(7 downto 0);
      read_data          : out std_logic_vector(7 downto 0);
      rd_not_write       : in std_logic;
      cmd_valid          : in std_logic;
      rdy_busy_n         : out std_logic;
      use_broadcast      : in std_logic;
      sync_rst           : in std_logic;
      DRP_CLK            : in std_logic;
      DRP_CS             : out std_logic;
      DRP_SDI            : out std_logic;
      DRP_ADD            : out std_logic;
      DRP_BKST           : out std_logic;
      DRP_SDO            : in std_logic
   );
end entity iodrp_controller;

architecture trans of iodrp_controller is


     constant READY              : std_logic_vector(2 downto 0) := "000";
     constant DECIDE             : std_logic_vector(2 downto 0) := "001";
     constant ADDR_PHASE         : std_logic_vector(2 downto 0) := "010";
     constant ADDR_TO_DATA_GAP   : std_logic_vector(2 downto 0) := "011";
     constant ADDR_TO_DATA_GAP2  : std_logic_vector(2 downto 0) := "100";
     constant ADDR_TO_DATA_GAP3  : std_logic_vector(2 downto 0) := "101";
     constant DATA_PHASE         : std_logic_vector(2 downto 0) := "110";
     constant ALMOST_READY       : std_logic_vector(2 downto 0) := "111";
      
     constant IOI_DQ0            : std_logic_vector(4 downto 0) := "00001"; 
     constant IOI_DQ1            : std_logic_vector(4 downto 0) := "00000"; 
     constant IOI_DQ2            : std_logic_vector(4 downto 0) := "00011"; 
     constant IOI_DQ3            : std_logic_vector(4 downto 0) := "00010"; 
     constant IOI_DQ4            : std_logic_vector(4 downto 0) := "00101"; 
     constant IOI_DQ5            : std_logic_vector(4 downto 0) := "00100"; 
     constant IOI_DQ6            : std_logic_vector(4 downto 0) := "00111"; 
     constant IOI_DQ7            : std_logic_vector(4 downto 0) := "00110"; 
     constant IOI_DQ8            : std_logic_vector(4 downto 0) := "01001"; 
     constant IOI_DQ9            : std_logic_vector(4 downto 0) := "01000"; 
     constant IOI_DQ10           : std_logic_vector(4 downto 0) := "01011"; 
     constant IOI_DQ11           : std_logic_vector(4 downto 0) := "01010"; 
     constant IOI_DQ12           : std_logic_vector(4 downto 0) := "01101"; 
     constant IOI_DQ13           : std_logic_vector(4 downto 0) := "01100"; 
     constant IOI_DQ14           : std_logic_vector(4 downto 0) := "01111"; 
     constant IOI_DQ15           : std_logic_vector(4 downto 0) := "01110"; 
     constant IOI_UDQS_CLK       : std_logic_vector(4 downto 0) := "11101"; 
     constant IOI_UDQS_PIN       : std_logic_vector(4 downto 0) := "11100"; 
     constant IOI_LDQS_CLK       : std_logic_vector(4 downto 0) := "11111"; 
     constant IOI_LDQS_PIN       : std_logic_vector(4 downto 0) := "11110"; 




   signal memcell_addr_reg  : std_logic_vector(7 downto 0);
   signal data_reg          : std_logic_vector(7 downto 0);
   signal shift_through_reg : std_logic_vector(7 downto 0);
   signal load_shift_n      : std_logic;
   signal addr_data_sel_n   : std_logic;
   signal bit_cnt           : std_logic_vector(2 downto 0);
   signal rd_not_write_reg  : std_logic;
   signal AddressPhase      : std_logic;
   signal capture_read_data : std_logic;
   signal state             : std_logic_vector(2 downto 0);
   signal nextstate         : std_logic_vector(2 downto 0);
   signal data_out_mux      : std_logic_vector(7 downto 0);
   signal DRP_SDI_pre       : std_logic;

   signal ALMOST_READY_ST   : std_logic;
   signal ADDR_PHASE_ST     : std_logic;
   signal BIT_CNT7          : std_logic;
   signal ADDR_PHASE_ST1     : std_logic;
   signal DATA_PHASE_ST     : std_logic;

   signal state_ascii       : std_logic_vector(32 * 8 - 1 downto 0);
begin
   --synthesis translate_off
   
--   process (state)
--   begin
--      case state is
--         when READY =>
--            state_ascii <= "READY";
--         when DECIDE =>
--            state_ascii <= "DECIDE";
--         when ADDR_PHASE =>
--            state_ascii <= "ADDR_PHASE";
--         when ADDR_TO_DATA_GAP =>
--            state_ascii <= "ADDR_TO_DATA_GAP";
--         when ADDR_TO_DATA_GAP2 =>
--            state_ascii <= "ADDR_TO_DATA_GAP2";
--         when ADDR_TO_DATA_GAP3 =>
--            state_ascii <= "ADDR_TO_DATA_GAP3";
--         when DATA_PHASE =>
--            state_ascii <= "DATA_PHASE";
--         when ALMOST_READY =>		-- case(state)
--            state_ascii <= "ALMOST_READY";
--         when others =>
--            null;
--      end case;
--   end process;
   
   --synthesis translate_on
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (state = READY) then
            memcell_addr_reg <= memcell_address;
            data_reg <= write_data;
            rd_not_write_reg <= rd_not_write;
         end if;
      end if;
   end process;
   
   
   rdy_busy_n <= '1' when (state = READY) else '0';
   
   data_out_mux <= memcell_addr_reg when (addr_data_sel_n = '1') else
                   data_reg;
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (sync_rst = '1') then
            shift_through_reg <= "00000000";
         else
            if (load_shift_n = '1') then		--Assume the shifter is either loading or shifting, bit 0 is shifted out first
               shift_through_reg <= data_out_mux;
            else
               shift_through_reg <= (DRP_SDO & shift_through_reg(7 downto 1));
            end if;
         end if;
      end if;
   end process;
   
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (((state = ADDR_PHASE) or (state = DATA_PHASE)) and (not(sync_rst)) = '1') then
            bit_cnt <= bit_cnt + "001";
         else
            bit_cnt <= "000";
         end if;
      end if;
   end process;
   
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (sync_rst = '1') then
            --     capture_read_data <= 1'b0;
            read_data <= "00000000";
         else
            --       capture_read_data <= (state == DATA_PHASE);
            --       if(capture_read_data)
            if (state = ALMOST_READY) then
               --      else
               --        read_data <= read_data;
               read_data <= shift_through_reg;
            end if;
         end if;
      end if;
   end process;
   
   ALMOST_READY_ST <= '1' when state = ALMOST_READY else '0';
   ADDR_PHASE_ST   <= '1' when state = ADDR_PHASE else '0';
   BIT_CNT7         <= '1' when bit_cnt = "111" else '0';
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (sync_rst = '1') then
            AddressPhase <= '0';
         else
            if (AddressPhase = '1') then
               -- Keep it set until we finish the cycle
               AddressPhase <= AddressPhase and (not ALMOST_READY_ST);
            else
               -- set the address phase when ever we finish the address phase
               AddressPhase <= (ADDR_PHASE_ST and BIT_CNT7);
            end if;
         end if;
      end if;
   end process;
   
ADDR_PHASE_ST1 <= '1' when  nextstate = ADDR_PHASE else '0';
DATA_PHASE_ST <= '1' when  nextstate = DATA_PHASE else '0';

   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         DRP_ADD <= ADDR_PHASE_ST1;
         DRP_CS <= ADDR_PHASE_ST1 or DATA_PHASE_ST;
         if (state = READY) then
            DRP_BKST <= use_broadcast;
         end if;
      end if;
   end process;
   
   
   --  assign DRP_SDI_pre  = (DRP_CS)? shift_through_reg[0] : 1'b0;  //if DRP_CS is inactive, just drive 0 out - this is a possible place to pipeline for increased performance
   --  assign DRP_SDI      = (rd_not_write_reg & DRP_CS & !DRP_ADD)? DRP_SDO : DRP_SDI_pre; //If reading, then feed SDI back out SDO - this is a possible place to pipeline for increased performance
   DRP_SDI <= shift_through_reg(0);		-- The new read method only requires that we shift out the address and the write data
   
   process (state, cmd_valid, bit_cnt, rd_not_write_reg, AddressPhase,BIT_CNT7)
   begin
      addr_data_sel_n <= '0';
      load_shift_n <= '0';
      case state is
         when READY =>
            if (cmd_valid = '1') then
               nextstate <= DECIDE;
            else
               nextstate <= READY;
            end if;
         when DECIDE =>
            load_shift_n <= '1';
            addr_data_sel_n <= '1';
            nextstate <= ADDR_PHASE;
         -- After the second pass go to end of statemachine
         -- execute a second address phase for the read access.
         when ADDR_PHASE =>
            if (BIT_CNT7 = '1') then
               if (rd_not_write_reg = '1') then
                  if (AddressPhase = '1') then
                     nextstate <= ALMOST_READY;
                  else
                     nextstate <= DECIDE;
                  end if;
               else
                  nextstate <= ADDR_TO_DATA_GAP;
               end if;
            else
               nextstate <= ADDR_PHASE;
            end if;
         when ADDR_TO_DATA_GAP =>
            load_shift_n <= '1';
            nextstate <= ADDR_TO_DATA_GAP2;
         when ADDR_TO_DATA_GAP2 =>
            load_shift_n <= '1';
            nextstate <= ADDR_TO_DATA_GAP3;
         when ADDR_TO_DATA_GAP3 =>
            load_shift_n <= '1';
            nextstate <= DATA_PHASE;
         when DATA_PHASE =>
            if (BIT_CNT7 = '1') then
               nextstate <= ALMOST_READY;
            else
               nextstate <= DATA_PHASE;
            end if;
         when ALMOST_READY =>
            nextstate <= READY;
         when others =>
            nextstate <= READY;
      end case;
   end process;
   
   
   process (DRP_CLK)
   begin
      if (DRP_CLK'event and DRP_CLK = '1') then
         if (sync_rst = '1') then
            state <= READY;
         else
            state <= nextstate;
         end if;
      end if;
   end process;
   
   
end architecture trans;


