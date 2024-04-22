--Atari (Analog) Vector Generator
--This implementation tries to duplicate the functionality, not the hardware.
--It doesn't use the 4-bit vector micro-instruction rom. It's compatible with
--the Tempest AVG, which uses the same micro-instruction ROM.
--ToDo: Make an implementation that does use the ROM so we can adapt it easily to other games.

-- Black Widow arcade hardware implemented in an FPGA
-- (C) 2012 Jeroen Domburg (jeroen AT spritesmods.com)
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity avg is
    Port ( cpu_data_in : out  STD_LOGIC_VECTOR (7 downto 0);
           cpu_data_out : in  STD_LOGIC_VECTOR (7 downto 0);
           cpu_addr : in  STD_LOGIC_VECTOR (13 downto 0);
           cpu_cs_l : in  STD_LOGIC;
           cpu_rw_l : in  STD_LOGIC;
			  vgrst : in STD_LOGIC; 
			  vggo : in STD_LOGIC;
			  halted : out STD_LOGIC;
           xout : out  STD_LOGIC_VECTOR (9 downto 0);
           yout : out  STD_LOGIC_VECTOR (9 downto 0);
           zout : out  STD_LOGIC_VECTOR (7 downto 0);
           rgbout : out  STD_LOGIC_VECTOR (2 downto 0);
		  	  dbg : out std_logic_vector(15 downto 0);
			  clken: in STD_LOGIC;
           clk : in  STD_LOGIC		  
		);
end avg;

-- Opcodes stored as lo-hi in 8bit memory.
--  Opcode                     Hex      Binary
--    Draw relative vector.      0x00     000YYYYY YYYYYYYY IIIXXXXX XXXXXXXX
--    Halt                       0x20     00100000 00000000
--    Draw short relative vector 0x40     010YYYYY IIIXXXXX
--    New color/intensity        0x60     0110URGB IIIIIIII
--    New scale                  0x70     0111USSS SSSSSSSS
--    Center                     0x80     10000000 00000000
--    Jump to subroutine         0xA0     101AAAAA AAAAAAAA
--    Return from subroutine     0xC0     11000000 00000000
--    Jump to new address        0xE0     111AAAAA AAAAAAAA


architecture Behavioral of avg is
	type stackarraytype is array (natural range <>) of std_logic_vector(13 downto 0);
	type statetype is (FETCHINSLO, FETCHINSHI, EXECINS, FETCHOPHI, FETCHOPLO, DRAWVECLONG,
						DRAWVECSHORT, WAITVECDONE, ISHALTED, SETCOLOR, SETSCALE, CENTER,
						PUSHPCFORJUMP, POPPC, JUMP);
	signal pc: STD_LOGIC_VECTOR(13 downto 0);
	signal instruction: STD_LOGIC_VECTOR(15 downto 0);
	signal operand: STD_LOGIC_VECTOR(15 downto 0);
	signal state: statetype;
	signal stack: stackarraytype(3 downto 0);
	signal sp: STD_LOGIC_VECTOR(1 downto 0);
	signal vecram_dout: STD_LOGIC_VECTOR(7 downto 0);
	signal vecram_din: STD_LOGIC_VECTOR(7 downto 0);
	signal vecrom_dout: STD_LOGIC_VECTOR(7 downto 0);
	signal vecram_cs_l: STD_LOGIC;
	signal vecram_rw_l: STD_LOGIC;
	signal memory_din: STD_LOGIC_VECTOR(7 downto 0);
	signal memory_addr: STD_LOGIC_VECTOR(13 downto 0);
--	signal rom_addr: STD_LOGIC_VECTOR(13 downto 0);
	signal vec_scale: STD_LOGIC_VECTOR(12 downto 0);
	signal vec_dx: STD_LOGIC_VECTOR(12 downto 0);
	signal vec_dy: STD_LOGIC_VECTOR(12 downto 0);
	signal vec_zero: STD_LOGIC;
	signal vec_draw: STD_LOGIC;
	signal vec_done: STD_LOGIC;
	signal retryRead: STD_LOGIC;
	signal intensity: STD_LOGIC_VECTOR(7 downto 0);
	signal intens_mod: STD_LOGIC_VECTOR(2 downto 0);
	signal rgb: STD_LOGIC_VECTOR(2 downto 0);
