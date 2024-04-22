-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_MULT18X18.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  18X18 Signed Multiplier
-- /___/   /\     Filename : X_MULT18X18.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_MULT18X18 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_MULT18X18 is
  generic (
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

    tipd_A : VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
    tipd_B : VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));

    tpd_A_P     :     VitalDelayArrayType01 (647 downto 0)  := (others => (0 ps, 0 ps));
    tpd_B_P     :     VitalDelayArrayType01 (647 downto 0 ) := (others => (0 ps, 0 ps))
    );
  port (
    P           : out std_logic_vector (35 downto 0);
    A           : in  std_logic_vector (17 downto 0);
    B           : in  std_logic_vector (17 downto 0)
    );
  attribute VITAL_LEVEL0 of
    X_MULT18X18 :     entity is true;

end X_MULT18X18;

architecture X_MULT18X18_V of X_MULT18X18 is

  function INT_TO_SLV(ARG : integer; SIZE : integer) return std_logic_vector is
    variable result       : std_logic_vector (SIZE-1 downto 0);
    variable temp         : integer := ARG;

  begin
    temp          := ARG;
    for i in 0 to SIZE-1 loop
      if (temp mod 2) = 1 then
        result(i) := '1';
      else
        result(i) := '0';
      end if;

      if temp > 0 then
        temp := temp /2 ;
      elsif (temp > integer'low) then
        temp := (temp-1) / 2;
      else
        temp := temp / 2;
      end if;
    end loop;
    return result;
  end;

  function COMPLEMENT(ARG : std_logic_vector ) return std_logic_vector is
    variable RESULT       : std_logic_vector (ARG'left downto 0);
    variable found1       : std_ulogic := '0';
  begin

    for i in 0 to ARG'left loop
      if (found1 = '0') then
        RESULT(i) := ARG(i);
        if (ARG(i) = '1' ) then
          found1  := '1';
        end if;
      else
        RESULT(i) := not ARG(i);
      end if;
    end loop;
    return result;
  end;

  function VECPLUS(A, B : std_logic_vector ) return std_logic_vector is
    variable carry      : std_ulogic;
    variable BV, sum    : std_logic_vector(A'left downto 0);
  begin

    if (A(A'left) = 'X' or B(B'left) = 'X') then
      sum    := (others => 'X');
      return(sum);
    end if;
    carry    := '0';
    BV       := B;
    for i in 0 to A'left loop
      sum(i) := A(i) xor BV(i) xor carry;
      carry  := (A(i) and BV(i)) or
               (A(i) and carry) or
               (carry and BV(i));
    end loop;
    return sum;
  end;

  signal A_ipd : std_logic_vector(17 downto 0) := (others => '0' );
  signal B_ipd : std_logic_vector(17 downto 0) := (others => '0' );

  signal Q_zd : std_logic_vector( A_ipd'length+B_ipd'length-1 downto 0);

  attribute VITAL_LEVEL0 of
    X_MULT18X18_V : architecture is true;

begin
  WireDelay : block
  begin
    A_DELAY : for i in 17 downto 0 generate
      VitalWireDelay ( A_ipd(i), A(i), tipd_A(i));
    end generate A_DELAY;

    B_DELAY : for i in 17 downto 0 generate
      VitalWireDelay ( B_ipd(i), B(i), tipd_B(i));
    end generate B_DELAY;
  end block;

--  A_ipd(35 downto 18) <= A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17);
--  B_ipd(35 downto 18) <= B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17);

  VITALBehaviour                 : process (A_ipd, B_ipd)
    variable O1_zd, O2_zd, O3_zd : std_logic_vector( A_ipd'length+B_ipd'length-1 downto 0);
    variable IA, IB1, Ib2        : integer ;
    variable sign                : std_ulogic := '0';
    variable A_i                 : std_logic_vector(A_ipd'left downto 0);
    variable B_i                 : std_logic_vector(B_ipd'left downto 0);
  begin

    if (A_ipd(A'left) = 'X' or B_ipd(B'left) = 'X') then
      O3_zd := (others => 'X');
    else
      if (A_ipd(A'left) = '1' ) then
        A_i := complement(A_ipd);
      else
        A_i := A_ipd;
      end if;

      if (B_ipd(B'left) = '1') then
        B_i := complement(B_ipd);
      else
        B_i := B_ipd;
      end if;

      IA    := SLV_TO_INT(A_i);
      IB1   := SLV_TO_INT(B_i (17 downto 9));
      IB2   := SLV_TO_INT(B_i (8 downto 0));
      O1_zd := INT_TO_SLV((IA * IB1), A'length+B'length);

      for j in 0 to 8 loop
        O1_zd(A'length+B'length-1 downto 0) := O1_zd(A'length+B'length-2 downto 0) & '0';
      end loop;

      O2_zd := INT_TO_SLV((IA * IB2), A'length+B'length);
      O3_zd := VECPLUS(O1_zd, O2_zd);
      sign  := A_ipd(A'left) xor B_ipd(B'left);

      if (sign = '1' ) then
        Q_zd <= complement(O3_zd);
      elsif(sign = '0') then
        Q_zd <= O3_zd;
      end if;
    end if;
  end process VITALBehaviour;

  VITALPathDelay          : process (Q_zd)
    variable P_zd         : std_logic_vector( A_ipd'length+B_ipd'length-1 downto 0);
    variable P_GlitchData : VitalGlitchDataArrayType (35 downto 0);
  begin
    P_zd := Q_zd;
       VitalPathDelay01 (
         OutSignal	=> P(35),
         GlitchData	=> P_GlitchData(35),
         OutSignalName	=> "P(35)",
         OutTemp	=> P_zd(35),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 0)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 0)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 0)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 0)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 0)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 0)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 0)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 0)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 0)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 0)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 0)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 0)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 0)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 0)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 0)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 0)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 0)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 0)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 0)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 0)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 0)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 0)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 0)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 0)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 0)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 0)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 0)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 0)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 0)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 0)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 0)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 0)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 0)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 0)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 0)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 0)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(34),
         GlitchData	=> P_GlitchData(34),
         OutSignalName	=> "P(34)",
         OutTemp	=> P_zd(34),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 1)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 1)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 1)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 1)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 1)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 1)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 1)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 1)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 1)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 1)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 1)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 1)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 1)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 1)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 1)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 1)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 1)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 1)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 1)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 1)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 1)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 1)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 1)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 1)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 1)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 1)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 1)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 1)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 1)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 1)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 1)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 1)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 1)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 1)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 1)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 1)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(33),
         GlitchData	=> P_GlitchData(33),
         OutSignalName	=> "P(33)",
         OutTemp	=> P_zd(33),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 2)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 2)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 2)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 2)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 2)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 2)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 2)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 2)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 2)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 2)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 2)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 2)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 2)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 2)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 2)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 2)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 2)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 2)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 2)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 2)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 2)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 2)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 2)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 2)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 2)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 2)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 2)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 2)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 2)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 2)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 2)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 2)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 2)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 2)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 2)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 2)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(32),
         GlitchData	=> P_GlitchData(32),
         OutSignalName	=> "P(32)",
         OutTemp	=> P_zd(32),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 3)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 3)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 3)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 3)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 3)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 3)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 3)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 3)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 3)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 3)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 3)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 3)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 3)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 3)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 3)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 3)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 3)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 3)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 3)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 3)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 3)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 3)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 3)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 3)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 3)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 3)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 3)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 3)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 3)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 3)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 3)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 3)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 3)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 3)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 3)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 3)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(31),
         GlitchData	=> P_GlitchData(31),
         OutSignalName	=> "P(31)",
         OutTemp	=> P_zd(31),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 4)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 4)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 4)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 4)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 4)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 4)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 4)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 4)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 4)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 4)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 4)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 4)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 4)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 4)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 4)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 4)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 4)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 4)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 4)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 4)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 4)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 4)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 4)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 4)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 4)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 4)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 4)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 4)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 4)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 4)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 4)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 4)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 4)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 4)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 4)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 4)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(30),
         GlitchData	=> P_GlitchData(30),
         OutSignalName	=> "P(30)",
         OutTemp	=> P_zd(30),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 5)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 5)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 5)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 5)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 5)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 5)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 5)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 5)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 5)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 5)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 5)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 5)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 5)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 5)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 5)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 5)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 5)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 5)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 5)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 5)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 5)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 5)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 5)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 5)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 5)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 5)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 5)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 5)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 5)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 5)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 5)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 5)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 5)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 5)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 5)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 5)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(29),
         GlitchData	=> P_GlitchData(29),
         OutSignalName	=> "P(29)",
         OutTemp	=> P_zd(29),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 6)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 6)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 6)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 6)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 6)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 6)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 6)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 6)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 6)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 6)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 6)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 6)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 6)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 6)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 6)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 6)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 6)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 6)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 6)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 6)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 6)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 6)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 6)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 6)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 6)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 6)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 6)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 6)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 6)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 6)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 6)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 6)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 6)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 6)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 6)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 6)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(28),
         GlitchData	=> P_GlitchData(28),
         OutSignalName	=> "P(28)",
         OutTemp	=> P_zd(28),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 7)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 7)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 7)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 7)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 7)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 7)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 7)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 7)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 7)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 7)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 7)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 7)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 7)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 7)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 7)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 7)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 7)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 7)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 7)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 7)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 7)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 7)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 7)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 7)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 7)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 7)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 7)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 7)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 7)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 7)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 7)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 7)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 7)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 7)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 7)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 7)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(27),
         GlitchData	=> P_GlitchData(27),
         OutSignalName	=> "P(27)",
         OutTemp	=> P_zd(27),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 8)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 8)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 8)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 8)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 8)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 8)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 8)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 8)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 8)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 8)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 8)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 8)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 8)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 8)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 8)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 8)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 8)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 8)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 8)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 8)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 8)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 8)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 8)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 8)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 8)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 8)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 8)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 8)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 8)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 8)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 8)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 8)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 8)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 8)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 8)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 8)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(26),
         GlitchData	=> P_GlitchData(26),
         OutSignalName	=> "P(26)",
         OutTemp	=> P_zd(26),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 9)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 9)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 9)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 9)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 9)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 9)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 9)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 9)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 9)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 9)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 9)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 9)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 9)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 9)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 9)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 9)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 9)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 9)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 9)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 9)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 9)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 9)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 9)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 9)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 9)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 9)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 9)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 9)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 9)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 9)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 9)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 9)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 9)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 9)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 9)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 9)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(25),
         GlitchData	=> P_GlitchData(25),
         OutSignalName	=> "P(25)",
         OutTemp	=> P_zd(25),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 10)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 10)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 10)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 10)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 10)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 10)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 10)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 10)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 10)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 10)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 10)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 10)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 10)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 10)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 10)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 10)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 10)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 10)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 10)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 10)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 10)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 10)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 10)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 10)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 10)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 10)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 10)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 10)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 10)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 10)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 10)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 10)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 10)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 10)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 10)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 10)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(24),
         GlitchData	=> P_GlitchData(24),
         OutSignalName	=> "P(24)",
         OutTemp	=> P_zd(24),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 11)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 11)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 11)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 11)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 11)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 11)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 11)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 11)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 11)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 11)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 11)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 11)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 11)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 11)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 11)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 11)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 11)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 11)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 11)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 11)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 11)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 11)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 11)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 11)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 11)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 11)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 11)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 11)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 11)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 11)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 11)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 11)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 11)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 11)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 11)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 11)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(23),
         GlitchData	=> P_GlitchData(23),
         OutSignalName	=> "P(23)",
         OutTemp	=> P_zd(23),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 12)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 12)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 12)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 12)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 12)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 12)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 12)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 12)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 12)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 12)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 12)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 12)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 12)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 12)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 12)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 12)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 12)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 12)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 12)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 12)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 12)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 12)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 12)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 12)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 12)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 12)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 12)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 12)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 12)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 12)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 12)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 12)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 12)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 12)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 12)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 12)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(22),
         GlitchData	=> P_GlitchData(22),
         OutSignalName	=> "P(22)",
         OutTemp	=> P_zd(22),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 13)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 13)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 13)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 13)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 13)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 13)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 13)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 13)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 13)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 13)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 13)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 13)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 13)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 13)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 13)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 13)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 13)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 13)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 13)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 13)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 13)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 13)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 13)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 13)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 13)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 13)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 13)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 13)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 13)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 13)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 13)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 13)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 13)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 13)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 13)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 13)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(21),
         GlitchData	=> P_GlitchData(21),
         OutSignalName	=> "P(21)",
         OutTemp	=> P_zd(21),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 14)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 14)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 14)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 14)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 14)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 14)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 14)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 14)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 14)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 14)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 14)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 14)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 14)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 14)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 14)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 14)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 14)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 14)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 14)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 14)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 14)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 14)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 14)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 14)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 14)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 14)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 14)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 14)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 14)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 14)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 14)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 14)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 14)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 14)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 14)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 14)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(20),
         GlitchData	=> P_GlitchData(20),
         OutSignalName	=> "P(20)",
         OutTemp	=> P_zd(20),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 15)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 15)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 15)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 15)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 15)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 15)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 15)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 15)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 15)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 15)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 15)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 15)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 15)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 15)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 15)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 15)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 15)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 15)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 15)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 15)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 15)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 15)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 15)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 15)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 15)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 15)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 15)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 15)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 15)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 15)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 15)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 15)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 15)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 15)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 15)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 15)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(19),
         GlitchData	=> P_GlitchData(19),
         OutSignalName	=> "P(19)",
         OutTemp	=> P_zd(19),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 16)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 16)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 16)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 16)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 16)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 16)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 16)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 16)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 16)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 16)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 16)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 16)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 16)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 16)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 16)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 16)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 16)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 16)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 16)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 16)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 16)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 16)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 16)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 16)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 16)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 16)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 16)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 16)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 16)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 16)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 16)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 16)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 16)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 16)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 16)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 16)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(18),
         GlitchData	=> P_GlitchData(18),
         OutSignalName	=> "P(18)",
         OutTemp	=> P_zd(18),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 17)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 17)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 17)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 17)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 17)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 17)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 17)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 17)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 17)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 17)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 17)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 17)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 17)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 17)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 17)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 17)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 17)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 17)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 17)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 17)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 17)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 17)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 17)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 17)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 17)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 17)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 17)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 17)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 17)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 17)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 17)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 17)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 17)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 17)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 17)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 17)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(17),
         GlitchData	=> P_GlitchData(17),
         OutSignalName	=> "P(17)",
         OutTemp	=> P_zd(17),
         Paths		=> (
			0 => (A_ipd(17)'last_event, tpd_A_P((647 - 18)- 36*0), true),
			1 => (A_ipd(16)'last_event, tpd_A_P((647 - 18)- 36*1), true),
			2 => (A_ipd(15)'last_event, tpd_A_P((647 - 18)- 36*2), true),
			3 => (A_ipd(14)'last_event, tpd_A_P((647 - 18)- 36*3), true),
			4 => (A_ipd(13)'last_event, tpd_A_P((647 - 18)- 36*4), true),
			5 => (A_ipd(12)'last_event, tpd_A_P((647 - 18)- 36*5), true),
			6 => (A_ipd(11)'last_event, tpd_A_P((647 - 18)- 36*6), true),
			7 => (A_ipd(10)'last_event, tpd_A_P((647 - 18)- 36*7), true),
			8 => (A_ipd(9)'last_event, tpd_A_P((647 - 18)- 36*8), true),
			9 => (A_ipd(8)'last_event, tpd_A_P((647 - 18)- 36*9), true),
			10 => (A_ipd(7)'last_event, tpd_A_P((647 - 18)- 36*10), true),
			11 => (A_ipd(6)'last_event, tpd_A_P((647 - 18)- 36*11), true),
			12 => (A_ipd(5)'last_event, tpd_A_P((647 - 18)- 36*12), true),
			13 => (A_ipd(4)'last_event, tpd_A_P((647 - 18)- 36*13), true),
			14 => (A_ipd(3)'last_event, tpd_A_P((647 - 18)- 36*14), true),
			15 => (A_ipd(2)'last_event, tpd_A_P((647 - 18)- 36*15), true),
			16 => (A_ipd(1)'last_event, tpd_A_P((647 - 18)- 36*16), true),
			17 => (A_ipd(0)'last_event, tpd_A_P((647 - 18)- 36*17), true),
			18 => (B_ipd(17)'last_event, tpd_B_P((647 - 18)- 36*0), true),
			19 => (B_ipd(16)'last_event, tpd_B_P((647 - 18)- 36*1), true),
			20 => (B_ipd(15)'last_event, tpd_B_P((647 - 18)- 36*2), true),
			21 => (B_ipd(14)'last_event, tpd_B_P((647 - 18)- 36*3), true),
			22 => (B_ipd(13)'last_event, tpd_B_P((647 - 18)- 36*4), true),
			23 => (B_ipd(12)'last_event, tpd_B_P((647 - 18)- 36*5), true),
			24 => (B_ipd(11)'last_event, tpd_B_P((647 - 18)- 36*6), true),
			25 => (B_ipd(10)'last_event, tpd_B_P((647 - 18)- 36*7), true),
			26 => (B_ipd(9)'last_event, tpd_B_P((647 - 18)- 36*8), true),
			27 => (B_ipd(8)'last_event, tpd_B_P((647 - 18)- 36*9), true),
			28 => (B_ipd(7)'last_event, tpd_B_P((647 - 18)- 36*10), true),
			29 => (B_ipd(6)'last_event, tpd_B_P((647 - 18)- 36*11), true),
			30 => (B_ipd(5)'last_event, tpd_B_P((647 - 18)- 36*12), true),
			31 => (B_ipd(4)'last_event, tpd_B_P((647 - 18)- 36*13), true),
			32 => (B_ipd(3)'last_event, tpd_B_P((647 - 18)- 36*14), true),
			33 => (B_ipd(2)'last_event, tpd_B_P((647 - 18)- 36*15), true),
			34 => (B_ipd(1)'last_event, tpd_B_P((647 - 18)- 36*16), true),
			35 => (B_ipd(0)'last_event, tpd_B_P((647 - 18)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(16),
         GlitchData	=> P_GlitchData(16),
         OutSignalName	=> "P(16)",
         OutTemp	=> P_zd(16),
         Paths		=> (
			0 => (A_ipd(16)'last_event, tpd_A_P((647 - 19)- 36*1), true),
			1 => (A_ipd(15)'last_event, tpd_A_P((647 - 19)- 36*2), true),
			2 => (A_ipd(14)'last_event, tpd_A_P((647 - 19)- 36*3), true),
			3 => (A_ipd(13)'last_event, tpd_A_P((647 - 19)- 36*4), true),
			4 => (A_ipd(12)'last_event, tpd_A_P((647 - 19)- 36*5), true),
			5 => (A_ipd(11)'last_event, tpd_A_P((647 - 19)- 36*6), true),
			6 => (A_ipd(10)'last_event, tpd_A_P((647 - 19)- 36*7), true),
			7 => (A_ipd(9)'last_event, tpd_A_P((647 - 19)- 36*8), true),
			8 => (A_ipd(8)'last_event, tpd_A_P((647 - 19)- 36*9), true),
			9 => (A_ipd(7)'last_event, tpd_A_P((647 - 19)- 36*10), true),
			10 => (A_ipd(6)'last_event, tpd_A_P((647 - 19)- 36*11), true),
			11 => (A_ipd(5)'last_event, tpd_A_P((647 - 19)- 36*12), true),
			12 => (A_ipd(4)'last_event, tpd_A_P((647 - 19)- 36*13), true),
			13 => (A_ipd(3)'last_event, tpd_A_P((647 - 19)- 36*14), true),
			14 => (A_ipd(2)'last_event, tpd_A_P((647 - 19)- 36*15), true),
			15 => (A_ipd(1)'last_event, tpd_A_P((647 - 19)- 36*16), true),
			16 => (A_ipd(0)'last_event, tpd_A_P((647 - 19)- 36*17), true),
			17 => (B_ipd(16)'last_event, tpd_B_P((647 - 19)- 36*1), true),
			18 => (B_ipd(15)'last_event, tpd_B_P((647 - 19)- 36*2), true),
			19 => (B_ipd(14)'last_event, tpd_B_P((647 - 19)- 36*3), true),
			20 => (B_ipd(13)'last_event, tpd_B_P((647 - 19)- 36*4), true),
			21 => (B_ipd(12)'last_event, tpd_B_P((647 - 19)- 36*5), true),
			22 => (B_ipd(11)'last_event, tpd_B_P((647 - 19)- 36*6), true),
			23 => (B_ipd(10)'last_event, tpd_B_P((647 - 19)- 36*7), true),
			24 => (B_ipd(9)'last_event, tpd_B_P((647 - 19)- 36*8), true),
			25 => (B_ipd(8)'last_event, tpd_B_P((647 - 19)- 36*9), true),
			26 => (B_ipd(7)'last_event, tpd_B_P((647 - 19)- 36*10), true),
			27 => (B_ipd(6)'last_event, tpd_B_P((647 - 19)- 36*11), true),
			28 => (B_ipd(5)'last_event, tpd_B_P((647 - 19)- 36*12), true),
			29 => (B_ipd(4)'last_event, tpd_B_P((647 - 19)- 36*13), true),
			30 => (B_ipd(3)'last_event, tpd_B_P((647 - 19)- 36*14), true),
			31 => (B_ipd(2)'last_event, tpd_B_P((647 - 19)- 36*15), true),
			32 => (B_ipd(1)'last_event, tpd_B_P((647 - 19)- 36*16), true),
			33 => (B_ipd(0)'last_event, tpd_B_P((647 - 19)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(15),
         GlitchData	=> P_GlitchData(15),
         OutSignalName	=> "P(15)",
         OutTemp	=> P_zd(15),
         Paths		=> (
			0 => (A_ipd(15)'last_event, tpd_A_P((647 - 20)- 36*2), true),
			1 => (A_ipd(14)'last_event, tpd_A_P((647 - 20)- 36*3), true),
			2 => (A_ipd(13)'last_event, tpd_A_P((647 - 20)- 36*4), true),
			3 => (A_ipd(12)'last_event, tpd_A_P((647 - 20)- 36*5), true),
			4 => (A_ipd(11)'last_event, tpd_A_P((647 - 20)- 36*6), true),
			5 => (A_ipd(10)'last_event, tpd_A_P((647 - 20)- 36*7), true),
			6 => (A_ipd(9)'last_event, tpd_A_P((647 - 20)- 36*8), true),
			7 => (A_ipd(8)'last_event, tpd_A_P((647 - 20)- 36*9), true),
			8 => (A_ipd(7)'last_event, tpd_A_P((647 - 20)- 36*10), true),
			9 => (A_ipd(6)'last_event, tpd_A_P((647 - 20)- 36*11), true),
			10 => (A_ipd(5)'last_event, tpd_A_P((647 - 20)- 36*12), true),
			11 => (A_ipd(4)'last_event, tpd_A_P((647 - 20)- 36*13), true),
			12 => (A_ipd(3)'last_event, tpd_A_P((647 - 20)- 36*14), true),
			13 => (A_ipd(2)'last_event, tpd_A_P((647 - 20)- 36*15), true),
			14 => (A_ipd(1)'last_event, tpd_A_P((647 - 20)- 36*16), true),
			15 => (A_ipd(0)'last_event, tpd_A_P((647 - 20)- 36*17), true),
			16 => (B_ipd(15)'last_event, tpd_B_P((647 - 20)- 36*2), true),
			17 => (B_ipd(14)'last_event, tpd_B_P((647 - 20)- 36*3), true),
			18 => (B_ipd(13)'last_event, tpd_B_P((647 - 20)- 36*4), true),
			19 => (B_ipd(12)'last_event, tpd_B_P((647 - 20)- 36*5), true),
			20 => (B_ipd(11)'last_event, tpd_B_P((647 - 20)- 36*6), true),
			21 => (B_ipd(10)'last_event, tpd_B_P((647 - 20)- 36*7), true),
			22 => (B_ipd(9)'last_event, tpd_B_P((647 - 20)- 36*8), true),
			23 => (B_ipd(8)'last_event, tpd_B_P((647 - 20)- 36*9), true),
			24 => (B_ipd(7)'last_event, tpd_B_P((647 - 20)- 36*10), true),
			25 => (B_ipd(6)'last_event, tpd_B_P((647 - 20)- 36*11), true),
			26 => (B_ipd(5)'last_event, tpd_B_P((647 - 20)- 36*12), true),
			27 => (B_ipd(4)'last_event, tpd_B_P((647 - 20)- 36*13), true),
			28 => (B_ipd(3)'last_event, tpd_B_P((647 - 20)- 36*14), true),
			29 => (B_ipd(2)'last_event, tpd_B_P((647 - 20)- 36*15), true),
			30 => (B_ipd(1)'last_event, tpd_B_P((647 - 20)- 36*16), true),
			31 => (B_ipd(0)'last_event, tpd_B_P((647 - 20)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(14),
         GlitchData	=> P_GlitchData(14),
         OutSignalName	=> "P(14)",
         OutTemp	=> P_zd(14),
         Paths		=> (
			0 => (A_ipd(14)'last_event, tpd_A_P((647 - 21)- 36*3), true),
			1 => (A_ipd(13)'last_event, tpd_A_P((647 - 21)- 36*4), true),
			2 => (A_ipd(12)'last_event, tpd_A_P((647 - 21)- 36*5), true),
			3 => (A_ipd(11)'last_event, tpd_A_P((647 - 21)- 36*6), true),
			4 => (A_ipd(10)'last_event, tpd_A_P((647 - 21)- 36*7), true),
			5 => (A_ipd(9)'last_event, tpd_A_P((647 - 21)- 36*8), true),
			6 => (A_ipd(8)'last_event, tpd_A_P((647 - 21)- 36*9), true),
			7 => (A_ipd(7)'last_event, tpd_A_P((647 - 21)- 36*10), true),
			8 => (A_ipd(6)'last_event, tpd_A_P((647 - 21)- 36*11), true),
			9 => (A_ipd(5)'last_event, tpd_A_P((647 - 21)- 36*12), true),
			10 => (A_ipd(4)'last_event, tpd_A_P((647 - 21)- 36*13), true),
			11 => (A_ipd(3)'last_event, tpd_A_P((647 - 21)- 36*14), true),
			12 => (A_ipd(2)'last_event, tpd_A_P((647 - 21)- 36*15), true),
			13 => (A_ipd(1)'last_event, tpd_A_P((647 - 21)- 36*16), true),
			14 => (A_ipd(0)'last_event, tpd_A_P((647 - 21)- 36*17), true),
			15 => (B_ipd(14)'last_event, tpd_B_P((647 - 21)- 36*3), true),
			16 => (B_ipd(13)'last_event, tpd_B_P((647 - 21)- 36*4), true),
			17 => (B_ipd(12)'last_event, tpd_B_P((647 - 21)- 36*5), true),
			18 => (B_ipd(11)'last_event, tpd_B_P((647 - 21)- 36*6), true),
			19 => (B_ipd(10)'last_event, tpd_B_P((647 - 21)- 36*7), true),
			20 => (B_ipd(9)'last_event, tpd_B_P((647 - 21)- 36*8), true),
			21 => (B_ipd(8)'last_event, tpd_B_P((647 - 21)- 36*9), true),
			22 => (B_ipd(7)'last_event, tpd_B_P((647 - 21)- 36*10), true),
			23 => (B_ipd(6)'last_event, tpd_B_P((647 - 21)- 36*11), true),
			24 => (B_ipd(5)'last_event, tpd_B_P((647 - 21)- 36*12), true),
			25 => (B_ipd(4)'last_event, tpd_B_P((647 - 21)- 36*13), true),
			26 => (B_ipd(3)'last_event, tpd_B_P((647 - 21)- 36*14), true),
			27 => (B_ipd(2)'last_event, tpd_B_P((647 - 21)- 36*15), true),
			28 => (B_ipd(1)'last_event, tpd_B_P((647 - 21)- 36*16), true),
			29 => (B_ipd(0)'last_event, tpd_B_P((647 - 21)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(13),
         GlitchData	=> P_GlitchData(13),
         OutSignalName	=> "P(13)",
         OutTemp	=> P_zd(13),
         Paths		=> (
			0 => (A_ipd(13)'last_event, tpd_A_P((647 - 22)- 36*4), true),
			1 => (A_ipd(12)'last_event, tpd_A_P((647 - 22)- 36*5), true),
			2 => (A_ipd(11)'last_event, tpd_A_P((647 - 22)- 36*6), true),
			3 => (A_ipd(10)'last_event, tpd_A_P((647 - 22)- 36*7), true),
			4 => (A_ipd(9)'last_event, tpd_A_P((647 - 22)- 36*8), true),
			5 => (A_ipd(8)'last_event, tpd_A_P((647 - 22)- 36*9), true),
			6 => (A_ipd(7)'last_event, tpd_A_P((647 - 22)- 36*10), true),
			7 => (A_ipd(6)'last_event, tpd_A_P((647 - 22)- 36*11), true),
			8 => (A_ipd(5)'last_event, tpd_A_P((647 - 22)- 36*12), true),
			9 => (A_ipd(4)'last_event, tpd_A_P((647 - 22)- 36*13), true),
			10 => (A_ipd(3)'last_event, tpd_A_P((647 - 22)- 36*14), true),
			11 => (A_ipd(2)'last_event, tpd_A_P((647 - 22)- 36*15), true),
			12 => (A_ipd(1)'last_event, tpd_A_P((647 - 22)- 36*16), true),
			13 => (A_ipd(0)'last_event, tpd_A_P((647 - 22)- 36*17), true),
			14 => (B_ipd(13)'last_event, tpd_B_P((647 - 22)- 36*4), true),
			15 => (B_ipd(12)'last_event, tpd_B_P((647 - 22)- 36*5), true),
			16 => (B_ipd(11)'last_event, tpd_B_P((647 - 22)- 36*6), true),
			17 => (B_ipd(10)'last_event, tpd_B_P((647 - 22)- 36*7), true),
			18 => (B_ipd(9)'last_event, tpd_B_P((647 - 22)- 36*8), true),
			19 => (B_ipd(8)'last_event, tpd_B_P((647 - 22)- 36*9), true),
			20 => (B_ipd(7)'last_event, tpd_B_P((647 - 22)- 36*10), true),
			21 => (B_ipd(6)'last_event, tpd_B_P((647 - 22)- 36*11), true),
			22 => (B_ipd(5)'last_event, tpd_B_P((647 - 22)- 36*12), true),
			23 => (B_ipd(4)'last_event, tpd_B_P((647 - 22)- 36*13), true),
			24 => (B_ipd(3)'last_event, tpd_B_P((647 - 22)- 36*14), true),
			25 => (B_ipd(2)'last_event, tpd_B_P((647 - 22)- 36*15), true),
			26 => (B_ipd(1)'last_event, tpd_B_P((647 - 22)- 36*16), true),
			27 => (B_ipd(0)'last_event, tpd_B_P((647 - 22)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(12),
         GlitchData	=> P_GlitchData(12),
         OutSignalName	=> "P(12)",
         OutTemp	=> P_zd(12),
         Paths		=> (
			0 => (A_ipd(12)'last_event, tpd_A_P((647 - 23)- 36*5), true),
			1 => (A_ipd(11)'last_event, tpd_A_P((647 - 23)- 36*6), true),
			2 => (A_ipd(10)'last_event, tpd_A_P((647 - 23)- 36*7), true),
			3 => (A_ipd(9)'last_event, tpd_A_P((647 - 23)- 36*8), true),
			4 => (A_ipd(8)'last_event, tpd_A_P((647 - 23)- 36*9), true),
			5 => (A_ipd(7)'last_event, tpd_A_P((647 - 23)- 36*10), true),
			6 => (A_ipd(6)'last_event, tpd_A_P((647 - 23)- 36*11), true),
			7 => (A_ipd(5)'last_event, tpd_A_P((647 - 23)- 36*12), true),
			8 => (A_ipd(4)'last_event, tpd_A_P((647 - 23)- 36*13), true),
			9 => (A_ipd(3)'last_event, tpd_A_P((647 - 23)- 36*14), true),
			10 => (A_ipd(2)'last_event, tpd_A_P((647 - 23)- 36*15), true),
			11 => (A_ipd(1)'last_event, tpd_A_P((647 - 23)- 36*16), true),
			12 => (A_ipd(0)'last_event, tpd_A_P((647 - 23)- 36*17), true),
			13 => (B_ipd(12)'last_event, tpd_B_P((647 - 23)- 36*5), true),
			14 => (B_ipd(11)'last_event, tpd_B_P((647 - 23)- 36*6), true),
			15 => (B_ipd(10)'last_event, tpd_B_P((647 - 23)- 36*7), true),
			16 => (B_ipd(9)'last_event, tpd_B_P((647 - 23)- 36*8), true),
			17 => (B_ipd(8)'last_event, tpd_B_P((647 - 23)- 36*9), true),
			18 => (B_ipd(7)'last_event, tpd_B_P((647 - 23)- 36*10), true),
			19 => (B_ipd(6)'last_event, tpd_B_P((647 - 23)- 36*11), true),
			20 => (B_ipd(5)'last_event, tpd_B_P((647 - 23)- 36*12), true),
			21 => (B_ipd(4)'last_event, tpd_B_P((647 - 23)- 36*13), true),
			22 => (B_ipd(3)'last_event, tpd_B_P((647 - 23)- 36*14), true),
			23 => (B_ipd(2)'last_event, tpd_B_P((647 - 23)- 36*15), true),
			24 => (B_ipd(1)'last_event, tpd_B_P((647 - 23)- 36*16), true),
			25 => (B_ipd(0)'last_event, tpd_B_P((647 - 23)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(11),
         GlitchData	=> P_GlitchData(11),
         OutSignalName	=> "P(11)",
         OutTemp	=> P_zd(11),
         Paths		=> (
			0 => (A_ipd(11)'last_event, tpd_A_P((647 - 24)- 36*6), true),
			1 => (A_ipd(10)'last_event, tpd_A_P((647 - 24)- 36*7), true),
			2 => (A_ipd(9)'last_event, tpd_A_P((647 - 24)- 36*8), true),
			3 => (A_ipd(8)'last_event, tpd_A_P((647 - 24)- 36*9), true),
			4 => (A_ipd(7)'last_event, tpd_A_P((647 - 24)- 36*10), true),
			5 => (A_ipd(6)'last_event, tpd_A_P((647 - 24)- 36*11), true),
			6 => (A_ipd(5)'last_event, tpd_A_P((647 - 24)- 36*12), true),
			7 => (A_ipd(4)'last_event, tpd_A_P((647 - 24)- 36*13), true),
			8 => (A_ipd(3)'last_event, tpd_A_P((647 - 24)- 36*14), true),
			9 => (A_ipd(2)'last_event, tpd_A_P((647 - 24)- 36*15), true),
			10 => (A_ipd(1)'last_event, tpd_A_P((647 - 24)- 36*16), true),
			11 => (A_ipd(0)'last_event, tpd_A_P((647 - 24)- 36*17), true),
			12 => (B_ipd(11)'last_event, tpd_B_P((647 - 24)- 36*6), true),
			13 => (B_ipd(10)'last_event, tpd_B_P((647 - 24)- 36*7), true),
			14 => (B_ipd(9)'last_event, tpd_B_P((647 - 24)- 36*8), true),
			15 => (B_ipd(8)'last_event, tpd_B_P((647 - 24)- 36*9), true),
			16 => (B_ipd(7)'last_event, tpd_B_P((647 - 24)- 36*10), true),
			17 => (B_ipd(6)'last_event, tpd_B_P((647 - 24)- 36*11), true),
			18 => (B_ipd(5)'last_event, tpd_B_P((647 - 24)- 36*12), true),
			19 => (B_ipd(4)'last_event, tpd_B_P((647 - 24)- 36*13), true),
			20 => (B_ipd(3)'last_event, tpd_B_P((647 - 24)- 36*14), true),
			21 => (B_ipd(2)'last_event, tpd_B_P((647 - 24)- 36*15), true),
			22 => (B_ipd(1)'last_event, tpd_B_P((647 - 24)- 36*16), true),
			23 => (B_ipd(0)'last_event, tpd_B_P((647 - 24)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(10),
         GlitchData	=> P_GlitchData(10),
         OutSignalName	=> "P(10)",
         OutTemp	=> P_zd(10),
         Paths		=> (
			0 => (A_ipd(10)'last_event, tpd_A_P((647 - 25)- 36*7), true),
			1 => (A_ipd(9)'last_event, tpd_A_P((647 - 25)- 36*8), true),
			2 => (A_ipd(8)'last_event, tpd_A_P((647 - 25)- 36*9), true),
			3 => (A_ipd(7)'last_event, tpd_A_P((647 - 25)- 36*10), true),
			4 => (A_ipd(6)'last_event, tpd_A_P((647 - 25)- 36*11), true),
			5 => (A_ipd(5)'last_event, tpd_A_P((647 - 25)- 36*12), true),
			6 => (A_ipd(4)'last_event, tpd_A_P((647 - 25)- 36*13), true),
			7 => (A_ipd(3)'last_event, tpd_A_P((647 - 25)- 36*14), true),
			8 => (A_ipd(2)'last_event, tpd_A_P((647 - 25)- 36*15), true),
			9 => (A_ipd(1)'last_event, tpd_A_P((647 - 25)- 36*16), true),
			10 => (A_ipd(0)'last_event, tpd_A_P((647 - 25)- 36*17), true),
			11 => (B_ipd(10)'last_event, tpd_B_P((647 - 25)- 36*7), true),
			12 => (B_ipd(9)'last_event, tpd_B_P((647 - 25)- 36*8), true),
			13 => (B_ipd(8)'last_event, tpd_B_P((647 - 25)- 36*9), true),
			14 => (B_ipd(7)'last_event, tpd_B_P((647 - 25)- 36*10), true),
			15 => (B_ipd(6)'last_event, tpd_B_P((647 - 25)- 36*11), true),
			16 => (B_ipd(5)'last_event, tpd_B_P((647 - 25)- 36*12), true),
			17 => (B_ipd(4)'last_event, tpd_B_P((647 - 25)- 36*13), true),
			18 => (B_ipd(3)'last_event, tpd_B_P((647 - 25)- 36*14), true),
			19 => (B_ipd(2)'last_event, tpd_B_P((647 - 25)- 36*15), true),
			20 => (B_ipd(1)'last_event, tpd_B_P((647 - 25)- 36*16), true),
			21 => (B_ipd(0)'last_event, tpd_B_P((647 - 25)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(9),
         GlitchData	=> P_GlitchData(9),
         OutSignalName	=> "P(9)",
         OutTemp	=> P_zd(9),
         Paths		=> (
			0 => (A_ipd(9)'last_event, tpd_A_P((647 - 26)- 36*8), true),
			1 => (A_ipd(8)'last_event, tpd_A_P((647 - 26)- 36*9), true),
			2 => (A_ipd(7)'last_event, tpd_A_P((647 - 26)- 36*10), true),
			3 => (A_ipd(6)'last_event, tpd_A_P((647 - 26)- 36*11), true),
			4 => (A_ipd(5)'last_event, tpd_A_P((647 - 26)- 36*12), true),
			5 => (A_ipd(4)'last_event, tpd_A_P((647 - 26)- 36*13), true),
			6 => (A_ipd(3)'last_event, tpd_A_P((647 - 26)- 36*14), true),
			7 => (A_ipd(2)'last_event, tpd_A_P((647 - 26)- 36*15), true),
			8 => (A_ipd(1)'last_event, tpd_A_P((647 - 26)- 36*16), true),
			9 => (A_ipd(0)'last_event, tpd_A_P((647 - 26)- 36*17), true),
			10 => (B_ipd(9)'last_event, tpd_B_P((647 - 26)- 36*8), true),
			11 => (B_ipd(8)'last_event, tpd_B_P((647 - 26)- 36*9), true),
			12 => (B_ipd(7)'last_event, tpd_B_P((647 - 26)- 36*10), true),
			13 => (B_ipd(6)'last_event, tpd_B_P((647 - 26)- 36*11), true),
			14 => (B_ipd(5)'last_event, tpd_B_P((647 - 26)- 36*12), true),
			15 => (B_ipd(4)'last_event, tpd_B_P((647 - 26)- 36*13), true),
			16 => (B_ipd(3)'last_event, tpd_B_P((647 - 26)- 36*14), true),
			17 => (B_ipd(2)'last_event, tpd_B_P((647 - 26)- 36*15), true),
			18 => (B_ipd(1)'last_event, tpd_B_P((647 - 26)- 36*16), true),
			19 => (B_ipd(0)'last_event, tpd_B_P((647 - 26)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(8),
         GlitchData	=> P_GlitchData(8),
         OutSignalName	=> "P(8)",
         OutTemp	=> P_zd(8),
         Paths		=> (
			0 => (A_ipd(8)'last_event, tpd_A_P((647 - 27)- 36*9), true),
			1 => (A_ipd(7)'last_event, tpd_A_P((647 - 27)- 36*10), true),
			2 => (A_ipd(6)'last_event, tpd_A_P((647 - 27)- 36*11), true),
			3 => (A_ipd(5)'last_event, tpd_A_P((647 - 27)- 36*12), true),
			4 => (A_ipd(4)'last_event, tpd_A_P((647 - 27)- 36*13), true),
			5 => (A_ipd(3)'last_event, tpd_A_P((647 - 27)- 36*14), true),
			6 => (A_ipd(2)'last_event, tpd_A_P((647 - 27)- 36*15), true),
			7 => (A_ipd(1)'last_event, tpd_A_P((647 - 27)- 36*16), true),
			8 => (A_ipd(0)'last_event, tpd_A_P((647 - 27)- 36*17), true),
			9 => (B_ipd(8)'last_event, tpd_B_P((647 - 27)- 36*9), true),
			10 => (B_ipd(7)'last_event, tpd_B_P((647 - 27)- 36*10), true),
			11 => (B_ipd(6)'last_event, tpd_B_P((647 - 27)- 36*11), true),
			12 => (B_ipd(5)'last_event, tpd_B_P((647 - 27)- 36*12), true),
			13 => (B_ipd(4)'last_event, tpd_B_P((647 - 27)- 36*13), true),
			14 => (B_ipd(3)'last_event, tpd_B_P((647 - 27)- 36*14), true),
			15 => (B_ipd(2)'last_event, tpd_B_P((647 - 27)- 36*15), true),
			16 => (B_ipd(1)'last_event, tpd_B_P((647 - 27)- 36*16), true),
			17 => (B_ipd(0)'last_event, tpd_B_P((647 - 27)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(7),
         GlitchData	=> P_GlitchData(7),
         OutSignalName	=> "P(7)",
         OutTemp	=> P_zd(7),
         Paths		=> (
			0 => (A_ipd(7)'last_event, tpd_A_P((647 - 28)- 36*10), true),
			1 => (A_ipd(6)'last_event, tpd_A_P((647 - 28)- 36*11), true),
			2 => (A_ipd(5)'last_event, tpd_A_P((647 - 28)- 36*12), true),
			3 => (A_ipd(4)'last_event, tpd_A_P((647 - 28)- 36*13), true),
			4 => (A_ipd(3)'last_event, tpd_A_P((647 - 28)- 36*14), true),
			5 => (A_ipd(2)'last_event, tpd_A_P((647 - 28)- 36*15), true),
			6 => (A_ipd(1)'last_event, tpd_A_P((647 - 28)- 36*16), true),
			7 => (A_ipd(0)'last_event, tpd_A_P((647 - 28)- 36*17), true),
			8 => (B_ipd(7)'last_event, tpd_B_P((647 - 28)- 36*10), true),
			9 => (B_ipd(6)'last_event, tpd_B_P((647 - 28)- 36*11), true),
			10 => (B_ipd(5)'last_event, tpd_B_P((647 - 28)- 36*12), true),
			11 => (B_ipd(4)'last_event, tpd_B_P((647 - 28)- 36*13), true),
			12 => (B_ipd(3)'last_event, tpd_B_P((647 - 28)- 36*14), true),
			13 => (B_ipd(2)'last_event, tpd_B_P((647 - 28)- 36*15), true),
			14 => (B_ipd(1)'last_event, tpd_B_P((647 - 28)- 36*16), true),
			15 => (B_ipd(0)'last_event, tpd_B_P((647 - 28)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(6),
         GlitchData	=> P_GlitchData(6),
         OutSignalName	=> "P(6)",
         OutTemp	=> P_zd(6),
         Paths		=> (
			0 => (A_ipd(6)'last_event, tpd_A_P((647 - 29)- 36*11), true),
			1 => (A_ipd(5)'last_event, tpd_A_P((647 - 29)- 36*12), true),
			2 => (A_ipd(4)'last_event, tpd_A_P((647 - 29)- 36*13), true),
			3 => (A_ipd(3)'last_event, tpd_A_P((647 - 29)- 36*14), true),
			4 => (A_ipd(2)'last_event, tpd_A_P((647 - 29)- 36*15), true),
			5 => (A_ipd(1)'last_event, tpd_A_P((647 - 29)- 36*16), true),
			6 => (A_ipd(0)'last_event, tpd_A_P((647 - 29)- 36*17), true),
			7 => (B_ipd(6)'last_event, tpd_B_P((647 - 29)- 36*11), true),
			8 => (B_ipd(5)'last_event, tpd_B_P((647 - 29)- 36*12), true),
			9 => (B_ipd(4)'last_event, tpd_B_P((647 - 29)- 36*13), true),
			10 => (B_ipd(3)'last_event, tpd_B_P((647 - 29)- 36*14), true),
			11 => (B_ipd(2)'last_event, tpd_B_P((647 - 29)- 36*15), true),
			12 => (B_ipd(1)'last_event, tpd_B_P((647 - 29)- 36*16), true),
			13 => (B_ipd(0)'last_event, tpd_B_P((647 - 29)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(5),
         GlitchData	=> P_GlitchData(5),
         OutSignalName	=> "P(5)",
         OutTemp	=> P_zd(5),
         Paths		=> (
			0 => (A_ipd(5)'last_event, tpd_A_P((647 - 30)- 36*12), true),
			1 => (A_ipd(4)'last_event, tpd_A_P((647 - 30)- 36*13), true),
			2 => (A_ipd(3)'last_event, tpd_A_P((647 - 30)- 36*14), true),
			3 => (A_ipd(2)'last_event, tpd_A_P((647 - 30)- 36*15), true),
			4 => (A_ipd(1)'last_event, tpd_A_P((647 - 30)- 36*16), true),
			5 => (A_ipd(0)'last_event, tpd_A_P((647 - 30)- 36*17), true),
			6 => (B_ipd(5)'last_event, tpd_B_P((647 - 30)- 36*12), true),
			7 => (B_ipd(4)'last_event, tpd_B_P((647 - 30)- 36*13), true),
			8 => (B_ipd(3)'last_event, tpd_B_P((647 - 30)- 36*14), true),
			9 => (B_ipd(2)'last_event, tpd_B_P((647 - 30)- 36*15), true),
			10 => (B_ipd(1)'last_event, tpd_B_P((647 - 30)- 36*16), true),
			11 => (B_ipd(0)'last_event, tpd_B_P((647 - 30)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(4),
         GlitchData	=> P_GlitchData(4),
         OutSignalName	=> "P(4)",
         OutTemp	=> P_zd(4),
         Paths		=> (
			0 => (A_ipd(4)'last_event, tpd_A_P((647 - 31)- 36*13), true),
			1 => (A_ipd(3)'last_event, tpd_A_P((647 - 31)- 36*14), true),
			2 => (A_ipd(2)'last_event, tpd_A_P((647 - 31)- 36*15), true),
			3 => (A_ipd(1)'last_event, tpd_A_P((647 - 31)- 36*16), true),
			4 => (A_ipd(0)'last_event, tpd_A_P((647 - 31)- 36*17), true),
			5 => (B_ipd(4)'last_event, tpd_B_P((647 - 31)- 36*13), true),
			6 => (B_ipd(3)'last_event, tpd_B_P((647 - 31)- 36*14), true),
			7 => (B_ipd(2)'last_event, tpd_B_P((647 - 31)- 36*15), true),
			8 => (B_ipd(1)'last_event, tpd_B_P((647 - 31)- 36*16), true),
			9 => (B_ipd(0)'last_event, tpd_B_P((647 - 31)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(3),
         GlitchData	=> P_GlitchData(3),
         OutSignalName	=> "P(3)",
         OutTemp	=> P_zd(3),
         Paths		=> (
			0 => (A_ipd(3)'last_event, tpd_A_P((647 - 32)- 36*14), true),
			1 => (A_ipd(2)'last_event, tpd_A_P((647 - 32)- 36*15), true),
			2 => (A_ipd(1)'last_event, tpd_A_P((647 - 32)- 36*16), true),
			3 => (A_ipd(0)'last_event, tpd_A_P((647 - 32)- 36*17), true),
			4 => (B_ipd(3)'last_event, tpd_B_P((647 - 32)- 36*14), true),
			5 => (B_ipd(2)'last_event, tpd_B_P((647 - 32)- 36*15), true),
			6 => (B_ipd(1)'last_event, tpd_B_P((647 - 32)- 36*16), true),
			7 => (B_ipd(0)'last_event, tpd_B_P((647 - 32)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(2),
         GlitchData	=> P_GlitchData(2),
         OutSignalName	=> "P(2)",
         OutTemp	=> P_zd(2),
         Paths		=> (
			0 => (A_ipd(2)'last_event, tpd_A_P((647 - 33)- 36*15), true),
			1 => (A_ipd(1)'last_event, tpd_A_P((647 - 33)- 36*16), true),
			2 => (A_ipd(0)'last_event, tpd_A_P((647 - 33)- 36*17), true),
			3 => (B_ipd(2)'last_event, tpd_B_P((647 - 33)- 36*15), true),
			4 => (B_ipd(1)'last_event, tpd_B_P((647 - 33)- 36*16), true),
			5 => (B_ipd(0)'last_event, tpd_B_P((647 - 33)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(1),
         GlitchData	=> P_GlitchData(1),
         OutSignalName	=> "P(1)",
         OutTemp	=> P_zd(1),
         Paths		=> (
			0 => (A_ipd(1)'last_event, tpd_A_P((647 - 34)- 36*16), true),
			1 => (A_ipd(0)'last_event, tpd_A_P((647 - 34)- 36*17), true),
			2 => (B_ipd(1)'last_event, tpd_B_P((647 - 34)- 36*16), true),
			3 => (B_ipd(0)'last_event, tpd_B_P((647 - 34)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(0),
         GlitchData	=> P_GlitchData(0),
         OutSignalName	=> "P(0)",
         OutTemp	=> P_zd(0),
         Paths		=> (
			0 => (A_ipd(0)'last_event, tpd_A_P((647 - 35)- 36*17), true),
			1 => (B_ipd(0)'last_event, tpd_B_P((647 - 35)- 36*17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

    
  end process VITALPathDelay;
end X_MULT18X18_V ;
