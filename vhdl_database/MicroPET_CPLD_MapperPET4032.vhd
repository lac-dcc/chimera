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
	   
           RA : out  STD_LOGIC_VECTOR (18 downto 8);    -- mapped FRAM address
	   VA : out std_logic_vector (12 downto 11);    -- separate VRAM address for screen win
	   ffsel: out std_logic;
	   iosel: out std_logic;
	   vramsel: out std_logic;
	   framsel: out std_logic;
	   
	   boot: in std_logic;
	   lowbank: in std_logic_vector(3 downto 0);
	   vidblock: in std_logic_vector(1 downto 0);
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
	signal petrom: std_logic;
	signal petrom9: std_logic;
	signal petromA: std_logic;
	signal petromB: std_logic;
	signal petio: std_logic;
	signal screen: std_logic;
        signal iopeek: std_logic;
        signal scrpeek: std_logic;
        signal boota19: std_logic;
	signal wprot: std_logic;

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
	
	
	-----------------------------------

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
--			if (forceb0= '1') then
--				bankl <= (others => '0');
--			else
				bankl <= D;
--			end if;
		end if;
	end process;
	
	bank <= bankl;
	
	low64k <= '1' when bank = "00000000" else '0';
	
	-- The following are evaluated in bank 0 only, so low64k can be ignored here
	
	petio <= '1' when A(15 downto 8) = x"E8"
		else '0';

	screen <= '1' when A(15 downto 11) = "10000"	-- 2k at $8000
		else '0';
	
	-- the following are only used to determine write protect
	-- of ROM area in the upper half of bank 0
	-- Is evaluated in bank 0 only, so low64k can be ignored here
	petrom <= '1' when A(15) = '1' and			-- upper half
			--(A(14) = '1' or (A(13) ='1' and A(12) ='1'))	-- B-F (leaves 9/A as RAM) 
			A(14) = '1' -- upper 16k
			else '0';
			
	petrom9 <= '1' when A(15 downto 12) = x"9"
			else '0';

	petromA <= '1' when A(15 downto 12) = x"A"
			else '0';

	petromB <= '1' when A(15 downto 12) = x"B"
			else '0';


	-- write should not happen (only evaluated in upper half of bank 0)
	wprot <= '0' when rwb = '1' else			-- read access are ok
			'1' when petrom = '1' and wp_romPET = '1'
				else
			'1' when petrom9 = '1' and wp_rom9 = '1'
				else
			'1' when petromA = '1' and wp_romA = '1'
				else
			'1' when petromB = '1' and wp_romB = '1'
				else
			'0';
			 
	-----------------------------------
	-- addr output
	
	-- banks 2-15
	RA(18 downto 17) <= 
			bank(2 downto 1);			-- just map
	
	-- bank 0/1
	RA(16) <= 
			bank(0);
			
	-- within bank0
	RA(15) <= 	
			A(15);
	
	-- the nice thing is that all mapping happens at A15/A16
	RA(14 downto 11) <= A(14 downto 11);

--	RA(10) <= A(10);
	RA(10) <= '0' when low64k = '1' and screen = '1' else
			A(10);
			
	RA(9 downto 8) <= A(9 downto 8);
	
        VA(11) <= A(11) when screenwin = '0' else
                                A(11) xor vidblock(0);
        VA(12) <= A(12) when screenwin = '0' else
                                A(12) xor vidblock(1);

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
                        boota19;             -- second 512k (or 1st 512k on boot)

	framsel <= '0' when avalid='0' else
			'0' when boota19 = '1' else     -- not in upper half of 1M address space is ROM (4-7 are ignored, only 1M addr space)
			'1' when low64k = '0' else	-- 64k-512k is RAM, i.e. all above 64k besides ROM
			'1' when A(15) = '0' else	-- lower half bank0
                        '0' when screenwin = '1' else   -- not in screen window
                        '0' when wprot = '1' else       -- 8296 write protect - upper half of bank0
--                        '1' when c8296ram = '1' else    -- upper half mapped (except peek through)
			'0' when petio = '1' else	-- not in I/O space
			'1';
	
	iosel <= '0' when avalid='0' else 
			'0' when low64k = '0' else
			'1' when petio ='1' else 
			'0';
			
	ffsel <= '1';	
	
end Behavioral;

