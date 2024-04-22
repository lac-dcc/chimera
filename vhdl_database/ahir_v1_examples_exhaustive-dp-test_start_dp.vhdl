
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.types.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.subprograms.all;
use ahir.LoadStorePack.all;

entity start_dp is
  port(
    SigmaIn : in BooleanArray(294 downto 1);
    SigmaOut : out BooleanArray(292 downto 1);
    call_ack : out std_logic;
    call_data : in std_logic_vector(0 downto 0);
    call_dpe_183_ack : in std_logic;
    call_dpe_183_data : out std_logic_vector(0 downto 0);
    call_dpe_183_req : out std_logic;
    call_dpe_185_ack : in std_logic;
    call_dpe_185_data : out std_logic_vector(0 downto 0);
    call_dpe_185_req : out std_logic;
    call_dpe_188_ack : in std_logic;
    call_dpe_188_data : out std_logic_vector(0 downto 0);
    call_dpe_188_req : out std_logic;
    call_req : in std_logic;
    call_tag : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    return_ack : in std_logic;
    return_data : out std_logic_vector(32 downto 0);
    return_dpe_183_ack : in std_logic;
    return_dpe_183_data : in std_logic_vector(32 downto 0);
    return_dpe_183_req : out std_logic;
    return_dpe_185_ack : in std_logic;
    return_dpe_185_data : in std_logic_vector(32 downto 0);
    return_dpe_185_req : out std_logic;
    return_dpe_188_ack : in std_logic;
    return_dpe_188_data : in std_logic_vector(16 downto 0);
    return_dpe_188_req : out std_logic;
    return_req : out std_logic;
    return_tag : out std_logic_vector(3 downto 0);
    sr_ack : in std_logic_vector(59 downto 0);
    sr_addr : out std_logic_vector(959 downto 0);
    sr_data : out std_logic_vector(479 downto 0);
    sr_req : out std_logic_vector(59 downto 0);
    sr_tag : out std_logic_vector(479 downto 0));
end start_dp;

-- dpe_183: call test_ints
-- dpe_185: call test_floats
-- dpe_188: call test_shorts

architecture default_arch of start_dp is

  -- wrapper wires
  -- element wires
  signal wire_54 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_73 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_74 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_75 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_76 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_77 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_78 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_79 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_81 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_82 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_58 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_83 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_85 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_86 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_87 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_88 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_89 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_90 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_91 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_92 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_68 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_93 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_94 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_96 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_97 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_98 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_99 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_100 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_101 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_102 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_80 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_103 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_104 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_105 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_106 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_107 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_109 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_110 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_111 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_112 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_84 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_113 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_114 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_115 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_116 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_117 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_119 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_120 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_121 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_95 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_123 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_124 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_125 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_126 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_127 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_128 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_129 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_130 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_131 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_108 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_133 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_134 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_135 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_136 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_137 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_138 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_139 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_140 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_141 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_118 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_143 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_144 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_145 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_146 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_147 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_148 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_149 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_150 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_151 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_122 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_152 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_153 : APFloatArray(0 downto 0, 8 downto -23);
  signal dpe_184_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal dpe_186_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal wire_157 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_189_data : StdLogicArray2D(0 downto 0, 16 downto 0);
  signal wire_132 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_159 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_160 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_161 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_142 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_154 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_162 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_163 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_164 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_165 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_166 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_167 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_168 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_169 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_3_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal wire_170 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_1 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_2 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_3 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_4 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_5 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_6 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_7 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_9 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_4_z : APInt(31 downto 0);
  signal wire_10 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_11 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_12 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_13 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_14 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_46_z : APInt(31 downto 0);
  signal dpe_47_z : APInt(31 downto 0);
  signal wire_18 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_19 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_16 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_20 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_21 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_22 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_24 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_25 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_26 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_27 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_28 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_29 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_30 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_6_z : APInt(31 downto 0);
  signal wire_31 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_32 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_34 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_35 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_36 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_37 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_38 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_39 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_40 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_41 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_33 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_42 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_44 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_46 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_47 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_48 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_49 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_50 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_51 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_52 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_43 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_53 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_55 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_56 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_57 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_59 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_60 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_61 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_62 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_63 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_45 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_64 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_65 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_66 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_67 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_69 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_70 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_71 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_72 : APFloatArray(0 downto 0, 8 downto -23);

  -- other wires
  signal dpe_106_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_115_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_123_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_132_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_141_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_149_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_157_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_165_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_173_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_181_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_183_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal dpe_183_data_0 : std_logic_vector(0 downto 0);
  signal dpe_184_data_0 : std_logic_vector(32 downto 0);
  signal dpe_185_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal dpe_185_data_0 : std_logic_vector(0 downto 0);
  signal dpe_186_data_0 : std_logic_vector(32 downto 0);
  signal dpe_188_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal dpe_188_data_0 : std_logic_vector(0 downto 0);
  signal dpe_189_data_0 : std_logic_vector(16 downto 0);
  signal dpe_193_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal dpe_193_data_0 : std_logic_vector(32 downto 0);
  signal dpe_1_condition : APInt(0 downto 0);
  signal dpe_2_condition : APInt(0 downto 0);
  signal dpe_33_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_3_data_0 : std_logic_vector(0 downto 0);
  signal dpe_42_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_46_x : APInt(31 downto 0);
  signal dpe_46_y : APInt(31 downto 0);
  signal dpe_47_x : APInt(31 downto 0);
  signal dpe_47_y : APInt(31 downto 0);
  signal dpe_4_x : APInt(31 downto 0);
  signal dpe_4_y : APInt(31 downto 0);
  signal dpe_6_x : APInt(31 downto 0);
  signal dpe_6_y : APInt(31 downto 0);
  signal dpe_72_data : StdLogicArray2D(0 downto 0, 15 downto 0);
  signal dpe_80_data : StdLogicArray2D(0 downto 0, 15 downto 0);
  signal dpe_90_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_98_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_15 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_155 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_156 : APFloatArray(0 downto 0, 8 downto -23);
  signal wire_158 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_17 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_23 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_8 : APIntArray(0 downto 0, 31 downto 0);

