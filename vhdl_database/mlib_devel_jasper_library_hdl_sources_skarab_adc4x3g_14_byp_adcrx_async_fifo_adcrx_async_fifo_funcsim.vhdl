-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.3.1 (lin64) Build 1056140 Thu Oct 30 16:30:39 MDT 2014
-- Date        : Fri Feb 19 10:12:18 2021
-- Host        : hwdev-xbs running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /media/data/Francois/VivadoProjects/FRM123701U1R4/Vivado/IP/adcrx_async_fifo/adcrx_async_fifo_funcsim.vhdl
-- Design      : adcrx_async_fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_dmem is
  port (
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 );
    I1 : in STD_LOGIC;
    O2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    I2 : in STD_LOGIC;
    ADDRC : in STD_LOGIC_VECTOR ( 5 downto 0 );
    O3 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_dmem : entity is "dmem";
end adcrx_async_fifo_dmem;

architecture STRUCTURE of adcrx_async_fifo_dmem is
  signal n_0_RAM_reg_0_63_0_2 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_102_104 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_105_107 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_108_110 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_111_113 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_114_116 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_117_119 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_120_122 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_123_125 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_126_128 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_129_131 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_12_14 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_132_134 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_135_137 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_138_140 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_141_143 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_144_146 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_147_149 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_150_152 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_153_155 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_156_158 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_159_161 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_15_17 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_162_164 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_165_167 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_168_170 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_171_173 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_174_176 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_177_179 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_180_182 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_183_185 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_186_188 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_189_191 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_18_20 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_21_23 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_24_26 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_27_29 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_30_32 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_33_35 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_36_38 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_39_41 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_3_5 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_42_44 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_45_47 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_48_50 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_51_53 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_54_56 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_57_59 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_60_62 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_63_65 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_66_68 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_69_71 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_6_8 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_72_74 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_75_77 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_78_80 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_81_83 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_84_86 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_87_89 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_90_92 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_93_95 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_96_98 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_99_101 : STD_LOGIC;
  signal n_0_RAM_reg_0_63_9_11 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_0_2 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_102_104 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_105_107 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_108_110 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_111_113 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_114_116 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_117_119 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_120_122 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_123_125 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_126_128 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_129_131 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_12_14 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_132_134 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_135_137 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_138_140 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_141_143 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_144_146 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_147_149 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_150_152 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_153_155 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_156_158 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_159_161 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_15_17 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_162_164 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_165_167 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_168_170 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_171_173 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_174_176 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_177_179 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_180_182 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_183_185 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_186_188 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_189_191 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_18_20 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_21_23 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_24_26 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_27_29 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_30_32 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_33_35 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_36_38 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_39_41 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_3_5 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_42_44 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_45_47 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_48_50 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_51_53 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_54_56 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_57_59 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_60_62 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_63_65 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_66_68 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_69_71 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_6_8 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_72_74 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_75_77 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_78_80 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_81_83 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_84_86 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_87_89 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_90_92 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_93_95 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_96_98 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_99_101 : STD_LOGIC;
  signal n_0_RAM_reg_64_127_9_11 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_0_2 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_102_104 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_105_107 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_108_110 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_111_113 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_114_116 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_117_119 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_120_122 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_123_125 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_126_128 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_129_131 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_12_14 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_132_134 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_135_137 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_138_140 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_141_143 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_144_146 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_147_149 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_150_152 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_153_155 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_156_158 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_159_161 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_15_17 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_162_164 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_165_167 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_168_170 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_171_173 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_174_176 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_177_179 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_180_182 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_183_185 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_186_188 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_189_191 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_18_20 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_21_23 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_24_26 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_27_29 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_30_32 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_33_35 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_36_38 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_39_41 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_3_5 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_42_44 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_45_47 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_48_50 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_51_53 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_54_56 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_57_59 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_60_62 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_63_65 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_66_68 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_69_71 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_6_8 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_72_74 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_75_77 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_78_80 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_81_83 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_84_86 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_87_89 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_90_92 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_93_95 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_96_98 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_99_101 : STD_LOGIC;
  signal n_1_RAM_reg_0_63_9_11 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_0_2 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_102_104 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_105_107 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_108_110 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_111_113 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_114_116 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_117_119 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_120_122 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_123_125 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_126_128 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_129_131 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_12_14 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_132_134 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_135_137 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_138_140 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_141_143 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_144_146 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_147_149 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_150_152 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_153_155 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_156_158 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_159_161 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_15_17 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_162_164 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_165_167 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_168_170 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_171_173 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_174_176 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_177_179 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_180_182 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_183_185 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_186_188 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_189_191 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_18_20 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_21_23 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_24_26 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_27_29 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_30_32 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_33_35 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_36_38 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_39_41 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_3_5 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_42_44 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_45_47 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_48_50 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_51_53 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_54_56 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_57_59 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_60_62 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_63_65 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_66_68 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_69_71 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_6_8 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_72_74 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_75_77 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_78_80 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_81_83 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_84_86 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_87_89 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_90_92 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_93_95 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_96_98 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_99_101 : STD_LOGIC;
  signal n_1_RAM_reg_64_127_9_11 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_0_2 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_102_104 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_105_107 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_108_110 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_111_113 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_114_116 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_117_119 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_120_122 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_123_125 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_126_128 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_129_131 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_12_14 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_132_134 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_135_137 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_138_140 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_141_143 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_144_146 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_147_149 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_150_152 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_153_155 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_156_158 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_159_161 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_15_17 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_162_164 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_165_167 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_168_170 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_171_173 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_174_176 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_177_179 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_180_182 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_183_185 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_186_188 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_189_191 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_18_20 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_21_23 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_24_26 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_27_29 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_30_32 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_33_35 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_36_38 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_39_41 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_3_5 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_42_44 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_45_47 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_48_50 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_51_53 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_54_56 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_57_59 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_60_62 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_63_65 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_66_68 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_69_71 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_6_8 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_72_74 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_75_77 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_78_80 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_81_83 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_84_86 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_87_89 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_90_92 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_93_95 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_96_98 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_99_101 : STD_LOGIC;
  signal n_2_RAM_reg_0_63_9_11 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_0_2 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_102_104 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_105_107 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_108_110 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_111_113 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_114_116 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_117_119 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_120_122 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_123_125 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_126_128 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_129_131 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_12_14 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_132_134 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_135_137 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_138_140 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_141_143 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_144_146 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_147_149 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_150_152 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_153_155 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_156_158 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_159_161 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_15_17 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_162_164 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_165_167 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_168_170 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_171_173 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_174_176 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_177_179 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_180_182 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_183_185 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_186_188 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_189_191 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_18_20 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_21_23 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_24_26 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_27_29 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_30_32 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_33_35 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_36_38 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_39_41 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_3_5 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_42_44 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_45_47 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_48_50 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_51_53 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_54_56 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_57_59 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_60_62 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_63_65 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_66_68 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_69_71 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_6_8 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_72_74 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_75_77 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_78_80 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_81_83 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_84_86 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_87_89 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_90_92 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_93_95 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_96_98 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_99_101 : STD_LOGIC;
  signal n_2_RAM_reg_64_127_9_11 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_102_104_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_105_107_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_108_110_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_111_113_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_114_116_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_117_119_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_120_122_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_123_125_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_126_128_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_129_131_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_132_134_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_135_137_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_138_140_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_141_143_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_144_146_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_147_149_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_150_152_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_153_155_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_156_158_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_159_161_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_162_164_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_165_167_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_168_170_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_171_173_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_174_176_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_177_179_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_180_182_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_183_185_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_186_188_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_189_191_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_30_32_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_33_35_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_36_38_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_39_41_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_42_44_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_45_47_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_48_50_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_51_53_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_54_56_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_57_59_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_60_62_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_63_65_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_66_68_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_69_71_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_72_74_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_75_77_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_78_80_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_81_83_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_84_86_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_87_89_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_90_92_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_93_95_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_96_98_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_99_101_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_102_104_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_105_107_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_108_110_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_111_113_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_114_116_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_117_119_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_120_122_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_123_125_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_126_128_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_129_131_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_132_134_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_135_137_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_138_140_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_141_143_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_144_146_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_147_149_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_150_152_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_153_155_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_156_158_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_159_161_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_162_164_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_165_167_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_168_170_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_171_173_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_174_176_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_177_179_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_180_182_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_183_185_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_186_188_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_189_191_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_30_32_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_33_35_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_36_38_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_39_41_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_42_44_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_45_47_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_48_50_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_51_53_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_54_56_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_57_59_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_60_62_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_63_65_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_66_68_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_69_71_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_72_74_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_75_77_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_78_80_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_81_83_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_84_86_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_87_89_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_90_92_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_93_95_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_96_98_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_99_101_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gpr1.dout_i[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gpr1.dout_i[100]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \gpr1.dout_i[101]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \gpr1.dout_i[102]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \gpr1.dout_i[103]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \gpr1.dout_i[104]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \gpr1.dout_i[105]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \gpr1.dout_i[106]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \gpr1.dout_i[107]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \gpr1.dout_i[108]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \gpr1.dout_i[109]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \gpr1.dout_i[10]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gpr1.dout_i[110]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \gpr1.dout_i[111]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \gpr1.dout_i[112]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \gpr1.dout_i[113]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \gpr1.dout_i[114]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \gpr1.dout_i[115]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \gpr1.dout_i[116]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \gpr1.dout_i[117]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \gpr1.dout_i[118]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \gpr1.dout_i[119]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \gpr1.dout_i[11]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gpr1.dout_i[120]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \gpr1.dout_i[121]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \gpr1.dout_i[122]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \gpr1.dout_i[123]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \gpr1.dout_i[124]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \gpr1.dout_i[125]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \gpr1.dout_i[126]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \gpr1.dout_i[127]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \gpr1.dout_i[128]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \gpr1.dout_i[129]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \gpr1.dout_i[12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gpr1.dout_i[130]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \gpr1.dout_i[131]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \gpr1.dout_i[132]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \gpr1.dout_i[133]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \gpr1.dout_i[134]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \gpr1.dout_i[135]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \gpr1.dout_i[136]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \gpr1.dout_i[137]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \gpr1.dout_i[138]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \gpr1.dout_i[139]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \gpr1.dout_i[13]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gpr1.dout_i[140]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \gpr1.dout_i[141]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \gpr1.dout_i[142]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \gpr1.dout_i[143]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \gpr1.dout_i[144]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \gpr1.dout_i[145]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \gpr1.dout_i[146]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \gpr1.dout_i[147]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \gpr1.dout_i[148]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \gpr1.dout_i[149]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \gpr1.dout_i[14]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gpr1.dout_i[150]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \gpr1.dout_i[151]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \gpr1.dout_i[152]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \gpr1.dout_i[153]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \gpr1.dout_i[154]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \gpr1.dout_i[155]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \gpr1.dout_i[156]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \gpr1.dout_i[157]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \gpr1.dout_i[158]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \gpr1.dout_i[159]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \gpr1.dout_i[15]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gpr1.dout_i[160]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \gpr1.dout_i[161]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \gpr1.dout_i[162]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \gpr1.dout_i[163]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \gpr1.dout_i[164]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \gpr1.dout_i[165]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \gpr1.dout_i[166]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \gpr1.dout_i[167]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \gpr1.dout_i[168]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \gpr1.dout_i[169]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \gpr1.dout_i[16]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \gpr1.dout_i[170]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \gpr1.dout_i[171]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \gpr1.dout_i[172]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \gpr1.dout_i[173]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \gpr1.dout_i[174]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \gpr1.dout_i[175]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \gpr1.dout_i[176]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \gpr1.dout_i[177]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \gpr1.dout_i[178]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \gpr1.dout_i[179]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \gpr1.dout_i[17]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \gpr1.dout_i[180]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \gpr1.dout_i[181]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \gpr1.dout_i[182]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \gpr1.dout_i[183]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \gpr1.dout_i[184]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \gpr1.dout_i[185]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \gpr1.dout_i[186]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \gpr1.dout_i[187]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \gpr1.dout_i[188]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \gpr1.dout_i[189]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \gpr1.dout_i[18]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gpr1.dout_i[190]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \gpr1.dout_i[191]_i_2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \gpr1.dout_i[19]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gpr1.dout_i[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gpr1.dout_i[20]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gpr1.dout_i[21]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gpr1.dout_i[22]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gpr1.dout_i[23]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gpr1.dout_i[24]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gpr1.dout_i[25]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gpr1.dout_i[26]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gpr1.dout_i[27]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gpr1.dout_i[28]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gpr1.dout_i[29]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gpr1.dout_i[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gpr1.dout_i[30]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gpr1.dout_i[31]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gpr1.dout_i[32]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gpr1.dout_i[33]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gpr1.dout_i[34]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gpr1.dout_i[35]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gpr1.dout_i[36]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gpr1.dout_i[37]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gpr1.dout_i[38]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gpr1.dout_i[39]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gpr1.dout_i[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gpr1.dout_i[40]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gpr1.dout_i[41]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gpr1.dout_i[42]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gpr1.dout_i[43]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gpr1.dout_i[44]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gpr1.dout_i[45]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gpr1.dout_i[46]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gpr1.dout_i[47]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gpr1.dout_i[48]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gpr1.dout_i[49]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gpr1.dout_i[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gpr1.dout_i[50]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gpr1.dout_i[51]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gpr1.dout_i[52]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gpr1.dout_i[53]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gpr1.dout_i[54]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \gpr1.dout_i[55]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \gpr1.dout_i[56]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \gpr1.dout_i[57]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \gpr1.dout_i[58]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \gpr1.dout_i[59]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \gpr1.dout_i[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gpr1.dout_i[60]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \gpr1.dout_i[61]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \gpr1.dout_i[62]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \gpr1.dout_i[63]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \gpr1.dout_i[64]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \gpr1.dout_i[65]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \gpr1.dout_i[66]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \gpr1.dout_i[67]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \gpr1.dout_i[68]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \gpr1.dout_i[69]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \gpr1.dout_i[6]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gpr1.dout_i[70]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \gpr1.dout_i[71]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \gpr1.dout_i[72]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \gpr1.dout_i[73]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \gpr1.dout_i[74]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \gpr1.dout_i[75]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \gpr1.dout_i[76]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \gpr1.dout_i[77]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \gpr1.dout_i[78]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \gpr1.dout_i[79]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \gpr1.dout_i[7]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gpr1.dout_i[80]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \gpr1.dout_i[81]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \gpr1.dout_i[82]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \gpr1.dout_i[83]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \gpr1.dout_i[84]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \gpr1.dout_i[85]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \gpr1.dout_i[86]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \gpr1.dout_i[87]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \gpr1.dout_i[88]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \gpr1.dout_i[89]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \gpr1.dout_i[8]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gpr1.dout_i[90]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \gpr1.dout_i[91]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \gpr1.dout_i[92]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \gpr1.dout_i[93]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \gpr1.dout_i[94]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \gpr1.dout_i[95]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \gpr1.dout_i[96]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \gpr1.dout_i[97]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \gpr1.dout_i[98]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \gpr1.dout_i[99]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \gpr1.dout_i[9]_i_1\ : label is "soft_lutpair19";
begin
RAM_reg_0_63_0_2: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_0_2,
      DOB => n_1_RAM_reg_0_63_0_2,
      DOC => n_2_RAM_reg_0_63_0_2,
      DOD => NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_102_104: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(102),
      DIB => din(103),
      DIC => din(104),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_102_104,
      DOB => n_1_RAM_reg_0_63_102_104,
      DOC => n_2_RAM_reg_0_63_102_104,
      DOD => NLW_RAM_reg_0_63_102_104_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_105_107: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(105),
      DIB => din(106),
      DIC => din(107),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_105_107,
      DOB => n_1_RAM_reg_0_63_105_107,
      DOC => n_2_RAM_reg_0_63_105_107,
      DOD => NLW_RAM_reg_0_63_105_107_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_108_110: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(108),
      DIB => din(109),
      DIC => din(110),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_108_110,
      DOB => n_1_RAM_reg_0_63_108_110,
      DOC => n_2_RAM_reg_0_63_108_110,
      DOD => NLW_RAM_reg_0_63_108_110_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_111_113: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(111),
      DIB => din(112),
      DIC => din(113),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_111_113,
      DOB => n_1_RAM_reg_0_63_111_113,
      DOC => n_2_RAM_reg_0_63_111_113,
      DOD => NLW_RAM_reg_0_63_111_113_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_114_116: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(114),
      DIB => din(115),
      DIC => din(116),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_114_116,
      DOB => n_1_RAM_reg_0_63_114_116,
      DOC => n_2_RAM_reg_0_63_114_116,
      DOD => NLW_RAM_reg_0_63_114_116_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_117_119: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(117),
      DIB => din(118),
      DIC => din(119),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_117_119,
      DOB => n_1_RAM_reg_0_63_117_119,
      DOC => n_2_RAM_reg_0_63_117_119,
      DOD => NLW_RAM_reg_0_63_117_119_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_120_122: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(120),
      DIB => din(121),
      DIC => din(122),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_120_122,
      DOB => n_1_RAM_reg_0_63_120_122,
      DOC => n_2_RAM_reg_0_63_120_122,
      DOD => NLW_RAM_reg_0_63_120_122_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_123_125: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(123),
      DIB => din(124),
      DIC => din(125),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_123_125,
      DOB => n_1_RAM_reg_0_63_123_125,
      DOC => n_2_RAM_reg_0_63_123_125,
      DOD => NLW_RAM_reg_0_63_123_125_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_126_128: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(126),
      DIB => din(127),
      DIC => din(128),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_126_128,
      DOB => n_1_RAM_reg_0_63_126_128,
      DOC => n_2_RAM_reg_0_63_126_128,
      DOD => NLW_RAM_reg_0_63_126_128_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_129_131: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(129),
      DIB => din(130),
      DIC => din(131),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_129_131,
      DOB => n_1_RAM_reg_0_63_129_131,
      DOC => n_2_RAM_reg_0_63_129_131,
      DOD => NLW_RAM_reg_0_63_129_131_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_12_14: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_12_14,
      DOB => n_1_RAM_reg_0_63_12_14,
      DOC => n_2_RAM_reg_0_63_12_14,
      DOD => NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_132_134: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(132),
      DIB => din(133),
      DIC => din(134),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_132_134,
      DOB => n_1_RAM_reg_0_63_132_134,
      DOC => n_2_RAM_reg_0_63_132_134,
      DOD => NLW_RAM_reg_0_63_132_134_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_135_137: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(135),
      DIB => din(136),
      DIC => din(137),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_135_137,
      DOB => n_1_RAM_reg_0_63_135_137,
      DOC => n_2_RAM_reg_0_63_135_137,
      DOD => NLW_RAM_reg_0_63_135_137_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_138_140: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(138),
      DIB => din(139),
      DIC => din(140),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_138_140,
      DOB => n_1_RAM_reg_0_63_138_140,
      DOC => n_2_RAM_reg_0_63_138_140,
      DOD => NLW_RAM_reg_0_63_138_140_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_141_143: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(141),
      DIB => din(142),
      DIC => din(143),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_141_143,
      DOB => n_1_RAM_reg_0_63_141_143,
      DOC => n_2_RAM_reg_0_63_141_143,
      DOD => NLW_RAM_reg_0_63_141_143_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_144_146: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(144),
      DIB => din(145),
      DIC => din(146),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_144_146,
      DOB => n_1_RAM_reg_0_63_144_146,
      DOC => n_2_RAM_reg_0_63_144_146,
      DOD => NLW_RAM_reg_0_63_144_146_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_147_149: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(147),
      DIB => din(148),
      DIC => din(149),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_147_149,
      DOB => n_1_RAM_reg_0_63_147_149,
      DOC => n_2_RAM_reg_0_63_147_149,
      DOD => NLW_RAM_reg_0_63_147_149_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_150_152: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(150),
      DIB => din(151),
      DIC => din(152),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_150_152,
      DOB => n_1_RAM_reg_0_63_150_152,
      DOC => n_2_RAM_reg_0_63_150_152,
      DOD => NLW_RAM_reg_0_63_150_152_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_153_155: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(153),
      DIB => din(154),
      DIC => din(155),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_153_155,
      DOB => n_1_RAM_reg_0_63_153_155,
      DOC => n_2_RAM_reg_0_63_153_155,
      DOD => NLW_RAM_reg_0_63_153_155_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_156_158: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(156),
      DIB => din(157),
      DIC => din(158),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_156_158,
      DOB => n_1_RAM_reg_0_63_156_158,
      DOC => n_2_RAM_reg_0_63_156_158,
      DOD => NLW_RAM_reg_0_63_156_158_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_159_161: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(159),
      DIB => din(160),
      DIC => din(161),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_159_161,
      DOB => n_1_RAM_reg_0_63_159_161,
      DOC => n_2_RAM_reg_0_63_159_161,
      DOD => NLW_RAM_reg_0_63_159_161_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_15_17: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_15_17,
      DOB => n_1_RAM_reg_0_63_15_17,
      DOC => n_2_RAM_reg_0_63_15_17,
      DOD => NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_162_164: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(162),
      DIB => din(163),
      DIC => din(164),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_162_164,
      DOB => n_1_RAM_reg_0_63_162_164,
      DOC => n_2_RAM_reg_0_63_162_164,
      DOD => NLW_RAM_reg_0_63_162_164_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_165_167: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(165),
      DIB => din(166),
      DIC => din(167),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_165_167,
      DOB => n_1_RAM_reg_0_63_165_167,
      DOC => n_2_RAM_reg_0_63_165_167,
      DOD => NLW_RAM_reg_0_63_165_167_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_168_170: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(168),
      DIB => din(169),
      DIC => din(170),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_168_170,
      DOB => n_1_RAM_reg_0_63_168_170,
      DOC => n_2_RAM_reg_0_63_168_170,
      DOD => NLW_RAM_reg_0_63_168_170_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_171_173: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(171),
      DIB => din(172),
      DIC => din(173),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_171_173,
      DOB => n_1_RAM_reg_0_63_171_173,
      DOC => n_2_RAM_reg_0_63_171_173,
      DOD => NLW_RAM_reg_0_63_171_173_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_174_176: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(174),
      DIB => din(175),
      DIC => din(176),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_174_176,
      DOB => n_1_RAM_reg_0_63_174_176,
      DOC => n_2_RAM_reg_0_63_174_176,
      DOD => NLW_RAM_reg_0_63_174_176_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_177_179: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(177),
      DIB => din(178),
      DIC => din(179),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_177_179,
      DOB => n_1_RAM_reg_0_63_177_179,
      DOC => n_2_RAM_reg_0_63_177_179,
      DOD => NLW_RAM_reg_0_63_177_179_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_180_182: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(180),
      DIB => din(181),
      DIC => din(182),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_180_182,
      DOB => n_1_RAM_reg_0_63_180_182,
      DOC => n_2_RAM_reg_0_63_180_182,
      DOD => NLW_RAM_reg_0_63_180_182_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_183_185: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(183),
      DIB => din(184),
      DIC => din(185),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_183_185,
      DOB => n_1_RAM_reg_0_63_183_185,
      DOC => n_2_RAM_reg_0_63_183_185,
      DOD => NLW_RAM_reg_0_63_183_185_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_186_188: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(186),
      DIB => din(187),
      DIC => din(188),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_186_188,
      DOB => n_1_RAM_reg_0_63_186_188,
      DOC => n_2_RAM_reg_0_63_186_188,
      DOD => NLW_RAM_reg_0_63_186_188_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_189_191: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(189),
      DIB => din(190),
      DIC => din(191),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_189_191,
      DOB => n_1_RAM_reg_0_63_189_191,
      DOC => n_2_RAM_reg_0_63_189_191,
      DOD => NLW_RAM_reg_0_63_189_191_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_18_20: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_18_20,
      DOB => n_1_RAM_reg_0_63_18_20,
      DOC => n_2_RAM_reg_0_63_18_20,
      DOD => NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_21_23: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_21_23,
      DOB => n_1_RAM_reg_0_63_21_23,
      DOC => n_2_RAM_reg_0_63_21_23,
      DOD => NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_24_26: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_24_26,
      DOB => n_1_RAM_reg_0_63_24_26,
      DOC => n_2_RAM_reg_0_63_24_26,
      DOD => NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_27_29: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_27_29,
      DOB => n_1_RAM_reg_0_63_27_29,
      DOC => n_2_RAM_reg_0_63_27_29,
      DOD => NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_30_32: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(30),
      DIB => din(31),
      DIC => din(32),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_30_32,
      DOB => n_1_RAM_reg_0_63_30_32,
      DOC => n_2_RAM_reg_0_63_30_32,
      DOD => NLW_RAM_reg_0_63_30_32_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_33_35: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(33),
      DIB => din(34),
      DIC => din(35),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_33_35,
      DOB => n_1_RAM_reg_0_63_33_35,
      DOC => n_2_RAM_reg_0_63_33_35,
      DOD => NLW_RAM_reg_0_63_33_35_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_36_38: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(36),
      DIB => din(37),
      DIC => din(38),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_36_38,
      DOB => n_1_RAM_reg_0_63_36_38,
      DOC => n_2_RAM_reg_0_63_36_38,
      DOD => NLW_RAM_reg_0_63_36_38_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_39_41: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(39),
      DIB => din(40),
      DIC => din(41),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_39_41,
      DOB => n_1_RAM_reg_0_63_39_41,
      DOC => n_2_RAM_reg_0_63_39_41,
      DOD => NLW_RAM_reg_0_63_39_41_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_3_5: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_3_5,
      DOB => n_1_RAM_reg_0_63_3_5,
      DOC => n_2_RAM_reg_0_63_3_5,
      DOD => NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_42_44: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(42),
      DIB => din(43),
      DIC => din(44),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_42_44,
      DOB => n_1_RAM_reg_0_63_42_44,
      DOC => n_2_RAM_reg_0_63_42_44,
      DOD => NLW_RAM_reg_0_63_42_44_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_45_47: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(45),
      DIB => din(46),
      DIC => din(47),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_45_47,
      DOB => n_1_RAM_reg_0_63_45_47,
      DOC => n_2_RAM_reg_0_63_45_47,
      DOD => NLW_RAM_reg_0_63_45_47_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_48_50: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(48),
      DIB => din(49),
      DIC => din(50),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_48_50,
      DOB => n_1_RAM_reg_0_63_48_50,
      DOC => n_2_RAM_reg_0_63_48_50,
      DOD => NLW_RAM_reg_0_63_48_50_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_51_53: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(51),
      DIB => din(52),
      DIC => din(53),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_51_53,
      DOB => n_1_RAM_reg_0_63_51_53,
      DOC => n_2_RAM_reg_0_63_51_53,
      DOD => NLW_RAM_reg_0_63_51_53_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_54_56: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(54),
      DIB => din(55),
      DIC => din(56),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_54_56,
      DOB => n_1_RAM_reg_0_63_54_56,
      DOC => n_2_RAM_reg_0_63_54_56,
      DOD => NLW_RAM_reg_0_63_54_56_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_57_59: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(57),
      DIB => din(58),
      DIC => din(59),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_57_59,
      DOB => n_1_RAM_reg_0_63_57_59,
      DOC => n_2_RAM_reg_0_63_57_59,
      DOD => NLW_RAM_reg_0_63_57_59_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_60_62: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(60),
      DIB => din(61),
      DIC => din(62),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_60_62,
      DOB => n_1_RAM_reg_0_63_60_62,
      DOC => n_2_RAM_reg_0_63_60_62,
      DOD => NLW_RAM_reg_0_63_60_62_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_63_65: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(63),
      DIB => din(64),
      DIC => din(65),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_63_65,
      DOB => n_1_RAM_reg_0_63_63_65,
      DOC => n_2_RAM_reg_0_63_63_65,
      DOD => NLW_RAM_reg_0_63_63_65_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_66_68: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(66),
      DIB => din(67),
      DIC => din(68),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_66_68,
      DOB => n_1_RAM_reg_0_63_66_68,
      DOC => n_2_RAM_reg_0_63_66_68,
      DOD => NLW_RAM_reg_0_63_66_68_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_69_71: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(69),
      DIB => din(70),
      DIC => din(71),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_69_71,
      DOB => n_1_RAM_reg_0_63_69_71,
      DOC => n_2_RAM_reg_0_63_69_71,
      DOD => NLW_RAM_reg_0_63_69_71_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_6_8: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_6_8,
      DOB => n_1_RAM_reg_0_63_6_8,
      DOC => n_2_RAM_reg_0_63_6_8,
      DOD => NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_72_74: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(72),
      DIB => din(73),
      DIC => din(74),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_72_74,
      DOB => n_1_RAM_reg_0_63_72_74,
      DOC => n_2_RAM_reg_0_63_72_74,
      DOD => NLW_RAM_reg_0_63_72_74_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_75_77: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(75),
      DIB => din(76),
      DIC => din(77),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_75_77,
      DOB => n_1_RAM_reg_0_63_75_77,
      DOC => n_2_RAM_reg_0_63_75_77,
      DOD => NLW_RAM_reg_0_63_75_77_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_78_80: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(78),
      DIB => din(79),
      DIC => din(80),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_78_80,
      DOB => n_1_RAM_reg_0_63_78_80,
      DOC => n_2_RAM_reg_0_63_78_80,
      DOD => NLW_RAM_reg_0_63_78_80_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_81_83: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(81),
      DIB => din(82),
      DIC => din(83),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_81_83,
      DOB => n_1_RAM_reg_0_63_81_83,
      DOC => n_2_RAM_reg_0_63_81_83,
      DOD => NLW_RAM_reg_0_63_81_83_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_84_86: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(84),
      DIB => din(85),
      DIC => din(86),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_84_86,
      DOB => n_1_RAM_reg_0_63_84_86,
      DOC => n_2_RAM_reg_0_63_84_86,
      DOD => NLW_RAM_reg_0_63_84_86_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_87_89: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(87),
      DIB => din(88),
      DIC => din(89),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_87_89,
      DOB => n_1_RAM_reg_0_63_87_89,
      DOC => n_2_RAM_reg_0_63_87_89,
      DOD => NLW_RAM_reg_0_63_87_89_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_90_92: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(90),
      DIB => din(91),
      DIC => din(92),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_90_92,
      DOB => n_1_RAM_reg_0_63_90_92,
      DOC => n_2_RAM_reg_0_63_90_92,
      DOD => NLW_RAM_reg_0_63_90_92_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_93_95: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(93),
      DIB => din(94),
      DIC => din(95),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_93_95,
      DOB => n_1_RAM_reg_0_63_93_95,
      DOC => n_2_RAM_reg_0_63_93_95,
      DOD => NLW_RAM_reg_0_63_93_95_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_96_98: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(96),
      DIB => din(97),
      DIC => din(98),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_96_98,
      DOB => n_1_RAM_reg_0_63_96_98,
      DOC => n_2_RAM_reg_0_63_96_98,
      DOD => NLW_RAM_reg_0_63_96_98_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_99_101: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(99),
      DIB => din(100),
      DIC => din(101),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_99_101,
      DOB => n_1_RAM_reg_0_63_99_101,
      DOC => n_2_RAM_reg_0_63_99_101,
      DOD => NLW_RAM_reg_0_63_99_101_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_0_63_9_11: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => n_0_RAM_reg_0_63_9_11,
      DOB => n_1_RAM_reg_0_63_9_11,
      DOC => n_2_RAM_reg_0_63_9_11,
      DOD => NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I1
    );
RAM_reg_64_127_0_2: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_0_2,
      DOB => n_1_RAM_reg_64_127_0_2,
      DOC => n_2_RAM_reg_64_127_0_2,
      DOD => NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_102_104: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(102),
      DIB => din(103),
      DIC => din(104),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_102_104,
      DOB => n_1_RAM_reg_64_127_102_104,
      DOC => n_2_RAM_reg_64_127_102_104,
      DOD => NLW_RAM_reg_64_127_102_104_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_105_107: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(105),
      DIB => din(106),
      DIC => din(107),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_105_107,
      DOB => n_1_RAM_reg_64_127_105_107,
      DOC => n_2_RAM_reg_64_127_105_107,
      DOD => NLW_RAM_reg_64_127_105_107_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_108_110: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(108),
      DIB => din(109),
      DIC => din(110),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_108_110,
      DOB => n_1_RAM_reg_64_127_108_110,
      DOC => n_2_RAM_reg_64_127_108_110,
      DOD => NLW_RAM_reg_64_127_108_110_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_111_113: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(111),
      DIB => din(112),
      DIC => din(113),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_111_113,
      DOB => n_1_RAM_reg_64_127_111_113,
      DOC => n_2_RAM_reg_64_127_111_113,
      DOD => NLW_RAM_reg_64_127_111_113_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_114_116: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(114),
      DIB => din(115),
      DIC => din(116),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_114_116,
      DOB => n_1_RAM_reg_64_127_114_116,
      DOC => n_2_RAM_reg_64_127_114_116,
      DOD => NLW_RAM_reg_64_127_114_116_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_117_119: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(117),
      DIB => din(118),
      DIC => din(119),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_117_119,
      DOB => n_1_RAM_reg_64_127_117_119,
      DOC => n_2_RAM_reg_64_127_117_119,
      DOD => NLW_RAM_reg_64_127_117_119_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_120_122: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(120),
      DIB => din(121),
      DIC => din(122),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_120_122,
      DOB => n_1_RAM_reg_64_127_120_122,
      DOC => n_2_RAM_reg_64_127_120_122,
      DOD => NLW_RAM_reg_64_127_120_122_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_123_125: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(123),
      DIB => din(124),
      DIC => din(125),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_123_125,
      DOB => n_1_RAM_reg_64_127_123_125,
      DOC => n_2_RAM_reg_64_127_123_125,
      DOD => NLW_RAM_reg_64_127_123_125_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_126_128: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(126),
      DIB => din(127),
      DIC => din(128),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_126_128,
      DOB => n_1_RAM_reg_64_127_126_128,
      DOC => n_2_RAM_reg_64_127_126_128,
      DOD => NLW_RAM_reg_64_127_126_128_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_129_131: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(129),
      DIB => din(130),
      DIC => din(131),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_129_131,
      DOB => n_1_RAM_reg_64_127_129_131,
      DOC => n_2_RAM_reg_64_127_129_131,
      DOD => NLW_RAM_reg_64_127_129_131_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_12_14: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_12_14,
      DOB => n_1_RAM_reg_64_127_12_14,
      DOC => n_2_RAM_reg_64_127_12_14,
      DOD => NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_132_134: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(132),
      DIB => din(133),
      DIC => din(134),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_132_134,
      DOB => n_1_RAM_reg_64_127_132_134,
      DOC => n_2_RAM_reg_64_127_132_134,
      DOD => NLW_RAM_reg_64_127_132_134_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_135_137: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(135),
      DIB => din(136),
      DIC => din(137),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_135_137,
      DOB => n_1_RAM_reg_64_127_135_137,
      DOC => n_2_RAM_reg_64_127_135_137,
      DOD => NLW_RAM_reg_64_127_135_137_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_138_140: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(138),
      DIB => din(139),
      DIC => din(140),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_138_140,
      DOB => n_1_RAM_reg_64_127_138_140,
      DOC => n_2_RAM_reg_64_127_138_140,
      DOD => NLW_RAM_reg_64_127_138_140_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_141_143: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(141),
      DIB => din(142),
      DIC => din(143),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_141_143,
      DOB => n_1_RAM_reg_64_127_141_143,
      DOC => n_2_RAM_reg_64_127_141_143,
      DOD => NLW_RAM_reg_64_127_141_143_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_144_146: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(144),
      DIB => din(145),
      DIC => din(146),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_144_146,
      DOB => n_1_RAM_reg_64_127_144_146,
      DOC => n_2_RAM_reg_64_127_144_146,
      DOD => NLW_RAM_reg_64_127_144_146_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_147_149: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(147),
      DIB => din(148),
      DIC => din(149),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_147_149,
      DOB => n_1_RAM_reg_64_127_147_149,
      DOC => n_2_RAM_reg_64_127_147_149,
      DOD => NLW_RAM_reg_64_127_147_149_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_150_152: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(150),
      DIB => din(151),
      DIC => din(152),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_150_152,
      DOB => n_1_RAM_reg_64_127_150_152,
      DOC => n_2_RAM_reg_64_127_150_152,
      DOD => NLW_RAM_reg_64_127_150_152_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_153_155: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(153),
      DIB => din(154),
      DIC => din(155),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_153_155,
      DOB => n_1_RAM_reg_64_127_153_155,
      DOC => n_2_RAM_reg_64_127_153_155,
      DOD => NLW_RAM_reg_64_127_153_155_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_156_158: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(156),
      DIB => din(157),
      DIC => din(158),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_156_158,
      DOB => n_1_RAM_reg_64_127_156_158,
      DOC => n_2_RAM_reg_64_127_156_158,
      DOD => NLW_RAM_reg_64_127_156_158_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_159_161: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(159),
      DIB => din(160),
      DIC => din(161),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_159_161,
      DOB => n_1_RAM_reg_64_127_159_161,
      DOC => n_2_RAM_reg_64_127_159_161,
      DOD => NLW_RAM_reg_64_127_159_161_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_15_17: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_15_17,
      DOB => n_1_RAM_reg_64_127_15_17,
      DOC => n_2_RAM_reg_64_127_15_17,
      DOD => NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_162_164: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(162),
      DIB => din(163),
      DIC => din(164),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_162_164,
      DOB => n_1_RAM_reg_64_127_162_164,
      DOC => n_2_RAM_reg_64_127_162_164,
      DOD => NLW_RAM_reg_64_127_162_164_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_165_167: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(165),
      DIB => din(166),
      DIC => din(167),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_165_167,
      DOB => n_1_RAM_reg_64_127_165_167,
      DOC => n_2_RAM_reg_64_127_165_167,
      DOD => NLW_RAM_reg_64_127_165_167_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_168_170: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(168),
      DIB => din(169),
      DIC => din(170),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_168_170,
      DOB => n_1_RAM_reg_64_127_168_170,
      DOC => n_2_RAM_reg_64_127_168_170,
      DOD => NLW_RAM_reg_64_127_168_170_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_171_173: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(171),
      DIB => din(172),
      DIC => din(173),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_171_173,
      DOB => n_1_RAM_reg_64_127_171_173,
      DOC => n_2_RAM_reg_64_127_171_173,
      DOD => NLW_RAM_reg_64_127_171_173_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_174_176: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(174),
      DIB => din(175),
      DIC => din(176),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_174_176,
      DOB => n_1_RAM_reg_64_127_174_176,
      DOC => n_2_RAM_reg_64_127_174_176,
      DOD => NLW_RAM_reg_64_127_174_176_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_177_179: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(177),
      DIB => din(178),
      DIC => din(179),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_177_179,
      DOB => n_1_RAM_reg_64_127_177_179,
      DOC => n_2_RAM_reg_64_127_177_179,
      DOD => NLW_RAM_reg_64_127_177_179_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_180_182: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(180),
      DIB => din(181),
      DIC => din(182),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_180_182,
      DOB => n_1_RAM_reg_64_127_180_182,
      DOC => n_2_RAM_reg_64_127_180_182,
      DOD => NLW_RAM_reg_64_127_180_182_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_183_185: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(183),
      DIB => din(184),
      DIC => din(185),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_183_185,
      DOB => n_1_RAM_reg_64_127_183_185,
      DOC => n_2_RAM_reg_64_127_183_185,
      DOD => NLW_RAM_reg_64_127_183_185_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_186_188: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(186),
      DIB => din(187),
      DIC => din(188),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_186_188,
      DOB => n_1_RAM_reg_64_127_186_188,
      DOC => n_2_RAM_reg_64_127_186_188,
      DOD => NLW_RAM_reg_64_127_186_188_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_189_191: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O3(5 downto 0),
      ADDRB(5 downto 0) => O3(5 downto 0),
      ADDRC(5 downto 0) => O3(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(189),
      DIB => din(190),
      DIC => din(191),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_189_191,
      DOB => n_1_RAM_reg_64_127_189_191,
      DOC => n_2_RAM_reg_64_127_189_191,
      DOD => NLW_RAM_reg_64_127_189_191_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_18_20: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_18_20,
      DOB => n_1_RAM_reg_64_127_18_20,
      DOC => n_2_RAM_reg_64_127_18_20,
      DOD => NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_21_23: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_21_23,
      DOB => n_1_RAM_reg_64_127_21_23,
      DOC => n_2_RAM_reg_64_127_21_23,
      DOD => NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_24_26: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_24_26,
      DOB => n_1_RAM_reg_64_127_24_26,
      DOC => n_2_RAM_reg_64_127_24_26,
      DOD => NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_27_29: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_27_29,
      DOB => n_1_RAM_reg_64_127_27_29,
      DOC => n_2_RAM_reg_64_127_27_29,
      DOD => NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_30_32: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(30),
      DIB => din(31),
      DIC => din(32),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_30_32,
      DOB => n_1_RAM_reg_64_127_30_32,
      DOC => n_2_RAM_reg_64_127_30_32,
      DOD => NLW_RAM_reg_64_127_30_32_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_33_35: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(33),
      DIB => din(34),
      DIC => din(35),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_33_35,
      DOB => n_1_RAM_reg_64_127_33_35,
      DOC => n_2_RAM_reg_64_127_33_35,
      DOD => NLW_RAM_reg_64_127_33_35_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_36_38: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(36),
      DIB => din(37),
      DIC => din(38),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_36_38,
      DOB => n_1_RAM_reg_64_127_36_38,
      DOC => n_2_RAM_reg_64_127_36_38,
      DOD => NLW_RAM_reg_64_127_36_38_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_39_41: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(39),
      DIB => din(40),
      DIC => din(41),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_39_41,
      DOB => n_1_RAM_reg_64_127_39_41,
      DOC => n_2_RAM_reg_64_127_39_41,
      DOD => NLW_RAM_reg_64_127_39_41_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_3_5: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_3_5,
      DOB => n_1_RAM_reg_64_127_3_5,
      DOC => n_2_RAM_reg_64_127_3_5,
      DOD => NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_42_44: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(42),
      DIB => din(43),
      DIC => din(44),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_42_44,
      DOB => n_1_RAM_reg_64_127_42_44,
      DOC => n_2_RAM_reg_64_127_42_44,
      DOD => NLW_RAM_reg_64_127_42_44_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_45_47: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(45),
      DIB => din(46),
      DIC => din(47),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_45_47,
      DOB => n_1_RAM_reg_64_127_45_47,
      DOC => n_2_RAM_reg_64_127_45_47,
      DOD => NLW_RAM_reg_64_127_45_47_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_48_50: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(48),
      DIB => din(49),
      DIC => din(50),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_48_50,
      DOB => n_1_RAM_reg_64_127_48_50,
      DOC => n_2_RAM_reg_64_127_48_50,
      DOD => NLW_RAM_reg_64_127_48_50_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_51_53: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(51),
      DIB => din(52),
      DIC => din(53),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_51_53,
      DOB => n_1_RAM_reg_64_127_51_53,
      DOC => n_2_RAM_reg_64_127_51_53,
      DOD => NLW_RAM_reg_64_127_51_53_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_54_56: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(54),
      DIB => din(55),
      DIC => din(56),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_54_56,
      DOB => n_1_RAM_reg_64_127_54_56,
      DOC => n_2_RAM_reg_64_127_54_56,
      DOD => NLW_RAM_reg_64_127_54_56_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_57_59: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(57),
      DIB => din(58),
      DIC => din(59),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_57_59,
      DOB => n_1_RAM_reg_64_127_57_59,
      DOC => n_2_RAM_reg_64_127_57_59,
      DOD => NLW_RAM_reg_64_127_57_59_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_60_62: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(60),
      DIB => din(61),
      DIC => din(62),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_60_62,
      DOB => n_1_RAM_reg_64_127_60_62,
      DOC => n_2_RAM_reg_64_127_60_62,
      DOD => NLW_RAM_reg_64_127_60_62_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_63_65: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(63),
      DIB => din(64),
      DIC => din(65),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_63_65,
      DOB => n_1_RAM_reg_64_127_63_65,
      DOC => n_2_RAM_reg_64_127_63_65,
      DOD => NLW_RAM_reg_64_127_63_65_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_66_68: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(66),
      DIB => din(67),
      DIC => din(68),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_66_68,
      DOB => n_1_RAM_reg_64_127_66_68,
      DOC => n_2_RAM_reg_64_127_66_68,
      DOD => NLW_RAM_reg_64_127_66_68_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_69_71: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(69),
      DIB => din(70),
      DIC => din(71),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_69_71,
      DOB => n_1_RAM_reg_64_127_69_71,
      DOC => n_2_RAM_reg_64_127_69_71,
      DOD => NLW_RAM_reg_64_127_69_71_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_6_8: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_6_8,
      DOB => n_1_RAM_reg_64_127_6_8,
      DOC => n_2_RAM_reg_64_127_6_8,
      DOD => NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_72_74: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(72),
      DIB => din(73),
      DIC => din(74),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_72_74,
      DOB => n_1_RAM_reg_64_127_72_74,
      DOC => n_2_RAM_reg_64_127_72_74,
      DOD => NLW_RAM_reg_64_127_72_74_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_75_77: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(75),
      DIB => din(76),
      DIC => din(77),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_75_77,
      DOB => n_1_RAM_reg_64_127_75_77,
      DOC => n_2_RAM_reg_64_127_75_77,
      DOD => NLW_RAM_reg_64_127_75_77_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_78_80: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(78),
      DIB => din(79),
      DIC => din(80),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_78_80,
      DOB => n_1_RAM_reg_64_127_78_80,
      DOC => n_2_RAM_reg_64_127_78_80,
      DOD => NLW_RAM_reg_64_127_78_80_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_81_83: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(81),
      DIB => din(82),
      DIC => din(83),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_81_83,
      DOB => n_1_RAM_reg_64_127_81_83,
      DOC => n_2_RAM_reg_64_127_81_83,
      DOD => NLW_RAM_reg_64_127_81_83_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_84_86: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(84),
      DIB => din(85),
      DIC => din(86),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_84_86,
      DOB => n_1_RAM_reg_64_127_84_86,
      DOC => n_2_RAM_reg_64_127_84_86,
      DOD => NLW_RAM_reg_64_127_84_86_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_87_89: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(87),
      DIB => din(88),
      DIC => din(89),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_87_89,
      DOB => n_1_RAM_reg_64_127_87_89,
      DOC => n_2_RAM_reg_64_127_87_89,
      DOD => NLW_RAM_reg_64_127_87_89_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_90_92: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(90),
      DIB => din(91),
      DIC => din(92),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_90_92,
      DOB => n_1_RAM_reg_64_127_90_92,
      DOC => n_2_RAM_reg_64_127_90_92,
      DOD => NLW_RAM_reg_64_127_90_92_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_93_95: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(93),
      DIB => din(94),
      DIC => din(95),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_93_95,
      DOB => n_1_RAM_reg_64_127_93_95,
      DOC => n_2_RAM_reg_64_127_93_95,
      DOD => NLW_RAM_reg_64_127_93_95_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_96_98: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(96),
      DIB => din(97),
      DIC => din(98),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_96_98,
      DOB => n_1_RAM_reg_64_127_96_98,
      DOC => n_2_RAM_reg_64_127_96_98,
      DOD => NLW_RAM_reg_64_127_96_98_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_99_101: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => ADDRC(5 downto 0),
      ADDRB(5 downto 0) => ADDRC(5 downto 0),
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(99),
      DIB => din(100),
      DIC => din(101),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_99_101,
      DOB => n_1_RAM_reg_64_127_99_101,
      DOC => n_2_RAM_reg_64_127_99_101,
      DOD => NLW_RAM_reg_64_127_99_101_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
RAM_reg_64_127_9_11: unisim.vcomponents.RAM64M
    port map (
      ADDRA(5 downto 0) => O2(5 downto 0),
      ADDRB(5 downto 0) => O2(5 downto 0),
      ADDRC(5 downto 0) => O2(5 downto 0),
      ADDRD(5 downto 0) => Q(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => n_0_RAM_reg_64_127_9_11,
      DOB => n_1_RAM_reg_64_127_9_11,
      DOC => n_2_RAM_reg_64_127_9_11,
      DOD => NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => I2
    );
\gpr1.dout_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_0_2,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_0_2,
      O => p_0_out(0)
    );
\gpr1.dout_i[100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_99_101,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_99_101,
      O => p_0_out(100)
    );
\gpr1.dout_i[101]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_99_101,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_99_101,
      O => p_0_out(101)
    );
\gpr1.dout_i[102]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_102_104,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_102_104,
      O => p_0_out(102)
    );
\gpr1.dout_i[103]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_102_104,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_102_104,
      O => p_0_out(103)
    );
\gpr1.dout_i[104]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_102_104,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_102_104,
      O => p_0_out(104)
    );
\gpr1.dout_i[105]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_105_107,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_105_107,
      O => p_0_out(105)
    );
\gpr1.dout_i[106]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_105_107,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_105_107,
      O => p_0_out(106)
    );
\gpr1.dout_i[107]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_105_107,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_105_107,
      O => p_0_out(107)
    );
