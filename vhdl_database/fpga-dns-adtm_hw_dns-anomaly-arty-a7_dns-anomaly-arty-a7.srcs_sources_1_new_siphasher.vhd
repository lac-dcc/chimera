LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;

ENTITY siphasher IS
GENERIC (
  g_compression_rounds : NATURAL RANGE 0 TO 15 := 1; -- 2 - 1 = 1
  g_finalise_rounds : NATURAL RANGE 0 TO 15 := 3; -- 4 - 1 = 3
  g_siphash_length : STD_LOGIC_VECTOR(63 DOWNTO 0) := x"7800000000000000";
  g_siphash_finalise_constant : STD_LOGIC_VECTOR(63 DOWNTO 0) := x"00000000000000ff"
);
PORT (
  clk : IN STD_LOGIC;
  in_key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
  in_data : IN STD_LOGIC_VECTOR(959 DOWNTO 0);
  in_start : IN STD_LOGIC;
  out_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  out_ready : OUT STD_LOGIC
);
END siphasher;

ARCHITECTURE rtl OF siphasher IS
  TYPE state_t IS (
    Idle,
    InitV,
    InitKey,
    CompressionBefore,
    CompressionSIPRound1,
    CompressionSIPRound2,
    CompressionSIPRound3,
    CompressionSIPRound4,
    CompressionAfter,
    CompressionLengthBefore,
    CompressionLengthSIPRound1,
    CompressionLengthSIPRound2,
    CompressionLengthSIPRound3,
    CompressionLengthSIPRound4,
    CompressionLengthAfter,
    FinaliseBefore,
    FinaliseSIPRound1,
    FinaliseSIPRound2,
    FinaliseSIPRound3,
    FinaliseSIPRound4,
    FinaliseAfter,
    Output
  );

  TYPE hstate_t IS RECORD
    s : state_t;

    crc : NATURAL RANGE 0 TO 15; -- Compression round counter
    frc : NATURAL RANGE 0 TO 15; -- Finalise round counter

    dpc : NATURAL RANGE 0 TO 1023; -- Data pointer counter


    v0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
    v1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
    v2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
    v3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  END RECORD;

  SIGNAL s, sin : hstate_t
  := hstate_t' (
    s => Idle,
    crc => 0,
    frc => 0,
    dpc => 0,
    v0 => (OTHERS => '0'),
    v1 => (OTHERS => '0'),
    v2 => (OTHERS => '0'),
    v3 => (OTHERS => '0')
  );

  SIGNAL d : STD_LOGIC_VECTOR(959 DOWNTO 0) := (OTHERS => '0');
  SIGNAL k : STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');

  PROCEDURE siphash_round_1(
    SIGNAL v0_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v0_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  ) IS
  VARIABLE v0, v1, v2, v3: UNSIGNED(63 downto 0);
  BEGIN
    v0 := UNSIGNED(v0_in);
    v1 := UNSIGNED(v1_in);
    v2 := UNSIGNED(v2_in);
    v3 := UNSIGNED(v3_in);

    v0 := v0 + v1;
    v2 := v2 + v3;
    v1 := rotate_left(v1, 13);
    v3 := rotate_left(v3, 16);

    v0_out <= STD_LOGIC_VECTOR(v0);
    v1_out <= STD_LOGIC_VECTOR(v1);
    v2_out <= STD_LOGIC_VECTOR(v2);
    v3_out <= STD_LOGIC_VECTOR(v3);
  END siphash_round_1;

  PROCEDURE siphash_round_2(
    SIGNAL v0_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v0_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  ) IS
  VARIABLE v0, v1, v2, v3: UNSIGNED(63 downto 0);
  BEGIN
    v0 := UNSIGNED(v0_in);
    v1 := UNSIGNED(v1_in);
    v2 := UNSIGNED(v2_in);
    v3 := UNSIGNED(v3_in);

    v1 := v1 xor v0;
    v3 := v3 xor v2;
    v0 := rotate_left(v0, 32);

    v0_out <= STD_LOGIC_VECTOR(v0);
    v1_out <= STD_LOGIC_VECTOR(v1);
    v2_out <= STD_LOGIC_VECTOR(v2);
    v3_out <= STD_LOGIC_VECTOR(v3);
  END siphash_round_2;

  PROCEDURE siphash_round_3(
    SIGNAL v0_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v0_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  ) IS
  VARIABLE v0, v1, v2, v3: UNSIGNED(63 downto 0);
  BEGIN
    v0 := UNSIGNED(v0_in);
    v1 := UNSIGNED(v1_in);
    v2 := UNSIGNED(v2_in);
    v3 := UNSIGNED(v3_in);

    v0 := v0 + v3;
    v2 := v2 + v1;
    v1 := rotate_left(v1, 17);
    v3 := rotate_left(v3, 21);

    v0_out <= STD_LOGIC_VECTOR(v0);
    v1_out <= STD_LOGIC_VECTOR(v1);
    v2_out <= STD_LOGIC_VECTOR(v2);
    v3_out <= STD_LOGIC_VECTOR(v3);
  END siphash_round_3;

  PROCEDURE siphash_round_4(
    SIGNAL v0_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v0_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v1_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v2_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL v3_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  ) IS
  VARIABLE v0, v1, v2, v3: UNSIGNED(63 downto 0);
  BEGIN
    v0 := UNSIGNED(v0_in);
    v1 := UNSIGNED(v1_in);
    v2 := UNSIGNED(v2_in);
    v3 := UNSIGNED(v3_in);

    v1 := v1 xor v2;
    v3 := v3 xor v0;
    v2 := rotate_left(v2, 32);

    v0_out <= STD_LOGIC_VECTOR(v0);
    v1_out <= STD_LOGIC_VECTOR(v1);
    v2_out <= STD_LOGIC_VECTOR(v2);
    v3_out <= STD_LOGIC_VECTOR(v3);
  END siphash_round_4;