begin

  return_tag <= call_tag;
  -- constant dpe_107
  wire_79 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"10111111111110110111111000000010"))));
  -- constant dpe_11
  wire_58 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000011000"))));
  -- constant dpe_112
  wire_86 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000011"))));
  -- constant dpe_116
  wire_89 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111101010111010011111111100010"))));
  -- constant dpe_124
  wire_97 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111111010011001110010000000000"))));
  -- constant dpe_129
  wire_102 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000101"))));
  -- constant dpe_133
  wire_105 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111111100011011001100111111110"))));
  -- address dpe_135
  wire_107 <= to_apintarray(to_apint(to_unsigned(61, 16)));
  -- constant dpe_14
  wire_84 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000100"))));
  -- constant dpe_142
  wire_114 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"10111110101001100001100000000101"))));
  -- constant dpe_150
  wire_123 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"10111111111000001011110111111101"))));
  -- constant dpe_158
  wire_130 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111111100100001010101000000000"))));
  -- constant dpe_166
  wire_138 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"10111110001001100111000000011001"))));
  -- constant dpe_174
  wire_146 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111101100101011001111111110101"))));
  -- address dpe_18
  wire_122 <= to_apintarray(to_apint(to_unsigned(153, 16)));
  -- constant dpe_182
  wire_153 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111110100111101000011111110100"))));
  -- constant dpe_25
  wire_165 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000010100"))));
  -- constant dpe_27
  wire_167 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000001000"))));
  -- constant dpe_30
  wire_170 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000001"))));
  -- constant dpe_35
  wire_4 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000010011"))));
  -- constant dpe_37
  wire_6 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000111"))));
  -- constant dpe_45
  wire_14 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000110"))));
  -- constant dpe_48
  wire_18 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"10101011011100010100010111111001"))));
  -- constant dpe_5
  wire_16 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000000"))));
  -- address dpe_50
  wire_20 <= to_apintarray(to_apint(to_unsigned(199, 16)));
  -- constant dpe_52
  wire_22 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000001100"))));
  -- constant dpe_55
  wire_26 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000010"))));
  -- address dpe_59
  wire_30 <= to_apintarray(to_apint(to_unsigned(211, 16)));
  -- constant dpe_7
  wire_33 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"01011011010110101011011100010100"))));
  -- address dpe_84
  wire_57 <= to_apintarray(to_apint(to_unsigned(37, 16)));
  -- address dpe_9
  wire_45 <= to_apintarray(to_apint(to_unsigned(129, 16)));
  -- constant dpe_91
  wire_64 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111101011000100100000000110001"))));
  -- constant dpe_99
  wire_72 <= to_APFloatArray(to_apfloat(to_stdlogicvector(bit_vector'(B"00111111000111010111001111111011"))));

  dpe_1_condition <= extract(wire_13, 0);
  dpe_1 : ApIntBranch -- bb: exit
  -- configuration: 
    port map(
      ack0 => SigmaOut(1),
      ack1 => SigmaOut(2),
      clk => clk,
      condition => dpe_1_condition,
      req => SigmaIn(1),
      reset => reset);

  dpe_10 : APInt_S_2 -- scevgep10.idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(11 downto 11),
      ackR => SigmaOut(10 downto 10),
      clk => clk,
      reqC => SigmaIn(11 downto 11),
      reqR => SigmaIn(10 downto 10),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_54);

  dpe_100 : APInt_S_1 -- .base.cast7
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(149 downto 149),
      ackR => SigmaOut(148 downto 148),
      clk => clk,
      reqC => SigmaIn(151 downto 151),
      reqR => SigmaIn(150 downto 150),
      reset => reset,
      x => wire_57,
      z => wire_73);

  dpe_101 : APInt_S_2 -- .idx.08
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(151 downto 151),
      ackR => SigmaOut(150 downto 150),
      clk => clk,
      reqC => SigmaIn(153 downto 153),
      reqR => SigmaIn(152 downto 152),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_74);

  dpe_102 : APInt_S_2 -- .lvl.09
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(153 downto 153),
      ackR => SigmaOut(152 downto 152),
      clk => clk,
      reqC => SigmaIn(155 downto 155),
      reqR => SigmaIn(154 downto 154),
      reset => reset,
      x => wire_73,
      y => wire_74,
      z => wire_75);

  dpe_103 : APInt_S_2 -- .idx.110
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(155 downto 155),
      ackR => SigmaOut(154 downto 154),
      clk => clk,
      reqC => SigmaIn(157 downto 157),
      reqR => SigmaIn(156 downto 156),
      reset => reset,
      x => wire_84,
      y => wire_26,
      z => wire_76);

  dpe_104 : APInt_S_2 -- .lvl.111
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(157 downto 157),
      ackR => SigmaOut(156 downto 156),
      clk => clk,
      reqC => SigmaIn(159 downto 159),
      reqR => SigmaIn(158 downto 158),
      reset => reset,
      x => wire_75,
      y => wire_76,
      z => wire_77);

  dpe_105 : APInt_S_1 -- .cast12
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(159 downto 159),
      ackR => SigmaOut(158 downto 158),
      clk => clk,
      reqC => SigmaIn(161 downto 161),
      reqR => SigmaIn(160 downto 160),
      reset => reset,
      x => wire_77,
      z => wire_78);

  dpe_106_data <= To_StdLogicArray2D(wire_79);
  dpe_106 : ApStoreReq -- store 6
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(160 downto 160),
      addr => wire_78,
      clk => clk,
      data => dpe_106_data,
      mack => sr_ack(3 downto 0),
      maddr => sr_addr(63 downto 0),
      mdata => sr_data(31 downto 0),
      mreq => sr_req(3 downto 0),
      mtag => sr_tag(31 downto 0),
      req => SigmaIn(162 downto 162),
      reset => reset);

  dpe_108 : APInt_S_1 -- .base.cast13
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(162 downto 162),
      ackR => SigmaOut(161 downto 161),
      clk => clk,
      reqC => SigmaIn(164 downto 164),
      reqR => SigmaIn(163 downto 163),
      reset => reset,
      x => wire_57,
      z => wire_81);

  dpe_109 : APInt_S_2 -- .idx.014
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(164 downto 164),
      ackR => SigmaOut(163 downto 163),
      clk => clk,
      reqC => SigmaIn(166 downto 166),
      reqR => SigmaIn(165 downto 165),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_82);

  dpe_110 : APInt_S_2 -- .lvl.015
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(166 downto 166),
      ackR => SigmaOut(165 downto 165),
      clk => clk,
      reqC => SigmaIn(168 downto 168),
      reqR => SigmaIn(167 downto 167),
      reset => reset,
      x => wire_81,
      y => wire_82,
      z => wire_83);

  dpe_111 : APInt_S_2 -- .idx.116
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(168 downto 168),
      ackR => SigmaOut(167 downto 167),
      clk => clk,
      reqC => SigmaIn(170 downto 170),
      reqR => SigmaIn(169 downto 169),
      reset => reset,
      x => wire_84,
      y => wire_86,
      z => wire_85);

  dpe_113 : APInt_S_2 -- .lvl.117
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(170 downto 170),
      ackR => SigmaOut(169 downto 169),
      clk => clk,
      reqC => SigmaIn(172 downto 172),
      reqR => SigmaIn(171 downto 171),
      reset => reset,
      x => wire_83,
      y => wire_85,
      z => wire_87);

  dpe_114 : APInt_S_1 -- .cast18
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(172 downto 172),
      ackR => SigmaOut(171 downto 171),
      clk => clk,
      reqC => SigmaIn(174 downto 174),
      reqR => SigmaIn(173 downto 173),
      reset => reset,
      x => wire_87,
      z => wire_88);

  dpe_115_data <= To_StdLogicArray2D(wire_89);
  dpe_115 : ApStoreReq -- store 7
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(173 downto 173),
      addr => wire_88,
      clk => clk,
      data => dpe_115_data,
      mack => sr_ack(7 downto 4),
      maddr => sr_addr(127 downto 64),
      mdata => sr_data(63 downto 32),
      mreq => sr_req(7 downto 4),
      mtag => sr_tag(63 downto 32),
      req => SigmaIn(175 downto 175),
      reset => reset);

  dpe_117 : APInt_S_1 -- .base.cast19
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(175 downto 175),
      ackR => SigmaOut(174 downto 174),
      clk => clk,
      reqC => SigmaIn(177 downto 177),
      reqR => SigmaIn(176 downto 176),
      reset => reset,
      x => wire_57,
      z => wire_90);

  dpe_118 : APInt_S_2 -- .idx.020
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(177 downto 177),
      ackR => SigmaOut(176 downto 176),
      clk => clk,
      reqC => SigmaIn(179 downto 179),
      reqR => SigmaIn(178 downto 178),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_91);

  dpe_119 : APInt_S_2 -- .lvl.021
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(179 downto 179),
      ackR => SigmaOut(178 downto 178),
      clk => clk,
      reqC => SigmaIn(181 downto 181),
      reqR => SigmaIn(180 downto 180),
      reset => reset,
      x => wire_90,
      y => wire_91,
      z => wire_92);

  dpe_12 : APInt_S_2 -- scevgep10.lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(13 downto 13),
      ackR => SigmaOut(12 downto 12),
      clk => clk,
      reqC => SigmaIn(13 downto 13),
      reqR => SigmaIn(12 downto 12),
      reset => reset,
      x => wire_43,
      y => wire_54,
      z => wire_68);

  dpe_120 : APInt_S_2 -- .idx.122
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(181 downto 181),
      ackR => SigmaOut(180 downto 180),
      clk => clk,
      reqC => SigmaIn(183 downto 183),
      reqR => SigmaIn(182 downto 182),
      reset => reset,
      x => wire_84,
      y => wire_84,
      z => wire_93);

  dpe_121 : APInt_S_2 -- .lvl.123
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(183 downto 183),
      ackR => SigmaOut(182 downto 182),
      clk => clk,
      reqC => SigmaIn(185 downto 185),
      reqR => SigmaIn(184 downto 184),
      reset => reset,
      x => wire_92,
      y => wire_93,
      z => wire_94);

  dpe_122 : APInt_S_1 -- .cast24
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(185 downto 185),
      ackR => SigmaOut(184 downto 184),
      clk => clk,
      reqC => SigmaIn(187 downto 187),
      reqR => SigmaIn(186 downto 186),
      reset => reset,
      x => wire_94,
      z => wire_96);

  dpe_123_data <= To_StdLogicArray2D(wire_97);
  dpe_123 : ApStoreReq -- store 8
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(186 downto 186),
      addr => wire_96,
      clk => clk,
      data => dpe_123_data,
      mack => sr_ack(11 downto 8),
      maddr => sr_addr(191 downto 128),
      mdata => sr_data(95 downto 64),
      mreq => sr_req(11 downto 8),
      mtag => sr_tag(95 downto 64),
      req => SigmaIn(188 downto 188),
      reset => reset);

  dpe_125 : APInt_S_1 -- .base.cast25
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(188 downto 188),
      ackR => SigmaOut(187 downto 187),
      clk => clk,
      reqC => SigmaIn(190 downto 190),
      reqR => SigmaIn(189 downto 189),
      reset => reset,
      x => wire_57,
      z => wire_98);

  dpe_126 : APInt_S_2 -- .idx.026
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(190 downto 190),
      ackR => SigmaOut(189 downto 189),
      clk => clk,
      reqC => SigmaIn(192 downto 192),
      reqR => SigmaIn(191 downto 191),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_99);

  dpe_127 : APInt_S_2 -- .lvl.027
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(192 downto 192),
      ackR => SigmaOut(191 downto 191),
      clk => clk,
      reqC => SigmaIn(194 downto 194),
      reqR => SigmaIn(193 downto 193),
      reset => reset,
      x => wire_98,
      y => wire_99,
      z => wire_100);

  dpe_128 : APInt_S_2 -- .idx.128
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(194 downto 194),
      ackR => SigmaOut(193 downto 193),
      clk => clk,
      reqC => SigmaIn(196 downto 196),
      reqR => SigmaIn(195 downto 195),
      reset => reset,
      x => wire_84,
      y => wire_102,
      z => wire_101);

  dpe_13 : APInt_S_2 -- scevgep10.idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(15 downto 15),
      ackR => SigmaOut(14 downto 14),
      clk => clk,
      reqC => SigmaIn(15 downto 15),
      reqR => SigmaIn(14 downto 14),
      reset => reset,
      x => wire_84,
      y => wire_8,
      z => wire_80);

  dpe_130 : APInt_S_2 -- .lvl.129
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(196 downto 196),
      ackR => SigmaOut(195 downto 195),
      clk => clk,
      reqC => SigmaIn(198 downto 198),
      reqR => SigmaIn(197 downto 197),
      reset => reset,
      x => wire_100,
      y => wire_101,
      z => wire_103);

  dpe_131 : APInt_S_1 -- .cast30
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(198 downto 198),
      ackR => SigmaOut(197 downto 197),
      clk => clk,
      reqC => SigmaIn(200 downto 200),
      reqR => SigmaIn(199 downto 199),
      reset => reset,
      x => wire_103,
      z => wire_104);

  dpe_132_data <= To_StdLogicArray2D(wire_105);
  dpe_132 : ApStoreReq -- store 9
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(199 downto 199),
      addr => wire_104,
      clk => clk,
      data => dpe_132_data,
      mack => sr_ack(15 downto 12),
      maddr => sr_addr(255 downto 192),
      mdata => sr_data(127 downto 96),
      mreq => sr_req(15 downto 12),
      mtag => sr_tag(127 downto 96),
      req => SigmaIn(201 downto 201),
      reset => reset);

  dpe_134 : APInt_S_1 -- .base.cast31
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(201 downto 201),
      ackR => SigmaOut(200 downto 200),
      clk => clk,
      reqC => SigmaIn(203 downto 203),
      reqR => SigmaIn(202 downto 202),
      reset => reset,
      x => wire_107,
      z => wire_106);

  dpe_136 : APInt_S_2 -- .idx.032
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(203 downto 203),
      ackR => SigmaOut(202 downto 202),
      clk => clk,
      reqC => SigmaIn(205 downto 205),
      reqR => SigmaIn(204 downto 204),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_109);

  dpe_137 : APInt_S_2 -- .lvl.033
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(205 downto 205),
      ackR => SigmaOut(204 downto 204),
      clk => clk,
      reqC => SigmaIn(207 downto 207),
      reqR => SigmaIn(206 downto 206),
      reset => reset,
      x => wire_106,
      y => wire_109,
      z => wire_110);

  dpe_138 : APInt_S_2 -- .idx.134
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(207 downto 207),
      ackR => SigmaOut(206 downto 206),
      clk => clk,
      reqC => SigmaIn(209 downto 209),
      reqR => SigmaIn(208 downto 208),
      reset => reset,
      x => wire_84,
      y => wire_16,
      z => wire_111);

  dpe_139 : APInt_S_2 -- .lvl.135
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(209 downto 209),
      ackR => SigmaOut(208 downto 208),
      clk => clk,
      reqC => SigmaIn(211 downto 211),
      reqR => SigmaIn(210 downto 210),
      reset => reset,
      x => wire_110,
      y => wire_111,
      z => wire_112);

  dpe_140 : APInt_S_1 -- .cast36
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(211 downto 211),
      ackR => SigmaOut(210 downto 210),
      clk => clk,
      reqC => SigmaIn(213 downto 213),
      reqR => SigmaIn(212 downto 212),
      reset => reset,
      x => wire_112,
      z => wire_113);

  dpe_141_data <= To_StdLogicArray2D(wire_114);
  dpe_141 : ApStoreReq -- store 10
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(212 downto 212),
      addr => wire_113,
      clk => clk,
      data => dpe_141_data,
      mack => sr_ack(19 downto 16),
      maddr => sr_addr(319 downto 256),
      mdata => sr_data(159 downto 128),
      mreq => sr_req(19 downto 16),
      mtag => sr_tag(159 downto 128),
      req => SigmaIn(214 downto 214),
      reset => reset);

  dpe_143 : APInt_S_1 -- .base.cast37
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(214 downto 214),
      ackR => SigmaOut(213 downto 213),
      clk => clk,
      reqC => SigmaIn(216 downto 216),
      reqR => SigmaIn(215 downto 215),
      reset => reset,
      x => wire_107,
      z => wire_115);

  dpe_144 : APInt_S_2 -- .idx.038
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(216 downto 216),
      ackR => SigmaOut(215 downto 215),
      clk => clk,
      reqC => SigmaIn(218 downto 218),
      reqR => SigmaIn(217 downto 217),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_116);

  dpe_145 : APInt_S_2 -- .lvl.039
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(218 downto 218),
      ackR => SigmaOut(217 downto 217),
      clk => clk,
      reqC => SigmaIn(220 downto 220),
      reqR => SigmaIn(219 downto 219),
      reset => reset,
      x => wire_115,
      y => wire_116,
      z => wire_117);

  dpe_146 : APInt_S_2 -- .idx.140
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(220 downto 220),
      ackR => SigmaOut(219 downto 219),
      clk => clk,
      reqC => SigmaIn(222 downto 222),
      reqR => SigmaIn(221 downto 221),
      reset => reset,
      x => wire_84,
      y => wire_170,
      z => wire_119);

  dpe_147 : APInt_S_2 -- .lvl.141
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(222 downto 222),
      ackR => SigmaOut(221 downto 221),
      clk => clk,
      reqC => SigmaIn(224 downto 224),
      reqR => SigmaIn(223 downto 223),
      reset => reset,
      x => wire_117,
      y => wire_119,
      z => wire_120);

  dpe_148 : APInt_S_1 -- .cast42
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(224 downto 224),
      ackR => SigmaOut(223 downto 223),
      clk => clk,
      reqC => SigmaIn(226 downto 226),
      reqR => SigmaIn(225 downto 225),
      reset => reset,
      x => wire_120,
      z => wire_121);

  dpe_149_data <= To_StdLogicArray2D(wire_123);
  dpe_149 : ApStoreReq -- store 11
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(225 downto 225),
      addr => wire_121,
      clk => clk,
      data => dpe_149_data,
      mack => sr_ack(23 downto 20),
      maddr => sr_addr(383 downto 320),
      mdata => sr_data(191 downto 160),
      mreq => sr_req(23 downto 20),
      mtag => sr_tag(191 downto 160),
      req => SigmaIn(227 downto 227),
      reset => reset);

  dpe_15 : APInt_S_2 -- scevgep10.lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(17 downto 17),
      ackR => SigmaOut(16 downto 16),
      clk => clk,
      reqC => SigmaIn(17 downto 17),
      reqR => SigmaIn(16 downto 16),
      reset => reset,
      x => wire_68,
      y => wire_80,
      z => wire_95);

  dpe_151 : APInt_S_1 -- .base.cast43
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(227 downto 227),
      ackR => SigmaOut(226 downto 226),
      clk => clk,
      reqC => SigmaIn(229 downto 229),
      reqR => SigmaIn(228 downto 228),
      reset => reset,
      x => wire_107,
      z => wire_124);

  dpe_152 : APInt_S_2 -- .idx.044
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(229 downto 229),
      ackR => SigmaOut(228 downto 228),
      clk => clk,
      reqC => SigmaIn(231 downto 231),
      reqR => SigmaIn(230 downto 230),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_125);

  dpe_153 : APInt_S_2 -- .lvl.045
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(231 downto 231),
      ackR => SigmaOut(230 downto 230),
      clk => clk,
      reqC => SigmaIn(233 downto 233),
      reqR => SigmaIn(232 downto 232),
      reset => reset,
      x => wire_124,
      y => wire_125,
      z => wire_126);

  dpe_154 : APInt_S_2 -- .idx.146
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(233 downto 233),
      ackR => SigmaOut(232 downto 232),
      clk => clk,
      reqC => SigmaIn(235 downto 235),
      reqR => SigmaIn(234 downto 234),
      reset => reset,
      x => wire_84,
      y => wire_26,
      z => wire_127);

  dpe_155 : APInt_S_2 -- .lvl.147
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(235 downto 235),
      ackR => SigmaOut(234 downto 234),
      clk => clk,
      reqC => SigmaIn(237 downto 237),
      reqR => SigmaIn(236 downto 236),
      reset => reset,
      x => wire_126,
      y => wire_127,
      z => wire_128);

  dpe_156 : APInt_S_1 -- .cast48
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(237 downto 237),
      ackR => SigmaOut(236 downto 236),
      clk => clk,
      reqC => SigmaIn(239 downto 239),
      reqR => SigmaIn(238 downto 238),
      reset => reset,
      x => wire_128,
      z => wire_129);

  dpe_157_data <= To_StdLogicArray2D(wire_130);
  dpe_157 : ApStoreReq -- store 12
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(238 downto 238),
      addr => wire_129,
      clk => clk,
      data => dpe_157_data,
      mack => sr_ack(27 downto 24),
      maddr => sr_addr(447 downto 384),
      mdata => sr_data(223 downto 192),
      mreq => sr_req(27 downto 24),
      mtag => sr_tag(223 downto 192),
      req => SigmaIn(240 downto 240),
      reset => reset);

  dpe_159 : APInt_S_1 -- .base.cast49
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(240 downto 240),
      ackR => SigmaOut(239 downto 239),
      clk => clk,
      reqC => SigmaIn(242 downto 242),
      reqR => SigmaIn(241 downto 241),
      reset => reset,
      x => wire_107,
      z => wire_131);

  dpe_16 : APInt_S_1 -- scevgep10.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(19 downto 19),
      ackR => SigmaOut(18 downto 18),
      clk => clk,
      reqC => SigmaIn(19 downto 19),
      reqR => SigmaIn(18 downto 18),
      reset => reset,
      x => wire_95,
      z => wire_108);

  dpe_160 : APInt_S_2 -- .idx.050
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(242 downto 242),
      ackR => SigmaOut(241 downto 241),
      clk => clk,
      reqC => SigmaIn(244 downto 244),
      reqR => SigmaIn(243 downto 243),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_133);

  dpe_161 : APInt_S_2 -- .lvl.051
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(244 downto 244),
      ackR => SigmaOut(243 downto 243),
      clk => clk,
      reqC => SigmaIn(246 downto 246),
      reqR => SigmaIn(245 downto 245),
      reset => reset,
      x => wire_131,
      y => wire_133,
      z => wire_134);

  dpe_162 : APInt_S_2 -- .idx.152
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(246 downto 246),
      ackR => SigmaOut(245 downto 245),
      clk => clk,
      reqC => SigmaIn(248 downto 248),
      reqR => SigmaIn(247 downto 247),
      reset => reset,
      x => wire_84,
      y => wire_86,
      z => wire_135);

  dpe_163 : APInt_S_2 -- .lvl.153
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(248 downto 248),
      ackR => SigmaOut(247 downto 247),
      clk => clk,
      reqC => SigmaIn(250 downto 250),
      reqR => SigmaIn(249 downto 249),
      reset => reset,
      x => wire_134,
      y => wire_135,
      z => wire_136);

  dpe_164 : APInt_S_1 -- .cast54
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(250 downto 250),
      ackR => SigmaOut(249 downto 249),
      clk => clk,
      reqC => SigmaIn(252 downto 252),
      reqR => SigmaIn(251 downto 251),
      reset => reset,
      x => wire_136,
      z => wire_137);

  dpe_165_data <= To_StdLogicArray2D(wire_138);
  dpe_165 : ApStoreReq -- store 13
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(251 downto 251),
      addr => wire_137,
      clk => clk,
      data => dpe_165_data,
      mack => sr_ack(31 downto 28),
      maddr => sr_addr(511 downto 448),
      mdata => sr_data(255 downto 224),
      mreq => sr_req(31 downto 28),
      mtag => sr_tag(255 downto 224),
      req => SigmaIn(253 downto 253),
      reset => reset);

  dpe_167 : APInt_S_1 -- .base.cast55
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(253 downto 253),
      ackR => SigmaOut(252 downto 252),
      clk => clk,
      reqC => SigmaIn(255 downto 255),
      reqR => SigmaIn(254 downto 254),
      reset => reset,
      x => wire_107,
      z => wire_139);

  dpe_168 : APInt_S_2 -- .idx.056
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(255 downto 255),
      ackR => SigmaOut(254 downto 254),
      clk => clk,
      reqC => SigmaIn(257 downto 257),
      reqR => SigmaIn(256 downto 256),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_140);

  dpe_169 : APInt_S_2 -- .lvl.057
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(257 downto 257),
      ackR => SigmaOut(256 downto 256),
      clk => clk,
      reqC => SigmaIn(259 downto 259),
      reqR => SigmaIn(258 downto 258),
      reset => reset,
      x => wire_139,
      y => wire_140,
      z => wire_141);

  dpe_17 : APInt_S_1 -- scevgep11.base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(21 downto 21),
      ackR => SigmaOut(20 downto 20),
      clk => clk,
      reqC => SigmaIn(21 downto 21),
      reqR => SigmaIn(20 downto 20),
      reset => reset,
      x => wire_122,
      z => wire_118);

  dpe_170 : APInt_S_2 -- .idx.158
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(259 downto 259),
      ackR => SigmaOut(258 downto 258),
      clk => clk,
      reqC => SigmaIn(261 downto 261),
      reqR => SigmaIn(260 downto 260),
      reset => reset,
      x => wire_84,
      y => wire_84,
      z => wire_143);

  dpe_171 : APInt_S_2 -- .lvl.159
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(261 downto 261),
      ackR => SigmaOut(260 downto 260),
      clk => clk,
      reqC => SigmaIn(263 downto 263),
      reqR => SigmaIn(262 downto 262),
      reset => reset,
      x => wire_141,
      y => wire_143,
      z => wire_144);

  dpe_172 : APInt_S_1 -- .cast60
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(263 downto 263),
      ackR => SigmaOut(262 downto 262),
      clk => clk,
      reqC => SigmaIn(265 downto 265),
      reqR => SigmaIn(264 downto 264),
      reset => reset,
      x => wire_144,
      z => wire_145);

  dpe_173_data <= To_StdLogicArray2D(wire_146);
  dpe_173 : ApStoreReq -- store 14
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(264 downto 264),
      addr => wire_145,
      clk => clk,
      data => dpe_173_data,
      mack => sr_ack(35 downto 32),
      maddr => sr_addr(575 downto 512),
      mdata => sr_data(287 downto 256),
      mreq => sr_req(35 downto 32),
      mtag => sr_tag(287 downto 256),
      req => SigmaIn(266 downto 266),
      reset => reset);

  dpe_175 : APInt_S_1 -- .base.cast61
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(266 downto 266),
      ackR => SigmaOut(265 downto 265),
      clk => clk,
      reqC => SigmaIn(268 downto 268),
      reqR => SigmaIn(267 downto 267),
      reset => reset,
      x => wire_107,
      z => wire_147);

  dpe_176 : APInt_S_2 -- .idx.062
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(268 downto 268),
      ackR => SigmaOut(267 downto 267),
      clk => clk,
      reqC => SigmaIn(270 downto 270),
      reqR => SigmaIn(269 downto 269),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_148);

  dpe_177 : APInt_S_2 -- .lvl.063
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(270 downto 270),
      ackR => SigmaOut(269 downto 269),
      clk => clk,
      reqC => SigmaIn(272 downto 272),
      reqR => SigmaIn(271 downto 271),
      reset => reset,
      x => wire_147,
      y => wire_148,
      z => wire_149);

  dpe_178 : APInt_S_2 -- .idx.164
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(272 downto 272),
      ackR => SigmaOut(271 downto 271),
      clk => clk,
      reqC => SigmaIn(274 downto 274),
      reqR => SigmaIn(273 downto 273),
      reset => reset,
      x => wire_84,
      y => wire_102,
      z => wire_150);

  dpe_179 : APInt_S_2 -- .lvl.165
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(274 downto 274),
      ackR => SigmaOut(273 downto 273),
      clk => clk,
      reqC => SigmaIn(276 downto 276),
      reqR => SigmaIn(275 downto 275),
      reset => reset,
      x => wire_149,
      y => wire_150,
      z => wire_151);

  dpe_180 : APInt_S_1 -- .cast66
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(276 downto 276),
      ackR => SigmaOut(275 downto 275),
      clk => clk,
      reqC => SigmaIn(278 downto 278),
      reqR => SigmaIn(277 downto 277),
      reset => reset,
      x => wire_151,
      z => wire_152);

  dpe_181_data <= To_StdLogicArray2D(wire_153);
  dpe_181 : ApStoreReq -- store 15
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(277 downto 277),
      addr => wire_152,
      clk => clk,
      data => dpe_181_data,
      mack => sr_ack(39 downto 36),
      maddr => sr_addr(639 downto 576),
      mdata => sr_data(319 downto 288),
      mreq => sr_req(39 downto 36),
      mtag => sr_tag(319 downto 288),
      req => SigmaIn(279 downto 279),
      reset => reset);

  dpe_183_data <= to_stdlogicarray2d(dpe_183_data_0);
  dpe_183 : OutputPort -- Call_487
  -- configuration: 
  -- counterpart: dpe_184
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(278 downto 278),
      clk => clk,
      data => dpe_183_data,
      oack => call_dpe_183_ack,
      odata => call_dpe_183_data,
      oreq => call_dpe_183_req,
      req => SigmaIn(280 downto 280),
      reset => reset);

  wire_155 <= to_APIntArray(To_StdLogicArray2D(dpe_184_data_0(32 downto 1)));
  dpe_184_data_0 <= extract(dpe_184_data, 0);
  dpe_184 : InputPort -- Response_490
  -- configuration: 
  -- counterpart: dpe_183
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(279 downto 279),
      clk => clk,
      data => dpe_184_data,
      oack => return_dpe_183_ack,
      odata => return_dpe_183_data,
      oreq => return_dpe_183_req,
      req => SigmaIn(281 downto 281),
      reset => reset);

  dpe_185_data <= to_stdlogicarray2d(dpe_185_data_0);
  dpe_185 : OutputPort -- Call_493
  -- configuration: 
  -- counterpart: dpe_186
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(280 downto 280),
      clk => clk,
      data => dpe_185_data,
      oack => call_dpe_185_ack,
      odata => call_dpe_185_data,
      oreq => call_dpe_185_req,
      req => SigmaIn(282 downto 282),
      reset => reset);

  wire_156 <= to_APFloatArray(To_StdLogicArray2D(dpe_186_data_0(32 downto 1)));
  dpe_186_data_0 <= extract(dpe_186_data, 0);
  dpe_186 : InputPort -- Response_496
  -- configuration: 
  -- counterpart: dpe_185
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(281 downto 281),
      clk => clk,
      data => dpe_186_data,
      oack => return_dpe_185_ack,
      odata => return_dpe_185_data,
      oreq => return_dpe_185_req,
      req => SigmaIn(283 downto 283),
      reset => reset);

  dpe_187 : APFloatToAPInt_S_1 -- FPToSI_499
  -- configuration: APFloatToAPIntSigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(283 downto 283),
      ackR => SigmaOut(282 downto 282),
      clk => clk,
      reqC => SigmaIn(285 downto 285),
      reqR => SigmaIn(284 downto 284),
      reset => reset,
      x => wire_156,
      z => wire_157);

  dpe_188_data <= to_stdlogicarray2d(dpe_188_data_0);
  dpe_188 : OutputPort -- Call_502
  -- configuration: 
  -- counterpart: dpe_189
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(284 downto 284),
      clk => clk,
      data => dpe_188_data,
      oack => call_dpe_188_ack,
      odata => call_dpe_188_data,
      oreq => call_dpe_188_req,
      req => SigmaIn(286 downto 286),
      reset => reset);

  wire_158 <= to_APIntArray(To_StdLogicArray2D(dpe_189_data_0(16 downto 1)));
  dpe_189_data_0 <= extract(dpe_189_data, 0);
  dpe_189 : InputPort -- Response_505
  -- configuration: 
  -- counterpart: dpe_188
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(285 downto 285),
      clk => clk,
      data => dpe_189_data,
      oack => return_dpe_188_ack,
      odata => return_dpe_188_data,
      oreq => return_dpe_188_req,
      req => SigmaIn(287 downto 287),
      reset => reset);

  dpe_19 : APInt_S_2 -- scevgep11.idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(23 downto 23),
      ackR => SigmaOut(22 downto 22),
      clk => clk,
      reqC => SigmaIn(23 downto 23),
      reqR => SigmaIn(22 downto 22),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_132);

  dpe_190 : APInt_S_1 -- SExt_508
  -- configuration: APIntToAPIntSigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(287 downto 287),
      ackR => SigmaOut(286 downto 286),
      clk => clk,
      reqC => SigmaIn(289 downto 289),
      reqR => SigmaIn(288 downto 288),
      reset => reset,
      x => wire_158,
      z => wire_159);

  dpe_191 : APInt_S_2 -- Xor_511
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(289 downto 289),
      ackR => SigmaOut(288 downto 288),
      clk => clk,
      reqC => SigmaIn(291 downto 291),
      reqR => SigmaIn(290 downto 290),
      reset => reset,
      x => wire_157,
      y => wire_155,
      z => wire_160);

  dpe_192 : APInt_S_2 -- Xor_514
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(291 downto 291),
      ackR => SigmaOut(290 downto 290),
      clk => clk,
      reqC => SigmaIn(293 downto 293),
      reqR => SigmaIn(292 downto 292),
      reset => reset,
      x => wire_160,
      y => wire_159,
      z => wire_161);

  dpe_193_data_0(32 downto 1) <= to_slv(extract(wire_161, 0));
  dpe_193_data <= to_stdlogicarray2d(dpe_193_data_0);
  dpe_193 : OutputPort -- Return_517
  -- configuration: 
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(292 downto 292),
      clk => clk,
      data => dpe_193_data,
      oack => return_ack,
      odata => return_data,
      oreq => return_req,
      req => SigmaIn(294 downto 294),
      reset => reset);

  dpe_2_condition <= extract(wire_55, 0);
  dpe_2 : ApIntBranch -- bb3: exit
  -- configuration: 
    port map(
      ack0 => SigmaOut(3),
      ack1 => SigmaOut(4),
      clk => clk,
      condition => dpe_2_condition,
      req => SigmaIn(2),
      reset => reset);

  dpe_20 : APInt_S_2 -- scevgep11.lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(25 downto 25),
      ackR => SigmaOut(24 downto 24),
      clk => clk,
      reqC => SigmaIn(25 downto 25),
      reqR => SigmaIn(24 downto 24),
      reset => reset,
      x => wire_118,
      y => wire_132,
      z => wire_142);

  dpe_21 : APInt_S_2 -- scevgep11.idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(27 downto 27),
      ackR => SigmaOut(26 downto 26),
      clk => clk,
      reqC => SigmaIn(27 downto 27),
      reqR => SigmaIn(26 downto 26),
      reset => reset,
      x => wire_84,
      y => wire_8,
      z => wire_154);

  dpe_22 : APInt_S_2 -- scevgep11.lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(29 downto 29),
      ackR => SigmaOut(28 downto 28),
      clk => clk,
      reqC => SigmaIn(29 downto 29),
      reqR => SigmaIn(28 downto 28),
      reset => reset,
      x => wire_142,
      y => wire_154,
      z => wire_162);

  dpe_23 : APInt_S_1 -- scevgep11.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(31 downto 31),
      ackR => SigmaOut(30 downto 30),
      clk => clk,
      reqC => SigmaIn(31 downto 31),
      reqR => SigmaIn(30 downto 30),
      reset => reset,
      x => wire_162,
      z => wire_163);

  dpe_24 : APInt_S_2 -- LShr_67
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(33 downto 33),
      ackR => SigmaOut(32 downto 32),
      clk => clk,
      reqC => SigmaIn(33 downto 33),
      reqR => SigmaIn(32 downto 32),
      reset => reset,
      x => wire_23,
      y => wire_165,
      z => wire_164);

  dpe_26 : APInt_S_2 -- LShr_71
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(35 downto 35),
      ackR => SigmaOut(34 downto 34),
      clk => clk,
      reqC => SigmaIn(35 downto 35),
      reqR => SigmaIn(34 downto 34),
      reset => reset,
      x => wire_23,
      y => wire_167,
      z => wire_166);

  dpe_28 : APInt_S_2 -- Xor_75
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(37 downto 37),
      ackR => SigmaOut(36 downto 36),
      clk => clk,
      reqC => SigmaIn(37 downto 37),
      reqR => SigmaIn(36 downto 36),
      reset => reset,
      x => wire_164,
      y => wire_166,
      z => wire_168);

  dpe_29 : APInt_S_2 -- And_78
  -- configuration: APIntAnd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(39 downto 39),
      ackR => SigmaOut(38 downto 38),
      clk => clk,
      reqC => SigmaIn(39 downto 39),
      reqR => SigmaIn(38 downto 38),
      reset => reset,
      x => wire_168,
      y => wire_170,
      z => wire_169);

  dpe_3_data_0 <= extract(dpe_3_data, 0);
  dpe_3 : InputPort -- incoming call
  -- configuration: 
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(5 downto 5),
      clk => clk,
      data => dpe_3_data,
      oack => call_req,
      odata => call_data,
      oreq => call_ack,
      req => SigmaIn(3 downto 3),
      reset => reset);

  dpe_31 : APInt_S_2 -- Shl_82
  -- configuration: APIntShl
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(41 downto 41),
      ackR => SigmaOut(40 downto 40),
      clk => clk,
      reqC => SigmaIn(41 downto 41),
      reqR => SigmaIn(40 downto 40),
      reset => reset,
      x => wire_23,
      y => wire_170,
      z => wire_1);

  dpe_32 : APInt_S_2 -- Or_85
  -- configuration: APIntOr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(43 downto 43),
      ackR => SigmaOut(42 downto 42),
      clk => clk,
      reqC => SigmaIn(43 downto 43),
      reqR => SigmaIn(42 downto 42),
      reset => reset,
      x => wire_169,
      y => wire_1,
      z => wire_2);

  dpe_33_data <= To_StdLogicArray2D(wire_2);
  dpe_33 : ApStoreReq -- store 0
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(44 downto 44),
      addr => wire_108,
      clk => clk,
      data => dpe_33_data,
      mack => sr_ack(43 downto 40),
      maddr => sr_addr(703 downto 640),
      mdata => sr_data(351 downto 320),
      mreq => sr_req(43 downto 40),
      mtag => sr_tag(351 downto 320),
      req => SigmaIn(44 downto 44),
      reset => reset);

  dpe_34 : APInt_S_2 -- LShr_91
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(46 downto 46),
      ackR => SigmaOut(45 downto 45),
      clk => clk,
      reqC => SigmaIn(46 downto 46),
      reqR => SigmaIn(45 downto 45),
      reset => reset,
      x => wire_23,
      y => wire_4,
      z => wire_3);

  dpe_36 : APInt_S_2 -- LShr_95
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(48 downto 48),
      ackR => SigmaOut(47 downto 47),
      clk => clk,
      reqC => SigmaIn(48 downto 48),
      reqR => SigmaIn(47 downto 47),
      reset => reset,
      x => wire_23,
      y => wire_6,
      z => wire_5);

  dpe_38 : APInt_S_2 -- Xor_99
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(50 downto 50),
      ackR => SigmaOut(49 downto 49),
      clk => clk,
      reqC => SigmaIn(50 downto 50),
      reqR => SigmaIn(49 downto 49),
      reset => reset,
      x => wire_3,
      y => wire_5,
      z => wire_7);

  dpe_39 : APInt_S_2 -- And_102
  -- configuration: APIntAnd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(52 downto 52),
      ackR => SigmaOut(51 downto 51),
      clk => clk,
      reqC => SigmaIn(52 downto 52),
      reqR => SigmaIn(51 downto 51),
      reset => reset,
      x => wire_7,
      y => wire_170,
      z => wire_9);

  dpe_4_x <= extract(wire_12, 0);
  dpe_4_y <= extract(wire_16, 0);
  wire_8 <= to_APIntArray(dpe_4_z);
  dpe_4 : APIntPhi -- i.04: mux 1
  -- configuration: 
    port map(
      ack => SigmaOut(6),
      clk => clk,
      reqx => SigmaIn(4),
      reqy => SigmaIn(5),
      reset => reset,
      x => dpe_4_x,
      y => dpe_4_y,
      z => dpe_4_z);

  dpe_40 : APInt_S_2 -- Shl_105
  -- configuration: APIntShl
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(54 downto 54),
      ackR => SigmaOut(53 downto 53),
      clk => clk,
      reqC => SigmaIn(54 downto 54),
      reqR => SigmaIn(53 downto 53),
      reset => reset,
      x => wire_2,
      y => wire_170,
      z => wire_10);

  dpe_41 : APInt_S_2 -- Or_108
  -- configuration: APIntOr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(56 downto 56),
      ackR => SigmaOut(55 downto 55),
      clk => clk,
      reqC => SigmaIn(56 downto 56),
      reqR => SigmaIn(55 downto 55),
      reset => reset,
      x => wire_10,
      y => wire_9,
      z => wire_11);

  dpe_42_data <= To_StdLogicArray2D(wire_11);
  dpe_42 : ApStoreReq -- store 1
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(57 downto 57),
      addr => wire_163,
      clk => clk,
      data => dpe_42_data,
      mack => sr_ack(47 downto 44),
      maddr => sr_addr(767 downto 704),
      mdata => sr_data(383 downto 352),
      mreq => sr_req(47 downto 44),
      mtag => sr_tag(383 downto 352),
      req => SigmaIn(57 downto 57),
      reset => reset);

  dpe_43 : APInt_S_2 -- Add_114
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(59 downto 59),
      ackR => SigmaOut(58 downto 58),
      clk => clk,
      reqC => SigmaIn(59 downto 59),
      reqR => SigmaIn(58 downto 58),
      reset => reset,
      x => wire_8,
      y => wire_170,
      z => wire_12);

  dpe_44 : APInt_S_2 -- exitcond9
  -- configuration: APIntEQ
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(61 downto 61),
      ackR => SigmaOut(60 downto 60),
      clk => clk,
      reqC => SigmaIn(61 downto 61),
      reqR => SigmaIn(60 downto 60),
      reset => reset,
      x => wire_12,
      y => wire_14,
      z => wire_13);

  dpe_46_x <= extract(wire_16, 0);
  dpe_46_y <= extract(wire_53, 0);
  wire_15 <= to_APIntArray(dpe_46_z);
  dpe_46 : APIntPhi -- i.12: mux 1
  -- configuration: 
    port map(
      ack => SigmaOut(62),
      clk => clk,
      reqx => SigmaIn(62),
      reqy => SigmaIn(63),
      reset => reset,
      x => dpe_46_x,
      y => dpe_46_y,
      z => dpe_46_z);

  dpe_47_x <= extract(wire_18, 0);
  dpe_47_y <= extract(wire_51, 0);
  wire_17 <= to_APIntArray(dpe_47_z);
  dpe_47 : APIntPhi -- reg.11: mux 1
  -- configuration: 
    port map(
      ack => SigmaOut(63),
      clk => clk,
      reqx => SigmaIn(64),
      reqy => SigmaIn(65),
      reset => reset,
      x => dpe_47_x,
      y => dpe_47_y,
      z => dpe_47_z);

  dpe_49 : APInt_S_1 -- scevgep.base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(65 downto 65),
      ackR => SigmaOut(64 downto 64),
      clk => clk,
      reqC => SigmaIn(67 downto 67),
      reqR => SigmaIn(66 downto 66),
      reset => reset,
      x => wire_20,
      z => wire_19);

  dpe_51 : APInt_S_2 -- scevgep.idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(67 downto 67),
      ackR => SigmaOut(66 downto 66),
      clk => clk,
      reqC => SigmaIn(69 downto 69),
      reqR => SigmaIn(68 downto 68),
      reset => reset,
      x => wire_22,
      y => wire_16,
      z => wire_21);

  dpe_53 : APInt_S_2 -- scevgep.lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(69 downto 69),
      ackR => SigmaOut(68 downto 68),
      clk => clk,
      reqC => SigmaIn(71 downto 71),
      reqR => SigmaIn(70 downto 70),
      reset => reset,
      x => wire_19,
      y => wire_21,
      z => wire_24);

  dpe_54 : APInt_S_2 -- scevgep.idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(71 downto 71),
      ackR => SigmaOut(70 downto 70),
      clk => clk,
      reqC => SigmaIn(73 downto 73),
      reqR => SigmaIn(72 downto 72),
      reset => reset,
      x => wire_26,
      y => wire_15,
      z => wire_25);

  dpe_56 : APInt_S_2 -- scevgep.lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(73 downto 73),
      ackR => SigmaOut(72 downto 72),
      clk => clk,
      reqC => SigmaIn(75 downto 75),
      reqR => SigmaIn(74 downto 74),
      reset => reset,
      x => wire_24,
      y => wire_25,
      z => wire_27);

  dpe_57 : APInt_S_1 -- scevgep.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(75 downto 75),
      ackR => SigmaOut(74 downto 74),
      clk => clk,
      reqC => SigmaIn(77 downto 77),
      reqR => SigmaIn(76 downto 76),
      reset => reset,
      x => wire_27,
      z => wire_28);

  dpe_58 : APInt_S_1 -- scevgep8.base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(77 downto 77),
      ackR => SigmaOut(76 downto 76),
      clk => clk,
      reqC => SigmaIn(79 downto 79),
      reqR => SigmaIn(78 downto 78),
      reset => reset,
      x => wire_30,
      z => wire_29);

  dpe_6_x <= extract(wire_11, 0);
  dpe_6_y <= extract(wire_33, 0);
  wire_23 <= to_APIntArray(dpe_6_z);
  dpe_6 : APIntPhi -- reg.03: mux 1
  -- configuration: 
    port map(
      ack => SigmaOut(7),
      clk => clk,
      reqx => SigmaIn(6),
      reqy => SigmaIn(7),
      reset => reset,
      x => dpe_6_x,
      y => dpe_6_y,
      z => dpe_6_z);

  dpe_60 : APInt_S_2 -- scevgep8.idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(79 downto 79),
      ackR => SigmaOut(78 downto 78),
      clk => clk,
      reqC => SigmaIn(81 downto 81),
      reqR => SigmaIn(80 downto 80),
      reset => reset,
      x => wire_22,
      y => wire_16,
      z => wire_31);

  dpe_61 : APInt_S_2 -- scevgep8.lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(81 downto 81),
      ackR => SigmaOut(80 downto 80),
      clk => clk,
      reqC => SigmaIn(83 downto 83),
      reqR => SigmaIn(82 downto 82),
      reset => reset,
      x => wire_29,
      y => wire_31,
      z => wire_32);

  dpe_62 : APInt_S_2 -- scevgep8.idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(83 downto 83),
      ackR => SigmaOut(82 downto 82),
      clk => clk,
      reqC => SigmaIn(85 downto 85),
      reqR => SigmaIn(84 downto 84),
      reset => reset,
      x => wire_26,
      y => wire_15,
      z => wire_34);

  dpe_63 : APInt_S_2 -- scevgep8.lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(85 downto 85),
      ackR => SigmaOut(84 downto 84),
      clk => clk,
      reqC => SigmaIn(87 downto 87),
      reqR => SigmaIn(86 downto 86),
      reset => reset,
      x => wire_32,
      y => wire_34,
      z => wire_35);

  dpe_64 : APInt_S_1 -- scevgep8.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(87 downto 87),
      ackR => SigmaOut(86 downto 86),
      clk => clk,
      reqC => SigmaIn(89 downto 89),
      reqR => SigmaIn(88 downto 88),
      reset => reset,
      x => wire_35,
      z => wire_36);

  dpe_65 : APInt_S_2 -- LShr_165
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(89 downto 89),
      ackR => SigmaOut(88 downto 88),
      clk => clk,
      reqC => SigmaIn(91 downto 91),
      reqR => SigmaIn(90 downto 90),
      reset => reset,
      x => wire_17,
      y => wire_165,
      z => wire_37);

  dpe_66 : APInt_S_2 -- LShr_168
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(91 downto 91),
      ackR => SigmaOut(90 downto 90),
      clk => clk,
      reqC => SigmaIn(93 downto 93),
      reqR => SigmaIn(92 downto 92),
      reset => reset,
      x => wire_17,
      y => wire_167,
      z => wire_38);

  dpe_67 : APInt_S_2 -- Xor_171
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(93 downto 93),
      ackR => SigmaOut(92 downto 92),
      clk => clk,
      reqC => SigmaIn(95 downto 95),
      reqR => SigmaIn(94 downto 94),
      reset => reset,
      x => wire_37,
      y => wire_38,
      z => wire_39);

  dpe_68 : APInt_S_2 -- And_174
  -- configuration: APIntAnd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(95 downto 95),
      ackR => SigmaOut(94 downto 94),
      clk => clk,
      reqC => SigmaIn(97 downto 97),
      reqR => SigmaIn(96 downto 96),
      reset => reset,
      x => wire_39,
      y => wire_170,
      z => wire_40);

  dpe_69 : APInt_S_2 -- Shl_177
  -- configuration: APIntShl
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(97 downto 97),
      ackR => SigmaOut(96 downto 96),
      clk => clk,
      reqC => SigmaIn(99 downto 99),
      reqR => SigmaIn(98 downto 98),
      reset => reset,
      x => wire_17,
      y => wire_170,
      z => wire_41);

  dpe_70 : APInt_S_2 -- Or_180
  -- configuration: APIntOr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(99 downto 99),
      ackR => SigmaOut(98 downto 98),
      clk => clk,
      reqC => SigmaIn(101 downto 101),
      reqR => SigmaIn(100 downto 100),
      reset => reset,
      x => wire_40,
      y => wire_41,
      z => wire_42);

  dpe_71 : APInt_S_1 -- Trunc_183
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(101 downto 101),
      ackR => SigmaOut(100 downto 100),
      clk => clk,
      reqC => SigmaIn(103 downto 103),
      reqR => SigmaIn(102 downto 102),
      reset => reset,
      x => wire_42,
      z => wire_44);

  dpe_72_data <= To_StdLogicArray2D(wire_44);
  dpe_72 : ApStoreReq -- store 2
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 2))
    port map(
      ack => SigmaOut(102 downto 102),
      addr => wire_28,
      clk => clk,
      data => dpe_72_data,
      mack => sr_ack(49 downto 48),
      maddr => sr_addr(799 downto 768),
      mdata => sr_data(399 downto 384),
      mreq => sr_req(49 downto 48),
      mtag => sr_tag(399 downto 384),
      req => SigmaIn(104 downto 104),
      reset => reset);

  dpe_73 : APInt_S_2 -- LShr_189
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(104 downto 104),
      ackR => SigmaOut(103 downto 103),
      clk => clk,
      reqC => SigmaIn(106 downto 106),
      reqR => SigmaIn(105 downto 105),
      reset => reset,
      x => wire_17,
      y => wire_4,
      z => wire_46);

  dpe_74 : APInt_S_2 -- LShr_192
  -- configuration: APIntLShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(106 downto 106),
      ackR => SigmaOut(105 downto 105),
      clk => clk,
      reqC => SigmaIn(108 downto 108),
      reqR => SigmaIn(107 downto 107),
      reset => reset,
      x => wire_17,
      y => wire_6,
      z => wire_47);

  dpe_75 : APInt_S_2 -- Xor_195
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(108 downto 108),
      ackR => SigmaOut(107 downto 107),
      clk => clk,
      reqC => SigmaIn(110 downto 110),
      reqR => SigmaIn(109 downto 109),
      reset => reset,
      x => wire_46,
      y => wire_47,
      z => wire_48);

  dpe_76 : APInt_S_2 -- And_198
  -- configuration: APIntAnd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(110 downto 110),
      ackR => SigmaOut(109 downto 109),
      clk => clk,
      reqC => SigmaIn(112 downto 112),
      reqR => SigmaIn(111 downto 111),
      reset => reset,
      x => wire_48,
      y => wire_170,
      z => wire_49);

  dpe_77 : APInt_S_2 -- Shl_201
  -- configuration: APIntShl
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(112 downto 112),
      ackR => SigmaOut(111 downto 111),
      clk => clk,
      reqC => SigmaIn(114 downto 114),
      reqR => SigmaIn(113 downto 113),
      reset => reset,
      x => wire_42,
      y => wire_170,
      z => wire_50);

  dpe_78 : APInt_S_2 -- Or_204
  -- configuration: APIntOr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(114 downto 114),
      ackR => SigmaOut(113 downto 113),
      clk => clk,
      reqC => SigmaIn(116 downto 116),
      reqR => SigmaIn(115 downto 115),
      reset => reset,
      x => wire_50,
      y => wire_49,
      z => wire_51);

  dpe_79 : APInt_S_1 -- Trunc_207
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(116 downto 116),
      ackR => SigmaOut(115 downto 115),
      clk => clk,
      reqC => SigmaIn(118 downto 118),
      reqR => SigmaIn(117 downto 117),
      reset => reset,
      x => wire_51,
      z => wire_52);

  dpe_8 : APInt_S_1 -- scevgep10.base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(9 downto 9),
      ackR => SigmaOut(8 downto 8),
      clk => clk,
      reqC => SigmaIn(9 downto 9),
      reqR => SigmaIn(8 downto 8),
      reset => reset,
      x => wire_45,
      z => wire_43);

  dpe_80_data <= To_StdLogicArray2D(wire_52);
  dpe_80 : ApStoreReq -- store 3
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 2))
    port map(
      ack => SigmaOut(117 downto 117),
      addr => wire_36,
      clk => clk,
      data => dpe_80_data,
      mack => sr_ack(51 downto 50),
      maddr => sr_addr(831 downto 800),
      mdata => sr_data(415 downto 400),
      mreq => sr_req(51 downto 50),
      mtag => sr_tag(415 downto 400),
      req => SigmaIn(119 downto 119),
      reset => reset);

  dpe_81 : APInt_S_2 -- Add_213
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(119 downto 119),
      ackR => SigmaOut(118 downto 118),
      clk => clk,
      reqC => SigmaIn(121 downto 121),
      reqR => SigmaIn(120 downto 120),
      reset => reset,
      x => wire_15,
      y => wire_170,
      z => wire_53);

  dpe_82 : APInt_S_2 -- exitcond
  -- configuration: APIntEQ
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(121 downto 121),
      ackR => SigmaOut(120 downto 120),
      clk => clk,
      reqC => SigmaIn(123 downto 123),
      reqR => SigmaIn(122 downto 122),
      reset => reset,
      x => wire_53,
      y => wire_14,
      z => wire_55);

  dpe_83 : APInt_S_1 -- .base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(123 downto 123),
      ackR => SigmaOut(122 downto 122),
      clk => clk,
      reqC => SigmaIn(125 downto 125),
      reqR => SigmaIn(124 downto 124),
      reset => reset,
      x => wire_57,
      z => wire_56);

  dpe_85 : APInt_S_2 -- .idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(125 downto 125),
      ackR => SigmaOut(124 downto 124),
      clk => clk,
      reqC => SigmaIn(127 downto 127),
      reqR => SigmaIn(126 downto 126),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_59);

  dpe_86 : APInt_S_2 -- .lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(127 downto 127),
      ackR => SigmaOut(126 downto 126),
      clk => clk,
      reqC => SigmaIn(129 downto 129),
      reqR => SigmaIn(128 downto 128),
      reset => reset,
      x => wire_56,
      y => wire_59,
      z => wire_60);

  dpe_87 : APInt_S_2 -- .idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(129 downto 129),
      ackR => SigmaOut(128 downto 128),
      clk => clk,
      reqC => SigmaIn(131 downto 131),
      reqR => SigmaIn(130 downto 130),
      reset => reset,
      x => wire_84,
      y => wire_16,
      z => wire_61);

  dpe_88 : APInt_S_2 -- .lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(131 downto 131),
      ackR => SigmaOut(130 downto 130),
      clk => clk,
      reqC => SigmaIn(133 downto 133),
      reqR => SigmaIn(132 downto 132),
      reset => reset,
      x => wire_60,
      y => wire_61,
      z => wire_62);

  dpe_89 : APInt_S_1 -- .cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(133 downto 133),
      ackR => SigmaOut(132 downto 132),
      clk => clk,
      reqC => SigmaIn(135 downto 135),
      reqR => SigmaIn(134 downto 134),
      reset => reset,
      x => wire_62,
      z => wire_63);

  dpe_90_data <= To_StdLogicArray2D(wire_64);
  dpe_90 : ApStoreReq -- store 4
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(134 downto 134),
      addr => wire_63,
      clk => clk,
      data => dpe_90_data,
      mack => sr_ack(55 downto 52),
      maddr => sr_addr(895 downto 832),
      mdata => sr_data(447 downto 416),
      mreq => sr_req(55 downto 52),
      mtag => sr_tag(447 downto 416),
      req => SigmaIn(136 downto 136),
      reset => reset);

  dpe_92 : APInt_S_1 -- .base.cast1
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(136 downto 136),
      ackR => SigmaOut(135 downto 135),
      clk => clk,
      reqC => SigmaIn(138 downto 138),
      reqR => SigmaIn(137 downto 137),
      reset => reset,
      x => wire_57,
      z => wire_65);

  dpe_93 : APInt_S_2 -- .idx.02
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(138 downto 138),
      ackR => SigmaOut(137 downto 137),
      clk => clk,
      reqC => SigmaIn(140 downto 140),
      reqR => SigmaIn(139 downto 139),
      reset => reset,
      x => wire_58,
      y => wire_16,
      z => wire_66);

  dpe_94 : APInt_S_2 -- .lvl.03
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(140 downto 140),
      ackR => SigmaOut(139 downto 139),
      clk => clk,
      reqC => SigmaIn(142 downto 142),
      reqR => SigmaIn(141 downto 141),
      reset => reset,
      x => wire_65,
      y => wire_66,
      z => wire_67);

  dpe_95 : APInt_S_2 -- .idx.14
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(142 downto 142),
      ackR => SigmaOut(141 downto 141),
      clk => clk,
      reqC => SigmaIn(144 downto 144),
      reqR => SigmaIn(143 downto 143),
      reset => reset,
      x => wire_84,
      y => wire_170,
      z => wire_69);

  dpe_96 : APInt_S_2 -- .lvl.15
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(144 downto 144),
      ackR => SigmaOut(143 downto 143),
      clk => clk,
      reqC => SigmaIn(146 downto 146),
      reqR => SigmaIn(145 downto 145),
      reset => reset,
      x => wire_67,
      y => wire_69,
      z => wire_70);

  dpe_97 : APInt_S_1 -- .cast6
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(146 downto 146),
      ackR => SigmaOut(145 downto 145),
      clk => clk,
      reqC => SigmaIn(148 downto 148),
      reqR => SigmaIn(147 downto 147),
      reset => reset,
      x => wire_70,
      z => wire_71);

  dpe_98_data <= To_StdLogicArray2D(wire_72);
  dpe_98 : ApStoreReq -- store 5
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(147 downto 147),
      addr => wire_71,
      clk => clk,
      data => dpe_98_data,
      mack => sr_ack(59 downto 56),
      maddr => sr_addr(959 downto 896),
      mdata => sr_data(479 downto 448),
      mreq => sr_req(59 downto 56),
      mtag => sr_tag(479 downto 448),
      req => SigmaIn(149 downto 149),
      reset => reset);

