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
--  /   /         Filename: mcb_soft_calibration.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:17:26 $
-- \   \  /  \    Date Created: Mon Feb 9 2009
--  \___\/\___\
--
--Device: Spartan6
--Design Name: DDR/DDR2/DDR3/LPDDR
--Purpose:  Xilinx reference design for MCB Soft
--           Calibration
--Reference:
--
--  Revision:      Date:  Comment
--       1.0:  2/06/09:   Initial version for MIG wrapper.
--       1.1:  2/09/09:   moved Max_Value_Previous assignments to be completely inside CASE statement for next-state logic (needed to get it working 
--                          correctly)
--       1.2:  2/12/09:   Many other changes.
--       1.3:  2/26/09:   Removed section with Max_Value_pre and DQS_COUNT_PREVIOUS_pre, and instead added PREVIOUS_STATE reg and moved assignment to within
--                          STATE
--       1.4:  3/02/09:   Removed comments out of sensitivity list of always block to mux SDI, SDO, CS, and ADD.Also added reg declaration for PREVIOUS_STATE
--       1.5:  3/16/09:   Added pll_lock port, and using it to gate reset.  Changing RST (except input port) to RST_reg and gating it with pll_lock.
--       1.6:  6/05/09:   Added START_DYN_CAL_PRE with pulse on SYSRST; removed MCB_UIDQCOUNT.
--       1.7:  6/24/09:   Gave RZQ and ZIO each their own unique ADD and SDI nets
--       2.6:  12/15/09:  Changed STATE from 7-bit to 6-bit.  Dropped (* FSM_ENCODING="BINARY" *) for STATE. Moved MCB_UICMDEN = 0 from OFF_RZQ_PTERM to 
--                          RST_DELAY. 
--                        Changed the "reset" always block so that RST_reg is always set to 1 when the PLL loses lock, and is now held in reset for at least
--                          16 clocks.  Added PNSKEW option.
--       2.7:  12/23/09:  Added new states "SKEW" and "MULTIPLY_DIVIDE" to help with timing.
--       2.8:  01/14/10:  Added functionality to allow for SUSPEND.  Changed MCB_SYSRST port from wire to reg.
--       2.9:  02/01/10:  More changes to SUSPEND and Reset logic to handle SUSPEND properly.  Also - eliminated 2's comp DQS_COUNT_VIRTUAL, and replaced 
--                          with 8bit TARGET_DQS_DELAY which
--                        will track most recnet Max_Value.  Eliminated DQS_COUNT_PREVIOUS. Combined DQS_COUNT_INITIAL and DQS_DELAY into DQS_DELAY_INITIAL.
--                          Changed DQS_COUNT* to DQS_DELAY*.
--                        Changed MCB_SYSRST port back to wire (from reg).
--       3.0:  02/10/10:  Added count_inc and count_dec to add few (4) UI_CLK cycles latency to the INC and DEC signals(to deal with latency on UOREFRSHFLAG)
--       3.1:  02/23/10:  Registered the DONE_SOFTANDHARD_CAL for timing.
--       3.2:  02/28/10:  Corrected the   WAIT_SELFREFRESH_EXIT_DQS_CAL logic;
--       3.3:  03/02/10:  Changed PNSKEW to default on (1'b1)
--       3.4:  03/04/10:  Recoded the RST_Reg logic.
--       3.5:  03/05/10:  Changed Result register to be 16-bits.  Changed DQS_NUMERATOR/DENOMINATOR values to 3/8 (from 6/16)
--       3.6   03/10/10:  Improvements to Reset logic.  
--       3.7:  04/26/10:  Added DDR2 Initialization fix to meet 400 ns wait as outlined in step d) of JEDEC DDR2 spec .
--       3.8:  05/05/10:  Added fixes for the CR# 559092 (updated Mult_Divide function) and 555416 (added IOB attribute to DONE_SOFTANDHARD_CAL).
--       3.9:  05/24/10:  Added 200us Wait logic to control CKE_Train. The 200us Wait counter assumes UI_CLK freq not higher than 100 MHz.
--       3.10  10/22/10:  Fixed PERFORM_START_DYN_CAL_AFTER_SELFREFRESH logic.		
--       3.11  2/14/11:   Apply a different skkew for the P and N inputs for the differential LDQS and UDQS signals to provide more noise immunity.
--       4.1   03/08/12:  Fixed SELFREFRESH_MCB_REQ logic. It should not need depend on the SM STATE so that
--                        MCB can come out of selfresh mode. SM requires refresh cycle to update the DQS value. 
--       4.2   05/10/12:  All P/N terms of input and bidir memory pins are initialized with value of ZERO. TZQINIT_MAXCNT
--                        are set to 8 for LPDDR,DDR and DDR2 interface .
--                        Keep the UICMDEN in assertion state when SM is in RST_DELAY state so that MCB will not start doing
--                        Premable detection until the second deassertion of MCB_SYSRST. 
                        

-- End Revision
--**********************************************************************************

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

entity mcb_soft_calibration is
   generic (
      C_MEM_TZQINIT_MAXCNT  : std_logic_vector(9 downto 0) := "1000000000"; -- DDR3 Minimum delay between resets
      SKIP_IN_TERM_CAL      : integer := 0;                 -- provides option to skip the input termination calibration
      SKIP_DYNAMIC_CAL      : integer := 0;                 -- provides option to skip the dynamic delay calibration
      SKIP_DYN_IN_TERM      : integer := 1;                 -- provides option to skip the input termination calibration
      C_MC_CALIBRATION_MODE : string  := "CALIBRATION";     -- if set to CALIBRATION will reset DQS IDELAY to DQS_NUMERATOR/DQS_DENOMINATOR local_param value
                                                            -- if set to NOCALIBRATION then defaults to hard cal blocks setting of C_MC_CALBRATION_DELAY 
                                                            -- (Quarter, etc)
      C_SIMULATION          : string  := "FALSE";           -- Tells us whether the design is being simulated or implemented
      C_MEM_TYPE            : string  := "DDR"                                                             

      
   );
   port (
      UI_CLK                : in std_logic;         -- main clock input for logic and IODRP CLK pins.  At top level, this should also connect to IODRP2_MCB 
                                                    --  CLK pins
      RST                   : in std_logic;         -- main system reset for both the Soft Calibration block - also will act as a passthrough to MCB's SYSRST
      DONE_SOFTANDHARD_CAL  : out std_logic;        -- active high flag signals soft calibration of input delays is complete and MCB_UODONECAL is high (MCB 
                                                    --  hard calib complete)
      PLL_LOCK              : in std_logic;         -- Lock signal from PLL
      SELFREFRESH_REQ       : in std_logic;
      SELFREFRESH_MCB_MODE  : in std_logic;
      SELFREFRESH_MCB_REQ   : out std_logic;
      SELFREFRESH_MODE      : out std_logic;
      IODRP_ADD             : out std_logic;        -- IODRP ADD port 
      IODRP_SDI             : out std_logic;        -- IODRP SDI port
      RZQ_IN                : in std_logic;         -- RZQ pin from board - expected to have a 2*R resistor to ground
      RZQ_IODRP_SDO         : in std_logic;         -- RZQ IODRP's SDO port
      RZQ_IODRP_CS          : out std_logic := '0'; -- RZQ IODRP's CS port
      ZIO_IN                : in std_logic;         -- Z-stated IO pin - garanteed not to be driven externally
      ZIO_IODRP_SDO         : in std_logic;         -- ZIO IODRP's SDO port
      ZIO_IODRP_CS          : out std_logic := '0'; -- ZIO IODRP's CS port
      MCB_UIADD             : out std_logic;        -- to MCB's UIADD port
      MCB_UISDI             : out std_logic;        -- to MCB's UISDI port
      MCB_UOSDO             : in std_logic;         -- from MCB's UOSDO port (User output SDO)
      MCB_UODONECAL         : in std_logic;         -- indicates when MCB hard calibration process is complete
      MCB_UOREFRSHFLAG      : in std_logic;         -- high during refresh cycle and time when MCB is innactive
      MCB_UICS              : out std_logic;        -- to MCB's UICS port (User Input CS)
      MCB_UIDRPUPDATE       : out std_logic := '1'; -- MCB's UIDRPUPDATE port (gets passed to IODRP2_MCB's MEMUPDATE port: this controls shadow latch used 
                                                    --  during IODRP2_MCB writes).  Currently just trasnparent
      MCB_UIBROADCAST       : out std_logic;        -- only to MCB's UIBROADCAST port (User Input BROADCAST - gets passed to IODRP2_MCB's BKST port)
      MCB_UIADDR            : out std_logic_vector(4 downto 0) := "00000";  -- to MCB's UIADDR port (gets passed to IODRP2_MCB's AUXADDR port
      MCB_UICMDEN           : out std_logic := '1'; -- set to 1 to take control of UI interface - removes control from internal calib block
      MCB_UIDONECAL         : out std_logic := '0'; -- set to 0 to "tell" controller that it's still in a calibrate state
      MCB_UIDQLOWERDEC      : out std_logic ;
      MCB_UIDQLOWERINC      : out std_logic ;
      MCB_UIDQUPPERDEC      : out std_logic ;
      MCB_UIDQUPPERINC      : out std_logic ;
      MCB_UILDQSDEC         : out std_logic := '0';
      MCB_UILDQSINC         : out std_logic := '0';
      MCB_UIREAD            : out std_logic;        -- enables read w/o writing by turning on a SDO->SDI loopback inside the IODRP2_MCBs (doesn't exist in 
                                                    --  regular IODRP2).  IODRPCTRLR_R_WB becomes don't-care.
      MCB_UIUDQSDEC         : out std_logic := '0';
      MCB_UIUDQSINC         : out std_logic := '0';
      MCB_RECAL             : out std_logic ; -- future hook to drive MCB's RECAL pin - initiates a hard re-calibration sequence when high
      MCB_UICMD             : out std_logic;
      MCB_UICMDIN           : out std_logic;
      MCB_UIDQCOUNT         : out std_logic_vector(3 downto 0);
      MCB_UODATA            : in std_logic_vector(7 downto 0);
      MCB_UODATAVALID       : in std_logic;
      MCB_UOCMDREADY        : in std_logic;
      MCB_UO_CAL_START      : in std_logic;
      MCB_SYSRST            : out std_logic;        -- drives the MCB's SYSRST pin - the main reset for MCB
      Max_Value             : out std_logic_vector(7 downto 0);
      CKE_Train             : out std_logic
   );
end entity mcb_soft_calibration;