\gpr1.dout_i[108]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_108_110,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_108_110,
      O => p_0_out(108)
    );
\gpr1.dout_i[109]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_108_110,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_108_110,
      O => p_0_out(109)
    );
\gpr1.dout_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_9_11,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_9_11,
      O => p_0_out(10)
    );
\gpr1.dout_i[110]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_108_110,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_108_110,
      O => p_0_out(110)
    );
\gpr1.dout_i[111]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_111_113,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_111_113,
      O => p_0_out(111)
    );
\gpr1.dout_i[112]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_111_113,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_111_113,
      O => p_0_out(112)
    );
\gpr1.dout_i[113]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_111_113,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_111_113,
      O => p_0_out(113)
    );
\gpr1.dout_i[114]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_114_116,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_114_116,
      O => p_0_out(114)
    );
\gpr1.dout_i[115]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_114_116,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_114_116,
      O => p_0_out(115)
    );
\gpr1.dout_i[116]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_114_116,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_114_116,
      O => p_0_out(116)
    );
\gpr1.dout_i[117]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_117_119,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_117_119,
      O => p_0_out(117)
    );
\gpr1.dout_i[118]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_117_119,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_117_119,
      O => p_0_out(118)
    );
\gpr1.dout_i[119]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_117_119,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_117_119,
      O => p_0_out(119)
    );
