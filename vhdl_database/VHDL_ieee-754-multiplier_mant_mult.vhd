-- File : mant_mult.vhd

library ieee;
use ieee.std_logic_1164.all;

library lib438;
use lib438.all;

entity mant_mult is
  port (
    A_EXP : in  std_logic_vector(7 downto 0);
    B_EXP : in  std_logic_vector(7 downto 0);
    A_H : in  std_logic_vector(22 downto 0);
    B_H : in  std_logic_vector(22 downto 0);
    C_H : out std_logic;
    O_H : out std_logic_vector(47 downto 0));
end mant_mult;

architecture arch of mant_mult is

  component left_shifter is
    port (
      A : in  std_logic_vector(23 downto 0);
      S : in  std_logic_vector(4 downto 0);
      O : out std_logic_vector(47 downto 0)
      );
  end component left_shifter;

  component adder64 is
    port (
      A : in  std_logic_vector(63 downto 0);
      B : in  std_logic_vector(63 downto 0);
      C : in  std_logic;
      G : out std_logic;
      P : out std_logic;
      O : out std_logic_vector(63 downto 0)
      );
  end component adder64;

  component RRU3_2 is
    generic (DLY_TIME : time := 2 ns);
    port (
      A_VAL  : in  std_logic_vector(47 downto 0);
      B_VAL  : in  std_logic_vector(47 downto 0);
      C_VAL  : in  std_logic_vector(47 downto 0);
      F0_VAL : out std_logic_vector(47 downto 0);
      F1_VAL : out std_logic_vector(47 downto 0)
      );
  end component RRU3_2;

  component RRU7_3 is
    port (
      A_VAL  : in  std_logic_vector(47 downto 0);
      B_VAL  : in  std_logic_vector(47 downto 0);
      C_VAL  : in  std_logic_vector(47 downto 0);
      D_VAL  : in  std_logic_vector(47 downto 0);
      E_VAL  : in  std_logic_vector(47 downto 0);
      F_VAL  : in  std_logic_vector(47 downto 0);
      G_VAL  : in  std_logic_vector(47 downto 0);
      F0_VAL : out std_logic_vector(47 downto 0);
      F1_VAL : out std_logic_vector(47 downto 0);
      F2_VAL : out std_logic_vector(47 downto 0)
      );
  end component RRU7_3;

  signal pp_00 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_01 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_02 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_03 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_04 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_05 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_06 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_07 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_08 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_09 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_10 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_11 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_12 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_13 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_14 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_15 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_16 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_17 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_18 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_19 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_20 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_21 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_22 : std_logic_vector(47 downto 0) := (others => '0');
  signal pp_23 : std_logic_vector(47 downto 0) := (others => '0');

  signal s_shift_01 : std_logic_vector(4 downto 0);
  signal s_shift_02 : std_logic_vector(4 downto 0);
  signal s_shift_03 : std_logic_vector(4 downto 0);
  signal s_shift_04 : std_logic_vector(4 downto 0);
  signal s_shift_05 : std_logic_vector(4 downto 0);
  signal s_shift_06 : std_logic_vector(4 downto 0);
  signal s_shift_07 : std_logic_vector(4 downto 0);
  signal s_shift_08 : std_logic_vector(4 downto 0);
  signal s_shift_09 : std_logic_vector(4 downto 0);
  signal s_shift_10 : std_logic_vector(4 downto 0);
  signal s_shift_11 : std_logic_vector(4 downto 0);
  signal s_shift_12 : std_logic_vector(4 downto 0);
  signal s_shift_13 : std_logic_vector(4 downto 0);
  signal s_shift_14 : std_logic_vector(4 downto 0);
  signal s_shift_15 : std_logic_vector(4 downto 0);
  signal s_shift_16 : std_logic_vector(4 downto 0);
  signal s_shift_17 : std_logic_vector(4 downto 0);
  signal s_shift_18 : std_logic_vector(4 downto 0);
  signal s_shift_19 : std_logic_vector(4 downto 0);
  signal s_shift_20 : std_logic_vector(4 downto 0);
  signal s_shift_21 : std_logic_vector(4 downto 0);
  signal s_shift_22 : std_logic_vector(4 downto 0);
  signal s_shift_23 : std_logic_vector(4 downto 0);

  signal s_stage0_output00 : std_logic_vector(47 downto 0);
  signal s_stage0_output01 : std_logic_vector(47 downto 0);
  signal s_stage0_output02 : std_logic_vector(47 downto 0);
  signal s_stage0_output03 : std_logic_vector(47 downto 0);
  signal s_stage0_output04 : std_logic_vector(47 downto 0);
  signal s_stage0_output05 : std_logic_vector(47 downto 0);
  signal s_stage0_output06 : std_logic_vector(47 downto 0);
  signal s_stage0_output07 : std_logic_vector(47 downto 0);
  signal s_stage0_output08 : std_logic_vector(47 downto 0);
  signal s_stage0_output09 : std_logic_vector(47 downto 0);
  signal s_stage0_output10 : std_logic_vector(47 downto 0);

  signal s_stage1_output00 : std_logic_vector(47 downto 0);
  signal s_stage1_output01 : std_logic_vector(47 downto 0);
  signal s_stage1_output02 : std_logic_vector(47 downto 0);
  signal s_stage1_output03 : std_logic_vector(47 downto 0);
  signal s_stage1_output04 : std_logic_vector(47 downto 0);
  signal s_stage1_output05 : std_logic_vector(47 downto 0);

  signal s_stage2_output00 : std_logic_vector(47 downto 0);
  signal s_stage2_output01 : std_logic_vector(47 downto 0);
  signal s_stage2_output02 : std_logic_vector(47 downto 0);

  signal s_stage3_output00 : std_logic_vector(47 downto 0);
  signal s_stage3_output01 : std_logic_vector(47 downto 0);

  signal s_pp_sum_p : std_logic;
  signal s_pp_sum_g : std_logic;
  signal s_pp_sum_o : std_logic_vector(63 downto 0);

  signal s_in_01 : std_logic_vector(23 downto 0);
  signal s_in_02 : std_logic_vector(23 downto 0);
  signal s_in_03 : std_logic_vector(23 downto 0);
  signal s_in_04 : std_logic_vector(23 downto 0);
  signal s_in_05 : std_logic_vector(23 downto 0);
  signal s_in_06 : std_logic_vector(23 downto 0);
  signal s_in_07 : std_logic_vector(23 downto 0);
  signal s_in_08 : std_logic_vector(23 downto 0);
  signal s_in_09 : std_logic_vector(23 downto 0);
  signal s_in_10 : std_logic_vector(23 downto 0);
  signal s_in_11 : std_logic_vector(23 downto 0);
  signal s_in_12 : std_logic_vector(23 downto 0);
  signal s_in_13 : std_logic_vector(23 downto 0);
  signal s_in_14 : std_logic_vector(23 downto 0);
  signal s_in_15 : std_logic_vector(23 downto 0);
  signal s_in_16 : std_logic_vector(23 downto 0);
  signal s_in_17 : std_logic_vector(23 downto 0);
  signal s_in_18 : std_logic_vector(23 downto 0);
  signal s_in_19 : std_logic_vector(23 downto 0);
  signal s_in_20 : std_logic_vector(23 downto 0);
  signal s_in_21 : std_logic_vector(23 downto 0);
  signal s_in_22 : std_logic_vector(23 downto 0);
  signal s_in_23 : std_logic_vector(23 downto 0);

  constant zeros : std_logic_vector(24 downto 0) := (others => '0');

  signal s_fa : std_logic_vector(23 downto 0);
  signal s_fb : std_logic_vector(23 downto 0);

  function or_reduce( V: std_logic_vector )
    return std_ulogic is variable result: std_ulogic;
  begin
    for i in V'range loop
      if i = V'left then
        result := V(i);
      else
        result := result OR V(i);
      end if;
      exit when result = '1';
    end loop;
    return result;
  end or_reduce;
   
