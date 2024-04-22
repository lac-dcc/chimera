--
-- A simulation model of Pacman hardware
-- Copyright (c) d18c7db (gmail) - May 2013
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--


-- The following comments and source code in the comments are from MAME source code and are
-- included here to help make sense of the logic used in the VHDL address mapper and descrambler
--
--/************************************
-- *
-- *  Ms. Pac-Man
-- *
-- ************************************/
--
--/*
--  Ms. Pac-Man has an auxiliary PCB with ribbon cable that plugs into the Z-80 CPU socket of a Pac-Man main PCB. Also the
--  graphics ROMs at 5E, 5F on the main board are replaced.
--
--  The aux board contains three ROMs (two 2532 at U6, U7 and one 2716 at U5), a Z-80, and four PAL/HAL logic chips.
--
--  The aux board logic decodes the Z-80 address and determines whether to enable the main board ROMs (containing Pac-Man
--  code) or the aux board ROMs (containing Ms. Pac-Man code). Normally the Pac-Man ROMs reside at address 0x0000-0x3fff
--  and are mirrored at 0x8000-0xbfff (Z-80 A15 is not used in Pac-Man). The aux board logic modifies the address map and
--  enables the aux board ROMs for addresses 0x3000-0x3fff and 0x8000-0x97ff. Furthermore there are forty 8-byte "patch"
--  regions which reside in the 0x0000-0x2fff address range. Any access to these patch addresses will disable the Pac-Man
--  ROMs and enable the aux board ROM. Aux board ROM addresses 0x8000-0x81ef are mapped onto the patch regions. These
--  patches typically insert jumps to new code above 0x8000.
--
--  The aux board logic also acts as a software protection circuit which inhibits dumping of the ROMs (e.g., using a
--  microprocessor emulator system). There are several "trap" address regions which enable and disable the decode
--  functions. In order to properly operate as Ms. Pac-Man you must access one of the "latch set" trap addresses. This
--  enables the decode. If a "latch clear" address is accessed then decode is disabled and all you get is Pac-Man. For
--  more info see U.S. Patent 4,525,599 "Software protection methods and apparatus".
--
--  The trap regions are 8 bytes in length starting on the following addresses:
--
--  latch clear, decode disable
--    0x0038
--    0x03b0
--    0x1600
--    0x2120
--    0x3ff0
--    0x8000
--    0x97f0
--
--  latch set, decode enable
--    0x3ff8
--
--  Any memory access will trigger the trap behavior: instruction fetch, data read, data write. The latch clear addresses
--  should never be accessed during normal Ms. Pac-Man operation, so when the circuitry detects an access it clears the
--  latch and prevents any further dumping of the aux board ROMs.
--
--  The Pac-Man self-test code does a checksum of the ROM 0x0000-0x2fff. This works because the checksum routine walks the
--  ROM starting from the low address and hits the latch clear trap at 0x0038 prior to encountering any of the patch
--  regions. The decode stays disabled for the rest of the checksum routine, and thus the checksum is calculated for the
--  Pac-Man ROMs with no patches applied.
--
--  During normal operation every VBLANK (60.6Hz) interrupt will fetch its interrupt vector from the 0x3ff8 trap region, so
--  the latch is continually being enabled.
--
--  In a further attempt to thwart copying, the aux board ROMs have a simple encryption scheme: their address and data
--  lines are bit flipped (i.e., wired in a nonstandard fashion). The specific bit flips were selected to minimize the
--  vias required to lay out the aux PCB.
--*/

