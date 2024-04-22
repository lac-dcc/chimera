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
--  /   /         Filename: mcb_soft_calibration_top.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:17:26 $
-- \   \  /  \    Date Created: Mon Feb 9 2009
--  \___\/\___\
--
--Device: Spartan6
--Design Name: DDR/DDR2/DDR3/LPDDR
--Purpose:  Xilinx reference design top-level simulation
--           wrapper file for input termination calibration
--Reference:
--
--  Revision:      Date:  Comment
--     1.0:  2/06/09:  Initial version for MIG wrapper.
--     1.1:  3/16/09: Added pll_lock port, for using it to gate reset
--     1.2: 6/06/09:  Removed MCB_UIDQCOUNT.
--     1.3: 6/18/09:  corrected/changed MCB_SYSRST to be an output port
--     1.4: 6/24/09:  gave RZQ and ZIO each their own unique ADD and SDI nets
--     1.5: 10/08/09: removed INCDEC_TRESHOLD parameter - making it a localparam inside mcb_soft_calibration
--     1.5: 10/08/09: removed INCDEC_TRESHOLD parameter - making it a localparam inside mcb_soft_calibration
--     1.6: 02/04/09: Added condition generate statmenet for ZIO pin.
--     1.7: 04/12/10: Added CKE_Train signal to fix DDR2 init wait .
-- End Revision
--**********************************************************************************

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;
library unisim;
use unisim.vcomponents.all;

entity mcb_soft_calibration_top is
   generic (
      C_MEM_TZQINIT_MAXCNT  : std_logic_vector(9 downto 0) := "1000000000"; -- DDR3 Minimum delay between resets 
      C_MC_CALIBRATION_MODE : string :=  "CALIBRATION";  -- if set to CALIBRATION will reset DQS IDELAY to DQS_NUMERATOR/DQS_DENOMINATOR local_param values,
                                                         --  and does dynamic recal,
                                                         -- if set to NOCALIBRATION then defaults to hard cal blocks setting of C_MC_CALBRATION_DELAY *and* 
                                                         --  no dynamic recal will be done 
      SKIP_IN_TERM_CAL      : integer := 0;             -- provides option to skip the input termination calibration
      SKIP_DYNAMIC_CAL      : integer := 0;             -- provides option to skip the dynamic delay calibration
      SKIP_DYN_IN_TERM      : integer := 0;             -- provides option to skip the dynamic delay calibration
      C_SIMULATION          : string  := "FALSE";       -- Tells us whether the design is being simulated or implemented
      C_MEM_TYPE            : string  := "DDR"          -- provides the memory device used for the design

   );
   port (
      UI_CLK                : in std_logic;             -- Input - global clock to be used for input_term_tuner and IODRP clock
      RST                   : in std_logic;             -- Input - reset for input_term_tuner - synchronous for input_term_tuner state machine, asynch for 
                                                        --  IODRP (sub)controller
      IOCLK                 : in std_logic;             -- Input - IOCLK input to the IODRP's
      DONE_SOFTANDHARD_CAL  : out std_logic;            -- active high flag signals soft calibration of input delays is complete and MCB_UODONECAL is high
                                                        --  (MCB hard calib complete)
      PLL_LOCK              : in std_logic;             -- Lock signal from PLL
      SELFREFRESH_REQ       : in std_logic;             
      SELFREFRESH_MCB_MODE  : in std_logic;             
      SELFREFRESH_MCB_REQ   : out std_logic;            
      SELFREFRESH_MODE      : out std_logic;            
      MCB_UIADD             : out std_logic;            -- to MCB's UIADD port
      MCB_UISDI             : out std_logic;            -- to MCB's UISDI port
      MCB_UOSDO             : in std_logic;
      MCB_UODONECAL         : in std_logic;
      MCB_UOREFRSHFLAG      : in std_logic;
      MCB_UICS              : out std_logic;
      MCB_UIDRPUPDATE       : out std_logic;
      MCB_UIBROADCAST       : out std_logic;
      MCB_UIADDR            : out std_logic_vector(4 downto 0);
      MCB_UICMDEN           : out std_logic;
      MCB_UIDONECAL         : out std_logic;
      MCB_UIDQLOWERDEC      : out std_logic;
      MCB_UIDQLOWERINC      : out std_logic;
      MCB_UIDQUPPERDEC      : out std_logic;
      MCB_UIDQUPPERINC      : out std_logic;
      MCB_UILDQSDEC         : out std_logic;
      MCB_UILDQSINC         : out std_logic;
      MCB_UIREAD            : out std_logic;
      MCB_UIUDQSDEC         : out std_logic;
      MCB_UIUDQSINC         : out std_logic;
      MCB_RECAL             : out std_logic;
      MCB_SYSRST            : out std_logic;

      MCB_UICMD             : out std_logic;
      MCB_UICMDIN           : out std_logic;
      MCB_UIDQCOUNT         : out std_logic_vector(3 downto 0);
      MCB_UODATA            : in std_logic_vector(7 downto 0);
      MCB_UODATAVALID       : in std_logic;
      MCB_UOCMDREADY        : in std_logic;
      MCB_UO_CAL_START      : in std_logic;
      RZQ_PIN               : inout std_logic;
      ZIO_PIN               : inout std_logic;
      CKE_Train             : out std_logic
      
   );
