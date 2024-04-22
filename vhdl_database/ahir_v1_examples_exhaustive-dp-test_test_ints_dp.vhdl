
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.types.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.subprograms.all;
use ahir.LoadStorePack.all;

entity test_ints_dp is
  port(
    SigmaIn : in BooleanArray(355 downto 1);
    SigmaOut : out BooleanArray(355 downto 1);
    call_ack : out std_logic;
    call_data : in std_logic_vector(0 downto 0);
    call_req : in std_logic;
    call_tag : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    lc_ack : in std_logic_vector(47 downto 0);
    lc_data : in std_logic_vector(383 downto 0);
    lc_req : out std_logic_vector(47 downto 0);
    lc_tag : in std_logic_vector(383 downto 0);
    lr_ack : in std_logic_vector(47 downto 0);
    lr_addr : out std_logic_vector(767 downto 0);
    lr_req : out std_logic_vector(47 downto 0);
    lr_tag : out std_logic_vector(383 downto 0);
    reset : in std_logic;
    return_ack : in std_logic;
    return_data : out std_logic_vector(32 downto 0);
    return_req : out std_logic;
    return_tag : out std_logic_vector(3 downto 0);
    sr_ack : in std_logic_vector(43 downto 0);
    sr_addr : out std_logic_vector(703 downto 0);
    sr_data : out std_logic_vector(351 downto 0);
    sr_req : out std_logic_vector(43 downto 0);
    sr_tag : out std_logic_vector(351 downto 0));
end test_ints_dp;

architecture default_arch of test_ints_dp is

  -- wrapper wires
  -- element wires
  signal dpe_1_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal wire_41 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_72 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_73 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_74 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_75 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_76 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_77 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_78 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_80 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_81 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_52 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_83 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_84 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_85 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_86 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_87 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_88 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_89 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_119_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_91 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_93 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_94 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_95 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_96 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_98 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_127_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_100 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_101 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_13_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_103 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_104 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_105 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_106 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_107 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_108 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_109 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_110 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_111 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_79 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_112 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_113 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_115 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_144_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_117 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_118 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_119 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_120 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_122 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_82 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_123 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_152_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_126 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_127 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_128 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_129 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_130 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_131 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_132 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_92 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_133 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_134 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_136 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_137 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_138 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_139 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_140 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_141 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_102 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_170_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_143 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_144 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_145 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_146 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_147 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_148 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_178_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_151 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_114 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_152 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_153 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_154 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_155 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_156 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_157 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_158 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_159 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_160 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_124 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_161 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_162 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_163 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_165 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_166 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_167 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_168 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_169 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_170 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_97 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_135 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_171 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_172 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_173 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_174 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_176 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_177 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_179 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_180 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_181 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_22_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_164 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_175 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_178 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_182 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_183 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_184 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_185 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_121 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_2 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_3 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_5 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_6 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_8 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_9 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_10 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_11 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_12 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_1 : APIntArray(0 downto 0, 31 downto 0);
  signal dpe_41_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_14 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_15 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_16 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_18 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_19 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_20 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_49_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_4 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_22 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_23 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_24 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_25 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_26 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_27 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_29 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_30 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_32 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_7 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_33 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_34 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_35 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_36 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_37 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_66_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_39 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_40 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_42 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_17 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_43 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_44 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_45 : APIntArray(0 downto 0, 15 downto 0);
  signal dpe_74_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_47 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_48 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_49 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_50 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_51 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_28 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_53 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_54 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_55 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_56 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_57 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_58 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_59 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_60 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_61 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_31 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_62 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_63 : APIntArray(0 downto 0, 15 downto 0);
  signal wire_64 : APIntArray(0 downto 0, 0 downto 0);
  signal wire_65 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_67 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_68 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_69 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_70 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_71 : APIntArray(0 downto 0, 31 downto 0);

  -- other wires
  signal dpe_101_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_110_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_136_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_161_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_187_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_197_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_1_data_0 : std_logic_vector(0 downto 0);
  signal dpe_205_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_210_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal dpe_210_data_0 : std_logic_vector(32 downto 0);
  signal dpe_32_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_57_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_82_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal dpe_92_data : StdLogicArray2D(0 downto 0, 31 downto 0);
  signal wire_116 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_125 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_13 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_142 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_149 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_150 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_21 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_38 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_46 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_66 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_90 : APIntArray(0 downto 0, 31 downto 0);
  signal wire_99 : APIntArray(0 downto 0, 31 downto 0);