architecture trans of mcb_soft_calibration is

   constant IOI_DQ0                   : std_logic_vector(4 downto 0) := ("0000" & '1');
   constant IOI_DQ1                   : std_logic_vector(4 downto 0) := ("0000" & '0');
   constant IOI_DQ2                   : std_logic_vector(4 downto 0) := ("0001" & '1');
   constant IOI_DQ3                   : std_logic_vector(4 downto 0) := ("0001" & '0');
   constant IOI_DQ4                   : std_logic_vector(4 downto 0) := ("0010" & '1');
   constant IOI_DQ5                   : std_logic_vector(4 downto 0) := ("0010" & '0');
   constant IOI_DQ6                   : std_logic_vector(4 downto 0) := ("0011" & '1');
   constant IOI_DQ7                   : std_logic_vector(4 downto 0) := ("0011" & '0');
   constant IOI_DQ8                   : std_logic_vector(4 downto 0) := ("0100" & '1');
   constant IOI_DQ9                   : std_logic_vector(4 downto 0) := ("0100" & '0');
   constant IOI_DQ10                  : std_logic_vector(4 downto 0) := ("0101" & '1');
   constant IOI_DQ11                  : std_logic_vector(4 downto 0) := ("0101" & '0');
   constant IOI_DQ12                  : std_logic_vector(4 downto 0) := ("0110" & '1');
   constant IOI_DQ13                  : std_logic_vector(4 downto 0) := ("0110" & '0');
   constant IOI_DQ14                  : std_logic_vector(4 downto 0) := ("0111" & '1');
   constant IOI_DQ15                  : std_logic_vector(4 downto 0) := ("0111" & '0');
   constant IOI_UDM                   : std_logic_vector(4 downto 0) := ("1000" & '1');
   constant IOI_LDM                   : std_logic_vector(4 downto 0) := ("1000" & '0');
   constant IOI_CK_P                  : std_logic_vector(4 downto 0) := ("1001" & '1');
   constant IOI_CK_N                  : std_logic_vector(4 downto 0) := ("1001" & '0');
   constant IOI_RESET                 : std_logic_vector(4 downto 0) := ("1010" & '1');
   constant IOI_A11                   : std_logic_vector(4 downto 0) := ("1010" & '0');
   constant IOI_WE                    : std_logic_vector(4 downto 0) := ("1011" & '1');
   constant IOI_BA2                   : std_logic_vector(4 downto 0) := ("1011" & '0');
   constant IOI_BA0                   : std_logic_vector(4 downto 0) := ("1100" & '1');
   constant IOI_BA1                   : std_logic_vector(4 downto 0) := ("1100" & '0');
   constant IOI_RASN                  : std_logic_vector(4 downto 0) := ("1101" & '1');
   constant IOI_CASN                  : std_logic_vector(4 downto 0) := ("1101" & '0');
   constant IOI_UDQS_CLK              : std_logic_vector(4 downto 0) := ("1110" & '1');
   constant IOI_UDQS_PIN              : std_logic_vector(4 downto 0) := ("1110" & '0');
   constant IOI_LDQS_CLK              : std_logic_vector(4 downto 0) := ("1111" & '1');
   constant IOI_LDQS_PIN              : std_logic_vector(4 downto 0) := ("1111" & '0');

   constant START                     : std_logic_vector(5 downto 0) := "000000";
   constant LOAD_RZQ_NTERM            : std_logic_vector(5 downto 0) := "000001";
   constant WAIT1                     : std_logic_vector(5 downto 0) := "000010";
   constant LOAD_RZQ_PTERM            : std_logic_vector(5 downto 0) := "000011";
   constant WAIT2                     : std_logic_vector(5 downto 0) := "000100";
   constant INC_PTERM                 : std_logic_vector(5 downto 0) := "000101";
   constant MULTIPLY_DIVIDE           : std_logic_vector(5 downto 0) := "000110";
   constant LOAD_ZIO_PTERM            : std_logic_vector(5 downto 0) := "000111";
   constant WAIT3                     : std_logic_vector(5 downto 0) := "001000";
   constant LOAD_ZIO_NTERM            : std_logic_vector(5 downto 0) := "001001";
   constant WAIT4                     : std_logic_vector(5 downto 0) := "001010";
   constant INC_NTERM                 : std_logic_vector(5 downto 0) := "001011";
   constant SKEW                      : std_logic_vector(5 downto 0) := "001100";
   constant WAIT_FOR_START_BROADCAST  : std_logic_vector(5 downto 0) := "001101";
   constant BROADCAST_PTERM           : std_logic_vector(5 downto 0) := "001110";
   constant WAIT5                     : std_logic_vector(5 downto 0) := "001111";
   constant BROADCAST_NTERM           : std_logic_vector(5 downto 0) := "010000";
   constant WAIT6                     : std_logic_vector(5 downto 0) := "010001";

   constant LDQS_CLK_WRITE_P_TERM     : std_logic_vector(5 downto 0) := "010010";
   constant LDQS_CLK_P_TERM_WAIT      : std_logic_vector(5 downto 0) := "010011";
   constant LDQS_CLK_WRITE_N_TERM     : std_logic_vector(5 downto 0) := "010100";
   constant LDQS_CLK_N_TERM_WAIT      : std_logic_vector(5 downto 0) := "010101";
   constant LDQS_PIN_WRITE_P_TERM     : std_logic_vector(5 downto 0) := "010110";
   constant LDQS_PIN_P_TERM_WAIT      : std_logic_vector(5 downto 0) := "010111";
   constant LDQS_PIN_WRITE_N_TERM     : std_logic_vector(5 downto 0) := "011000";
   constant LDQS_PIN_N_TERM_WAIT      : std_logic_vector(5 downto 0) := "011001";
   constant UDQS_CLK_WRITE_P_TERM     : std_logic_vector(5 downto 0) := "011010";
   constant UDQS_CLK_P_TERM_WAIT      : std_logic_vector(5 downto 0) := "011011";
   constant UDQS_CLK_WRITE_N_TERM     : std_logic_vector(5 downto 0) := "011100";
   constant UDQS_CLK_N_TERM_WAIT      : std_logic_vector(5 downto 0) := "011101";
   constant UDQS_PIN_WRITE_P_TERM     : std_logic_vector(5 downto 0) := "011110";
   constant UDQS_PIN_P_TERM_WAIT      : std_logic_vector(5 downto 0) := "011111";
   constant UDQS_PIN_WRITE_N_TERM     : std_logic_vector(5 downto 0) := "100000";
   constant UDQS_PIN_N_TERM_WAIT      : std_logic_vector(5 downto 0) := "100001"; 
   
   constant OFF_RZQ_PTERM             : std_logic_vector(5 downto 0) := "100010";
   constant WAIT7                     : std_logic_vector(5 downto 0) := "100011";
   constant OFF_ZIO_NTERM             : std_logic_vector(5 downto 0) := "100100";
   constant WAIT8                     : std_logic_vector(5 downto 0) := "100101";
   constant RST_DELAY                 : std_logic_vector(5 downto 0) := "100110";
   constant START_DYN_CAL_PRE         : std_logic_vector(5 downto 0) := "100111";
   constant WAIT_FOR_UODONE           : std_logic_vector(5 downto 0) := "101000";
   constant LDQS_WRITE_POS_INDELAY    : std_logic_vector(5 downto 0) := "101001";
   constant LDQS_WAIT1                : std_logic_vector(5 downto 0) := "101010";
   constant LDQS_WRITE_NEG_INDELAY    : std_logic_vector(5 downto 0) := "101011";
   constant LDQS_WAIT2                : std_logic_vector(5 downto 0) := "101100";
   constant UDQS_WRITE_POS_INDELAY    : std_logic_vector(5 downto 0) := "101101";
   constant UDQS_WAIT1                : std_logic_vector(5 downto 0) := "101110";
   constant UDQS_WRITE_NEG_INDELAY    : std_logic_vector(5 downto 0) := "101111";
   constant UDQS_WAIT2                : std_logic_vector(5 downto 0) := "110000";
   constant START_DYN_CAL             : std_logic_vector(5 downto 0) := "110001";
   constant WRITE_CALIBRATE           : std_logic_vector(5 downto 0) := "110010";
   constant WAIT9                     : std_logic_vector(5 downto 0) := "110011";
   constant READ_MAX_VALUE            : std_logic_vector(5 downto 0) := "110100";
   constant WAIT10                    : std_logic_vector(5 downto 0) := "110101";
   constant ANALYZE_MAX_VALUE         : std_logic_vector(5 downto 0) := "110110";
   constant FIRST_DYN_CAL             : std_logic_vector(5 downto 0) := "110111";
   constant INCREMENT                 : std_logic_vector(5 downto 0) := "111000";
   constant DECREMENT                 : std_logic_vector(5 downto 0) := "111001"; 
   constant DONE                      : std_logic_vector(5 downto 0) := "111010";
   --constant INCREMENT_TA             : std_logic_vector(5 downto 0) := "111011";

   constant RZQ                       : std_logic_vector(1 downto 0) := "00";
   constant ZIO                       : std_logic_vector(1 downto 0) := "01";
   constant MCB_PORT                  : std_logic_vector(1 downto 0) := "11";
   constant WRITE_MODE                : std_logic := '0';
   constant READ_MODE                 : std_logic := '1';
    
    -- IOI Registers
   constant NoOp                      : std_logic_vector(7 downto 0) := "00000000";
   constant DelayControl              : std_logic_vector(7 downto 0) := "00000001";
   constant PosEdgeInDly              : std_logic_vector(7 downto 0) := "00000010";
   constant NegEdgeInDly              : std_logic_vector(7 downto 0) := "00000011";
   constant PosEdgeOutDly             : std_logic_vector(7 downto 0) := "00000100";
   constant NegEdgeOutDly             : std_logic_vector(7 downto 0) := "00000101";
   constant MiscCtl1                  : std_logic_vector(7 downto 0) := "00000110";
   constant MiscCtl2                  : std_logic_vector(7 downto 0) := "00000111";
   constant MaxValue                  : std_logic_vector(7 downto 0) := "00001000";
    
    -- IOB Registers
   constant PDrive                    : std_logic_vector(7 downto 0) := "10000000";
   constant PTerm                     : std_logic_vector(7 downto 0) := "10000001";
   constant NDrive                    : std_logic_vector(7 downto 0) := "10000010";
   constant NTerm                     : std_logic_vector(7 downto 0) := "10000011";
   constant SlewRateCtl               : std_logic_vector(7 downto 0) := "10000100";
   constant LVDSControl               : std_logic_vector(7 downto 0) := "10000101";
   constant MiscControl               : std_logic_vector(7 downto 0) := "10000110";
   constant InputControl              : std_logic_vector(7 downto 0) := "10000111";
   constant TestReadback              : std_logic_vector(7 downto 0) := "10001000";