BEGIN
  hash : PROCESS (clk)

  BEGIN
    IF rising_edge(clk) THEN
      out_ready <= '0';

      CASE s.s IS
        WHEN Idle =>
          IF (in_start = '1') THEN
            sin.s <= InitV;
            d <= in_data;
            k <= in_key;
          ELSE
            sin.s <= Idle;
          END IF;

        WHEN InitV =>
          sin.v0 <= x"736f6d6570736575";
          sin.v1 <= x"646f72616e646f6d";
          sin.v2 <= x"6c7967656e657261";
          sin.v3 <= x"7465646279746573";
          sin.s <= InitKey;

        WHEN InitKey =>
          sin.v3 <= s.v3 xor (k(63 DOWNTO 0));
          sin.v2 <= s.v2 xor (k(127 DOWNTO 64));
          sin.v1 <= s.v1 xor (k(63 DOWNTO 0));
          sin.v0 <= s.v0 xor (k(127 DOWNTO 64));
          sin.dpc <= 0;
          sin.s <= CompressionBefore;

        WHEN CompressionBefore =>
          IF (s.dpc = 960) THEN
            sin.s <= CompressionLengthBefore;
          ELSE
            sin.v3 <= s.v3 xor d((s.dpc + 63) DOWNTO s.dpc);
            sin.crc <= 0;
            sin.s <= CompressionSIPRound1;
          END IF;

        WHEN CompressionSIPRound1 =>
          siphash_round_1(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionSIPRound2;

        WHEN CompressionSIPRound2 =>
          siphash_round_2(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionSIPRound3;

        WHEN CompressionSIPRound3 =>
          siphash_round_3(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionSIPRound4;

        WHEN CompressionSIPRound4 =>
          siphash_round_4(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          IF (s.crc = g_compression_rounds) THEN
            sin.s <= CompressionAfter;
          ELSE
            sin.crc <= s.crc + 1;
            sin.s <= CompressionSIPRound1;
          END IF;

        WHEN CompressionAfter =>
          sin.v0 <= s.v0 xor d((s.dpc + 63) DOWNTO s.dpc);
          sin.dpc <= s.dpc + 64;
          sin.s <= CompressionBefore;

        WHEN CompressionLengthBefore =>
          sin.v3 <= s.v3 xor g_siphash_length;
          sin.crc <= 0;
          sin.s <= CompressionLengthSIPRound1;

        WHEN CompressionLengthSIPRound1 =>
          siphash_round_1(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionLengthSIPRound2;

        WHEN CompressionLengthSIPRound2 =>
          siphash_round_2(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionLengthSIPRound3;

        WHEN CompressionLengthSIPRound3 =>
          siphash_round_3(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= CompressionLengthSIPRound4;

        WHEN CompressionLengthSIPRound4 =>
          siphash_round_4(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          IF (s.crc = g_compression_rounds) THEN
            sin.s <= CompressionLengthAfter;
          ELSE
            sin.crc <= s.crc + 1;
            sin.s <= CompressionLengthSIPRound1;
          END IF;

        WHEN CompressionLengthAfter =>
          sin.v0 <= s.v0 xor g_siphash_length;
          sin.s <= FinaliseBefore;

        WHEN FinaliseBefore =>
          sin.v2 <= s.v2 xor g_siphash_finalise_constant;
          sin.crc <= 0;
          sin.s <= FinaliseSIPRound1;

        WHEN FinaliseSIPRound1 =>
          siphash_round_1(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= FinaliseSIPRound2;

        WHEN FinaliseSIPRound2 =>
          siphash_round_2(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= FinaliseSIPRound3;

        WHEN FinaliseSIPRound3 =>
          siphash_round_3(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          sin.s <= FinaliseSIPRound4;

        WHEN FinaliseSIPRound4 =>
          siphash_round_4(s.v0, s.v1, s.v2, s.v3, sin.v0, sin.v1, sin.v2, sin.v3);
          IF (s.crc = g_finalise_rounds) THEN
            sin.s <= FinaliseAfter;
          ELSE
            sin.crc <= s.crc + 1;
            sin.s <= FinaliseSIPRound1;
          END IF;

        WHEN FinaliseAfter =>
          sin.v0 <= s.v0 xor s.v1 xor s.v2 xor s.v3;
          sin.s <= Output;

        WHEN Output =>
          out_ready <= '1';
          sin.s <= Idle;

      END CASE;
    END IF;
  END PROCESS;

  out_data <= s.v0;

  reg : PROCESS(clk)
  BEGIN
    IF falling_edge(clk) THEN
      s <= sin;
    END IF;
  END PROCESS;

END rtl;
