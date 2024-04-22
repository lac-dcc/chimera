----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:36 06/20/2020 
-- Design Name: 
-- Module Name:    Mapper - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mapper is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 8);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
	   reset : in std_logic;
	   phi2: in std_logic;
	   vpa: in std_logic;
	   vda: in std_logic;
	   vpb: in std_logic;
	   rwb : in std_logic;
	   
	   qclk: in std_logic;
	   
           cfgld : in  STD_LOGIC;	-- set when loading the cfg
	   
	   -- mapped address lines
           RA : out std_logic_vector (18 downto 8);	-- mapped FRAM address
	   VA : out std_logic_vector (13 downto 11);	-- separate VRAM address for screen win
	   ffsel: out std_logic;
	   iosel: out std_logic;
	   vramsel: out std_logic;
	   framsel: out std_logic;
	   
	   boot: in std_logic;
	   lowbank: in std_logic_vector(3 downto 0);
	   vidblock: in std_logic_vector(2 downto 0);
   	   wp_rom9: in std_logic;
   	   wp_romA: in std_logic;
	   wp_romB: in std_logic;
	   wp_romPET: in std_logic;

	   -- force bank0 (used in emulation mode)
	   forceb0: in std_logic;
	   -- is screen in bank0?
	   screenb0: in std_logic;
	   
	   dbgout: out std_logic
	);
end Mapper;

architecture Behavioral of Mapper is

	signal cfg_mp: std_logic_vector(7 downto 0);
	signal bankl: std_logic_vector(7 downto 0);
	
	-- convenience
	signal low64k: std_logic;
	signal low32k: std_logic;
	signal c8296ram: std_logic;
	signal petrom: std_logic;
	signal petrom9: std_logic;
	signal petromA: std_logic;
	signal petromB: std_logic;
	signal petio: std_logic;
	signal wprot: std_logic;
	signal screen: std_logic;
	signal iopeek: std_logic;
	signal scrpeek: std_logic;
	signal boota19: std_logic;
	signal avalid: std_logic;
	signal screenwin: std_logic;
	
	signal bank: std_logic_vector(7 downto 0);
	
	function To_Std_Logic(L: BOOLEAN) return std_ulogic is
	begin
		if L then
			return('1');
		else
			return('0');
		end if;
	end function To_Std_Logic;
	
