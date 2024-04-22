--------------------------------------------------------------------------------
-- Entity:      ahbfile
-- File:        ahbfile.vhd
-- Author:      Martin Aberg - Cobham Gaisler AB
-- Description: File I/O debug communication link, using AHBUART protocol
--------------------------------------------------------------------------------

-- This component is not synthesizable.
-- Tested with GHDL 0.33dev (20141104)
-- A companion file ahbfile_foreign implements file access via functions named
-- ahbfile_init, ahbfile_getbyte and ahbfile_putbyte.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library gaisler;
use gaisler.libdcom.all;
use std.textio.all;

entity ahbfile is
  generic (
    hindex      : integer := 0
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbi    : in  ahb_mst_in_type;
    ahbo    : out ahb_mst_out_type
  );
end;

architecture struct of ahbfile is
  constant REVISION : integer := 1;

  signal dmai   : ahb_dma_in_type;
  signal dmao   : ahb_dma_out_type;
  signal duarti : dcom_uart_in_type;
  signal duarto : dcom_uart_out_type;

  function ahbfile_init return integer is
  begin assert false severity failure; end;

  function ahbfile_getbyte return integer is
  begin assert false severity failure; end;

  function ahbfile_putbyte(value : integer) return integer is
  begin assert false severity failure; end;

  attribute foreign of ahbfile_init     : function is "VHPIDIRECT ahbfile_init";
  attribute foreign of ahbfile_getbyte  : function is "VHPIDIRECT ahbfile_getbyte";
  attribute foreign of ahbfile_putbyte  : function is "VHPIDIRECT ahbfile_putbyte";

begin
  ahbmst0 : ahbmst
    -- devid is something undefined != 0.
    generic map (hindex => hindex, venid => VENDOR_GAISLER, devid => 16#123#)
    port map (rst, clk, dmai, dmao, ahbi, ahbo);

  dcom0 : dcom port map (rst, clk, dmai, dmao, duarti, duarto, ahbi);
  duarto.lock <= '1';

  read_file : process
    variable fd       : integer;
    variable invalue  : integer;
  begin
    duarto.dready <= '0';
    wait until (rising_edge(clk)) and (rst = '1');
    assert -1 /= ahbfile_init severity failure;
    loop
      wait until rising_edge(clk);
      invalue := ahbfile_getbyte;
      if -1 /= invalue then
        duarto.data <= std_logic_vector(to_unsigned(invalue, duarto.data'length));
        duarto.dready <= '1';
        while duarti.read /= '1' loop
          wait until rising_edge(clk);
        end loop;
        duarto.dready <= '0';
      end if;
    end loop;
  end process;

  write_file : process
    variable outvalue : integer;
    variable putret   : integer;
  begin
    duarto.thempty <= '1';
    wait until rising_edge(clk) and duarti.write = '1';
      outvalue := to_integer(unsigned(duarti.data));
      putret := ahbfile_putbyte(outvalue);
  end process;

  bootmsg : report_version
    generic map (
      "ahbfile" & tost(hindex) &
      ": File I/O debug communication link rev " & tost(REVISION)
    );
end;

