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
-- Entity: 	tbufmem
-- File:	tbufmem.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	256-bit trace buffer memory (CPU/AHB)
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.leon3.all;
library techmap;
use techmap.gencomp.all;
library grlib;
use grlib.stdlib.all;

entity tbufmem is
  generic (
    tech   : integer := 0;
    tbuf   : integer := 0; -- trace buf size in kB (0 - no trace buffer)
    dwidth : integer := 32; -- AHB data width
    testen : integer := 0
    );
  port (
    clk : in std_ulogic;
    di  : in tracebuf_in_type;
    do  : out tracebuf_out_type;
    testin : in std_logic_vector(TESTIN_WIDTH-1 downto 0)
    );


end;

architecture rtl of tbufmem is

constant ADDRBITS : integer := 10 + log2(tbuf) - 4;
signal enable : std_logic_vector(1 downto 0);


begin

  enable <= di.enable & di.enable;
  mem32 : for i in 0 to 1 generate  -- basic 128 buffer
    ram0 : syncram64 generic map (tech => tech, abits => addrbits, testen => testen, custombits => memtest_vlen)
      port map ( clk, di.addr(addrbits-1 downto 0), di.data(((i*64)+63) downto (i*64)),
          do.data(((i*64)+63) downto (i*64)), enable ,di.write(i*2+1 downto i*2), testin
                 );
  end generate;
  mem64 : if dwidth > 32 generate -- extra data buffer for 64-bit bus
    ram0 : syncram generic map (tech => tech, abits => addrbits, dbits => 32, testen => testen, custombits => memtest_vlen)
      port map ( clk, di.addr(addrbits-1 downto 0), di.data((128+31) downto 128),
          do.data((128+31) downto 128), di.enable, di.write(7), testin
                 );
  end generate;
  mem128 : if dwidth > 64 generate -- extra data buffer for 128-bit bus
    ram0 : syncram64 generic map (tech => tech, abits => addrbits, testen => testen, custombits => memtest_vlen)
      port map ( clk, di.addr(addrbits-1 downto 0), di.data((128+95) downto (128+32)),
          do.data((128+95) downto (128+32)), enable ,di.write(6 downto 5), testin
                 );
  end generate;

  nomem64 : if dwidth < 64 generate -- no extra data buffer for 64-bit bus
    do.data((128+31) downto 128) <= (others => '0');
  end generate;
  nomem128 : if dwidth < 128 generate -- no extra data buffer for 128-bit bus
    do.data((128+95) downto (128+32)) <= (others => '0');
  end generate;
  do.data(255 downto 224) <= (others => '0');

end;
  

