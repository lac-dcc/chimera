-----------------------------------------------------------------------
-- FPGA MOONCRESTA   H & V COUNTER 
--
-- Version : 2.00
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use. 
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004- 9-22  
-----------------------------------------------------------------------
--  MoonCrest hv_count
--  H_CNT   0 - 255 , 384 - 511  Total 384 count
--  V_CNT   0 - 255 , 504 - 511  Total 264 count
-------------------------------------------------------------------------------------------
-- H_CNT[0], H_CNT[1], H_CNT[2], H_CNT[3], H_CNT[4], H_CNT[5], H_CNT[6], H_CNT[7], H_CNT[8],  
--    1 H       2 H       4 H       8 H      16 H      32 H      64 H     128 H    256 H
-------------------------------------------------------------------------------------------
-- V_CNT[0], V_CNT[1], V_CNT[2], V_CNT[3], V_CNT[4], V_CNT[5], V_CNT[6], V_CNT[7]  
--    1 V       2 V       4 V       8 V      16 V      32 V      64 V     128 V 
-------------------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_HV_COUNT is
	port(
		I_CLK    : in  std_logic;
		I_RSTn   : in  std_logic;
		O_H_CNT  : out std_logic_vector(8 downto 0);
		O_H_SYNC : out std_logic;
		O_H_BL   : out std_logic;
		O_V_BL2n : out std_logic;
		O_V_CNT  : out std_logic_vector(7 downto 0);
		O_V_SYNC : out std_logic;
		O_V_BLn  : out std_logic;
		O_C_BLn  : out std_logic
	);
end;

architecture RTL of MC_HV_COUNT is
	signal H_CNT  : std_logic_vector(8 downto 0) := (others => '0');
	signal V_CNT  : std_logic_vector(8 downto 0) := (others => '0');
	signal H_SYNC : std_logic := '0';
	signal H_BL   : std_logic := '0';
	signal V_BLn  : std_logic := '0';
	signal V_BL2n : std_logic := '0';

begin
---------   H_COUNT   ----------------------------------------   

	process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if (H_CNT = 255) then
				H_CNT <= std_logic_vector(to_unsigned(384, H_CNT'length));
			else
				H_CNT <= H_CNT + 1 ;
			end if;
		end if;
	end process;

	O_H_CNT  <= H_CNT;

---------   H_SYNC     ----------------------------------------

	process(H_CNT(4), H_CNT(8))
	begin
		if (H_CNT(8) = '0') then
			H_SYNC <= '0';
		elsif rising_edge(H_CNT(4)) then
			H_SYNC <= (not H_CNT(6) ) and H_CNT(5);
		end if;
	end process;

	O_H_SYNC <= H_SYNC;

---------   H_BL     ------------------------------------------

	process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if H_CNT = 387 then
				H_BL <= '1';
			elsif H_CNT = 503 then
				H_BL <= '0';
			end if;
		end if;
	end process;

	O_H_BL <= H_BL;

---------   V_COUNT   ----------------------------------------   
	process(H_SYNC, I_RSTn)
	begin
		if (I_RSTn = '0') then
			V_CNT <= (others => '0');
		elsif rising_edge(H_SYNC) then
			if (V_CNT = 255) then
				V_CNT <= std_logic_vector(to_unsigned(504, V_CNT'length));
			else
				V_CNT <= V_CNT + 1 ;
			end if;
		end if;
	end process;

	O_V_CNT  <= V_CNT(7 downto 0);
	O_V_SYNC <= V_CNT(8);

---------   V_BLn    ------------------------------------------

	process(H_SYNC)
	begin
		if rising_edge(H_SYNC) then
			if V_CNT(7 downto 0) = 239 then
				V_BLn <= '0';
			elsif V_CNT(7 downto 0) = 15 then
				V_BLn <= '1';
			end if;
		end if;
	end process;

	process(H_SYNC)
	begin
		if rising_edge(H_SYNC) then
			if V_CNT(7 downto 0) = 239 then
				V_BL2n <= '0';
			elsif V_CNT(7 downto 0) = 16 then
				V_BL2n <= '1';
			end if;
		end if;
	end process;

	O_V_BLn  <= V_BLn;
	O_V_BL2n <= V_BL2n;
	O_C_BLn  <= V_BLn and (not H_CNT(8));

end;