begin

	
	avalid <= vda or vpa;
		
	-----------------------------------------------------------------------
	-- CPU address space analysis
	--

	-- note: simply latching D at rising phi2 does not work,
	-- as in the logical part after the latch, the changing D already
	-- bleeds through, before the result is switched back when bankl is in effect.
	-- Therefore we sample D at half-qclk before the transition of phi2.
	-- This may lead to speed limits in faster designs, but works here.
	BankLatch: process(reset, D, phi2, qclk)
	begin
		if (reset ='1') then
			bankl <= (others => '0');
		elsif (rising_edge(qclk) and phi2='0') then
			if (forceb0 = '1') then
				bankl <= (others => '0');
			else
				bankl <= D;
			end if;
		end if;
	end process;
	
	bank <= bankl;
	
	low64k <= '1' when bank = "00000000" else '0';
	low32k <= '1' when low64k = '1' and A(15) = '0' else '0';
	
	petio <= '1' when A(15 downto 8) = x"E8"
		else '0';
	
	-- the following are only used to determine write protect
	-- of ROM area in the upper half of bank 0
	-- Is evaluated in bank 0 only, so low64k can be ignored here
	petrom <= '1' when A(15) = '1' and			-- upper half
			A(14) = '1' -- upper 16k
			else '0';
			
	petrom9 <= '1' when A(15 downto 12) = x"9"
			else '0';

	petromA <= '1' when A(15 downto 12) = x"A"
			else '0';

	petromB <= '1' when A(15 downto 12) = x"B"
			else '0';

	screen <= '1' when A(15 downto 12) = x"8" 
			else '0';

	-- 8296 specifics. *peek allow using the IO and screen memory windows despite mapping RAM
	
	iopeek <= '1' when petio = '1' and cfg_mp(6)='1' else '0';
			 
	scrpeek <= '1' when screen = '1' and cfg_mp(5)='1' else '0';

	-- when c8296 is set, upper 16k of bank0 are mapped to RAM (with holes on *peek)
	-- evaluated in bank0 only, so low64k ignored here
	c8296ram <= '1' when cfg_mp(7) = '1'
				and iopeek = '0' 
				and scrpeek = '0'
				else '0';

	-- write should not happen (only evaluated in upper half of bank 0)
	wprot <= '0' when rwb = '1' else			-- read access are ok
			'0' when cfg_mp(7) = '1' and		-- ignore I/O window
				petio = '1' and iopeek = '1' 
				else
			'1' when cfg_mp(7) = '1' and		-- 8296 enabled
				((A(14)='1' and cfg_mp(1)='1')	-- upper 16k write protected
				or (A(14)='0' and cfg_mp(0)='1')) -- lower 16k write protected
				else 
			'0' when cfg_mp(7) = '1' 		-- 8296 RAM but no wp
				else
			'1' when (petrom = '1' and wp_romPET = '1')
				or (petrom9 = '1' and wp_rom9 = '1')
				or (petromA = '1' and wp_romA = '1')
				or (petromB = '1' and wp_romB = '1')
				else
			'0';
			 
	-----------------------------------------------------------------------
	-- physical address space generation
	--
	
	-- banks 2-15
	RA(18 downto 17) <= 
			lowbank(3 downto 2) when low32k = '1' else
			bank(2 downto 1);			-- just map
	
	-- bank 0/1
	RA(16) <= 
			lowbank(1) when low32k = '1' else
			bank(0) when low64k = '0' else  	-- CPU is not in low 64k
			'1' 	when c8296ram = '1' 		-- 8296 enabled,
					and A(15) = '1' 	-- upper half of bank0
					else  			 
			'0';
			
	-- within bank0
	RA(15) <= A(15) when low64k = '0' else		-- some upper bank
			lowbank(0) when A(15) = '0' else-- lower half of bank0
			'1' when c8296ram = '0' else	-- upper half of bank0, no 8296 mapping
			cfg_mp(3) when A(14) = '1' else	-- 8296 map block $c000-$ffff -> $1c000-1ffff / 14000-17fff
			cfg_mp(2);			-- 8296 map block $8000-$bfff -> $18000-1bfff / 10000-13fff

	-- map 1:1
	RA(14 downto 8) <= A(14 downto 8);
	
	VA(13) <= A(13) when screenwin = '0' else
				vidblock(2);
	VA(12) <= A(12) when screenwin = '0' else
				vidblock(1);
	VA(11) <= A(11) when screenwin = '0' else
				A(11) xor vidblock(0);
				
	boota19 <= bank(3) xor boot;
	
	
	-- VRAM is second 512k of CPU, plus 4k read/write-window on $008000 ($088000 in VRAM) if screenb0 is set
	screenwin <= '1' when low64k = '1'
				and screen = '1'
				and screenb0 = '1'
				-- either 8296 off, or screen peek through
				and (cfg_mp(7) = '0' or cfg_mp(5) = '1')
			else '0';
				
	vramsel <= '0' when avalid = '0' else
			'1' when screenwin = '1' else
			boota19;			-- second 512k (or 1st 512k on boot)

	framsel <= '0' when avalid='0' else
			'0' when boota19 = '1' else	-- not in upper half of 1M address space is ROM (4-7 are ignored, only 1M addr space)
			'1' when low64k = '0' 		-- 64k-512k is RAM, i.e. all above 64k besides ROM
				or A(15) = '0' else	-- lower half bank0
			'0' when screenwin = '1' 	-- not in screen window
				or wprot = '1' else	-- 8296 write protect - upper half of bank0
			'1' when c8296ram = '1' else	-- upper half mapped (except peek through)
			'0' when petio = '1' else	-- not in I/O space
			'1';
	
	iosel <= '1' when avalid='1'  
				and low64k = '1' 
				and c8296ram = '0' 	-- no peekthrough in 8296 mode
				and petio ='1' else 
			'0';
			
	ffsel <= '0' when avalid='0' else
			'1' when low64k ='1' 
				and A(15 downto 8) = x"FF" else 
			'0';

	-----------------------------------
	-- cfg
	
	CfgMP: process(reset, phi2, rwb, cfgld, D)
	begin
		if (reset ='1') then
			cfg_mp <= (others => '0');
		elsif (falling_edge(phi2)) then
			if (cfgld = '1' and rwb = '0') then
				cfg_mp <= D;
			end if;
		end if;
	end process;
	
	
end Behavioral;

