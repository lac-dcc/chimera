-------------------------------------------------------------------------------
-- Copyright (c) 1995/2006 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Cyclic Redundancy Check 64-bit Input Simulation Model
-- /___/   /\     Filename : X_CRC64.vhd
-- \   \  /  \    Timestamp : Fri Jun 18 10:57:01 PDT 2004
--  \___\/\___\
--
-- Revision:
--  12/20/05 - Initial version.
--  12/20/05 - Added functionality
--  01/17/06 - Vital updates
--  08/02/06 - CR#233833- Remove GSR declaration
--  08/18/06 - CRS#421781 - CRCOUT initialized to 0 when GSR is high
--  08/16/07 - CR#446564 - Add CRCIN, data_width as part of process block sensitivity list
--  10/22/07 - CR#452418 - Add all to process sensitivity list
--  11/21/07 - CR#454853 - POLYNOMIAL is not a user attribute
--  05/13/08 - CR#468870 - Add negative setuphold support
--  05/20/08 - CR#472154 - Remove GSR Vital timing
-- End Revision

----- CELL X_CRC64 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_CRC64 is
  
 generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    InstancePath   : string  := "*";
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

    CRC_INIT   : bit_vector := X"FFFFFFFF";

----- VITAL input wire delays
    tperiod_CRCCLK_posedge : VitalDelayType := 0.0 ns;

-----  Input Pin path delays
    tipd_CRCIN : VitalDelayArrayType01 (63 downto 0) := (others => (0.0 ns, 0.0 ns));
    tipd_CRCDATAVALID : VitalDelayType01 :=  (0.0 ns, 0.0 ns);
    tipd_CRCDATAWIDTH : VitalDelayArrayType01 (2 downto 0) := (others => (0.0 ns, 0.0 ns));
    tipd_CRCRESET : VitalDelayType01 :=  (0.0 ns, 0.0 ns);
    tipd_CRCCLK : VitalDelayType01 :=  (0.0 ns, 0.0 ns);
--    tipd_GSR : VitalDelayType01 := (0.0 ns, 0.0 ns);

-----  clk-to-output path delays
--    tpd_CRCIN_CRCOUT : VitalDelayArrayType01(63 downto 0) := (others => (0.0 ns, 0.0 ns));
--    tpd_CRCRESET_CRCOUT : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
--    tpd_CRCDATAVALID_CRCOUT : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
--    tpd_CRCDATAWIDTH_CRCOUT : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));

    tpd_CRCCLK_CRCOUT : VitalDelayArrayType01(31 downto 0) := (others => (0.100 ns, 0.100 ns));

-----  Setup/Hold delays
    tsetup_CRCIN_CRCCLK_posedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0.0 ns);
    tsetup_CRCIN_CRCCLK_negedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0.0 ns);
    thold_CRCIN_CRCCLK_posedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0.0 ns);
    thold_CRCIN_CRCCLK_negedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0.0 ns);
    tsetup_CRCDATAVALID_CRCCLK_posedge_posedge : VitalDelayType := 0.0 ns;
    tsetup_CRCDATAVALID_CRCCLK_negedge_posedge : VitalDelayType := 0.0 ns;
    thold_CRCDATAVALID_CRCCLK_posedge_posedge : VitalDelayType := 0.0 ns;
    thold_CRCDATAVALID_CRCCLK_negedge_posedge : VitalDelayType := 0.0 ns;
    tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge : VitalDelayArrayType(2 downto 0) := (others => 0.0 ns);
    tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge : VitalDelayArrayType(2 downto 0) := (others => 0.0 ns);
    thold_CRCDATAWIDTH_CRCCLK_posedge_posedge : VitalDelayArrayType(2 downto 0) := (others => 0.0 ns);
    thold_CRCDATAWIDTH_CRCCLK_negedge_posedge : VitalDelayArrayType(2 downto 0) := (others => 0.0 ns);
    tsetup_CRCRESET_CRCCLK_posedge_posedge : VitalDelayType := 0.0 ns;
    tsetup_CRCRESET_CRCCLK_negedge_posedge : VitalDelayType := 0.0 ns;
    thold_CRCRESET_CRCCLK_posedge_posedge : VitalDelayType := 0.0 ns;
    thold_CRCRESET_CRCCLK_negedge_posedge : VitalDelayType := 0.0 ns;

-----  Clock ticd
    ticd_CRCCLK : VitalDelayType := 0.000 ns;

----- Clock-to-pin tisd 
    tisd_CRCIN_CRCCLK : VitalDelayArrayType(63 downto 0) := (others => 0.000 ns);
    tisd_CRCDATAVALID_CRCCLK : VitalDelayType := 0.000 ns;
    tisd_CRCDATAWIDTH_CRCCLK : VitalDelayArrayType(2 downto 0) := (others => 0.000 ns);
    tisd_CRCRESET_CRCCLK : VitalDelayType := 0.000 ns;
--    tisd_GSR_CRCCLK : VitalDelayType := 0.000 ns;

----- VITAL pulse width
    tpw_CRCCLK_negedge         : VitalDelayType := 0 ps;
    tpw_CRCCLK_posedge         : VitalDelayType := 0 ps
    
  );    
  port (
    CRCOUT : out std_logic_vector(31 downto 0);
  
    CRCCLK : in std_ulogic;
    CRCDATAVALID : in std_ulogic;
    CRCDATAWIDTH : in std_logic_vector(2 downto 0);
    CRCIN : in std_logic_vector(63 downto 0);
    CRCRESET : in std_ulogic
  );

attribute VITAL_LEVEL0 of X_CRC64 :     entity is true;

end X_CRC64;
  
  architecture X_CRC64_V of X_CRC64 is

    signal   data_in_64 :  std_logic_vector(7 downto 0);
    signal   data_in_56 :  std_logic_vector(7 downto 0);
    signal   data_in_48 :  std_logic_vector(7 downto 0);
    signal   data_in_40  :  std_logic_vector(7 downto 0);

    signal   data_in_32 :  std_logic_vector(7 downto 0);
    signal   data_in_24 :  std_logic_vector(7 downto 0);
    signal   data_in_16 :  std_logic_vector(7 downto 0);
    signal   data_in_8  :  std_logic_vector(7 downto 0);
    
    signal   data_width :  std_logic_vector(2 downto 0);
    signal   data_valid :  std_ulogic;
    signal   crcd       :  std_logic_vector(31 downto 0);
    signal   crcreg     :  std_logic_vector(31 downto 0);

    signal   crcgen_out_64 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_56 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_48 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_40 :  std_logic_vector(31 downto 0);

    signal   crcgen_out_32 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_24 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_16 :  std_logic_vector(31 downto 0);
    signal   crcgen_out_8  :  std_logic_vector(31 downto 0);
    
    signal   crc_initial : std_logic_vector(31 downto 0);
    signal   poly_val    : std_logic_vector(31 downto 0);

    signal   zero_56     : std_logic_vector(55 downto 0);
    signal   zero_48     : std_logic_vector(47 downto 0);
    signal   zero_40     : std_logic_vector(39 downto 0);
    signal   zero_32     : std_logic_vector(31 downto 0);
    signal   zero_24     : std_logic_vector(23 downto 0);
    signal   zero_16     : std_logic_vector(15 downto 0);
    signal   zero_8     : std_logic_vector(7 downto 0);

    signal   CRCIN_ipd  :  std_logic_vector(63 downto 0);
    signal   CRCDATAVALID_ipd  :  std_ulogic;
    signal   CRCDATAWIDTH_ipd  :  std_logic_vector(2 downto 0);
    signal   CRCRESET_ipd  :  std_ulogic;
    signal   CRCCLK_ipd  :  std_ulogic;

    signal   CRCOUT_out  :  std_logic_vector(31 downto 0);
    
    signal   GSR_dly  :  std_ulogic := '0';
    signal   CRCIN_dly  :  std_logic_vector(63 downto 0);
    signal   CRCDATAVALID_dly  :  std_ulogic;
    signal   CRCDATAWIDTH_dly  :  std_logic_vector(2 downto 0);
    signal   CRCRESET_dly  :  std_ulogic;
    signal   CRCCLK_dly  :  std_ulogic;

--    signal   GSR_ipd	 : std_ulogic;

    signal CRCOUT_zd : std_logic_vector (31 downto 0):= ( others => '0');
    signal Violation    : std_ulogic := '0';

    constant POLYNOMIAL : bit_vector := X"04C11DB7";

  begin

  WireDelay : block
    begin
      CRCIN_DELAY : for i in 63 downto 0 generate
        VitalWireDelay (CRCIN_ipd(i),CRCIN(i),tipd_CRCIN(i));
      end generate CRCIN_DELAY;

    VitalWireDelay (CRCDATAVALID_ipd,CRCDATAVALID,tipd_CRCDATAVALID);

    CRCDATAWIDTH_DELAY : for i in 2 downto 0 generate
        VitalWireDelay (CRCDATAWIDTH_ipd(i),CRCDATAWIDTH(i),tipd_CRCDATAWIDTH(i));
    end generate CRCDATAWIDTH_DELAY;

    VitalWireDelay (CRCRESET_ipd,CRCRESET,tipd_CRCRESET);
    VitalWireDelay (CRCCLK_ipd,CRCCLK,tipd_CRCCLK);
