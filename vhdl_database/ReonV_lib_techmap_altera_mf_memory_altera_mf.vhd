------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity: 	various
-- File:	mem_altera_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Memory generators for Altera altsynram
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library altera_mf;
use altera_mf.altsyncram;
-- pragma translate_on

entity altera_syncram_dp is
  generic ( 
    abits : integer := 4; dbits : integer := 32
  );
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic);
end;

architecture behav of altera_syncram_dp is

--  component altsyncram
--  generic (
--    width_a	: natural;
--    width_b	: natural := 1;
--    widthad_a	: natural;
--    widthad_b	: natural := 1);
--  port(
--    address_a	: in std_logic_vector(widthad_a-1 downto 0);
--    address_b	: in std_logic_vector(widthad_b-1 downto 0);
--    clock0	: in std_logic;
--    clock1	: in std_logic;
--    data_a	: in std_logic_vector(width_a-1 downto 0);
--    data_b	: in std_logic_vector(width_b-1 downto 0);
--    q_a		: out std_logic_vector(width_a-1 downto 0);
--    q_b		: out std_logic_vector(width_b-1 downto 0);
--    rden_b	: in std_logic;
--    wren_a	: in std_logic;
--    wren_b	: in std_logic
--    );
--  end component;

  component altsyncram
    generic (
      address_aclr_a  :       string := "UNUSED";
      address_aclr_b  :       string := "NONE";
      address_reg_b   :       string := "CLOCK1";
      byte_size       :       natural := 8;
      byteena_aclr_a  :       string := "UNUSED";
      byteena_aclr_b  :       string := "NONE";
      byteena_reg_b   :       string := "CLOCK1";
      clock_enable_core_a     :       string := "USE_INPUT_CLKEN";
      clock_enable_core_b     :       string := "USE_INPUT_CLKEN";
      clock_enable_input_a    :       string := "NORMAL";
      clock_enable_input_b    :       string := "NORMAL";
      clock_enable_output_a   :       string := "NORMAL";
      clock_enable_output_b   :       string := "NORMAL";
      intended_device_family  :       string := "unused";
      enable_ecc      :       string := "FALSE";
      implement_in_les        :       string := "OFF";
      indata_aclr_a   :       string := "UNUSED";
      indata_aclr_b   :       string := "NONE";
      indata_reg_b    :       string := "CLOCK1";
      init_file       :       string := "UNUSED";
      init_file_layout        :       string := "PORT_A";
      maximum_depth   :       natural := 0;
      numwords_a      :       natural := 0;
      numwords_b      :       natural := 0;
      operation_mode  :       string := "BIDIR_DUAL_PORT";
      outdata_aclr_a  :       string := "NONE";
      outdata_aclr_b  :       string := "NONE";
      outdata_reg_a   :       string := "UNREGISTERED";
      outdata_reg_b   :       string := "UNREGISTERED";
      power_up_uninitialized  :       string := "FALSE";
      ram_block_type  :       string := "AUTO";
      rdcontrol_aclr_b        :       string := "NONE";
      rdcontrol_reg_b :       string := "CLOCK1";
      read_during_write_mode_mixed_ports      :       string := "DONT_CARE";
      read_during_write_mode_port_a   :       string := "NEW_DATA_NO_NBE_READ";
      read_during_write_mode_port_b   :       string := "NEW_DATA_NO_NBE_READ";
      width_a :       natural;
      width_b :       natural := 1;
      width_byteena_a :       natural := 1;
      width_byteena_b :       natural := 1;
      widthad_a       :       natural;
      widthad_b       :       natural := 1;
      wrcontrol_aclr_a        :       string := "UNUSED";
      wrcontrol_aclr_b        :       string := "NONE";
      wrcontrol_wraddress_reg_b    :       string := "CLOCK1";
      lpm_hint        :       string := "UNUSED";
      lpm_type        :       string := "altsyncram"
      );
    port(
      aclr0   :       in std_logic := '0';
      aclr1   :       in std_logic := '0';
      address_a       :       in std_logic_vector(widthad_a-1 downto 0);
      address_b       :       in std_logic_vector(widthad_b-1 downto 0) := (others => '1');
      addressstall_a  :       in std_logic := '0';
      addressstall_b  :       in std_logic := '0';
      byteena_a       :       in std_logic_vector(width_byteena_a-1 downto 0) := (others => '1');
      byteena_b       :       in std_logic_vector(width_byteena_b-1 downto 0) := (others => '1');
      clock0  :       in std_logic := '1';
      clock1  :       in std_logic := '1';
      clocken0        :       in std_logic := '1';
      clocken1        :       in std_logic := '1';
      clocken2        :       in std_logic := '1';
      clocken3        :       in std_logic := '1';
      data_a  :       in std_logic_vector(width_a-1 downto 0) := (others => '1');
      data_b  :       in std_logic_vector(width_b-1 downto 0) := (others => '1');
      eccstatus       :       out std_logic_vector(2 downto 0);
      q_a     :       out std_logic_vector(width_a-1 downto 0);
      q_b     :       out std_logic_vector(width_b-1 downto 0);
      rden_a  :       in std_logic := '1';
      rden_b  :       in std_logic := '1';
      wren_a  :       in std_logic := '0';
      wren_b  :       in std_logic := '0'
      );
  end component;

  signal address_a: std_logic_vector(abits-1 downto 0);
  signal address_b: std_logic_vector(abits-1 downto 0);