-- No multi/divide is required when a 55 ohm resister is used on RZQ
-- localparam          MULT          = 1;
-- localparam          DIV           = 1;
-- use 7/4 scaling factor when the 100 ohm RZQ is used
   constant MULT                      : integer := 7;
   constant DIV                       : integer := 4;

   constant PNSKEW                    : std_logic := '1'; -- Default is 1'b1. Change to 1'b0 if PSKEW and NSKEW are not required
   constant PNSKEWDQS                 : std_logic := '1';
   
   constant MULT_S                    : integer  := 9;
   constant DIV_S                     : integer  := 8;
   constant MULT_W                    : integer  := 7;
   constant DIV_W                     : integer  := 8;

   constant DQS_NUMERATOR             : integer  := 3;
   constant DQS_DENOMINATOR           : integer  := 8;
   constant INCDEC_THRESHOLD          : std_logic_vector(7 downto 0) := X"03"; 
                                                          -- parameter for the threshold which triggers an inc/dec to occur.  2 for half, 4 for quarter, 
                                                          -- 3 for three eighths

   constant RST_CNT                   : std_logic_vector(9 downto 0) := "0000010000";
 
   constant IN_TERM_PASS             : std_logic := '0';
   constant DYN_CAL_PASS             : std_logic := '1';

   function TZQINIT_MAXCNT_W return std_logic_vector is
     variable temp : std_logic_vector(9 downto 0) := (others=>'0');
   begin
      if (C_MEM_TYPE = "DDR3") then
         temp := C_MEM_TZQINIT_MAXCNT + RST_CNT;
      else
         temp := 8 + RST_CNT;
      end if;
         return temp(9 downto 0);
   end function;

   constant TZQINIT_MAXCNT            : std_logic_vector(9 downto 0) := TZQINIT_MAXCNT_W;

   component iodrp_mcb_controller is
      port (
         memcell_address           : in std_logic_vector(7 downto 0);
         write_data                : in std_logic_vector(7 downto 0);
         read_data                 : out std_logic_vector(7 downto 0);
         rd_not_write              : in std_logic;
         cmd_valid                 : in std_logic;
         rdy_busy_n                : out std_logic;
         use_broadcast             : in std_logic;
         drp_ioi_addr              : in std_logic_vector(4 downto 0);
         sync_rst                  : in std_logic;
         DRP_CLK                   : in std_logic;
         DRP_CS                    : out std_logic;
         DRP_SDI                   : out std_logic;
         DRP_ADD                   : out std_logic;
         DRP_BKST                  : out std_logic;
         DRP_SDO                   : in std_logic;
         MCB_UIREAD                : out std_logic
      );
   end component;
   
   component iodrp_controller is
      port (
         memcell_address           : in std_logic_vector(7 downto 0);
         write_data                : in std_logic_vector(7 downto 0);
         read_data                 : out std_logic_vector(7 downto 0);
         rd_not_write              : in std_logic;
         cmd_valid                 : in std_logic;
         rdy_busy_n                : out std_logic;
         use_broadcast             : in std_logic;
         sync_rst                  : in std_logic;
         DRP_CLK                   : in std_logic;
         DRP_CS                    : out std_logic;
         DRP_SDI                   : out std_logic;
         DRP_ADD                   : out std_logic;
         DRP_BKST                  : out std_logic;
         DRP_SDO                   : in std_logic
      );
   end component;
   
   signal P_Term                       : std_logic_vector(5 downto 0) := "000000";  
   signal N_Term                       : std_logic_vector(6 downto 0) := "0000000";   
   signal P_Term_s                       : std_logic_vector(5 downto 0) := "000000";  
   signal N_Term_s                       : std_logic_vector(6 downto 0) := "0000000"; 
   signal P_Term_w                       : std_logic_vector(5 downto 0) := "000000";  
   signal N_Term_w                       : std_logic_vector(6 downto 0) := "0000000"; 
   signal P_Term_Prev                  : std_logic_vector(5 downto 0) := "000000";  
   signal N_Term_Prev                  : std_logic_vector(6 downto 0) := "0000000"; 

   signal STATE                        : std_logic_vector(5 downto 0);
   signal IODRPCTRLR_MEMCELL_ADDR      : std_logic_vector(7 downto 0);              
   signal IODRPCTRLR_WRITE_DATA        : std_logic_vector(7 downto 0);              
   signal Active_IODRP                 : std_logic_vector(1 downto 0);
   signal IODRPCTRLR_R_WB              : std_logic := '0';
   signal IODRPCTRLR_CMD_VALID         : std_logic := '0';
   signal IODRPCTRLR_USE_BKST          : std_logic := '0';
   signal MCB_CMD_VALID                : std_logic := '0';
   signal MCB_USE_BKST                 : std_logic := '0';
   signal Pre_SYSRST                   : std_logic := '1';                          -- internally generated reset which will OR with RST input to drive MCB's
                                                                                    -- SYSRST pin (MCB_SYSRST)
   signal IODRP_SDO                    : std_logic;
   signal Max_Value_Previous           : std_logic_vector(7 downto 0) := "00000000";
   signal count                        : std_logic_vector(5 downto 0) := "000000";  -- counter for adding 18 extra clock cycles after setting Calibrate bit
   signal counter_en                   : std_logic := '0';                          -- counter enable for "count"
   signal First_Dyn_Cal_Done           : std_logic := '0';                          -- flag - high after the very first dynamic calibration is done
   signal START_BROADCAST              : std_logic ;                          -- Trigger to start Broadcast to IODRP2_MCBs to set Input Impedance - 
                                                                                    --  state machine will wait for this to be high
   signal DQS_DELAY_INITIAL            : std_logic_vector(7 downto 0) := "00000000";
   signal DQS_DELAY                    : std_logic_vector(7 downto 0);              -- contains the latest values written to LDQS and UDQS Input Delays
   signal TARGET_DQS_DELAY             : std_logic_vector(7 downto 0);              -- used to track the target for DQS input delays - only gets updated if 
                                                                                    --  the Max Value changes by more than the threshold
   signal counter_inc                  : std_logic_vector(7 downto 0);              -- used to delay Inc signal by several ui_clk cycles (to deal with 
                                                                                    --  latency on UOREFRSHFLAG)
   signal counter_dec                  : std_logic_vector(7 downto 0);              -- used to delay Dec signal by several ui_clk cycles (to deal with 
                                                                                    --  latency on UOREFRSHFLAG)
   signal IODRPCTRLR_READ_DATA         : std_logic_vector(7 downto 0);
   signal IODRPCTRLR_RDY_BUSY_N        : std_logic;
   signal IODRP_CS                     : std_logic;
   signal MCB_READ_DATA                : std_logic_vector(7 downto 0);
   signal RST_reg                      : std_logic;
   signal Block_Reset                  : std_logic;
   signal MCB_UODATAVALID_U            : std_logic;

   signal Inc_Dec_REFRSH_Flag          : std_logic_vector(2 downto 0);          -- 3-bit flag to show:Inc is needed, Dec needed, refresh cycle taking place
   signal Max_Value_Delta_Up           : std_logic_vector(7 downto 0);          -- tracks amount latest Max Value has gone up from previous Max Value read
   signal Half_MV_DU                   : std_logic_vector(7 downto 0);          -- half of Max_Value_Delta_Up
   signal Max_Value_Delta_Dn           : std_logic_vector(7 downto 0);          -- tracks amount latest Max Value has gone down from previous Max Value read
   signal Half_MV_DD                   : std_logic_vector(7 downto 0);          -- half of Max_Value_Delta_Dn

   signal RstCounter                   : std_logic_vector(9 downto 0) := (others => '0');
   signal rst_tmp                      : std_logic;
   signal LastPass_DynCal              : std_logic;
   signal First_In_Term_Done           : std_logic;
   signal Inc_Flag                     : std_logic;                                 -- flag to increment Dynamic Delay
   signal Dec_Flag                     : std_logic;                                 -- flag to decrement Dynamic Delay

   signal CALMODE_EQ_CALIBRATION       : std_logic;                                 -- will calculate and set the DQS input delays if C_MC_CALIBRATION_MODE 
                                                                                    --  parameter = "CALIBRATION"
   signal DQS_DELAY_LOWER_LIMIT        : std_logic_vector(7 downto 0);              -- Lower limit for DQS input delays 
   signal DQS_DELAY_UPPER_LIMIT        : std_logic_vector(7 downto 0);              -- Upper limit for DQS input delays
   signal SKIP_DYN_IN_TERMINATION      : std_logic;                                 -- wire to allow skipping dynamic input termination if either the 
                                                                                    --  one-time or dynamic parameters are 1
   signal SKIP_DYNAMIC_DQS_CAL         : std_logic;                                 -- wire allowing skipping dynamic DQS delay calibration if either 
                                                                                    --  SKIP_DYNIMIC_CAL=1, or if C_MC_CALIBRATION_MODE=NOCALIBRATION
   signal Quarter_Max_Value            : std_logic_vector(7 downto 0);
   signal Half_Max_Value               : std_logic_vector(7 downto 0);
   signal PLL_LOCK_R1                  : std_logic;
   signal PLL_LOCK_R2                  : std_logic;
   signal MCB_RDY_BUSY_N               : std_logic;
   
   signal SELFREFRESH_REQ_R1                         : std_logic;
   signal SELFREFRESH_REQ_R2                         : std_logic;
   signal SELFREFRESH_REQ_R3                         : std_logic;
   signal SELFREFRESH_MCB_MODE_R1                    : std_logic;
   signal SELFREFRESH_MCB_MODE_R2                    : std_logic;
   signal SELFREFRESH_MCB_MODE_R3                    : std_logic;
   signal WAIT_SELFREFRESH_EXIT_DQS_CAL              : std_logic;
   signal PERFORM_START_DYN_CAL_AFTER_SELFREFRESH    : std_logic;
   signal START_DYN_CAL_STATE_R1                     : std_logic;
   signal PERFORM_START_DYN_CAL_AFTER_SELFREFRESH_R1 : std_logic;

   -- Declare intermediate signals for referenced outputs
   signal IODRP_ADD_xilinx0            : std_logic;
   signal IODRP_SDI_xilinx1            : std_logic;
   signal MCB_UIADD_xilinx2            : std_logic;
   signal MCB_UISDI_xilinx11           : std_logic;
   signal MCB_UICS_xilinx6             : std_logic;
   signal MCB_UIBROADCAST_xilinx4      : std_logic;
   signal MCB_UIADDR_int           : std_logic_vector(4 downto 0);
   signal MCB_UIDONECAL_xilinx7        : std_logic;
   signal MCB_UIREAD_xilinx10          : std_logic;
   signal SELFREFRESH_MODE_xilinx11    : std_logic;
   signal Max_Value_int                : std_logic_vector(7 downto 0);
   signal Rst_condition1               : std_logic;
   --signal Rst_condition2               : std_logic;
   signal non_violating_rst            : std_logic;
   signal WAIT_200us_COUNTER           : std_logic_vector(15 downto 0);
   signal WaitTimer                    : std_logic_vector(7 downto 0);
   signal WarmEnough                   : std_logic;
   signal WaitCountEnable : std_logic;
   signal State_Start_DynCal_R1 : std_logic;
   signal State_Start_DynCal : std_logic;
   
   signal pre_sysrst_minpulse_width_ok : std_logic;
   signal pre_sysrst_cnt : std_logic_vector(3 downto 0);

   -- This function multiplies by a constant MULT and then divides by the DIV constant
   function Mult_Divide (Input : std_logic_vector(7 downto 0); MULT : integer ; DIV : integer ) return std_logic_vector is
     variable Result : integer := 0;
     variable temp   : std_logic_vector(14 downto 0) := "000000000000000"; 
   begin
     for count in 0 to (MULT-1) loop
       temp := temp + ("0000000" & Input);
     end loop;
     Result := (to_integer(unsigned(temp))) / (DIV);
     temp   := std_logic_vector(to_unsigned(Result,15));
     return temp(7 downto 0);
   end function Mult_Divide;



   attribute syn_preserve : boolean;
   attribute syn_preserve of P_Term                  : signal is TRUE;
   attribute syn_preserve of N_Term                  : signal is TRUE;
   attribute syn_preserve of P_Term_s                  : signal is TRUE;
   attribute syn_preserve of N_Term_s                  : signal is TRUE;
   attribute syn_preserve of P_Term_w                  : signal is TRUE;
   attribute syn_preserve of N_Term_w                  : signal is TRUE;
   
   
   
   
   attribute syn_preserve of P_Term_Prev             : signal is TRUE;
   attribute syn_preserve of N_Term_Prev             : signal is TRUE;
   attribute syn_preserve of IODRPCTRLR_MEMCELL_ADDR : signal is TRUE;
   attribute syn_preserve of IODRPCTRLR_WRITE_DATA   : signal is TRUE;
   attribute syn_preserve of Max_Value_Previous      : signal is TRUE;
   attribute syn_preserve of DQS_DELAY_INITIAL       : signal is TRUE;

   attribute iob          : string;
   attribute iob of DONE_SOFTANDHARD_CAL             : signal is "FALSE";