--    VitalWireDelay (GSR_ipd,GSR,tipd_GSR);

   end block;
    
    SignalDelay : block
    begin
      CRCIN_DELAY : for i in 63 downto 0 generate
        VitalSignalDelay (CRCIN_dly(i),CRCIN_ipd(i),tisd_CRCIN_CRCCLK(i));
      end generate CRCIN_DELAY;

    VitalSignalDelay (CRCDATAVALID_dly,CRCDATAVALID_ipd,tisd_CRCDATAVALID_CRCCLK);

    CRCDATAWIDTH_DELAY : for i in 2 downto 0 generate
	VitalSignalDelay (CRCDATAWIDTH_dly(i),CRCDATAWIDTH_ipd(i),tisd_CRCDATAWIDTH_CRCCLK(i));
      end generate CRCDATAWIDTH_DELAY;

      VitalSignalDelay (CRCRESET_dly,CRCRESET_ipd,tisd_CRCRESET_CRCCLK);
      VitalSignalDelay (CRCCLK_dly,CRCCLK_ipd,ticd_CRCCLK);
--      VitalSignalDelay (GSR_dly,GSR_ipd,tisd_GSR_CRCCLK);
    end block;
      
  crc_initial <= To_StdLogicVector(CRC_INIT); 
  poly_val <= To_StdLogicVector(POLYNOMIAL);

  zero_56 <= "00000000000000000000000000000000000000000000000000000000";
  zero_48 <= "000000000000000000000000000000000000000000000000";
  zero_40 <= "0000000000000000000000000000000000000000";
  zero_32 <= "00000000000000000000000000000000";
  zero_24 <= "000000000000000000000000";
  zero_16 <= "0000000000000000";
  zero_8 <=  "00000000";
    
  OUTPUT_CALC: process(GSR_dly,crcreg)
   begin
      if(GSR_dly = '1') then
         CRCOUT_zd <=  (others => '0');
      elsif(GSR_dly = '0') then
          CRCOUT_zd <= (not(crcreg(24)) & not(crcreg(25)) & not(crcreg(26)) & not(crcreg(27)) & not(crcreg(28)) & not(crcreg(29)) & not(crcreg(30)) & not(crcreg(31)) & not(crcreg(16)) & not(crcreg(17)) & not(crcreg(18)) & not(crcreg(19)) & not(crcreg(20)) & not(crcreg(21)) & not(crcreg(22)) & not(crcreg(23)) & not(crcreg(8)) & not(crcreg(9)) & not(crcreg(10)) & not(crcreg(11)) & not(crcreg(12)) & not(crcreg(13)) & not(crcreg(14)) & not(crcreg(15)) & not(crcreg(0)) & not(crcreg(1)) & not(crcreg(2)) & not(crcreg(3)) & not(crcreg(4)) & not(crcreg(5)) & not(crcreg(6)) & not(crcreg(7)));
     end if;
  end process;

   LOCK_DATA_IN: process(CRCCLK_dly)
    begin
      if (rising_edge(CRCCLK_dly)) then
        data_in_8  <= CRCIN(63 downto 56);	
        data_in_16 <= CRCIN(55 downto 48);	
        data_in_24 <= CRCIN(47 downto 40);
        data_in_32 <= CRCIN(39 downto 32);
        data_in_40 <= CRCIN(31 downto 24);	
        data_in_48 <= CRCIN(23 downto 16);	
        data_in_56 <= CRCIN(15 downto 8);
        data_in_64 <= CRCIN(7 downto 0);
        data_valid <= CRCDATAVALID;
        data_width <= CRCDATAWIDTH;
      end if;
  end process;

   -- Select between CRC8, CRC16, CRC24, CRC32, CRC40, CRC48, CRC56, CRC64  based on CRCDATAWIDTH
      
      SELECT_DATA_IN: process(crcgen_out_8,crcgen_out_16,crcgen_out_24,crcgen_out_32,crcgen_out_40,crcgen_out_48,crcgen_out_56,crcgen_out_64,crcd,data_width)
	 begin
	  case data_width is
 	   when  "000" => crcd <= crcgen_out_8;
	   when  "001" => crcd <= crcgen_out_16;
	   when  "010" => crcd <= crcgen_out_24;
	   when  "011" => crcd <= crcgen_out_32;
           when  "100" => crcd <= crcgen_out_40;
	   when  "101" => crcd <= crcgen_out_48;
	   when  "110" => crcd <= crcgen_out_56;
	   when  "111" => crcd <= crcgen_out_64;               
	   when others => crcd <= crcgen_out_8;
	end case;
     end process;
   
   -- 32-bit CRC internal register
   
   INT_REG: process(CRCCLK_dly)
    begin
      if (rising_edge(CRCCLK_dly)) then
        if (CRCRESET_dly = '1') then
          crcreg <= crc_initial;
        elsif (data_valid /= '1') then 
          crcreg <= crcreg;
        else
          crcreg <= crcd;
        end if;
      end if;
   end process;   

   --CRC Generator Logic
   
  CRC_GEN: process(crcreg, CRCIN_dly, data_width,data_in_8,data_in_16, data_in_24,data_in_32,data_in_40, data_in_48, data_in_56, data_in_64)
    variable   msg        :  std_logic_vector(72 downto 0);

    variable   concat_data_8  :  std_logic_vector(63 downto 0);
    variable   concat_data_16 :  std_logic_vector(63 downto 0);
    variable   concat_data_24 :  std_logic_vector(63 downto 0);
    variable   concat_data_32 :  std_logic_vector(63 downto 0);
    
    variable   concat_data_40 :  std_logic_vector(63 downto 0);
    variable   concat_data_48 :  std_logic_vector(63 downto 0);
    variable   concat_data_56 :  std_logic_vector(63 downto 0);
    variable   concat_data_64 :  std_logic_vector(63 downto 0);
    
    begin

      --CRC-8
        
      if (data_width = "000") then
        
        concat_data_8 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & zero_56;
      
        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_8;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
      
        for i in 0 to 7 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_8 <= msg(71 downto 40);
       
        --CRC-16
    
      elsif (data_width = "001") then

        concat_data_16 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0)& data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & zero_48;

        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_16;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
	   
        for i in 0 to 15 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_16 <= msg(71 downto 40);

    --CRC-24
	
      elsif (data_width = "010") then 

        concat_data_24 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & zero_40;

        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_24;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
	   
        for i in 0 to 23 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_24 <= msg(71 downto 40);


    --CRC-32
	
      elsif (data_width = "011") then
        concat_data_32 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & data_in_32(0) & data_in_32(1) & data_in_32(2) & data_in_32(3) & data_in_32(4) & data_in_32(5) & data_in_32(6) & data_in_32(7) & zero_32;
     
        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_32;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);

        for i in 0 to 31 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_32 <= msg(71 downto 40);

        -- CRC-40
        
      elsif (data_width = "100") then
        concat_data_40 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & data_in_32(0) & data_in_32(1) & data_in_32(2) & data_in_32(3) & data_in_32(4) & data_in_32(5) & data_in_32(6) & data_in_32(7) & data_in_40(0) & data_in_40(1) & data_in_40(2) & data_in_40(3) & data_in_40(4) & data_in_40(5) & data_in_40(6) & data_in_40(7) & zero_24;

        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_40;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
        
        for i in 0 to 39 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_40 <= msg(71 downto 40);
        
        --CRC-48
	
      elsif (data_width = "101") then

        concat_data_48 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & data_in_32(0) & data_in_32(1) & data_in_32(2) & data_in_32(3) & data_in_32(4) & data_in_32(5) & data_in_32(6) & data_in_32(7) & data_in_40(0) & data_in_40(1) & data_in_40(2) & data_in_40(3) & data_in_40(4) & data_in_40(5) & data_in_40(6) & data_in_40(7) & data_in_48(0) & data_in_48(1) & data_in_48(2) & data_in_48(3) & data_in_48(4) & data_in_48(5) & data_in_48(6) & data_in_48(7) & zero_16;
        
        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_48;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
        
        for i in 0 to 47 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_48 <= msg(71 downto 40);

        --CRC-56
	
	elsif (data_width = "110") then

        concat_data_56 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & data_in_32(0) & data_in_32(1) & data_in_32(2) & data_in_32(3) & data_in_32(4) & data_in_32(5) & data_in_32(6) & data_in_32(7) & data_in_40(0) & data_in_40(1) & data_in_40(2) & data_in_40(3) & data_in_40(4) & data_in_40(5) & data_in_40(6) & data_in_40(7) & data_in_48(0) & data_in_48(1) & data_in_48(2) & data_in_48(3) & data_in_48(4) & data_in_48(5) & data_in_48(6) & data_in_48(7) & data_in_56(0) & data_in_56(1) & data_in_56(2) & data_in_56(3) & data_in_56(4) & data_in_56(5) & data_in_56(6) & data_in_56(7) & zero_8;
      
        msg(63 downto 0) := (crcreg & zero_32) xor concat_data_56;
        msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
        
        for i in 0 to 55 loop
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(72) = '1') then
            msg(71 downto 40) := msg(71 downto 40) xor poly_val;
          end if;
        end loop;
        crcgen_out_56 <= msg(71 downto 40);

        --CRC-64
	
	elsif (data_width = "111")then
          concat_data_64 := data_in_8(0) & data_in_8(1) & data_in_8(2) & data_in_8(3) & data_in_8(4) & data_in_8(5) & data_in_8(6) & data_in_8(7) & data_in_16(0) & data_in_16(1) & data_in_16(2) & data_in_16(3) & data_in_16(4) & data_in_16(5) & data_in_16(6) & data_in_16(7) & data_in_24(0) & data_in_24(1) & data_in_24(2) & data_in_24(3) & data_in_24(4) & data_in_24(5) & data_in_24(6) & data_in_24(7) & data_in_32(0) & data_in_32(1) & data_in_32(2) & data_in_32(3) & data_in_32(4) & data_in_32(5) & data_in_32(6) & data_in_32(7) & data_in_40(0) & data_in_40(1) & data_in_40(2) & data_in_40(3) & data_in_40(4) & data_in_40(5) & data_in_40(6) & data_in_40(7) & data_in_48(0) & data_in_48(1) & data_in_48(2) & data_in_48(3) & data_in_48(4) & data_in_48(5) & data_in_48(6) & data_in_48(7) & data_in_56(0) & data_in_56(1) & data_in_56(2) & data_in_56(3) & data_in_56(4) & data_in_56(5) & data_in_56(6) & data_in_56(7) & data_in_64(0) & data_in_64(1) & data_in_64(2) & data_in_64(3) & data_in_64(4) & data_in_64(5) & data_in_64(6) &  data_in_64(7);
          
          msg(63 downto 0) := (crcreg & zero_32) xor concat_data_64;
          msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 8);
        
          for i in 0 to 63 loop
            msg(72 downto 0) := To_StdLogicVector((To_bitvector(msg)) sll 1);
            if (msg(72) = '1') then
              msg(71 downto 40) := msg(71 downto 40) xor poly_val;
            end if;
          end loop;
          crcgen_out_64 <= msg(71 downto 40);

          
      end if;

      
    end process;
         

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
    --  Pin Timing Violations (all input pins)
	variable Tviol_CRCIN0_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN0_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN1_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN1_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN2_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN2_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN3_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN3_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN4_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN4_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN5_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN5_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN6_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN6_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN7_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN7_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN8_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN8_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN9_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN9_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN10_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN10_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN11_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN11_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN12_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN12_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN13_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN13_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN14_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN14_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN15_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN15_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN16_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN16_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN17_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN17_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN18_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN18_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN19_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN19_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN20_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN20_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN21_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN21_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN22_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN22_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN23_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN23_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN24_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN24_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN25_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN25_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN26_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN26_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN27_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN27_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN28_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN28_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN29_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN29_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN30_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN30_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN31_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN31_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN32_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN32_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN33_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN33_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN34_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN34_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN35_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN35_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN36_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN36_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN37_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN37_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN38_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN38_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN39_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN39_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN40_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN40_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN41_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN41_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN42_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN42_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN43_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN43_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN44_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN44_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN45_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN45_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN46_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN46_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN47_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN47_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN48_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN48_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN49_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN49_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN50_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN50_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN51_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN51_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN52_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN52_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN53_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN53_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN54_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN54_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN55_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN55_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN56_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN56_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN57_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN57_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN58_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN58_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN59_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN59_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN60_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN60_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN61_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN61_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN62_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN62_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCIN63_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCIN63_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCDATAVALID_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCDATAVALID_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCDATAWIDTH0_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCDATAWIDTH0_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCDATAWIDTH1_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCDATAWIDTH1_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCDATAWIDTH2_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCDATAWIDTH2_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
	variable Tviol_CRCRESET_CRCCLK_posedge : STD_ULOGIC := '0';
	variable  Tmkr_CRCRESET_CRCCLK_posedge : VitalTimingDataType := VitalTimingDataInit;