begin

  -- Quartus 16.0 altsyncram simulation libraries have some address checking logic
  -- that converts the addresses to integers even when not reading/writing.
  -- To avoid many warnings from the IEEE libraries, we manipulate the address
  -- in simulation to avoid X-address in.
  address_a <= address1
--pragma translate_off
               when (not is_x(address1) or write1='1') else (others => '1')
--pragma translate_on
               ;
  address_b <= address2
--pragma translate_off
               when (not is_x(address2) or write2='1') else (others => '1')
--pragma translate_on
               ;

  u0 : altsyncram 
    generic map (
      WIDTH_A => dbits, WIDTHAD_A => abits,
      WIDTH_B => dbits, WIDTHAD_B => abits)
    port map ( 
      address_a => address_a, address_b => address_b, clock0 => clk1,
      clock1 => clk2, data_a => datain1, data_b => datain2, 
      q_a => dataout1, q_b => dataout2, rden_b => enable2,
      wren_a => write1, wren_b => write2);
end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;

entity altera_syncram is
  generic ( abits : integer := 9; dbits : integer := 32);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (dbits -1 downto 0);
    dataout : out std_logic_vector (dbits -1 downto 0);
    enable  : in std_ulogic;
    write   : in std_ulogic
  );
end;

architecture behav of altera_syncram is
component altera_syncram_dp
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic
   ); 
end component;

signal agnd : std_logic_vector(abits-1 downto 0);
signal dgnd : std_logic_vector(dbits-1 downto 0);
begin
  
 agnd <= (others => '0'); dgnd <= (others => '0');

 u0: altera_syncram_dp
  generic map (abits, dbits)
  port map (
    clk1 => clk, address1 => address, datain1 => datain,
    dataout1 => dataout, enable1 => enable, write1 => write,
    clk2 => clk, address2 => agnd, datain2 => dgnd,
    dataout2 => open, enable2 => agnd(0), write2 => agnd(0));
end;


library ieee;
use ieee.std_logic_1164.all;
library techmap;
library grlib;
use grlib.stdlib.all;
-- pragma translate_off
library altera_mf;
use altera_mf.altsyncram;
-- pragma translate_on

entity altera_syncram128bw is
  generic ( abits : integer := 9);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (127 downto 0);
    dataout : out std_logic_vector (127 downto 0);
    enable  : in  std_logic_vector (15 downto 0);
    write   : in  std_logic_vector (15 downto 0)
  );
end;

architecture behav of altera_syncram128bw is
  component altsyncram
  generic (
    width_a	: natural;
    width_b	: natural := 1;
    widthad_a	: natural;
    widthad_b	: natural := 1;
    byte_size   : integer := 0;
    width_byteena_a : integer := 1
  );
  port(
    address_a	: in std_logic_vector(widthad_a-1 downto 0);
    clock0	: in std_logic;
    clock1	: in std_logic;
    data_a	: in std_logic_vector(width_a-1 downto 0);
    q_a		: out std_logic_vector(width_a-1 downto 0);
    wren_a	: in std_logic;
    byteena_a   : in std_logic_vector( (width_byteena_a - 1) downto 0) := (others => '1')
    );
end component;

signal agnd : std_logic_vector(abits-1 downto 0);
signal dgnd : std_logic_vector(127 downto 0);
signal write1 : std_logic;
signal enablex : std_logic_vector (15 downto 0);

begin
  
 agnd <= (others => '0'); dgnd <= (others => '0');
 write1 <= orv(write and enable);
 enablex <= write when write1 = '1' else enable;

  u0 : altsyncram 
    generic map (
      WIDTH_A => 128, WIDTHAD_A => abits,
      WIDTH_B => 128, WIDTHAD_B => abits, byte_size => 8,
      width_byteena_a => 16 )
    port map ( 
      address_a => address, clock0 => clk, clock1 => clk, 
      data_a => datain, q_a => dataout, wren_a => write1,
      byteena_a => enablex );
end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;
library grlib;
use grlib.stdlib.all;
-- pragma translate_off
library altera_mf;
use altera_mf.altsyncram;
-- pragma translate_on

entity altera_syncram256bw is
  generic ( abits : integer := 9);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (255 downto 0);
    dataout : out std_logic_vector (255 downto 0);
    enable  : in  std_logic_vector (31 downto 0);
    write   : in  std_logic_vector (31 downto 0)
  );