\gpr1.dout_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_9_11,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_9_11,
      O => p_0_out(11)
    );
\gpr1.dout_i[120]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_120_122,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_120_122,
      O => p_0_out(120)
    );
\gpr1.dout_i[121]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_120_122,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_120_122,
      O => p_0_out(121)
    );
\gpr1.dout_i[122]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_120_122,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_120_122,
      O => p_0_out(122)
    );
\gpr1.dout_i[123]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_123_125,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_123_125,
      O => p_0_out(123)
    );
\gpr1.dout_i[124]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_123_125,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_123_125,
      O => p_0_out(124)
    );
\gpr1.dout_i[125]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_123_125,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_123_125,
      O => p_0_out(125)
    );
\gpr1.dout_i[126]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_126_128,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_126_128,
      O => p_0_out(126)
    );
\gpr1.dout_i[127]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_126_128,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_126_128,
      O => p_0_out(127)
    );
\gpr1.dout_i[128]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_126_128,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_126_128,
      O => p_0_out(128)
    );
\gpr1.dout_i[129]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_129_131,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_129_131,
      O => p_0_out(129)
    );
\gpr1.dout_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_12_14,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_12_14,
      O => p_0_out(12)
    );
\gpr1.dout_i[130]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_129_131,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_129_131,
      O => p_0_out(130)
    );
\gpr1.dout_i[131]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_129_131,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_129_131,
      O => p_0_out(131)
    );
\gpr1.dout_i[132]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_132_134,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_132_134,
      O => p_0_out(132)
    );
\gpr1.dout_i[133]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_132_134,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_132_134,
      O => p_0_out(133)
    );
\gpr1.dout_i[134]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_132_134,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_132_134,
      O => p_0_out(134)
    );
\gpr1.dout_i[135]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_135_137,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_135_137,
      O => p_0_out(135)
    );
\gpr1.dout_i[136]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_135_137,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_135_137,
      O => p_0_out(136)
    );
\gpr1.dout_i[137]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_135_137,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_135_137,
      O => p_0_out(137)
    );
\gpr1.dout_i[138]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_138_140,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_138_140,
      O => p_0_out(138)
    );
\gpr1.dout_i[139]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_138_140,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_138_140,
      O => p_0_out(139)
    );
\gpr1.dout_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_12_14,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_12_14,
      O => p_0_out(13)
    );
\gpr1.dout_i[140]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_138_140,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_138_140,
      O => p_0_out(140)
    );
\gpr1.dout_i[141]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_141_143,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_141_143,
      O => p_0_out(141)
    );
\gpr1.dout_i[142]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_141_143,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_141_143,
      O => p_0_out(142)
    );
\gpr1.dout_i[143]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_141_143,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_141_143,
      O => p_0_out(143)
    );
\gpr1.dout_i[144]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_144_146,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_144_146,
      O => p_0_out(144)
    );
\gpr1.dout_i[145]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_144_146,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_144_146,
      O => p_0_out(145)
    );
\gpr1.dout_i[146]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_144_146,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_144_146,
      O => p_0_out(146)
    );
\gpr1.dout_i[147]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_147_149,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_147_149,
      O => p_0_out(147)
    );
\gpr1.dout_i[148]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_147_149,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_147_149,
      O => p_0_out(148)
    );
\gpr1.dout_i[149]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_147_149,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_147_149,
      O => p_0_out(149)
    );
\gpr1.dout_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_12_14,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_12_14,
      O => p_0_out(14)
    );
\gpr1.dout_i[150]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_150_152,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_150_152,
      O => p_0_out(150)
    );
\gpr1.dout_i[151]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_150_152,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_150_152,
      O => p_0_out(151)
    );
\gpr1.dout_i[152]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_150_152,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_150_152,
      O => p_0_out(152)
    );
\gpr1.dout_i[153]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_153_155,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_153_155,
      O => p_0_out(153)
    );
\gpr1.dout_i[154]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_153_155,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_153_155,
      O => p_0_out(154)
    );
\gpr1.dout_i[155]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_153_155,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_153_155,
      O => p_0_out(155)
    );
\gpr1.dout_i[156]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_156_158,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_156_158,
      O => p_0_out(156)
    );
\gpr1.dout_i[157]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_156_158,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_156_158,
      O => p_0_out(157)
    );
\gpr1.dout_i[158]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_156_158,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_156_158,
      O => p_0_out(158)
    );
\gpr1.dout_i[159]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_159_161,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_159_161,
      O => p_0_out(159)
    );
\gpr1.dout_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_15_17,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_15_17,
      O => p_0_out(15)
    );
\gpr1.dout_i[160]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_159_161,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_159_161,
      O => p_0_out(160)
    );
\gpr1.dout_i[161]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_159_161,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_159_161,
      O => p_0_out(161)
    );
\gpr1.dout_i[162]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_162_164,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_162_164,
      O => p_0_out(162)
    );
\gpr1.dout_i[163]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_162_164,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_162_164,
      O => p_0_out(163)
    );
\gpr1.dout_i[164]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_162_164,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_162_164,
      O => p_0_out(164)
    );
\gpr1.dout_i[165]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_165_167,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_165_167,
      O => p_0_out(165)
    );
\gpr1.dout_i[166]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_165_167,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_165_167,
      O => p_0_out(166)
    );
\gpr1.dout_i[167]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_165_167,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_165_167,
      O => p_0_out(167)
    );
\gpr1.dout_i[168]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_168_170,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_168_170,
      O => p_0_out(168)
    );
\gpr1.dout_i[169]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_168_170,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_168_170,
      O => p_0_out(169)
    );
\gpr1.dout_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_15_17,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_15_17,
      O => p_0_out(16)
    );
\gpr1.dout_i[170]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_168_170,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_168_170,
      O => p_0_out(170)
    );
\gpr1.dout_i[171]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_171_173,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_171_173,
      O => p_0_out(171)
    );
\gpr1.dout_i[172]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_171_173,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_171_173,
      O => p_0_out(172)
    );
\gpr1.dout_i[173]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_171_173,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_171_173,
      O => p_0_out(173)
    );
\gpr1.dout_i[174]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_174_176,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_174_176,
      O => p_0_out(174)
    );
\gpr1.dout_i[175]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_174_176,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_174_176,
      O => p_0_out(175)
    );
\gpr1.dout_i[176]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_174_176,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_174_176,
      O => p_0_out(176)
    );
\gpr1.dout_i[177]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_177_179,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_177_179,
      O => p_0_out(177)
    );
\gpr1.dout_i[178]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_177_179,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_177_179,
      O => p_0_out(178)
    );
\gpr1.dout_i[179]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_177_179,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_177_179,
      O => p_0_out(179)
    );
\gpr1.dout_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_15_17,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_15_17,
      O => p_0_out(17)
    );
\gpr1.dout_i[180]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_180_182,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_180_182,
      O => p_0_out(180)
    );
\gpr1.dout_i[181]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_180_182,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_180_182,
      O => p_0_out(181)
    );
\gpr1.dout_i[182]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_180_182,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_180_182,
      O => p_0_out(182)
    );
\gpr1.dout_i[183]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_183_185,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_183_185,
      O => p_0_out(183)
    );
\gpr1.dout_i[184]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_183_185,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_183_185,
      O => p_0_out(184)
    );
\gpr1.dout_i[185]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_183_185,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_183_185,
      O => p_0_out(185)
    );
\gpr1.dout_i[186]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_186_188,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_186_188,
      O => p_0_out(186)
    );
\gpr1.dout_i[187]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_186_188,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_186_188,
      O => p_0_out(187)
    );
\gpr1.dout_i[188]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_186_188,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_186_188,
      O => p_0_out(188)
    );
\gpr1.dout_i[189]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_189_191,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_189_191,
      O => p_0_out(189)
    );
\gpr1.dout_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_18_20,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_18_20,
      O => p_0_out(18)
    );
\gpr1.dout_i[190]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_189_191,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_189_191,
      O => p_0_out(190)
    );
\gpr1.dout_i[191]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_189_191,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_189_191,
      O => p_0_out(191)
    );
\gpr1.dout_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_18_20,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_18_20,
      O => p_0_out(19)
    );
\gpr1.dout_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_0_2,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_0_2,
      O => p_0_out(1)
    );
\gpr1.dout_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_18_20,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_18_20,
      O => p_0_out(20)
    );
\gpr1.dout_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_21_23,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_21_23,
      O => p_0_out(21)
    );
\gpr1.dout_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_21_23,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_21_23,
      O => p_0_out(22)
    );