--  Output Pin glitch declaration
	variable  CRCOUT0_GlitchData : VitalGlitchDataType;
	variable  CRCOUT1_GlitchData : VitalGlitchDataType;
	variable  CRCOUT2_GlitchData : VitalGlitchDataType;
	variable  CRCOUT3_GlitchData : VitalGlitchDataType;
	variable  CRCOUT4_GlitchData : VitalGlitchDataType;
	variable  CRCOUT5_GlitchData : VitalGlitchDataType;
	variable  CRCOUT6_GlitchData : VitalGlitchDataType;
	variable  CRCOUT7_GlitchData : VitalGlitchDataType;
	variable  CRCOUT8_GlitchData : VitalGlitchDataType;
	variable  CRCOUT9_GlitchData : VitalGlitchDataType;
	variable  CRCOUT10_GlitchData : VitalGlitchDataType;
	variable  CRCOUT11_GlitchData : VitalGlitchDataType;
	variable  CRCOUT12_GlitchData : VitalGlitchDataType;
	variable  CRCOUT13_GlitchData : VitalGlitchDataType;
	variable  CRCOUT14_GlitchData : VitalGlitchDataType;
	variable  CRCOUT15_GlitchData : VitalGlitchDataType;
	variable  CRCOUT16_GlitchData : VitalGlitchDataType;
	variable  CRCOUT17_GlitchData : VitalGlitchDataType;
	variable  CRCOUT18_GlitchData : VitalGlitchDataType;
	variable  CRCOUT19_GlitchData : VitalGlitchDataType;
	variable  CRCOUT20_GlitchData : VitalGlitchDataType;
	variable  CRCOUT21_GlitchData : VitalGlitchDataType;
	variable  CRCOUT22_GlitchData : VitalGlitchDataType;
	variable  CRCOUT23_GlitchData : VitalGlitchDataType;
	variable  CRCOUT24_GlitchData : VitalGlitchDataType;
	variable  CRCOUT25_GlitchData : VitalGlitchDataType;
	variable  CRCOUT26_GlitchData : VitalGlitchDataType;
	variable  CRCOUT27_GlitchData : VitalGlitchDataType;
	variable  CRCOUT28_GlitchData : VitalGlitchDataType;
	variable  CRCOUT29_GlitchData : VitalGlitchDataType;
	variable  CRCOUT30_GlitchData : VitalGlitchDataType;
	variable  CRCOUT31_GlitchData : VitalGlitchDataType;
        
begin