end;

architecture behav of altera_syncram256bw is
  component altsyncram
  generic (
    width_a	: natural;
    width_b	: natural := 1;
    widthad_a	: natural;
    widthad_b	: natural := 1;
    byte_size   : integer := 0;
    width_byteena_a : integer := 1
  );
  port(
    address_a	: in std_logic_vector(widthad_a-1 downto 0);
    clock0	: in std_logic;
    clock1	: in std_logic;
    data_a	: in std_logic_vector(width_a-1 downto 0);
    q_a		: out std_logic_vector(width_a-1 downto 0);
    wren_a	: in std_logic;
    byteena_a   : in std_logic_vector( (width_byteena_a - 1) downto 0) := (others => '1')
    );
end component;

signal agnd : std_logic_vector(abits-1 downto 0);
signal dgnd : std_logic_vector(255 downto 0);
signal write1 : std_logic;
signal enablex : std_logic_vector (31 downto 0);

begin
  
 agnd <= (others => '0'); dgnd <= (others => '0');
 write1 <= orv(write and enable);
 enablex <= write when write1 = '1' else enable;
  u0 : altsyncram 
    generic map (
      WIDTH_A => 256, WIDTHAD_A => abits,
      WIDTH_B => 256, WIDTHAD_B => abits, byte_size => 8,
      width_byteena_a => 32 )
    port map ( 
      address_a => address, clock0 => clk, clock1 => clk, 
      data_a => datain, q_a => dataout, wren_a => write1,
      byteena_a => enablex );
end;

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library altera_mf;
use altera_mf.dcfifo;
-- pragma translate_on

entity altera_fifo_dp is
  generic ( 
    tech  : integer := 0;
    abits : integer := 4;
    dbits : integer := 32
  );
  port (
    rdclk   : in std_logic;
    rdreq   : in std_logic;
    rdfull  : out std_logic;
    rdempty : out std_logic;
    rdusedw : out std_logic_vector(abits-1 downto 0);
    q       : out std_logic_vector(dbits-1 downto 0);
    wrclk   : in std_logic;
    wrreq   : in std_logic;
    wrfull  : out std_logic;
    wrempty : out std_logic;
    wrusedw : out std_logic_vector(abits-1 downto 0);
    data    : in std_logic_vector(dbits-1 downto 0);
    aclr    : in std_logic := '0');
end;

architecture behav of altera_fifo_dp is

  component dcfifo
    generic (
        lpm_width               : natural;
        lpm_widthu              : natural;
        lpm_numwords            : natural;
        lpm_showahead           : string := "OFF";
        lpm_hint                : string := "USE_EAB=ON";
        overflow_checking       : string := "ON";
        underflow_checking      : string := "ON";
        delay_rdusedw           : natural := 1;
        delay_wrusedw           : natural := 1;
        rdsync_delaypipe        : natural := 0;
        wrsync_delaypipe        : natural := 0;
        use_eab                 : string := "ON";
        add_ram_output_register : string := "OFF";
        add_width               : natural := 1;
        clocks_are_synchronized : string := "FALSE";
        ram_block_type          : string := "AUTO";
        add_usedw_msb_bit       : string := "OFF";
        write_aclr_synch        : string := "OFF";
        lpm_type                : string := "dcfifo";
        intended_device_family  : string := "NON_STRATIX" );
    port (
        data    : in std_logic_vector(lpm_width-1 downto 0);
        rdclk   : in std_logic;
        wrclk   : in std_logic;
        wrreq   : in std_logic;
        rdreq   : in std_logic;
        aclr    : in std_logic := '0';
        rdfull  : out std_logic;
        wrfull  : out std_logic;
        wrempty : out std_logic;
        rdempty : out std_logic;
        q       : out std_logic_vector(lpm_width-1 downto 0);
        rdusedw : out std_logic_vector(lpm_widthu-1 downto 0);
        wrusedw : out std_logic_vector(lpm_widthu-1 downto 0) );
  end component;

begin

  u0 : dcfifo
    generic map (
      intended_device_family  => "STRATIX IV",
      lpm_numwords            => 2**abits,
      lpm_showahead           => "OFF",
      lpm_type                => "dcfifo",
      lpm_width               => dbits,
      lpm_widthu              => abits,
      overflow_checking       => "ON",
      rdsync_delaypipe        => 4,
      underflow_checking      => "ON",
      use_eab                 => "ON",
      wrsync_delaypipe        => 4
    )
    port map (
      rdclk   => rdclk,
      rdreq   => rdreq,
      rdfull  => rdfull,
      rdempty => rdempty,
      rdusedw => rdusedw,
      q       => q,
      wrclk   => wrclk,
      wrreq   => wrreq,
      wrfull  => wrfull,
      wrempty => wrempty,
      wrusedw => wrusedw,
      data    => data,
      aclr    => aclr
      );
end;