\gpr1.dout_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_21_23,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_21_23,
      O => p_0_out(23)
    );
\gpr1.dout_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_24_26,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_24_26,
      O => p_0_out(24)
    );
\gpr1.dout_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_24_26,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_24_26,
      O => p_0_out(25)
    );
\gpr1.dout_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_24_26,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_24_26,
      O => p_0_out(26)
    );
\gpr1.dout_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_27_29,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_27_29,
      O => p_0_out(27)
    );
\gpr1.dout_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_27_29,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_27_29,
      O => p_0_out(28)
    );
\gpr1.dout_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_27_29,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_27_29,
      O => p_0_out(29)
    );
\gpr1.dout_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_0_2,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_0_2,
      O => p_0_out(2)
    );
\gpr1.dout_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_30_32,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_30_32,
      O => p_0_out(30)
    );
\gpr1.dout_i[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_30_32,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_30_32,
      O => p_0_out(31)
    );
\gpr1.dout_i[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_30_32,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_30_32,
      O => p_0_out(32)
    );
\gpr1.dout_i[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_33_35,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_33_35,
      O => p_0_out(33)
    );
\gpr1.dout_i[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_33_35,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_33_35,
      O => p_0_out(34)
    );
\gpr1.dout_i[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_33_35,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_33_35,
      O => p_0_out(35)
    );
\gpr1.dout_i[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_36_38,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_36_38,
      O => p_0_out(36)
    );
\gpr1.dout_i[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_36_38,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_36_38,
      O => p_0_out(37)
    );
\gpr1.dout_i[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_36_38,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_36_38,
      O => p_0_out(38)
    );
\gpr1.dout_i[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_39_41,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_39_41,
      O => p_0_out(39)
    );
\gpr1.dout_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_3_5,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_3_5,
      O => p_0_out(3)
    );
\gpr1.dout_i[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_39_41,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_39_41,
      O => p_0_out(40)
    );
\gpr1.dout_i[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_39_41,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_39_41,
      O => p_0_out(41)
    );
\gpr1.dout_i[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_42_44,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_42_44,
      O => p_0_out(42)
    );
\gpr1.dout_i[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_42_44,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_42_44,
      O => p_0_out(43)
    );
\gpr1.dout_i[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_42_44,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_42_44,
      O => p_0_out(44)
    );
\gpr1.dout_i[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_45_47,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_45_47,
      O => p_0_out(45)
    );
\gpr1.dout_i[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_45_47,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_45_47,
      O => p_0_out(46)
    );
\gpr1.dout_i[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_45_47,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_45_47,
      O => p_0_out(47)
    );
\gpr1.dout_i[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_48_50,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_48_50,
      O => p_0_out(48)
    );
\gpr1.dout_i[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_48_50,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_48_50,
      O => p_0_out(49)
    );
\gpr1.dout_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_3_5,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_3_5,
      O => p_0_out(4)
    );
\gpr1.dout_i[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_48_50,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_48_50,
      O => p_0_out(50)
    );
\gpr1.dout_i[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_51_53,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_51_53,
      O => p_0_out(51)
    );
\gpr1.dout_i[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_51_53,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_51_53,
      O => p_0_out(52)
    );
\gpr1.dout_i[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_51_53,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_51_53,
      O => p_0_out(53)
    );
\gpr1.dout_i[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_54_56,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_54_56,
      O => p_0_out(54)
    );
\gpr1.dout_i[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_54_56,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_54_56,
      O => p_0_out(55)
    );
\gpr1.dout_i[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_54_56,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_54_56,
      O => p_0_out(56)
    );
\gpr1.dout_i[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_57_59,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_57_59,
      O => p_0_out(57)
    );
\gpr1.dout_i[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_57_59,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_57_59,
      O => p_0_out(58)
    );
\gpr1.dout_i[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_57_59,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_57_59,
      O => p_0_out(59)
    );
\gpr1.dout_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_3_5,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_3_5,
      O => p_0_out(5)
    );
\gpr1.dout_i[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_60_62,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_60_62,
      O => p_0_out(60)
    );
\gpr1.dout_i[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_60_62,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_60_62,
      O => p_0_out(61)
    );
\gpr1.dout_i[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_60_62,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_60_62,
      O => p_0_out(62)
    );
\gpr1.dout_i[63]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_63_65,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_63_65,
      O => p_0_out(63)
    );
\gpr1.dout_i[64]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_63_65,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_63_65,
      O => p_0_out(64)
    );
\gpr1.dout_i[65]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_63_65,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_63_65,
      O => p_0_out(65)
    );
\gpr1.dout_i[66]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_66_68,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_66_68,
      O => p_0_out(66)
    );
\gpr1.dout_i[67]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_66_68,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_66_68,
      O => p_0_out(67)
    );
\gpr1.dout_i[68]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_66_68,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_66_68,
      O => p_0_out(68)
    );
\gpr1.dout_i[69]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_69_71,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_69_71,
      O => p_0_out(69)
    );
\gpr1.dout_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_6_8,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_6_8,
      O => p_0_out(6)
    );
\gpr1.dout_i[70]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_69_71,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_69_71,
      O => p_0_out(70)
    );
\gpr1.dout_i[71]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_69_71,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_69_71,
      O => p_0_out(71)
    );
\gpr1.dout_i[72]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_72_74,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_72_74,
      O => p_0_out(72)
    );
\gpr1.dout_i[73]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_72_74,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_72_74,
      O => p_0_out(73)
    );
\gpr1.dout_i[74]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_72_74,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_72_74,
      O => p_0_out(74)
    );
\gpr1.dout_i[75]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_75_77,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_75_77,
      O => p_0_out(75)
    );
\gpr1.dout_i[76]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_75_77,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_75_77,
      O => p_0_out(76)
    );
\gpr1.dout_i[77]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_75_77,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_75_77,
      O => p_0_out(77)
    );
\gpr1.dout_i[78]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_78_80,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_78_80,
      O => p_0_out(78)
    );
\gpr1.dout_i[79]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_78_80,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_78_80,
      O => p_0_out(79)
    );
\gpr1.dout_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_6_8,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_6_8,
      O => p_0_out(7)
    );
\gpr1.dout_i[80]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_78_80,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_78_80,
      O => p_0_out(80)
    );
\gpr1.dout_i[81]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_81_83,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_81_83,
      O => p_0_out(81)
    );
\gpr1.dout_i[82]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_81_83,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_81_83,
      O => p_0_out(82)
    );
\gpr1.dout_i[83]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_81_83,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_81_83,
      O => p_0_out(83)
    );
\gpr1.dout_i[84]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_84_86,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_84_86,
      O => p_0_out(84)
    );
\gpr1.dout_i[85]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_84_86,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_84_86,
      O => p_0_out(85)
    );
\gpr1.dout_i[86]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_84_86,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_84_86,
      O => p_0_out(86)
    );
\gpr1.dout_i[87]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_87_89,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_87_89,
      O => p_0_out(87)
    );
\gpr1.dout_i[88]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_87_89,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_87_89,
      O => p_0_out(88)
    );
\gpr1.dout_i[89]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_87_89,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_87_89,
      O => p_0_out(89)
    );
\gpr1.dout_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_6_8,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_6_8,
      O => p_0_out(8)
    );
\gpr1.dout_i[90]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_90_92,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_90_92,
      O => p_0_out(90)
    );
\gpr1.dout_i[91]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_90_92,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_90_92,
      O => p_0_out(91)
    );
\gpr1.dout_i[92]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_90_92,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_90_92,
      O => p_0_out(92)
    );
\gpr1.dout_i[93]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_93_95,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_93_95,
      O => p_0_out(93)
    );
\gpr1.dout_i[94]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_93_95,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_93_95,
      O => p_0_out(94)
    );
\gpr1.dout_i[95]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_93_95,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_93_95,
      O => p_0_out(95)
    );
\gpr1.dout_i[96]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_96_98,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_96_98,
      O => p_0_out(96)
    );
\gpr1.dout_i[97]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_1_RAM_reg_64_127_96_98,
      I1 => O2(6),
      I2 => n_1_RAM_reg_0_63_96_98,
      O => p_0_out(97)
    );
\gpr1.dout_i[98]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_2_RAM_reg_64_127_96_98,
      I1 => O2(6),
      I2 => n_2_RAM_reg_0_63_96_98,
      O => p_0_out(98)
    );
\gpr1.dout_i[99]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_99_101,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_99_101,
      O => p_0_out(99)
    );
\gpr1.dout_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => n_0_RAM_reg_64_127_9_11,
      I1 => O2(6),
      I2 => n_0_RAM_reg_0_63_9_11,
      O => p_0_out(9)
    );
\gpr1.dout_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(0),
      Q => dout(0)
    );
\gpr1.dout_i_reg[100]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(100),
      Q => dout(100)
    );
\gpr1.dout_i_reg[101]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(101),
      Q => dout(101)
    );
\gpr1.dout_i_reg[102]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(102),
      Q => dout(102)
    );
\gpr1.dout_i_reg[103]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(103),
      Q => dout(103)
    );
\gpr1.dout_i_reg[104]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(104),
      Q => dout(104)
    );
\gpr1.dout_i_reg[105]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(105),
      Q => dout(105)
    );
\gpr1.dout_i_reg[106]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(106),
      Q => dout(106)
    );
\gpr1.dout_i_reg[107]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(107),
      Q => dout(107)
    );
\gpr1.dout_i_reg[108]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(108),
      Q => dout(108)
    );
\gpr1.dout_i_reg[109]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(109),
      Q => dout(109)
    );
\gpr1.dout_i_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(10),
      Q => dout(10)
    );
\gpr1.dout_i_reg[110]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(110),
      Q => dout(110)
    );
\gpr1.dout_i_reg[111]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(111),
      Q => dout(111)
    );
\gpr1.dout_i_reg[112]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(112),
      Q => dout(112)
    );
\gpr1.dout_i_reg[113]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(113),
      Q => dout(113)
    );
\gpr1.dout_i_reg[114]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(114),
      Q => dout(114)
    );
\gpr1.dout_i_reg[115]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(115),
      Q => dout(115)
    );
\gpr1.dout_i_reg[116]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(116),
      Q => dout(116)
    );
\gpr1.dout_i_reg[117]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(117),
      Q => dout(117)
    );
\gpr1.dout_i_reg[118]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(118),
      Q => dout(118)
    );
\gpr1.dout_i_reg[119]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(119),
      Q => dout(119)
    );
\gpr1.dout_i_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(11),
      Q => dout(11)
    );
\gpr1.dout_i_reg[120]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(120),
      Q => dout(120)
    );
\gpr1.dout_i_reg[121]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(121),
      Q => dout(121)
    );
\gpr1.dout_i_reg[122]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(122),
      Q => dout(122)
    );
\gpr1.dout_i_reg[123]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(123),
      Q => dout(123)
    );
\gpr1.dout_i_reg[124]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(124),
      Q => dout(124)
    );
\gpr1.dout_i_reg[125]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(125),
      Q => dout(125)
    );
\gpr1.dout_i_reg[126]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(126),
      Q => dout(126)
    );
\gpr1.dout_i_reg[127]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(127),
      Q => dout(127)
    );
\gpr1.dout_i_reg[128]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(128),
      Q => dout(128)
    );
\gpr1.dout_i_reg[129]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(129),
      Q => dout(129)
    );
\gpr1.dout_i_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(12),
      Q => dout(12)
    );
\gpr1.dout_i_reg[130]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(130),
      Q => dout(130)
    );
\gpr1.dout_i_reg[131]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(131),
      Q => dout(131)
    );
\gpr1.dout_i_reg[132]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(132),
      Q => dout(132)
    );
\gpr1.dout_i_reg[133]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(133),
      Q => dout(133)
    );
\gpr1.dout_i_reg[134]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(134),
      Q => dout(134)
    );
\gpr1.dout_i_reg[135]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(135),
      Q => dout(135)
    );
\gpr1.dout_i_reg[136]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(136),
      Q => dout(136)
    );
\gpr1.dout_i_reg[137]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(137),
      Q => dout(137)
    );
\gpr1.dout_i_reg[138]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(138),
      Q => dout(138)
    );
\gpr1.dout_i_reg[139]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(139),
      Q => dout(139)
    );
\gpr1.dout_i_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(13),
      Q => dout(13)
    );
\gpr1.dout_i_reg[140]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(140),
      Q => dout(140)
    );
\gpr1.dout_i_reg[141]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(141),
      Q => dout(141)
    );
\gpr1.dout_i_reg[142]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(142),
      Q => dout(142)
    );
\gpr1.dout_i_reg[143]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(143),
      Q => dout(143)
    );
\gpr1.dout_i_reg[144]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(144),
      Q => dout(144)
    );
\gpr1.dout_i_reg[145]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(145),
      Q => dout(145)
    );
\gpr1.dout_i_reg[146]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(146),
      Q => dout(146)
    );
\gpr1.dout_i_reg[147]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(147),
      Q => dout(147)
    );
\gpr1.dout_i_reg[148]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(148),
      Q => dout(148)
    );
\gpr1.dout_i_reg[149]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(149),
      Q => dout(149)
    );
\gpr1.dout_i_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(14),
      Q => dout(14)
    );
\gpr1.dout_i_reg[150]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(150),
      Q => dout(150)
    );
\gpr1.dout_i_reg[151]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(151),
      Q => dout(151)
    );
\gpr1.dout_i_reg[152]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(152),
      Q => dout(152)
    );
\gpr1.dout_i_reg[153]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(153),
      Q => dout(153)
    );
\gpr1.dout_i_reg[154]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(154),
      Q => dout(154)
    );
\gpr1.dout_i_reg[155]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(155),
      Q => dout(155)
    );
\gpr1.dout_i_reg[156]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(156),
      Q => dout(156)
    );
\gpr1.dout_i_reg[157]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(157),
      Q => dout(157)
    );
\gpr1.dout_i_reg[158]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(158),
      Q => dout(158)
    );
\gpr1.dout_i_reg[159]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(159),
      Q => dout(159)
    );
\gpr1.dout_i_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(15),
      Q => dout(15)
    );
\gpr1.dout_i_reg[160]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(160),
      Q => dout(160)
    );
\gpr1.dout_i_reg[161]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(161),
      Q => dout(161)
    );
\gpr1.dout_i_reg[162]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(162),
      Q => dout(162)
    );
\gpr1.dout_i_reg[163]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(163),
      Q => dout(163)
    );
\gpr1.dout_i_reg[164]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(164),
      Q => dout(164)
    );
\gpr1.dout_i_reg[165]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(165),
      Q => dout(165)
    );
\gpr1.dout_i_reg[166]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(166),
      Q => dout(166)
    );
\gpr1.dout_i_reg[167]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(167),
      Q => dout(167)
    );
\gpr1.dout_i_reg[168]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(168),
      Q => dout(168)
    );
\gpr1.dout_i_reg[169]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(169),
      Q => dout(169)
    );
\gpr1.dout_i_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(16),
      Q => dout(16)
    );
\gpr1.dout_i_reg[170]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(170),
      Q => dout(170)
    );
\gpr1.dout_i_reg[171]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(171),
      Q => dout(171)
    );
\gpr1.dout_i_reg[172]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(172),
      Q => dout(172)
    );
\gpr1.dout_i_reg[173]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(173),
      Q => dout(173)
    );
\gpr1.dout_i_reg[174]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(174),
      Q => dout(174)
    );
\gpr1.dout_i_reg[175]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(175),
      Q => dout(175)
    );
\gpr1.dout_i_reg[176]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(176),
      Q => dout(176)
    );
\gpr1.dout_i_reg[177]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(177),
      Q => dout(177)
    );
\gpr1.dout_i_reg[178]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(178),
      Q => dout(178)
    );
\gpr1.dout_i_reg[179]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(179),
      Q => dout(179)
    );
\gpr1.dout_i_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(17),
      Q => dout(17)
    );
\gpr1.dout_i_reg[180]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(180),
      Q => dout(180)
    );
\gpr1.dout_i_reg[181]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(181),
      Q => dout(181)
    );
\gpr1.dout_i_reg[182]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(182),
      Q => dout(182)
    );
\gpr1.dout_i_reg[183]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(183),
      Q => dout(183)
    );
\gpr1.dout_i_reg[184]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(184),
      Q => dout(184)
    );
\gpr1.dout_i_reg[185]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(185),
      Q => dout(185)
    );
\gpr1.dout_i_reg[186]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(186),
      Q => dout(186)
    );
\gpr1.dout_i_reg[187]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(187),
      Q => dout(187)
    );
\gpr1.dout_i_reg[188]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(188),
      Q => dout(188)
    );
\gpr1.dout_i_reg[189]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(189),
      Q => dout(189)
    );
\gpr1.dout_i_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(18),
      Q => dout(18)
    );
\gpr1.dout_i_reg[190]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(190),
      Q => dout(190)
    );
\gpr1.dout_i_reg[191]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(191),
      Q => dout(191)
    );
\gpr1.dout_i_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(19),
      Q => dout(19)
    );
\gpr1.dout_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(1),
      Q => dout(1)
    );
\gpr1.dout_i_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(20),
      Q => dout(20)
    );
\gpr1.dout_i_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(21),
      Q => dout(21)
    );
\gpr1.dout_i_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(22),
      Q => dout(22)
    );
\gpr1.dout_i_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(23),
      Q => dout(23)
    );
\gpr1.dout_i_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(24),
      Q => dout(24)
    );
\gpr1.dout_i_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(25),
      Q => dout(25)
    );
\gpr1.dout_i_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(26),
      Q => dout(26)
    );
\gpr1.dout_i_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(27),
      Q => dout(27)
    );
\gpr1.dout_i_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(28),
      Q => dout(28)
    );
\gpr1.dout_i_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(29),
      Q => dout(29)
    );
\gpr1.dout_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(2),
      Q => dout(2)
    );
\gpr1.dout_i_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(30),
      Q => dout(30)
    );
\gpr1.dout_i_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(31),
      Q => dout(31)
    );
\gpr1.dout_i_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(32),
      Q => dout(32)
    );
\gpr1.dout_i_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(33),
      Q => dout(33)
    );
\gpr1.dout_i_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(34),
      Q => dout(34)
    );
\gpr1.dout_i_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(35),
      Q => dout(35)
    );
\gpr1.dout_i_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(36),
      Q => dout(36)
    );
\gpr1.dout_i_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(37),
      Q => dout(37)
    );
\gpr1.dout_i_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(38),
      Q => dout(38)
    );
\gpr1.dout_i_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(39),
      Q => dout(39)
    );
\gpr1.dout_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(3),
      Q => dout(3)
    );
\gpr1.dout_i_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(40),
      Q => dout(40)
    );
\gpr1.dout_i_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(41),
      Q => dout(41)
    );
\gpr1.dout_i_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(42),
      Q => dout(42)
    );
\gpr1.dout_i_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(43),
      Q => dout(43)
    );
\gpr1.dout_i_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(44),
      Q => dout(44)
    );
\gpr1.dout_i_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(45),
      Q => dout(45)
    );
\gpr1.dout_i_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(46),
      Q => dout(46)
    );
\gpr1.dout_i_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(47),
      Q => dout(47)
    );
\gpr1.dout_i_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(48),
      Q => dout(48)
    );
\gpr1.dout_i_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(49),
      Q => dout(49)
    );
\gpr1.dout_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(4),
      Q => dout(4)
    );
\gpr1.dout_i_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(50),
      Q => dout(50)
    );
\gpr1.dout_i_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(51),
      Q => dout(51)
    );
\gpr1.dout_i_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(52),
      Q => dout(52)
    );
\gpr1.dout_i_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(53),
      Q => dout(53)
    );
\gpr1.dout_i_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(54),
      Q => dout(54)
    );
\gpr1.dout_i_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(55),
      Q => dout(55)
    );