--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
       	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN0_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN0_CRCCLK_posedge,
	TestSignal => CRCIN_dly(0),
	TestSignalName => "CRCIN(0)",
	TestDelay => tisd_CRCIN_CRCCLK(0),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(0),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(0),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(0),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(0),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN0_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN0_CRCCLK_posedge,
	TestSignal => CRCIN_dly(0),
	TestSignalName => "CRCIN(0)",
	TestDelay => tisd_CRCIN_CRCCLK(0),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(0),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(0),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(0),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(0),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN1_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN1_CRCCLK_posedge,
	TestSignal => CRCIN_dly(1),
	TestSignalName => "CRCIN(1)",
	TestDelay => tisd_CRCIN_CRCCLK(1),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(1),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(1),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(1),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(1),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN1_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN1_CRCCLK_posedge,
	TestSignal => CRCIN_dly(1),
	TestSignalName => "CRCIN(1)",
	TestDelay => tisd_CRCIN_CRCCLK(1),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(1),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(1),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(1),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(1),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN2_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN2_CRCCLK_posedge,
	TestSignal => CRCIN_dly(2),
	TestSignalName => "CRCIN(2)",
	TestDelay => tisd_CRCIN_CRCCLK(2),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(2),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(2),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(2),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(2),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN2_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN2_CRCCLK_posedge,
	TestSignal => CRCIN_dly(2),
	TestSignalName => "CRCIN(2)",
	TestDelay => tisd_CRCIN_CRCCLK(2),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(2),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(2),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(2),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(2),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN3_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN3_CRCCLK_posedge,
	TestSignal => CRCIN_dly(3),
	TestSignalName => "CRCIN(3)",
	TestDelay => tisd_CRCIN_CRCCLK(3),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(3),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(3),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(3),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(3),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN3_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN3_CRCCLK_posedge,
	TestSignal => CRCIN_dly(3),
	TestSignalName => "CRCIN(3)",
	TestDelay => tisd_CRCIN_CRCCLK(3),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(3),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(3),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(3),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(3),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN4_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN4_CRCCLK_posedge,
	TestSignal => CRCIN_dly(4),
	TestSignalName => "CRCIN(4)",
	TestDelay => tisd_CRCIN_CRCCLK(4),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(4),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(4),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(4),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(4),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN4_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN4_CRCCLK_posedge,
	TestSignal => CRCIN_dly(4),
	TestSignalName => "CRCIN(4)",
	TestDelay => tisd_CRCIN_CRCCLK(4),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(4),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(4),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(4),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(4),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN5_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN5_CRCCLK_posedge,
	TestSignal => CRCIN_dly(5),
	TestSignalName => "CRCIN(5)",
	TestDelay => tisd_CRCIN_CRCCLK(5),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(5),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(5),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(5),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(5),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN5_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN5_CRCCLK_posedge,
	TestSignal => CRCIN_dly(5),
	TestSignalName => "CRCIN(5)",
	TestDelay => tisd_CRCIN_CRCCLK(5),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(5),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(5),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(5),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(5),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN6_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN6_CRCCLK_posedge,
	TestSignal => CRCIN_dly(6),
	TestSignalName => "CRCIN(6)",
	TestDelay => tisd_CRCIN_CRCCLK(6),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(6),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(6),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(6),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(6),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN6_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN6_CRCCLK_posedge,
	TestSignal => CRCIN_dly(6),
	TestSignalName => "CRCIN(6)",
	TestDelay => tisd_CRCIN_CRCCLK(6),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(6),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(6),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(6),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(6),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN7_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN7_CRCCLK_posedge,
	TestSignal => CRCIN_dly(7),
	TestSignalName => "CRCIN(7)",
	TestDelay => tisd_CRCIN_CRCCLK(7),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(7),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(7),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(7),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(7),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN7_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN7_CRCCLK_posedge,
	TestSignal => CRCIN_dly(7),
	TestSignalName => "CRCIN(7)",
	TestDelay => tisd_CRCIN_CRCCLK(7),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(7),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(7),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(7),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(7),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN8_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN8_CRCCLK_posedge,
	TestSignal => CRCIN_dly(8),
	TestSignalName => "CRCIN(8)",
	TestDelay => tisd_CRCIN_CRCCLK(8),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(8),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(8),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(8),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(8),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN8_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN8_CRCCLK_posedge,
	TestSignal => CRCIN_dly(8),
	TestSignalName => "CRCIN(8)",
	TestDelay => tisd_CRCIN_CRCCLK(8),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(8),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(8),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(8),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(8),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN9_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN9_CRCCLK_posedge,
	TestSignal => CRCIN_dly(9),
	TestSignalName => "CRCIN(9)",
	TestDelay => tisd_CRCIN_CRCCLK(9),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(9),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(9),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(9),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(9),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN9_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN9_CRCCLK_posedge,
	TestSignal => CRCIN_dly(9),
	TestSignalName => "CRCIN(9)",
	TestDelay => tisd_CRCIN_CRCCLK(9),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(9),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(9),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(9),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(9),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN10_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN10_CRCCLK_posedge,
	TestSignal => CRCIN_dly(10),
	TestSignalName => "CRCIN(10)",
	TestDelay => tisd_CRCIN_CRCCLK(10),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(10),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(10),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(10),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(10),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN10_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN10_CRCCLK_posedge,
	TestSignal => CRCIN_dly(10),
	TestSignalName => "CRCIN(10)",
	TestDelay => tisd_CRCIN_CRCCLK(10),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(10),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(10),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(10),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(10),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN11_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN11_CRCCLK_posedge,
	TestSignal => CRCIN_dly(11),
	TestSignalName => "CRCIN(11)",
	TestDelay => tisd_CRCIN_CRCCLK(11),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(11),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(11),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(11),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(11),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN11_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN11_CRCCLK_posedge,
	TestSignal => CRCIN_dly(11),
	TestSignalName => "CRCIN(11)",
	TestDelay => tisd_CRCIN_CRCCLK(11),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(11),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(11),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(11),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(11),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN12_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN12_CRCCLK_posedge,
	TestSignal => CRCIN_dly(12),
	TestSignalName => "CRCIN(12)",
	TestDelay => tisd_CRCIN_CRCCLK(12),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(12),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(12),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(12),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(12),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN12_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN12_CRCCLK_posedge,
	TestSignal => CRCIN_dly(12),
	TestSignalName => "CRCIN(12)",
	TestDelay => tisd_CRCIN_CRCCLK(12),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(12),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(12),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(12),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(12),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN13_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN13_CRCCLK_posedge,
	TestSignal => CRCIN_dly(13),
	TestSignalName => "CRCIN(13)",
	TestDelay => tisd_CRCIN_CRCCLK(13),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(13),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(13),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(13),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(13),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN13_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN13_CRCCLK_posedge,
	TestSignal => CRCIN_dly(13),
	TestSignalName => "CRCIN(13)",
	TestDelay => tisd_CRCIN_CRCCLK(13),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(13),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(13),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(13),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(13),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN14_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN14_CRCCLK_posedge,
	TestSignal => CRCIN_dly(14),
	TestSignalName => "CRCIN(14)",
	TestDelay => tisd_CRCIN_CRCCLK(14),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(14),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(14),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(14),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(14),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN14_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN14_CRCCLK_posedge,
	TestSignal => CRCIN_dly(14),
	TestSignalName => "CRCIN(14)",
	TestDelay => tisd_CRCIN_CRCCLK(14),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(14),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(14),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(14),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(14),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN15_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN15_CRCCLK_posedge,
	TestSignal => CRCIN_dly(15),
	TestSignalName => "CRCIN(15)",
	TestDelay => tisd_CRCIN_CRCCLK(15),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(15),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(15),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(15),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(15),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN15_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN15_CRCCLK_posedge,
	TestSignal => CRCIN_dly(15),
	TestSignalName => "CRCIN(15)",
	TestDelay => tisd_CRCIN_CRCCLK(15),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(15),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(15),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(15),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(15),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN16_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN16_CRCCLK_posedge,
	TestSignal => CRCIN_dly(16),
	TestSignalName => "CRCIN(16)",
	TestDelay => tisd_CRCIN_CRCCLK(16),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(16),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(16),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(16),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(16),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN16_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN16_CRCCLK_posedge,
	TestSignal => CRCIN_dly(16),
	TestSignalName => "CRCIN(16)",
	TestDelay => tisd_CRCIN_CRCCLK(16),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(16),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(16),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(16),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(16),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN17_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN17_CRCCLK_posedge,
	TestSignal => CRCIN_dly(17),
	TestSignalName => "CRCIN(17)",
	TestDelay => tisd_CRCIN_CRCCLK(17),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(17),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(17),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(17),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(17),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN17_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN17_CRCCLK_posedge,
	TestSignal => CRCIN_dly(17),
	TestSignalName => "CRCIN(17)",
	TestDelay => tisd_CRCIN_CRCCLK(17),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(17),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(17),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(17),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(17),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN18_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN18_CRCCLK_posedge,
	TestSignal => CRCIN_dly(18),
	TestSignalName => "CRCIN(18)",
	TestDelay => tisd_CRCIN_CRCCLK(18),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(18),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(18),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(18),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(18),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN18_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN18_CRCCLK_posedge,
	TestSignal => CRCIN_dly(18),
	TestSignalName => "CRCIN(18)",
	TestDelay => tisd_CRCIN_CRCCLK(18),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(18),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(18),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(18),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(18),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN19_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN19_CRCCLK_posedge,
	TestSignal => CRCIN_dly(19),
	TestSignalName => "CRCIN(19)",
	TestDelay => tisd_CRCIN_CRCCLK(19),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(19),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(19),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(19),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(19),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN19_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN19_CRCCLK_posedge,
	TestSignal => CRCIN_dly(19),
	TestSignalName => "CRCIN(19)",
	TestDelay => tisd_CRCIN_CRCCLK(19),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(19),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(19),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(19),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(19),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN20_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN20_CRCCLK_posedge,
	TestSignal => CRCIN_dly(20),
	TestSignalName => "CRCIN(20)",
	TestDelay => tisd_CRCIN_CRCCLK(20),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(20),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(20),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(20),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(20),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN20_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN20_CRCCLK_posedge,
	TestSignal => CRCIN_dly(20),
	TestSignalName => "CRCIN(20)",
	TestDelay => tisd_CRCIN_CRCCLK(20),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(20),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(20),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(20),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(20),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN21_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN21_CRCCLK_posedge,
	TestSignal => CRCIN_dly(21),
	TestSignalName => "CRCIN(21)",
	TestDelay => tisd_CRCIN_CRCCLK(21),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(21),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(21),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(21),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(21),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN21_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN21_CRCCLK_posedge,
	TestSignal => CRCIN_dly(21),
	TestSignalName => "CRCIN(21)",
	TestDelay => tisd_CRCIN_CRCCLK(21),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(21),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(21),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(21),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(21),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN22_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN22_CRCCLK_posedge,
	TestSignal => CRCIN_dly(22),
	TestSignalName => "CRCIN(22)",
	TestDelay => tisd_CRCIN_CRCCLK(22),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(22),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(22),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(22),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(22),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN22_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN22_CRCCLK_posedge,
	TestSignal => CRCIN_dly(22),
	TestSignalName => "CRCIN(22)",
	TestDelay => tisd_CRCIN_CRCCLK(22),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(22),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(22),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(22),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(22),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN23_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN23_CRCCLK_posedge,
	TestSignal => CRCIN_dly(23),
	TestSignalName => "CRCIN(23)",
	TestDelay => tisd_CRCIN_CRCCLK(23),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(23),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(23),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(23),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(23),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN23_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN23_CRCCLK_posedge,
	TestSignal => CRCIN_dly(23),
	TestSignalName => "CRCIN(23)",
	TestDelay => tisd_CRCIN_CRCCLK(23),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(23),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(23),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(23),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(23),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN24_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN24_CRCCLK_posedge,
	TestSignal => CRCIN_dly(24),
	TestSignalName => "CRCIN(24)",
	TestDelay => tisd_CRCIN_CRCCLK(24),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(24),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(24),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(24),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(24),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN24_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN24_CRCCLK_posedge,
	TestSignal => CRCIN_dly(24),
	TestSignalName => "CRCIN(24)",
	TestDelay => tisd_CRCIN_CRCCLK(24),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(24),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(24),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(24),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(24),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN25_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN25_CRCCLK_posedge,
	TestSignal => CRCIN_dly(25),
	TestSignalName => "CRCIN(25)",
	TestDelay => tisd_CRCIN_CRCCLK(25),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(25),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(25),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(25),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(25),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN25_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN25_CRCCLK_posedge,
	TestSignal => CRCIN_dly(25),
	TestSignalName => "CRCIN(25)",
	TestDelay => tisd_CRCIN_CRCCLK(25),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(25),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(25),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(25),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(25),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN26_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN26_CRCCLK_posedge,
	TestSignal => CRCIN_dly(26),
	TestSignalName => "CRCIN(26)",
	TestDelay => tisd_CRCIN_CRCCLK(26),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(26),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(26),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(26),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(26),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN26_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN26_CRCCLK_posedge,
	TestSignal => CRCIN_dly(26),
	TestSignalName => "CRCIN(26)",
	TestDelay => tisd_CRCIN_CRCCLK(26),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(26),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(26),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(26),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(26),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN27_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN27_CRCCLK_posedge,
	TestSignal => CRCIN_dly(27),
	TestSignalName => "CRCIN(27)",
	TestDelay => tisd_CRCIN_CRCCLK(27),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(27),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(27),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(27),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(27),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN27_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN27_CRCCLK_posedge,
	TestSignal => CRCIN_dly(27),
	TestSignalName => "CRCIN(27)",
	TestDelay => tisd_CRCIN_CRCCLK(27),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(27),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(27),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(27),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(27),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN28_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN28_CRCCLK_posedge,
	TestSignal => CRCIN_dly(28),
	TestSignalName => "CRCIN(28)",
	TestDelay => tisd_CRCIN_CRCCLK(28),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(28),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(28),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(28),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(28),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN28_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN28_CRCCLK_posedge,
	TestSignal => CRCIN_dly(28),
	TestSignalName => "CRCIN(28)",
	TestDelay => tisd_CRCIN_CRCCLK(28),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(28),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(28),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(28),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(28),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN29_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN29_CRCCLK_posedge,
	TestSignal => CRCIN_dly(29),
	TestSignalName => "CRCIN(29)",
	TestDelay => tisd_CRCIN_CRCCLK(29),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(29),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(29),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(29),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(29),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN29_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN29_CRCCLK_posedge,
	TestSignal => CRCIN_dly(29),
	TestSignalName => "CRCIN(29)",
	TestDelay => tisd_CRCIN_CRCCLK(29),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(29),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(29),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(29),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(29),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN30_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN30_CRCCLK_posedge,
	TestSignal => CRCIN_dly(30),
	TestSignalName => "CRCIN(30)",
	TestDelay => tisd_CRCIN_CRCCLK(30),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(30),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(30),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(30),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(30),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN30_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN30_CRCCLK_posedge,
	TestSignal => CRCIN_dly(30),
	TestSignalName => "CRCIN(30)",
	TestDelay => tisd_CRCIN_CRCCLK(30),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(30),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(30),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(30),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(30),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN31_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN31_CRCCLK_posedge,
	TestSignal => CRCIN_dly(31),
	TestSignalName => "CRCIN(31)",
	TestDelay => tisd_CRCIN_CRCCLK(31),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(31),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(31),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(31),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(31),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN31_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN31_CRCCLK_posedge,
	TestSignal => CRCIN_dly(31),
	TestSignalName => "CRCIN(31)",
	TestDelay => tisd_CRCIN_CRCCLK(31),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(31),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(31),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(31),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(31),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN32_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN32_CRCCLK_posedge,
	TestSignal => CRCIN_dly(32),
	TestSignalName => "CRCIN(32)",
	TestDelay => tisd_CRCIN_CRCCLK(32),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(32),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(32),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(32),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(32),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN32_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN32_CRCCLK_posedge,
	TestSignal => CRCIN_dly(32),
	TestSignalName => "CRCIN(32)",
	TestDelay => tisd_CRCIN_CRCCLK(32),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(32),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(32),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(32),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(32),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN33_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN33_CRCCLK_posedge,
	TestSignal => CRCIN_dly(33),
	TestSignalName => "CRCIN(33)",
	TestDelay => tisd_CRCIN_CRCCLK(33),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(33),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(33),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(33),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(33),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN33_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN33_CRCCLK_posedge,
	TestSignal => CRCIN_dly(33),
	TestSignalName => "CRCIN(33)",
	TestDelay => tisd_CRCIN_CRCCLK(33),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(33),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(33),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(33),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(33),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN34_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN34_CRCCLK_posedge,
	TestSignal => CRCIN_dly(34),
	TestSignalName => "CRCIN(34)",
	TestDelay => tisd_CRCIN_CRCCLK(34),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(34),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(34),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(34),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(34),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN34_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN34_CRCCLK_posedge,
	TestSignal => CRCIN_dly(34),
	TestSignalName => "CRCIN(34)",
	TestDelay => tisd_CRCIN_CRCCLK(34),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(34),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(34),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(34),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(34),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN35_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN35_CRCCLK_posedge,
	TestSignal => CRCIN_dly(35),
	TestSignalName => "CRCIN(35)",
	TestDelay => tisd_CRCIN_CRCCLK(35),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(35),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(35),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(35),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(35),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN35_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN35_CRCCLK_posedge,
	TestSignal => CRCIN_dly(35),
	TestSignalName => "CRCIN(35)",
	TestDelay => tisd_CRCIN_CRCCLK(35),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(35),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(35),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(35),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(35),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN36_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN36_CRCCLK_posedge,
	TestSignal => CRCIN_dly(36),
	TestSignalName => "CRCIN(36)",
	TestDelay => tisd_CRCIN_CRCCLK(36),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(36),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(36),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(36),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(36),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN36_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN36_CRCCLK_posedge,
	TestSignal => CRCIN_dly(36),
	TestSignalName => "CRCIN(36)",
	TestDelay => tisd_CRCIN_CRCCLK(36),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(36),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(36),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(36),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(36),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN37_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN37_CRCCLK_posedge,
	TestSignal => CRCIN_dly(37),
	TestSignalName => "CRCIN(37)",
	TestDelay => tisd_CRCIN_CRCCLK(37),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(37),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(37),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(37),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(37),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN37_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN37_CRCCLK_posedge,
	TestSignal => CRCIN_dly(37),
	TestSignalName => "CRCIN(37)",
	TestDelay => tisd_CRCIN_CRCCLK(37),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(37),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(37),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(37),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(37),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN38_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN38_CRCCLK_posedge,
	TestSignal => CRCIN_dly(38),
	TestSignalName => "CRCIN(38)",
	TestDelay => tisd_CRCIN_CRCCLK(38),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(38),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(38),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(38),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(38),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN38_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN38_CRCCLK_posedge,
	TestSignal => CRCIN_dly(38),
	TestSignalName => "CRCIN(38)",
	TestDelay => tisd_CRCIN_CRCCLK(38),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(38),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(38),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(38),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(38),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN39_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN39_CRCCLK_posedge,
	TestSignal => CRCIN_dly(39),
	TestSignalName => "CRCIN(39)",
	TestDelay => tisd_CRCIN_CRCCLK(39),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(39),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(39),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(39),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(39),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN39_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN39_CRCCLK_posedge,
	TestSignal => CRCIN_dly(39),
	TestSignalName => "CRCIN(39)",
	TestDelay => tisd_CRCIN_CRCCLK(39),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(39),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(39),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(39),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(39),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN40_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN40_CRCCLK_posedge,
	TestSignal => CRCIN_dly(40),
	TestSignalName => "CRCIN(40)",
	TestDelay => tisd_CRCIN_CRCCLK(40),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(40),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(40),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(40),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(40),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN40_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN40_CRCCLK_posedge,
	TestSignal => CRCIN_dly(40),
	TestSignalName => "CRCIN(40)",
	TestDelay => tisd_CRCIN_CRCCLK(40),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(40),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(40),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(40),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(40),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN41_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN41_CRCCLK_posedge,
	TestSignal => CRCIN_dly(41),
	TestSignalName => "CRCIN(41)",
	TestDelay => tisd_CRCIN_CRCCLK(41),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(41),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(41),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(41),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(41),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN41_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN41_CRCCLK_posedge,
	TestSignal => CRCIN_dly(41),
	TestSignalName => "CRCIN(41)",
	TestDelay => tisd_CRCIN_CRCCLK(41),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(41),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(41),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(41),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(41),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN42_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN42_CRCCLK_posedge,
	TestSignal => CRCIN_dly(42),
	TestSignalName => "CRCIN(42)",
	TestDelay => tisd_CRCIN_CRCCLK(42),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(42),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(42),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(42),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(42),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN42_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN42_CRCCLK_posedge,
	TestSignal => CRCIN_dly(42),
	TestSignalName => "CRCIN(42)",
	TestDelay => tisd_CRCIN_CRCCLK(42),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(42),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(42),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(42),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(42),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN43_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN43_CRCCLK_posedge,
	TestSignal => CRCIN_dly(43),
	TestSignalName => "CRCIN(43)",
	TestDelay => tisd_CRCIN_CRCCLK(43),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(43),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(43),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(43),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(43),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN43_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN43_CRCCLK_posedge,
	TestSignal => CRCIN_dly(43),
	TestSignalName => "CRCIN(43)",
	TestDelay => tisd_CRCIN_CRCCLK(43),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(43),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(43),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(43),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(43),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN44_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN44_CRCCLK_posedge,
	TestSignal => CRCIN_dly(44),
	TestSignalName => "CRCIN(44)",
	TestDelay => tisd_CRCIN_CRCCLK(44),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(44),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(44),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(44),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(44),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN44_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN44_CRCCLK_posedge,
	TestSignal => CRCIN_dly(44),
	TestSignalName => "CRCIN(44)",
	TestDelay => tisd_CRCIN_CRCCLK(44),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(44),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(44),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(44),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(44),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN45_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN45_CRCCLK_posedge,
	TestSignal => CRCIN_dly(45),
	TestSignalName => "CRCIN(45)",
	TestDelay => tisd_CRCIN_CRCCLK(45),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(45),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(45),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(45),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(45),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN45_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN45_CRCCLK_posedge,
	TestSignal => CRCIN_dly(45),
	TestSignalName => "CRCIN(45)",
	TestDelay => tisd_CRCIN_CRCCLK(45),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(45),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(45),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(45),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(45),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN46_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN46_CRCCLK_posedge,
	TestSignal => CRCIN_dly(46),
	TestSignalName => "CRCIN(46)",
	TestDelay => tisd_CRCIN_CRCCLK(46),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(46),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(46),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(46),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(46),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN46_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN46_CRCCLK_posedge,
	TestSignal => CRCIN_dly(46),
	TestSignalName => "CRCIN(46)",
	TestDelay => tisd_CRCIN_CRCCLK(46),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(46),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(46),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(46),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(46),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN47_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN47_CRCCLK_posedge,
	TestSignal => CRCIN_dly(47),
	TestSignalName => "CRCIN(47)",
	TestDelay => tisd_CRCIN_CRCCLK(47),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(47),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(47),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(47),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(47),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN47_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN47_CRCCLK_posedge,
	TestSignal => CRCIN_dly(47),
	TestSignalName => "CRCIN(47)",
	TestDelay => tisd_CRCIN_CRCCLK(47),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(47),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(47),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(47),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(47),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN48_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN48_CRCCLK_posedge,
	TestSignal => CRCIN_dly(48),
	TestSignalName => "CRCIN(48)",
	TestDelay => tisd_CRCIN_CRCCLK(48),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(48),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(48),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(48),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(48),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN48_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN48_CRCCLK_posedge,
	TestSignal => CRCIN_dly(48),
	TestSignalName => "CRCIN(48)",
	TestDelay => tisd_CRCIN_CRCCLK(48),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(48),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(48),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(48),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(48),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN49_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN49_CRCCLK_posedge,
	TestSignal => CRCIN_dly(49),
	TestSignalName => "CRCIN(49)",
	TestDelay => tisd_CRCIN_CRCCLK(49),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(49),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(49),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(49),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(49),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN49_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN49_CRCCLK_posedge,
	TestSignal => CRCIN_dly(49),
	TestSignalName => "CRCIN(49)",
	TestDelay => tisd_CRCIN_CRCCLK(49),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(49),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(49),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(49),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(49),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN50_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN50_CRCCLK_posedge,
	TestSignal => CRCIN_dly(50),
	TestSignalName => "CRCIN(50)",
	TestDelay => tisd_CRCIN_CRCCLK(50),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(50),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(50),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(50),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(50),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN50_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN50_CRCCLK_posedge,
	TestSignal => CRCIN_dly(50),
	TestSignalName => "CRCIN(50)",
	TestDelay => tisd_CRCIN_CRCCLK(50),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(50),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(50),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(50),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(50),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN51_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN51_CRCCLK_posedge,
	TestSignal => CRCIN_dly(51),
	TestSignalName => "CRCIN(51)",
	TestDelay => tisd_CRCIN_CRCCLK(51),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(51),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(51),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(51),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(51),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN51_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN51_CRCCLK_posedge,
	TestSignal => CRCIN_dly(51),
	TestSignalName => "CRCIN(51)",
	TestDelay => tisd_CRCIN_CRCCLK(51),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(51),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(51),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(51),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(51),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN52_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN52_CRCCLK_posedge,
	TestSignal => CRCIN_dly(52),
	TestSignalName => "CRCIN(52)",
	TestDelay => tisd_CRCIN_CRCCLK(52),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(52),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(52),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(52),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(52),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN52_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN52_CRCCLK_posedge,
	TestSignal => CRCIN_dly(52),
	TestSignalName => "CRCIN(52)",
	TestDelay => tisd_CRCIN_CRCCLK(52),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(52),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(52),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(52),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(52),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN53_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN53_CRCCLK_posedge,
	TestSignal => CRCIN_dly(53),
	TestSignalName => "CRCIN(53)",
	TestDelay => tisd_CRCIN_CRCCLK(53),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(53),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(53),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(53),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(53),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN53_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN53_CRCCLK_posedge,
	TestSignal => CRCIN_dly(53),
	TestSignalName => "CRCIN(53)",
	TestDelay => tisd_CRCIN_CRCCLK(53),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(53),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(53),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(53),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(53),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN54_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN54_CRCCLK_posedge,
	TestSignal => CRCIN_dly(54),
	TestSignalName => "CRCIN(54)",
	TestDelay => tisd_CRCIN_CRCCLK(54),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(54),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(54),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(54),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(54),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN54_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN54_CRCCLK_posedge,
	TestSignal => CRCIN_dly(54),
	TestSignalName => "CRCIN(54)",
	TestDelay => tisd_CRCIN_CRCCLK(54),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(54),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(54),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(54),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(54),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN55_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN55_CRCCLK_posedge,
	TestSignal => CRCIN_dly(55),
	TestSignalName => "CRCIN(55)",
	TestDelay => tisd_CRCIN_CRCCLK(55),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(55),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(55),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(55),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(55),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN55_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN55_CRCCLK_posedge,
	TestSignal => CRCIN_dly(55),
	TestSignalName => "CRCIN(55)",
	TestDelay => tisd_CRCIN_CRCCLK(55),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(55),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(55),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(55),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(55),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN56_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN56_CRCCLK_posedge,
	TestSignal => CRCIN_dly(56),
	TestSignalName => "CRCIN(56)",
	TestDelay => tisd_CRCIN_CRCCLK(56),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(56),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(56),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(56),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(56),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN56_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN56_CRCCLK_posedge,
	TestSignal => CRCIN_dly(56),
	TestSignalName => "CRCIN(56)",
	TestDelay => tisd_CRCIN_CRCCLK(56),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(56),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(56),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(56),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(56),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN57_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN57_CRCCLK_posedge,
	TestSignal => CRCIN_dly(57),
	TestSignalName => "CRCIN(57)",
	TestDelay => tisd_CRCIN_CRCCLK(57),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(57),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(57),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(57),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(57),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN57_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN57_CRCCLK_posedge,
	TestSignal => CRCIN_dly(57),
	TestSignalName => "CRCIN(57)",
	TestDelay => tisd_CRCIN_CRCCLK(57),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(57),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(57),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(57),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(57),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN58_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN58_CRCCLK_posedge,
	TestSignal => CRCIN_dly(58),
	TestSignalName => "CRCIN(58)",
	TestDelay => tisd_CRCIN_CRCCLK(58),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(58),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(58),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(58),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(58),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN58_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN58_CRCCLK_posedge,
	TestSignal => CRCIN_dly(58),
	TestSignalName => "CRCIN(58)",
	TestDelay => tisd_CRCIN_CRCCLK(58),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(58),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(58),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(58),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(58),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN59_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN59_CRCCLK_posedge,
	TestSignal => CRCIN_dly(59),
	TestSignalName => "CRCIN(59)",
	TestDelay => tisd_CRCIN_CRCCLK(59),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(59),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(59),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(59),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(59),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN59_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN59_CRCCLK_posedge,
	TestSignal => CRCIN_dly(59),
	TestSignalName => "CRCIN(59)",
	TestDelay => tisd_CRCIN_CRCCLK(59),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(59),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(59),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(59),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(59),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN60_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN60_CRCCLK_posedge,
	TestSignal => CRCIN_dly(60),
	TestSignalName => "CRCIN(60)",
	TestDelay => tisd_CRCIN_CRCCLK(60),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(60),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(60),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(60),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(60),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN60_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN60_CRCCLK_posedge,
	TestSignal => CRCIN_dly(60),
	TestSignalName => "CRCIN(60)",
	TestDelay => tisd_CRCIN_CRCCLK(60),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(60),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(60),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(60),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(60),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN61_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN61_CRCCLK_posedge,
	TestSignal => CRCIN_dly(61),
	TestSignalName => "CRCIN(61)",
	TestDelay => tisd_CRCIN_CRCCLK(61),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(61),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(61),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(61),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(61),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN61_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN61_CRCCLK_posedge,
	TestSignal => CRCIN_dly(61),
	TestSignalName => "CRCIN(61)",
	TestDelay => tisd_CRCIN_CRCCLK(61),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(61),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(61),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(61),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(61),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN62_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN62_CRCCLK_posedge,
	TestSignal => CRCIN_dly(62),
	TestSignalName => "CRCIN(62)",
	TestDelay => tisd_CRCIN_CRCCLK(62),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(62),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(62),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(62),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(62),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN62_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN62_CRCCLK_posedge,
	TestSignal => CRCIN_dly(62),
	TestSignalName => "CRCIN(62)",
	TestDelay => tisd_CRCIN_CRCCLK(62),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(62),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(62),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(62),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(62),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN63_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN63_CRCCLK_posedge,
	TestSignal => CRCIN_dly(63),
	TestSignalName => "CRCIN(63)",
	TestDelay => tisd_CRCIN_CRCCLK(63),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(63),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(63),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(63),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(63),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCIN63_CRCCLK_posedge,
	TimingData => Tmkr_CRCIN63_CRCCLK_posedge,
	TestSignal => CRCIN_dly(63),
	TestSignalName => "CRCIN(63)",
	TestDelay => tisd_CRCIN_CRCCLK(63),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCIN_CRCCLK_posedge_posedge(63),
	SetupLow => tsetup_CRCIN_CRCCLK_negedge_posedge(63),
	HoldLow => thold_CRCIN_CRCCLK_posedge_posedge(63),
	HoldHigh => thold_CRCIN_CRCCLK_negedge_posedge(63),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation      => Tviol_CRCDATAVALID_CRCCLK_posedge,
	TimingData     => Tmkr_CRCDATAVALID_CRCCLK_posedge,
	TestSignal     => CRCDATAVALID,
	TestSignalName => "CRCDATAVALID",
	TestDelay      => 0 ns,
	RefSignal => CRCCLK_dly,
	RefSignalName  => "CRCCLK",
	RefDelay       => 0 ns,
	SetupHigh      => tsetup_CRCDATAVALID_CRCCLK_posedge_posedge,
	SetupLow       => tsetup_CRCDATAVALID_CRCCLK_negedge_posedge,
	HoldLow        => thold_CRCDATAVALID_CRCCLK_posedge_posedge,
	HoldHigh       => thold_CRCDATAVALID_CRCCLK_negedge_posedge,
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation      => Tviol_CRCDATAVALID_CRCCLK_posedge,
	TimingData     => Tmkr_CRCDATAVALID_CRCCLK_posedge,
	TestSignal     => CRCDATAVALID,
	TestSignalName => "CRCDATAVALID",
	TestDelay      => 0 ns,
	RefSignal => CRCCLK_dly,
	RefSignalName  => "CRCCLK",
	RefDelay       => 0 ns,
	SetupHigh      => tsetup_CRCDATAVALID_CRCCLK_posedge_posedge,
	SetupLow       => tsetup_CRCDATAVALID_CRCCLK_negedge_posedge,
	HoldLow        => thold_CRCDATAVALID_CRCCLK_posedge_posedge,
	HoldHigh       => thold_CRCDATAVALID_CRCCLK_negedge_posedge,
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH0_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH0_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(0),
	TestSignalName => "CRCDATAWIDTH(0)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(0),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(0),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(0),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(0),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(0),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH0_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH0_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(0),
	TestSignalName => "CRCDATAWIDTH(0)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(0),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(0),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(0),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(0),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(0),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH1_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH1_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(1),
	TestSignalName => "CRCDATAWIDTH(1)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(1),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(1),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(1),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(1),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(1),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH1_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH1_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(1),
	TestSignalName => "CRCDATAWIDTH(1)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(1),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(1),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(1),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(1),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(1),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH2_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH2_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(2),
	TestSignalName => "CRCDATAWIDTH(2)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(2),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(2),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(2),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(2),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(2),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation => Tviol_CRCDATAWIDTH2_CRCCLK_posedge,
	TimingData => Tmkr_CRCDATAWIDTH2_CRCCLK_posedge,
	TestSignal => CRCDATAWIDTH_dly(2),
	TestSignalName => "CRCDATAWIDTH(2)",
	TestDelay => tisd_CRCDATAWIDTH_CRCCLK(2),
	RefSignal => CRCCLK_dly,
	RefSignalName => "CRCCLK",
	RefDelay => ticd_CRCCLK,
	SetupHigh => tsetup_CRCDATAWIDTH_CRCCLK_posedge_posedge(2),
	SetupLow => tsetup_CRCDATAWIDTH_CRCCLK_negedge_posedge(2),
	HoldLow => thold_CRCDATAWIDTH_CRCCLK_posedge_posedge(2),
	HoldHigh => thold_CRCDATAWIDTH_CRCCLK_negedge_posedge(2),
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation      => Tviol_CRCRESET_CRCCLK_posedge,
	TimingData     => Tmkr_CRCRESET_CRCCLK_posedge,
	TestSignal     => CRCRESET,
	TestSignalName => "CRCRESET",
	TestDelay      => 0 ns,
	RefSignal => CRCCLK_dly,
	RefSignalName  => "CRCCLK",
	RefDelay       => 0 ns,
	SetupHigh      => tsetup_CRCRESET_CRCCLK_posedge_posedge,
	SetupLow       => tsetup_CRCRESET_CRCCLK_negedge_posedge,
	HoldLow        => thold_CRCRESET_CRCCLK_posedge_posedge,
	HoldHigh       => thold_CRCRESET_CRCCLK_negedge_posedge,
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);
	VitalSetupHoldCheck
	(
	Violation      => Tviol_CRCRESET_CRCCLK_posedge,
	TimingData     => Tmkr_CRCRESET_CRCCLK_posedge,
	TestSignal     => CRCRESET,
	TestSignalName => "CRCRESET",
	TestDelay      => 0 ns,
	RefSignal => CRCCLK_dly,
	RefSignalName  => "CRCCLK",
	RefDelay       => 0 ns,
	SetupHigh      => tsetup_CRCRESET_CRCCLK_posedge_posedge,
	SetupLow       => tsetup_CRCRESET_CRCCLK_negedge_posedge,
	HoldLow        => thold_CRCRESET_CRCCLK_posedge_posedge,
	HoldHigh       => thold_CRCRESET_CRCCLK_negedge_posedge,
	CheckEnabled   => TRUE,
	RefTransition  => 'R',
	HeaderMsg      => InstancePath & "/X_CRC64",
	Xon            => Xon,
	MsgOn          => MsgOn,
	MsgSeverity    => WARNING
	);

     end if;