end entity mcb_soft_calibration_top;

architecture trans of mcb_soft_calibration_top is
   
component mcb_soft_calibration is
   generic (
      C_MEM_TZQINIT_MAXCNT  : std_logic_vector(9 downto 0) := "1000000000"; -- DDR3 Minimum delay between resets
      SKIP_IN_TERM_CAL      : integer := 0;                 -- provides option to skip the input termination calibration
      SKIP_DYNAMIC_CAL      : integer := 0;                 -- provides option to skip the dynamic delay calibration
      SKIP_DYN_IN_TERM      : integer := 1;                 -- provides option to skip the input termination calibration
      C_MC_CALIBRATION_MODE : string  := "CALIBRATION";      -- if set to CALIBRATION will reset DQS IDELAY to DQS_NUMERATOR/DQS_DENOMINATOR local_param value
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
      MCB_UIDQLOWERDEC      : out std_logic := '0';
      MCB_UIDQLOWERINC      : out std_logic := '0';
      MCB_UIDQUPPERDEC      : out std_logic := '0';
      MCB_UIDQUPPERINC      : out std_logic := '0';
      MCB_UILDQSDEC         : out std_logic := '0';
      MCB_UILDQSINC         : out std_logic := '0';
      MCB_UIREAD            : out std_logic;        -- enables read w/o writing by turning on a SDO->SDI loopback inside the IODRP2_MCBs (doesn't exist in 
                                                    --  regular IODRP2).  IODRPCTRLR_R_WB becomes don't-care.
      MCB_UIUDQSDEC         : out std_logic := '0';
      MCB_UIUDQSINC         : out std_logic := '0';
      MCB_RECAL             : out std_logic := '0'; -- future hook to drive MCB's RECAL pin - initiates a hard re-calibration sequence when high
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
end component;

   signal IODRP_ADD                    : std_logic;
   signal IODRP_SDI                    : std_logic;
   signal RZQ_IODRP_SDO                : std_logic;
   signal RZQ_IODRP_CS                 : std_logic;
   signal ZIO_IODRP_SDO                : std_logic;
   signal ZIO_IODRP_CS                 : std_logic;
   signal IODRP_SDO                    : std_logic;
   signal IODRP_CS                     : std_logic;
   signal IODRP_BKST                   : std_logic;
   signal RZQ_ZIO_ODATAIN              : std_logic;
   signal RZQ_ZIO_TRISTATE             : std_logic;
   signal RZQ_TOUT                     : std_logic;
   signal ZIO_TOUT                     : std_logic;
   signal Max_Value                    : std_logic_vector(7 downto 0);
   
   signal RZQ_IN                       : std_logic;             -- RZQ pin from board - expected to have a 2*R resistor to ground
   signal RZQ_IN_R1                    : std_logic;             -- RZQ pin from board - expected to have a 2*R resistor to ground
   signal RZQ_IN_R2                    : std_logic;             -- RZQ pin from board - expected to have a 2*R resistor to ground
   signal ZIO_IN                       : std_logic;             -- Z-stated IO pin - garanteed not to be driven externally
   signal ZIO_IN_R1                    : std_logic;             -- Z-stated IO pin - garanteed not to be driven externally
   signal ZIO_IN_R2                    : std_logic;             -- Z-stated IO pin - garanteed not to be driven externally
   signal RZQ_OUT                      : std_logic;
   signal ZIO_OUT                      : std_logic;
   
   -- Declare intermediate signals for referenced outputs
   signal DONE_SOFTANDHARD_CAL_xilinx0 : std_logic;
   signal MCB_UIADD_xilinx3            : std_logic;
   signal MCB_UISDI_xilinx17           : std_logic;
   signal MCB_UICS_xilinx7             : std_logic;
   signal MCB_UIDRPUPDATE_xilinx13     : std_logic;
   signal MCB_UIBROADCAST_xilinx5      : std_logic;
   signal MCB_UIADDR_xilinx4           : std_logic_vector(4 downto 0);
   signal MCB_UICMDEN_xilinx6          : std_logic;
   signal MCB_UIDONECAL_xilinx8        : std_logic;
   signal MCB_UIDQLOWERDEC_xilinx9     : std_logic;
   signal MCB_UIDQLOWERINC_xilinx10    : std_logic;
   signal MCB_UIDQUPPERDEC_xilinx11    : std_logic;
   signal MCB_UIDQUPPERINC_xilinx12    : std_logic;
   signal MCB_UILDQSDEC_xilinx14       : std_logic;
   signal MCB_UILDQSINC_xilinx15       : std_logic;
   signal MCB_UIREAD_xilinx16          : std_logic;
   signal MCB_UIUDQSDEC_xilinx18       : std_logic;
   signal MCB_UIUDQSINC_xilinx19       : std_logic;
   signal MCB_RECAL_xilinx1            : std_logic;
   signal MCB_SYSRST_xilinx2           : std_logic;
begin
   -- Drive referenced outputs
   DONE_SOFTANDHARD_CAL <= DONE_SOFTANDHARD_CAL_xilinx0;
   MCB_UIADD <= MCB_UIADD_xilinx3;
   MCB_UISDI <= MCB_UISDI_xilinx17;
   MCB_UICS <= MCB_UICS_xilinx7;
   MCB_UIDRPUPDATE <= MCB_UIDRPUPDATE_xilinx13;
   MCB_UIBROADCAST <= MCB_UIBROADCAST_xilinx5;
   MCB_UIADDR <= MCB_UIADDR_xilinx4;
   MCB_UICMDEN <= MCB_UICMDEN_xilinx6;
   MCB_UIDONECAL <= MCB_UIDONECAL_xilinx8;
   MCB_UIDQLOWERDEC <= MCB_UIDQLOWERDEC_xilinx9;
   MCB_UIDQLOWERINC <= MCB_UIDQLOWERINC_xilinx10;
   MCB_UIDQUPPERDEC <= MCB_UIDQUPPERDEC_xilinx11;
   MCB_UIDQUPPERINC <= MCB_UIDQUPPERINC_xilinx12;
   MCB_UILDQSDEC <= MCB_UILDQSDEC_xilinx14;
   MCB_UILDQSINC <= MCB_UILDQSINC_xilinx15;
   MCB_UIREAD <= MCB_UIREAD_xilinx16;
   MCB_UIUDQSDEC <= MCB_UIUDQSDEC_xilinx18;
   MCB_UIUDQSINC <= MCB_UIUDQSINC_xilinx19;
   MCB_RECAL <= MCB_RECAL_xilinx1;
   MCB_SYSRST <= MCB_SYSRST_xilinx2;
   
   RZQ_ZIO_ODATAIN  <= not(RST);
   RZQ_ZIO_TRISTATE <= not(RST);
   IODRP_BKST       <= '0';                -- future hook for possible BKST to ZIO and RZQ
   
   
   mcb_soft_calibration_inst : mcb_soft_calibration
      generic map (
         C_MEM_TZQINIT_MAXCNT => C_MEM_TZQINIT_MAXCNT,
         C_MC_CALIBRATION_MODE => C_MC_CALIBRATION_MODE, 
         SKIP_IN_TERM_CAL     => SKIP_IN_TERM_CAL,
         SKIP_DYNAMIC_CAL     => SKIP_DYNAMIC_CAL,
         SKIP_DYN_IN_TERM     => SKIP_DYN_IN_TERM,
	 C_SIMULATION         => C_SIMULATION,
         C_MEM_TYPE           => C_MEM_TYPE

      )
      port map (
         UI_CLK                => UI_CLK,
         RST                   => RST,
         PLL_LOCK              => PLL_LOCK,
         SELFREFRESH_REQ       => SELFREFRESH_REQ,
         SELFREFRESH_MCB_MODE  => SELFREFRESH_MCB_MODE,
         SELFREFRESH_MCB_REQ   => SELFREFRESH_MCB_REQ,
         SELFREFRESH_MODE      => SELFREFRESH_MODE,
         DONE_SOFTANDHARD_CAL  => DONE_SOFTANDHARD_CAL_xilinx0,
         IODRP_ADD             => IODRP_ADD,
         IODRP_SDI             => IODRP_SDI,
         RZQ_IN                => RZQ_IN_R2,
         RZQ_IODRP_SDO         => RZQ_IODRP_SDO,
         RZQ_IODRP_CS          => RZQ_IODRP_CS,
         ZIO_IN                => ZIO_IN_R2,
         ZIO_IODRP_SDO         => ZIO_IODRP_SDO,
         ZIO_IODRP_CS          => ZIO_IODRP_CS,
         MCB_UIADD             => MCB_UIADD_xilinx3,
         MCB_UISDI             => MCB_UISDI_xilinx17,
         MCB_UOSDO             => MCB_UOSDO,
         MCB_UODONECAL         => MCB_UODONECAL,
         MCB_UOREFRSHFLAG      => MCB_UOREFRSHFLAG,
         MCB_UICS              => MCB_UICS_xilinx7,
         MCB_UIDRPUPDATE       => MCB_UIDRPUPDATE_xilinx13,
         MCB_UIBROADCAST       => MCB_UIBROADCAST_xilinx5,
         MCB_UIADDR            => MCB_UIADDR_xilinx4,
         MCB_UICMDEN           => MCB_UICMDEN_xilinx6,
         MCB_UIDONECAL         => MCB_UIDONECAL_xilinx8,
         MCB_UIDQLOWERDEC      => MCB_UIDQLOWERDEC_xilinx9,
         MCB_UIDQLOWERINC      => MCB_UIDQLOWERINC_xilinx10,
         MCB_UIDQUPPERDEC      => MCB_UIDQUPPERDEC_xilinx11,
         MCB_UIDQUPPERINC      => MCB_UIDQUPPERINC_xilinx12,
         MCB_UILDQSDEC         => MCB_UILDQSDEC_xilinx14,
         MCB_UILDQSINC         => MCB_UILDQSINC_xilinx15,
         MCB_UIREAD            => MCB_UIREAD_xilinx16,
         MCB_UIUDQSDEC         => MCB_UIUDQSDEC_xilinx18,
         MCB_UIUDQSINC         => MCB_UIUDQSINC_xilinx19,
         MCB_RECAL             => MCB_RECAL_xilinx1,
         MCB_UICMD             => MCB_UICMD,
         MCB_UICMDIN           => MCB_UICMDIN,    
         MCB_UIDQCOUNT         => MCB_UIDQCOUNT,     
         MCB_UODATA            => MCB_UODATA,    
         MCB_UODATAVALID       => MCB_UODATAVALID,    
         MCB_UOCMDREADY        => MCB_UOCMDREADY,    
         MCB_UO_CAL_START      => MCB_UO_CAL_START,
         mcb_sysrst            => MCB_SYSRST_xilinx2,
         Max_Value             => Max_Value,
         CKE_Train             => CKE_Train
      );
   
   process(UI_CLK,RST)
   begin
     if (RST = '1') then 
        ZIO_IN_R1 <= '0'; 
        ZIO_IN_R2 <= '0';
        RZQ_IN_R1 <= '0'; 
        RZQ_IN_R2 <= '0';          
      elsif (UI_CLK'event and UI_CLK = '1') then
        ZIO_IN_R1 <= ZIO_IN;
        ZIO_IN_R2 <= ZIO_IN_R1;
        RZQ_IN_R1 <= RZQ_IN;
        RZQ_IN_R2 <= RZQ_IN_R1;
      end if;
   end process;

   IOBUF_RZQ : IOBUF
      port map (
         o   => RZQ_IN,
         io  => RZQ_PIN,
         i   => RZQ_OUT,
         t   => RZQ_TOUT
      );
   
   IODRP2_RZQ : IODRP2
      port map (
         dataout   => open,
         dataout2  => open,
         dout      => RZQ_OUT,
         sdo       => RZQ_IODRP_SDO,
         tout      => RZQ_TOUT,
         add       => IODRP_ADD,
         bkst      => IODRP_BKST,
         clk       => UI_CLK,
         cs        => RZQ_IODRP_CS,
         idatain   => RZQ_IN,
         ioclk0    => IOCLK,
         ioclk1    => '1',
         odatain   => RZQ_ZIO_ODATAIN,
         sdi       => IODRP_SDI,
         t         => RZQ_ZIO_TRISTATE
      );
   
  
   gen_zio: if ( ((C_MEM_TYPE = "DDR") or (C_MEM_TYPE = "DDR2") or (C_MEM_TYPE = "DDR3")) and
                 (SKIP_IN_TERM_CAL = 0)) generate

      IOBUF_ZIO : IOBUF
         port map (
            o   => ZIO_IN,
            io  => ZIO_PIN,
            i   => ZIO_OUT,
            t   => ZIO_TOUT
         );
      
      IODRP2_ZIO : IODRP2
         port map (
            dataout   => open,
            dataout2  => open,
            dout      => ZIO_OUT,
            sdo       => ZIO_IODRP_SDO,
            tout      => ZIO_TOUT,
            add       => IODRP_ADD,
            bkst      => IODRP_BKST,
            clk       => UI_CLK,
            cs        => ZIO_IODRP_CS,
            idatain   => ZIO_IN,
            ioclk0    => IOCLK,
            ioclk1    => '1',
            odatain   => RZQ_ZIO_ODATAIN,
            sdi       => IODRP_SDI,
            t         => RZQ_ZIO_TRISTATE
         );
   end generate;         
   
end architecture trans;