\gpr1.dout_i_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(56),
      Q => dout(56)
    );
\gpr1.dout_i_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(57),
      Q => dout(57)
    );
\gpr1.dout_i_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(58),
      Q => dout(58)
    );
\gpr1.dout_i_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(59),
      Q => dout(59)
    );
\gpr1.dout_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(5),
      Q => dout(5)
    );
\gpr1.dout_i_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(60),
      Q => dout(60)
    );
\gpr1.dout_i_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(61),
      Q => dout(61)
    );
\gpr1.dout_i_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(62),
      Q => dout(62)
    );
\gpr1.dout_i_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(63),
      Q => dout(63)
    );
\gpr1.dout_i_reg[64]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(64),
      Q => dout(64)
    );
\gpr1.dout_i_reg[65]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(65),
      Q => dout(65)
    );
\gpr1.dout_i_reg[66]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(66),
      Q => dout(66)
    );
\gpr1.dout_i_reg[67]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(67),
      Q => dout(67)
    );
\gpr1.dout_i_reg[68]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(68),
      Q => dout(68)
    );
\gpr1.dout_i_reg[69]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(69),
      Q => dout(69)
    );
\gpr1.dout_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(6),
      Q => dout(6)
    );
\gpr1.dout_i_reg[70]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(70),
      Q => dout(70)
    );
\gpr1.dout_i_reg[71]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(71),
      Q => dout(71)
    );
\gpr1.dout_i_reg[72]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(72),
      Q => dout(72)
    );
\gpr1.dout_i_reg[73]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(73),
      Q => dout(73)
    );
\gpr1.dout_i_reg[74]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(74),
      Q => dout(74)
    );
\gpr1.dout_i_reg[75]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(75),
      Q => dout(75)
    );
\gpr1.dout_i_reg[76]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(76),
      Q => dout(76)
    );
\gpr1.dout_i_reg[77]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(77),
      Q => dout(77)
    );
\gpr1.dout_i_reg[78]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(78),
      Q => dout(78)
    );
\gpr1.dout_i_reg[79]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(79),
      Q => dout(79)
    );
\gpr1.dout_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(7),
      Q => dout(7)
    );
\gpr1.dout_i_reg[80]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(80),
      Q => dout(80)
    );
\gpr1.dout_i_reg[81]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(81),
      Q => dout(81)
    );
\gpr1.dout_i_reg[82]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(82),
      Q => dout(82)
    );
\gpr1.dout_i_reg[83]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(83),
      Q => dout(83)
    );
\gpr1.dout_i_reg[84]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(84),
      Q => dout(84)
    );
\gpr1.dout_i_reg[85]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(85),
      Q => dout(85)
    );
\gpr1.dout_i_reg[86]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(86),
      Q => dout(86)
    );
\gpr1.dout_i_reg[87]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(87),
      Q => dout(87)
    );
\gpr1.dout_i_reg[88]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(88),
      Q => dout(88)
    );
\gpr1.dout_i_reg[89]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(89),
      Q => dout(89)
    );
\gpr1.dout_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(8),
      Q => dout(8)
    );
\gpr1.dout_i_reg[90]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(90),
      Q => dout(90)
    );
\gpr1.dout_i_reg[91]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(91),
      Q => dout(91)
    );
\gpr1.dout_i_reg[92]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(92),
      Q => dout(92)
    );
\gpr1.dout_i_reg[93]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(93),
      Q => dout(93)
    );
\gpr1.dout_i_reg[94]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(94),
      Q => dout(94)
    );
\gpr1.dout_i_reg[95]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(95),
      Q => dout(95)
    );
\gpr1.dout_i_reg[96]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(96),
      Q => dout(96)
    );
\gpr1.dout_i_reg[97]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(97),
      Q => dout(97)
    );
\gpr1.dout_i_reg[98]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(98),
      Q => dout(98)
    );
\gpr1.dout_i_reg[99]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(99),
      Q => dout(99)
    );
\gpr1.dout_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => E(0),
      CLR => I3(0),
      D => p_0_out(9),
      Q => dout(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_rd_bin_cntr is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ADDRC : out STD_LOGIC_VECTOR ( 5 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_en : in STD_LOGIC;
    p_18_out : in STD_LOGIC;
    p_14_out : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_rd_bin_cntr : entity is "rd_bin_cntr";
end adcrx_async_fifo_rd_bin_cntr;

architecture STRUCTURE of adcrx_async_fifo_rd_bin_cntr is
  signal \n_0_gc0.count[6]_i_2\ : STD_LOGIC;
  signal n_0_ram_empty_i_i_5 : STD_LOGIC;
  signal n_0_ram_empty_i_i_6 : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gc0.count[6]_i_2\ : label is "soft_lutpair11";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[0]\ : label is "gc0.count_d1_reg[0]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[0]_rep\ : label is "gc0.count_d1_reg[0]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[0]_rep__0\ : label is "gc0.count_d1_reg[0]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[1]\ : label is "gc0.count_d1_reg[1]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[1]_rep\ : label is "gc0.count_d1_reg[1]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[1]_rep__0\ : label is "gc0.count_d1_reg[1]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[2]\ : label is "gc0.count_d1_reg[2]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[2]_rep\ : label is "gc0.count_d1_reg[2]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[2]_rep__0\ : label is "gc0.count_d1_reg[2]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[3]\ : label is "gc0.count_d1_reg[3]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[3]_rep\ : label is "gc0.count_d1_reg[3]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[3]_rep__0\ : label is "gc0.count_d1_reg[3]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[4]\ : label is "gc0.count_d1_reg[4]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[4]_rep\ : label is "gc0.count_d1_reg[4]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[4]_rep__0\ : label is "gc0.count_d1_reg[4]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[5]\ : label is "gc0.count_d1_reg[5]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[5]_rep\ : label is "gc0.count_d1_reg[5]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[5]_rep__0\ : label is "gc0.count_d1_reg[5]";
begin
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => rd_pntr_plus1(0),
      O => \plusOp__0\(0)
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => rd_pntr_plus1(0),
      I1 => rd_pntr_plus1(1),
      O => \plusOp__0\(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => rd_pntr_plus1(2),
      I1 => rd_pntr_plus1(1),
      I2 => rd_pntr_plus1(0),
      O => \plusOp__0\(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => rd_pntr_plus1(3),
      I1 => rd_pntr_plus1(0),
      I2 => rd_pntr_plus1(1),
      I3 => rd_pntr_plus1(2),
      O => \plusOp__0\(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => rd_pntr_plus1(4),
      I1 => rd_pntr_plus1(2),
      I2 => rd_pntr_plus1(1),
      I3 => rd_pntr_plus1(0),
      I4 => rd_pntr_plus1(3),
      O => \plusOp__0\(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => rd_pntr_plus1(5),
      I1 => rd_pntr_plus1(3),
      I2 => rd_pntr_plus1(0),
      I3 => rd_pntr_plus1(1),
      I4 => rd_pntr_plus1(2),
      I5 => rd_pntr_plus1(4),
      O => \plusOp__0\(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => rd_pntr_plus1(6),
      I1 => \n_0_gc0.count[6]_i_2\,
      I2 => rd_pntr_plus1(5),
      O => \plusOp__0\(6)
    );
\gc0.count[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => rd_pntr_plus1(4),
      I1 => rd_pntr_plus1(2),
      I2 => rd_pntr_plus1(1),
      I3 => rd_pntr_plus1(0),
      I4 => rd_pntr_plus1(3),
      O => \n_0_gc0.count[6]_i_2\
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(0),
      Q => O2(0)
    );
\gc0.count_d1_reg[0]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(0),
      Q => ADDRC(0)
    );
\gc0.count_d1_reg[0]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(0),
      Q => O3(0)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(1),
      Q => O2(1)
    );
\gc0.count_d1_reg[1]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(1),
      Q => ADDRC(1)
    );
\gc0.count_d1_reg[1]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(1),
      Q => O3(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(2),
      Q => O2(2)
    );
\gc0.count_d1_reg[2]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(2),
      Q => ADDRC(2)
    );
\gc0.count_d1_reg[2]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(2),
      Q => O3(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(3),
      Q => O2(3)
    );
\gc0.count_d1_reg[3]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(3),
      Q => ADDRC(3)
    );
\gc0.count_d1_reg[3]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(3),
      Q => O3(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(4),
      Q => O2(4)
    );
\gc0.count_d1_reg[4]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(4),
      Q => ADDRC(4)
    );
\gc0.count_d1_reg[4]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(4),
      Q => O3(4)
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(5),
      Q => O2(5)
    );
\gc0.count_d1_reg[5]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(5),
      Q => ADDRC(5)
    );
\gc0.count_d1_reg[5]_rep__0\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(5),
      Q => O3(5)
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => rd_pntr_plus1(6),
      Q => O2(6)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      D => \plusOp__0\(0),
      PRE => Q(0),
      Q => rd_pntr_plus1(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(1),
      Q => rd_pntr_plus1(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(2),
      Q => rd_pntr_plus1(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(3),
      Q => rd_pntr_plus1(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(4),
      Q => rd_pntr_plus1(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(5),
      Q => rd_pntr_plus1(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => p_14_out,
      CLR => Q(0),
      D => \plusOp__0\(6),
      Q => rd_pntr_plus1(6)
    );
ram_empty_i_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000000000"
    )
    port map (
      I0 => rd_pntr_plus1(1),
      I1 => WR_PNTR_RD(1),
      I2 => rd_pntr_plus1(0),
      I3 => WR_PNTR_RD(0),
      I4 => n_0_ram_empty_i_i_5,
      I5 => n_0_ram_empty_i_i_6,
      O => O1
    );
ram_empty_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0090000000000090"
    )
    port map (
      I0 => rd_pntr_plus1(4),
      I1 => WR_PNTR_RD(4),
      I2 => rd_en,
      I3 => p_18_out,
      I4 => WR_PNTR_RD(6),
      I5 => rd_pntr_plus1(6),
      O => n_0_ram_empty_i_i_5
    );
ram_empty_i_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => rd_pntr_plus1(5),
      I1 => WR_PNTR_RD(5),
      I2 => rd_pntr_plus1(3),
      I3 => WR_PNTR_RD(3),
      I4 => WR_PNTR_RD(2),
      I5 => rd_pntr_plus1(2),
      O => n_0_ram_empty_i_i_6
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_rd_pe_as is
  port (
    prog_empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_18_out : in STD_LOGIC;
    adjusted_wr_pntr_rd_pad : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_rd_pe_as : entity is "rd_pe_as";
end adcrx_async_fifo_rd_pe_as;

architecture STRUCTURE of adcrx_async_fifo_rd_pe_as is
  signal diff_pntr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \n_0_gdiff.diff_pntr_pad_reg[3]_i_1\ : STD_LOGIC;
  signal \n_0_gpe2.prog_empty_i_i_1\ : STD_LOGIC;
  signal \n_0_gpe2.prog_empty_i_i_2\ : STD_LOGIC;
  signal \n_1_gdiff.diff_pntr_pad_reg[3]_i_1\ : STD_LOGIC;
  signal \n_1_gdiff.diff_pntr_pad_reg[7]_i_1\ : STD_LOGIC;
  signal \n_2_gdiff.diff_pntr_pad_reg[3]_i_1\ : STD_LOGIC;
  signal \n_2_gdiff.diff_pntr_pad_reg[7]_i_1\ : STD_LOGIC;
  signal \n_3_gdiff.diff_pntr_pad_reg[3]_i_1\ : STD_LOGIC;
  signal \n_3_gdiff.diff_pntr_pad_reg[7]_i_1\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^prog_empty\ : STD_LOGIC;
  signal \NLW_gdiff.diff_pntr_pad_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  prog_empty <= \^prog_empty\;
\gdiff.diff_pntr_pad_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(1),
      Q => diff_pntr(0)
    );
\gdiff.diff_pntr_pad_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(2),
      Q => diff_pntr(1)
    );
\gdiff.diff_pntr_pad_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(3),
      Q => diff_pntr(2)
    );
\gdiff.diff_pntr_pad_reg[3]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gdiff.diff_pntr_pad_reg[3]_i_1\,
      CO(2) => \n_1_gdiff.diff_pntr_pad_reg[3]_i_1\,
      CO(1) => \n_2_gdiff.diff_pntr_pad_reg[3]_i_1\,
      CO(0) => \n_3_gdiff.diff_pntr_pad_reg[3]_i_1\,
      CYINIT => '0',
      DI(3 downto 0) => adjusted_wr_pntr_rd_pad(3 downto 0),
      O(3 downto 0) => plusOp(3 downto 0),
      S(3 downto 1) => I2(2 downto 0),
      S(0) => '0'
    );
\gdiff.diff_pntr_pad_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(4),
      Q => diff_pntr(3)
    );
\gdiff.diff_pntr_pad_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(5),
      Q => diff_pntr(4)
    );
\gdiff.diff_pntr_pad_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(6),
      Q => diff_pntr(5)
    );
\gdiff.diff_pntr_pad_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => plusOp(7),
      Q => diff_pntr(6)
    );
\gdiff.diff_pntr_pad_reg[7]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gdiff.diff_pntr_pad_reg[3]_i_1\,
      CO(3) => \NLW_gdiff.diff_pntr_pad_reg[7]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \n_1_gdiff.diff_pntr_pad_reg[7]_i_1\,
      CO(1) => \n_2_gdiff.diff_pntr_pad_reg[7]_i_1\,
      CO(0) => \n_3_gdiff.diff_pntr_pad_reg[7]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => adjusted_wr_pntr_rd_pad(6 downto 4),
      O(3 downto 0) => plusOp(7 downto 4),
      S(3 downto 0) => S(3 downto 0)
    );
\gpe2.prog_empty_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF010100000100"
    )
    port map (
      I0 => diff_pntr(4),
      I1 => diff_pntr(5),
      I2 => diff_pntr(6),
      I3 => \n_0_gpe2.prog_empty_i_i_2\,
      I4 => p_18_out,
      I5 => \^prog_empty\,
      O => \n_0_gpe2.prog_empty_i_i_1\
    );
\gpe2.prog_empty_i_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1555"
    )
    port map (
      I0 => diff_pntr(3),
      I1 => diff_pntr(2),
      I2 => diff_pntr(1),
      I3 => diff_pntr(0),
      O => \n_0_gpe2.prog_empty_i_i_2\
    );
\gpe2.prog_empty_i_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => \n_0_gpe2.prog_empty_i_i_1\,
      PRE => Q(0),
      Q => \^prog_empty\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_rd_status_flags_as is
  port (
    empty : out STD_LOGIC;
    p_18_out : out STD_LOGIC;
    adjusted_wr_pntr_rd_pad : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_14_out : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    I1 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_rd_status_flags_as : entity is "rd_status_flags_as";
end adcrx_async_fifo_rd_status_flags_as;

architecture STRUCTURE of adcrx_async_fifo_rd_status_flags_as is
  signal \^p_18_out\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count_d1[6]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gpr1.dout_i[191]_i_1\ : label is "soft_lutpair10";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_empty_i_reg : label is "no";
begin
  p_18_out <= \^p_18_out\;
\gc0.count_d1[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_en,
      I1 => \^p_18_out\,
      O => p_14_out
    );
\gdiff.diff_pntr_pad[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^p_18_out\,
      I1 => rd_en,
      O => adjusted_wr_pntr_rd_pad(0)
    );
\gpr1.dout_i[191]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_en,
      I1 => \^p_18_out\,
      O => E(0)
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => I1,
      PRE => Q(0),
      Q => \^p_18_out\
    );