begin

mypgmram : entity work.gen_ram
	generic map( dWidth => 8, aWidth => 11)
	port map(
		clk  => clk,
		we   => (not vecram_rw_l) and (not vecram_cs_l),
		addr => memory_addr(10 downto 0),
		d    => vecram_din,
		q    => vecram_dout
	);
	

myvecrom: entity work.vecrom 
	port map (
		addr		=> memory_addr,
		data		=> vecrom_dout,
		clk		=> clk
	);
	
vectordrawer: entity work.vector_drawer 
	port map (
		clk => clk,
		clk_ena => clken,
		scale => vec_scale,
		rel_x => vec_dx,
		rel_y => vec_dy,
		zero => vec_zero,
		draw => vec_draw,
		done => vec_done,
		xout => xout,
		yout => yout
	);
	
	process (clk) begin
		if clk'event and clk='1' and clken='1' then
			vec_zero<='0';
			vec_draw<='0';
			if vgrst='1' then
				pc<="00000000000000";
				instruction<=x"0000";
				state<=ISHALTED;
				sp<="00";
				rgb<="000";
				intensity<=(others=>'0');
				intens_mod<=(others=>'0');
				vec_dx<=(others=>'0');
				vec_dy<=(others=>'0');
				vec_scale<=(others=>'0');
				vec_zero<='1';
				vec_draw<='0';
			elsif state=EXECINS then
				if instruction(15 downto 13)="000" then --draw relative vector
					state<=FETCHOPLO;
				elsif instruction(15 downto 13)="001" then --halt
					state<=ISHALTED;
				elsif instruction(15 downto 13)="010" then --draw short
					state<=DRAWVECSHORT;
				elsif instruction(15 downto 12)="0110" then --new color
					state<=SETCOLOR;
				elsif instruction(15 downto 12)="0111" then --new scale
					state<=SETSCALE;
				elsif instruction(15 downto 13)="100" then --center
					state<=CENTER;
				elsif instruction(15 downto 13)="101" then --jump to subroutine
					state<=PUSHPCFORJUMP;
				elsif instruction(15 downto 13)="110" then --return from subroutine
					state<=POPPC;
				elsif instruction(15 downto 13)="111" then --jump to address
					state<=JUMP;
				end if;
			elsif state=DRAWVECLONG then
				vec_dy<=instruction(12 downto 0);
				vec_dx<=operand(12 downto 0);
				intens_mod<=operand(15 downto 13);
				vec_draw<='1';
				state<=WAITVECDONE;
			elsif state=DRAWVECSHORT then
				vec_dy(5 downto 1)<=instruction(12 downto 8);
				vec_dy(0)<='0';
				if instruction(12)='0' then
					vec_dy(12 downto 6)<="0000000";
				else
					vec_dy(12 downto 6)<="1111111";
				end if;
				vec_dx(5 downto 1)<=instruction(4 downto 0);
				vec_dx(0)<='0';
				if instruction(4)='0' then
					vec_dx(12 downto 6)<="0000000";
				else
					vec_dx(12 downto 6)<="1111111";
				end if;
				intens_mod<=instruction(7 downto 5);
				vec_draw<='1';
				state<=WAITVECDONE;
			elsif state=WAITVECDONE then
				if vec_done='1' then
					state<=FETCHINSLO;
				end if;
			elsif state=SETCOLOR then
				-- Valid for other arcade machines.