--
--static void mspacman_install_patches(UINT8 *ROM)
--{
--	int i;
--
--	/* copy forty 8-byte patches into Pac-Man code */
--	for (i = 0; i < 8; i++)
--	{
--		ROM[0x0410+i] = ROM[0x8008+i];
--		ROM[0x08E0+i] = ROM[0x81D8+i];
--		ROM[0x0A30+i] = ROM[0x8118+i];
--		ROM[0x0BD0+i] = ROM[0x80D8+i];
--		ROM[0x0C20+i] = ROM[0x8120+i];
--		ROM[0x0E58+i] = ROM[0x8168+i];
--		ROM[0x0EA8+i] = ROM[0x8198+i];
--
--		ROM[0x1000+i] = ROM[0x8020+i];
--		ROM[0x1008+i] = ROM[0x8010+i];
--		ROM[0x1288+i] = ROM[0x8098+i];
--		ROM[0x1348+i] = ROM[0x8048+i];
--		ROM[0x1688+i] = ROM[0x8088+i];
--		ROM[0x16B0+i] = ROM[0x8188+i];
--		ROM[0x16D8+i] = ROM[0x80C8+i];
--		ROM[0x16F8+i] = ROM[0x81C8+i];
--		ROM[0x19A8+i] = ROM[0x80A8+i];
--		ROM[0x19B8+i] = ROM[0x81A8+i];
--
--		ROM[0x2060+i] = ROM[0x8148+i];
--		ROM[0x2108+i] = ROM[0x8018+i];
--		ROM[0x21A0+i] = ROM[0x81A0+i];
--		ROM[0x2298+i] = ROM[0x80A0+i];
--		ROM[0x23E0+i] = ROM[0x80E8+i];
--		ROM[0x2418+i] = ROM[0x8000+i];
--		ROM[0x2448+i] = ROM[0x8058+i];
--		ROM[0x2470+i] = ROM[0x8140+i];
--		ROM[0x2488+i] = ROM[0x8080+i];
--		ROM[0x24B0+i] = ROM[0x8180+i];
--		ROM[0x24D8+i] = ROM[0x80C0+i];
--		ROM[0x24F8+i] = ROM[0x81C0+i];
--		ROM[0x2748+i] = ROM[0x8050+i];
--		ROM[0x2780+i] = ROM[0x8090+i];
--		ROM[0x27B8+i] = ROM[0x8190+i];
--		ROM[0x2800+i] = ROM[0x8028+i];
--		ROM[0x2B20+i] = ROM[0x8100+i];
--		ROM[0x2B30+i] = ROM[0x8110+i];
--		ROM[0x2BF0+i] = ROM[0x81D0+i];
--		ROM[0x2CC0+i] = ROM[0x80D0+i];
--		ROM[0x2CD8+i] = ROM[0x80E0+i];
--		ROM[0x2CF0+i] = ROM[0x81E0+i];
--		ROM[0x2D60+i] = ROM[0x8160+i];
--	}
--}
--
--DRIVER_INIT_MEMBER(pacman_state,mspacman)
--{
--	int i;
--	UINT8 *ROM, *DROM;
--
--	/* CPU ROMs */
--
--	/* Pac-Man code is in low bank */
--	ROM = machine().root_device().memregion("maincpu")->base();
--
--	/* decrypted Ms. Pac-Man code is in high bank */
--	DROM = &machine().root_device().memregion("maincpu")->base()[0x10000];
--
--	/* copy ROMs into decrypted bank */
--	for (i = 0; i < 0x1000; i++)
--	{
--		DROM[0x0000+i] = ROM[0x0000+i];	/* pacman.6e */
--		DROM[0x1000+i] = ROM[0x1000+i];	/* pacman.6f */
--		DROM[0x2000+i] = ROM[0x2000+i];	/* pacman.6h */
--		DROM[0x3000+i] = BITSWAP8(ROM[0xb000+BITSWAP16(i,15,14,13,12,11,3,7,9,10,8,6,5,4,2,1,0)],0,4,5,7,6,3,2,1);	/* decrypt u7 */
--	}
--	for (i = 0; i < 0x800; i++)
--	{
--		DROM[0x8000+i] = BITSWAP8(ROM[0x8000+BITSWAP16(i,15,14,13,12,11,8,7,5,9,10,6,3,4,2,1,0)],0,4,5,7,6,3,2,1);	/* decrypt u5 */
--		DROM[0x8800+i] = BITSWAP8(ROM[0x9800+BITSWAP16(i,15,14,13,12,11,3,7,9,10,8,6,5,4,2,1,0)],0,4,5,7,6,3,2,1);	/* decrypt half of u6 */
--		DROM[0x9000+i] = BITSWAP8(ROM[0x9000+BITSWAP16(i,15,14,13,12,11,3,7,9,10,8,6,5,4,2,1,0)],0,4,5,7,6,3,2,1);	/* decrypt half of u6 */
--//                                                   15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
--		DROM[0x9800+i] = ROM[0x1800+i];		/* mirror of pacman.6f high */
--	}
--	for (i = 0; i < 0x1000; i++)
--	{
--		DROM[0xa000+i] = ROM[0x2000+i];		/* mirror of pacman.6h */
--		DROM[0xb000+i] = ROM[0x3000+i];		/* mirror of pacman.6j */
--	}
--	/* install patches into decrypted bank */
--	mspacman_install_patches(DROM);
--
--	/* mirror Pac-Man ROMs into upper addresses of normal bank */
--	for (i = 0; i < 0x1000; i++)
--	{
--		ROM[0x8000+i] = ROM[0x0000+i];
--		ROM[0x9000+i] = ROM[0x1000+i];
--		ROM[0xa000+i] = ROM[0x2000+i];
--		ROM[0xb000+i] = ROM[0x3000+i];
--	}
--
--	/* initialize the banks */
--	machine().root_device().membank("bank1")->configure_entries(0, 2, &ROM[0x00000], 0x10000);
--	machine().root_device().membank("bank1")->set_entry(1);
--}
--
--ROM_START( puckmana )
--	ROM_REGION( 0x10000, "maincpu", 0 )
--	ROM_LOAD( "pacman.6e",    0x0000, 0x1000, CRC(c1e6ab10) SHA1(e87e059c5be45753f7e9f33dff851f16d6751181) )
--	ROM_LOAD( "pacman.6f",    0x1000, 0x1000, CRC(1a6fb2d4) SHA1(674d3a7f00d8be5e38b1fdc208ebef5a92d38329) )
--	ROM_LOAD( "pacman.6h",    0x2000, 0x1000, CRC(bcdd1beb) SHA1(8e47e8c2c4d6117d174cdac150392042d3e0a881) )
--	ROM_LOAD( "prg7",         0x3000, 0x0800, CRC(b6289b26) SHA1(d249fa9cdde774d5fee7258147cd25fa3f4dc2b3) )
--	ROM_LOAD( "prg8",         0x3800, 0x0800, CRC(17a88c13) SHA1(eb462de79f49b7aa8adb0cc6d31535b10550c0ce) )
--
--ROM_START( mspacman )
--	ROM_REGION( 0x20000, "maincpu", 0 )	/* 64k for code+64k for decrypted code */
--	ROM_LOAD( "pacman.6e",    0x0000, 0x1000, CRC(c1e6ab10) SHA1(e87e059c5be45753f7e9f33dff851f16d6751181) )
--	ROM_LOAD( "pacman.6f",    0x1000, 0x1000, CRC(1a6fb2d4) SHA1(674d3a7f00d8be5e38b1fdc208ebef5a92d38329) )
--	ROM_LOAD( "pacman.6h",    0x2000, 0x1000, CRC(bcdd1beb) SHA1(8e47e8c2c4d6117d174cdac150392042d3e0a881) )
--	ROM_LOAD( "pacman.6j",    0x3000, 0x1000, CRC(817d94e3) SHA1(d4a70d56bb01d27d094d73db8667ffb00ca69cb9) )
--
--	ROM_LOAD( "u5",           0x8000, 0x0800, CRC(f45fbbcd) SHA1(b26cc1c8ee18e9b1daa97956d2159b954703a0ec) )
--	ROM_LOAD( "u6",           0x9000, 0x1000, CRC(a90e7000) SHA1(e4df96f1db753533f7d770aa62ae1973349ea4cf) )
--	ROM_LOAD( "u7",           0xb000, 0x1000, CRC(c82cd714) SHA1(1d8ac7ad03db2dc4c8c18ade466e12032673f874) )
--
--
--Normally the Pac-Man ROMs reside at address 0x0000-0x3fff and are mirrored at 0x8000-0xbfff (Z-80 A15 is not used in Pac-Man).
--The aux board logic modifies the address map and enables the aux board ROMs for addresses 0x3000-0x3fff and 0x8000-0x97ff.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity rom_descrambler is
	port (
		CLK      : in  std_logic;
		
		MRTNT    : in  std_logic := '0'; -- set to 1 when using Mr TNT ROMs, 0 otherwise
		MSPACMAN : in  std_logic := '0'; -- set to 1 when using Ms Pacman ROMs, 0 otherwise
		PLUS     : in  std_logic := '0';
		JMPST    : in  std_logic := '0';
		EEEK     : in  std_logic := '0';
		GLOB     : in  std_logic := '0';

		dcnt     : in  std_logic_vector(1 downto 0);
		cpu_m1_l : in  std_logic;
		addr     : in  std_logic_vector(15 downto 0);
		data     : out std_logic_vector( 7 downto 0);

		dn_addr  : in  std_logic_vector(15 downto 0);
		dn_data  : in  std_logic_vector(7 downto 0);
		dn_wr    : in  std_logic
	);