ram_empty_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => I1,
      PRE => Q(0),
      Q => empty
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_reset_blk_ramfifo is
  port (
    rst_d2 : out STD_LOGIC;
    rst_full_gen_i : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_reset_blk_ramfifo : entity is "reset_blk_ramfifo";
end adcrx_async_fifo_reset_blk_ramfifo;

architecture STRUCTURE of adcrx_async_fifo_reset_blk_ramfifo is
  signal \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\ : STD_LOGIC;
  signal rd_rst_asreg : STD_LOGIC;
  signal rd_rst_asreg_d1 : STD_LOGIC;
  signal rd_rst_asreg_d2 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal \^rst_d2\ : STD_LOGIC;
  signal rst_d3 : STD_LOGIC;
  signal wr_rst_asreg : STD_LOGIC;
  signal wr_rst_asreg_d1 : STD_LOGIC;
  signal wr_rst_asreg_d2 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
  rst_d2 <= \^rst_d2\;
\grstd1.grst_full.grst_f.RST_FULL_GEN_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => rst,
      D => rst_d3,
      Q => rst_full_gen_i
    );
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => rst,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => rst_d1,
      PRE => rst,
      Q => \^rst_d2\
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => \^rst_d2\,
      PRE => rst,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => rd_rst_asreg,
      Q => rd_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => rd_rst_asreg_d1,
      Q => rd_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => rd_clk,
      CE => rd_rst_asreg_d1,
      D => '0',
      PRE => rst,
      Q => rd_rst_asreg
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(1)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => O1(2)
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => wr_rst_asreg,
      Q => wr_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => wr_rst_asreg_d1,
      Q => wr_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => wr_clk,
      CE => wr_rst_asreg_d1,
      D => '0',
      PRE => rst,
      Q => wr_rst_asreg
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => Q(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_clk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => I1(6),
      Q => Q(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff_0 is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_clk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff_0 : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff_0;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff_0 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I1(6),
      Q => Q(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff_1 is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_clk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff_1 : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff_1;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff_1 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(6),
      Q => Q(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff_2 is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_clk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff_2 : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff_2;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff_2 is
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
begin
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(0),
      Q => Q(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(1),
      Q => Q(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(2),
      Q => Q(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(3),
      Q => Q(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(4),
      Q => Q(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(5),
      Q => Q(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(6),
      Q => Q(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff_3 is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 6 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_clk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff_3 : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff_3;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff_3 is
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[5]\ : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_pntr_bin[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_bin[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_bin[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_pntr_bin[5]_i_1\ : label is "soft_lutpair1";
begin
  p_0_in(6 downto 0) <= \^p_0_in\(6 downto 0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(4),
      Q => \n_0_Q_reg_reg[4]\
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(5),
      Q => \n_0_Q_reg_reg[5]\
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => D(6),
      Q => \^p_0_in\(6)
    );
\wr_pntr_bin[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \^p_0_in\(3),
      O => \^p_0_in\(0)
    );
\wr_pntr_bin[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[3]\,
      I3 => \n_0_Q_reg_reg[5]\,
      I4 => \n_0_Q_reg_reg[4]\,
      I5 => \^p_0_in\(6),
      O => \^p_0_in\(1)
    );
\wr_pntr_bin[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \n_0_Q_reg_reg[5]\,
      I2 => \n_0_Q_reg_reg[4]\,
      I3 => \^p_0_in\(6),
      I4 => \n_0_Q_reg_reg[2]\,
      O => \^p_0_in\(2)
    );
\wr_pntr_bin[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \^p_0_in\(6),
      I1 => \n_0_Q_reg_reg[4]\,
      I2 => \n_0_Q_reg_reg[5]\,
      I3 => \n_0_Q_reg_reg[3]\,
      O => \^p_0_in\(3)
    );
\wr_pntr_bin[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \n_0_Q_reg_reg[4]\,
      I2 => \^p_0_in\(6),
      O => \^p_0_in\(4)
    );
\wr_pntr_bin[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \^p_0_in\(6),
      O => \^p_0_in\(5)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_synchronizer_ff_4 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_clk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_synchronizer_ff_4 : entity is "synchronizer_ff";
end adcrx_async_fifo_synchronizer_ff_4;

architecture STRUCTURE of adcrx_async_fifo_synchronizer_ff_4 is
  signal \^o1\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[5]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_bin[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rd_pntr_bin[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rd_pntr_bin[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rd_pntr_bin[5]_i_1\ : label is "soft_lutpair3";
begin
  O1(5 downto 0) <= \^o1\(5 downto 0);
  Q(0) <= \^q\(0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(4),
      Q => \n_0_Q_reg_reg[4]\
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(5),
      Q => \n_0_Q_reg_reg[5]\
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => D(6),
      Q => \^q\(0)
    );
\rd_pntr_bin[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \^o1\(3),
      O => \^o1\(0)
    );
\rd_pntr_bin[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \n_0_Q_reg_reg[3]\,
      I3 => \n_0_Q_reg_reg[5]\,
      I4 => \n_0_Q_reg_reg[4]\,
      I5 => \^q\(0),
      O => \^o1\(1)
    );
\rd_pntr_bin[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \n_0_Q_reg_reg[5]\,
      I2 => \n_0_Q_reg_reg[4]\,
      I3 => \^q\(0),
      I4 => \n_0_Q_reg_reg[2]\,
      O => \^o1\(2)
    );
\rd_pntr_bin[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \^q\(0),
      I1 => \n_0_Q_reg_reg[4]\,
      I2 => \n_0_Q_reg_reg[5]\,
      I3 => \n_0_Q_reg_reg[3]\,
      O => \^o1\(3)
    );
\rd_pntr_bin[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \n_0_Q_reg_reg[4]\,
      I2 => \^q\(0),
      O => \^o1\(4)
    );
\rd_pntr_bin[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[5]\,
      I1 => \^q\(0),
      O => \^o1\(5)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_wr_bin_cntr is
  port (
    O1 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_en : in STD_LOGIC;
    p_0_out : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_wr_bin_cntr : entity is "wr_bin_cntr";
end adcrx_async_fifo_wr_bin_cntr;

architecture STRUCTURE of adcrx_async_fifo_wr_bin_cntr is
  signal \^o4\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \n_0_gic0.gc0.count[6]_i_2\ : STD_LOGIC;
  signal n_0_ram_full_i_i_5 : STD_LOGIC;
  signal n_0_ram_full_i_i_6 : STD_LOGIC;
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gic0.gc0.count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gic0.gc0.count[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gic0.gc0.count[4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gic0.gc0.count[6]_i_2\ : label is "soft_lutpair14";
begin
  O4(6 downto 0) <= \^o4\(6 downto 0);
\gic0.gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      O => \plusOp__1\(0)
    );
\gic0.gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      O => \plusOp__1\(1)
    );
\gic0.gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(2),
      O => \plusOp__1\(2)
    );
\gic0.gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => wr_pntr_plus2(3),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(2),
      O => \plusOp__1\(3)
    );
\gic0.gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => wr_pntr_plus2(2),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(0),
      I4 => wr_pntr_plus2(3),
      O => \plusOp__1\(4)
    );
\gic0.gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => wr_pntr_plus2(5),
      I1 => wr_pntr_plus2(3),
      I2 => wr_pntr_plus2(0),
      I3 => wr_pntr_plus2(1),
      I4 => wr_pntr_plus2(2),
      I5 => wr_pntr_plus2(4),
      O => \plusOp__1\(5)
    );
\gic0.gc0.count[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => wr_pntr_plus2(4),
      I2 => \n_0_gic0.gc0.count[6]_i_2\,
      I3 => wr_pntr_plus2(3),
      I4 => wr_pntr_plus2(5),
      O => \plusOp__1\(6)
    );
\gic0.gc0.count[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(0),
      O => \n_0_gic0.gc0.count[6]_i_2\
    );
\gic0.gc0.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      D => wr_pntr_plus2(0),
      PRE => I1(0),
      Q => \^o4\(0)
    );
\gic0.gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(1),
      Q => \^o4\(1)
    );
\gic0.gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(2),
      Q => \^o4\(2)
    );
\gic0.gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(3),
      Q => \^o4\(3)
    );
\gic0.gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(4),
      Q => \^o4\(4)
    );
\gic0.gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(5),
      Q => \^o4\(5)
    );
\gic0.gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => wr_pntr_plus2(6),
      Q => \^o4\(6)
    );
\gic0.gc0.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(0),
      Q => Q(0)
    );
\gic0.gc0.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(1),
      Q => Q(1)
    );
\gic0.gc0.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(2),
      Q => Q(2)
    );
\gic0.gc0.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(3),
      Q => Q(3)
    );
\gic0.gc0.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(4),
      Q => Q(4)
    );
\gic0.gc0.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(5),
      Q => Q(5)
    );
\gic0.gc0.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \^o4\(6),
      Q => Q(6)
    );
\gic0.gc0.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(0),
      Q => wr_pntr_plus2(0)
    );
\gic0.gc0.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      D => \plusOp__1\(1),
      PRE => I1(0),
      Q => wr_pntr_plus2(1)
    );
\gic0.gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(2),
      Q => wr_pntr_plus2(2)
    );
\gic0.gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(3),
      Q => wr_pntr_plus2(3)
    );
\gic0.gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(4),
      Q => wr_pntr_plus2(4)
    );
\gic0.gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(5),
      Q => wr_pntr_plus2(5)
    );
\gic0.gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => E(0),
      CLR => I1(0),
      D => \plusOp__1\(6),
      Q => wr_pntr_plus2(6)
    );
ram_full_i_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000000000"
    )
    port map (
      I0 => wr_pntr_plus2(1),
      I1 => RD_PNTR_WR(1),
      I2 => wr_pntr_plus2(0),
      I3 => RD_PNTR_WR(0),
      I4 => n_0_ram_full_i_i_5,
      I5 => n_0_ram_full_i_i_6,
      O => O1
    );
ram_full_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0090000000000090"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => RD_PNTR_WR(4),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => RD_PNTR_WR(6),
      I5 => wr_pntr_plus2(6),
      O => n_0_ram_full_i_i_5
    );
ram_full_i_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => wr_pntr_plus2(5),
      I1 => RD_PNTR_WR(5),
      I2 => wr_pntr_plus2(3),
      I3 => RD_PNTR_WR(3),
      I4 => RD_PNTR_WR(2),
      I5 => wr_pntr_plus2(2),
      O => n_0_ram_full_i_i_6
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_wr_status_flags_as is
  port (
    full : out STD_LOGIC;
    p_0_out : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_full_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_wr_status_flags_as : entity is "wr_status_flags_as";
end adcrx_async_fifo_wr_status_flags_as;

architecture STRUCTURE of adcrx_async_fifo_wr_status_flags_as is
  signal \^p_0_out\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
  p_0_out <= \^p_0_out\;
RAM_reg_0_63_0_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^p_0_out\,
      I1 => wr_en,
      I2 => Q(0),
      O => O2
    );
RAM_reg_64_127_0_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \^p_0_out\,
      I1 => wr_en,
      I2 => Q(0),
      O => O3
    );
\gic0.gc0.count_d1[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_en,
      I1 => \^p_0_out\,
      O => E(0)
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => ram_full_i,
      PRE => rst_d2,
      Q => \^p_0_out\
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => wr_clk,
      CE => '1',
      D => ram_full_i,
      PRE => rst_d2,
      Q => full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_clk_x_pntrs is
  port (
    WR_PNTR_RD : out STD_LOGIC_VECTOR ( 6 downto 0 );
    RD_PNTR_WR : out STD_LOGIC_VECTOR ( 6 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O2 : out STD_LOGIC;
    ram_full_i : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_clk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_clk_x_pntrs : entity is "clk_x_pntrs";
end adcrx_async_fifo_clk_x_pntrs;

architecture STRUCTURE of adcrx_async_fifo_clk_x_pntrs is
  signal Q_0 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^rd_pntr_wr\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^wr_pntr_rd\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \n_0_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_0_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal n_0_ram_empty_i_i_2 : STD_LOGIC;
  signal n_0_ram_empty_i_i_3 : STD_LOGIC;
  signal n_0_ram_full_i_i_2 : STD_LOGIC;
  signal n_0_ram_full_i_i_3 : STD_LOGIC;
  signal \n_0_rd_pntr_gc[0]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[1]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[2]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[3]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[4]_i_1\ : STD_LOGIC;
  signal \n_0_rd_pntr_gc[5]_i_1\ : STD_LOGIC;
  signal \n_1_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_1_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_5_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[2].rd_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[2].wr_stg_inst\ : STD_LOGIC;
  signal \n_6_gsync_stage[3].wr_stg_inst\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_0_in5_out : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rd_pntr_gc : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wr_pntr_gc : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_gc[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_pntr_gc[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_pntr_gc[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rd_pntr_gc[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rd_pntr_gc[4]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rd_pntr_gc[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_pntr_gc[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_pntr_gc[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_pntr_gc[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \wr_pntr_gc[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \wr_pntr_gc[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_pntr_gc[5]_i_1\ : label is "soft_lutpair6";
begin
  RD_PNTR_WR(6 downto 0) <= \^rd_pntr_wr\(6 downto 0);
  WR_PNTR_RD(6 downto 0) <= \^wr_pntr_rd\(6 downto 0);
\gdiff.diff_pntr_pad[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(2),
      I1 => Q(2),
      O => O1(2)
    );
\gdiff.diff_pntr_pad[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(1),
      I1 => Q(1),
      O => O1(1)
    );
\gdiff.diff_pntr_pad[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(0),
      I1 => Q(0),
      O => O1(0)
    );
\gdiff.diff_pntr_pad[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(6),
      I1 => Q(6),
      O => S(3)
    );
\gdiff.diff_pntr_pad[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(5),
      I1 => Q(5),
      O => S(2)
    );
\gdiff.diff_pntr_pad[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(4),
      I1 => Q(4),
      O => S(1)
    );
\gdiff.diff_pntr_pad[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^wr_pntr_rd\(3),
      I1 => Q(3),
      O => S(0)
    );
\gsync_stage[1].rd_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff
    port map (
      I1(6 downto 0) => wr_pntr_gc(6 downto 0),
      I6(0) => I6(0),
      Q(6 downto 0) => Q_0(6 downto 0),
      rd_clk => rd_clk
    );
\gsync_stage[1].wr_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff_0
    port map (
      I1(6 downto 0) => rd_pntr_gc(6 downto 0),
      I5(0) => I5(0),
      Q(6) => \n_0_gsync_stage[1].wr_stg_inst\,
      Q(5) => \n_1_gsync_stage[1].wr_stg_inst\,
      Q(4) => \n_2_gsync_stage[1].wr_stg_inst\,
      Q(3) => \n_3_gsync_stage[1].wr_stg_inst\,
      Q(2) => \n_4_gsync_stage[1].wr_stg_inst\,
      Q(1) => \n_5_gsync_stage[1].wr_stg_inst\,
      Q(0) => \n_6_gsync_stage[1].wr_stg_inst\,
      wr_clk => wr_clk
    );
\gsync_stage[2].rd_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff_1
    port map (
      D(6 downto 0) => Q_0(6 downto 0),
      I6(0) => I6(0),
      Q(6) => \n_0_gsync_stage[2].rd_stg_inst\,
      Q(5) => \n_1_gsync_stage[2].rd_stg_inst\,
      Q(4) => \n_2_gsync_stage[2].rd_stg_inst\,
      Q(3) => \n_3_gsync_stage[2].rd_stg_inst\,
      Q(2) => \n_4_gsync_stage[2].rd_stg_inst\,
      Q(1) => \n_5_gsync_stage[2].rd_stg_inst\,
      Q(0) => \n_6_gsync_stage[2].rd_stg_inst\,
      rd_clk => rd_clk
    );
\gsync_stage[2].wr_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff_2
    port map (
      D(6) => \n_0_gsync_stage[1].wr_stg_inst\,
      D(5) => \n_1_gsync_stage[1].wr_stg_inst\,
      D(4) => \n_2_gsync_stage[1].wr_stg_inst\,
      D(3) => \n_3_gsync_stage[1].wr_stg_inst\,
      D(2) => \n_4_gsync_stage[1].wr_stg_inst\,
      D(1) => \n_5_gsync_stage[1].wr_stg_inst\,
      D(0) => \n_6_gsync_stage[1].wr_stg_inst\,
      I5(0) => I5(0),
      Q(6) => \n_0_gsync_stage[2].wr_stg_inst\,
      Q(5) => \n_1_gsync_stage[2].wr_stg_inst\,
      Q(4) => \n_2_gsync_stage[2].wr_stg_inst\,
      Q(3) => \n_3_gsync_stage[2].wr_stg_inst\,
      Q(2) => \n_4_gsync_stage[2].wr_stg_inst\,
      Q(1) => \n_5_gsync_stage[2].wr_stg_inst\,
      Q(0) => \n_6_gsync_stage[2].wr_stg_inst\,
      wr_clk => wr_clk
    );
\gsync_stage[3].rd_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff_3
    port map (
      D(6) => \n_0_gsync_stage[2].rd_stg_inst\,
      D(5) => \n_1_gsync_stage[2].rd_stg_inst\,
      D(4) => \n_2_gsync_stage[2].rd_stg_inst\,
      D(3) => \n_3_gsync_stage[2].rd_stg_inst\,
      D(2) => \n_4_gsync_stage[2].rd_stg_inst\,
      D(1) => \n_5_gsync_stage[2].rd_stg_inst\,
      D(0) => \n_6_gsync_stage[2].rd_stg_inst\,
      I6(0) => I6(0),
      p_0_in(6 downto 0) => p_0_in(6 downto 0),
      rd_clk => rd_clk
    );
\gsync_stage[3].wr_stg_inst\: entity work.adcrx_async_fifo_synchronizer_ff_4
    port map (
      D(6) => \n_0_gsync_stage[2].wr_stg_inst\,
      D(5) => \n_1_gsync_stage[2].wr_stg_inst\,
      D(4) => \n_2_gsync_stage[2].wr_stg_inst\,
      D(3) => \n_3_gsync_stage[2].wr_stg_inst\,
      D(2) => \n_4_gsync_stage[2].wr_stg_inst\,
      D(1) => \n_5_gsync_stage[2].wr_stg_inst\,
      D(0) => \n_6_gsync_stage[2].wr_stg_inst\,
      I5(0) => I5(0),
      O1(5) => \n_1_gsync_stage[3].wr_stg_inst\,
      O1(4) => \n_2_gsync_stage[3].wr_stg_inst\,
      O1(3) => \n_3_gsync_stage[3].wr_stg_inst\,
      O1(2) => \n_4_gsync_stage[3].wr_stg_inst\,
      O1(1) => \n_5_gsync_stage[3].wr_stg_inst\,
      O1(0) => \n_6_gsync_stage[3].wr_stg_inst\,
      Q(0) => \n_0_gsync_stage[3].wr_stg_inst\,
      wr_clk => wr_clk
    );
ram_empty_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF9000"
    )
    port map (
      I0 => \^wr_pntr_rd\(3),
      I1 => Q(3),
      I2 => n_0_ram_empty_i_i_2,
      I3 => n_0_ram_empty_i_i_3,
      I4 => I2,
      O => O2
    );
ram_empty_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => \^wr_pntr_rd\(1),
      I1 => Q(1),
      I2 => \^wr_pntr_rd\(0),
      I3 => Q(0),
      I4 => Q(2),
      I5 => \^wr_pntr_rd\(2),
      O => n_0_ram_empty_i_i_2
    );
ram_empty_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => \^wr_pntr_rd\(6),
      I1 => Q(6),
      I2 => \^wr_pntr_rd\(4),
      I3 => Q(4),
      I4 => Q(5),
      I5 => \^wr_pntr_rd\(5),
      O => n_0_ram_empty_i_i_3
    );
ram_full_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF0009"
    )
    port map (
      I0 => \^rd_pntr_wr\(2),
      I1 => I1(2),
      I2 => n_0_ram_full_i_i_2,
      I3 => n_0_ram_full_i_i_3,
      I4 => I3,
      I5 => rst_full_gen_i,
      O => ram_full_i
    );
ram_full_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
    port map (
      I0 => \^rd_pntr_wr\(5),
      I1 => I1(5),
      I2 => I1(4),
      I3 => \^rd_pntr_wr\(4),
      I4 => I1(6),
      I5 => \^rd_pntr_wr\(6),
      O => n_0_ram_full_i_i_2
    );
ram_full_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
    port map (
      I0 => \^rd_pntr_wr\(3),
      I1 => I1(3),
      I2 => I1(0),
      I3 => \^rd_pntr_wr\(0),
      I4 => I1(1),
      I5 => \^rd_pntr_wr\(1),
      O => n_0_ram_full_i_i_3
    );
\rd_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_6_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(0)
    );
\rd_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_5_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(1)
    );
\rd_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_4_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(2)
    );
\rd_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_3_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(3)
    );
\rd_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_2_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(4)
    );
\rd_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_1_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(5)
    );
\rd_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => \n_0_gsync_stage[3].wr_stg_inst\,
      Q => \^rd_pntr_wr\(6)
    );
\rd_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \n_0_rd_pntr_gc[0]_i_1\
    );
\rd_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(1),
      I1 => Q(2),
      O => \n_0_rd_pntr_gc[1]_i_1\
    );
\rd_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(2),
      I1 => Q(3),
      O => \n_0_rd_pntr_gc[2]_i_1\
    );
\rd_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(3),
      I1 => Q(4),
      O => \n_0_rd_pntr_gc[3]_i_1\
    );
\rd_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(4),
      I1 => Q(5),
      O => \n_0_rd_pntr_gc[4]_i_1\
    );
\rd_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Q(5),
      I1 => Q(6),
      O => \n_0_rd_pntr_gc[5]_i_1\
    );
\rd_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[0]_i_1\,
      Q => rd_pntr_gc(0)
    );
\rd_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[1]_i_1\,
      Q => rd_pntr_gc(1)
    );
\rd_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[2]_i_1\,
      Q => rd_pntr_gc(2)
    );
\rd_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[3]_i_1\,
      Q => rd_pntr_gc(3)
    );
\rd_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[4]_i_1\,
      Q => rd_pntr_gc(4)
    );
\rd_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => \n_0_rd_pntr_gc[5]_i_1\,
      Q => rd_pntr_gc(5)
    );
\rd_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => Q(6),
      Q => rd_pntr_gc(6)
    );
\wr_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(0),
      Q => \^wr_pntr_rd\(0)
    );
\wr_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(1),
      Q => \^wr_pntr_rd\(1)
    );
\wr_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(2),
      Q => \^wr_pntr_rd\(2)
    );
\wr_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(3),
      Q => \^wr_pntr_rd\(3)
    );
\wr_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(4),
      Q => \^wr_pntr_rd\(4)
    );
\wr_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(5),
      Q => \^wr_pntr_rd\(5)
    );
\wr_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => '1',
      CLR => I6(0),
      D => p_0_in(6),
      Q => \^wr_pntr_rd\(6)
    );
\wr_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(0),
      I1 => I4(1),
      O => p_0_in5_out(0)
    );
\wr_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(1),
      I1 => I4(2),
      O => p_0_in5_out(1)
    );
\wr_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(2),
      I1 => I4(3),
      O => p_0_in5_out(2)
    );
\wr_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(3),
      I1 => I4(4),
      O => p_0_in5_out(3)
    );
\wr_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(4),
      I1 => I4(5),
      O => p_0_in5_out(4)
    );
\wr_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(5),
      I1 => I4(6),
      O => p_0_in5_out(5)
    );
\wr_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(0),
      Q => wr_pntr_gc(0)
    );
\wr_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(1),
      Q => wr_pntr_gc(1)
    );