-- End of (TimingChecksOn)

        Violation <= Tviol_CRCIN0_CRCCLK_posedge or Tviol_CRCIN1_CRCCLK_posedge or Tviol_CRCIN2_CRCCLK_posedge or Tviol_CRCIN3_CRCCLK_posedge or  Tviol_CRCIN4_CRCCLK_posedge or Tviol_CRCIN5_CRCCLK_posedge or Tviol_CRCIN6_CRCCLK_posedge or Tviol_CRCIN7_CRCCLK_posedge or Tviol_CRCIN8_CRCCLK_posedge or Tviol_CRCIN9_CRCCLK_posedge or Tviol_CRCIN10_CRCCLK_posedge or Tviol_CRCIN11_CRCCLK_posedge or Tviol_CRCIN12_CRCCLK_posedge or Tviol_CRCIN13_CRCCLK_posedge or Tviol_CRCIN14_CRCCLK_posedge or Tviol_CRCIN15_CRCCLK_posedge or Tviol_CRCIN16_CRCCLK_posedge or Tviol_CRCIN17_CRCCLK_posedge or Tviol_CRCIN18_CRCCLK_posedge or Tviol_CRCIN19_CRCCLK_posedge or Tviol_CRCIN20_CRCCLK_posedge or Tviol_CRCIN21_CRCCLK_posedge or Tviol_CRCIN22_CRCCLK_posedge or Tviol_CRCIN23_CRCCLK_posedge or Tviol_CRCIN24_CRCCLK_posedge or Tviol_CRCIN25_CRCCLK_posedge or Tviol_CRCIN26_CRCCLK_posedge or Tviol_CRCIN27_CRCCLK_posedge or Tviol_CRCIN28_CRCCLK_posedge or Tviol_CRCIN29_CRCCLK_posedge or Tviol_CRCIN30_CRCCLK_posedge or Tviol_CRCIN31_CRCCLK_posedge or Tviol_CRCIN32_CRCCLK_posedge or Tviol_CRCIN33_CRCCLK_posedge or Tviol_CRCIN34_CRCCLK_posedge or Tviol_CRCIN35_CRCCLK_posedge or  Tviol_CRCIN36_CRCCLK_posedge or Tviol_CRCIN37_CRCCLK_posedge or Tviol_CRCIN38_CRCCLK_posedge or Tviol_CRCIN39_CRCCLK_posedge or Tviol_CRCIN40_CRCCLK_posedge or Tviol_CRCIN41_CRCCLK_posedge or Tviol_CRCIN42_CRCCLK_posedge or Tviol_CRCIN43_CRCCLK_posedge or Tviol_CRCIN44_CRCCLK_posedge or Tviol_CRCIN45_CRCCLK_posedge or Tviol_CRCIN46_CRCCLK_posedge or Tviol_CRCIN47_CRCCLK_posedge or Tviol_CRCIN48_CRCCLK_posedge or Tviol_CRCIN49_CRCCLK_posedge or Tviol_CRCIN50_CRCCLK_posedge or Tviol_CRCIN51_CRCCLK_posedge or Tviol_CRCIN52_CRCCLK_posedge or Tviol_CRCIN53_CRCCLK_posedge or Tviol_CRCIN54_CRCCLK_posedge or Tviol_CRCIN55_CRCCLK_posedge or Tviol_CRCIN56_CRCCLK_posedge or Tviol_CRCIN57_CRCCLK_posedge or Tviol_CRCIN58_CRCCLK_posedge or Tviol_CRCIN59_CRCCLK_posedge or Tviol_CRCIN60_CRCCLK_posedge or Tviol_CRCIN61_CRCCLK_posedge or Tviol_CRCIN62_CRCCLK_posedge or Tviol_CRCIN62_CRCCLK_posedge or Tviol_CRCRESET_CRCCLK_posedge or Tviol_CRCDATAWIDTH0_CRCCLK_posedge or Tviol_CRCDATAWIDTH1_CRCCLK_posedge or Tviol_CRCDATAWIDTH2_CRCCLK_posedge or Tviol_CRCDATAVALID_CRCCLK_posedge;
          
 --  Wait signal (input/output pins)
   wait on
	CRCIN_dly,
	CRCDATAVALID_dly,
	CRCDATAWIDTH_dly,
	CRCRESET_dly,
	CRCCLK_dly;
     
  end process;

