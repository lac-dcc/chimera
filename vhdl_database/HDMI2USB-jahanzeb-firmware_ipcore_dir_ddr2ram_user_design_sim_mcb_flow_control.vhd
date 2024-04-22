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
--  /   /         Filename: mcb_flow_control.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:40 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This module is the main flow control between cmd_gen.v, 
--         write_data_path and read_data_path modules.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;


ENTITY mcb_flow_control IS
   GENERIC (
      TCQ             : TIME   := 100 ps;
      FAMILY          : STRING := "SPARTAN6"
   );
   PORT (
      clk_i           : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      cmd_rdy_o       : OUT STD_LOGIC;
      cmd_valid_i     : IN STD_LOGIC;
      cmd_i           : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bl_i            : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      mcb_cmd_full    : IN STD_LOGIC;
      cmd_o           : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      addr_o          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bl_o            : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      cmd_en_o        : OUT STD_LOGIC;
      last_word_wr_i  : IN STD_LOGIC;
      wdp_rdy_i       : IN STD_LOGIC;
      wdp_valid_o     : OUT STD_LOGIC;
      wdp_validB_o    : OUT STD_LOGIC;
      wdp_validC_o    : OUT STD_LOGIC;
      wr_addr_o       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      wr_bl_o         : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      last_word_rd_i  : IN STD_LOGIC;
      rdp_rdy_i       : IN STD_LOGIC;
      rdp_valid_o     : OUT STD_LOGIC;
      rd_addr_o       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      rd_bl_o         : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
   );
END mcb_flow_control;

ARCHITECTURE trans OF mcb_flow_control IS

   constant    READY           : std_logic_vector(4 downto 0)  := "00001";
   constant    READ            : std_logic_vector(4 downto 0)  := "00010";
   constant    WRITE           : std_logic_vector(4 downto 0)  := "00100";
   constant    CMD_WAIT        : std_logic_vector(4 downto 0)  := "01000";
   constant    REFRESH_ST      : std_logic_vector(4 downto 0)  := "10000";
      
   constant    RD              : std_logic_vector(2 downto 0)  := "001";
   constant    RDP             : std_logic_vector(2 downto 0)  := "011";
   constant    WR              : std_logic_vector(2 downto 0)  := "000";
   constant    WRP             : std_logic_vector(2 downto 0)  := "010";
   constant    REFRESH         : std_logic_vector(2 downto 0)  := "100";
   constant    NOP             : std_logic_vector(2 downto 0)  := "101";
   
   SIGNAL cmd_fifo_rdy      : STD_LOGIC;
   SIGNAL cmd_rd            : STD_LOGIC;
   SIGNAL cmd_wr            : STD_LOGIC;
   SIGNAL cmd_others        : STD_LOGIC;
   SIGNAL push_cmd          : STD_LOGIC;
   SIGNAL xfer_cmd          : STD_LOGIC;
   SIGNAL rd_vld            : STD_LOGIC;
   SIGNAL wr_vld            : STD_LOGIC;
   SIGNAL cmd_rdy           : STD_LOGIC;
   SIGNAL cmd_reg           : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL addr_reg          : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL bl_reg            : STD_LOGIC_VECTOR(5 DOWNTO 0);
   
   SIGNAL rdp_valid         : STD_LOGIC;
   SIGNAL wdp_valid         : STD_LOGIC;
   SIGNAL wdp_validB        : STD_LOGIC;
   SIGNAL wdp_validC        : STD_LOGIC;
   
   SIGNAL current_state     : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL next_state        : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL tstpointA         : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL push_cmd_r        : STD_LOGIC;
   SIGNAL wait_done         : STD_LOGIC;
   SIGNAL cmd_en_r1         : STD_LOGIC;
   SIGNAL wr_in_progress    : STD_LOGIC;
   SIGNAL tst_cmd_rdy_o     : STD_LOGIC;
   
   SIGNAL cmd_wr_pending_r1 : STD_LOGIC;
   SIGNAL cmd_rd_pending_r1 : STD_LOGIC;
   
   -- Declare intermediate signals for referenced outputs
   SIGNAL cmd_rdy_o_xhdl0   : STD_LOGIC;
