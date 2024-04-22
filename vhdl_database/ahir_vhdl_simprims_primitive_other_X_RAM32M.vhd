-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_RAM32M.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Static Synchronous RAM 32-Deep by 8-Wide
-- /___/   /\     Filename : X_RAM32M.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    03/23/06 - Initial version.
--    12/01/06 - Fix cut/past error (CR 430051)
-- End Revision

----- CELL X_RAM32M -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_RAM32M is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADDRA : VitalDelayArrayType01(4 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRB : VitalDelayArrayType01(4 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRC : VitalDelayArrayType01(4 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRD : VitalDelayArrayType01(4 downto 0)  := (others => (0.000 ns, 0.000 ns));

      tipd_DIA   : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_DIB   : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_DIC   : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_DID   : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));

      tipd_WCLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_WCLK_DOA : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tpd_WCLK_DOB : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tpd_WCLK_DOC : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tpd_WCLK_DOD : VitalDelayArrayType01(1 downto 0)  := (others => (0.000 ns, 0.000 ns));

      tpd_ADDRA_DOA : VitalDelayArrayType01(9 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRB_DOB : VitalDelayArrayType01(9 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRC_DOC : VitalDelayArrayType01(9 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRD_DOD : VitalDelayArrayType01(9 downto 0) := (others => (0.000 ns, 0.000 ns));

      
      tsetup_ADDRA_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRA_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRB_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRB_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRC_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRC_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRD_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      tsetup_ADDRD_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);

      tsetup_DIA_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DIA_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DIB_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DIB_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DIC_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DIC_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DID_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tsetup_DID_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);

      tsetup_WE_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_ADDRA_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRA_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRB_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRB_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRC_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRC_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRD_WCLK_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);
      thold_ADDRD_WCLK_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0.00 ns);

      thold_DIA_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DIA_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DIB_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DIB_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DIC_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DIC_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DID_WCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_DID_WCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      thold_WE_WCLK_negedge_posedge : VitalDelayType := 0.000 ns; 
      thold_WE_WCLK_posedge_posedge : VitalDelayType := 0.000 ns; 

      ticd_WCLK : VitalDelayType := 0.000 ns;
      tisd_ADDRA_WCLK : VitalDelayArrayType(4 downto 0) := (others => 0.000 ns);
      tisd_ADDRB_WCLK : VitalDelayArrayType(4 downto 0) := (others => 0.000 ns);
      tisd_ADDRC_WCLK : VitalDelayArrayType(4 downto 0) := (others => 0.000 ns);
      tisd_ADDRD_WCLK : VitalDelayArrayType(4 downto 0) := (others => 0.000 ns);

      tisd_DIA_WCLK : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tisd_DIB_WCLK : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tisd_DIC_WCLK : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tisd_DID_WCLK : VitalDelayArrayType(1 downto 0) := (others => 0.00 ns);
      tisd_WE_WCLK : VitalDelayType := 0.000 ns;

      tperiod_WCLK_posedge : VitalDelayType := 0.000 ns;

      INIT_A : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_B : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_C : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_D : bit_vector(63 downto 0) := X"0000000000000000"
    );

  port (
    DOA    : out std_logic_vector (1 downto 0);
    DOB    : out std_logic_vector (1 downto 0);
    DOC    : out std_logic_vector (1 downto 0);
    DOD    : out std_logic_vector (1 downto 0);

    ADDRA : in  std_logic_vector(4 downto 0);
    ADDRB : in  std_logic_vector(4 downto 0);
    ADDRC : in  std_logic_vector(4 downto 0);
    ADDRD : in  std_logic_vector(4 downto 0);
    DIA   : in  std_logic_vector (1 downto 0);
    DIB   : in  std_logic_vector (1 downto 0);
    DIC   : in  std_logic_vector (1 downto 0);
    DID   : in  std_logic_vector (1 downto 0);
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAM32M : entity is true;
end X_RAM32M;

architecture X_RAM32M_V of X_RAM32M is
  attribute VITAL_LEVEL0 of
    X_RAM32M_V : architecture is true;

  signal ADDRA_ipd : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRB_ipd : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRC_ipd : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRD_ipd : std_logic_vector(4 downto 0) := "XXXXX";
  signal WCLK_ipd  : std_ulogic := 'X';
  signal DIA_ipd    : std_logic_vector (1 downto 0) := "XX";
  signal DIB_ipd    : std_logic_vector (1 downto 0) := "XX";
  signal DIC_ipd    : std_logic_vector (1 downto 0) := "XX";
  signal DID_ipd    : std_logic_vector (1 downto 0) := "XX";
  signal WE_ipd   : std_ulogic := 'X';

  signal ADDRA_dly : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRB_dly : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRC_dly : std_logic_vector(4 downto 0) := "XXXXX";
  signal ADDRD_dly : std_logic_vector(4 downto 0) := "XXXXX";
  signal WCLK_dly  : std_ulogic := 'X';
  signal DIA_dly    : std_logic_vector (1 downto 0) := "XX";
  signal DIB_dly    : std_logic_vector (1 downto 0) := "XX";
  signal DIC_dly    : std_logic_vector (1 downto 0) := "XX";
  signal DID_dly    : std_logic_vector (1 downto 0) := "XX";
  signal WE_dly   : std_ulogic := 'X';

  signal Violation : std_ulogic;
  signal QA_zd      : std_logic_vector (1 downto 0);
  signal QB_zd      : std_logic_vector (1 downto 0);
  signal QC_zd      : std_logic_vector (1 downto 0);
  signal QD_zd      : std_logic_vector (1 downto 0);

  signal MEM_a : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_A) );
  signal MEM_b : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_B) );
  signal MEM_c : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_C) );
  signal MEM_d : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_D) );
