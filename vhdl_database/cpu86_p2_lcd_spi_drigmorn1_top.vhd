-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--  Toplevel : CPU86, 256Byte ROM, 16550 UART, 40K8 SRAM (all blockrams used)--
-------------------------------------------------------------------------------
--  Revision History:                                                        --
--                                                                           --
--  Date:        Revision  Author                                            --
--                                                                           --
--  30 Dec 2007  0.1       H. Tiggeler   First version                       --
--  17 May 2008  0.75      H. Tiggeler   Updated for CPU86 ver0.75           --
--  27 Jun 2008  0.79      H. Tiggeler   Changed UART to Opencores 16750     --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY drigmorn1_top IS
   PORT( 
	sram_addr : out std_logic_vector(20 downto 0);
	sram_data : inout std_logic_vector(7 downto 0);
	sram_ce : out std_logic;
	sram_we : out std_logic;
	sram_oe : out std_logic;
	vramaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	vramdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	spi_cs         : out std_logic;
	spi_clk        : out std_logic;
	spi_mosi       : out std_logic;
	spi_miso       : in  std_logic;
	buttons : in  STD_LOGIC_VECTOR (3 downto 0);
	leds : out  STD_LOGIC_VECTOR (3 downto 0);

      CLOCK_40MHZ : IN     std_logic;
      CTS         : IN     std_logic  := '1';
      PIN3        : IN     std_logic;
      RXD         : IN     std_logic;
      LED1        : OUT    std_logic;
      LED2N       : OUT    std_logic;
      LED3N       : OUT    std_logic;
      PIN4        : OUT    std_logic;
      RTS         : OUT    std_logic;
      TXD         : OUT    std_logic
   );
END drigmorn1_top ;


ARCHITECTURE struct OF drigmorn1_top IS

   -- Architecture declarations
   signal csromn : std_logic;
   signal csesramn : std_logic;
   signal csisramn : std_logic;
   signal csspin : std_logic;
   signal csspi : std_logic;
   signal csbutled : std_logic := '1';

   -- Internal signal declarations
	signal leds_b : STD_LOGIC_VECTOR (3 downto 0);
   signal vramaddr2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
--   signal vrambase : STD_LOGIC_VECTOR(15 DOWNTO 0):=x"4000";
   signal vrambase : STD_LOGIC_VECTOR(15 DOWNTO 0):=x"0000";
   SIGNAL DCDn        : std_logic := '1';
   SIGNAL DSRn        : std_logic := '1';
   SIGNAL RIn         : std_logic := '1';
   SIGNAL abus        : std_logic_vector(19 DOWNTO 0);
   SIGNAL clk         : std_logic;
   SIGNAL cscom1      : std_logic;
   SIGNAL dbus_com1   : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in     : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in_cpu : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_out    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_rom    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_esram    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_spi    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic;
   SIGNAL intr        : std_logic;
   SIGNAL iom         : std_logic;
   SIGNAL nmi         : std_logic;
   SIGNAL por         : std_logic;
   SIGNAL rdn         : std_logic;
   SIGNAL resoutn     : std_logic;
   SIGNAL sel_s       : std_logic_vector(5 DOWNTO 0);
--   SIGNAL sel_s       : std_logic_vector(4 DOWNTO 0);
   SIGNAL wea         : std_logic_VECTOR(0 DOWNTO 0);
   SIGNAL wran        : std_logic;
   SIGNAL wrcom       : std_logic;
   SIGNAL wspi       : std_logic;
   SIGNAL wrn         : std_logic;
   signal rxclk_s	  : std_logic;

BEGIN
	sram_addr <= '0' & abus;
----	sram_data <= dbus_.
--	dbus_esram <= sram_data;
--	sram_data <= (others => 'Z') when rdn='0' else sram_data;
--	sram_ce <= csesramn;
--	sram_we <= wrn;
--	sram_oe <= rdn;
	process(csesramn,wrn,rdn,dbus_out,sram_data)
	begin
		sram_ce <= '1';
		sram_we <= '1';
		sram_oe <= '1';
		sram_data <= (others => 'Z');
		if csesramn='0' then
			sram_ce <= '0';
			if wrn='0' then
				sram_data <= dbus_out;
				sram_we <= '0';
			else
				if rdn='0' then
					dbus_esram <= sram_data;
					sram_oe <= '0';
				end if;
			end if;
		end if;
	end process;

	leds <= leds_b;
	leds_b <= dbus_out(3 downto 0) when (csbutled='0') and (wrn='0') else leds_b;

   -- Architecture concurrent statements
   -- HDL Embedded Text Block 4 mux
   -- dmux 1
   process(sel_s,dbus_com1,dbus_in,dbus_rom,dbus_esram,dbus_spi,buttons)
--   process(sel_s,dbus_com1,dbus_in,dbus_rom,dbus_esram,dbus_spi)
      begin
         case sel_s is
              when "011111" => dbus_in_cpu <= dbus_com1;  -- UART
              when "101111" => dbus_in_cpu <= dbus_rom;   -- BootStrap Loader
              when "110111" => dbus_in_cpu <= dbus_in;    -- Embedded SRAM
              when "111011" => dbus_in_cpu <= dbus_spi;   -- SPI