end rom_descrambler;

architecture rtl of rom_descrambler is
	signal overlay_on   : std_logic := '0';
	signal rom_patched  : std_logic_vector(15 downto 0);
	signal rom_addr     : std_logic_vector(15 downto 0);
	signal rom_lo       : std_logic_vector( 7 downto 0);
	signal rom_hi       : std_logic_vector( 7 downto 0);
	signal rom_data_in  : std_logic_vector( 7 downto 0);
	signal rom_data_out : std_logic_vector( 7 downto 0);
	signal rom0_cs,rom1_cs  : std_logic;

	type mtd_t is array(0 to 31) of std_logic_vector(3 downto 0);
	signal picktbl: mtd_t := (
		X"0",X"2",X"4",X"2",X"4",X"0",X"4",X"2",X"2",X"0",X"2",X"2",X"4",X"0",X"4",X"2",
		X"2",X"2",X"4",X"0",X"4",X"2",X"4",X"0",X"0",X"4",X"0",X"4",X"4",X"2",X"4",X"2"
	);

	signal picktbl2: mtd_t := (
		X"0",X"2",X"4",X"4",X"4",X"2",X"0",X"2",X"2",X"0",X"2",X"4",X"4",X"2",X"0",X"2",
		X"5",X"3",X"5",X"1",X"5",X"3",X"5",X"3",X"1",X"5",X"1",X"5",X"5",X"3",X"5",X"3"
	);
	
	signal r                : std_logic_vector(7 downto 0);
	signal r2               : std_logic_vector(7 downto 0);
	signal r3               : std_logic_vector(7 downto 0);
	signal mtd_addr         : std_logic_vector(4 downto 0);
	signal method           : std_logic_vector(3 downto 0);