end default_arch;

configuration start_dp_config of start_dp is
  for default_arch

    for dpe_10 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_100 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_101 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_102 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_103 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_104 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_105 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_108 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_109 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_110 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_111 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_113 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_114 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_117 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_118 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_119 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_12 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_120 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_121 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_122 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_125 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_126 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_127 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_128 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_13 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_130 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_131 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_134 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_136 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_137 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_138 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_139 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_140 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_143 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_144 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_145 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_146 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_147 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_148 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_15 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_151 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_152 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_153 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_154 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_155 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_156 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_159 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_16 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_160 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_161 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_162 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_163 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_164 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_167 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_168 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_169 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_17 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_170 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_171 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_172 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_175 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_176 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_177 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_178 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_179 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_180 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_187 : APFloatToAPInt_S_1
      use configuration ahir.APFloatToAPIntSigned;
    end for;

    for dpe_19 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_190 : APInt_S_1
      use configuration ahir.APIntToAPIntSigned;
    end for;

    for dpe_191 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_192 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_20 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_21 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_22 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_23 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_24 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_26 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_28 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_29 : APInt_S_2
      use configuration ahir.APIntAnd;
    end for;

    for dpe_31 : APInt_S_2
      use configuration ahir.APIntShl;
    end for;

    for dpe_32 : APInt_S_2
      use configuration ahir.APIntOr;
    end for;

    for dpe_34 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_36 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_38 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_39 : APInt_S_2
      use configuration ahir.APIntAnd;
    end for;

    for dpe_40 : APInt_S_2
      use configuration ahir.APIntShl;
    end for;

    for dpe_41 : APInt_S_2
      use configuration ahir.APIntOr;
    end for;

    for dpe_43 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_44 : APInt_S_2
      use configuration ahir.APIntEQ;
    end for;

    for dpe_49 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_51 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_53 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_54 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_56 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_57 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_58 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_60 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_61 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_62 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_63 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_64 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_65 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_66 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_67 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_68 : APInt_S_2
      use configuration ahir.APIntAnd;
    end for;

    for dpe_69 : APInt_S_2
      use configuration ahir.APIntShl;
    end for;

    for dpe_70 : APInt_S_2
      use configuration ahir.APIntOr;
    end for;

    for dpe_71 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_73 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_74 : APInt_S_2
      use configuration ahir.APIntLShr;
    end for;

    for dpe_75 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_76 : APInt_S_2
      use configuration ahir.APIntAnd;
    end for;

    for dpe_77 : APInt_S_2
      use configuration ahir.APIntShl;
    end for;

    for dpe_78 : APInt_S_2
      use configuration ahir.APIntOr;
    end for;

    for dpe_79 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_8 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_81 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_82 : APInt_S_2
      use configuration ahir.APIntEQ;
    end for;

    for dpe_83 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_85 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_86 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_87 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_88 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_89 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_92 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_93 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_94 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_95 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_96 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_97 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

  end for;
end start_dp_config;
