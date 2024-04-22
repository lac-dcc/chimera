----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2004 GAISLER RESEARCH
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  See the file COPYING for the full details of the license.
--
-----------------------------------------------------------------------------
-- Package: 	components
-- File:	components.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Component declaration of Micron SDRAM
------------------------------------------------------------------------------

-- pragma translate_off

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

package components is

  component mt48lc16m16a2
    GENERIC (
        -- Timing Parameters for -75 (PC133) and CAS Latency = 2
        tAC       : TIME    :=  6.0 ns;
        tHZ       : TIME    :=  7.0 ns;
        tOH       : TIME    :=  2.7 ns;
        tMRD      : INTEGER :=  2;          -- 2 Clk Cycles
        tRAS      : TIME    := 44.0 ns;
        tRC       : TIME    := 66.0 ns;
        tRCD      : TIME    := 20.0 ns;
        tRP       : TIME    := 20.0 ns;
        tRRD      : TIME    := 15.0 ns;
        tWRa      : TIME    :=  7.5 ns;     -- A2 Version - Auto precharge mode only (1 Clk + 7.5 ns)
        tWRp      : TIME    := 15.0 ns;     -- A2 Version - Precharge mode only (15 ns)

        tAH       : TIME    :=  0.8 ns;
        tAS       : TIME    :=  1.5 ns;
        tCH       : TIME    :=  2.5 ns;
        tCL       : TIME    :=  2.5 ns;
        tCK       : TIME    := 10.0 ns;
        tDH       : TIME    :=  0.8 ns;
        tDS       : TIME    :=  1.5 ns;
        tCKH      : TIME    :=  0.8 ns;
        tCKS      : TIME    :=  1.5 ns;
        tCMH      : TIME    :=  0.8 ns;
        tCMS      : TIME    :=  1.5 ns;

        addr_bits : INTEGER := 13;
        data_bits : INTEGER := 16;
        col_bits  : INTEGER :=  9;
        index     : INTEGER :=  0;
	fname     : string := "ram.srec"	-- File to read from
    );
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0) := (OTHERS => '0');
        Ba    : IN    STD_LOGIC_VECTOR := "00";
        Clk   : IN    STD_LOGIC := '0';
        Cke   : IN    STD_LOGIC := '1';
        Cs_n  : IN    STD_LOGIC := '1';
        Ras_n : IN    STD_LOGIC := '1';
        Cas_n : IN    STD_LOGIC := '1';
        We_n  : IN    STD_LOGIC := '1';
        Dqm   : IN    STD_LOGIC_VECTOR (1 DOWNTO 0) := "00"
    );
  end component;

  component mt46v16m16
    GENERIC (                                   -- Timing for -75Z CL2
        tCK       : TIME    :=  7.500 ns;
        tCH       : TIME    :=  3.375 ns;       -- 0.45*tCK
        tCL       : TIME    :=  3.375 ns;       -- 0.45*tCK
        tDH       : TIME    :=  0.500 ns;
        tDS       : TIME    :=  0.500 ns;
        tIH       : TIME    :=  0.900 ns;
        tIS       : TIME    :=  0.900 ns;
        tMRD      : TIME    := 15.000 ns;
        tRAS      : TIME    := 40.000 ns;
        tRAP      : TIME    := 20.000 ns;
        tRC       : TIME    := 65.000 ns;
        tRFC      : TIME    := 75.000 ns;
        tRCD      : TIME    := 20.000 ns;
        tRP       : TIME    := 20.000 ns;
        tRRD      : TIME    := 15.000 ns;
        tWR       : TIME    := 15.000 ns;
        addr_bits : INTEGER := 13;
        data_bits : INTEGER := 16;
        cols_bits : INTEGER :=  9;
        index     : INTEGER :=  0;
	fname     : string := "ram.srec";	-- File to read from
        bbits     : INTEGER :=  16;
        fdelay    : INTEGER :=  0;
        chktiming : boolean := true
    );
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Dqs   : INOUT STD_LOGIC_VECTOR (1 DOWNTO 0) := "ZZ";
        Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0);
        Ba    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0);
        Clk   : IN    STD_LOGIC;
        Clk_n : IN    STD_LOGIC;
        Cke   : IN    STD_LOGIC;
        Cs_n  : IN    STD_LOGIC;
        Ras_n : IN    STD_LOGIC;
        Cas_n : IN    STD_LOGIC;
        We_n  : IN    STD_LOGIC;
        Dm    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END component;

  component ftmt48lc16m16a2
    GENERIC (
        -- Timing Parameters for -75 (PC133) and CAS Latency = 2
        tAC       : TIME    :=  6.0 ns;
        tHZ       : TIME    :=  7.0 ns;
        tOH       : TIME    :=  2.7 ns;
        tMRD      : INTEGER :=  2;          -- 2 Clk Cycles
        tRAS      : TIME    := 44.0 ns;
        tRC       : TIME    := 66.0 ns;
        tRCD      : TIME    := 20.0 ns;
        tRP       : TIME    := 20.0 ns;
        tRRD      : TIME    := 15.0 ns;
        tWRa      : TIME    :=  7.5 ns;     -- A2 Version - Auto precharge mode only (1 Clk + 7.5 ns)
        tWRp      : TIME    := 15.0 ns;     -- A2 Version - Precharge mode only (15 ns)

        tAH       : TIME    :=  0.8 ns;
        tAS       : TIME    :=  1.5 ns;
        tCH       : TIME    :=  2.5 ns;
        tCL       : TIME    :=  2.5 ns;
        tCK       : TIME    := 10.0 ns;
        tDH       : TIME    :=  0.8 ns;
        tDS       : TIME    :=  1.5 ns;
        tCKH      : TIME    :=  0.8 ns;
        tCKS      : TIME    :=  1.5 ns;
        tCMH      : TIME    :=  0.8 ns;
        tCMS      : TIME    :=  1.5 ns;

        addr_bits : INTEGER := 13;
        data_bits : INTEGER := 16;
        col_bits  : INTEGER :=  9;
        index     : INTEGER :=  0;
	fname     : string := "ram.srec";	-- File to read from
        err       : INTEGER :=  0
    );
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0) := (OTHERS => '0');
        Ba    : IN    STD_LOGIC_VECTOR := "00";
        Clk   : IN    STD_LOGIC := '0';
        Cke   : IN    STD_LOGIC := '1';
        Cs_n  : IN    STD_LOGIC := '1';
        Ras_n : IN    STD_LOGIC := '1';
        Cas_n : IN    STD_LOGIC := '1';
        We_n  : IN    STD_LOGIC := '1';
        Dqm   : IN    STD_LOGIC_VECTOR (1 DOWNTO 0) := "00"
    );
  end component;

  component ddr2 is
  generic(
    DM_BITS : integer := 2;
    ADDR_BITS : integer := 13;
    ROW_BITS : integer := 13;
    COL_BITS : integer := 9;
    DQ_BITS : integer := 16;
    DQS_BITS : integer := 2;
    TRRD : integer := 10000;
    TFAW : integer := 50000;
    DEBUG   : integer := 0
  );
  port (
    ck      : in std_ulogic;
    ck_n    : in std_ulogic;
    cke     : in std_ulogic;
    cs_n    : in std_ulogic;
    ras_n   : in std_ulogic;
    cas_n   : in std_ulogic;
    we_n    : in std_ulogic;
    dm_rdqs : inout std_logic_vector(DQS_BITS-1 downto 0);
    ba      : in std_logic_vector(1 downto 0);
    addr    : in std_logic_vector(ADDR_BITS-1 downto 0);
    dq      : inout std_logic_vector(DQ_BITS-1 downto 0);
    dqs     : inout std_logic_vector(DQS_BITS-1 downto 0);
    dqs_n   : inout std_logic_vector(DQS_BITS-1 downto 0);
    rdqs_n  : out std_logic_vector(DQS_BITS-1 downto 0);
    odt     : in std_ulogic
  );
  end component;

  component mobile_ddr
    --GENERIC (                                   -- Timing for -75Z CL2
    --    tCK       : TIME    :=  7.500 ns;
    --    tCH       : TIME    :=  3.375 ns;       -- 0.45*tCK
    --    tCL       : TIME    :=  3.375 ns;       -- 0.45*tCK
    --    tDH       : TIME    :=  0.500 ns;
    --    tDS       : TIME    :=  0.500 ns;
    --    tIH       : TIME    :=  0.900 ns;
    --    tIS       : TIME    :=  0.900 ns;
    --    tMRD      : TIME    := 15.000 ns;
    --    tRAS      : TIME    := 40.000 ns;
    --    tRAP      : TIME    := 20.000 ns;
    --    tRC       : TIME    := 65.000 ns;
    --    tRFC      : TIME    := 75.000 ns;
    --    tRCD      : TIME    := 20.000 ns;
    --    tRP       : TIME    := 20.000 ns;
    --    tRRD      : TIME    := 15.000 ns;
    --    tWR       : TIME    := 15.000 ns;
    --    addr_bits : INTEGER := 13;
    --    data_bits : INTEGER := 16;
    --    cols_bits : INTEGER :=  9;
    --    index     : INTEGER :=  0;
	  --    fname     : string := "ram.srec";	-- File to read from
    --    bbits     : INTEGER :=  32
    --);
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => 'Z');
        ----Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Dqs   : INOUT STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => 'Z');
        ----Dqs   : INOUT STD_LOGIC_VECTOR (data_bits/8 - 1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (12 DOWNTO 0);
        ----Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0);
        Ba    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0);
        Clk   : IN    STD_LOGIC;
        Clk_n : IN    STD_LOGIC;
        Cke   : IN    STD_LOGIC;
        Cs_n  : IN    STD_LOGIC;
        Ras_n : IN    STD_LOGIC;
        Cas_n : IN    STD_LOGIC;
        We_n  : IN    STD_LOGIC;
        Dm    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0)
        ----Dm    : IN    STD_LOGIC_VECTOR (data_bits/8 - 1 DOWNTO 0)
    );
  END component;

  component mobile_ddr_fe
    generic (addr_swap : integer := 0);
    port (
        Dq    : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => 'Z');
        Dqs   : INOUT STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (12 DOWNTO 0);
        Ba    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0);
        Clk   : IN    STD_LOGIC;
        Clk_n : IN    STD_LOGIC;
        Cke   : IN    STD_LOGIC;
        Cs_n  : IN    STD_LOGIC;
        Ras_n : IN    STD_LOGIC;
        Cas_n : IN    STD_LOGIC;
        We_n  : IN    STD_LOGIC;
        Dm    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0);
        BEaddr: out   std_logic_vector (24 downto 0);
        BEwr  : out   std_logic_vector(1 downto 0);
        BEdin : out   std_logic_vector(15 downto 0);
        BEdout: in    std_logic_vector(15 downto 0);
        BEclear: out  std_logic;
        BEclrpart: out std_logic;
        BEsynco: out std_logic;
        BEsynci: in std_logic
      );
  end component;

  component mobile_ddr_febe
    generic (
      dbits: integer := 32;
      rampad: integer := 0;
      fname: string := "dummy";
      autoload: integer := 1;
      rstmode: integer := 0;
      rstdatah: integer := 16#DEAD#;
      rstdatal: integer := 16#BEEF#;
      addr_swap : integer := 0;
      offset_addr : std_logic_vector(31 downto 0) := x"00000000";
      swap_halfw : integer := 0
      );
    port (
        Dq    : INOUT STD_LOGIC_VECTOR (dbits-1 DOWNTO 0) := (OTHERS => 'Z');
        Dqs   : INOUT STD_LOGIC_VECTOR (dbits/8-1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (12 DOWNTO 0);
        Ba    : IN    STD_LOGIC_VECTOR (1 DOWNTO 0);
        Clk   : IN    STD_LOGIC;
        Clk_n : IN    STD_LOGIC;
        Cke   : IN    STD_LOGIC;
        Cs_n  : IN    STD_LOGIC;
        Ras_n : IN    STD_LOGIC;
        Cas_n : IN    STD_LOGIC;
        We_n  : IN    STD_LOGIC;
        Dm    : IN    STD_LOGIC_VECTOR (dbits/8-1 DOWNTO 0)
      );
  end component;
  
  component mobile_ddr2_fe
    port (
        ck      : in    std_logic;
        ck_n    : in    std_logic;
        cke     : in    std_logic;
        cs_n    : in    std_logic;
        ca      : in    std_logic_vector( 9 downto 0);
        dm      : in    std_logic_vector( 1 downto 0);
        dq      : inout std_logic_vector(15 downto 0) := (OTHERS => 'Z');
        dqs     : inout std_logic_vector( 1 downto 0) := (OTHERS => 'Z');
        dqs_n   : inout std_logic_vector( 1 downto 0) := (OTHERS => 'Z');
        BEaddr  : out   std_logic_vector(27 downto 0);
        BEwr_h  : out   std_logic_vector( 1 downto 0);
        BEwr_l  : out   std_logic_vector( 1 downto 0);
        BEdin_h : out   std_logic_vector(15 downto 0);
        BEdin_l : out   std_logic_vector(15 downto 0);
        BEdout_h: in    std_logic_vector(15 downto 0);
        BEdout_l: in    std_logic_vector(15 downto 0);
        BEclear : out   std_logic;
        BEreload: out   std_logic;
        BEsynco : out   std_logic;
        BEsynci : in    std_logic
      );
  end component;

  component mobile_ddr2_febe
    generic (
      dbits: integer := 32;
      rampad: integer := 0;
      fname: string := "dummy";
      autoload: integer := 1;
      rstmode: integer := 0;
      rstdatah: integer := 16#DEAD#;
      rstdatal: integer := 16#BEEF#
      );
    port (
      ck      : in    std_logic;
      ck_n    : in    std_logic;
      cke     : in    std_logic;
      cs_n    : in    std_logic;
      ca      : in    std_logic_vector(        9 downto 0);
      dm      : in    std_logic_vector(dbits/8-1 downto 0);
      dq      : inout std_logic_vector(  dbits-1 downto 0) := (OTHERS => 'Z');
      dqs     : inout std_logic_vector(dbits/8-1 downto 0) := (OTHERS => 'Z');
      dqs_n   : inout std_logic_vector(dbits/8-1 downto 0) := (OTHERS => 'Z')
      );
  end component;
  
  component mobile_sdr
    --GENERIC (
    --    DEBUG     : INTEGER := 1;
    --    addr_bits : INTEGER := 13;
    --    data_bits : INTEGER := 16
    --);
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (12 DOWNTO 0) := (OTHERS => '0');
        Ba    : IN    STD_LOGIC_VECTOR := "00";
        Clk   : IN    STD_LOGIC := '0';
        Cke   : IN    STD_LOGIC := '1';
        Cs_n  : IN    STD_LOGIC := '1';
        Ras_n : IN    STD_LOGIC := '1';
        Cas_n : IN    STD_LOGIC := '1';
        We_n  : IN    STD_LOGIC := '1';
        Dqm   : IN    STD_LOGIC_VECTOR (1 DOWNTO 0) := "00"
    );
  end component;

end;

-- pragma translate_on