begin

	rom0_cs <= '1' when dn_addr(15 downto 14) = "00" else '0';
	rom1_cs <= '1' when dn_addr(15 downto 14) = "01" else '0';

	u_program_rom0 : work.dpram generic map (14,8)
	port map
	(
		clk_a_i   => clk,
		en_a_i    => '1',
		we_i      => dn_wr and rom0_cs,
		addr_a_i  => dn_addr(13 downto 0),
		data_a_i  => dn_data,
	
		clk_b_i   => clk,
		addr_b_i  => rom_addr(13 downto 0),
		data_b_o  => rom_lo
   );

	u_program_rom1 : work.dpram generic map (14,8)
	port map
	(
		clk_a_i   => clk,
		en_a_i    => '1',
		we_i      => dn_wr and rom1_cs,
		addr_a_i  => dn_addr(13 downto 0),
		data_a_i  => dn_data,
	
		clk_b_i   => clk,
		addr_b_i  => rom_addr(13 downto 0),
		data_b_o  => rom_hi
   );

--  The trap regions are 8 bytes in length starting on the following addresses:
--
--  latch clear, decode disable
--    0x0038
--    0x03b0
--    0x1600
--    0x2120
--    0x3ff0
--    0x8000
--    0x97f0
--
--  latch set, decode enable
--    0x3ff8
	p_overlay : process
		variable trap_addr : std_logic_vector(15 downto 0);
	begin
		wait until rising_edge(CLK);
		trap_addr := addr(15 downto 3) & "000";
		if	trap_addr = x"3ff8" then
			overlay_on <= '1';    
		elsif                    
			trap_addr = x"0038" or
			trap_addr = x"03b0" or
			trap_addr = x"1600" or
			trap_addr = x"2120" or
			trap_addr = x"3ff0" or
			trap_addr = x"8000" or
			trap_addr = x"97f0"
		then
			overlay_on <= '0';
		end if;
	end process;

	mtd_addr <= addr(9) & addr(7) & addr(5) & addr(2) & addr(0);
	method <= picktbl2(to_integer(unsigned(mtd_addr))) xor ("000" & addr(11)) when JMPST = '1' else
				  picktbl(to_integer(unsigned(mtd_addr))) xor ("000" & addr(11));



	r <= (rom_lo(7)&rom_lo(6)&rom_lo(5)&rom_lo(4)&rom_lo(3)&rom_lo(2)&rom_lo(1)&rom_lo(0)) xor X"28" when method = X"1" and PLUS = '1' else
		  (rom_lo(6)&rom_lo(1)&rom_lo(3)&rom_lo(2)&rom_lo(5)&rom_lo(7)&rom_lo(0)&rom_lo(4)) xor X"96" when method = X"2" and PLUS = '1' else
		  (rom_lo(6)&rom_lo(1)&rom_lo(5)&rom_lo(2)&rom_lo(3)&rom_lo(7)&rom_lo(0)&rom_lo(4)) xor X"be" when method = X"3" and PLUS = '1' else
		  (rom_lo(0)&rom_lo(3)&rom_lo(7)&rom_lo(6)&rom_lo(4)&rom_lo(2)&rom_lo(1)&rom_lo(5)) xor X"d5" when method = X"4" and PLUS = '1' else
		  (rom_lo(0)&rom_lo(3)&rom_lo(4)&rom_lo(6)&rom_lo(7)&rom_lo(2)&rom_lo(1)&rom_lo(5)) xor X"dd" when method = X"5" and PLUS = '1' else

		  (rom_lo(7)&rom_lo(6)&rom_lo(3)&rom_lo(4)&rom_lo(5)&rom_lo(2)&rom_lo(1)&rom_lo(0)) xor X"20" when method = X"1" and JMPST = '1' else
		  (rom_lo(5)&rom_lo(0)&rom_lo(4)&rom_lo(3)&rom_lo(7)&rom_lo(1)&rom_lo(2)&rom_lo(6)) xor X"a4" when method = X"2" and JMPST = '1' else
		  (rom_lo(5)&rom_lo(0)&rom_lo(4)&rom_lo(3)&rom_lo(7)&rom_lo(1)&rom_lo(2)&rom_lo(6)) xor X"8c" when method = X"3" and JMPST = '1' else
		  (rom_lo(2)&rom_lo(3)&rom_lo(1)&rom_lo(7)&rom_lo(4)&rom_lo(6)&rom_lo(0)&rom_lo(5)) xor X"6e" when method = X"4" and JMPST = '1' else
		  (rom_lo(2)&rom_lo(3)&rom_lo(4)&rom_lo(7)&rom_lo(1)&rom_lo(6)&rom_lo(0)&rom_lo(5)) xor X"4e" when method = X"5" and JMPST = '1' else
	  
		  (rom_lo(7)&rom_lo(6)&rom_lo(5)&rom_lo(4)&rom_lo(3)&rom_lo(2)&rom_lo(1)&rom_lo(0)) xor X"00";
		  
   r2 <= not rom_lo(7) & not rom_lo(6) &     rom_lo(1) & not rom_lo(3) & not rom_lo(0) & not rom_lo(4) & not rom_lo(2) & not rom_lo(5) when dcnt = "00" else
         not rom_lo(7) & not rom_lo(1) & not rom_lo(4) & not rom_lo(3) & not rom_lo(0) &     rom_lo(6) & not rom_lo(2) & not rom_lo(5) when dcnt = "01" else
             rom_lo(7) & not rom_lo(6) &     rom_lo(1) & not rom_lo(0) &     rom_lo(3) & not rom_lo(4) & not rom_lo(2) & not rom_lo(5) when dcnt = "10" else
             rom_lo(7) & not rom_lo(1) & not rom_lo(4) & not rom_lo(0) &     rom_lo(3) &     rom_lo(6) & not rom_lo(2) & not rom_lo(5);

   r3 <= not rom_lo(3) & not rom_lo(7) &     rom_lo(0) & not rom_lo(6) & not rom_lo(4) &     rom_lo(1) & not rom_lo(2) & not rom_lo(5) when dcnt = "00" else
         not rom_lo(1) & not rom_lo(7) &     rom_lo(0) &     rom_lo(3) & not rom_lo(4) & not rom_lo(6) & not rom_lo(2) & not rom_lo(5) when dcnt = "01" else
         not rom_lo(3) & not rom_lo(0) & not rom_lo(4) & not rom_lo(6) &     rom_lo(7) &     rom_lo(1) & not rom_lo(2) & not rom_lo(5) when dcnt = "10" else
         not rom_lo(1) & not rom_lo(0) & not rom_lo(4) &     rom_lo(3) &     rom_lo(7) & not rom_lo(6) & not rom_lo(2) & not rom_lo(5);

	p_decoder_comb : process(clk, rom_addr, addr, rom_data_in, rom_data_out, rom_patched, rom_hi, r, overlay_on, MRTNT, MSPACMAN, EEEK, r2, GLOB, r3)
		variable patch_addr : std_logic_vector(15 downto 0);
	begin
		rom_addr    <= addr;
		rom_patched <= addr;
		data        <= rom_data_out;

		-- default is unscrambled data
		rom_data_out <= rom_data_in ;

		-- mux ROMs to same data bus
		-- ignore A15 so that Pacman ROMs 0000-3FFF mirror in high mem at 8000-BFFF
		if rom_addr(15) = '0' then
			if EEEK = '1' then
				rom_data_in <= r2;
			elsif GLOB = '1' then
				rom_data_in <= r3;
			else
				rom_data_in <= r;
			end if;
		else
			rom_data_in <= rom_hi;
		end if;

		--	Mr TNT program ROMs have data lines D3 and D5 swapped
		--	Mr TNT  video  ROMs have data lines D4 and D6 and address lines A0 and A2 swapped
		if MRTNT = '1' then
			rom_data_out <= rom_data_in(7 downto 6) & rom_data_in(3) & rom_data_in(4) & rom_data_in(5) & rom_data_in(2 downto 0);
		end if;

		if MSPACMAN = '1' and overlay_on = '1' then
			--	forty 8-byte patches into Pac-Man code
			-- If the CPU address presented falls in a patch range, substitute it with patched address
			-- OH THE HUMANITY!!!
			patch_addr := addr(15 downto 3) & "000";
			case patch_addr is
				when x"0410" => rom_patched <= x"800" & '1' & addr(2 downto 0); --	ROM[0x0410+i] = ROM[0x8008+i]
				when x"08E0" => rom_patched <= x"81D" & '1' & addr(2 downto 0); --	ROM[0x08E0+i] = ROM[0x81D8+i]
				when x"0A30" => rom_patched <= x"811" & '1' & addr(2 downto 0); --	ROM[0x0A30+i] = ROM[0x8118+i]
				when x"0BD0" => rom_patched <= x"80D" & '1' & addr(2 downto 0); --	ROM[0x0BD0+i] = ROM[0x80D8+i]
				when x"0C20" => rom_patched <= x"812" & '0' & addr(2 downto 0); --	ROM[0x0C20+i] = ROM[0x8120+i]
				when x"0E58" => rom_patched <= x"816" & '1' & addr(2 downto 0); --	ROM[0x0E58+i] = ROM[0x8168+i]
				when x"0EA8" => rom_patched <= x"819" & '1' & addr(2 downto 0); --	ROM[0x0EA8+i] = ROM[0x8198+i]
						    										 		                                                     
				when x"1000" => rom_patched <= x"802" & '0' & addr(2 downto 0); --	ROM[0x1000+i] = ROM[0x8020+i]
				when x"1008" => rom_patched <= x"801" & '0' & addr(2 downto 0); --	ROM[0x1008+i] = ROM[0x8010+i]
				when x"1288" => rom_patched <= x"809" & '1' & addr(2 downto 0); --	ROM[0x1288+i] = ROM[0x8098+i]
				when x"1348" => rom_patched <= x"804" & '1' & addr(2 downto 0); --	ROM[0x1348+i] = ROM[0x8048+i]
				when x"1688" => rom_patched <= x"808" & '1' & addr(2 downto 0); --	ROM[0x1688+i] = ROM[0x8088+i]
				when x"16B0" => rom_patched <= x"818" & '1' & addr(2 downto 0); --	ROM[0x16B0+i] = ROM[0x8188+i]
				when x"16D8" => rom_patched <= x"80C" & '1' & addr(2 downto 0); --	ROM[0x16D8+i] = ROM[0x80C8+i]
				when x"16F8" => rom_patched <= x"81C" & '1' & addr(2 downto 0); --	ROM[0x16F8+i] = ROM[0x81C8+i]
				when x"19A8" => rom_patched <= x"80A" & '1' & addr(2 downto 0); --	ROM[0x19A8+i] = ROM[0x80A8+i]
				when x"19B8" => rom_patched <= x"81A" & '1' & addr(2 downto 0); --	ROM[0x19B8+i] = ROM[0x81A8+i]
						    										 		                                                     
				when x"2060" => rom_patched <= x"814" & '1' & addr(2 downto 0); --	ROM[0x2060+i] = ROM[0x8148+i]
				when x"2108" => rom_patched <= x"801" & '1' & addr(2 downto 0); --	ROM[0x2108+i] = ROM[0x8018+i]
				when x"21A0" => rom_patched <= x"81A" & '0' & addr(2 downto 0); --	ROM[0x21A0+i] = ROM[0x81A0+i]
				when x"2298" => rom_patched <= x"80A" & '0' & addr(2 downto 0); --	ROM[0x2298+i] = ROM[0x80A0+i]
				when x"23E0" => rom_patched <= x"80E" & '1' & addr(2 downto 0); --	ROM[0x23E0+i] = ROM[0x80E8+i]
				when x"2418" => rom_patched <= x"800" & '0' & addr(2 downto 0); --	ROM[0x2418+i] = ROM[0x8000+i]
				when x"2448" => rom_patched <= x"805" & '1' & addr(2 downto 0); --	ROM[0x2448+i] = ROM[0x8058+i]
				when x"2470" => rom_patched <= x"814" & '0' & addr(2 downto 0); --	ROM[0x2470+i] = ROM[0x8140+i]
				when x"2488" => rom_patched <= x"808" & '0' & addr(2 downto 0); --	ROM[0x2488+i] = ROM[0x8080+i]
				when x"24B0" => rom_patched <= x"818" & '0' & addr(2 downto 0); --	ROM[0x24B0+i] = ROM[0x8180+i]
				when x"24D8" => rom_patched <= x"80C" & '0' & addr(2 downto 0); --	ROM[0x24D8+i] = ROM[0x80C0+i]
				when x"24F8" => rom_patched <= x"81C" & '0' & addr(2 downto 0); --	ROM[0x24F8+i] = ROM[0x81C0+i]
				when x"2748" => rom_patched <= x"805" & '0' & addr(2 downto 0); --	ROM[0x2748+i] = ROM[0x8050+i]
				when x"2780" => rom_patched <= x"809" & '0' & addr(2 downto 0); --	ROM[0x2780+i] = ROM[0x8090+i]
				when x"27B8" => rom_patched <= x"819" & '0' & addr(2 downto 0); --	ROM[0x27B8+i] = ROM[0x8190+i]
				when x"2800" => rom_patched <= x"802" & '1' & addr(2 downto 0); --	ROM[0x2800+i] = ROM[0x8028+i]
				when x"2B20" => rom_patched <= x"810" & '0' & addr(2 downto 0); --	ROM[0x2B20+i] = ROM[0x8100+i]
				when x"2B30" => rom_patched <= x"811" & '0' & addr(2 downto 0); --	ROM[0x2B30+i] = ROM[0x8110+i]
				when x"2BF0" => rom_patched <= x"81D" & '0' & addr(2 downto 0); --	ROM[0x2BF0+i] = ROM[0x81D0+i]
				when x"2CC0" => rom_patched <= x"80D" & '0' & addr(2 downto 0); --	ROM[0x2CC0+i] = ROM[0x80D0+i]
				when x"2CD8" => rom_patched <= x"80E" & '0' & addr(2 downto 0); --	ROM[0x2CD8+i] = ROM[0x80E0+i]
				when x"2CF0" => rom_patched <= x"81E" & '0' & addr(2 downto 0); --	ROM[0x2CF0+i] = ROM[0x81E0+i]
				when x"2D60" => rom_patched <= x"816" & '0' & addr(2 downto 0); --	ROM[0x2D60+i] = ROM[0x8160+i]
				when others => rom_patched <= addr;
			end case;