BEGIN
   -- Drive referenced outputs
   cmd_rdy_o <= cmd_rdy_o_xhdl0;
   cmd_en_o <= cmd_en_r1;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         cmd_rdy_o_xhdl0 <= cmd_rdy;
         tst_cmd_rdy_o <= cmd_rdy;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(8)) = '1') THEN
            cmd_en_r1 <= '0' ;
         ELSIF (xfer_cmd = '1') THEN
            cmd_en_r1 <= '1' ;
         ELSIF ((NOT(mcb_cmd_full)) = '1') THEN
            cmd_en_r1 <= '0' ;
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(9)) = '1') THEN
            cmd_fifo_rdy <= '1';
         ELSIF (xfer_cmd = '1') THEN
            cmd_fifo_rdy <= '0';
         ELSIF ((NOT(mcb_cmd_full)) = '1') THEN
            cmd_fifo_rdy <= '1';
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(9)) = '1') THEN
            addr_o <= (others => '0');
            cmd_o <= (others => '0');
            bl_o <= (others => '0');
         ELSIF (xfer_cmd = '1') THEN
            addr_o <= addr_reg;
            IF (FAMILY = "SPARTAN6") THEN
               cmd_o <= cmd_reg;
            ELSE
               cmd_o <= ("00" & cmd_reg(0));
            END IF;
            bl_o <= bl_reg;
         END IF;
      END IF;
   END PROCESS;
   
   wr_addr_o <= addr_i;
   rd_addr_o <= addr_i;
   rd_bl_o <= bl_i;
   wr_bl_o <= bl_i;
   wdp_valid_o <= wdp_valid;
   wdp_validB_o <= wdp_validB;
   wdp_validC_o <= wdp_validC;
   rdp_valid_o <= rdp_valid;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(8)) = '1') THEN
            wait_done <= '1' ;
         ELSIF (push_cmd_r = '1') THEN
            wait_done <= '1' ;
         ELSIF ((cmd_rdy_o_xhdl0 AND cmd_valid_i) = '1' AND FAMILY = "SPARTAN6") THEN
            wait_done <= '0' ;
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         push_cmd_r <= push_cmd ;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (push_cmd = '1') THEN
            cmd_reg <= cmd_i ;
            addr_reg <= addr_i ;
            bl_reg <= bl_i - "000001" ;
         END IF;
      END IF;
   END PROCESS;
   
   cmd_wr <= '1' WHEN (((cmd_i = WR) OR (cmd_i = WRP)) AND (cmd_valid_i = '1')) ELSE
             '0';                        
   cmd_rd <= '1' WHEN (((cmd_i = RD) OR (cmd_i = RDP)) AND (cmd_valid_i = '1')) ELSE
             '0';
   cmd_others <= '1' WHEN ((cmd_i(2) = '1') AND (cmd_valid_i = '1') AND (FAMILY = "SPARTAN6")) ELSE
                 '0';
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0)= '1') THEN
            
            cmd_wr_pending_r1 <= '0' ;
         ELSIF (last_word_wr_i = '1') THEN
            
            cmd_wr_pending_r1 <= '1' ;
         ELSIF (push_cmd = '1') THEN
            cmd_wr_pending_r1 <= '0' ;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((cmd_rd AND push_cmd) = '1') THEN
            cmd_rd_pending_r1 <= '1' ;
         ELSIF (xfer_cmd = '1') THEN
            
            cmd_rd_pending_r1 <= '0' ;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0)= '1') THEN
            wr_in_progress <= '0';
         ELSIF (last_word_wr_i = '1') THEN
            wr_in_progress <= '0';
         ELSIF (current_state = WRITE) THEN
            
            wr_in_progress <= '1';
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0)= '1') THEN
            current_state <= "00001" ;
         ELSE
            current_state <= next_state ;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (current_state, rdp_rdy_i, cmd_rd, cmd_fifo_rdy, wdp_rdy_i, cmd_wr, last_word_rd_i, cmd_others, last_word_wr_i, cmd_valid_i, wait_done, wr_in_progress, cmd_wr_pending_r1)
   BEGIN
      push_cmd <= '0';
      
      xfer_cmd <= '0';
      wdp_valid <= '0';
      wdp_validB <= '0';
      
      wdp_validC <= '0';
      rdp_valid <= '0';
      cmd_rdy <= '0';
      next_state <= current_state;
      CASE current_state IS
         
         WHEN READY =>
            IF ((rdp_rdy_i AND cmd_rd AND cmd_fifo_rdy) = '1') THEN
               next_state <= READ;
               push_cmd <= '1';
               xfer_cmd <= '0';
               rdp_valid <= '1';

            ELSIF ((wdp_rdy_i AND cmd_wr AND cmd_fifo_rdy) = '1') THEN
               next_state <= WRITE;
               push_cmd <= '1';
               wdp_valid <= '1';
               wdp_validB <= '1';
               wdp_validC <= '1';

            ELSIF ((cmd_others AND cmd_fifo_rdy) = '1') THEN
               next_state <= REFRESH_ST;
               push_cmd <= '1';
               xfer_cmd <= '0';

            ELSE
               next_state <= READY;
               push_cmd <= '0';
            END IF;

            IF (cmd_fifo_rdy = '1') THEN
               cmd_rdy <= '1';
            ELSE
               cmd_rdy <= '0';
            END IF;

         WHEN REFRESH_ST =>
            IF ((rdp_rdy_i AND cmd_rd AND cmd_fifo_rdy) = '1') THEN
               next_state <= READ;
               push_cmd <= '1';
               rdp_valid <= '1';
               wdp_valid <= '0';
               xfer_cmd <= '1';
               
            ELSIF ((cmd_fifo_rdy AND cmd_wr AND wdp_rdy_i) = '1') THEN
               next_state <= WRITE;
               push_cmd <= '1';
               xfer_cmd <= '1';
               
               wdp_valid     <= '1';
               wdp_validB    <= '1';
               wdp_validC    <= '1';               
             
            ELSIF ((cmd_fifo_rdy and cmd_others) = '1') THEN
               push_cmd <= '1';
               xfer_cmd <= '1';

            ELSIF ((not(cmd_fifo_rdy)) = '1') THEN
               next_state <= CMD_WAIT;
               tstpointA  <= "1001";

            ELSE
               next_state <= READ; 

            END IF;
               
            IF ((cmd_fifo_rdy AND ((rdp_rdy_i AND cmd_rd) OR (wdp_rdy_i AND cmd_wr) OR (cmd_others))) = '1') THEN
              cmd_rdy <= '1';
            ELSE 
              cmd_rdy <= '0';
            END IF;

         WHEN READ =>
            IF ((rdp_rdy_i AND cmd_rd AND cmd_fifo_rdy) = '1') THEN
               next_state <= READ;
               push_cmd <= '1';
               rdp_valid <= '1';
               wdp_valid <= '0';
               xfer_cmd <= '1';
               tstpointA <= "0101";
            ELSIF ((cmd_fifo_rdy AND cmd_wr AND wdp_rdy_i) = '1') THEN
               next_state <= WRITE;
               push_cmd <= '1';
               xfer_cmd <= '1';
               wdp_valid <= '1';
               wdp_validB <= '1';
               wdp_validC <= '1';
               tstpointA <= "0110";
            ELSIF ((NOT(rdp_rdy_i)) = '1') THEN
               next_state <= READ;
               push_cmd <= '0';
               xfer_cmd <= '0';
               tstpointA <= "0111";
               wdp_valid <= '0';
               wdp_validB <= '0';
               wdp_validC <= '0';
               rdp_valid <= '0';
            ELSIF ((last_word_rd_i AND cmd_others AND cmd_fifo_rdy) = '1') THEN
               next_state <= REFRESH_ST;
               push_cmd <= '1';
               xfer_cmd <= '1';
               wdp_valid <= '0';
               wdp_validB <= '0';
               wdp_validC <= '0';
               rdp_valid <= '0';
               tstpointA <= "1000";
            ELSIF ((NOT(cmd_fifo_rdy) OR NOT(wdp_rdy_i)) = '1') THEN
               next_state <= CMD_WAIT;
               tstpointA <= "1001";
            ELSE
               next_state <= READ;
            END IF;

            IF ((((rdp_rdy_i AND cmd_rd) OR (cmd_wr AND wdp_rdy_i) OR cmd_others) AND cmd_fifo_rdy) = '1') THEN
             cmd_rdy <= wait_done; --'1';
            ELSE
               cmd_rdy <= '0';
            END IF;
         
         WHEN WRITE =>
            IF ((cmd_fifo_rdy AND cmd_rd AND rdp_rdy_i AND last_word_wr_i) = '1') THEN
               next_state <= READ;
               push_cmd <= '1';
               xfer_cmd <= '1';
               rdp_valid <= '1';
               tstpointA <= "0000";
            ELSIF ((NOT(wdp_rdy_i) OR (wdp_rdy_i AND cmd_wr AND cmd_fifo_rdy AND last_word_wr_i)) = '1') THEN
               next_state <= WRITE;
               tstpointA <= "0001";
               IF ((cmd_wr AND last_word_wr_i) = '1') THEN
                  wdp_valid <= '1';
                  wdp_validB <= '1';
                  wdp_validC <= '1';
               ELSE
                  wdp_valid <= '0';
                  wdp_validB <= '0';
                  wdp_validC <= '0';
               END IF;
               IF (last_word_wr_i = '1') THEN
                  push_cmd <= '1';
                  xfer_cmd <= '1';
               ELSE
                  push_cmd <= '0';
                  xfer_cmd <= '0';
               END IF;
            ELSIF ((last_word_wr_i AND cmd_others AND cmd_fifo_rdy) = '1') THEN
               next_state <= REFRESH_ST;
               push_cmd <= '1';
               xfer_cmd <= '1';
               tstpointA <= "0010";
               wdp_valid <= '0';
               wdp_validB <= '0';
               wdp_validC <= '0';
               rdp_valid <= '0';
            ELSIF ((((NOT(cmd_fifo_rdy)) AND last_word_wr_i) OR (NOT(rdp_rdy_i)) OR (NOT(cmd_valid_i) AND wait_done)) = '1') THEN
               next_state <= CMD_WAIT;
               push_cmd <= '0';
               xfer_cmd <= '0';
               tstpointA <= "0011";
            ELSE
               next_state <= WRITE;
               tstpointA <= "0100";
            END IF;
            IF ((last_word_wr_i AND (cmd_others OR (rdp_rdy_i AND cmd_rd) OR (cmd_wr AND wdp_rdy_i)) AND cmd_fifo_rdy) = '1') THEN
               cmd_rdy <= wait_done;
            ELSE
               cmd_rdy <= '0';
            END IF;
         
         WHEN CMD_WAIT =>
            IF ((NOT(cmd_fifo_rdy) OR wr_in_progress) = '1') THEN
               next_state <= CMD_WAIT;
               cmd_rdy <= '0';
               tstpointA <= "1010";
            ELSIF ((cmd_fifo_rdy AND rdp_rdy_i AND cmd_rd) = '1') THEN
               next_state <= READ;
               push_cmd <= '1';
               xfer_cmd <= '1';
               cmd_rdy <= '1';
               rdp_valid <= '1';
               tstpointA <= "1011";
            ELSIF ((cmd_fifo_rdy AND cmd_wr AND (wait_done OR cmd_wr_pending_r1)) = '1') THEN
               next_state <= WRITE;
               push_cmd <= '1';
               xfer_cmd <= '1';
               wdp_valid <= '1';
               wdp_validB <= '1';
               wdp_validC <= '1';
               cmd_rdy <= '1';
               tstpointA <= "1100";
            ELSIF ((cmd_fifo_rdy AND cmd_others) = '1') THEN
               next_state <= REFRESH_ST;
               push_cmd <= '1';
               xfer_cmd <= '1';
               tstpointA <= "1101";
               cmd_rdy <= '1';
            ELSE
               next_state <= CMD_WAIT;
               tstpointA <= "1110";
               IF (((wdp_rdy_i AND rdp_rdy_i)) = '1') THEN
                  cmd_rdy <= '1';
               ELSE
                  cmd_rdy <= '0';
               END IF;
            END IF;
         
         WHEN OTHERS =>
            push_cmd <= '0';
            xfer_cmd <= '0';
            wdp_valid <= '0';
            wdp_validB <= '0';
            wdp_validC <= '0';
            next_state <= READY;
      END CASE;
   END PROCESS;
   
   
END trans;