\wr_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(2),
      Q => wr_pntr_gc(2)
    );
\wr_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(3),
      Q => wr_pntr_gc(3)
    );
\wr_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(4),
      Q => wr_pntr_gc(4)
    );
\wr_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => p_0_in5_out(5),
      Q => wr_pntr_gc(5)
    );
\wr_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => wr_clk,
      CE => '1',
      CLR => I5(0),
      D => I4(6),
      Q => wr_pntr_gc(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_memory is
  port (
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 );
    I1 : in STD_LOGIC;
    O2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    I2 : in STD_LOGIC;
    ADDRC : in STD_LOGIC_VECTOR ( 5 downto 0 );
    O3 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_memory : entity is "memory";
end adcrx_async_fifo_memory;

architecture STRUCTURE of adcrx_async_fifo_memory is
begin
\gdm.dm\: entity work.adcrx_async_fifo_dmem
    port map (
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      E(0) => E(0),
      I1 => I1,
      I2 => I2,
      I3(0) => I3(0),
      O2(6 downto 0) => O2(6 downto 0),
      O3(5 downto 0) => O3(5 downto 0),
      Q(5 downto 0) => Q(5 downto 0),
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      rd_clk => rd_clk,
      wr_clk => wr_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_rd_logic is
  port (
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    O1 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ADDRC : out STD_LOGIC_VECTOR ( 5 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    I1 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_en : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_rd_logic : entity is "rd_logic";
end adcrx_async_fifo_rd_logic;

architecture STRUCTURE of adcrx_async_fifo_rd_logic is
  signal p_14_out : STD_LOGIC;
  signal p_18_out : STD_LOGIC;
  signal rd_pntr_inv_pad : STD_LOGIC_VECTOR ( 0 to 0 );
begin
\gras.gpe.rdpe\: entity work.adcrx_async_fifo_rd_pe_as
    port map (
      I2(2 downto 0) => I2(2 downto 0),
      Q(0) => Q(0),
      S(3 downto 0) => S(3 downto 0),
      adjusted_wr_pntr_rd_pad(6 downto 1) => WR_PNTR_RD(5 downto 0),
      adjusted_wr_pntr_rd_pad(0) => rd_pntr_inv_pad(0),
      p_18_out => p_18_out,
      prog_empty => prog_empty,
      rd_clk => rd_clk
    );
\gras.rsts\: entity work.adcrx_async_fifo_rd_status_flags_as
    port map (
      E(0) => E(0),
      I1 => I1,
      Q(0) => Q(0),
      adjusted_wr_pntr_rd_pad(0) => rd_pntr_inv_pad(0),
      empty => empty,
      p_14_out => p_14_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
rpntr: entity work.adcrx_async_fifo_rd_bin_cntr
    port map (
      ADDRC(5 downto 0) => ADDRC(5 downto 0),
      O1 => O1,
      O2(6 downto 0) => O2(6 downto 0),
      O3(5 downto 0) => O3(5 downto 0),
      Q(0) => Q(0),
      WR_PNTR_RD(6 downto 0) => WR_PNTR_RD(6 downto 0),
      p_14_out => p_14_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_wr_logic is
  port (
    full : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ram_full_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_en : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_wr_logic : entity is "wr_logic";
end adcrx_async_fifo_wr_logic;

architecture STRUCTURE of adcrx_async_fifo_wr_logic is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_0_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
\gwas.wsts\: entity work.adcrx_async_fifo_wr_status_flags_as
    port map (
      E(0) => p_3_out,
      O2 => O2,
      O3 => O3,
      Q(0) => \^q\(6),
      full => full,
      p_0_out => p_0_out,
      ram_full_i => ram_full_i,
      rst_d2 => rst_d2,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wpntr: entity work.adcrx_async_fifo_wr_bin_cntr
    port map (
      E(0) => p_3_out,
      I1(0) => I1(0),
      O1 => O1,
      O4(6 downto 0) => O4(6 downto 0),
      Q(6 downto 0) => \^q\(6 downto 0),
      RD_PNTR_WR(6 downto 0) => RD_PNTR_WR(6 downto 0),
      p_0_out => p_0_out,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_fifo_generator_ramfifo is
  port (
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_fifo_generator_ramfifo : entity is "fifo_generator_ramfifo";
end adcrx_async_fifo_fifo_generator_ramfifo;

architecture STRUCTURE of adcrx_async_fifo_fifo_generator_ramfifo is
  signal RD_RST : STD_LOGIC;
  signal \^rst\ : STD_LOGIC;
  signal \gwas.wsts/ram_full_i\ : STD_LOGIC;
  signal \n_10_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_11_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_12_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_13_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_14_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_14_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_15_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_15_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_16_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_16_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_17_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_17_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_18_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_18_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_19_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_19_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_1_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_20_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_20_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_21_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_21_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_22_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_2_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_2_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_1_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_20_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_8_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ram_rd_en_i : STD_LOGIC;
  signal rd_rst_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rst_d2 : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
  signal wr_rst_i : STD_LOGIC_VECTOR ( 0 to 0 );
begin
\gntv_or_sync_fifo.gcx.clkx\: entity work.adcrx_async_fifo_clk_x_pntrs
    port map (
      I1(6 downto 0) => p_8_out(6 downto 0),
      I2 => \n_2_gntv_or_sync_fifo.gl0.rd\,
      I3 => \n_1_gntv_or_sync_fifo.gl0.wr\,
      I4(6 downto 0) => p_9_out(6 downto 0),
      I5(0) => wr_rst_i(0),
      I6(0) => rd_rst_i(1),
      O1(2) => \n_18_gntv_or_sync_fifo.gcx.clkx\,
      O1(1) => \n_19_gntv_or_sync_fifo.gcx.clkx\,
      O1(0) => \n_20_gntv_or_sync_fifo.gcx.clkx\,
      O2 => \n_21_gntv_or_sync_fifo.gcx.clkx\,
      Q(6 downto 0) => p_20_out(6 downto 0),
      RD_PNTR_WR(6 downto 0) => p_0_out(6 downto 0),
      S(3) => \n_14_gntv_or_sync_fifo.gcx.clkx\,
      S(2) => \n_15_gntv_or_sync_fifo.gcx.clkx\,
      S(1) => \n_16_gntv_or_sync_fifo.gcx.clkx\,
      S(0) => \n_17_gntv_or_sync_fifo.gcx.clkx\,
      WR_PNTR_RD(6 downto 0) => p_1_out(6 downto 0),
      ram_full_i => \gwas.wsts/ram_full_i\,
      rd_clk => rd_clk,
      rst_full_gen_i => rst_full_gen_i,
      wr_clk => wr_clk
    );
\gntv_or_sync_fifo.gl0.rd\: entity work.adcrx_async_fifo_rd_logic
    port map (
      ADDRC(5) => \n_11_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(4) => \n_12_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(3) => \n_13_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(2) => \n_14_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(1) => \n_15_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(0) => \n_16_gntv_or_sync_fifo.gl0.rd\,
      E(0) => ram_rd_en_i,
      I1 => \n_21_gntv_or_sync_fifo.gcx.clkx\,
      I2(2) => \n_18_gntv_or_sync_fifo.gcx.clkx\,
      I2(1) => \n_19_gntv_or_sync_fifo.gcx.clkx\,
      I2(0) => \n_20_gntv_or_sync_fifo.gcx.clkx\,
      O1 => \n_2_gntv_or_sync_fifo.gl0.rd\,
      O2(6 downto 0) => p_20_out(6 downto 0),
      O3(5) => \n_17_gntv_or_sync_fifo.gl0.rd\,
      O3(4) => \n_18_gntv_or_sync_fifo.gl0.rd\,
      O3(3) => \n_19_gntv_or_sync_fifo.gl0.rd\,
      O3(2) => \n_20_gntv_or_sync_fifo.gl0.rd\,
      O3(1) => \n_21_gntv_or_sync_fifo.gl0.rd\,
      O3(0) => \n_22_gntv_or_sync_fifo.gl0.rd\,
      Q(0) => RD_RST,
      S(3) => \n_14_gntv_or_sync_fifo.gcx.clkx\,
      S(2) => \n_15_gntv_or_sync_fifo.gcx.clkx\,
      S(1) => \n_16_gntv_or_sync_fifo.gcx.clkx\,
      S(0) => \n_17_gntv_or_sync_fifo.gcx.clkx\,
      WR_PNTR_RD(6 downto 0) => p_1_out(6 downto 0),
      empty => empty,
      prog_empty => prog_empty,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.adcrx_async_fifo_wr_logic
    port map (
      I1(0) => \^rst\,
      O1 => \n_1_gntv_or_sync_fifo.gl0.wr\,
      O2 => \n_2_gntv_or_sync_fifo.gl0.wr\,
      O3 => \n_10_gntv_or_sync_fifo.gl0.wr\,
      O4(6 downto 0) => p_8_out(6 downto 0),
      Q(6 downto 0) => p_9_out(6 downto 0),
      RD_PNTR_WR(6 downto 0) => p_0_out(6 downto 0),
      full => full,
      ram_full_i => \gwas.wsts/ram_full_i\,
      rst_d2 => rst_d2,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
\gntv_or_sync_fifo.mem\: entity work.adcrx_async_fifo_memory
    port map (
      ADDRC(5) => \n_11_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(4) => \n_12_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(3) => \n_13_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(2) => \n_14_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(1) => \n_15_gntv_or_sync_fifo.gl0.rd\,
      ADDRC(0) => \n_16_gntv_or_sync_fifo.gl0.rd\,
      E(0) => ram_rd_en_i,
      I1 => \n_2_gntv_or_sync_fifo.gl0.wr\,
      I2 => \n_10_gntv_or_sync_fifo.gl0.wr\,
      I3(0) => rd_rst_i(0),
      O2(6 downto 0) => p_20_out(6 downto 0),
      O3(5) => \n_17_gntv_or_sync_fifo.gl0.rd\,
      O3(4) => \n_18_gntv_or_sync_fifo.gl0.rd\,
      O3(3) => \n_19_gntv_or_sync_fifo.gl0.rd\,
      O3(2) => \n_20_gntv_or_sync_fifo.gl0.rd\,
      O3(1) => \n_21_gntv_or_sync_fifo.gl0.rd\,
      O3(0) => \n_22_gntv_or_sync_fifo.gl0.rd\,
      Q(5 downto 0) => p_9_out(5 downto 0),
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      rd_clk => rd_clk,
      wr_clk => wr_clk
    );
rstblk: entity work.adcrx_async_fifo_reset_blk_ramfifo
    port map (
      O1(2) => RD_RST,
      O1(1 downto 0) => rd_rst_i(1 downto 0),
      Q(1) => \^rst\,
      Q(0) => wr_rst_i(0),
      rd_clk => rd_clk,
      rst => rst,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      wr_clk => wr_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_fifo_generator_top is
  port (
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_fifo_generator_top : entity is "fifo_generator_top";
end adcrx_async_fifo_fifo_generator_top;

architecture STRUCTURE of adcrx_async_fifo_fifo_generator_top is
begin
\grf.rf\: entity work.adcrx_async_fifo_fifo_generator_ramfifo
    port map (
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      empty => empty,
      full => full,
      prog_empty => prog_empty,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo_fifo_generator_v12_0_synth is
  port (
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adcrx_async_fifo_fifo_generator_v12_0_synth : entity is "fifo_generator_v12_0_synth";
end adcrx_async_fifo_fifo_generator_v12_0_synth;

architecture STRUCTURE of adcrx_async_fifo_fifo_generator_v12_0_synth is
begin
\gconvfifo.rf\: entity work.adcrx_async_fifo_fifo_generator_top
    port map (
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      empty => empty,
      full => full,
      prog_empty => prog_empty,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 6 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "fifo_generator_v12_0";
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 7;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 192;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 192;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "BlankString";
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "512x72";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 6;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 15;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 125;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 124;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 7;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 128;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 7;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 7;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 128;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 7;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 3;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is "1kx18";
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ : entity is 0;
end \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\;

architecture STRUCTURE of \adcrx_async_fifo_fifo_generator_v12_0__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.adcrx_async_fifo_fifo_generator_v12_0_synth
    port map (
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      empty => empty,
      full => full,
      prog_empty => prog_empty,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adcrx_async_fifo is
  port (
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of adcrx_async_fifo : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of adcrx_async_fifo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of adcrx_async_fifo : entity is "fifo_generator_v12_0,Vivado 2014.3.1";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of adcrx_async_fifo : entity is "adcrx_async_fifo,fifo_generator_v12_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of adcrx_async_fifo : entity is "adcrx_async_fifo,fifo_generator_v12_0,{x_ipProduct=Vivado 2014.3.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fifo_generator,x_ipVersion=12.0,x_ipCoreRevision=2,x_ipLanguage=VHDL,C_COMMON_CLOCK=0,C_COUNT_TYPE=0,C_DATA_COUNT_WIDTH=7,C_DEFAULT_VALUE=BlankString,C_DIN_WIDTH=192,C_DOUT_RST_VAL=0,C_DOUT_WIDTH=192,C_ENABLE_RLOCS=0,C_FAMILY=virtex7,C_FULL_FLAGS_RST_VAL=1,C_HAS_ALMOST_EMPTY=0,C_HAS_ALMOST_FULL=0,C_HAS_BACKUP=0,C_HAS_DATA_COUNT=0,C_HAS_INT_CLK=0,C_HAS_MEMINIT_FILE=0,C_HAS_OVERFLOW=0,C_HAS_RD_DATA_COUNT=0,C_HAS_RD_RST=0,C_HAS_RST=1,C_HAS_SRST=0,C_HAS_UNDERFLOW=0,C_HAS_VALID=0,C_HAS_WR_ACK=0,C_HAS_WR_DATA_COUNT=0,C_HAS_WR_RST=0,C_IMPLEMENTATION_TYPE=2,C_INIT_WR_PNTR_VAL=0,C_MEMORY_TYPE=2,C_MIF_FILE_NAME=BlankString,C_OPTIMIZATION_MODE=0,C_OVERFLOW_LOW=0,C_PRELOAD_LATENCY=1,C_PRELOAD_REGS=0,C_PRIM_FIFO_TYPE=512x72,C_PROG_EMPTY_THRESH_ASSERT_VAL=6,C_PROG_EMPTY_THRESH_NEGATE_VAL=15,C_PROG_EMPTY_TYPE=2,C_PROG_FULL_THRESH_ASSERT_VAL=125,C_PROG_FULL_THRESH_NEGATE_VAL=124,C_PROG_FULL_TYPE=0,C_RD_DATA_COUNT_WIDTH=7,C_RD_DEPTH=128,C_RD_FREQ=1,C_RD_PNTR_WIDTH=7,C_UNDERFLOW_LOW=0,C_USE_DOUT_RST=1,C_USE_ECC=0,C_USE_EMBEDDED_REG=0,C_USE_PIPELINE_REG=0,C_POWER_SAVING_MODE=0,C_USE_FIFO16_FLAGS=0,C_USE_FWFT_DATA_COUNT=0,C_VALID_LOW=0,C_WR_ACK_LOW=0,C_WR_DATA_COUNT_WIDTH=7,C_WR_DEPTH=128,C_WR_FREQ=1,C_WR_PNTR_WIDTH=7,C_WR_RESPONSE_LATENCY=1,C_MSGON_VAL=1,C_ENABLE_RST_SYNC=1,C_ERROR_INJECTION_TYPE=0,C_SYNCHRONIZER_STAGE=3,C_INTERFACE_TYPE=0,C_AXI_TYPE=1,C_HAS_AXI_WR_CHANNEL=1,C_HAS_AXI_RD_CHANNEL=1,C_HAS_SLAVE_CE=0,C_HAS_MASTER_CE=0,C_ADD_NGC_CONSTRAINT=0,C_USE_COMMON_OVERFLOW=0,C_USE_COMMON_UNDERFLOW=0,C_USE_DEFAULT_SETTINGS=0,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=64,C_AXI_LEN_WIDTH=8,C_AXI_LOCK_WIDTH=1,C_HAS_AXI_ID=0,C_HAS_AXI_AWUSER=0,C_HAS_AXI_WUSER=0,C_HAS_AXI_BUSER=0,C_HAS_AXI_ARUSER=0,C_HAS_AXI_RUSER=0,C_AXI_ARUSER_WIDTH=1,C_AXI_AWUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_HAS_AXIS_TDATA=1,C_HAS_AXIS_TID=0,C_HAS_AXIS_TDEST=0,C_HAS_AXIS_TUSER=1,C_HAS_AXIS_TREADY=1,C_HAS_AXIS_TLAST=0,C_HAS_AXIS_TSTRB=0,C_HAS_AXIS_TKEEP=0,C_AXIS_TDATA_WIDTH=8,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=4,C_AXIS_TSTRB_WIDTH=1,C_AXIS_TKEEP_WIDTH=1,C_WACH_TYPE=0,C_WDCH_TYPE=0,C_WRCH_TYPE=0,C_RACH_TYPE=0,C_RDCH_TYPE=0,C_AXIS_TYPE=0,C_IMPLEMENTATION_TYPE_WACH=1,C_IMPLEMENTATION_TYPE_WDCH=1,C_IMPLEMENTATION_TYPE_WRCH=1,C_IMPLEMENTATION_TYPE_RACH=1,C_IMPLEMENTATION_TYPE_RDCH=1,C_IMPLEMENTATION_TYPE_AXIS=1,C_APPLICATION_TYPE_WACH=0,C_APPLICATION_TYPE_WDCH=0,C_APPLICATION_TYPE_WRCH=0,C_APPLICATION_TYPE_RACH=0,C_APPLICATION_TYPE_RDCH=0,C_APPLICATION_TYPE_AXIS=0,C_PRIM_FIFO_TYPE_WACH=512x36,C_PRIM_FIFO_TYPE_WDCH=1kx36,C_PRIM_FIFO_TYPE_WRCH=512x36,C_PRIM_FIFO_TYPE_RACH=512x36,C_PRIM_FIFO_TYPE_RDCH=1kx36,C_PRIM_FIFO_TYPE_AXIS=1kx18,C_USE_ECC_WACH=0,C_USE_ECC_WDCH=0,C_USE_ECC_WRCH=0,C_USE_ECC_RACH=0,C_USE_ECC_RDCH=0,C_USE_ECC_AXIS=0,C_ERROR_INJECTION_TYPE_WACH=0,C_ERROR_INJECTION_TYPE_WDCH=0,C_ERROR_INJECTION_TYPE_WRCH=0,C_ERROR_INJECTION_TYPE_RACH=0,C_ERROR_INJECTION_TYPE_RDCH=0,C_ERROR_INJECTION_TYPE_AXIS=0,C_DIN_WIDTH_WACH=32,C_DIN_WIDTH_WDCH=64,C_DIN_WIDTH_WRCH=2,C_DIN_WIDTH_RACH=32,C_DIN_WIDTH_RDCH=64,C_DIN_WIDTH_AXIS=1,C_WR_DEPTH_WACH=16,C_WR_DEPTH_WDCH=1024,C_WR_DEPTH_WRCH=16,C_WR_DEPTH_RACH=16,C_WR_DEPTH_RDCH=1024,C_WR_DEPTH_AXIS=1024,C_WR_PNTR_WIDTH_WACH=4,C_WR_PNTR_WIDTH_WDCH=10,C_WR_PNTR_WIDTH_WRCH=4,C_WR_PNTR_WIDTH_RACH=4,C_WR_PNTR_WIDTH_RDCH=10,C_WR_PNTR_WIDTH_AXIS=10,C_HAS_DATA_COUNTS_WACH=0,C_HAS_DATA_COUNTS_WDCH=0,C_HAS_DATA_COUNTS_WRCH=0,C_HAS_DATA_COUNTS_RACH=0,C_HAS_DATA_COUNTS_RDCH=0,C_HAS_DATA_COUNTS_AXIS=0,C_HAS_PROG_FLAGS_WACH=0,C_HAS_PROG_FLAGS_WDCH=0,C_HAS_PROG_FLAGS_WRCH=0,C_HAS_PROG_FLAGS_RACH=0,C_HAS_PROG_FLAGS_RDCH=0,C_HAS_PROG_FLAGS_AXIS=0,C_PROG_FULL_TYPE_WACH=0,C_PROG_FULL_TYPE_WDCH=0,C_PROG_FULL_TYPE_WRCH=0,C_PROG_FULL_TYPE_RACH=0,C_PROG_FULL_TYPE_RDCH=0,C_PROG_FULL_TYPE_AXIS=0,C_PROG_FULL_THRESH_ASSERT_VAL_WACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WRCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_AXIS=1023,C_PROG_EMPTY_TYPE_WACH=0,C_PROG_EMPTY_TYPE_WDCH=0,C_PROG_EMPTY_TYPE_WRCH=0,C_PROG_EMPTY_TYPE_RACH=0,C_PROG_EMPTY_TYPE_RDCH=0,C_PROG_EMPTY_TYPE_AXIS=0,C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS=1022,C_REG_SLICE_MODE_WACH=0,C_REG_SLICE_MODE_WDCH=0,C_REG_SLICE_MODE_WRCH=0,C_REG_SLICE_MODE_RACH=0,C_REG_SLICE_MODE_RDCH=0,C_REG_SLICE_MODE_AXIS=0}";
end adcrx_async_fifo;

architecture STRUCTURE of adcrx_async_fifo is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 192;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 192;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 6;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 15;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 2;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 125;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 124;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 128;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 7;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 3;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 128;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 7;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
begin
U0: entity work.\adcrx_async_fifo_fifo_generator_v12_0__parameterized0\
    port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3) => '0',
      axi_ar_prog_empty_thresh(2) => '0',
      axi_ar_prog_empty_thresh(1) => '0',
      axi_ar_prog_empty_thresh(0) => '0',
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3) => '0',
      axi_ar_prog_full_thresh(2) => '0',
      axi_ar_prog_full_thresh(1) => '0',
      axi_ar_prog_full_thresh(0) => '0',
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3) => '0',
      axi_aw_prog_empty_thresh(2) => '0',
      axi_aw_prog_empty_thresh(1) => '0',
      axi_aw_prog_empty_thresh(0) => '0',
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3) => '0',
      axi_aw_prog_full_thresh(2) => '0',
      axi_aw_prog_full_thresh(1) => '0',
      axi_aw_prog_full_thresh(0) => '0',
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3) => '0',
      axi_b_prog_empty_thresh(2) => '0',
      axi_b_prog_empty_thresh(1) => '0',
      axi_b_prog_empty_thresh(0) => '0',
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3) => '0',
      axi_b_prog_full_thresh(2) => '0',
      axi_b_prog_full_thresh(1) => '0',
      axi_b_prog_full_thresh(0) => '0',
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9) => '0',
      axi_r_prog_empty_thresh(8) => '0',
      axi_r_prog_empty_thresh(7) => '0',
      axi_r_prog_empty_thresh(6) => '0',
      axi_r_prog_empty_thresh(5) => '0',
      axi_r_prog_empty_thresh(4) => '0',
      axi_r_prog_empty_thresh(3) => '0',
      axi_r_prog_empty_thresh(2) => '0',
      axi_r_prog_empty_thresh(1) => '0',
      axi_r_prog_empty_thresh(0) => '0',
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9) => '0',
      axi_r_prog_full_thresh(8) => '0',
      axi_r_prog_full_thresh(7) => '0',
      axi_r_prog_full_thresh(6) => '0',
      axi_r_prog_full_thresh(5) => '0',
      axi_r_prog_full_thresh(4) => '0',
      axi_r_prog_full_thresh(3) => '0',
      axi_r_prog_full_thresh(2) => '0',
      axi_r_prog_full_thresh(1) => '0',
      axi_r_prog_full_thresh(0) => '0',
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9) => '0',
      axi_w_prog_empty_thresh(8) => '0',
      axi_w_prog_empty_thresh(7) => '0',
      axi_w_prog_empty_thresh(6) => '0',
      axi_w_prog_empty_thresh(5) => '0',
      axi_w_prog_empty_thresh(4) => '0',
      axi_w_prog_empty_thresh(3) => '0',
      axi_w_prog_empty_thresh(2) => '0',
      axi_w_prog_empty_thresh(1) => '0',
      axi_w_prog_empty_thresh(0) => '0',
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9) => '0',
      axi_w_prog_full_thresh(8) => '0',
      axi_w_prog_full_thresh(7) => '0',
      axi_w_prog_full_thresh(6) => '0',
      axi_w_prog_full_thresh(5) => '0',
      axi_w_prog_full_thresh(4) => '0',
      axi_w_prog_full_thresh(3) => '0',
      axi_w_prog_full_thresh(2) => '0',
      axi_w_prog_full_thresh(1) => '0',
      axi_w_prog_full_thresh(0) => '0',
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9) => '0',
      axis_prog_empty_thresh(8) => '0',
      axis_prog_empty_thresh(7) => '0',
      axis_prog_empty_thresh(6) => '0',
      axis_prog_empty_thresh(5) => '0',
      axis_prog_empty_thresh(4) => '0',
      axis_prog_empty_thresh(3) => '0',
      axis_prog_empty_thresh(2) => '0',
      axis_prog_empty_thresh(1) => '0',
      axis_prog_empty_thresh(0) => '0',
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9) => '0',
      axis_prog_full_thresh(8) => '0',
      axis_prog_full_thresh(7) => '0',
      axis_prog_full_thresh(6) => '0',
      axis_prog_full_thresh(5) => '0',
      axis_prog_full_thresh(4) => '0',
      axis_prog_full_thresh(3) => '0',
      axis_prog_full_thresh(2) => '0',
      axis_prog_full_thresh(1) => '0',
      axis_prog_full_thresh(0) => '0',
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(6 downto 0) => NLW_U0_data_count_UNCONNECTED(6 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(191 downto 0) => din(191 downto 0),
      dout(191 downto 0) => dout(191 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1) => '0',
      m_axi_bresp(0) => '0',
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63) => '0',
      m_axi_rdata(62) => '0',
      m_axi_rdata(61) => '0',
      m_axi_rdata(60) => '0',
      m_axi_rdata(59) => '0',
      m_axi_rdata(58) => '0',
      m_axi_rdata(57) => '0',
      m_axi_rdata(56) => '0',
      m_axi_rdata(55) => '0',
      m_axi_rdata(54) => '0',
      m_axi_rdata(53) => '0',
      m_axi_rdata(52) => '0',
      m_axi_rdata(51) => '0',
      m_axi_rdata(50) => '0',
      m_axi_rdata(49) => '0',
      m_axi_rdata(48) => '0',
      m_axi_rdata(47) => '0',
      m_axi_rdata(46) => '0',
      m_axi_rdata(45) => '0',
      m_axi_rdata(44) => '0',
      m_axi_rdata(43) => '0',
      m_axi_rdata(42) => '0',
      m_axi_rdata(41) => '0',
      m_axi_rdata(40) => '0',
      m_axi_rdata(39) => '0',
      m_axi_rdata(38) => '0',
      m_axi_rdata(37) => '0',
      m_axi_rdata(36) => '0',
      m_axi_rdata(35) => '0',
      m_axi_rdata(34) => '0',
      m_axi_rdata(33) => '0',
      m_axi_rdata(32) => '0',
      m_axi_rdata(31) => '0',
      m_axi_rdata(30) => '0',
      m_axi_rdata(29) => '0',
      m_axi_rdata(28) => '0',
      m_axi_rdata(27) => '0',
      m_axi_rdata(26) => '0',
      m_axi_rdata(25) => '0',
      m_axi_rdata(24) => '0',
      m_axi_rdata(23) => '0',
      m_axi_rdata(22) => '0',
      m_axi_rdata(21) => '0',
      m_axi_rdata(20) => '0',
      m_axi_rdata(19) => '0',
      m_axi_rdata(18) => '0',
      m_axi_rdata(17) => '0',
      m_axi_rdata(16) => '0',
      m_axi_rdata(15) => '0',
      m_axi_rdata(14) => '0',
      m_axi_rdata(13) => '0',
      m_axi_rdata(12) => '0',
      m_axi_rdata(11) => '0',
      m_axi_rdata(10) => '0',
      m_axi_rdata(9) => '0',
      m_axi_rdata(8) => '0',
      m_axi_rdata(7) => '0',
      m_axi_rdata(6) => '0',
      m_axi_rdata(5) => '0',
      m_axi_rdata(4) => '0',
      m_axi_rdata(3) => '0',
      m_axi_rdata(2) => '0',
      m_axi_rdata(1) => '0',
      m_axi_rdata(0) => '0',
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1) => '0',
      m_axi_rresp(0) => '0',
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => prog_empty,
      prog_empty_thresh(6) => '0',
      prog_empty_thresh(5) => '0',
      prog_empty_thresh(4) => '0',
      prog_empty_thresh(3) => '0',
      prog_empty_thresh(2) => '0',
      prog_empty_thresh(1) => '0',
      prog_empty_thresh(0) => '0',
      prog_empty_thresh_assert(6) => '0',
      prog_empty_thresh_assert(5) => '0',
      prog_empty_thresh_assert(4) => '0',
      prog_empty_thresh_assert(3) => '0',
      prog_empty_thresh_assert(2) => '0',
      prog_empty_thresh_assert(1) => '0',
      prog_empty_thresh_assert(0) => '0',
      prog_empty_thresh_negate(6) => '0',
      prog_empty_thresh_negate(5) => '0',
      prog_empty_thresh_negate(4) => '0',
      prog_empty_thresh_negate(3) => '0',
      prog_empty_thresh_negate(2) => '0',
      prog_empty_thresh_negate(1) => '0',
      prog_empty_thresh_negate(0) => '0',
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(6) => '0',
      prog_full_thresh(5) => '0',
      prog_full_thresh(4) => '0',
      prog_full_thresh(3) => '0',
      prog_full_thresh(2) => '0',
      prog_full_thresh(1) => '0',
      prog_full_thresh(0) => '0',
      prog_full_thresh_assert(6) => '0',
      prog_full_thresh_assert(5) => '0',
      prog_full_thresh_assert(4) => '0',
      prog_full_thresh_assert(3) => '0',
      prog_full_thresh_assert(2) => '0',
      prog_full_thresh_assert(1) => '0',
      prog_full_thresh_assert(0) => '0',
      prog_full_thresh_negate(6) => '0',
      prog_full_thresh_negate(5) => '0',
      prog_full_thresh_negate(4) => '0',
      prog_full_thresh_negate(3) => '0',
      prog_full_thresh_negate(2) => '0',
      prog_full_thresh_negate(1) => '0',
      prog_full_thresh_negate(0) => '0',
      rd_clk => rd_clk,
      rd_data_count(6 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(6 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => NLW_U0_rd_rst_busy_UNCONNECTED,
      rst => rst,
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31) => '0',
      s_axi_araddr(30) => '0',
      s_axi_araddr(29) => '0',
      s_axi_araddr(28) => '0',
      s_axi_araddr(27) => '0',
      s_axi_araddr(26) => '0',
      s_axi_araddr(25) => '0',
      s_axi_araddr(24) => '0',
      s_axi_araddr(23) => '0',
      s_axi_araddr(22) => '0',
      s_axi_araddr(21) => '0',
      s_axi_araddr(20) => '0',
      s_axi_araddr(19) => '0',
      s_axi_araddr(18) => '0',
      s_axi_araddr(17) => '0',
      s_axi_araddr(16) => '0',
      s_axi_araddr(15) => '0',
      s_axi_araddr(14) => '0',
      s_axi_araddr(13) => '0',
      s_axi_araddr(12) => '0',
      s_axi_araddr(11) => '0',
      s_axi_araddr(10) => '0',
      s_axi_araddr(9) => '0',
      s_axi_araddr(8) => '0',
      s_axi_araddr(7) => '0',
      s_axi_araddr(6) => '0',
      s_axi_araddr(5) => '0',
      s_axi_araddr(4) => '0',
      s_axi_araddr(3) => '0',
      s_axi_araddr(2) => '0',
      s_axi_araddr(1) => '0',
      s_axi_araddr(0) => '0',
      s_axi_arburst(1) => '0',
      s_axi_arburst(0) => '0',
      s_axi_arcache(3) => '0',
      s_axi_arcache(2) => '0',
      s_axi_arcache(1) => '0',
      s_axi_arcache(0) => '0',
      s_axi_arid(0) => '0',
      s_axi_arlen(7) => '0',
      s_axi_arlen(6) => '0',
      s_axi_arlen(5) => '0',
      s_axi_arlen(4) => '0',
      s_axi_arlen(3) => '0',
      s_axi_arlen(2) => '0',
      s_axi_arlen(1) => '0',
      s_axi_arlen(0) => '0',
      s_axi_arlock(0) => '0',
      s_axi_arprot(2) => '0',
      s_axi_arprot(1) => '0',
      s_axi_arprot(0) => '0',
      s_axi_arqos(3) => '0',
      s_axi_arqos(2) => '0',
      s_axi_arqos(1) => '0',
      s_axi_arqos(0) => '0',
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3) => '0',
      s_axi_arregion(2) => '0',
      s_axi_arregion(1) => '0',
      s_axi_arregion(0) => '0',
      s_axi_arsize(2) => '0',
      s_axi_arsize(1) => '0',
      s_axi_arsize(0) => '0',
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31) => '0',
      s_axi_awaddr(30) => '0',
      s_axi_awaddr(29) => '0',
      s_axi_awaddr(28) => '0',
      s_axi_awaddr(27) => '0',
      s_axi_awaddr(26) => '0',
      s_axi_awaddr(25) => '0',
      s_axi_awaddr(24) => '0',
      s_axi_awaddr(23) => '0',
      s_axi_awaddr(22) => '0',
      s_axi_awaddr(21) => '0',
      s_axi_awaddr(20) => '0',
      s_axi_awaddr(19) => '0',
      s_axi_awaddr(18) => '0',
      s_axi_awaddr(17) => '0',
      s_axi_awaddr(16) => '0',
      s_axi_awaddr(15) => '0',
      s_axi_awaddr(14) => '0',
      s_axi_awaddr(13) => '0',
      s_axi_awaddr(12) => '0',
      s_axi_awaddr(11) => '0',
      s_axi_awaddr(10) => '0',
      s_axi_awaddr(9) => '0',
      s_axi_awaddr(8) => '0',
      s_axi_awaddr(7) => '0',
      s_axi_awaddr(6) => '0',
      s_axi_awaddr(5) => '0',
      s_axi_awaddr(4) => '0',
      s_axi_awaddr(3) => '0',
      s_axi_awaddr(2) => '0',
      s_axi_awaddr(1) => '0',
      s_axi_awaddr(0) => '0',
      s_axi_awburst(1) => '0',
      s_axi_awburst(0) => '0',
      s_axi_awcache(3) => '0',
      s_axi_awcache(2) => '0',
      s_axi_awcache(1) => '0',
      s_axi_awcache(0) => '0',
      s_axi_awid(0) => '0',
      s_axi_awlen(7) => '0',
      s_axi_awlen(6) => '0',
      s_axi_awlen(5) => '0',
      s_axi_awlen(4) => '0',
      s_axi_awlen(3) => '0',
      s_axi_awlen(2) => '0',
      s_axi_awlen(1) => '0',
      s_axi_awlen(0) => '0',
      s_axi_awlock(0) => '0',
      s_axi_awprot(2) => '0',
      s_axi_awprot(1) => '0',
      s_axi_awprot(0) => '0',
      s_axi_awqos(3) => '0',
      s_axi_awqos(2) => '0',
      s_axi_awqos(1) => '0',
      s_axi_awqos(0) => '0',
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3) => '0',
      s_axi_awregion(2) => '0',
      s_axi_awregion(1) => '0',
      s_axi_awregion(0) => '0',
      s_axi_awsize(2) => '0',
      s_axi_awsize(1) => '0',
      s_axi_awsize(0) => '0',
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63) => '0',
      s_axi_wdata(62) => '0',
      s_axi_wdata(61) => '0',
      s_axi_wdata(60) => '0',
      s_axi_wdata(59) => '0',
      s_axi_wdata(58) => '0',
      s_axi_wdata(57) => '0',
      s_axi_wdata(56) => '0',
      s_axi_wdata(55) => '0',
      s_axi_wdata(54) => '0',
      s_axi_wdata(53) => '0',
      s_axi_wdata(52) => '0',
      s_axi_wdata(51) => '0',
      s_axi_wdata(50) => '0',
      s_axi_wdata(49) => '0',
      s_axi_wdata(48) => '0',
      s_axi_wdata(47) => '0',
      s_axi_wdata(46) => '0',
      s_axi_wdata(45) => '0',
      s_axi_wdata(44) => '0',
      s_axi_wdata(43) => '0',
      s_axi_wdata(42) => '0',
      s_axi_wdata(41) => '0',
      s_axi_wdata(40) => '0',
      s_axi_wdata(39) => '0',
      s_axi_wdata(38) => '0',
      s_axi_wdata(37) => '0',
      s_axi_wdata(36) => '0',
      s_axi_wdata(35) => '0',
      s_axi_wdata(34) => '0',
      s_axi_wdata(33) => '0',
      s_axi_wdata(32) => '0',
      s_axi_wdata(31) => '0',
      s_axi_wdata(30) => '0',
      s_axi_wdata(29) => '0',
      s_axi_wdata(28) => '0',
      s_axi_wdata(27) => '0',
      s_axi_wdata(26) => '0',
      s_axi_wdata(25) => '0',
      s_axi_wdata(24) => '0',
      s_axi_wdata(23) => '0',
      s_axi_wdata(22) => '0',
      s_axi_wdata(21) => '0',
      s_axi_wdata(20) => '0',
      s_axi_wdata(19) => '0',
      s_axi_wdata(18) => '0',
      s_axi_wdata(17) => '0',
      s_axi_wdata(16) => '0',
      s_axi_wdata(15) => '0',
      s_axi_wdata(14) => '0',
      s_axi_wdata(13) => '0',
      s_axi_wdata(12) => '0',
      s_axi_wdata(11) => '0',
      s_axi_wdata(10) => '0',
      s_axi_wdata(9) => '0',
      s_axi_wdata(8) => '0',
      s_axi_wdata(7) => '0',
      s_axi_wdata(6) => '0',
      s_axi_wdata(5) => '0',
      s_axi_wdata(4) => '0',
      s_axi_wdata(3) => '0',
      s_axi_wdata(2) => '0',
      s_axi_wdata(1) => '0',
      s_axi_wdata(0) => '0',
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7) => '0',
      s_axi_wstrb(6) => '0',
      s_axi_wstrb(5) => '0',
      s_axi_wstrb(4) => '0',
      s_axi_wstrb(3) => '0',
      s_axi_wstrb(2) => '0',
      s_axi_wstrb(1) => '0',
      s_axi_wstrb(0) => '0',
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7) => '0',
      s_axis_tdata(6) => '0',
      s_axis_tdata(5) => '0',
      s_axis_tdata(4) => '0',
      s_axis_tdata(3) => '0',
      s_axis_tdata(2) => '0',
      s_axis_tdata(1) => '0',
      s_axis_tdata(0) => '0',
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3) => '0',
      s_axis_tuser(2) => '0',
      s_axis_tuser(1) => '0',
      s_axis_tuser(0) => '0',
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(6 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(6 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => NLW_U0_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
