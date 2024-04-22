-------------------------------------------------------------------------------
-- FPGA MOONCRESTA COLOR-PALETTE
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
-- 2004- 9-18 added Xilinx Device.  K.Degawa
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
--  use ieee.numeric_std.all;

--library UNISIM;
--  use UNISIM.Vcomponents.all;

entity MC_COL_PAL is
port (
	I_CLK_12M    : in  std_logic;
	I_CLK_6M     : in  std_logic;
	I_VID        : in  std_logic_vector(1 downto 0);
	I_COL        : in  std_logic_vector(2 downto 0);
	I_C_BLnX     : in  std_logic;
	I_H_BLnX     : in  std_logic;

	I_DL_ADDR    : in  std_logic_vector(15 downto 0);
	I_DL_DATA    : in  std_logic_vector(7 downto 0);
	I_DL_WR      : in  std_logic;

	O_C_BLXn     : out std_logic;
	O_H_BLXn     : out std_logic;
	O_STARS_OFFn : out std_logic;
	O_R          : out std_logic_vector(2 downto 0);
	O_G          : out std_logic_vector(2 downto 0);
	O_B          : out std_logic_vector(2 downto 0)
);
end;

architecture RTL of MC_COL_PAL is
	---    Parts 6M    --------------------------------------------------------
	signal W_COL_ROM_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal W_6M_DI      : std_logic_vector(6 downto 0) := (others => '0');
	signal W_6M_DO      : std_logic_vector(6 downto 0) := (others => '0');
	signal W_6M_CLR     : std_logic := '0';
	signal W_6M_HBL     : std_logic := '0';
	signal W_6M_HBLCLR  : std_logic := '0';

	signal W_COL_ROM_WR : std_logic := '0';

begin
	W_6M_DI      <= I_COL(2 downto 0) & I_VID(1 downto 0) & not (I_VID(0) or I_VID(1)) & I_C_BLnX;
	W_6M_CLR     <= W_6M_DI(0) or W_6M_DO(0);
	O_C_BLXn     <= W_6M_DI(0) or W_6M_DO(0);
	O_STARS_OFFn <= W_6M_DO(1);

	W_6M_HBLCLR  <= I_H_BLnX or W_6M_HBL;
	O_H_BLXn     <= I_H_BLnX or W_6M_HBL;

--always@(posedge I_CLK_6M or negedge W_6M_CLR)
	process(I_CLK_6M, W_6M_CLR)
	begin
		if (W_6M_CLR = '0') then
			W_6M_DO <= (others => '0');
		elsif rising_edge(I_CLK_6M) then
			W_6M_DO <= W_6M_DI;
		end if;
	end process;

	process(I_CLK_6M, W_6M_HBLCLR)
	begin
		if (W_6M_HBLCLR = '0') then
			W_6M_HBL <= '0';
		elsif rising_edge(I_CLK_6M) then
			W_6M_HBL <= I_H_BLnX;
		end if;
	end process;

--	clut : entity work.ROM_6L
--	port map (
--		CLK  => I_CLK_12M,
--		ADDR => W_6M_DO(6 downto 2),
--		DATA => W_COL_ROM_DO
--	);

	clut : work.dpram generic map (5,8)
	port map
	(
		clock_a   => I_CLK_12M,
		wren_a    => W_COL_ROM_WR,
		address_a => I_DL_ADDR(4 downto 0),
		data_a    => I_DL_DATA,

		clock_b   => I_CLK_12M,
		address_b => W_6M_DO(6 downto 2),
		q_b       => W_COL_ROM_DO
	);
        W_COL_ROM_WR <= '1' when I_DL_WR = '1' and I_DL_ADDR(15 downto 5) = X"60"&"000" else '0'; -- 6000-601F

	---    VID OUT     --------------------------------------------------------
	O_R <= W_COL_ROM_DO(2 downto 0);
	O_G <= W_COL_ROM_DO(5 downto 3);
	O_B <= W_COL_ROM_DO(7 downto 6) & "0";

end;
