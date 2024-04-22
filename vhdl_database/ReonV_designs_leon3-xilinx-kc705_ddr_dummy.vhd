----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2012 Aeroflex Gaisler
----------------------------------------------------------------------------
-- Package: ddr_dummy
-- File:ddr_dummy.vhd
-- Author:Fredrik Ringhage - Gaisler Research
-- Description: Xilinx MIG wrapper
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
-- pragma translate_off
library unisim;
use unisim.IBUF;
-- pragma translate_on

library work;

entity ddr_dummy is
  generic (
    USE_MIG_INTERFACE_MODEL : boolean := false;
    nCS_PER_RANK     : integer := 1;      -- # of unique CS outputs per rank
    BANK_WIDTH       : integer := 3;      -- # of bank address
    CKE_WIDTH        : integer := 1;      -- # of clock enable outputs
    CS_WIDTH         : integer := 1;      -- # of chip select
    DM_WIDTH         : integer := 8;      -- # of data mask
    DQ_WIDTH         : integer := 64;     -- # of data bits
    DQS_WIDTH        : integer := 8;      -- # of strobe pairs
    ODT_WIDTH        : integer := 1;      -- # of ODT outputs
    ROW_WIDTH        : integer := 14      -- # of row/column address
  );
  port (
    ddr_ck_p        : out   std_logic_vector(0 downto 0);
    ddr_ck_n        : out   std_logic_vector(0 downto 0);
    ddr_addr        : out   std_logic_vector(ROW_WIDTH-1  downto 0);
    ddr_ba          : out   std_logic_vector(BANK_WIDTH-1 downto 0);
    ddr_cas_n       : out   std_logic;
    ddr_cke         : out   std_logic_vector(CKE_WIDTH-1 downto 0);
    ddr_cs_n        : out   std_logic_vector(CS_WIDTH*nCS_PER_RANK-1 downto 0);
    ddr_dm          : out   std_logic_vector(DM_WIDTH-1 downto 0);
    ddr_odt         : out   std_logic_vector(ODT_WIDTH-1 downto 0);
    ddr_ras_n       : out   std_logic;
    ddr_we_n        : out   std_logic;
    ddr_reset_n     : out   std_logic;
    ddr_dq          : inout std_logic_vector(DQ_WIDTH-1  downto 0);
    ddr_dqs         : inout std_logic_vector(DQS_WIDTH-1 downto 0);
    ddr_dqs_n       : inout std_logic_vector(DQS_WIDTH-1 downto 0)
   );
end;

architecture rtl of ddr_dummy is

  component OBUF generic (IOSTANDARD  : string := "SSTL15");
    port (O : out std_ulogic; I : in std_ulogic);
  end component;

  component IOBUF generic (IOSTANDARD  : string := "SSTL15_T_DCI");
    port (O : out std_ulogic; IO : inout std_logic; I, T : in std_ulogic);
  end component;

 component OBUFDS generic(IOSTANDARD : string := "DIFF_SSTL15");
    port(O : out std_ulogic; OB : out std_ulogic; I : in std_ulogic);
end component;

  component IOBUFDS generic (IOSTANDARD  : string := "DIFF_SSTL15");
    port (O : out std_ulogic; IO, IOB : inout std_logic; I, T : in std_ulogic);
  end component;

   signal in_dq  : std_logic_vector(DQ_WIDTH-1 downto 0);
   signal in_dqs : std_logic_vector(DQS_WIDTH-1 downto 0);

begin

    io_cas : OBUF generic map (IOSTANDARD => "SSTL15")
                  port map (O => ddr_cas_n, I => '0');

    io_ras : OBUF generic map (IOSTANDARD => "SSTL15")
                  port map (O => ddr_ras_n, I => '0');

    io_we : OBUF generic map (IOSTANDARD => "SSTL15")
                  port map (O => ddr_we_n, I => '0');

    io_ck : OBUFDS generic map (IOSTANDARD  => "DIFF_SSTL15")
      port map (O => ddr_ck_p(0), OB => ddr_ck_n(0), I => '0');

    io_addr_gen : for i in 0 to ROW_WIDTH-1 generate
    begin
      io_addr : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_addr(i), I => '0');
    end generate io_addr_gen;

    io_ba_gen : for i in 0 to BANK_WIDTH-1 generate
    begin
      io_addr : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_ba(i), I => '0');
    end generate io_ba_gen;

    io_cs_gen : for i in 0 to CS_WIDTH*nCS_PER_RANK-1 generate
    begin
      io_cs : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_cs_n(i), I => '0');
    end generate io_cs_gen;

    io_odt_gen : for i in 0 to ODT_WIDTH-1 generate
    begin
      io_odt : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_odt(i), I => '0');
    end generate io_odt_gen;

    io_dm_gen : for i in 0 to DM_WIDTH-1 generate
    begin
      io_dm : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_dm(i), I => '0');
    end generate io_dm_gen;

    io_cke_gen : for i in 0 to CKE_WIDTH-1 generate
    begin
      io_cke : OBUF generic map (IOSTANDARD => "SSTL15")
                    port map (O => ddr_cke(i), I => '0');
    end generate io_cke_gen;

   op_reset : OBUF generic map (IOSTANDARD => "LVCMOS15")
                   port map (O => ddr_reset_n, I => '1');

    io_dq_gen : for i in 0 to DQ_WIDTH-1 generate
    begin
      io_dq : IOBUF generic map (IOSTANDARD => "SSTL15_T_DCI")
                    port map (O => in_dq(i), IO => ddr_dq(i), I => '0', T => '0');
    end generate io_dq_gen;

    io_dqs_gen : for i in 0 to DQS_WIDTH-1 generate
    begin
       io_dqs : IOBUFDS generic map (IOSTANDARD  => "DIFF_SSTL15_T_DCI")
                        port map (O => in_dqs(i), IO => ddr_dqs(i), IOB => ddr_dqs_n(i), I => '0', T => '1');
    end generate io_dqs_gen;

end architecture rtl;