-- Pacman ROMs
--		0x0000-0x0FFF = 0x0000-0x0FFF;	/* pacman.6e */
--		0x1000-0x1FFF = 0x1000-0x1FFF;	/* pacman.6f */
--		0x2000-0x2FFF = 0x2000-0x2FFF;	/* pacman.6h */
--		0x3000-0x3FFF = 0x3000-0x3FFF;	/* pacman.6j */

-- ROM mirror (easy just ignore A15)
--		0x8000-0x8FFF = 0x0000-0x0FFF;	/* mirror of pacman.6e */
--		0x9000-0x9FFF = 0x1000-0x1FFF;	/* mirror of pacman.6f */
--		0xA000-0xAFFF = 0x2000-0x2FFF;	/* mirror of pacman.6h */
--		0xB000-0xBFFF = 0x3000-0x3FFF;	/* mirror of pacman.6j */

-- Ms Pacman overlays

-- no xlate
--		0x8000-0x87FF = 0x8000-0x87FF (physical ROM hi 0000-07FF);	/* decrypt u5 */
--		0x9000-0x97FF = 0x9000-0x97FF (physical ROM hi 1000-17FF);	/* decrypt half of u6 */

-- xlate addr
--		0x3000-0x3FFF = 0xB000-0xBFFF (physical ROM hi 2000-2FFF);	/* decrypt u7 */

