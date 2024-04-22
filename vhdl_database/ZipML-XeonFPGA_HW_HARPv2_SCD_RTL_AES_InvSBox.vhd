-------------------------------------------------------------------------
--  Copyright (C) 2018 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InvSBox is
port (
	clk : in std_logic;

	in_data : in std_logic_vector(7 downto 0);
	out_data : out std_logic_vector(7 downto 0));
end InvSBox;

architecture behavioral of InvSBox is

signal x : integer range 0 to 15;
signal y : integer range 0 to 15;

type lookup_type is array(15 downto 0) of std_logic_vector(127 downto 0);
signal lookup : lookup_type :=(	
	0 => X"52_09_6a_d5_30_36_a5_38_bf_40_a3_9e_81_f3_d7_fb",
	1 => X"7c_e3_39_82_9b_2f_ff_87_34_8e_43_44_c4_de_e9_cb",
	2 => X"54_7b_94_32_a6_c2_23_3d_ee_4c_95_0b_42_fa_c3_4e",
	3 => X"08_2e_a1_66_28_d9_24_b2_76_5b_a2_49_6d_8b_d1_25",
	4 => X"72_f8_f6_64_86_68_98_16_d4_a4_5c_cc_5d_65_b6_92",
	5 => X"6c_70_48_50_fd_ed_b9_da_5e_15_46_57_a7_8d_9d_84",
	6 => X"90_d8_ab_00_8c_bc_d3_0a_f7_e4_58_05_b8_b3_45_06",
	7 => X"d0_2c_1e_8f_ca_3f_0f_02_c1_af_bd_03_01_13_8a_6b",
	8 => X"3a_91_11_41_4f_67_dc_ea_97_f2_cf_ce_f0_b4_e6_73",
	9 => X"96_ac_74_22_e7_ad_35_85_e2_f9_37_e8_1c_75_df_6e",
	10 => X"47_f1_1a_71_1d_29_c5_89_6f_b7_62_0e_aa_18_be_1b",
	11 => X"fc_56_3e_4b_c6_d2_79_20_9a_db_c0_fe_78_cd_5a_f4",
	12 => X"1f_dd_a8_33_88_07_c7_31_b1_12_10_59_27_80_ec_5f",
	13 => X"60_51_7f_a9_19_b5_4a_0d_2d_e5_7a_9f_93_c9_9c_ef",
	14 => X"a0_e0_3b_4d_ae_2a_f5_b0_c8_eb_bb_3c_83_53_99_61",
	15 => X"17_2b_04_7e_ba_77_d6_26_e1_69_14_63_55_21_0c_7d");

begin

x <= to_integer(unsigned(in_data(7 downto 4)));
y <= 15 - to_integer(unsigned(in_data(3 downto 0)));

process(clk)
begin
if clk'event and clk = '1' then
	out_data <= lookup(x)( y*8+7 downto y*8 );
end if;
end process;

end architecture;