--				intensity<=instruction(7 downto 0);
--				rgb<=instruction(10 downto 8);
				-- Black Widow encodes the Z and color in the lowest 8 bits.
				intensity<=instruction(7 downto 4)&"0000";
				rgb<=instruction(2 downto 0);
				state<=FETCHINSLO;
			elsif state=SETSCALE then
				if instruction(10 downto 8)="000" then
					vec_scale<= '0' &(x"ff"-instruction(7 downto 0))&"0000";
				elsif instruction(10 downto 8)="001" then
					vec_scale<="00"&(x"ff"-instruction(7 downto 0))&"000";
				elsif instruction(10 downto 8)="010" then
					vec_scale<="000"&(x"ff"-instruction(7 downto 0))&"00";
				elsif instruction(10 downto 8)="011" then
					vec_scale<="0000"&(x"ff"-instruction(7 downto 0))&"0";
				elsif instruction(10 downto 8)="100" then
					vec_scale<="00000"&(x"ff"-instruction(7 downto 0));
				elsif instruction(10 downto 8)="101" then
					vec_scale<="00000"&(x"7f"-instruction(7 downto 1));
				elsif instruction(10 downto 8)="110" then
					vec_scale<="00000"&(x"3f"-instruction(7 downto 2));
				elsif instruction(10 downto 8)="111" then
					vec_scale<="00000"&(x"1f"-instruction(7 downto 3));
				end if;
				state<=FETCHINSLO;
			elsif state=CENTER then
				intens_mod<="000"; --blank
				vec_zero<='1';
				state<=WAITVECDONE;
			elsif state=PUSHPCFORJUMP then
				if (sp="00") then stack(0)<=pc; end if;
				if (sp="01") then stack(1)<=pc; end if;
				if (sp="10") then stack(2)<=pc; end if;
				if (sp="11") then stack(3)<=pc; end if;
				sp<=sp+"01";
				state<=JUMP;
			elsif state=JUMP then
				pc(13 downto 1)<=instruction(12 downto 0);
				pc(0)<='0';
				state<=FETCHINSLO;
			elsif state=POPPC then
				if (sp="01") then pc<=stack(0); end if;
				if (sp="10") then pc<=stack(1); end if;
				if (sp="11") then pc<=stack(2); end if;
				if (sp="00") then pc<=stack(3); end if;
				sp<=sp-"01";
				state<=FETCHINSLO;
			elsif state=ISHALTED then
				pc<=(others=>'0');
				if vggo='1' then state<=FETCHINSLO; end if;
				--No idea if the original implementation zeroed the beam and location, but I will.
				--It's easier on the CRT and deflection amps this way.
				rgb<="000";
				vec_zero<='1';
				--...and keep spinning here.
--Memory-accessing things	
			elsif cpu_cs_l='0' then
				retryRead<='1';
			elsif retryRead='1' then
				retryRead<='0';
			elsif state=FETCHINSLO then -- Start of instruction handling cycle.
				instruction(7 downto 0)<=memory_din;
				pc<=pc+"00000000000001";
				state<=FETCHINSHI;
			elsif state=FETCHINSHI then
				instruction(15 downto 8)<=memory_din;
				pc<=pc+"00000000000001";
				state<=EXECINS;
			elsif state=FETCHOPLO then
				operand(7 downto 0)<=memory_din;
				pc<=pc+"00000000000001";
				state<=FETCHOPHI;
			elsif state=FETCHOPHI then
				operand(15 downto 8)<=memory_din;
				pc<=pc+"00000000000001";
				state<=DRAWVECLONG;
			else
				state<=FETCHINSLO;
			end if;
		end if;
	end process;
	
	memory_din<=vecram_dout when memory_addr(13 downto 11)="000" else vecrom_dout;

	process (clk) begin
		if clk'event and clk='1' then
			if cpu_cs_l='0' then
				--Cpu wants to access RAM
				vecram_rw_l<=cpu_rw_l;
				memory_addr<=cpu_addr;
				vecram_din<=cpu_data_out;
				if cpu_addr(13 downto 11)="000" then
					vecram_cs_l<='0';
				else
					vecram_cs_l<='1';
				end if;
				if cpu_addr(13 downto 11)="000" then
					cpu_data_in<=vecram_dout;
				else 
					cpu_data_in<=vecrom_dout;
				end if;
			else
				--AVG has access.
				vecram_rw_l<='1';
				vecram_cs_l<='0';
				memory_addr<=pc;
			end if;
		end if;
	end process;

	dbg(15)<=clk;
	dbg(14)<=clken;
	dbg(13)<='0';
	dbg(12)<=retryRead;
	dbg(11)<=cpu_cs_l;
	dbg(10)<=cpu_rw_l;
	dbg(9)<=vecram_cs_l;
	dbg(8)<=vecram_rw_l;
	dbg(7 downto 4)<=memory_addr(3 downto 0);
	dbg(3 downto 0)<=vecram_din(3 downto 0);

	halted<='1' when state=ISHALTED else '0';
	
	--idiotic scheme for the intensity... thanks to the mame source for this line.
	zout<=intensity when intens_mod="001" else intens_mod&"00000";
	
	rgbout <= rgb;
end Behavioral;