--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
    --  Output Pin glitch declaration
	variable  CRCOUT0_GlitchData : VitalGlitchDataType;
	variable  CRCOUT1_GlitchData : VitalGlitchDataType;
	variable  CRCOUT2_GlitchData : VitalGlitchDataType;
	variable  CRCOUT3_GlitchData : VitalGlitchDataType;
	variable  CRCOUT4_GlitchData : VitalGlitchDataType;
	variable  CRCOUT5_GlitchData : VitalGlitchDataType;
	variable  CRCOUT6_GlitchData : VitalGlitchDataType;
	variable  CRCOUT7_GlitchData : VitalGlitchDataType;
	variable  CRCOUT8_GlitchData : VitalGlitchDataType;
	variable  CRCOUT9_GlitchData : VitalGlitchDataType;
	variable  CRCOUT10_GlitchData : VitalGlitchDataType;
	variable  CRCOUT11_GlitchData : VitalGlitchDataType;
	variable  CRCOUT12_GlitchData : VitalGlitchDataType;
	variable  CRCOUT13_GlitchData : VitalGlitchDataType;
	variable  CRCOUT14_GlitchData : VitalGlitchDataType;
	variable  CRCOUT15_GlitchData : VitalGlitchDataType;
	variable  CRCOUT16_GlitchData : VitalGlitchDataType;
	variable  CRCOUT17_GlitchData : VitalGlitchDataType;
	variable  CRCOUT18_GlitchData : VitalGlitchDataType;
	variable  CRCOUT19_GlitchData : VitalGlitchDataType;
	variable  CRCOUT20_GlitchData : VitalGlitchDataType;
	variable  CRCOUT21_GlitchData : VitalGlitchDataType;
	variable  CRCOUT22_GlitchData : VitalGlitchDataType;
	variable  CRCOUT23_GlitchData : VitalGlitchDataType;
	variable  CRCOUT24_GlitchData : VitalGlitchDataType;
	variable  CRCOUT25_GlitchData : VitalGlitchDataType;
	variable  CRCOUT26_GlitchData : VitalGlitchDataType;
	variable  CRCOUT27_GlitchData : VitalGlitchDataType;
	variable  CRCOUT28_GlitchData : VitalGlitchDataType;
	variable  CRCOUT29_GlitchData : VitalGlitchDataType;
	variable  CRCOUT30_GlitchData : VitalGlitchDataType;
	variable  CRCOUT31_GlitchData : VitalGlitchDataType;
        variable  CRCOUT_viol : std_logic_vector (31 downto 0); 
  begin
    
    if (Violation = 'X') then
      CRCOUT_viol := (others => 'X');
    else
      CRCOUT_viol := CRCOUT_zd;
    end if;
    --  Output-to-Clock path delay
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(0),
	GlitchData    => CRCOUT0_GlitchData,
	OutSignalName => "CRCOUT(0)",
	OutTemp       => CRCOUT_viol(0),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(0),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(1),
	GlitchData    => CRCOUT1_GlitchData,
	OutSignalName => "CRCOUT(1)",
	OutTemp       => CRCOUT_viol(1),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(1),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(2),
	GlitchData    => CRCOUT2_GlitchData,
	OutSignalName => "CRCOUT(2)",
	OutTemp       => CRCOUT_viol(2),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(2),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(3),
	GlitchData    => CRCOUT3_GlitchData,
	OutSignalName => "CRCOUT(3)",
	OutTemp       => CRCOUT_viol(3),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(3),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(4),
	GlitchData    => CRCOUT4_GlitchData,
	OutSignalName => "CRCOUT(4)",
	OutTemp       => CRCOUT_viol(4),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(4),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(5),
	GlitchData    => CRCOUT5_GlitchData,
	OutSignalName => "CRCOUT(5)",
	OutTemp       => CRCOUT_viol(5),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(5),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(6),
	GlitchData    => CRCOUT6_GlitchData,
	OutSignalName => "CRCOUT(6)",
	OutTemp       => CRCOUT_viol(6),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(6),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(7),
	GlitchData    => CRCOUT7_GlitchData,
	OutSignalName => "CRCOUT(7)",
	OutTemp       => CRCOUT_viol(7),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(7),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(8),
	GlitchData    => CRCOUT8_GlitchData,
	OutSignalName => "CRCOUT(8)",
	OutTemp       => CRCOUT_viol(8),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(8),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(9),
	GlitchData    => CRCOUT9_GlitchData,
	OutSignalName => "CRCOUT(9)",
	OutTemp       => CRCOUT_viol(9),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(9),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(10),
	GlitchData    => CRCOUT10_GlitchData,
	OutSignalName => "CRCOUT(10)",
	OutTemp       => CRCOUT_viol(10),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(10),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(11),
	GlitchData    => CRCOUT11_GlitchData,
	OutSignalName => "CRCOUT(11)",
	OutTemp       => CRCOUT_viol(11),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(11),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(12),
	GlitchData    => CRCOUT12_GlitchData,
	OutSignalName => "CRCOUT(12)",
	OutTemp       => CRCOUT_viol(12),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(12),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(13),
	GlitchData    => CRCOUT13_GlitchData,
	OutSignalName => "CRCOUT(13)",
	OutTemp       => CRCOUT_viol(13),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(13),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(14),
	GlitchData    => CRCOUT14_GlitchData,
	OutSignalName => "CRCOUT(14)",
	OutTemp       => CRCOUT_viol(14),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(14),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(15),
	GlitchData    => CRCOUT15_GlitchData,
	OutSignalName => "CRCOUT(15)",
	OutTemp       => CRCOUT_viol(15),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(15),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(16),
	GlitchData    => CRCOUT16_GlitchData,
	OutSignalName => "CRCOUT(16)",
	OutTemp       => CRCOUT_viol(16),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(16),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(17),
	GlitchData    => CRCOUT17_GlitchData,
	OutSignalName => "CRCOUT(17)",
	OutTemp       => CRCOUT_viol(17),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(17),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(18),
	GlitchData    => CRCOUT18_GlitchData,
	OutSignalName => "CRCOUT(18)",
	OutTemp       => CRCOUT_viol(18),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(18),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(19),
	GlitchData    => CRCOUT19_GlitchData,
	OutSignalName => "CRCOUT(19)",
	OutTemp       => CRCOUT_viol(19),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(19),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(20),
	GlitchData    => CRCOUT20_GlitchData,
	OutSignalName => "CRCOUT(20)",
	OutTemp       => CRCOUT_viol(20),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(20),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(21),
	GlitchData    => CRCOUT21_GlitchData,
	OutSignalName => "CRCOUT(21)",
	OutTemp       => CRCOUT_viol(21),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(21),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(22),
	GlitchData    => CRCOUT22_GlitchData,
	OutSignalName => "CRCOUT(22)",
	OutTemp       => CRCOUT_viol(22),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(22),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(23),
	GlitchData    => CRCOUT23_GlitchData,
	OutSignalName => "CRCOUT(23)",
	OutTemp       => CRCOUT_viol(23),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(23),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(24),
	GlitchData    => CRCOUT24_GlitchData,
	OutSignalName => "CRCOUT(24)",
	OutTemp       => CRCOUT_viol(24),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(24),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(25),
	GlitchData    => CRCOUT25_GlitchData,
	OutSignalName => "CRCOUT(25)",
	OutTemp       => CRCOUT_viol(25),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(25),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(26),
	GlitchData    => CRCOUT26_GlitchData,
	OutSignalName => "CRCOUT(26)",
	OutTemp       => CRCOUT_viol(26),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(26),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(27),
	GlitchData    => CRCOUT27_GlitchData,
	OutSignalName => "CRCOUT(27)",
	OutTemp       => CRCOUT_viol(27),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(27),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(28),
	GlitchData    => CRCOUT28_GlitchData,
	OutSignalName => "CRCOUT(28)",
	OutTemp       => CRCOUT_viol(28),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(28),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(29),
	GlitchData    => CRCOUT29_GlitchData,
	OutSignalName => "CRCOUT(29)",
	OutTemp       => CRCOUT_viol(29),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(29),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(30),
	GlitchData    => CRCOUT30_GlitchData,
	OutSignalName => "CRCOUT(30)",
	OutTemp       => CRCOUT_viol(30),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(30),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
	VitalPathDelay01
	(
	OutSignal     => CRCOUT(31),
	GlitchData    => CRCOUT31_GlitchData,
	OutSignalName => "CRCOUT(31)",
	OutTemp       => CRCOUT_viol(31),
	Paths       => (0 => (CRCCLK_dly'last_event, tpd_CRCCLK_CRCOUT(31),TRUE)),
	Mode          => VitalTransport,
	Xon           => false,
	MsgOn         => false,
	MsgSeverity   => WARNING
	);
    --  Wait signal (input/output pins)
   wait on
     Violation,
     CRCOUT_zd;
    
  end process;
    

end X_CRC64_V;