begin

  return_tag <= call_tag;
  -- constant dpe_115
  wire_87 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000011"))));
  -- address dpe_15
  wire_82 <= to_apintarray(to_apint(to_unsigned(153, 16)));
  -- constant dpe_166
  wire_139 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000101"))));
  -- address dpe_190
  wire_161 <= to_apintarray(to_apint(to_unsigned(121, 16)));
  -- constant dpe_192
  wire_163 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000001000"))));
  -- address dpe_25
  wire_178 <= to_apintarray(to_apint(to_unsigned(85, 16)));
  -- constant dpe_27
  wire_183 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000001100"))));
  -- address dpe_3
  wire_121 <= to_apintarray(to_apint(to_unsigned(129, 16)));
  -- constant dpe_37
  wire_10 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000001"))));
  -- constant dpe_5
  wire_4 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000011000"))));
  -- constant dpe_6
  wire_7 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000000"))));
  -- constant dpe_62
  wire_35 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000010"))));
  -- address dpe_86
  wire_58 <= to_apintarray(to_apint(to_unsigned(97, 16)));
  -- constant dpe_9
  wire_31 <= to_APIntArray(to_apint(to_stdlogicvector(bit_vector'(B"00000000000000000000000000000100"))));

  dpe_1_data_0 <= extract(dpe_1_data, 0);
  dpe_1 : InputPort -- incoming call
  -- configuration: 
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(1 downto 1),
      clk => clk,
      data => dpe_1_data,
      oack => call_req,
      odata => call_data,
      oreq => call_ack,
      req => SigmaIn(1 downto 1),
      reset => reset);

  dpe_10 : APInt_S_2 -- .lvl.1
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(11 downto 11),
      ackR => SigmaOut(10 downto 10),
      clk => clk,
      reqC => SigmaIn(11 downto 11),
      reqR => SigmaIn(10 downto 10),
      reset => reset,
      x => wire_17,
      y => wire_28,
      z => wire_41);

  dpe_100 : APInt_S_1 -- .cast60
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(163 downto 163),
      ackR => SigmaOut(162 downto 162),
      clk => clk,
      reqC => SigmaIn(163 downto 163),
      reqR => SigmaIn(162 downto 162),
      reset => reset,
      x => wire_71,
      z => wire_72);

  dpe_101_data <= To_StdLogicArray2D(wire_65);
  dpe_101 : ApStoreReq -- store 4
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(164 downto 164),
      addr => wire_72,
      clk => clk,
      data => dpe_101_data,
      mack => sr_ack(3 downto 0),
      maddr => sr_addr(63 downto 0),
      mdata => sr_data(31 downto 0),
      mreq => sr_req(3 downto 0),
      mtag => sr_tag(31 downto 0),
      req => SigmaIn(164 downto 164),
      reset => reset);

  dpe_102 : APInt_S_2 -- ICMP_SLT_288
  -- configuration: APIntSLT
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(166 downto 166),
      ackR => SigmaOut(165 downto 165),
      clk => clk,
      reqC => SigmaIn(166 downto 166),
      reqR => SigmaIn(165 downto 165),
      reset => reset,
      x => wire_38,
      y => wire_46,
      z => wire_73);

  dpe_103 : APInt_S_1 -- ZExt_291
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(168 downto 168),
      ackR => SigmaOut(167 downto 167),
      clk => clk,
      reqC => SigmaIn(168 downto 168),
      reqR => SigmaIn(167 downto 167),
      reset => reset,
      x => wire_73,
      z => wire_74);

  dpe_104 : APInt_S_1 -- .base.cast61
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(170 downto 170),
      ackR => SigmaOut(169 downto 169),
      clk => clk,
      reqC => SigmaIn(170 downto 170),
      reqR => SigmaIn(169 downto 169),
      reset => reset,
      x => wire_58,
      z => wire_75);

  dpe_105 : APInt_S_2 -- .idx.062
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(172 downto 172),
      ackR => SigmaOut(171 downto 171),
      clk => clk,
      reqC => SigmaIn(172 downto 172),
      reqR => SigmaIn(171 downto 171),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_76);

  dpe_106 : APInt_S_2 -- .lvl.063
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(174 downto 174),
      ackR => SigmaOut(173 downto 173),
      clk => clk,
      reqC => SigmaIn(174 downto 174),
      reqR => SigmaIn(173 downto 173),
      reset => reset,
      x => wire_75,
      y => wire_76,
      z => wire_77);

  dpe_107 : APInt_S_2 -- .idx.164
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(176 downto 176),
      ackR => SigmaOut(175 downto 175),
      clk => clk,
      reqC => SigmaIn(176 downto 176),
      reqR => SigmaIn(175 downto 175),
      reset => reset,
      x => wire_31,
      y => wire_35,
      z => wire_78);

  dpe_108 : APInt_S_2 -- .lvl.165
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(178 downto 178),
      ackR => SigmaOut(177 downto 177),
      clk => clk,
      reqC => SigmaIn(178 downto 178),
      reqR => SigmaIn(177 downto 177),
      reset => reset,
      x => wire_77,
      y => wire_78,
      z => wire_80);

  dpe_109 : APInt_S_1 -- .cast66
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(180 downto 180),
      ackR => SigmaOut(179 downto 179),
      clk => clk,
      reqC => SigmaIn(180 downto 180),
      reqR => SigmaIn(179 downto 179),
      reset => reset,
      x => wire_80,
      z => wire_81);

  dpe_11 : APInt_S_1 -- .cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(13 downto 13),
      ackR => SigmaOut(12 downto 12),
      clk => clk,
      reqC => SigmaIn(13 downto 13),
      reqR => SigmaIn(12 downto 12),
      reset => reset,
      x => wire_41,
      z => wire_52);

  dpe_110_data <= To_StdLogicArray2D(wire_74);
  dpe_110 : ApStoreReq -- store 5
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(181 downto 181),
      addr => wire_81,
      clk => clk,
      data => dpe_110_data,
      mack => sr_ack(7 downto 4),
      maddr => sr_addr(127 downto 64),
      mdata => sr_data(63 downto 32),
      mreq => sr_req(7 downto 4),
      mtag => sr_tag(63 downto 32),
      req => SigmaIn(181 downto 181),
      reset => reset);

  dpe_111 : APInt_S_1 -- .base.cast67
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(183 downto 183),
      ackR => SigmaOut(182 downto 182),
      clk => clk,
      reqC => SigmaIn(183 downto 183),
      reqR => SigmaIn(182 downto 182),
      reset => reset,
      x => wire_121,
      z => wire_83);

  dpe_112 : APInt_S_2 -- .idx.068
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(185 downto 185),
      ackR => SigmaOut(184 downto 184),
      clk => clk,
      reqC => SigmaIn(185 downto 185),
      reqR => SigmaIn(184 downto 184),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_84);

  dpe_113 : APInt_S_2 -- .lvl.069
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(187 downto 187),
      ackR => SigmaOut(186 downto 186),
      clk => clk,
      reqC => SigmaIn(187 downto 187),
      reqR => SigmaIn(186 downto 186),
      reset => reset,
      x => wire_83,
      y => wire_84,
      z => wire_85);

  dpe_114 : APInt_S_2 -- .idx.170
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(189 downto 189),
      ackR => SigmaOut(188 downto 188),
      clk => clk,
      reqC => SigmaIn(189 downto 189),
      reqR => SigmaIn(188 downto 188),
      reset => reset,
      x => wire_31,
      y => wire_87,
      z => wire_86);

  dpe_116 : APInt_S_2 -- .lvl.171
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(191 downto 191),
      ackR => SigmaOut(190 downto 190),
      clk => clk,
      reqC => SigmaIn(191 downto 191),
      reqR => SigmaIn(190 downto 190),
      reset => reset,
      x => wire_85,
      y => wire_86,
      z => wire_88);

  dpe_117 : APInt_S_1 -- .cast72
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(193 downto 193),
      ackR => SigmaOut(192 downto 192),
      clk => clk,
      reqC => SigmaIn(193 downto 193),
      reqR => SigmaIn(192 downto 192),
      reset => reset,
      x => wire_88,
      z => wire_89);

  dpe_118 : ApLoadReq -- LoadRequest_334
  -- configuration: 
  -- counterpart: dpe_119
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(194 downto 194),
      addr => wire_89,
      clk => clk,
      mack => lr_ack(3 downto 0),
      maddr => lr_addr(63 downto 0),
      mreq => lr_req(3 downto 0),
      mtag => lr_tag(31 downto 0),
      req => SigmaIn(194 downto 194),
      reset => reset);

  wire_90 <= To_APIntArray(dpe_119_data);
  dpe_119 : ApLoadComplete -- LoadComplete_337
  -- configuration: 
  -- counterpart: dpe_118
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(195 downto 195),
      clk => clk,
      data => dpe_119_data,
      mack => lc_ack(3 downto 0),
      mdata => lc_data(31 downto 0),
      mreq => lc_req(3 downto 0),
      mtag => lc_tag(31 downto 0),
      req => SigmaIn(195 downto 195),
      reset => reset);

  dpe_12 : ApLoadReq -- LoadRequest_30
  -- configuration: 
  -- counterpart: dpe_13
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(14 downto 14),
      addr => wire_52,
      clk => clk,
      mack => lr_ack(7 downto 4),
      maddr => lr_addr(127 downto 64),
      mreq => lr_req(7 downto 4),
      mtag => lr_tag(63 downto 32),
      req => SigmaIn(14 downto 14),
      reset => reset);

  dpe_120 : APInt_S_1 -- .base.cast73
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(197 downto 197),
      ackR => SigmaOut(196 downto 196),
      clk => clk,
      reqC => SigmaIn(197 downto 197),
      reqR => SigmaIn(196 downto 196),
      reset => reset,
      x => wire_82,
      z => wire_91);

  dpe_121 : APInt_S_2 -- .idx.074
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(199 downto 199),
      ackR => SigmaOut(198 downto 198),
      clk => clk,
      reqC => SigmaIn(199 downto 199),
      reqR => SigmaIn(198 downto 198),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_93);

  dpe_122 : APInt_S_2 -- .lvl.075
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(201 downto 201),
      ackR => SigmaOut(200 downto 200),
      clk => clk,
      reqC => SigmaIn(201 downto 201),
      reqR => SigmaIn(200 downto 200),
      reset => reset,
      x => wire_91,
      y => wire_93,
      z => wire_94);

  dpe_123 : APInt_S_2 -- .idx.176
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(203 downto 203),
      ackR => SigmaOut(202 downto 202),
      clk => clk,
      reqC => SigmaIn(203 downto 203),
      reqR => SigmaIn(202 downto 202),
      reset => reset,
      x => wire_31,
      y => wire_87,
      z => wire_95);

  dpe_124 : APInt_S_2 -- .lvl.177
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(205 downto 205),
      ackR => SigmaOut(204 downto 204),
      clk => clk,
      reqC => SigmaIn(205 downto 205),
      reqR => SigmaIn(204 downto 204),
      reset => reset,
      x => wire_94,
      y => wire_95,
      z => wire_96);

  dpe_125 : APInt_S_1 -- .cast78
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(207 downto 207),
      ackR => SigmaOut(206 downto 206),
      clk => clk,
      reqC => SigmaIn(207 downto 207),
      reqR => SigmaIn(206 downto 206),
      reset => reset,
      x => wire_96,
      z => wire_98);

  dpe_126 : ApLoadReq -- LoadRequest_358
  -- configuration: 
  -- counterpart: dpe_127
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(208 downto 208),
      addr => wire_98,
      clk => clk,
      mack => lr_ack(11 downto 8),
      maddr => lr_addr(191 downto 128),
      mreq => lr_req(11 downto 8),
      mtag => lr_tag(95 downto 64),
      req => SigmaIn(208 downto 208),
      reset => reset);

  wire_99 <= To_APIntArray(dpe_127_data);
  dpe_127 : ApLoadComplete -- LoadComplete_361
  -- configuration: 
  -- counterpart: dpe_126
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(209 downto 209),
      clk => clk,
      data => dpe_127_data,
      mack => lc_ack(11 downto 8),
      mdata => lc_data(95 downto 64),
      mreq => lc_req(11 downto 8),
      mtag => lc_tag(95 downto 64),
      req => SigmaIn(209 downto 209),
      reset => reset);

  dpe_128 : APInt_S_2 -- ICMP_SLE_364
  -- configuration: APIntSLE
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(211 downto 211),
      ackR => SigmaOut(210 downto 210),
      clk => clk,
      reqC => SigmaIn(211 downto 211),
      reqR => SigmaIn(210 downto 210),
      reset => reset,
      x => wire_90,
      y => wire_99,
      z => wire_100);

  dpe_129 : APInt_S_1 -- ZExt_367
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(213 downto 213),
      ackR => SigmaOut(212 downto 212),
      clk => clk,
      reqC => SigmaIn(213 downto 213),
      reqR => SigmaIn(212 downto 212),
      reset => reset,
      x => wire_100,
      z => wire_101);

  wire_66 <= To_APIntArray(dpe_13_data);
  dpe_13 : ApLoadComplete -- LoadComplete_33
  -- configuration: 
  -- counterpart: dpe_12
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(15 downto 15),
      clk => clk,
      data => dpe_13_data,
      mack => lc_ack(7 downto 4),
      mdata => lc_data(63 downto 32),
      mreq => lc_req(7 downto 4),
      mtag => lc_tag(63 downto 32),
      req => SigmaIn(15 downto 15),
      reset => reset);

  dpe_130 : APInt_S_1 -- .base.cast79
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(215 downto 215),
      ackR => SigmaOut(214 downto 214),
      clk => clk,
      reqC => SigmaIn(215 downto 215),
      reqR => SigmaIn(214 downto 214),
      reset => reset,
      x => wire_58,
      z => wire_103);

  dpe_131 : APInt_S_2 -- .idx.080
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(217 downto 217),
      ackR => SigmaOut(216 downto 216),
      clk => clk,
      reqC => SigmaIn(217 downto 217),
      reqR => SigmaIn(216 downto 216),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_104);

  dpe_132 : APInt_S_2 -- .lvl.081
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(219 downto 219),
      ackR => SigmaOut(218 downto 218),
      clk => clk,
      reqC => SigmaIn(219 downto 219),
      reqR => SigmaIn(218 downto 218),
      reset => reset,
      x => wire_103,
      y => wire_104,
      z => wire_105);

  dpe_133 : APInt_S_2 -- .idx.182
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(221 downto 221),
      ackR => SigmaOut(220 downto 220),
      clk => clk,
      reqC => SigmaIn(221 downto 221),
      reqR => SigmaIn(220 downto 220),
      reset => reset,
      x => wire_31,
      y => wire_87,
      z => wire_106);

  dpe_134 : APInt_S_2 -- .lvl.183
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(223 downto 223),
      ackR => SigmaOut(222 downto 222),
      clk => clk,
      reqC => SigmaIn(223 downto 223),
      reqR => SigmaIn(222 downto 222),
      reset => reset,
      x => wire_105,
      y => wire_106,
      z => wire_107);

  dpe_135 : APInt_S_1 -- .cast84
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(225 downto 225),
      ackR => SigmaOut(224 downto 224),
      clk => clk,
      reqC => SigmaIn(225 downto 225),
      reqR => SigmaIn(224 downto 224),
      reset => reset,
      x => wire_107,
      z => wire_108);

  dpe_136_data <= To_StdLogicArray2D(wire_101);
  dpe_136 : ApStoreReq -- store 6
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(226 downto 226),
      addr => wire_108,
      clk => clk,
      data => dpe_136_data,
      mack => sr_ack(11 downto 8),
      maddr => sr_addr(191 downto 128),
      mdata => sr_data(95 downto 64),
      mreq => sr_req(11 downto 8),
      mtag => sr_tag(95 downto 64),
      req => SigmaIn(226 downto 226),
      reset => reset);

  dpe_137 : APInt_S_1 -- .base.cast85
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(228 downto 228),
      ackR => SigmaOut(227 downto 227),
      clk => clk,
      reqC => SigmaIn(228 downto 228),
      reqR => SigmaIn(227 downto 227),
      reset => reset,
      x => wire_121,
      z => wire_109);

  dpe_138 : APInt_S_2 -- .idx.086
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(230 downto 230),
      ackR => SigmaOut(229 downto 229),
      clk => clk,
      reqC => SigmaIn(230 downto 230),
      reqR => SigmaIn(229 downto 229),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_110);

  dpe_139 : APInt_S_2 -- .lvl.087
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(232 downto 232),
      ackR => SigmaOut(231 downto 231),
      clk => clk,
      reqC => SigmaIn(232 downto 232),
      reqR => SigmaIn(231 downto 231),
      reset => reset,
      x => wire_109,
      y => wire_110,
      z => wire_111);

  dpe_14 : APInt_S_1 -- .base.cast1
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(17 downto 17),
      ackR => SigmaOut(16 downto 16),
      clk => clk,
      reqC => SigmaIn(17 downto 17),
      reqR => SigmaIn(16 downto 16),
      reset => reset,
      x => wire_82,
      z => wire_79);

  dpe_140 : APInt_S_2 -- .idx.188
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(234 downto 234),
      ackR => SigmaOut(233 downto 233),
      clk => clk,
      reqC => SigmaIn(234 downto 234),
      reqR => SigmaIn(233 downto 233),
      reset => reset,
      x => wire_31,
      y => wire_31,
      z => wire_112);

  dpe_141 : APInt_S_2 -- .lvl.189
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(236 downto 236),
      ackR => SigmaOut(235 downto 235),
      clk => clk,
      reqC => SigmaIn(236 downto 236),
      reqR => SigmaIn(235 downto 235),
      reset => reset,
      x => wire_111,
      y => wire_112,
      z => wire_113);

  dpe_142 : APInt_S_1 -- .cast90
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(238 downto 238),
      ackR => SigmaOut(237 downto 237),
      clk => clk,
      reqC => SigmaIn(238 downto 238),
      reqR => SigmaIn(237 downto 237),
      reset => reset,
      x => wire_113,
      z => wire_115);

  dpe_143 : ApLoadReq -- LoadRequest_409
  -- configuration: 
  -- counterpart: dpe_144
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(239 downto 239),
      addr => wire_115,
      clk => clk,
      mack => lr_ack(15 downto 12),
      maddr => lr_addr(255 downto 192),
      mreq => lr_req(15 downto 12),
      mtag => lr_tag(127 downto 96),
      req => SigmaIn(239 downto 239),
      reset => reset);

  wire_116 <= To_APIntArray(dpe_144_data);
  dpe_144 : ApLoadComplete -- LoadComplete_412
  -- configuration: 
  -- counterpart: dpe_143
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(240 downto 240),
      clk => clk,
      data => dpe_144_data,
      mack => lc_ack(15 downto 12),
      mdata => lc_data(127 downto 96),
      mreq => lc_req(15 downto 12),
      mtag => lc_tag(127 downto 96),
      req => SigmaIn(240 downto 240),
      reset => reset);

  dpe_145 : APInt_S_1 -- .base.cast91
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(242 downto 242),
      ackR => SigmaOut(241 downto 241),
      clk => clk,
      reqC => SigmaIn(242 downto 242),
      reqR => SigmaIn(241 downto 241),
      reset => reset,
      x => wire_82,
      z => wire_117);

  dpe_146 : APInt_S_2 -- .idx.092
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(244 downto 244),
      ackR => SigmaOut(243 downto 243),
      clk => clk,
      reqC => SigmaIn(244 downto 244),
      reqR => SigmaIn(243 downto 243),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_118);

  dpe_147 : APInt_S_2 -- .lvl.093
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(246 downto 246),
      ackR => SigmaOut(245 downto 245),
      clk => clk,
      reqC => SigmaIn(246 downto 246),
      reqR => SigmaIn(245 downto 245),
      reset => reset,
      x => wire_117,
      y => wire_118,
      z => wire_119);

  dpe_148 : APInt_S_2 -- .idx.194
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(248 downto 248),
      ackR => SigmaOut(247 downto 247),
      clk => clk,
      reqC => SigmaIn(248 downto 248),
      reqR => SigmaIn(247 downto 247),
      reset => reset,
      x => wire_31,
      y => wire_31,
      z => wire_120);

  dpe_149 : APInt_S_2 -- .lvl.195
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(250 downto 250),
      ackR => SigmaOut(249 downto 249),
      clk => clk,
      reqC => SigmaIn(250 downto 250),
      reqR => SigmaIn(249 downto 249),
      reset => reset,
      x => wire_119,
      y => wire_120,
      z => wire_122);

  dpe_150 : APInt_S_1 -- .cast96
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(252 downto 252),
      ackR => SigmaOut(251 downto 251),
      clk => clk,
      reqC => SigmaIn(252 downto 252),
      reqR => SigmaIn(251 downto 251),
      reset => reset,
      x => wire_122,
      z => wire_123);

  dpe_151 : ApLoadReq -- LoadRequest_433
  -- configuration: 
  -- counterpart: dpe_152
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(253 downto 253),
      addr => wire_123,
      clk => clk,
      mack => lr_ack(19 downto 16),
      maddr => lr_addr(319 downto 256),
      mreq => lr_req(19 downto 16),
      mtag => lr_tag(159 downto 128),
      req => SigmaIn(253 downto 253),
      reset => reset);

  wire_125 <= To_APIntArray(dpe_152_data);
  dpe_152 : ApLoadComplete -- LoadComplete_436
  -- configuration: 
  -- counterpart: dpe_151
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(254 downto 254),
      clk => clk,
      data => dpe_152_data,
      mack => lc_ack(19 downto 16),
      mdata => lc_data(159 downto 128),
      mreq => lc_req(19 downto 16),
      mtag => lc_tag(159 downto 128),
      req => SigmaIn(254 downto 254),
      reset => reset);

  dpe_153 : APInt_S_2 -- ICMP_EQ_439
  -- configuration: APIntEQ
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(256 downto 256),
      ackR => SigmaOut(255 downto 255),
      clk => clk,
      reqC => SigmaIn(256 downto 256),
      reqR => SigmaIn(255 downto 255),
      reset => reset,
      x => wire_116,
      y => wire_125,
      z => wire_126);

  dpe_154 : APInt_S_1 -- ZExt_442
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(258 downto 258),
      ackR => SigmaOut(257 downto 257),
      clk => clk,
      reqC => SigmaIn(258 downto 258),
      reqR => SigmaIn(257 downto 257),
      reset => reset,
      x => wire_126,
      z => wire_127);

  dpe_155 : APInt_S_1 -- .base.cast97
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(260 downto 260),
      ackR => SigmaOut(259 downto 259),
      clk => clk,
      reqC => SigmaIn(260 downto 260),
      reqR => SigmaIn(259 downto 259),
      reset => reset,
      x => wire_58,
      z => wire_128);

  dpe_156 : APInt_S_2 -- .idx.098
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(262 downto 262),
      ackR => SigmaOut(261 downto 261),
      clk => clk,
      reqC => SigmaIn(262 downto 262),
      reqR => SigmaIn(261 downto 261),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_129);

  dpe_157 : APInt_S_2 -- .lvl.099
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(264 downto 264),
      ackR => SigmaOut(263 downto 263),
      clk => clk,
      reqC => SigmaIn(264 downto 264),
      reqR => SigmaIn(263 downto 263),
      reset => reset,
      x => wire_128,
      y => wire_129,
      z => wire_130);

  dpe_158 : APInt_S_2 -- .idx.1100
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(266 downto 266),
      ackR => SigmaOut(265 downto 265),
      clk => clk,
      reqC => SigmaIn(266 downto 266),
      reqR => SigmaIn(265 downto 265),
      reset => reset,
      x => wire_31,
      y => wire_31,
      z => wire_131);

  dpe_159 : APInt_S_2 -- .lvl.1101
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(268 downto 268),
      ackR => SigmaOut(267 downto 267),
      clk => clk,
      reqC => SigmaIn(268 downto 268),
      reqR => SigmaIn(267 downto 267),
      reset => reset,
      x => wire_130,
      y => wire_131,
      z => wire_132);

  dpe_16 : APInt_S_2 -- .idx.02
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(19 downto 19),
      ackR => SigmaOut(18 downto 18),
      clk => clk,
      reqC => SigmaIn(19 downto 19),
      reqR => SigmaIn(18 downto 18),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_92);

  dpe_160 : APInt_S_1 -- .cast102
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(270 downto 270),
      ackR => SigmaOut(269 downto 269),
      clk => clk,
      reqC => SigmaIn(270 downto 270),
      reqR => SigmaIn(269 downto 269),
      reset => reset,
      x => wire_132,
      z => wire_133);

  dpe_161_data <= To_StdLogicArray2D(wire_127);
  dpe_161 : ApStoreReq -- store 7
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(271 downto 271),
      addr => wire_133,
      clk => clk,
      data => dpe_161_data,
      mack => sr_ack(15 downto 12),
      maddr => sr_addr(255 downto 192),
      mdata => sr_data(127 downto 96),
      mreq => sr_req(15 downto 12),
      mtag => sr_tag(127 downto 96),
      req => SigmaIn(271 downto 271),
      reset => reset);

  dpe_162 : APInt_S_1 -- .base.cast103
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(273 downto 273),
      ackR => SigmaOut(272 downto 272),
      clk => clk,
      reqC => SigmaIn(273 downto 273),
      reqR => SigmaIn(272 downto 272),
      reset => reset,
      x => wire_121,
      z => wire_134);

  dpe_163 : APInt_S_2 -- .idx.0104
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(275 downto 275),
      ackR => SigmaOut(274 downto 274),
      clk => clk,
      reqC => SigmaIn(275 downto 275),
      reqR => SigmaIn(274 downto 274),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_136);

  dpe_164 : APInt_S_2 -- .lvl.0105
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(277 downto 277),
      ackR => SigmaOut(276 downto 276),
      clk => clk,
      reqC => SigmaIn(277 downto 277),
      reqR => SigmaIn(276 downto 276),
      reset => reset,
      x => wire_134,
      y => wire_136,
      z => wire_137);

  dpe_165 : APInt_S_2 -- .idx.1106
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(279 downto 279),
      ackR => SigmaOut(278 downto 278),
      clk => clk,
      reqC => SigmaIn(279 downto 279),
      reqR => SigmaIn(278 downto 278),
      reset => reset,
      x => wire_31,
      y => wire_139,
      z => wire_138);

  dpe_167 : APInt_S_2 -- .lvl.1107
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(281 downto 281),
      ackR => SigmaOut(280 downto 280),
      clk => clk,
      reqC => SigmaIn(281 downto 281),
      reqR => SigmaIn(280 downto 280),
      reset => reset,
      x => wire_137,
      y => wire_138,
      z => wire_140);

  dpe_168 : APInt_S_1 -- .cast108
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(283 downto 283),
      ackR => SigmaOut(282 downto 282),
      clk => clk,
      reqC => SigmaIn(283 downto 283),
      reqR => SigmaIn(282 downto 282),
      reset => reset,
      x => wire_140,
      z => wire_141);

  dpe_169 : ApLoadReq -- LoadRequest_485
  -- configuration: 
  -- counterpart: dpe_170
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(284 downto 284),
      addr => wire_141,
      clk => clk,
      mack => lr_ack(23 downto 20),
      maddr => lr_addr(383 downto 320),
      mreq => lr_req(23 downto 20),
      mtag => lr_tag(191 downto 160),
      req => SigmaIn(284 downto 284),
      reset => reset);

  dpe_17 : APInt_S_2 -- .lvl.03
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(21 downto 21),
      ackR => SigmaOut(20 downto 20),
      clk => clk,
      reqC => SigmaIn(21 downto 21),
      reqR => SigmaIn(20 downto 20),
      reset => reset,
      x => wire_79,
      y => wire_92,
      z => wire_102);

  wire_142 <= To_APIntArray(dpe_170_data);
  dpe_170 : ApLoadComplete -- LoadComplete_488
  -- configuration: 
  -- counterpart: dpe_169
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(285 downto 285),
      clk => clk,
      data => dpe_170_data,
      mack => lc_ack(23 downto 20),
      mdata => lc_data(191 downto 160),
      mreq => lc_req(23 downto 20),
      mtag => lc_tag(191 downto 160),
      req => SigmaIn(285 downto 285),
      reset => reset);

  dpe_171 : APInt_S_1 -- .base.cast109
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(287 downto 287),
      ackR => SigmaOut(286 downto 286),
      clk => clk,
      reqC => SigmaIn(287 downto 287),
      reqR => SigmaIn(286 downto 286),
      reset => reset,
      x => wire_82,
      z => wire_143);

  dpe_172 : APInt_S_2 -- .idx.0110
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(289 downto 289),
      ackR => SigmaOut(288 downto 288),
      clk => clk,
      reqC => SigmaIn(289 downto 289),
      reqR => SigmaIn(288 downto 288),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_144);

  dpe_173 : APInt_S_2 -- .lvl.0111
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(291 downto 291),
      ackR => SigmaOut(290 downto 290),
      clk => clk,
      reqC => SigmaIn(291 downto 291),
      reqR => SigmaIn(290 downto 290),
      reset => reset,
      x => wire_143,
      y => wire_144,
      z => wire_145);

  dpe_174 : APInt_S_2 -- .idx.1112
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(293 downto 293),
      ackR => SigmaOut(292 downto 292),
      clk => clk,
      reqC => SigmaIn(293 downto 293),
      reqR => SigmaIn(292 downto 292),
      reset => reset,
      x => wire_31,
      y => wire_139,
      z => wire_146);

  dpe_175 : APInt_S_2 -- .lvl.1113
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(295 downto 295),
      ackR => SigmaOut(294 downto 294),
      clk => clk,
      reqC => SigmaIn(295 downto 295),
      reqR => SigmaIn(294 downto 294),
      reset => reset,
      x => wire_145,
      y => wire_146,
      z => wire_147);

  dpe_176 : APInt_S_1 -- .cast114
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(297 downto 297),
      ackR => SigmaOut(296 downto 296),
      clk => clk,
      reqC => SigmaIn(297 downto 297),
      reqR => SigmaIn(296 downto 296),
      reset => reset,
      x => wire_147,
      z => wire_148);

  dpe_177 : ApLoadReq -- LoadRequest_509
  -- configuration: 
  -- counterpart: dpe_178
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(298 downto 298),
      addr => wire_148,
      clk => clk,
      mack => lr_ack(27 downto 24),
      maddr => lr_addr(447 downto 384),
      mreq => lr_req(27 downto 24),
      mtag => lr_tag(223 downto 192),
      req => SigmaIn(298 downto 298),
      reset => reset);

  wire_150 <= To_APIntArray(dpe_178_data);
  dpe_178 : ApLoadComplete -- LoadComplete_512
  -- configuration: 
  -- counterpart: dpe_177
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(299 downto 299),
      clk => clk,
      data => dpe_178_data,
      mack => lc_ack(27 downto 24),
      mdata => lc_data(223 downto 192),
      mreq => lc_req(27 downto 24),
      mtag => lc_tag(223 downto 192),
      req => SigmaIn(299 downto 299),
      reset => reset);

  dpe_179 : APInt_S_2 -- ICMP_NE_515
  -- configuration: APIntNE
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(301 downto 301),
      ackR => SigmaOut(300 downto 300),
      clk => clk,
      reqC => SigmaIn(301 downto 301),
      reqR => SigmaIn(300 downto 300),
      reset => reset,
      x => wire_142,
      y => wire_150,
      z => wire_151);

  dpe_18 : APInt_S_2 -- .idx.14
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
      x => wire_31,
      y => wire_7,
      z => wire_114);

  dpe_180 : APInt_S_1 -- ZExt_518
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(303 downto 303),
      ackR => SigmaOut(302 downto 302),
      clk => clk,
      reqC => SigmaIn(303 downto 303),
      reqR => SigmaIn(302 downto 302),
      reset => reset,
      x => wire_151,
      z => wire_152);

  dpe_181 : APInt_S_1 -- .base.cast115
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(305 downto 305),
      ackR => SigmaOut(304 downto 304),
      clk => clk,
      reqC => SigmaIn(305 downto 305),
      reqR => SigmaIn(304 downto 304),
      reset => reset,
      x => wire_58,
      z => wire_153);

  dpe_182 : APInt_S_2 -- .idx.0116
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(307 downto 307),
      ackR => SigmaOut(306 downto 306),
      clk => clk,
      reqC => SigmaIn(307 downto 307),
      reqR => SigmaIn(306 downto 306),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_154);

  dpe_183 : APInt_S_2 -- .lvl.0117
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(309 downto 309),
      ackR => SigmaOut(308 downto 308),
      clk => clk,
      reqC => SigmaIn(309 downto 309),
      reqR => SigmaIn(308 downto 308),
      reset => reset,
      x => wire_153,
      y => wire_154,
      z => wire_155);

  dpe_184 : APInt_S_2 -- .idx.1118
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(311 downto 311),
      ackR => SigmaOut(310 downto 310),
      clk => clk,
      reqC => SigmaIn(311 downto 311),
      reqR => SigmaIn(310 downto 310),
      reset => reset,
      x => wire_31,
      y => wire_139,
      z => wire_156);

  dpe_185 : APInt_S_2 -- .lvl.1119
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(313 downto 313),
      ackR => SigmaOut(312 downto 312),
      clk => clk,
      reqC => SigmaIn(313 downto 313),
      reqR => SigmaIn(312 downto 312),
      reset => reset,
      x => wire_155,
      y => wire_156,
      z => wire_157);

  dpe_186 : APInt_S_1 -- .cast120
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(315 downto 315),
      ackR => SigmaOut(314 downto 314),
      clk => clk,
      reqC => SigmaIn(315 downto 315),
      reqR => SigmaIn(314 downto 314),
      reset => reset,
      x => wire_157,
      z => wire_158);

  dpe_187_data <= To_StdLogicArray2D(wire_152);
  dpe_187 : ApStoreReq -- store 8
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(316 downto 316),
      addr => wire_158,
      clk => clk,
      data => dpe_187_data,
      mack => sr_ack(19 downto 16),
      maddr => sr_addr(319 downto 256),
      mdata => sr_data(159 downto 128),
      mreq => sr_req(19 downto 16),
      mtag => sr_tag(159 downto 128),
      req => SigmaIn(316 downto 316),
      reset => reset);

  dpe_188 : APInt_S_2 -- AShr_542
  -- configuration: APIntAShr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(318 downto 318),
      ackR => SigmaOut(317 downto 317),
      clk => clk,
      reqC => SigmaIn(318 downto 318),
      reqR => SigmaIn(317 downto 317),
      reset => reset,
      x => wire_66,
      y => wire_31,
      z => wire_159);

  dpe_189 : APInt_S_1 -- .base.cast121
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(320 downto 320),
      ackR => SigmaOut(319 downto 319),
      clk => clk,
      reqC => SigmaIn(320 downto 320),
      reqR => SigmaIn(319 downto 319),
      reset => reset,
      x => wire_161,
      z => wire_160);

  dpe_19 : APInt_S_2 -- .lvl.15
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
      x => wire_102,
      y => wire_114,
      z => wire_124);

  dpe_191 : APInt_S_2 -- .idx.0122
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(322 downto 322),
      ackR => SigmaOut(321 downto 321),
      clk => clk,
      reqC => SigmaIn(322 downto 322),
      reqR => SigmaIn(321 downto 321),
      reset => reset,
      x => wire_163,
      y => wire_7,
      z => wire_162);

  dpe_193 : APInt_S_2 -- .lvl.0123
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(324 downto 324),
      ackR => SigmaOut(323 downto 323),
      clk => clk,
      reqC => SigmaIn(324 downto 324),
      reqR => SigmaIn(323 downto 323),
      reset => reset,
      x => wire_160,
      y => wire_162,
      z => wire_165);

  dpe_194 : APInt_S_2 -- .idx.1124
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(326 downto 326),
      ackR => SigmaOut(325 downto 325),
      clk => clk,
      reqC => SigmaIn(326 downto 326),
      reqR => SigmaIn(325 downto 325),
      reset => reset,
      x => wire_31,
      y => wire_7,
      z => wire_166);

  dpe_195 : APInt_S_2 -- .lvl.1125
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(328 downto 328),
      ackR => SigmaOut(327 downto 327),
      clk => clk,
      reqC => SigmaIn(328 downto 328),
      reqR => SigmaIn(327 downto 327),
      reset => reset,
      x => wire_165,
      y => wire_166,
      z => wire_167);

  dpe_196 : APInt_S_1 -- .cast126
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(330 downto 330),
      ackR => SigmaOut(329 downto 329),
      clk => clk,
      reqC => SigmaIn(330 downto 330),
      reqR => SigmaIn(329 downto 329),
      reset => reset,
      x => wire_167,
      z => wire_168);

  dpe_197_data <= To_StdLogicArray2D(wire_159);
  dpe_197 : ApStoreReq -- store 9
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(331 downto 331),
      addr => wire_168,
      clk => clk,
      data => dpe_197_data,
      mack => sr_ack(23 downto 20),
      maddr => sr_addr(383 downto 320),
      mdata => sr_data(191 downto 160),
      mreq => sr_req(23 downto 20),
      mtag => sr_tag(191 downto 160),
      req => SigmaIn(331 downto 331),
      reset => reset);

  dpe_198 : APInt_S_2 -- Shl_568
  -- configuration: APIntShl
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(333 downto 333),
      ackR => SigmaOut(332 downto 332),
      clk => clk,
      reqC => SigmaIn(333 downto 333),
      reqR => SigmaIn(332 downto 332),
      reset => reset,
      x => wire_149,
      y => wire_31,
      z => wire_169);

  dpe_199 : APInt_S_1 -- .base.cast127
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(335 downto 335),
      ackR => SigmaOut(334 downto 334),
      clk => clk,
      reqC => SigmaIn(335 downto 335),
      reqR => SigmaIn(334 downto 334),
      reset => reset,
      x => wire_161,
      z => wire_170);

  dpe_2 : APInt_S_1 -- .base.cast
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(3 downto 3),
      ackR => SigmaOut(2 downto 2),
      clk => clk,
      reqC => SigmaIn(3 downto 3),
      reqR => SigmaIn(2 downto 2),
      reset => reset,
      x => wire_121,
      z => wire_97);

  dpe_20 : APInt_S_1 -- .cast6
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(27 downto 27),
      ackR => SigmaOut(26 downto 26),
      clk => clk,
      reqC => SigmaIn(27 downto 27),
      reqR => SigmaIn(26 downto 26),
      reset => reset,
      x => wire_124,
      z => wire_135);

  dpe_200 : APInt_S_2 -- .idx.0128
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(337 downto 337),
      ackR => SigmaOut(336 downto 336),
      clk => clk,
      reqC => SigmaIn(337 downto 337),
      reqR => SigmaIn(336 downto 336),
      reset => reset,
      x => wire_163,
      y => wire_7,
      z => wire_171);

  dpe_201 : APInt_S_2 -- .lvl.0129
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(339 downto 339),
      ackR => SigmaOut(338 downto 338),
      clk => clk,
      reqC => SigmaIn(339 downto 339),
      reqR => SigmaIn(338 downto 338),
      reset => reset,
      x => wire_170,
      y => wire_171,
      z => wire_172);

  dpe_202 : APInt_S_2 -- .idx.1130
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(341 downto 341),
      ackR => SigmaOut(340 downto 340),
      clk => clk,
      reqC => SigmaIn(341 downto 341),
      reqR => SigmaIn(340 downto 340),
      reset => reset,
      x => wire_31,
      y => wire_10,
      z => wire_173);

  dpe_203 : APInt_S_2 -- .lvl.1131
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(343 downto 343),
      ackR => SigmaOut(342 downto 342),
      clk => clk,
      reqC => SigmaIn(343 downto 343),
      reqR => SigmaIn(342 downto 342),
      reset => reset,
      x => wire_172,
      y => wire_173,
      z => wire_174);

  dpe_204 : APInt_S_1 -- .cast132
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(345 downto 345),
      ackR => SigmaOut(344 downto 344),
      clk => clk,
      reqC => SigmaIn(345 downto 345),
      reqR => SigmaIn(344 downto 344),
      reset => reset,
      x => wire_174,
      z => wire_176);

  dpe_205_data <= To_StdLogicArray2D(wire_169);
  dpe_205 : ApStoreReq -- store 10
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(346 downto 346),
      addr => wire_176,
      clk => clk,
      data => dpe_205_data,
      mack => sr_ack(27 downto 24),
      maddr => sr_addr(447 downto 384),
      mdata => sr_data(223 downto 192),
      mreq => sr_req(27 downto 24),
      mtag => sr_tag(223 downto 192),
      req => SigmaIn(346 downto 346),
      reset => reset);

  dpe_206 : APInt_S_2 -- And_592
  -- configuration: APIntAnd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(348 downto 348),
      ackR => SigmaOut(347 downto 347),
      clk => clk,
      reqC => SigmaIn(348 downto 348),
      reqR => SigmaIn(347 downto 347),
      reset => reset,
      x => wire_22,
      y => wire_164,
      z => wire_177);

  dpe_207 : APInt_S_2 -- Or_595
  -- configuration: APIntOr
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(350 downto 350),
      ackR => SigmaOut(349 downto 349),
      clk => clk,
      reqC => SigmaIn(350 downto 350),
      reqR => SigmaIn(349 downto 349),
      reset => reset,
      x => wire_47,
      y => wire_177,
      z => wire_179);

  dpe_208 : APInt_S_2 -- Xor_598
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(352 downto 352),
      ackR => SigmaOut(351 downto 351),
      clk => clk,
      reqC => SigmaIn(352 downto 352),
      reqR => SigmaIn(351 downto 351),
      reset => reset,
      x => wire_159,
      y => wire_179,
      z => wire_180);

  dpe_209 : APInt_S_2 -- Xor_601
  -- configuration: APIntXor
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(354 downto 354),
      ackR => SigmaOut(353 downto 353),
      clk => clk,
      reqC => SigmaIn(354 downto 354),
      reqR => SigmaIn(353 downto 353),
      reset => reset,
      x => wire_180,
      y => wire_169,
      z => wire_181);

  dpe_21 : ApLoadReq -- LoadRequest_55
  -- configuration: 
  -- counterpart: dpe_22
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(28 downto 28),
      addr => wire_135,
      clk => clk,
      mack => lr_ack(31 downto 28),
      maddr => lr_addr(511 downto 448),
      mreq => lr_req(31 downto 28),
      mtag => lr_tag(255 downto 224),
      req => SigmaIn(28 downto 28),
      reset => reset);

  dpe_210_data_0(32 downto 1) <= to_slv(extract(wire_181, 0));
  dpe_210_data <= to_stdlogicarray2d(dpe_210_data_0);
  dpe_210 : OutputPort -- Return_604
  -- configuration: 
    generic map(
      colouring => (0 => 0))
    port map(
      ack => SigmaOut(355 downto 355),
      clk => clk,
      data => dpe_210_data,
      oack => return_ack,
      odata => return_data,
      oreq => return_req,
      req => SigmaIn(355 downto 355),
      reset => reset);

  wire_149 <= To_APIntArray(dpe_22_data);
  dpe_22 : ApLoadComplete -- LoadComplete_58
  -- configuration: 
  -- counterpart: dpe_21
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(29 downto 29),
      clk => clk,
      data => dpe_22_data,
      mack => lc_ack(31 downto 28),
      mdata => lc_data(255 downto 224),
      mreq => lc_req(31 downto 28),
      mtag => lc_tag(255 downto 224),
      req => SigmaIn(29 downto 29),
      reset => reset);

  dpe_23 : APInt_S_2 -- Add_61
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(31 downto 31),
      ackR => SigmaOut(30 downto 30),
      clk => clk,
      reqC => SigmaIn(31 downto 31),
      reqR => SigmaIn(30 downto 30),
      reset => reset,
      x => wire_149,
      y => wire_66,
      z => wire_164);

  dpe_24 : APInt_S_1 -- .base.cast7
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(33 downto 33),
      ackR => SigmaOut(32 downto 32),
      clk => clk,
      reqC => SigmaIn(33 downto 33),
      reqR => SigmaIn(32 downto 32),
      reset => reset,
      x => wire_178,
      z => wire_175);

  dpe_26 : APInt_S_2 -- .idx.08
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(35 downto 35),
      ackR => SigmaOut(34 downto 34),
      clk => clk,
      reqC => SigmaIn(35 downto 35),
      reqR => SigmaIn(34 downto 34),
      reset => reset,
      x => wire_183,
      y => wire_7,
      z => wire_182);

  dpe_28 : APInt_S_2 -- .lvl.09
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(37 downto 37),
      ackR => SigmaOut(36 downto 36),
      clk => clk,
      reqC => SigmaIn(37 downto 37),
      reqR => SigmaIn(36 downto 36),
      reset => reset,
      x => wire_175,
      y => wire_182,
      z => wire_184);

  dpe_29 : APInt_S_2 -- .idx.110
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(39 downto 39),
      ackR => SigmaOut(38 downto 38),
      clk => clk,
      reqC => SigmaIn(39 downto 39),
      reqR => SigmaIn(38 downto 38),
      reset => reset,
      x => wire_31,
      y => wire_7,
      z => wire_185);

  dpe_30 : APInt_S_2 -- .lvl.111
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(41 downto 41),
      ackR => SigmaOut(40 downto 40),
      clk => clk,
      reqC => SigmaIn(41 downto 41),
      reqR => SigmaIn(40 downto 40),
      reset => reset,
      x => wire_184,
      y => wire_185,
      z => wire_2);

  dpe_31 : APInt_S_1 -- .cast12
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(43 downto 43),
      ackR => SigmaOut(42 downto 42),
      clk => clk,
      reqC => SigmaIn(43 downto 43),
      reqR => SigmaIn(42 downto 42),
      reset => reset,
      x => wire_2,
      z => wire_3);

  dpe_32_data <= To_StdLogicArray2D(wire_164);
  dpe_32 : ApStoreReq -- store 0
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(44 downto 44),
      addr => wire_3,
      clk => clk,
      data => dpe_32_data,
      mack => sr_ack(31 downto 28),
      maddr => sr_addr(511 downto 448),
      mdata => sr_data(255 downto 224),
      mreq => sr_req(31 downto 28),
      mtag => sr_tag(255 downto 224),
      req => SigmaIn(44 downto 44),
      reset => reset);

  dpe_33 : APInt_S_1 -- .base.cast13
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(46 downto 46),
      ackR => SigmaOut(45 downto 45),
      clk => clk,
      reqC => SigmaIn(46 downto 46),
      reqR => SigmaIn(45 downto 45),
      reset => reset,
      x => wire_121,
      z => wire_5);

  dpe_34 : APInt_S_2 -- .idx.014
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(48 downto 48),
      ackR => SigmaOut(47 downto 47),
      clk => clk,
      reqC => SigmaIn(48 downto 48),
      reqR => SigmaIn(47 downto 47),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_6);

  dpe_35 : APInt_S_2 -- .lvl.015
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(50 downto 50),
      ackR => SigmaOut(49 downto 49),
      clk => clk,
      reqC => SigmaIn(50 downto 50),
      reqR => SigmaIn(49 downto 49),
      reset => reset,
      x => wire_5,
      y => wire_6,
      z => wire_8);

  dpe_36 : APInt_S_2 -- .idx.116
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(52 downto 52),
      ackR => SigmaOut(51 downto 51),
      clk => clk,
      reqC => SigmaIn(52 downto 52),
      reqR => SigmaIn(51 downto 51),
      reset => reset,
      x => wire_31,
      y => wire_10,
      z => wire_9);

  dpe_38 : APInt_S_2 -- .lvl.117
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(54 downto 54),
      ackR => SigmaOut(53 downto 53),
      clk => clk,
      reqC => SigmaIn(54 downto 54),
      reqR => SigmaIn(53 downto 53),
      reset => reset,
      x => wire_8,
      y => wire_9,
      z => wire_11);

  dpe_39 : APInt_S_1 -- .cast18
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(56 downto 56),
      ackR => SigmaOut(55 downto 55),
      clk => clk,
      reqC => SigmaIn(56 downto 56),
      reqR => SigmaIn(55 downto 55),
      reset => reset,
      x => wire_11,
      z => wire_12);

  dpe_4 : APInt_S_2 -- .idx.0
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(5 downto 5),
      ackR => SigmaOut(4 downto 4),
      clk => clk,
      reqC => SigmaIn(5 downto 5),
      reqR => SigmaIn(4 downto 4),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_1);

  dpe_40 : ApLoadReq -- LoadRequest_106
  -- configuration: 
  -- counterpart: dpe_41
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(57 downto 57),
      addr => wire_12,
      clk => clk,
      mack => lr_ack(35 downto 32),
      maddr => lr_addr(575 downto 512),
      mreq => lr_req(35 downto 32),
      mtag => lr_tag(287 downto 256),
      req => SigmaIn(57 downto 57),
      reset => reset);

  wire_13 <= To_APIntArray(dpe_41_data);
  dpe_41 : ApLoadComplete -- LoadComplete_109
  -- configuration: 
  -- counterpart: dpe_40
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(58 downto 58),
      clk => clk,
      data => dpe_41_data,
      mack => lc_ack(35 downto 32),
      mdata => lc_data(287 downto 256),
      mreq => lc_req(35 downto 32),
      mtag => lc_tag(287 downto 256),
      req => SigmaIn(58 downto 58),
      reset => reset);

  dpe_42 : APInt_S_1 -- .base.cast19
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(60 downto 60),
      ackR => SigmaOut(59 downto 59),
      clk => clk,
      reqC => SigmaIn(60 downto 60),
      reqR => SigmaIn(59 downto 59),
      reset => reset,
      x => wire_82,
      z => wire_14);

  dpe_43 : APInt_S_2 -- .idx.020
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(62 downto 62),
      ackR => SigmaOut(61 downto 61),
      clk => clk,
      reqC => SigmaIn(62 downto 62),
      reqR => SigmaIn(61 downto 61),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_15);

  dpe_44 : APInt_S_2 -- .lvl.021
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(64 downto 64),
      ackR => SigmaOut(63 downto 63),
      clk => clk,
      reqC => SigmaIn(64 downto 64),
      reqR => SigmaIn(63 downto 63),
      reset => reset,
      x => wire_14,
      y => wire_15,
      z => wire_16);

  dpe_45 : APInt_S_2 -- .idx.122
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(66 downto 66),
      ackR => SigmaOut(65 downto 65),
      clk => clk,
      reqC => SigmaIn(66 downto 66),
      reqR => SigmaIn(65 downto 65),
      reset => reset,
      x => wire_31,
      y => wire_10,
      z => wire_18);

  dpe_46 : APInt_S_2 -- .lvl.123
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(68 downto 68),
      ackR => SigmaOut(67 downto 67),
      clk => clk,
      reqC => SigmaIn(68 downto 68),
      reqR => SigmaIn(67 downto 67),
      reset => reset,
      x => wire_16,
      y => wire_18,
      z => wire_19);

  dpe_47 : APInt_S_1 -- .cast24
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(70 downto 70),
      ackR => SigmaOut(69 downto 69),
      clk => clk,
      reqC => SigmaIn(70 downto 70),
      reqR => SigmaIn(69 downto 69),
      reset => reset,
      x => wire_19,
      z => wire_20);

  dpe_48 : ApLoadReq -- LoadRequest_130
  -- configuration: 
  -- counterpart: dpe_49
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(71 downto 71),
      addr => wire_20,
      clk => clk,
      mack => lr_ack(39 downto 36),
      maddr => lr_addr(639 downto 576),
      mreq => lr_req(39 downto 36),
      mtag => lr_tag(319 downto 288),
      req => SigmaIn(71 downto 71),
      reset => reset);

  wire_21 <= To_APIntArray(dpe_49_data);
  dpe_49 : ApLoadComplete -- LoadComplete_133
  -- configuration: 
  -- counterpart: dpe_48
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(72 downto 72),
      clk => clk,
      data => dpe_49_data,
      mack => lc_ack(39 downto 36),
      mdata => lc_data(319 downto 288),
      mreq => lc_req(39 downto 36),
      mtag => lc_tag(319 downto 288),
      req => SigmaIn(72 downto 72),
      reset => reset);

  dpe_50 : APInt_S_2 -- Sub_136
  -- configuration: APIntSub
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(74 downto 74),
      ackR => SigmaOut(73 downto 73),
      clk => clk,
      reqC => SigmaIn(74 downto 74),
      reqR => SigmaIn(73 downto 73),
      reset => reset,
      x => wire_13,
      y => wire_21,
      z => wire_22);

  dpe_51 : APInt_S_1 -- .base.cast25
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(76 downto 76),
      ackR => SigmaOut(75 downto 75),
      clk => clk,
      reqC => SigmaIn(76 downto 76),
      reqR => SigmaIn(75 downto 75),
      reset => reset,
      x => wire_178,
      z => wire_23);

  dpe_52 : APInt_S_2 -- .idx.026
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(78 downto 78),
      ackR => SigmaOut(77 downto 77),
      clk => clk,
      reqC => SigmaIn(78 downto 78),
      reqR => SigmaIn(77 downto 77),
      reset => reset,
      x => wire_183,
      y => wire_7,
      z => wire_24);

  dpe_53 : APInt_S_2 -- .lvl.027
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(80 downto 80),
      ackR => SigmaOut(79 downto 79),
      clk => clk,
      reqC => SigmaIn(80 downto 80),
      reqR => SigmaIn(79 downto 79),
      reset => reset,
      x => wire_23,
      y => wire_24,
      z => wire_25);

  dpe_54 : APInt_S_2 -- .idx.128
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(82 downto 82),
      ackR => SigmaOut(81 downto 81),
      clk => clk,
      reqC => SigmaIn(82 downto 82),
      reqR => SigmaIn(81 downto 81),
      reset => reset,
      x => wire_31,
      y => wire_10,
      z => wire_26);

  dpe_55 : APInt_S_2 -- .lvl.129
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(84 downto 84),
      ackR => SigmaOut(83 downto 83),
      clk => clk,
      reqC => SigmaIn(84 downto 84),
      reqR => SigmaIn(83 downto 83),
      reset => reset,
      x => wire_25,
      y => wire_26,
      z => wire_27);

  dpe_56 : APInt_S_1 -- .cast30
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(86 downto 86),
      ackR => SigmaOut(85 downto 85),
      clk => clk,
      reqC => SigmaIn(86 downto 86),
      reqR => SigmaIn(85 downto 85),
      reset => reset,
      x => wire_27,
      z => wire_29);

  dpe_57_data <= To_StdLogicArray2D(wire_22);
  dpe_57 : ApStoreReq -- store 1
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(87 downto 87),
      addr => wire_29,
      clk => clk,
      data => dpe_57_data,
      mack => sr_ack(35 downto 32),
      maddr => sr_addr(575 downto 512),
      mdata => sr_data(287 downto 256),
      mreq => sr_req(35 downto 32),
      mtag => sr_tag(287 downto 256),
      req => SigmaIn(87 downto 87),
      reset => reset);

  dpe_58 : APInt_S_1 -- .base.cast31
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(89 downto 89),
      ackR => SigmaOut(88 downto 88),
      clk => clk,
      reqC => SigmaIn(89 downto 89),
      reqR => SigmaIn(88 downto 88),
      reset => reset,
      x => wire_121,
      z => wire_30);

  dpe_59 : APInt_S_2 -- .idx.032
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(91 downto 91),
      ackR => SigmaOut(90 downto 90),
      clk => clk,
      reqC => SigmaIn(91 downto 91),
      reqR => SigmaIn(90 downto 90),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_32);

  dpe_60 : APInt_S_2 -- .lvl.033
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(93 downto 93),
      ackR => SigmaOut(92 downto 92),
      clk => clk,
      reqC => SigmaIn(93 downto 93),
      reqR => SigmaIn(92 downto 92),
      reset => reset,
      x => wire_30,
      y => wire_32,
      z => wire_33);

  dpe_61 : APInt_S_2 -- .idx.134
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(95 downto 95),
      ackR => SigmaOut(94 downto 94),
      clk => clk,
      reqC => SigmaIn(95 downto 95),
      reqR => SigmaIn(94 downto 94),
      reset => reset,
      x => wire_31,
      y => wire_35,
      z => wire_34);

  dpe_63 : APInt_S_2 -- .lvl.135
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(97 downto 97),
      ackR => SigmaOut(96 downto 96),
      clk => clk,
      reqC => SigmaIn(97 downto 97),
      reqR => SigmaIn(96 downto 96),
      reset => reset,
      x => wire_33,
      y => wire_34,
      z => wire_36);

  dpe_64 : APInt_S_1 -- .cast36
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(99 downto 99),
      ackR => SigmaOut(98 downto 98),
      clk => clk,
      reqC => SigmaIn(99 downto 99),
      reqR => SigmaIn(98 downto 98),
      reset => reset,
      x => wire_36,
      z => wire_37);

  dpe_65 : ApLoadReq -- LoadRequest_179
  -- configuration: 
  -- counterpart: dpe_66
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(100 downto 100),
      addr => wire_37,
      clk => clk,
      mack => lr_ack(43 downto 40),
      maddr => lr_addr(703 downto 640),
      mreq => lr_req(43 downto 40),
      mtag => lr_tag(351 downto 320),
      req => SigmaIn(100 downto 100),
      reset => reset);

  wire_38 <= To_APIntArray(dpe_66_data);
  dpe_66 : ApLoadComplete -- LoadComplete_182
  -- configuration: 
  -- counterpart: dpe_65
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(101 downto 101),
      clk => clk,
      data => dpe_66_data,
      mack => lc_ack(43 downto 40),
      mdata => lc_data(351 downto 320),
      mreq => lc_req(43 downto 40),
      mtag => lc_tag(351 downto 320),
      req => SigmaIn(101 downto 101),
      reset => reset);

  dpe_67 : APInt_S_1 -- .base.cast37
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(103 downto 103),
      ackR => SigmaOut(102 downto 102),
      clk => clk,
      reqC => SigmaIn(103 downto 103),
      reqR => SigmaIn(102 downto 102),
      reset => reset,
      x => wire_82,
      z => wire_39);

  dpe_68 : APInt_S_2 -- .idx.038
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(105 downto 105),
      ackR => SigmaOut(104 downto 104),
      clk => clk,
      reqC => SigmaIn(105 downto 105),
      reqR => SigmaIn(104 downto 104),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_40);

  dpe_69 : APInt_S_2 -- .lvl.039
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(107 downto 107),
      ackR => SigmaOut(106 downto 106),
      clk => clk,
      reqC => SigmaIn(107 downto 107),
      reqR => SigmaIn(106 downto 106),
      reset => reset,
      x => wire_39,
      y => wire_40,
      z => wire_42);

  dpe_7 : APInt_S_2 -- .lvl.0
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(7 downto 7),
      ackR => SigmaOut(6 downto 6),
      clk => clk,
      reqC => SigmaIn(7 downto 7),
      reqR => SigmaIn(6 downto 6),
      reset => reset,
      x => wire_97,
      y => wire_1,
      z => wire_17);

  dpe_70 : APInt_S_2 -- .idx.140
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(109 downto 109),
      ackR => SigmaOut(108 downto 108),
      clk => clk,
      reqC => SigmaIn(109 downto 109),
      reqR => SigmaIn(108 downto 108),
      reset => reset,
      x => wire_31,
      y => wire_35,
      z => wire_43);

  dpe_71 : APInt_S_2 -- .lvl.141
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(111 downto 111),
      ackR => SigmaOut(110 downto 110),
      clk => clk,
      reqC => SigmaIn(111 downto 111),
      reqR => SigmaIn(110 downto 110),
      reset => reset,
      x => wire_42,
      y => wire_43,
      z => wire_44);

  dpe_72 : APInt_S_1 -- .cast42
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(113 downto 113),
      ackR => SigmaOut(112 downto 112),
      clk => clk,
      reqC => SigmaIn(113 downto 113),
      reqR => SigmaIn(112 downto 112),
      reset => reset,
      x => wire_44,
      z => wire_45);

  dpe_73 : ApLoadReq -- LoadRequest_203
  -- configuration: 
  -- counterpart: dpe_74
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(114 downto 114),
      addr => wire_45,
      clk => clk,
      mack => lr_ack(47 downto 44),
      maddr => lr_addr(767 downto 704),
      mreq => lr_req(47 downto 44),
      mtag => lr_tag(383 downto 352),
      req => SigmaIn(114 downto 114),
      reset => reset);

  wire_46 <= To_APIntArray(dpe_74_data);
  dpe_74 : ApLoadComplete -- LoadComplete_206
  -- configuration: 
  -- counterpart: dpe_73
    generic map(
      width => (0 => 4))
    port map(
      ack => SigmaOut(115 downto 115),
      clk => clk,
      data => dpe_74_data,
      mack => lc_ack(47 downto 44),
      mdata => lc_data(383 downto 352),
      mreq => lc_req(47 downto 44),
      mtag => lc_tag(383 downto 352),
      req => SigmaIn(115 downto 115),
      reset => reset);

  dpe_75 : APInt_S_2 -- Mul_209
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(117 downto 117),
      ackR => SigmaOut(116 downto 116),
      clk => clk,
      reqC => SigmaIn(117 downto 117),
      reqR => SigmaIn(116 downto 116),
      reset => reset,
      x => wire_46,
      y => wire_38,
      z => wire_47);

  dpe_76 : APInt_S_1 -- .base.cast43
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(119 downto 119),
      ackR => SigmaOut(118 downto 118),
      clk => clk,
      reqC => SigmaIn(119 downto 119),
      reqR => SigmaIn(118 downto 118),
      reset => reset,
      x => wire_178,
      z => wire_48);

  dpe_77 : APInt_S_2 -- .idx.044
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(121 downto 121),
      ackR => SigmaOut(120 downto 120),
      clk => clk,
      reqC => SigmaIn(121 downto 121),
      reqR => SigmaIn(120 downto 120),
      reset => reset,
      x => wire_183,
      y => wire_7,
      z => wire_49);

  dpe_78 : APInt_S_2 -- .lvl.045
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(123 downto 123),
      ackR => SigmaOut(122 downto 122),
      clk => clk,
      reqC => SigmaIn(123 downto 123),
      reqR => SigmaIn(122 downto 122),
      reset => reset,
      x => wire_48,
      y => wire_49,
      z => wire_50);

  dpe_79 : APInt_S_2 -- .idx.146
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(125 downto 125),
      ackR => SigmaOut(124 downto 124),
      clk => clk,
      reqC => SigmaIn(125 downto 125),
      reqR => SigmaIn(124 downto 124),
      reset => reset,
      x => wire_31,
      y => wire_35,
      z => wire_51);

  dpe_8 : APInt_S_2 -- .idx.1
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(9 downto 9),
      ackR => SigmaOut(8 downto 8),
      clk => clk,
      reqC => SigmaIn(9 downto 9),
      reqR => SigmaIn(8 downto 8),
      reset => reset,
      x => wire_31,
      y => wire_7,
      z => wire_28);

  dpe_80 : APInt_S_2 -- .lvl.147
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(127 downto 127),
      ackR => SigmaOut(126 downto 126),
      clk => clk,
      reqC => SigmaIn(127 downto 127),
      reqR => SigmaIn(126 downto 126),
      reset => reset,
      x => wire_50,
      y => wire_51,
      z => wire_53);

  dpe_81 : APInt_S_1 -- .cast48
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(129 downto 129),
      ackR => SigmaOut(128 downto 128),
      clk => clk,
      reqC => SigmaIn(129 downto 129),
      reqR => SigmaIn(128 downto 128),
      reset => reset,
      x => wire_53,
      z => wire_54);

  dpe_82_data <= To_StdLogicArray2D(wire_47);
  dpe_82 : ApStoreReq -- store 2
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(130 downto 130),
      addr => wire_54,
      clk => clk,
      data => dpe_82_data,
      mack => sr_ack(39 downto 36),
      maddr => sr_addr(639 downto 576),
      mdata => sr_data(319 downto 288),
      mreq => sr_req(39 downto 36),
      mtag => sr_tag(319 downto 288),
      req => SigmaIn(130 downto 130),
      reset => reset);

  dpe_83 : APInt_S_2 -- ICMP_SGT_233
  -- configuration: APIntSGT
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(132 downto 132),
      ackR => SigmaOut(131 downto 131),
      clk => clk,
      reqC => SigmaIn(132 downto 132),
      reqR => SigmaIn(131 downto 131),
      reset => reset,
      x => wire_66,
      y => wire_149,
      z => wire_55);

  dpe_84 : APInt_S_1 -- ZExt_236
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(134 downto 134),
      ackR => SigmaOut(133 downto 133),
      clk => clk,
      reqC => SigmaIn(134 downto 134),
      reqR => SigmaIn(133 downto 133),
      reset => reset,
      x => wire_55,
      z => wire_56);

  dpe_85 : APInt_S_1 -- .base.cast49
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(136 downto 136),
      ackR => SigmaOut(135 downto 135),
      clk => clk,
      reqC => SigmaIn(136 downto 136),
      reqR => SigmaIn(135 downto 135),
      reset => reset,
      x => wire_58,
      z => wire_57);

  dpe_87 : APInt_S_2 -- .idx.050
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(138 downto 138),
      ackR => SigmaOut(137 downto 137),
      clk => clk,
      reqC => SigmaIn(138 downto 138),
      reqR => SigmaIn(137 downto 137),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_59);

  dpe_88 : APInt_S_2 -- .lvl.051
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(140 downto 140),
      ackR => SigmaOut(139 downto 139),
      clk => clk,
      reqC => SigmaIn(140 downto 140),
      reqR => SigmaIn(139 downto 139),
      reset => reset,
      x => wire_57,
      y => wire_59,
      z => wire_60);

  dpe_89 : APInt_S_2 -- .idx.152
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(142 downto 142),
      ackR => SigmaOut(141 downto 141),
      clk => clk,
      reqC => SigmaIn(142 downto 142),
      reqR => SigmaIn(141 downto 141),
      reset => reset,
      x => wire_31,
      y => wire_7,
      z => wire_61);

  dpe_90 : APInt_S_2 -- .lvl.153
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(144 downto 144),
      ackR => SigmaOut(143 downto 143),
      clk => clk,
      reqC => SigmaIn(144 downto 144),
      reqR => SigmaIn(143 downto 143),
      reset => reset,
      x => wire_60,
      y => wire_61,
      z => wire_62);

  dpe_91 : APInt_S_1 -- .cast54
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(146 downto 146),
      ackR => SigmaOut(145 downto 145),
      clk => clk,
      reqC => SigmaIn(146 downto 146),
      reqR => SigmaIn(145 downto 145),
      reset => reset,
      x => wire_62,
      z => wire_63);

  dpe_92_data <= To_StdLogicArray2D(wire_56);
  dpe_92 : ApStoreReq -- store 3
  -- configuration: 
    generic map(
      suppress_immediate_ack => (0 => true),
      width => (0 => 4))
    port map(
      ack => SigmaOut(147 downto 147),
      addr => wire_63,
      clk => clk,
      data => dpe_92_data,
      mack => sr_ack(43 downto 40),
      maddr => sr_addr(703 downto 640),
      mdata => sr_data(351 downto 320),
      mreq => sr_req(43 downto 40),
      mtag => sr_tag(351 downto 320),
      req => SigmaIn(147 downto 147),
      reset => reset);

  dpe_93 : APInt_S_2 -- ICMP_SGE_261
  -- configuration: APIntSGE
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(149 downto 149),
      ackR => SigmaOut(148 downto 148),
      clk => clk,
      reqC => SigmaIn(149 downto 149),
      reqR => SigmaIn(148 downto 148),
      reset => reset,
      x => wire_13,
      y => wire_21,
      z => wire_64);

  dpe_94 : APInt_S_1 -- ZExt_264
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(151 downto 151),
      ackR => SigmaOut(150 downto 150),
      clk => clk,
      reqC => SigmaIn(151 downto 151),
      reqR => SigmaIn(150 downto 150),
      reset => reset,
      x => wire_64,
      z => wire_65);

  dpe_95 : APInt_S_1 -- .base.cast55
  -- configuration: APIntToAPIntUnsigned
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(153 downto 153),
      ackR => SigmaOut(152 downto 152),
      clk => clk,
      reqC => SigmaIn(153 downto 153),
      reqR => SigmaIn(152 downto 152),
      reset => reset,
      x => wire_58,
      z => wire_67);

  dpe_96 : APInt_S_2 -- .idx.056
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(155 downto 155),
      ackR => SigmaOut(154 downto 154),
      clk => clk,
      reqC => SigmaIn(155 downto 155),
      reqR => SigmaIn(154 downto 154),
      reset => reset,
      x => wire_4,
      y => wire_7,
      z => wire_68);

  dpe_97 : APInt_S_2 -- .lvl.057
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(157 downto 157),
      ackR => SigmaOut(156 downto 156),
      clk => clk,
      reqC => SigmaIn(157 downto 157),
      reqR => SigmaIn(156 downto 156),
      reset => reset,
      x => wire_67,
      y => wire_68,
      z => wire_69);

  dpe_98 : APInt_S_2 -- .idx.158
  -- configuration: APIntMul
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(159 downto 159),
      ackR => SigmaOut(158 downto 158),
      clk => clk,
      reqC => SigmaIn(159 downto 159),
      reqR => SigmaIn(158 downto 158),
      reset => reset,
      x => wire_31,
      y => wire_10,
      z => wire_70);

  dpe_99 : APInt_S_2 -- .lvl.159
  -- configuration: APIntAdd
    generic map(
      colouring => (0 => 0))
    port map(
      ackC => SigmaOut(161 downto 161),
      ackR => SigmaOut(160 downto 160),
      clk => clk,
      reqC => SigmaIn(161 downto 161),
      reqR => SigmaIn(160 downto 160),
      reset => reset,
      x => wire_69,
      y => wire_70,
      z => wire_71);