begin


-- move the default assignment here to make FORMALITY happy.

   START_BROADCAST  <= '1';
   MCB_RECAL        <= '0';
   MCB_UIDQLOWERDEC <= '0';
   MCB_UIADDR       <= MCB_UIADDR_int;
   MCB_UIDQLOWERINC <= '0';
   MCB_UIDQUPPERDEC <= '0';
   MCB_UIDQUPPERINC <= '0';
  
  
   Max_Value        <= Max_Value_int;
   -- Drive referenced outputs
   IODRP_ADD        <= IODRP_ADD_xilinx0;
   IODRP_SDI        <= IODRP_SDI_xilinx1;
   MCB_UIADD        <= MCB_UIADD_xilinx2;
   MCB_UISDI        <= MCB_UISDI_xilinx11;
   MCB_UICS         <= MCB_UICS_xilinx6;
   MCB_UIBROADCAST  <= MCB_UIBROADCAST_xilinx4;
   MCB_UIDONECAL    <= MCB_UIDONECAL_xilinx7;
   MCB_UIREAD       <= MCB_UIREAD_xilinx10;
   SELFREFRESH_MODE <= SELFREFRESH_MODE_xilinx11;

   Inc_Dec_REFRSH_Flag     <= (Inc_Flag & Dec_Flag & MCB_UOREFRSHFLAG);
   Max_Value_Delta_Up      <= Max_Value_int - Max_Value_Previous;
   Half_MV_DU              <= ('0' & Max_Value_Delta_Up(7 downto 1));
   Max_Value_Delta_Dn      <= Max_Value_Previous - Max_Value_int;
   Half_MV_DD              <= ('0' & Max_Value_Delta_Dn(7 downto 1));
   CALMODE_EQ_CALIBRATION  <= '1' when (C_MC_CALIBRATION_MODE = "CALIBRATION") else '0'; -- will calculate and set the DQS input delays if = 1'b1
   Half_Max_Value          <= ('0' & Max_Value_int(7 downto 1));        
   Quarter_Max_Value       <= ("00" & Max_Value_int(7 downto 2)); 
   DQS_DELAY_LOWER_LIMIT   <= Quarter_Max_Value;    -- limit for DQS_DELAY for decrements; could optionally be assigned to any 8-bit hex value here
   DQS_DELAY_UPPER_LIMIT   <= Half_Max_Value;       -- limit for DQS_DELAY for increments; could optionally be assigned to any 8-bit hex value here
   SKIP_DYN_IN_TERMINATION <= '1' when ((SKIP_DYN_IN_TERM = 1) or (SKIP_IN_TERM_CAL = 1)) else '0'; 
                                                -- skip dynamic input termination if either the one-time or dynamic parameters are 1
   SKIP_DYNAMIC_DQS_CAL    <= '1' when ((CALMODE_EQ_CALIBRATION = '0') or (SKIP_DYNAMIC_CAL = 1)) else '0'; 
                                                -- skip dynamic DQS delay calibration if either SKIP_DYNAMIC_CAL=1, or if C_MC_CALIBRATION_MODE=NOCALIBRATION

   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if ((DQS_DELAY_INITIAL /= X"00") or (STATE = DONE)) then    
            DONE_SOFTANDHARD_CAL <= MCB_UODONECAL;       -- high when either DQS input delays initialized, or STATE=DONE and UODONECAL high
         else
            DONE_SOFTANDHARD_CAL <= '0';
         end if;   
      end if;
   end process;      

   iodrp_controller_inst : iodrp_controller
      port map (
         memcell_address  => IODRPCTRLR_MEMCELL_ADDR,
         write_data       => IODRPCTRLR_WRITE_DATA,
         read_data        => IODRPCTRLR_READ_DATA,
         rd_not_write     => IODRPCTRLR_R_WB,
         cmd_valid        => IODRPCTRLR_CMD_VALID,
         rdy_busy_n       => IODRPCTRLR_RDY_BUSY_N,
         use_broadcast    => '0',
         sync_rst         => RST_reg,
         DRP_CLK          => UI_CLK,
         DRP_CS           => IODRP_CS,
         DRP_SDI          => IODRP_SDI_xilinx1,
         DRP_ADD          => IODRP_ADD_xilinx0,
         DRP_SDO          => IODRP_SDO,
         DRP_BKST         => open 
      );      
   
   iodrp_mcb_controller_inst : iodrp_mcb_controller
      port map (
         memcell_address  => IODRPCTRLR_MEMCELL_ADDR,
         write_data       => IODRPCTRLR_WRITE_DATA,
         read_data        => MCB_READ_DATA,
         rd_not_write     => IODRPCTRLR_R_WB,
         cmd_valid        => MCB_CMD_VALID,
         rdy_busy_n       => MCB_RDY_BUSY_N,
         use_broadcast    => MCB_USE_BKST,
         drp_ioi_addr     => MCB_UIADDR_int,
         sync_rst         => RST_reg,
         DRP_CLK          => UI_CLK,
         DRP_CS           => MCB_UICS_xilinx6,
         DRP_SDI          => MCB_UISDI_xilinx11,
         DRP_ADD          => MCB_UIADD_xilinx2,
         DRP_BKST         => MCB_UIBROADCAST_xilinx4,
         DRP_SDO          => MCB_UOSDO,
         MCB_UIREAD       => MCB_UIREAD_xilinx10
      );
      
      process (UI_CLK, RST) begin
         if (RST = '1') then
           if (C_SIMULATION = "TRUE") then
             WAIT_200us_COUNTER <= X"7FF0";
           else
             WAIT_200us_COUNTER <= (others => '0');
           end if;
         elsif (UI_CLK'event and UI_CLK = '1') then
            if (WAIT_200us_COUNTER(15) = '1') then
                 WAIT_200us_COUNTER <= WAIT_200us_COUNTER;
            else
                 WAIT_200us_COUNTER <= WAIT_200us_COUNTER + '1';
            end if;
         end if;
      end process;

 --  init_sequence_skip: if (C_SIMULATION = "TRUE") generate
 --     WAIT_200us_COUNTER <= X"FFFF";
 --     process
 --     begin
 --        report "The 200 us wait period required before CKE goes active has been skipped in Simulation";
 --        wait;
 --     end process;
 --  end generate;
            
      
   gen_CKE_Train_a: if (C_MEM_TYPE = "DDR2") generate 
   process (UI_CLK, RST) begin
      if (RST = '1') then
          CKE_Train <= '0';
      elsif (UI_CLK'event and UI_CLK = '1') then
         if (STATE = WAIT_FOR_UODONE  and MCB_UODONECAL = '1') then
              CKE_Train <= '0';
         elsif (WAIT_200us_COUNTER(15) = '1' and MCB_UODONECAL = '0') then
              CKE_Train <= '1';
         else
              CKE_Train <= '0';
         end if;
      end if;
   end process;       
   end generate  ;  
      
   gen_CKE_Train_b: if (not(C_MEM_TYPE = "DDR2")) generate 
   process (UI_CLK) begin
      if (UI_CLK'event and UI_CLK = '1') then
          CKE_Train <= '0';
      end if;
   end process;       
   end generate    ;
      
--********************************************
-- PLL_LOCK and RST signals
--********************************************
   --MCB_SYSRST <= Pre_SYSRST or RST_reg;               -- Pre_SYSRST is generated from the STATE state machine, and is OR'd with RST_reg input to drive MCB's
                                                      --  SYSRST pin (MCB_SYSRST)
   
   rst_tmp <= not(SELFREFRESH_MODE_xilinx11) and not(PLL_LOCK_R2); -- rst_tmp becomes 1 if you lose Lock and the device is not in SUSPEND 

   process (UI_CLK, RST) begin
     if (RST = '1') then
       --Block_Reset <= '0';
       --RstCounter  <= (others => '0');
     --elsif (UI_CLK'event and UI_CLK = '1') then  
       -- if (rst_tmp = '1') then                     -- this is to deal with not allowing the user-reset "RST" to violate TZQINIT_MAXCNT (min time between resets to DDR3)
          Block_Reset <= '0';
          RstCounter  <= (others => '0');
     elsif (UI_CLK'event and UI_CLK = '1') then  
          Block_Reset <= '0';                      -- default to allow STATE to move out of RST_DELAY state
          if (Pre_SYSRST = '1') then
            RstCounter  <= RST_CNT;                -- whenever STATE wants to reset the MCB, set RstCounter to h10
          else                                                                                                   
            if (RstCounter < TZQINIT_MAXCNT) then  -- if RstCounter is less than d512 than this will execute
              Block_Reset <= '1';                  -- STATE won't exit RST_DELAY state
              RstCounter  <= RstCounter + "1";     -- and Rst_Counter increments
            end if;
          end if;
        end if;
     --end if;
   end process;
 
  -- Rst_contidtion1 is to make sure RESET will not happen again within TZQINIT_MAXCNT
  non_violating_rst <= RST and Rst_condition1;
  MCB_SYSRST <= Pre_SYSRST;

  process (UI_CLK) begin
    if (UI_CLK'event and UI_CLK = '1') then
       if (RstCounter >= TZQINIT_MAXCNT) then
          Rst_condition1 <= '1';
       else
          Rst_condition1 <= '0';
       end if;
    end if;
  end process;
  
-- -- non_violating_rst asserts whenever (system-level reset) RST is asserted but must be after TZQINIT_MAXCNT is reached (min-time between resets for DDR3)
-- -- After power stablizes, we will hold MCB in reset state for at least 200us before beginning initialization  process.   
-- -- If the PLL loses lock during normal operation, no ui_clk will be present because mcb_drp_clk is from a BUFGCE which
--    is gated by pll's lock signal.   When the PLL locks again, the RST_reg stays asserted for at least 200 us which
--    will cause MCB to reset and reinitialize the memory afterwards.
-- -- During SUSPEND operation, the PLL will lose lock but non_violating_rst remains low (de-asserted) and WAIT_200us_COUNTER stays at 
--    its terminal count.  The PLL_LOCK input does not come direct from PLL, rather it is driven by gated_pll_lock from mcb_raw_wrapper module
--    The gated_pll_lock in the mcb_raw_wrapper does not de-assert during SUSPEND operation, hence PLL_LOCK will not de-assert, and the soft calibration 
--    state machine will not reset during SUSPEND.
-- -- RST_reg is the control signal that resets the mcb_soft_calibration's State Machine. The MCB_SYSRST is now equal to 
--    Pre_SYSRST. When State Machine is performing "INPUT Termination Calibration", it holds the MCB in reset by assertign MCB_SYSRST. 
--    It will deassert the MCB_SYSRST so that it can grab the bus to broadcast the P and N term value to all of the DQ pins. Once the calibrated INPUT 
--    termination is set, the State Machine will issue another short MCB_SYSRST so that MCB will use the tuned input termination during DQS preamble calibration.
  

   --process (UI_CLK) begin
   -- if (UI_CLK'event and UI_CLK = '1') then
   --  
   --    if (RstCounter < RST_CNT) then
   --       Rst_condition2 <= '1';
   --    else
   --       Rst_condition2 <= '0';
   --    end if;
   -- end if;
   --end process;
  
   process (UI_CLK, non_violating_rst) begin
     if (non_violating_rst = '1') then
        RST_reg <= '1';                                  -- STATE and MCB_SYSRST will both be reset if you lose lock when the device is not in SUSPEND 
     elsif (UI_CLK'event and UI_CLK = '1') then 
       if (WAIT_200us_COUNTER(15) = '0')  then
        RST_reg <= '1';
       else
        --RST_reg <= Rst_condition2 or rst_tmp;                                  -- insures RST_reg is at least h10 pulses long
        RST_reg <= rst_tmp;                                  -- insures RST_reg is at least h10 pulses long
       end if;
     end if;
   end process;
   
--*************************************************************
-- Stretching the pre_sysrst to satisfy the minimum pulse width
--*************************************************************

process (UI_CLK) begin
if (UI_CLK'event and UI_CLK = '1') then 
  if (STATE = START_DYN_CAL_PRE) then
    pre_sysrst_cnt <= pre_sysrst_cnt + '1';
  else
    pre_sysrst_cnt <= (others=>'0');
  end if;
end if;
end process;

pre_sysrst_minpulse_width_ok <= pre_sysrst_cnt(3);

--********************************************
-- SUSPEND Logic
--********************************************
   process (UI_CLK,RST)
   begin
      if (RST = '1') then

         SELFREFRESH_MCB_MODE_R1 <= '0';
         SELFREFRESH_MCB_MODE_R2 <= '0';
         SELFREFRESH_MCB_MODE_R3 <= '0';

         SELFREFRESH_REQ_R1      <= '0';
         SELFREFRESH_REQ_R2      <= '0';
         SELFREFRESH_REQ_R3      <= '0';
         
         PLL_LOCK_R1             <= '0';
         PLL_LOCK_R2             <= '0';

      elsif (UI_CLK'event and UI_CLK = '1') then
         -- SELFREFRESH_MCB_MODE is clocked by sysclk_2x_180
         SELFREFRESH_MCB_MODE_R1 <= SELFREFRESH_MCB_MODE;
         SELFREFRESH_MCB_MODE_R2 <= SELFREFRESH_MCB_MODE_R1;
         SELFREFRESH_MCB_MODE_R3 <= SELFREFRESH_MCB_MODE_R2;

         -- SELFREFRESH_REQ is clocked by user's application clock
         SELFREFRESH_REQ_R1      <= SELFREFRESH_REQ;
         SELFREFRESH_REQ_R2      <= SELFREFRESH_REQ_R1;
         SELFREFRESH_REQ_R3      <= SELFREFRESH_REQ_R2;

         PLL_LOCK_R1             <= PLL_LOCK;
         PLL_LOCK_R2             <= PLL_LOCK_R1;
         
      end if;
   end process;      
              
-- SELFREFRESH should only be deasserted after PLL_LOCK is asserted.
-- This is to make sure MCB get a locked sys_2x_clk before exiting
-- SELFREFRESH mode.
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
            SELFREFRESH_MCB_REQ <= '0';
         --elsif ((PLL_LOCK_R2 = '1') and (SELFREFRESH_REQ_R3 = '0') and (STATE = START_DYN_CAL)) then
         elsif ((PLL_LOCK_R2 = '1') and (SELFREFRESH_REQ_R3 = '0')) then
            SELFREFRESH_MCB_REQ <=  '0';
         elsif ((STATE = START_DYN_CAL) and (SELFREFRESH_REQ_R3 = '1')) then  
            SELFREFRESH_MCB_REQ <= '1';
         end if;
      end if;
   end process;

   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
            WAIT_SELFREFRESH_EXIT_DQS_CAL <= '0';
         elsif ((SELFREFRESH_MCB_MODE_R2 = '1') and (SELFREFRESH_MCB_MODE_R3 = '0')) then
            WAIT_SELFREFRESH_EXIT_DQS_CAL <=  '1';
         elsif ((WAIT_SELFREFRESH_EXIT_DQS_CAL = '1') and (SELFREFRESH_REQ_R3 = '0') and (PERFORM_START_DYN_CAL_AFTER_SELFREFRESH = '1')) then  
                                                                                                                      -- START_DYN_CAL is next state
            WAIT_SELFREFRESH_EXIT_DQS_CAL <= '0';
         end if;
      end if;
   end process;

-- Need to detect when SM entering START_DYN_CAL
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
            PERFORM_START_DYN_CAL_AFTER_SELFREFRESH <= '0';
            START_DYN_CAL_STATE_R1                  <= '0';
         else
         -- register PERFORM_START_DYN_CAL_AFTER_SELFREFRESH to detect end of cycle              
            PERFORM_START_DYN_CAL_AFTER_SELFREFRESH_R1 <= PERFORM_START_DYN_CAL_AFTER_SELFREFRESH;
            if (STATE = START_DYN_CAL) then
               START_DYN_CAL_STATE_R1   <= '1';
            else   
               START_DYN_CAL_STATE_R1   <= '0';
            end if;   
            if ((WAIT_SELFREFRESH_EXIT_DQS_CAL = '1') and (STATE /= START_DYN_CAL) and (START_DYN_CAL_STATE_R1 = '1')) then
               PERFORM_START_DYN_CAL_AFTER_SELFREFRESH <= '1';
            elsif ((STATE = START_DYN_CAL) and (SELFREFRESH_MCB_MODE_R3 = '0')) then
               PERFORM_START_DYN_CAL_AFTER_SELFREFRESH <= '0';
            end if;
         end if;
      end if;
   end process;      

-- SELFREFRESH_MCB_MODE deasserted status is hold off
-- until Soft_Calib has at least done one loop of DQS update.
-- New logic WarmeEnough is added to make sure PLL_Lock is lockec and all IOs stable before 
-- deassert the status of MCB's SELFREFRESH_MODE.  This is to ensure all IOs are stable before
-- user logic sending new commands to MCB.
   
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
            SELFREFRESH_MODE_xilinx11 <= '0';
         elsif (SELFREFRESH_MCB_MODE_R2 = '1') then
            SELFREFRESH_MODE_xilinx11 <=  '1';
         elsif (WarmEnough = '1') then
            SELFREFRESH_MODE_xilinx11 <= '0';
         end if;
      end if;
   end process;




   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
           WaitCountEnable <= '0';
         elsif (SELFREFRESH_REQ_R2 = '0' and SELFREFRESH_REQ_R1 = '1') then  
           WaitCountEnable <= '0';
         elsif ((PERFORM_START_DYN_CAL_AFTER_SELFREFRESH = '0') and (PERFORM_START_DYN_CAL_AFTER_SELFREFRESH_R1 = '1')) then  
           WaitCountEnable <= '1';
         else
           WaitCountEnable <=  WaitCountEnable;
         end if;
      end if;
   end process;


   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
           State_Start_DynCal <= '0';
         elsif (STATE = START_DYN_CAL) then  
           State_Start_DynCal <= '1';
         else
           State_Start_DynCal <= '0';
         end if;
       end if;
     end process;

   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
           State_Start_DynCal_R1 <= '0';
        else 
           State_Start_DynCal_R1 <= State_Start_DynCal;
         end if;
       end if;
     end process;


   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST = '1') then
            WaitTimer <= (others => '0');
            WarmEnough <= '1';
          elsif ((SELFREFRESH_REQ_R2 = '0') and (SELFREFRESH_REQ_R1 = '1'))  then
            WaitTimer <= (others => '0');
            WarmEnough <= '0';
          elsif (WaitTimer = X"04") then 
            WaitTimer <= WaitTimer ;
            WarmEnough <= '1';
          elsif (WaitCountEnable  = '1') then
            WaitTimer <= WaitTimer + '1';
          else
            WaitTimer <= WaitTimer ;
          end if;  
        end if;
      end process;

--********************************************
--Comparitor for Dynamic Calibration circuit
--********************************************
   Dec_Flag <= '1' when (TARGET_DQS_DELAY < DQS_DELAY) else '0';
   Inc_Flag <= '1' when (TARGET_DQS_DELAY > DQS_DELAY) else '0';
   
--*********************************************************************************************
--Counter for extra clock cycles injected after setting Calibrate bit in IODRP2 for Dynamic Cal
--*********************************************************************************************
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST_reg = '1') then
            count <= "000000";
         elsif (counter_en = '1') then
            count <= count + "000001";
         else
            count <= "000000";
         end if;
      end if;
   end process;
   
--*********************************************************************************************
-- Capture narrow MCB_UODATAVALID pulse - only one sysclk90 cycle wide
--*********************************************************************************************
   process (UI_CLK, MCB_UODATAVALID)
   begin
     if(MCB_UODATAVALID = '1') then
       MCB_UODATAVALID_U <= '1';
     elsif(UI_CLK'event and UI_CLK = '1') then
       MCB_UODATAVALID_U <= MCB_UODATAVALID;
     end if;
   end process;
   
--**************************************************************************************************************
--Always block to mux SDI, SDO, CS, and ADD depending on which IODRP is active: RZQ, ZIO or MCB's UI port (to IODRP2_MCBs)
--**************************************************************************************************************
   process (Active_IODRP,  IODRP_CS, RZQ_IODRP_SDO,  ZIO_IODRP_SDO)
   begin
      case Active_IODRP is
         when RZQ =>
            RZQ_IODRP_CS <= IODRP_CS;
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= RZQ_IODRP_SDO;
         when ZIO =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= IODRP_CS;
            IODRP_SDO <= ZIO_IODRP_SDO;
         when MCB_PORT =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= '0';
         when others =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= '0';
      end case;
   end process;
      
--******************************************************************
--State Machine's Always block / Case statement for Next State Logic
--
--The WAIT1,2,etc states were required after every state where the
--DRP controller was used to do a write to the IODRPs - this is because
--there's a clock cycle latency on IODRPCTRLR_RDY_BUSY_N whenever the DRP controller
--sees IODRPCTRLR_CMD_VALID go high.  OFF_RZQ_PTERM and OFF_ZIO_NTERM were added
--soley for the purpose of reducing power, particularly on RZQ as
--that pin is expected to have a permanent external resistor to gnd.
--******************************************************************
   NEXT_STATE_LOGIC: process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST_reg = '1') then                         -- Synchronous reset
            MCB_CMD_VALID           <= '0';
            MCB_UIADDR_int      <= "00000";          -- take control of UI/UO port
            MCB_UICMDEN             <= '1';              -- tells MCB that it is in Soft Cal.
            MCB_UIDONECAL_xilinx7   <= '0';
            MCB_USE_BKST            <= '0';
            MCB_UIDRPUPDATE         <= '1';             
            Pre_SYSRST              <= '1';              -- keeps MCB in reset
            IODRPCTRLR_CMD_VALID    <= '0';
            IODRPCTRLR_MEMCELL_ADDR <= NoOp;
            IODRPCTRLR_WRITE_DATA   <= "00000000";
            IODRPCTRLR_R_WB         <= WRITE_MODE;
            IODRPCTRLR_USE_BKST     <= '0';
            P_Term                  <= "000000";
            N_Term                  <= "0000000";
            P_Term_s                <= "000000";
            N_Term_w                <= "0000000";
            P_Term_w                <= "000000";
            N_Term_s                <= "0000000";
            
            P_Term_Prev             <= "000000";
            N_Term_Prev             <= "0000000";
            Active_IODRP            <= RZQ;
            MCB_UILDQSINC           <= '0';              --no inc or dec
            MCB_UIUDQSINC           <= '0';              --no inc or dec
            MCB_UILDQSDEC           <= '0';              --no inc or dec
            MCB_UIUDQSDEC           <= '0';
            counter_en              <= '0';              --flag that the First Dynamic Calibration completed
            First_Dyn_Cal_Done      <= '0';
            Max_Value_int           <= "00000000";
            Max_Value_Previous      <= "00000000";
            STATE                   <= START;
            DQS_DELAY               <= "00000000";
            DQS_DELAY_INITIAL       <= "00000000";
            TARGET_DQS_DELAY        <= "00000000";
            LastPass_DynCal         <= IN_TERM_PASS;
            First_In_Term_Done      <= '0';
            MCB_UICMD               <= '0';
            MCB_UICMDIN             <= '0';
            MCB_UIDQCOUNT           <= "0000";
            counter_inc             <= "00000000";
            counter_dec             <= "00000000";
         else
            counter_en              <= '0';
            IODRPCTRLR_CMD_VALID    <= '0';
            IODRPCTRLR_MEMCELL_ADDR <= NoOp;
            IODRPCTRLR_R_WB         <= READ_MODE;
            IODRPCTRLR_USE_BKST     <= '0';
            MCB_CMD_VALID           <= '0';              --no inc or dec
            MCB_UILDQSINC           <= '0';              --no inc or dec
            MCB_UIUDQSINC           <= '0';              --no inc or dec
            MCB_UILDQSDEC           <= '0';              --no inc or dec
            MCB_UIUDQSDEC           <= '0';
            MCB_USE_BKST            <= '0';
            MCB_UICMDIN             <= '0';
            DQS_DELAY               <= DQS_DELAY;
            TARGET_DQS_DELAY        <= TARGET_DQS_DELAY;

            case STATE is               
               when START =>    --h00
                  MCB_UICMDEN           <= '1';          -- take control of UI/UO port
                  MCB_UIDONECAL_xilinx7 <= '0';          -- tells MCB that it is in Soft Cal.
                  P_Term                <= "000000";
                  N_Term                <= "0000000";
                  Pre_SYSRST            <= '1';          -- keeps MCB in reset
                  LastPass_DynCal       <= IN_TERM_PASS;
                  if (SKIP_IN_TERM_CAL = 1) then
                     --STATE <= WRITE_CALIBRATE;
                     STATE <= WAIT_FOR_START_BROADCAST;
                     P_Term                <= "000000";
                     N_Term                <= "0000000";
                  elsif (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_NTERM;
                  else
                     STATE <= START;
                  end if;
               --***************************
               -- IOB INPUT TERMINATION CAL
               --***************************
               when LOAD_RZQ_NTERM =>   --h01
                  Active_IODRP            <= RZQ;
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA   <= ('0' & N_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_NTERM;
                  else
                     STATE <= WAIT1;
                  end if;

               when WAIT1 =>    --h02
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT1;
                  else
                     STATE <= LOAD_RZQ_PTERM;
                  end if;

               when LOAD_RZQ_PTERM =>   --h03
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA   <= ("00" & P_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_PTERM;
                  else
                     STATE <= WAIT2;
                  end if;

               when WAIT2 =>    --h04
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT2;
                  elsif ((RZQ_IN = '1') or (P_Term = "111111")) then
                     STATE <= MULTIPLY_DIVIDE; -- LOAD_ZIO_PTERM
                  else
                     STATE <= INC_PTERM;
                  end if;

               when INC_PTERM =>        --h05
                  P_Term <= P_Term + "000001";
                  STATE <= LOAD_RZQ_PTERM;

               when MULTIPLY_DIVIDE =>  -- h06 
                  -- 13/4/2011 compensate the added sync FF
                  P_Term <= Mult_Divide(("00" & (P_Term - '1')),MULT,DIV)(5 downto 0);
                  STATE  <= LOAD_ZIO_PTERM;

               when LOAD_ZIO_PTERM =>           --h07
                  Active_IODRP            <= ZIO;
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA   <= ("00" & P_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_ZIO_PTERM;
                  else
                     STATE <= WAIT3;
                  end if;

               when WAIT3 =>    --h08
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT3;
                  else
                     STATE <= LOAD_ZIO_NTERM;
                  end if;

               when LOAD_ZIO_NTERM =>   --h09
                  Active_IODRP            <= ZIO;
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA   <= ('0' & N_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_ZIO_NTERM;
                  else
                     STATE <= WAIT4;
                  end if;

               when WAIT4 =>            --h0A
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT4;
                  elsif (((not(ZIO_IN))) = '1' or (N_Term = "1111111")) then
                     if (PNSKEW = '1') then       
                        STATE <= SKEW;
                     else
                        STATE <= WAIT_FOR_START_BROADCAST;
                     end if;            
                  else
                     STATE <= INC_NTERM;
                  end if;

               when INC_NTERM =>                --h0B
                  N_Term <= N_Term + "0000001";
                  STATE  <= LOAD_ZIO_NTERM;             

               when SKEW =>     -- h0C
               
                  P_Term_s <= Mult_Divide(("00" & P_Term), MULT_S, DIV_S)(5 downto 0);
                  N_Term_w <= Mult_Divide(('0' & (N_Term-'1')),  MULT_W, DIV_W)(6 downto 0);
                  P_Term_w <= Mult_Divide(("00" & P_Term), MULT_W, DIV_W)(5 downto 0);
                  N_Term_s <= Mult_Divide(('0' & (N_Term-'1')),  MULT_S, DIV_S)(6 downto 0);
                  P_Term <= Mult_Divide(("00" & P_Term), MULT_S, DIV_S)(5 downto 0);
                  N_Term <= Mult_Divide(('0' & (N_Term-'1')), MULT_W, DIV_W)(6 downto 0);
                  STATE  <= WAIT_FOR_START_BROADCAST;

               when WAIT_FOR_START_BROADCAST => --h0D
                  Pre_SYSRST <= '0';       -- release SYSRST, but keep UICMDEN=1 and UIDONECAL=0. This is needed to do Broadcast through UI interface, while 
                                           --  keeping the MCB in calibration mode
                  Active_IODRP <= MCB_PORT;
                  if ((START_BROADCAST and IODRPCTRLR_RDY_BUSY_N) = '1') then
                    if ((P_Term /= P_Term_Prev) or (SKIP_IN_TERM_CAL = 1)) then
                      STATE       <= BROADCAST_PTERM;
                      P_Term_Prev <= P_Term;
                    elsif (N_Term /= N_Term_Prev) then
                      N_Term_Prev <= N_Term;
                      STATE       <= BROADCAST_NTERM;
                    else
                      STATE <= OFF_RZQ_PTERM;
                    end if;
                  else
                     STATE <= WAIT_FOR_START_BROADCAST;
                  end if;

               when BROADCAST_PTERM =>  --h0E
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA   <= ("00" & P_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  MCB_CMD_VALID           <= '1';
                  MCB_UIDRPUPDATE         <= not First_In_Term_Done; -- Set the update flag if this is the first time through
                  MCB_USE_BKST            <= '1';
                  if (MCB_RDY_BUSY_N = '1') then
                     STATE <= BROADCAST_PTERM;
                  else
                     STATE <= WAIT5;
                  end if;

               when WAIT5 =>    --h0F
                  if ((not(MCB_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT5;
                  elsif (First_In_Term_Done = '1') then -- If first time through is already set, then this must be dynamic in term
                     if (MCB_UOREFRSHFLAG = '1')then
                        MCB_UIDRPUPDATE <= '1';
                        if (N_Term /= N_Term_Prev) then
                           N_Term_Prev <= N_Term;
                           STATE       <= BROADCAST_NTERM;
                        else  
                           STATE       <= OFF_RZQ_PTERM;
                         end if;
                     else
                        STATE <= WAIT5;  -- wait for a Refresh cycle
                     end if;            
                  else
                     N_Term_Prev <= N_Term;
                     STATE <= BROADCAST_NTERM;
                  end if;

               when BROADCAST_NTERM =>  -- h10
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA   <= ("0" & N_Term);
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  MCB_CMD_VALID           <= '1';
                  MCB_USE_BKST            <= '1';
                  MCB_UIDRPUPDATE         <= not(First_In_Term_Done); -- Set the update flag if this is the first time through
                  if (MCB_RDY_BUSY_N = '1') then
                     STATE <= BROADCAST_NTERM;
                  else
                     STATE <= WAIT6;
                  end if;

               when WAIT6 =>    -- h11
                  if (MCB_RDY_BUSY_N = '0') then
                     STATE <= WAIT6;
                  elsif (First_In_Term_Done = '1') then  -- If first time through is already set, then this must be dynamic in term
                    if (MCB_UOREFRSHFLAG = '1')then
                      MCB_UIDRPUPDATE <= '1';
                      STATE           <= OFF_RZQ_PTERM;
                    else
                      STATE <= WAIT6;   -- wait for a Refresh cycle
                    end if;
                  else
                    -- if (PNSKEWDQS = '1') then
                       STATE <= LDQS_CLK_WRITE_P_TERM;
                   --  else
                   --    STATE <= OFF_RZQ_PTERM;
                   --  end if;
                  end if;

-- *********************
               when LDQS_CLK_WRITE_P_TERM =>    -- h12
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= "00" & P_Term_w;
                  MCB_UIADDR_int              <= IOI_LDQS_CLK;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1') then
                    STATE <= LDQS_CLK_WRITE_P_TERM;
                  else
                    STATE <= LDQS_CLK_P_TERM_WAIT;
                  end if;
                
        
               when LDQS_CLK_P_TERM_WAIT =>    --7'h13  
                 if (MCB_RDY_BUSY_N  = '0') then
                   STATE   <= LDQS_CLK_P_TERM_WAIT;
                 else 
                   STATE   <= LDQS_CLK_WRITE_N_TERM;
                 end if;        
        
               when  LDQS_CLK_WRITE_N_TERM =>  --7'h14
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= '0' & N_Term_s;
                  MCB_UIADDR_int              <= IOI_LDQS_CLK;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1') then
                    STATE <= LDQS_CLK_WRITE_N_TERM;
                  else
                    STATE <= LDQS_CLK_N_TERM_WAIT;
                  end if;
        
   --**     
               when  LDQS_CLK_N_TERM_WAIT =>   --7'h15
                  if (MCB_RDY_BUSY_N  = '0') then
                    STATE <= LDQS_CLK_N_TERM_WAIT;
                  else 
                    STATE           <= LDQS_PIN_WRITE_P_TERM;
                 end if;
                
                
               when   LDQS_PIN_WRITE_P_TERM => --7'h16
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= "00" & P_Term_s;
                  MCB_UIADDR_int              <= IOI_LDQS_PIN;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1')  then
                    STATE <= LDQS_PIN_WRITE_P_TERM;
                  else
                    STATE <= LDQS_PIN_P_TERM_WAIT;
                  end if;
                
                
               when  LDQS_PIN_P_TERM_WAIT =>   --7'h17
                  if (MCB_RDY_BUSY_N  = '0')  then
                    STATE <= LDQS_PIN_P_TERM_WAIT;
                  else 
                    STATE    <= LDQS_PIN_WRITE_N_TERM;
                  end if;
               
                
                when  LDQS_PIN_WRITE_N_TERM => --7'h18
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= '0' & N_Term_w;
                  MCB_UIADDR_int              <= IOI_LDQS_PIN;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1')  then
                    STATE <= LDQS_PIN_WRITE_N_TERM;
                  else
                    STATE <= LDQS_PIN_N_TERM_WAIT;
                  end if;
                
                
               when  LDQS_PIN_N_TERM_WAIT =>  --7'h19
                  if (MCB_RDY_BUSY_N  = '0')  then
                    STATE <= LDQS_PIN_N_TERM_WAIT;
                  else 
                    STATE           <= UDQS_CLK_WRITE_P_TERM;
                  end if;
               
                
                
               when  UDQS_CLK_WRITE_P_TERM => --7'h1A
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= "00" & P_Term_w;
                  MCB_UIADDR_int              <= IOI_UDQS_CLK;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1')  then
                    STATE <= UDQS_CLK_WRITE_P_TERM;
                  else
                    STATE <= UDQS_CLK_P_TERM_WAIT;
                  end if;
                
                
               when  UDQS_CLK_P_TERM_WAIT => --7'h1B
                  if (MCB_RDY_BUSY_N  = '0')  then
                    STATE <= UDQS_CLK_P_TERM_WAIT;
                  else 
                    STATE           <= UDQS_CLK_WRITE_N_TERM;
                  end if;
                
                
               when  UDQS_CLK_WRITE_N_TERM => --7'h1C
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= '0' & N_Term_s;
                  MCB_UIADDR_int              <= IOI_UDQS_CLK;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N  = '1')  then
                    STATE <= UDQS_CLK_WRITE_N_TERM;
                  else
                    STATE <= UDQS_CLK_N_TERM_WAIT;
                  end if;
                
               when UDQS_CLK_N_TERM_WAIT => --7'h1D
                  if (MCB_RDY_BUSY_N  = '0') then
                    STATE <= UDQS_CLK_N_TERM_WAIT;
                  else 
                    STATE           <= UDQS_PIN_WRITE_P_TERM;
                  end if;
                
                
                
                when  UDQS_PIN_WRITE_P_TERM => --7'h1E
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= "00" & P_Term_s;
                  MCB_UIADDR_int              <= IOI_UDQS_PIN;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N = '1')  then
                    STATE <= UDQS_PIN_WRITE_P_TERM;
                  else
                    STATE <= UDQS_PIN_P_TERM_WAIT;
                  end if;
                
                
               when UDQS_PIN_P_TERM_WAIT =>  --7'h1F
                  if (MCB_RDY_BUSY_N = '0')  then
                    STATE <= UDQS_PIN_P_TERM_WAIT;
                  else 
                    STATE           <= UDQS_PIN_WRITE_N_TERM;
                  end if;
                
                when  UDQS_PIN_WRITE_N_TERM =>  --7'h20
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  IODRPCTRLR_WRITE_DATA   <= '0' & N_Term_w;
                  MCB_UIADDR_int              <= IOI_UDQS_PIN;
                  MCB_CMD_VALID           <= '1';
                  if (MCB_RDY_BUSY_N = '1')  then
                    STATE <= UDQS_PIN_WRITE_N_TERM;
                  else
                    STATE <= UDQS_PIN_N_TERM_WAIT;
                  end if;
                
                
                when  UDQS_PIN_N_TERM_WAIT =>   --7'h21
                  if (MCB_RDY_BUSY_N = '0')  then
                    STATE <= UDQS_PIN_N_TERM_WAIT;
                  else 
                    STATE           <= OFF_RZQ_PTERM;
                  end if;
               
-- *********************


               when OFF_RZQ_PTERM =>    -- h22
                  Active_IODRP            <= RZQ;
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA   <= "00000000";
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  P_Term                  <= "000000";
                  N_Term                  <= "0000000";
                  MCB_UIDRPUPDATE         <= not(First_In_Term_Done); -- Set the update flag if this is the first time through
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= OFF_RZQ_PTERM;
                  else
                     STATE <= WAIT7;
                  end if;

               when WAIT7 =>    -- h23
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT7;
                  else
                     STATE <= OFF_ZIO_NTERM;
                  end if;

               when OFF_ZIO_NTERM =>    -- h24
                  Active_IODRP            <= ZIO;
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA   <= "00000000";
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= OFF_ZIO_NTERM;
                  else
                     STATE <= WAIT8;
                  end if;

               when WAIT8 =>    -- h25
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT8;
                  else   
                     if (First_In_Term_Done = '1') then
                        STATE <= START_DYN_CAL;    -- No need to reset the MCB if we are in InTerm tuning
                     else
                        STATE <= WRITE_CALIBRATE;  -- go read the first Max_Value_int from RZQ
                     end if;
                  end if;   

              when RST_DELAY =>      -- h26
                --MCB_UICMDEN <= '0';          -- release control of UI/UO port      
                if (Block_Reset = '1') then  -- this ensures that more than 512 clock cycles occur since the last reset after MCB_WRITE_CALIBRATE ???
                 STATE <= RST_DELAY;
               else 
                 STATE <= START_DYN_CAL_PRE;
               end if;

--***************************
--DYNAMIC CALIBRATION PORTION
--***************************
               when START_DYN_CAL_PRE =>        -- h27
                  LastPass_DynCal       <= IN_TERM_PASS;
                  MCB_UICMDEN           <= '0';          -- release UICMDEN
                  MCB_UIDONECAL_xilinx7 <= '1';          -- release UIDONECAL - MCB will now initialize.
                  Pre_SYSRST            <= '1';          -- SYSRST pulse
                  if (CALMODE_EQ_CALIBRATION = '0') then -- if C_MC_CALIBRATION_MODE is set to NOCALIBRATION
                    STATE       <= START_DYN_CAL;        -- we'll skip setting the DQS delays manually
                  elsif (pre_sysrst_minpulse_width_ok = '1') then
                    STATE       <= WAIT_FOR_UODONE;
                  end if;

               when WAIT_FOR_UODONE =>          -- h28
                 Pre_SYSRST    <= '0';                   -- SYSRST pulse
                 if ((IODRPCTRLR_RDY_BUSY_N and MCB_UODONECAL) = '1')then --IODRP Controller needs to be ready, & MCB needs to be done with hard calibration
                   MCB_UICMDEN         <= '1';           -- grab UICMDEN
                   DQS_DELAY_INITIAL   <= Mult_Divide(Max_Value_int, DQS_NUMERATOR, DQS_DENOMINATOR);
                   STATE               <= LDQS_WRITE_POS_INDELAY;
                 else
                   STATE               <= WAIT_FOR_UODONE;
                 end if;

               when LDQS_WRITE_POS_INDELAY =>   -- h29 
                 IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
                 MCB_UIADDR_int     <= IOI_LDQS_CLK;
                 MCB_CMD_VALID           <= '1';
                 if (MCB_RDY_BUSY_N = '1') then 
                   STATE <= LDQS_WRITE_POS_INDELAY;
                 else
                   STATE <= LDQS_WAIT1;
                 end if;

               when LDQS_WAIT1 =>       -- h2A
                 if (MCB_RDY_BUSY_N = '0')then
                   STATE <= LDQS_WAIT1;
                 else
                   STATE <= LDQS_WRITE_NEG_INDELAY;      
                 end if;

              when LDQS_WRITE_NEG_INDELAY =>    -- h2B
                IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
                IODRPCTRLR_R_WB         <= WRITE_MODE;
                IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
                MCB_UIADDR_int      <= IOI_LDQS_CLK;
                MCB_CMD_VALID           <= '1';
                if (MCB_RDY_BUSY_N = '1')then 
                  STATE <= LDQS_WRITE_NEG_INDELAY;
                else
                  STATE <= LDQS_WAIT2;
                end if;

               when LDQS_WAIT2 =>           -- 7'h2C
                 if(MCB_RDY_BUSY_N = '0')then
                   STATE <= LDQS_WAIT2;
                 else
                   STATE <= UDQS_WRITE_POS_INDELAY;
                 end if;

               when  UDQS_WRITE_POS_INDELAY =>  -- 7'h2D
                 IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
                 MCB_UIADDR_int      <= IOI_UDQS_CLK;
                 MCB_CMD_VALID           <= '1';
                 if (MCB_RDY_BUSY_N = '1')then
                   STATE <= UDQS_WRITE_POS_INDELAY;
                 else
                   STATE <= UDQS_WAIT1;
                 end if;

               when UDQS_WAIT1 =>           -- 7'h2E
                 if (MCB_RDY_BUSY_N = '0')then
                   STATE <= UDQS_WAIT1;
                 else 
                   STATE <= UDQS_WRITE_NEG_INDELAY;
                 end if;

               when UDQS_WRITE_NEG_INDELAY => -- 7'h2F
                 IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
                 MCB_UIADDR_int     <= IOI_UDQS_CLK;
                 MCB_CMD_VALID           <= '1';
                 if (MCB_RDY_BUSY_N = '1')then
                   STATE <= UDQS_WRITE_NEG_INDELAY;
                else
                  STATE <= UDQS_WAIT2;
                end if;

               when UDQS_WAIT2 => -- 7'h30
                 if (MCB_RDY_BUSY_N = '0')then
                   STATE <= UDQS_WAIT2;
                 else 
                    DQS_DELAY         <= DQS_DELAY_INITIAL;
                    TARGET_DQS_DELAY  <= DQS_DELAY_INITIAL;
                    STATE             <= START_DYN_CAL;
                end if;

               when START_DYN_CAL =>    -- h31
                  Pre_SYSRST  <= '0';                    -- SYSRST not driven
                  counter_inc <= (others => '0');
                  counter_dec <= (others => '0');
                  if (SKIP_DYNAMIC_DQS_CAL = '1' and SKIP_DYN_IN_TERMINATION = '1')then
                     STATE <= DONE;                      --if we're skipping both dynamic algorythms, go directly to DONE
                  elsif ((IODRPCTRLR_RDY_BUSY_N = '1') and (MCB_UODONECAL = '1') and (SELFREFRESH_REQ_R1 = '0')) then
                                                         --IODRP Controller needs to be ready, & MCB needs to be done with hard calibration
                     -- Alternate between Dynamic Input Termination and Dynamic Tuning routines           
                     if ((SKIP_DYN_IN_TERMINATION = '0') and (LastPass_DynCal = DYN_CAL_PASS)) then       
                        LastPass_DynCal <= IN_TERM_PASS;
                        STATE           <= LOAD_RZQ_NTERM;
                     else 
                        LastPass_DynCal <= DYN_CAL_PASS;
                        STATE           <= WRITE_CALIBRATE;
                     end if;
                  else
                     STATE     <= START_DYN_CAL;
                  end if;

               when WRITE_CALIBRATE =>          -- h32
                  Pre_SYSRST              <= '0';
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= DelayControl;
                  IODRPCTRLR_WRITE_DATA   <= "00100000";
                  IODRPCTRLR_R_WB         <= WRITE_MODE;
                  Active_IODRP            <= RZQ;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= WRITE_CALIBRATE;
                  else
                     STATE <= WAIT9;
                  end if;               

               when WAIT9 =>    -- h33
                  counter_en <= '1';
                  if (count < "100110") then             -- this adds approximately 22 extra clock cycles after WRITE_CALIBRATE
                     STATE <= WAIT9;
                  else
                     STATE <= READ_MAX_VALUE;
                  end if;

               when READ_MAX_VALUE =>           -- h34
                  IODRPCTRLR_CMD_VALID    <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= MaxValue;
                  IODRPCTRLR_R_WB         <= READ_MODE;
                  Max_Value_Previous      <= Max_Value_int;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= READ_MAX_VALUE;
                  else
                     STATE <= WAIT10;
                  end if;               

               when WAIT10 =>           -- h35   
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT10;
                  else
                     Max_Value_int <= IODRPCTRLR_READ_DATA; --record the Max_Value_int from the IODRP controller
                    if (First_In_Term_Done = '0') then
                      STATE               <= RST_DELAY;
                      First_In_Term_Done  <= '1';
                    else 
                     STATE                <= ANALYZE_MAX_VALUE;
                    end if;
                  end if;

               when ANALYZE_MAX_VALUE =>        -- h36      only do a Inc or Dec during a REFRESH cycle.
                 if (First_Dyn_Cal_Done = '0')then
                   STATE <= FIRST_DYN_CAL;
                 elsif ((Max_Value_int < Max_Value_Previous) and (Max_Value_Delta_Dn >= INCDEC_THRESHOLD)) then
                    STATE            <= DECREMENT;       -- May need to Decrement
                    TARGET_DQS_DELAY <= Mult_Divide(Max_Value_int, DQS_NUMERATOR, DQS_DENOMINATOR);
                                                         -- DQS_COUNT_VIRTUAL updated (could be negative value)
                 elsif ((Max_Value_int > Max_Value_Previous) and (Max_Value_Delta_Up >= INCDEC_THRESHOLD)) then
                    STATE            <= INCREMENT;       -- May need to Increment
                    TARGET_DQS_DELAY <= Mult_Divide(Max_Value_int, DQS_NUMERATOR, DQS_DENOMINATOR);
                 else 
                    Max_Value_int    <= Max_Value_Previous;
                    STATE            <= START_DYN_CAL;
                 end if; 

               when FIRST_DYN_CAL =>            -- h37
                  First_Dyn_Cal_Done <= '1';             -- set flag that the First Dynamic Calibration has been completed
                  STATE              <= START_DYN_CAL;

               when INCREMENT =>        -- h38
                  STATE         <= START_DYN_CAL;        -- Default case: Inc is not high or no longer in REFRSH
                  MCB_UILDQSINC <= '0';                  -- Default case: no inc or dec
                  MCB_UIUDQSINC <= '0';                  -- Default case: no inc or dec
                  MCB_UILDQSDEC <= '0';                  -- Default case: no inc or dec
                  MCB_UIUDQSDEC <= '0';                  -- Default case: no inc or dec
                  case Inc_Dec_REFRSH_Flag is            -- {Increment_Flag,Decrement_Flag,MCB_UOREFRSHFLAG},
                     when "101" =>
                       counter_inc    <= counter_inc + '1';
                       STATE          <= INCREMENT;      -- Increment is still high, still in REFRSH cycle      
                       if ((DQS_DELAY < DQS_DELAY_UPPER_LIMIT) and (counter_inc >= X"04")) then 
                                                         -- if not at the upper limit yet, and you've waited 4 clks, increment
                          MCB_UILDQSINC <= '1';
                          MCB_UIUDQSINC <= '1';
                          DQS_DELAY     <= DQS_DELAY + '1';
                       end if;
                     when "100" =>
                      if (DQS_DELAY < DQS_DELAY_UPPER_LIMIT) then
                        STATE         <= INCREMENT;      -- Increment is still high, REFRESH ended - wait for next REFRESH
                      end if; 
                     when others =>
                        STATE         <= START_DYN_CAL;
                  end case;

               when DECREMENT =>                -- h39
                  STATE         <= START_DYN_CAL;        -- Default case: Dec is not high or no longer in REFRSH
                  MCB_UILDQSINC <= '0';                  -- Default case: no inc or dec
                  MCB_UIUDQSINC <= '0';                  -- Default case: no inc or dec
                  MCB_UILDQSDEC <= '0';                  -- Default case: no inc or dec
                  MCB_UIUDQSDEC <= '0';                  -- Default case: no inc or dec
                  if (DQS_DELAY /= "00000000") then
                     case Inc_Dec_REFRSH_Flag is         -- {Increment_Flag,Decrement_Flag,MCB_UOREFRSHFLAG},
                        when "011" =>
                           counter_dec    <= counter_dec + '1';
                           STATE          <= DECREMENT;  -- Decrement is still high, still in REFRSH cycle      
                           if ((DQS_DELAY > DQS_DELAY_LOWER_LIMIT) and (counter_dec >= X"04")) then 
                                                         -- if not at the lower limit, and you've waited 4 clks, decrement
                              MCB_UILDQSDEC <= '1';      -- decrement
                              MCB_UIUDQSDEC <= '1';      -- decrement
                              DQS_DELAY     <= DQS_DELAY - '1'; -- SBS
                          end if;
                        when "010" =>
                          if (DQS_DELAY > DQS_DELAY_LOWER_LIMIT) then  --if not at the lower limit, decrement
                            STATE           <= DECREMENT; --Decrement is still high, REFRESH ended - wait for next REFRESH
                          end if;
                        when others =>
                           STATE            <= START_DYN_CAL;
                     end case;
                  end if;

               when DONE =>     -- h3A
                  Pre_SYSRST  <= '0';                    -- SYSRST cleared
                  MCB_UICMDEN <= '0';                    -- release UICMDEN
                  STATE       <= DONE;

               when others =>
                  MCB_UICMDEN             <= '0';        -- release UICMDEN
                  MCB_UIDONECAL_xilinx7   <= '1';        -- release UIDONECAL - MCB will now initialize.
                  Pre_SYSRST              <= '0';        -- SYSRST not driven
                  IODRPCTRLR_CMD_VALID    <= '0';
                  IODRPCTRLR_MEMCELL_ADDR <= "00000000";
                  IODRPCTRLR_WRITE_DATA   <= "00000000";
                  IODRPCTRLR_R_WB         <= '0';
                  IODRPCTRLR_USE_BKST     <= '0';
                  P_Term                  <= "000000";
                  N_Term                  <= "0000000";
                  Active_IODRP            <= ZIO;
                  Max_Value_Previous      <= "00000000";
                  MCB_UILDQSINC           <= '0';        -- no inc or dec
                  MCB_UIUDQSINC           <= '0';        -- no inc or dec
                  MCB_UILDQSDEC           <= '0';        -- no inc or dec
                  MCB_UIUDQSDEC           <= '0';        -- no inc or dec
                  counter_en              <= '0';
                  First_Dyn_Cal_Done      <= '0';        -- flag that the First Dynamic Calibration completed
                  Max_Value_int           <= Max_Value_int;
                  STATE                   <= START;
            end case;
         end if;
      end if;
   end process;
   
end architecture trans;