--              when "111101" => dbus_in_cpu <= dbus_esram; -- External SRAM
              when "111101" => dbus_in_cpu <= sram_data; -- External SRAM
              when "111110" => dbus_in_cpu <= x"0" & buttons; -- butled
              when others => dbus_in_cpu <= dbus_in_cpu;  	-- Embedded SRAM
          end case;
   end process;

   -- HDL Embedded Text Block 7 clogic
   clk <= CLOCK_40MHZ;
   
   wrcom <= not wrn;      
   wea(0)<= not wrn and not csisramn;
	wspi<= not wrn;
   PIN4  <= resoutn; -- For debug only
   
   -- dbus_in_cpu multiplexer
   sel_s <= cscom1 & csromn & csisramn & csspin & csesramn & csbutled;
--   sel_s <= cscom1 & csromn & csisramn & csspin & csesramn;
   
   -- chip_select 
   -- Comport, uart_16550
   -- COM1, 0x3F8-0x3FF
--   cscom1 <= '0' when (abus(15 downto 3)="0000001111111" AND iom='1') else '1';
   cscom1 <= '0' when ((abus(15 downto 4)=X"03F") AND iom='1') else '1';
   
   -- SPI, 0x400-0x407
--   csspin <= '0' when (abus(15 downto 3)="0000010000000" AND iom='1') else '1';
   csspin <= '0' when ((abus(15 downto 4)=X"040") AND iom='1') else '1';
   csspi <= not csspin;
   
   -- BUTLED, 0x500-0x507
   csbutled <= '0' when ((abus(15 downto 4)=X"050") AND iom='1') else '1';
   
   -- Bootstrap ROM 256 bytes 
   -- FFFFF-FF=FFF00
   csromn <= '0' when ((abus(19 downto 8)=X"FFF") AND iom='0') else '1';   

   -- external SRAM
   -- 0xE0000
--   csesramn <= '0' when ((abus(19 downto 16)=X"1") AND iom='0') else '1';	-- 0x10000
   csesramn <= '0' when ((abus(19 downto 16)=X"E") AND iom='0') else '1';		-- 0xE0000
--   csesramn <= '0' when (csromn='1' and csisramn='1' AND iom='0') else '1';
--	csesramn <= not (cscom1 and csromnn and csiramn);
  
   -- internal SRAM
   -- below 0x10000
   csisramn <= '0' when ((abus(19 downto 16)=X"0") AND iom='0') else '1';
   
	spim0: entity work.spi_master
    port map ( clk => clk,
           reset => por,
           cpu_address => abus(2 downto 0),
           cpu_wait => open,
           data_in => dbus_out,
           data_out => dbus_spi,
           enable => csspi,
           req_read => '0',
           req_write => wspi,
           slave_cs => spi_cs,
           slave_clk => spi_clk,
           slave_mosi => spi_mosi,
           slave_miso => spi_miso
    );

   nmi   <= '0';
   intr  <= '0';
   dout  <= '0';
   dout1 <= '0';
   DCDn  <= '0';
   DSRn  <= '0';
   RIn   <= '0';

   por <= NOT(PIN3);

   -- Instance port mappings.
   U_1 : entity work.cpu86
      PORT MAP (
         clk        => clk,
         dbus_in    => dbus_in_cpu,
         intr       => intr,
         nmi        => nmi,
         por        => por,
         abus       => abus,
         cpuerror   => LED1,
         dbus_out   => dbus_out,
         inta       => OPEN,
         iom        => iom,
         rdn        => rdn,
         resoutn    => resoutn,
         wran       => wran,
         wrn        => wrn
      );
--   U_3 : blk_mem_40K
--      PORT MAP (
--         clka  => clk,
--         dina  => dbus_out,
--         addra => abus(15 DOWNTO 0),
--         wea   => wea,
--         douta => dbus_in
--      );
	vramaddr2 <= vramaddr + vrambase;
   U_3 : entity work.blk_mem_40K
      PORT MAP (
         clka  => clk,
         dina  => dbus_out,
         addra => abus(15 DOWNTO 0),
         wea   => wea,
         douta => dbus_in,
         clkb  => clk,
         dinb  => (others => '0'),
         addrb => vramaddr2,
         web   => (others => '0'),
         doutb => vramdata
      );
   U_2 : entity work.bootstrap
      PORT MAP (
         abus => abus(7 DOWNTO 0),
         dbus => dbus_rom
      );
   U_0 : entity work.uart_top
   PORT MAP (
       BR_clk   => rxclk_s,
       CTSn     => CTS,
       DCDn     => DCDn,
       DSRn     => DSRn,
       RIn      => RIn,
       abus     => abus(2 DOWNTO 0),
       clk      => clk,
       csn      => cscom1,
       dbus_in  => dbus_out,
       rdn      => rdn,
       resetn   => resoutn,
       sRX      => RXD,
       wrn      => wrn,
       B_CLK    => rxclk_s,
       DTRn     => OPEN,
       IRQ      => OPEN,
       OUT1n    => led2n,
       OUT2n    => led3n,
       RTSn     => RTS,
       dbus_out => dbus_com1,
       stx      => TXD
    );

END struct;