end default_arch;

configuration test_ints_dp_config of test_ints_dp is
  for default_arch

    for dpe_10 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_100 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_102 : APInt_S_2
      use configuration ahir.APIntSLT;
    end for;

    for dpe_103 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_104 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_105 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_106 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_107 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_108 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_109 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_11 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_111 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_112 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_113 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_114 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_116 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_117 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_120 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_121 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_122 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_123 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_124 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_125 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_128 : APInt_S_2
      use configuration ahir.APIntSLE;
    end for;

    for dpe_129 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_130 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_131 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_132 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_133 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_134 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_135 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_137 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_138 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_139 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_14 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_140 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_141 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_142 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_145 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_146 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_147 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_148 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_149 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_150 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_153 : APInt_S_2
      use configuration ahir.APIntEQ;
    end for;

    for dpe_154 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_155 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_156 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_157 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_158 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_159 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_16 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_160 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_162 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_163 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_164 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_165 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_167 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_168 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_17 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_171 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_172 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_173 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_174 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_175 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_176 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_179 : APInt_S_2
      use configuration ahir.APIntNE;
    end for;

    for dpe_18 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_180 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_181 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_182 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_183 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_184 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_185 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_186 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_188 : APInt_S_2
      use configuration ahir.APIntAShr;
    end for;

    for dpe_189 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_19 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_191 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_193 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_194 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_195 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_196 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_198 : APInt_S_2
      use configuration ahir.APIntShl;
    end for;

    for dpe_199 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_2 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_20 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_200 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_201 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_202 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_203 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_204 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_206 : APInt_S_2
      use configuration ahir.APIntAnd;
    end for;

    for dpe_207 : APInt_S_2
      use configuration ahir.APIntOr;
    end for;

    for dpe_208 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_209 : APInt_S_2
      use configuration ahir.APIntXor;
    end for;

    for dpe_23 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_24 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_26 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_28 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_29 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_30 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_31 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_33 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_34 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_35 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_36 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_38 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_39 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_4 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_42 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_43 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_44 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_45 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_46 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_47 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_50 : APInt_S_2
      use configuration ahir.APIntSub;
    end for;

    for dpe_51 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_52 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_53 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_54 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_55 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_56 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_58 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_59 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_60 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_61 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_63 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_64 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_67 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_68 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_69 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_7 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_70 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_71 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_72 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_75 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_76 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_77 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_78 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_79 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_8 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_80 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_81 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_83 : APInt_S_2
      use configuration ahir.APIntSGT;
    end for;

    for dpe_84 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_85 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_87 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_88 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_89 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_90 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_91 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_93 : APInt_S_2
      use configuration ahir.APIntSGE;
    end for;

    for dpe_94 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_95 : APInt_S_1
      use configuration ahir.APIntToAPIntUnsigned;
    end for;

    for dpe_96 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_97 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

    for dpe_98 : APInt_S_2
      use configuration ahir.APIntMul;
    end for;

    for dpe_99 : APInt_S_2
      use configuration ahir.APIntAdd;
    end for;

  end for;
end test_ints_dp_config;