-- xlate addr
--		0x8800-0x8FFF = 0x9800-0x9FFF (physical ROM hi 1800-1FFF);	/* decrypt half of u6 */

-- ROM hi mem map
-- u5  2K 0000-07FF (0x8000-0x87FF)
-- u5  2K 0800-0FFF N/A
-- u6b 2K 1000-17FF (0x9000-0x97FF)
-- u6t 2K 1800-1FFF (0x8800-0x8FFF)
-- u7  4K 2000-2FFF (0x3000-0x3FFF)

			-- If the new patched address falls in certain Ms Pacman ranges, swap in ROM overlays and descramble address and data
			-- high address bits are not scrambled so we know for sure this only accesses ROM hi after address translation
			case rom_patched(15 downto 11) is

				-- addr = 0x3000-0x37FF, xlate to 0xB000-0xB7FF (physical ROM hi 2000-27FF), decrypt half of u7
				when "00110" =>
					rom_addr     <= x"2" & rom_patched(11) & rom_patched(3) & rom_patched(7) & rom_patched(9) & rom_patched(10) & rom_patched(8) & rom_patched(6 downto 4) & rom_patched(2 downto 0);
					rom_data_out <= rom_hi(0) & rom_hi(4) & rom_hi(5) & rom_hi(7 downto 6) & rom_hi(3 downto 1);

				-- addr = 0x3800-0x3FFF, xlate to 0xB800-0xBFFF (physical ROM hi 2800-2FFF), decrypt half of u7
				when "00111" =>
					rom_addr     <= x"2" & rom_patched(11) & rom_patched(3) & rom_patched(7) & rom_patched(9) & rom_patched(10) & rom_patched(8) & rom_patched(6 downto 4) & rom_patched(2 downto 0);
					rom_data_out <= rom_hi(0) & rom_hi(4) & rom_hi(5) & rom_hi(7 downto 6) & rom_hi(3 downto 1);

				-- addr = 0x8000-0x87FF, no xlate (physical ROM hi 0000-07FF), decrypt u5
				when "10000" =>
					rom_addr     <= x"0" & rom_patched(11) & rom_patched(8)  & rom_patched(7) & rom_patched(5) & rom_patched(9) & rom_patched(10) & rom_patched(6) & rom_patched(3) & rom_patched(4) & rom_patched(2 downto 0);
					rom_data_out <= rom_hi(0) & rom_hi(4) & rom_hi(5) & rom_hi(7 downto 6) & rom_hi(3 downto 1);

				-- addr = 0x8800-0x8FFF, xlate to 0x9800-0x9FFF (physical ROM hi 1800-1FFF), decrypt half of u6
				when "10001" =>
					rom_addr     <= x"1" & rom_patched(11) & rom_patched(3) & rom_patched(7) & rom_patched(9) & rom_patched(10) & rom_patched(8) & rom_patched(6 downto 4) & rom_patched(2 downto 0);
					rom_data_out <= rom_hi(0) & rom_hi(4) & rom_hi(5) & rom_hi(7 downto 6) & rom_hi(3 downto 1);

				-- addr = 0x9000-0x97FF, no xlate (physical ROM hi 1000-17FF), decrypt half of u6
				when "10010" =>
					rom_addr     <= x"1" & rom_patched(11) & rom_patched(3) & rom_patched(7) & rom_patched(9) & rom_patched(10) & rom_patched(8) & rom_patched(6 downto 4) & rom_patched(2 downto 0);
					rom_data_out <= rom_hi(0) & rom_hi(4) & rom_hi(5) & rom_hi(7 downto 6) & rom_hi(3 downto 1);

				-- catch all default action
				when others => null;
					rom_addr     <= rom_patched;
					rom_data_out <= rom_data_in;
			end case;
		end if;
	end process;

end rtl;
