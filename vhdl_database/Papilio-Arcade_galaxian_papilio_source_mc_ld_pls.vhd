-------------------------------------------------------------------------------
-- FPGA MOONCRESTA VIDEO-LD_PLS_GEN
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
-- 2004- 9-22 The problem where missile sometimes didn't come out was fixed.
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_LD_PLS is
	port (
		I_CLK_6M     : in  std_logic;
		I_H_CNT      : in  std_logic_vector(8 downto 0);
		I_3D_DI      : in  std_logic;

		O_LDn        : out std_logic;
		O_CNTRLDn    : out std_logic;
		O_CNTRCLRn   : out std_logic;
		O_COLLn      : out std_logic;
		O_VPLn       : out std_logic;
		O_OBJDATALn  : out std_logic;
		O_MLDn       : out std_logic;
		O_SLDn       : out std_logic
	);
end;

architecture RTL of MC_LD_PLS is
	signal W_4C1_Q  : std_logic_vector(3 downto 0) := (others => '0');
	signal W_4C2_Q  : std_logic_vector(3 downto 0) := (others => '0');
	signal W_4C1_Q3 : std_logic := '0';
	signal W_4C2_B  : std_logic := '0';
	signal W_4D1_G  : std_logic := '0';
	signal W_4D1_Q  : std_logic_vector(3 downto 0) := (others => '0');
	signal W_4D2_Q  : std_logic_vector(3 downto 0) := (others => '0');
	signal W_5C_Q   : std_logic := '0';
	signal W_HCNT   : std_logic := '0';
begin
	O_LDn       <= W_4D1_G;
	O_CNTRLDn   <= W_4D1_Q(2);
	O_CNTRCLRn  <= W_4D1_Q(0);
	O_COLLn     <= W_4D2_Q(2);
	O_VPLn      <= W_4D2_Q(0);
	O_OBJDATALn <= W_4C1_Q(2);
	O_MLDn      <= W_4C2_Q(0);
	O_SLDn      <= W_4C2_Q(1);
	W_4D1_G     <= not (I_H_CNT(0) and I_H_CNT(1) and I_H_CNT(2));
	W_HCNT      <= not (I_H_CNT(6) and I_H_CNT(5) and I_H_CNT(4) and I_H_CNT(3));
	--    Parts 4D
	u_4d1 : entity work.LOGIC_74XX139
	port map(
		I_G      => W_4D1_G,
		I_Sel(1) => I_H_CNT(8),
		I_Sel(0) => I_H_CNT(3),
		O_Q      =>W_4D1_Q
	);

	u_4d2 : entity work.LOGIC_74XX139
	port map(
		I_G      => W_5C_Q,
		I_Sel(1) => I_H_CNT(2),
		I_Sel(0) => I_H_CNT(1),
		O_Q      => W_4D2_Q
	);

	--    Parts 4C
	u_4c1 : entity work.LOGIC_74XX139
	port map(
		I_G      => W_4D2_Q(1),
		I_Sel(1) => I_H_CNT(8),
		I_Sel(0) => I_H_CNT(3),
		O_Q      => W_4C1_Q
	);

	u_4c2 : entity work.LOGIC_74XX139
	port map(
		I_G      => W_4D1_Q(3),
		I_Sel(1) => W_4C2_B,
		I_Sel(0) => W_HCNT,
		O_Q      => W_4C2_Q
	);

	process(I_CLK_6M)
	begin
		if falling_edge(I_CLK_6M) then
			W_5C_Q <= I_H_CNT(0);
		end if;
	end process;

	-- 2004-9-22 added
	process(I_CLK_6M)
	begin
		if rising_edge(I_CLK_6M) then
			W_4C1_Q3 <= W_4C1_Q(3);
		end if;
	end process;

	process(W_4C1_Q3)
	begin
		if rising_edge(W_4C1_Q3) then
			W_4C2_B <= I_3D_DI;
		end if;
	end process;

end RTL;