begin
  WireDelay  : block
  begin
   ADDRA_DELAY : for i in 4 downto 0 generate
     VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
   end generate ADDRA_DELAY;
   ADDRB_DELAY : for i in 4 downto 0 generate
     VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
   end generate ADDRB_DELAY;
   ADDRC_DELAY : for i in 4 downto 0 generate
     VitalWireDelay (ADDRC_ipd(i), ADDRC(i), tipd_ADDRC(i));
   end generate ADDRC_DELAY;
   ADDRD_DELAY : for i in 4 downto 0 generate
     VitalWireDelay (ADDRD_ipd(i), ADDRD(i), tipd_ADDRD(i));
   end generate ADDRD_DELAY;
   DIA_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
   end generate DIA_DELAY;
   DIB_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
   end generate DIB_DELAY;
   DIC_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIC_ipd(i), DIC(i), tipd_DIC(i));
   end generate DIC_DELAY;
   DID_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DID_ipd(i), DID(i), tipd_DID(i));
   end generate DID_DELAY;

   VitalWireDelay (WCLK_ipd, WCLK, tipd_WCLK);
   VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    ADDRA_DELAY : for i in 4 downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_WCLK(i));
    end generate ADDRA_DELAY;
    ADDRB_DELAY : for i in 4 downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_WCLK(i));
    end generate ADDRB_DELAY;
    ADDRC_DELAY : for i in 4 downto 0 generate
      VitalSignalDelay (ADDRC_dly(i), ADDRC_ipd(i), tisd_ADDRC_WCLK(i));
    end generate ADDRC_DELAY;
    ADDRD_DELAY : for i in 4 downto 0 generate
      VitalSignalDelay (ADDRD_dly(i), ADDRD_ipd(i), tisd_ADDRD_WCLK(i));
    end generate ADDRD_DELAY;
   DIA_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_WCLK(i));
   end generate DIA_DELAY;
   DIB_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_WCLK(i));
   end generate DIB_DELAY;
   DIC_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DIC_dly(i), DIC_ipd(i), tisd_DIC_WCLK(i));
   end generate DIC_DELAY;
   DID_DELAY : for i in 1 downto 0 generate
     VitalWireDelay (DID_dly(i), DID_ipd(i), tisd_DID_WCLK(i));
   end generate DID_DELAY;
   
    VitalSignalDelay (WCLK_dly, WCLK_ipd, ticd_WCLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_WCLK );
  end block;

  QA_P : process ( ADDRA_dly, MEM_a) 
    variable Index_a : integer := 32;
  begin
    Index_a := 2 * SLV_TO_INT(SLV => ADDRA_dly);
    QA_zd(0) <= MEM_a(Index_a);
    QA_zd(1) <= MEM_a(Index_a + 1);
  end process QA_P;

  QB_P : process ( ADDRB_dly, MEM_b) 
    variable Index_b : integer := 32;
  begin
    Index_b := 2 * SLV_TO_INT(SLV => ADDRB_dly);
    QB_zd(0) <= MEM_b(Index_b);
    QB_zd(1) <= MEM_b(Index_b + 1);
  end process QB_P;

  QC_P : process ( ADDRC_dly, MEM_c) 
    variable Index_c : integer := 32;
  begin
    Index_c := 2 * SLV_TO_INT(SLV => ADDRC_dly);
    QC_zd(0) <= MEM_c(Index_c);
    QC_zd(1) <= MEM_c(Index_c + 1);
  end process QC_P;

  QD_P : process ( ADDRD_dly, MEM_d) 
    variable Index_d : integer := 32;
  begin
    Index_d := 2 * SLV_TO_INT(SLV => ADDRD_dly);
    QD_zd(0) <= MEM_d(Index_d);
    QD_zd(1) <= MEM_d(Index_d + 1);
  end process QD_P;

  VITALWriteBehavior : process(WCLK_dly, Violation)
    variable Index   : integer := 32 ;
  begin
    if (rising_edge(WCLK_dly)) then
      if (WE_dly = '1') then
        Index                  := 2 * SLV_TO_INT(SLV => ADDRD_dly);
        MEM_a(Index) <= (DIA_dly(0) xor Violation) after 100 ps;
        MEM_a(Index+1) <= (DIA_dly(1) xor Violation) after 100 ps;
        MEM_b(Index) <= (DIB_dly(0) xor Violation) after 100 ps;
        MEM_b(Index+1) <= (DIB_dly(1) xor Violation) after 100 ps;
        MEM_c(Index) <= (DIC_dly(0) xor Violation) after 100 ps;
        MEM_c(Index+1) <= (DIC_dly(1) xor Violation) after 100 ps;
        MEM_d(Index) <= (DID_dly(0) xor Violation) after 100 ps;
        MEM_d(Index+1) <= (DID_dly(1) xor Violation) after 100 ps;
      end if;
    end if;
  end process VITALWriteBehavior;

  VITALTimingCheck : process (WCLK_dly, DIA_dly, DIB_dly, DIC_dly, DID_dly, ADDRA_dly,
                     ADDRB_dly, ADDRC_dly, ADDRD_dly,  WE_dly)
    variable Tviol_ADDRA0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD4_WCLK_posedge : std_ulogic := '0';

    variable Tviol_DIA0_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIA1_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIB0_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIB1_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIC0_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIC1_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DID0_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DID1_WCLK_posedge    : std_ulogic := '0';

    variable Tviol_WE_WCLK_posedge   : std_ulogic := '0';

    variable Tmkr_ADDRA0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_DIA0_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA1_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB0_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB1_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIC0_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIC1_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DID0_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DID1_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_WE_WCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_WCLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable PViol_WCLK : std_ulogic          := '0';
  begin
    if (TimingChecksOn ) then
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA0_WCLK_posedge,
        TimingData     => Tmkr_DIA0_WCLK_posedge,
        TestSignal     => DIA_dly(0),
        TestSignalName => "DIA(0)",
        TestDelay      => tisd_DIA_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIA_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIA_WCLK_negedge_posedge(0),
        HoldLow        => thold_DIA_WCLK_posedge_posedge(0),
        HoldHigh       => thold_DIA_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIA1_WCLK_posedge,
        TimingData     => Tmkr_DIA1_WCLK_posedge,
        TestSignal     => DIA_dly(1),
        TestSignalName => "DIA(1)",
        TestDelay      => tisd_DIA_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIA_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIA_WCLK_negedge_posedge(1),
        HoldLow        => thold_DIA_WCLK_posedge_posedge(1),
        HoldHigh       => thold_DIA_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);


      VitalSetupHoldCheck (
        Violation      => Tviol_DIB0_WCLK_posedge,
        TimingData     => Tmkr_DIB0_WCLK_posedge,
        TestSignal     => DIB_dly(0),
        TestSignalName => "DIB(0)",
        TestDelay      => tisd_DIB_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIB_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIB_WCLK_negedge_posedge(0),
        HoldLow        => thold_DIB_WCLK_posedge_posedge(0),
        HoldHigh       => thold_DIB_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIB1_WCLK_posedge,
        TimingData     => Tmkr_DIB1_WCLK_posedge,
        TestSignal     => DIB_dly(1),
        TestSignalName => "DIB(1)",
        TestDelay      => tisd_DIB_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIB_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIB_WCLK_negedge_posedge(1),
        HoldLow        => thold_DIB_WCLK_posedge_posedge(1),
        HoldHigh       => thold_DIB_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIC0_WCLK_posedge,
        TimingData     => Tmkr_DIC0_WCLK_posedge,
        TestSignal     => DIC_dly(0),
        TestSignalName => "DIC(0)",
        TestDelay      => tisd_DIC_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIC_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIC_WCLK_negedge_posedge(0),
        HoldLow        => thold_DIC_WCLK_posedge_posedge(0),
        HoldHigh       => thold_DIC_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIC1_WCLK_posedge,
        TimingData     => Tmkr_DIC1_WCLK_posedge,
        TestSignal     => DIC_dly(1),
        TestSignalName => "DIC(1)",
        TestDelay      => tisd_DIC_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIC_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIC_WCLK_negedge_posedge(1),
        HoldLow        => thold_DIC_WCLK_posedge_posedge(1),
        HoldHigh       => thold_DIC_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DID0_WCLK_posedge,
        TimingData     => Tmkr_DID0_WCLK_posedge,
        TestSignal     => DID_dly(0),
        TestSignalName => "DID(0)",
        TestDelay      => tisd_DID_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DID_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_DID_WCLK_negedge_posedge(0),
        HoldLow        => thold_DID_WCLK_posedge_posedge(0),
        HoldHigh       => thold_DID_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DID1_WCLK_posedge,
        TimingData     => Tmkr_DID1_WCLK_posedge,
        TestSignal     => DID_dly(1),
        TestSignalName => "DID(1)",
        TestDelay      => tisd_DID_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DID_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_DID_WCLK_negedge_posedge(1),
        HoldLow        => thold_DID_WCLK_posedge_posedge(1),
        HoldHigh       => thold_DID_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WE_WCLK_posedge,
        TimingData     => Tmkr_WE_WCLK_posedge,
        TestSignal     => WE_dly,
        TestSignalName => "WE",
        TestDelay      => tisd_WE_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_WE_WCLK_posedge_posedge,
        SetupLow       => tsetup_WE_WCLK_negedge_posedge,
        HoldLow        => thold_WE_WCLK_posedge_posedge,
        HoldHigh       => thold_WE_WCLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA0_WCLK_posedge,
        TimingData     => Tmkr_ADDRA0_WCLK_posedge,
        TestSignal     => ADDRA_dly(0),
        TestSignalName => "ADDRA(0)",
        TestDelay      => tisd_ADDRA_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA1_WCLK_posedge,
        TimingData     => Tmkr_ADDRA1_WCLK_posedge,
        TestSignal     => ADDRA_dly(1),
        TestSignalName => "ADDRA(1)",
        TestDelay      => tisd_ADDRA_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA2_WCLK_posedge,
        TimingData     => Tmkr_ADDRA2_WCLK_posedge,
        TestSignal     => ADDRA_dly(2),
        TestSignalName => "ADDRA(2)",
        TestDelay      => tisd_ADDRA_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA3_WCLK_posedge,
        TimingData     => Tmkr_ADDRA3_WCLK_posedge,
        TestSignal     => ADDRA_dly(3),
        TestSignalName => "ADDRA(3)",
        TestDelay      => tisd_ADDRA_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA4_WCLK_posedge,
        TimingData     => Tmkr_ADDRA4_WCLK_posedge,
        TestSignal     => ADDRA_dly(4),
        TestSignalName => "ADDRA(4)",
        TestDelay      => tisd_ADDRA_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB0_WCLK_posedge,
        TimingData     => Tmkr_ADDRB0_WCLK_posedge,
        TestSignal     => ADDRB_dly(0),
        TestSignalName => "ADDRB(0)",
        TestDelay      => tisd_ADDRB_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB1_WCLK_posedge,
        TimingData     => Tmkr_ADDRB1_WCLK_posedge,
        TestSignal     => ADDRB_dly(1),
        TestSignalName => "ADDRB(1)",
        TestDelay      => tisd_ADDRB_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB2_WCLK_posedge,
        TimingData     => Tmkr_ADDRB2_WCLK_posedge,
        TestSignal     => ADDRB_dly(2),
        TestSignalName => "ADDRB(2)",
        TestDelay      => tisd_ADDRB_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB3_WCLK_posedge,
        TimingData     => Tmkr_ADDRB3_WCLK_posedge,
        TestSignal     => ADDRB_dly(3),
        TestSignalName => "ADDRB(3)",
        TestDelay      => tisd_ADDRB_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB4_WCLK_posedge,
        TimingData     => Tmkr_ADDRB4_WCLK_posedge,
        TestSignal     => ADDRB_dly(4),
        TestSignalName => "ADDRB(4)",
        TestDelay      => tisd_ADDRB_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC0_WCLK_posedge,
        TimingData     => Tmkr_ADDRC0_WCLK_posedge,
        TestSignal     => ADDRC_dly(0),
        TestSignalName => "ADDRC(0)",
        TestDelay      => tisd_ADDRC_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC1_WCLK_posedge,
        TimingData     => Tmkr_ADDRC1_WCLK_posedge,
        TestSignal     => ADDRC_dly(1),
        TestSignalName => "ADDRC(1)",
        TestDelay      => tisd_ADDRC_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC2_WCLK_posedge,
        TimingData     => Tmkr_ADDRC2_WCLK_posedge,
        TestSignal     => ADDRC_dly(2),
        TestSignalName => "ADDRC(2)",
        TestDelay      => tisd_ADDRC_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC3_WCLK_posedge,
        TimingData     => Tmkr_ADDRC3_WCLK_posedge,
        TestSignal     => ADDRC_dly(3),
        TestSignalName => "ADDRC(3)",
        TestDelay      => tisd_ADDRC_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC4_WCLK_posedge,
        TimingData     => Tmkr_ADDRC4_WCLK_posedge,
        TestSignal     => ADDRC_dly(4),
        TestSignalName => "ADDRC(4)",
        TestDelay      => tisd_ADDRC_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD0_WCLK_posedge,
        TimingData     => Tmkr_ADDRD0_WCLK_posedge,
        TestSignal     => ADDRD_dly(0),
        TestSignalName => "ADDRD(0)",
        TestDelay      => tisd_ADDRD_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD1_WCLK_posedge,
        TimingData     => Tmkr_ADDRD1_WCLK_posedge,
        TestSignal     => ADDRD_dly(1),
        TestSignalName => "ADDRD(1)",
        TestDelay      => tisd_ADDRD_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD2_WCLK_posedge,
        TimingData     => Tmkr_ADDRD2_WCLK_posedge,
        TestSignal     => ADDRD_dly(2),
        TestSignalName => "ADDRD(2)",
        TestDelay      => tisd_ADDRD_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD3_WCLK_posedge,
        TimingData     => Tmkr_ADDRD3_WCLK_posedge,
        TestSignal     => ADDRD_dly(3),
        TestSignalName => "ADDRD(3)",
        TestDelay      => tisd_ADDRD_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD4_WCLK_posedge,
        TimingData     => Tmkr_ADDRD4_WCLK_posedge,
        TestSignal     => ADDRD_dly(4),
        TestSignalName => "ADDRD(4)",
        TestDelay      => tisd_ADDRD_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM32M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

    end if;
    Violation <= Tviol_DIA0_WCLK_posedge or Tviol_DIB0_WCLK_posedge or
                 Tviol_DIA1_WCLK_posedge or Tviol_DIB1_WCLK_posedge or
                 Tviol_DIC0_WCLK_posedge or Tviol_DID0_WCLK_posedge or
                 Tviol_DIC1_WCLK_posedge or Tviol_DID1_WCLK_posedge or
                 Tviol_WE_WCLK_posedge or
                 Tviol_ADDRA0_WCLK_posedge or Tviol_ADDRA1_WCLK_posedge or
                 Tviol_ADDRA2_WCLK_posedge or Tviol_ADDRA3_WCLK_posedge or
                 Tviol_ADDRA4_WCLK_posedge or 
                 Tviol_ADDRB0_WCLK_posedge or Tviol_ADDRB1_WCLK_posedge or
                 Tviol_ADDRB2_WCLK_posedge or Tviol_ADDRB3_WCLK_posedge or
                 Tviol_ADDRB4_WCLK_posedge or 
                 Tviol_ADDRC0_WCLK_posedge or Tviol_ADDRC1_WCLK_posedge or
                 Tviol_ADDRC2_WCLK_posedge or Tviol_ADDRC3_WCLK_posedge or
                 Tviol_ADDRC4_WCLK_posedge or 
                 Tviol_ADDRD0_WCLK_posedge or Tviol_ADDRD1_WCLK_posedge or
                 Tviol_ADDRD2_WCLK_posedge or Tviol_ADDRD3_WCLK_posedge or
                 Tviol_ADDRD4_WCLK_posedge or 
                 Pviol_WCLK;
  end process VITALTimingCheck;

  VITALScheduleOutput     : process(QA_zd, QB_zd, QC_zd, QD_zd)
    variable OA_zd         : std_logic_vector(1 downto 0) := "XX";
    variable OA_GlitchData : VitalGlitchDataArrayType(1 downto 0);
    variable OB_zd         : std_logic_vector(1 downto 0) := "XX";
    variable OB_GlitchData : VitalGlitchDataArrayType(1 downto 0);
    variable OC_zd         : std_logic_vector(1 downto 0) := "XX";
    variable OC_GlitchData : VitalGlitchDataArrayType(1 downto 0);
    variable OD_zd         : std_logic_vector(1 downto 0) := "XX";
    variable OD_GlitchData : VitalGlitchDataArrayType(1 downto 0);
  begin
    OA_zd                               := QA_zd;
    OB_zd                               := QB_zd;
    OC_zd                               := QC_zd;
    OD_zd                               := QD_zd;

    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => OA_GlitchData(0),
      OutSignalName => "DOA(0)",
      OutTemp       => OA_zd(0),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOA(0), (WE_dly /= '0')),
                        1   => (ADDRA_dly(0)'last_event, tpd_ADDRA_DOA(0), true),
                        2   => (ADDRA_dly(1)'last_event, tpd_ADDRA_DOA(1), true),
                        3   => (ADDRA_dly(2)'last_event, tpd_ADDRA_DOA(2), true),
                        4   => (ADDRA_dly(3)'last_event, tpd_ADDRA_DOA(3), true),
                        5   => (ADDRA_dly(4)'last_event, tpd_ADDRA_DOA(4), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => OA_GlitchData(1),
      OutSignalName => "DOA(1)",
      OutTemp       => OA_zd(1),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOA(1), (WE_dly /= '0')),
                        1   => (ADDRA_dly(0)'last_event, tpd_ADDRA_DOA(5), true),
                        2   => (ADDRA_dly(1)'last_event, tpd_ADDRA_DOA(6), true),
                        3   => (ADDRA_dly(2)'last_event, tpd_ADDRA_DOA(7), true),
                        4   => (ADDRA_dly(3)'last_event, tpd_ADDRA_DOA(8), true),
                        5   => (ADDRA_dly(4)'last_event, tpd_ADDRA_DOA(9), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => OB_GlitchData(0),
      OutSignalName => "DOB(0)",
      OutTemp       => OB_zd(0),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOB(0), (WE_dly /= '0')),
                        1   => (ADDRB_dly(0)'last_event, tpd_ADDRB_DOB(0), true),
                        2   => (ADDRB_dly(1)'last_event, tpd_ADDRB_DOB(1), true),
                        3   => (ADDRB_dly(2)'last_event, tpd_ADDRB_DOB(2), true),
                        4   => (ADDRB_dly(3)'last_event, tpd_ADDRB_DOB(3), true),
                        5   => (ADDRB_dly(4)'last_event, tpd_ADDRB_DOB(4), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => OB_GlitchData(1),
      OutSignalName => "DOB(1)",
      OutTemp       => OB_zd(1),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOB(1), (WE_dly /= '0')),
                        1   => (ADDRB_dly(0)'last_event, tpd_ADDRB_DOB(5), true),
                        2   => (ADDRB_dly(1)'last_event, tpd_ADDRB_DOB(6), true),
                        3   => (ADDRB_dly(2)'last_event, tpd_ADDRB_DOB(7), true),
                        4   => (ADDRB_dly(3)'last_event, tpd_ADDRB_DOB(8), true),
                        5   => (ADDRB_dly(4)'last_event, tpd_ADDRB_DOB(9), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);


    VitalPathDelay01 (
      OutSignal     => DOC(0),
      GlitchData    => OC_GlitchData(0),
      OutSignalName => "DOC(0)",
      OutTemp       => OC_zd(0),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOC(0), (WE_dly /= '0')),
                        1   => (ADDRC_dly(0)'last_event, tpd_ADDRC_DOC(0), true),
                        2   => (ADDRC_dly(1)'last_event, tpd_ADDRC_DOC(1), true),
                        3   => (ADDRC_dly(2)'last_event, tpd_ADDRC_DOC(2), true),
                        4   => (ADDRC_dly(3)'last_event, tpd_ADDRC_DOC(3), true),
                        5   => (ADDRC_dly(4)'last_event, tpd_ADDRC_DOC(4), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOC(1),
      GlitchData    => OC_GlitchData(1),
      OutSignalName => "DOC(1)",
      OutTemp       => OC_zd(1),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOC(1), (WE_dly /= '0')),
                        1   => (ADDRC_dly(0)'last_event, tpd_ADDRC_DOC(5), true),
                        2   => (ADDRC_dly(1)'last_event, tpd_ADDRC_DOC(6), true),
                        3   => (ADDRC_dly(2)'last_event, tpd_ADDRC_DOC(7), true),
                        4   => (ADDRC_dly(3)'last_event, tpd_ADDRC_DOC(8), true),
                        5   => (ADDRC_dly(4)'last_event, tpd_ADDRC_DOC(9), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOD(0),
      GlitchData    => OD_GlitchData(0),
      OutSignalName => "DOD(0)",
      OutTemp       => OD_zd(0),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOD(0), (WE_dly /= '0')),
                        1   => (ADDRD_dly(0)'last_event, tpd_ADDRD_DOD(0), true),
                        2   => (ADDRD_dly(1)'last_event, tpd_ADDRD_DOD(1), true),
                        3   => (ADDRD_dly(2)'last_event, tpd_ADDRD_DOD(2), true),
                        4   => (ADDRD_dly(3)'last_event, tpd_ADDRD_DOD(3), true),
                        5   => (ADDRD_dly(4)'last_event, tpd_ADDRD_DOD(4), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOD(1),
      GlitchData    => OD_GlitchData(1),
      OutSignalName => "DOD(1)",
      OutTemp       => OD_zd(1),
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOD(1), (WE_dly /= '0')),
                        1   => (ADDRD_dly(0)'last_event, tpd_ADDRD_DOD(5), true),
                        2   => (ADDRD_dly(1)'last_event, tpd_ADDRD_DOD(6), true),
                        3   => (ADDRD_dly(2)'last_event, tpd_ADDRD_DOD(7), true),
                        4   => (ADDRD_dly(3)'last_event, tpd_ADDRD_DOD(8), true),
                        5   => (ADDRD_dly(4)'last_event, tpd_ADDRD_DOD(9), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process VITALScheduleOutput;
end X_RAM32M_V;

