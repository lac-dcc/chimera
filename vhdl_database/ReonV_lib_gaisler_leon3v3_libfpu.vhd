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
-- Package:     libfpu
-- File:        libfpu.vhd
-- Author:      Jiri Gaisler, Gaisler Research
-- Description: LEON3 FPU interface types and components
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.leon3.all;
library techmap;
use techmap.gencomp.all;

package libfpu is

  type fp_rf_in_type is record
    rd1addr     : std_logic_vector(3 downto 0); -- read address 1
    rd2addr     : std_logic_vector(3 downto 0); -- read address 2
    wraddr      : std_logic_vector(3 downto 0); -- write address
    wrdata      : std_logic_vector(31 downto 0);     -- write data
    ren1        : std_ulogic;                        -- read 1 enable
    ren2        : std_ulogic;                        -- read 2 enable
    wren        : std_ulogic;                        -- write enable
  end record;
 
  type fp_rf_out_type is record
    data1       : std_logic_vector(31 downto 0); -- read data 1
    data2       : std_logic_vector(31 downto 0); -- read data 2
  end record;  

  type fpc_pipeline_control_type is record
    pc    : std_logic_vector(31 downto 0);
    inst  : std_logic_vector(31 downto 0);
    cnt   : std_logic_vector(1 downto 0);
    trap  : std_ulogic;
    annul : std_ulogic;
    pv    : std_ulogic;
  end record;

  constant fpc_pipeline_control_none : fpc_pipeline_control_type :=
    (X"00000000", X"00000000", "00", '0', '0', '0');

  type fpc_debug_in_type is record
    enable : std_ulogic;
    write  : std_ulogic;
    fsr    : std_ulogic;                            -- FSR access
    addr   : std_logic_vector(4 downto 0);
    data   : std_logic_vector(31 downto 0);
  end record;

  constant fpc_debug_in_none : fpc_debug_in_type :=
    ('0', '0', '0', "00000", X"00000000");

  type fpc_debug_out_type is record
    data   : std_logic_vector(31 downto 0);
  end record;  

  constant fpc_debug_none : fpc_debug_out_type := (data => X"00000000"
  );


  type fpc_in_type is record
    flush       : std_ulogic;                     -- pipeline flush
    exack       : std_ulogic;                     -- FP exception acknowledge
    a_rs1       : std_logic_vector(4 downto 0);
    d             : fpc_pipeline_control_type;
    a             : fpc_pipeline_control_type;
    e             : fpc_pipeline_control_type;
    m             : fpc_pipeline_control_type;
    x             : fpc_pipeline_control_type;    
    lddata        : std_logic_vector(31 downto 0);     -- load data
    dbg           : fpc_debug_in_type;               -- debug signals
  end record;

  constant fpc_in_none : fpc_in_type := (
    '0', '0', "00000", fpc_pipeline_control_none,
    fpc_pipeline_control_none, fpc_pipeline_control_none,
    fpc_pipeline_control_none, fpc_pipeline_control_none,
    X"00000000", fpc_debug_in_none
    );

  type fpc_out_type is record
    data          : std_logic_vector(31 downto 0); -- store data
    exc                 : std_logic;                     -- FP exception
    cc            : std_logic_vector(1 downto 0);  -- FP condition codes
    ccv                 : std_ulogic;                    -- FP condition codes valid
    ldlock        : std_logic;                   -- FP pipeline hold
    holdn          : std_ulogic;
    dbg           : fpc_debug_out_type;             -- FP debug signals    
  end record;
  
  constant fpc_out_none : fpc_out_type := (X"00000000", '0', "00", '1', '0', '1',
   fpc_debug_none); 

  component grfpwxsh
  generic (
    tech     : integer range 0 to NTECH := 0;
    pclow    : integer range 0 to 2 := 2;
    dsu      : integer range 0 to 1 := 0;           
    disas    : integer range 0 to 2 := 0;
    id       : integer range 0 to 7 := 0;
    scantest : integer              := 0
    );
  port (
    rst    : in  std_ulogic;                    -- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;                    -- pipeline hold
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type;
    fpui   : out grfpu_in_type;
    fpuo   : in  grfpu_out_type;
    testin : in  std_logic_vector(TESTIN_WIDTH-1 downto 0)
    );
  end component;

end;