begin  -- arch

  C_H <= '1' when s_pp_sum_o(48) = '1' else '0';

  O_H <= zeros & A_H             when B_H = zeros(22 downto 0) else
         zeros & B_H             when A_H = zeros(22 downto 0) else
         s_pp_sum_o(47 downto 0) ;-- when s_pp_sum_o(46) = '0'  else
         --(others                                    => '1');

  s_fa <= or_reduce(A_EXP) & A_H;
  s_fb <= or_reduce(B_EXP) & B_H;

  pp_00(47 downto 24) <= (others                            => '0');
  pp_00(23 downto 0)  <= s_fa when B_H(0) = '1' else (others => '0');

  s_shift_01 <= "00001" when B_H(1) = '1'  else "00000";
  s_shift_02 <= "00010" when B_H(2) = '1'  else "00000";
  s_shift_03 <= "00011" when B_H(3) = '1'  else "00000";
  s_shift_04 <= "00100" when B_H(4) = '1'  else "00000";
  s_shift_05 <= "00101" when B_H(5) = '1'  else "00000";
  s_shift_06 <= "00110" when B_H(6) = '1'  else "00000";
  s_shift_07 <= "00111" when B_H(7) = '1'  else "00000";
  s_shift_08 <= "01000" when B_H(8) = '1'  else "00000";
  s_shift_09 <= "01001" when B_H(9) = '1'  else "00000";
  s_shift_10 <= "01010" when B_H(10) = '1' else "00000";
  s_shift_11 <= "01011" when B_H(11) = '1' else "00000";
  s_shift_12 <= "01100" when B_H(12) = '1' else "00000";
  s_shift_13 <= "01101" when B_H(13) = '1' else "00000";
  s_shift_14 <= "01110" when B_H(14) = '1' else "00000";
  s_shift_15 <= "01111" when B_H(15) = '1' else "00000";
  s_shift_16 <= "10000" when B_H(16) = '1' else "00000";
  s_shift_17 <= "10001" when B_H(17) = '1' else "00000";
  s_shift_18 <= "10010" when B_H(18) = '1' else "00000";
  s_shift_19 <= "10011" when B_H(19) = '1' else "00000";
  s_shift_20 <= "10100" when B_H(20) = '1' else "00000";
  s_shift_21 <= "10101" when B_H(21) = '1' else "00000";
  s_shift_22 <= "10110" when B_H(22) = '1' else "00000";
  s_shift_23 <= "10111" when s_fb(23) = '1' else "00000";

  s_in_01 <= s_fa when B_H(1) = '1'  else (others => '0');
  s_in_02 <= s_fa when B_H(2) = '1'  else (others => '0');
  s_in_03 <= s_fa when B_H(3) = '1'  else (others => '0');
  s_in_04 <= s_fa when B_H(4) = '1'  else (others => '0');
  s_in_05 <= s_fa when B_H(5) = '1'  else (others => '0');
  s_in_06 <= s_fa when B_H(6) = '1'  else (others => '0');
  s_in_07 <= s_fa when B_H(7) = '1'  else (others => '0');
  s_in_08 <= s_fa when B_H(8) = '1'  else (others => '0');
  s_in_09 <= s_fa when B_H(9) = '1'  else (others => '0');
  s_in_10 <= s_fa when B_H(10) = '1' else (others => '0');
  s_in_11 <= s_fa when B_H(11) = '1' else (others => '0');
  s_in_12 <= s_fa when B_H(12) = '1' else (others => '0');
  s_in_13 <= s_fa when B_H(13) = '1' else (others => '0');
  s_in_14 <= s_fa when B_H(14) = '1' else (others => '0');
  s_in_15 <= s_fa when B_H(15) = '1' else (others => '0');
  s_in_16 <= s_fa when B_H(16) = '1' else (others => '0');
  s_in_17 <= s_fa when B_H(17) = '1' else (others => '0');
  s_in_18 <= s_fa when B_H(18) = '1' else (others => '0');
  s_in_19 <= s_fa when B_H(19) = '1' else (others => '0');
  s_in_20 <= s_fa when B_H(20) = '1' else (others => '0');
  s_in_21 <= s_fa when B_H(21) = '1' else (others => '0');
  s_in_22 <= s_fa when B_H(22) = '1' else (others => '0');
  s_in_23 <= s_fa when s_fb(23) = '1' else (others => '0');

  SHIFT_01 : LEFT_SHIFTER
    port map (
      A => s_in_01,
      S => s_shift_01,
      O => pp_01
      );

  SHIFT_02 : LEFT_SHIFTER
    port map (
      A => s_in_02,
      S => s_shift_02,
      O => pp_02
      );

  SHIFT_03 : LEFT_SHIFTER
    port map (
      A => s_in_03,
      S => s_shift_03,
      O => pp_03
      );

  SHIFT_04 : LEFT_SHIFTER
    port map (
      A => s_in_04,
      S => s_shift_04,
      O => pp_04
      );

  SHIFT_05 : LEFT_SHIFTER
    port map (
      A => s_in_05,
      S => s_shift_05,
      O => pp_05
      );

  SHIFT_06 : LEFT_SHIFTER
    port map (
      A => s_in_06,
      S => s_shift_06,
      O => pp_06
      );

  SHIFT_07 : LEFT_SHIFTER
    port map (
      A => s_in_07,
      S => s_shift_07,
      O => pp_07
      );

  SHIFT_08 : LEFT_SHIFTER
    port map (
      A => s_in_08,
      S => s_shift_08,
      O => pp_08
      );

  SHIFT_09 : LEFT_SHIFTER
    port map (
      A => s_in_09,
      S => s_shift_09,
      O => pp_09
      );

  SHIFT_10 : LEFT_SHIFTER
    port map (
      A => s_in_10,
      S => s_shift_10,
      O => pp_10
      );

  SHIFT_11 : LEFT_SHIFTER
    port map (
      A => s_in_11,
      S => s_shift_11,
      O => pp_11
      );

  SHIFT_12 : LEFT_SHIFTER
    port map (
      A => s_in_12,
      S => s_shift_12,
      O => pp_12
      );

  SHIFT_13 : LEFT_SHIFTER
    port map (
      A => s_in_13,
      S => s_shift_13,
      O => pp_13
      );

  SHIFT_14 : LEFT_SHIFTER
    port map (
      A => s_in_14,
      S => s_shift_14,
      O => pp_14
      );

  SHIFT_15 : LEFT_SHIFTER
    port map (
      A => s_in_15,
      S => s_shift_15,
      O => pp_15
      );

  SHIFT_16 : LEFT_SHIFTER
    port map (
      A => s_in_16,
      S => s_shift_16,
      O => pp_16
      );

  SHIFT_17 : LEFT_SHIFTER
    port map (
      A => s_in_17,
      S => s_shift_17,
      O => pp_17
      );

  SHIFT_18 : LEFT_SHIFTER
    port map (
      A => s_in_18,
      S => s_shift_18,
      O => pp_18
      );

  SHIFT_19 : LEFT_SHIFTER
    port map (
      A => s_in_19,
      S => s_shift_19,
      O => pp_19
      );

  SHIFT_20 : LEFT_SHIFTER
    port map (
      A => s_in_20,
      S => s_shift_20,
      O => pp_20
      );

  SHIFT_21 : LEFT_SHIFTER
    port map (
      A => s_in_21,
      S => s_shift_21,
      O => pp_21
      );

  SHIFT_22 : LEFT_SHIFTER
    port map (
      A => s_in_22,
      S => s_shift_22,
      O => pp_22
      );

  SHIFT_23 : LEFT_SHIFTER
    port map (
      A => s_in_23,
      S => s_shift_23,
      O => pp_23
      );

  STAGE0_RRU7TO3_0 : RRU7_3
    port map (
      A_VAL  => pp_00,
      B_VAL  => pp_01,
      C_VAL  => pp_02,
      D_VAL  => pp_03,
      E_VAL  => pp_04,
      F_VAL  => pp_05,
      G_VAL  => pp_06,
      F0_VAL => s_stage0_output00,
      F1_VAL => s_stage0_output01,
      F2_VAL => s_stage0_output02
      );

  STAGE0_RRU7TO3_1 : RRU7_3
    port map (
      A_VAL  => pp_07,
      B_VAL  => pp_08,
      C_VAL  => pp_09,
      D_VAL  => pp_10,
      E_VAL  => pp_11,
      F_VAL  => pp_12,
      G_VAL  => pp_13,
      F0_VAL => s_stage0_output03,
      F1_VAL => s_stage0_output04,
      F2_VAL => s_stage0_output05
      );

  STAGE0_RRU7TO3_2 : RRU7_3
    port map (
      A_VAL  => pp_14,
      B_VAL  => pp_15,
      C_VAL  => pp_16,
      D_VAL  => pp_17,
      E_VAL  => pp_18,
      F_VAL  => pp_19,
      G_VAL  => pp_20,
      F0_VAL => s_stage0_output06,
      F1_VAL => s_stage0_output07,
      F2_VAL => s_stage0_output08
      );

  STAGE0_RRU3TO2_0 : RRU3_2
    port map (
      A_VAL  => pp_21,
      B_VAL  => pp_22,
      C_VAL  => pp_23,
      F0_VAL => s_stage0_output09,
      F1_VAL => s_stage0_output10
      );

  STAGE1_RRU7TO3_0 : RRU7_3
    port map (
      A_VAL  => s_stage0_output00,
      B_VAL  => s_stage0_output01,
      C_VAL  => s_stage0_output02,
      D_VAL  => s_stage0_output03,
      E_VAL  => s_stage0_output04,
      F_VAL  => s_stage0_output05,
      G_VAL  => s_stage0_output06,
      F0_VAL => s_stage1_output00,
      F1_VAL => s_stage1_output01,
      F2_VAL => s_stage1_output02
      );

  STAGE1_RRU7TO3_1 : RRU7_3
    port map (
      A_VAL  => s_stage0_output07,
      B_VAL  => s_stage0_output08,
      C_VAL  => s_stage0_output09,
      D_VAL  => s_stage0_output10,
      E_VAL  => (others => '0'),
      F_VAL  => (others => '0'),
      G_VAL  => (others => '0'),
      F0_VAL => s_stage1_output03,
      F1_VAL => s_stage1_output04,
      F2_VAL => s_stage1_output05
      );

  STAGE2_RRU7TO3_0 : RRU7_3
    port map (
      A_VAL  => s_stage1_output00,
      B_VAL  => s_stage1_output01,
      C_VAL  => s_stage1_output02,
      D_VAL  => s_stage1_output03,
      E_VAL  => s_stage1_output04,
      F_VAL  => s_stage1_output05,
      G_VAL  => (others => '0'),
      F0_VAL => s_stage2_output00,
      F1_VAL => s_stage2_output01,
      F2_VAL => s_stage2_output02
      );

  STAGE3_RRU3TO2_0 : RRU3_2
    port map (
      A_VAL  => s_stage2_output00,
      B_VAL  => s_stage2_output01,
      C_VAL  => s_stage2_output02,
      F0_VAL => s_stage3_output00,
      F1_VAL => s_stage3_output01
      );

  ADD_PP_ARRAY : ADDER64
    port map (
      A(63 downto 48) => (others => '0'),
      A(47 downto 0)  => s_stage3_output00,
      B(63 downto 48) => (others => '0'),
      B(47 downto 0)  => s_stage3_output01,
      C               => '0',
      O               => s_pp_sum_o,
      G               => s_pp_sum_g,
      P               => s_pp_sum_p
      );

end arch;
