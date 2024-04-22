-- ! BROKEN

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
library work;
  use work.PkgBlake2b.all;

entity MixG_tb is end MixG_tb;

architecture test of MixG_tb is

  constant kMixerNum : natural := 4;

  constant kTestV : U64Array_t(0 to 15) := (
    x"6A09E667F2BDC948", x"BB67AE8584CAA73B", x"3C6EF372FE94F82B", x"A54FF53A5F1D36F1",
    x"510E527FADE682D1", x"9B05688C2B3E6C1F", x"1F83D9ABFB41BD6B", x"5BE0CD19137E2179",
    x"6A09E667F3BCC908", x"BB67AE8584CAA73B", x"3C6EF372FE94F82B", x"A54FF53A5F1D36F1",
    x"510E527FADE682D2", x"9B05688C2B3E6C1F", x"E07C265404BE4294", x"5BE0CD19137E2179"
  );

  constant kExpectedV : U64Array_t(0 to 15) := (
    x"86B7C1568029BB79", x"C12CBCC809FF59F3", x"C6A5214CC0EACA8E", x"0C87CD524C14CC5D",
    x"44EE6039BD86A9F7", x"A447C850AA694A7E", x"DE080F1BB1C0F84B", x"595CB8A9A1ACA66C",
    x"BEC3AE837EAC4887", x"6267FC79DF9D6AD1", x"FA87B01273FA6DBE", x"521A715C63E08D8A",
    x"E02D0975B8D37A83", x"1C7B754F08B7D193", x"8F885A76B6E578FE", x"2318A24E2140FC64"
  );

  constant kTestMsg : U64Array_t(0 to 15) := (
    x"0000000000636261", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000"
  );

  signal aReset: std_logic;
  signal Clk: std_logic;
  signal Start: boolean;
  signal A_in, B_in, C_in, D_in, X, Y : U64Array_t(0 to kMixerNum-1);
  signal A_out, B_out, C_out, D_out     : U64Array_t(0 to kMixerNum-1);

  procedure WaitClk(N : positive := 1) is
  begin
   for i in 1 to N loop
      wait until rising_edge(Clk);
    end loop;
  end procedure WaitClk;

begin

  aReset <= '1', '0' after 10 ns;
  Clk <= not Clk after 10 ns when aReset = '0' else '0';

  MixerGen: for i in 0 to kMixerNum-1 generate
    MixerDUT: entity work.MixG_FlopPipe_4
    port map(
      Clk   => Clk,
      A_in  => A_in(i),
      B_in  => B_in(i),
      C_in  => C_in(i),
      D_in  => D_in(i),
      X     => X(i),
      Y     => Y(i),
      A_out => A_out(i),
      B_out => B_out(i),
      C_out => C_out(i),
      D_out => D_out(i)
    );
  end generate MixerGen;

  Main: process
    variable ResultVector : U64Array_t(0 to 15) := (others => (others => '0'));
  begin

    aReset <= '1'; wait for 10 ns; aReset <= '0';

    A_in(0) <= kTestV(0); -- V0
    A_in(1) <= kTestV(1); -- V1
    A_in(2) <= kTestV(2); -- V2
    A_in(3) <= kTestV(3); -- V3

    B_in(0) <= kTestV(4); -- V4
    B_in(1) <= kTestV(5); -- V5
    B_in(2) <= kTestV(6); -- V6
    B_in(3) <= kTestV(7); -- V7

    C_in(0) <= kTestV(8); -- V8
    C_in(1) <= kTestV(9); -- V9
    C_in(2) <= kTestV(10); -- V10
    C_in(3) <= kTestV(11); -- V11

    D_in(0) <= kTestV(12); -- V12
    D_in(1) <= kTestV(13); -- V13
    D_in(2) <= kTestV(14); -- V14
    D_in(3) <= kTestV(15); -- V15

    -- Mesage feed, round = 0
    X(0) <= kTestMsg(kSigma(0, 0));
    Y(0) <= kTestMsg(kSigma(0, 1));
    X(1) <= kTestMsg(kSigma(0, 2));
    Y(1) <= kTestMsg(kSigma(0, 3));
    X(2) <= kTestMsg(kSigma(0, 4));
    Y(2) <= kTestMsg(kSigma(0, 5));
    X(3) <= kTestMsg(kSigma(0, 6));
    Y(3) <= kTestMsg(kSigma(0, 7));

    WaitClk(4);

    -- Feed back the first mix result
    A_in(0) <= A_out(0); -- V0
    A_in(1) <= A_out(1); -- V1
    A_in(2) <= A_out(2); -- V2
    A_in(3) <= A_out(3); -- V3

    B_in(0) <= B_out(1); -- V5
    B_in(1) <= B_out(2); -- V6
    B_in(2) <= B_out(3); -- V7
    B_in(3) <= B_out(0); -- V4

    C_in(0) <= C_out(2); -- V10
    C_in(1) <= C_out(3); -- V11
    C_in(2) <= C_out(0); -- V8
    C_in(3) <= C_out(1); -- V9

    D_in(0) <= D_out(3); -- V15
    D_in(1) <= D_out(0); -- V12
    D_in(2) <= D_out(1); -- V13
    D_in(3) <= D_out(2); -- V14

    -- Mesage feed, round = 0
    X(0) <= kTestMsg(kSigma(0, 8));
    Y(0) <= kTestMsg(kSigma(0, 9));
    X(1) <= kTestMsg(kSigma(0, 10));
    Y(1) <= kTestMsg(kSigma(0, 11));
    X(2) <= kTestMsg(kSigma(0, 12));
    Y(2) <= kTestMsg(kSigma(0, 13));
    X(3) <= kTestMsg(kSigma(0, 14));
    Y(3) <= kTestMsg(kSigma(0, 15));

    Start <= true; WaitClk; Start <= false;
    --wait until Valid = x"F";
    WaitClk;

    --- VERIFICATION --------

    ResultVector(0)  := A_out(0);
    ResultVector(1)  := A_out(1);
    ResultVector(2)  := A_out(2);
    ResultVector(3)  := A_out(3);
    ResultVector(4)  := B_out(3);
    ResultVector(5)  := B_out(0);
    ResultVector(6)  := B_out(1);
    ResultVector(7)  := B_out(2);
    ResultVector(8)  := C_out(2);
    ResultVector(9)  := C_out(3);
    ResultVector(10) := C_out(0);
    ResultVector(11) := C_out(1);
    ResultVector(12) := D_out(1);
    ResultVector(13) := D_out(2);
    ResultVector(14) := D_out(3);
    ResultVector(15) := D_out(0);

    assert kExpectedV = ResultVector report "Test Failed" severity error;

    aReset <= '1';
    wait;
  end process;

end test;
