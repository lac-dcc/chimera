-- Copyright (c) 2017, Pedro Rivera, all rights reserved.
--
-- === Blake2bMinerCore.vhd ===
-- 
-- This is a fully unrolled pipeline implementation of
-- the Blake2b hashing  algorithm cut and optimized for Siacoin mining. It
-- takes 96 cycles to fill the pipeline when  using 4-step MixG. For Blake2b
-- reference take a look at:   
--   https://tools.ietf.org/html/rfc7693#section-3.2
--   https://en.wikipedia.org/wiki/BLAKE_(hash_function)

-- Reset Philosophy: Resets are avoided to let Vivado do whatever it wishes
-- with resets and keep those issues out of the way when trying to fill the
-- FPGA with cores, so...

-- - How does it reset the state of the pipeline registers when new work is pushed?
--     There is no need, just changing the work data (BlockHeader) itself will produce a valid
--     result after it goes through the full length of the pipeline. The preceding stages of 
--     the pipeline may give invalid results because the new work data is shared with all
--     but the duration of this is negligible (~96 cycles) and unlikely to solve the puzzle.

-- - How does it stay idle without burning a ton of power while not being operated?
--     Simply keeping the inputs constant, will keep the flip flops in the pipeline
--     at a steady state once the constant input propagates through.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgBlake2b.all;

entity Blake2bMinerCore is
  generic(
    kNonceSeed : unsigned(47 downto 0) := (others => '1') -- So first round increments and starts at 0
  );
  port(
    Clk    : in std_logic;
    -- Enables the nonce generator. When low, resets to seed value.
    Enable : in std_logic;
    -- Message input (80-byte block header data, includes target)
    BlockHeader : in U64Array_t(9 downto 0);
    -- Result, only valid when Success is true.
    NonceOut : out unsigned(63 downto 0); -- Default assignment?
    -- Indicates target was met.
    Success  : out std_logic := '0'
  );
end Blake2bMinerCore;

architecture rtl of Blake2bMinerCore is

  constant kGPerMixer : integer := 4;
  constant kMixRounds : integer := 12;
  constant kPipeLength: integer := 4*2*12; -- 4 clks * 2 mixers * 12 rounds

  type U64Array2D_t is array (integer range <>) of U64Array_t(kGPerMixer-1 downto 0);
  type U48Array_t is array (integer range <>) of unsigned(47 downto 0);

  signal Msg : U64Array_t(15 downto 0) := (others => kU64Zeros);
  signal Hash0, Hash0_be, A2_out_dly, Target : unsigned(63 downto 0) := kU64Zeros;
  signal A1_in, B1_in, C1_in, D1_in, X1, Y1 : U64Array2D_t(kMixRounds-1 downto 0) := (others => (others => kU64Zeros));
  signal A2_in, B2_in, C2_in, D2_in, X2, Y2 : U64Array2D_t(kMixRounds-1 downto 0) := (others => (others => kU64Zeros));
  signal A1_out, B1_out, C1_out, D1_out     : U64Array2D_t(kMixRounds-1 downto 0) := (others => (others => kU64Zeros));
  signal A2_out, B2_out, C2_out, D2_out     : U64Array2D_t(kMixRounds-1 downto 0) := (others => (others => kU64Zeros));
  signal Nonce : U48Array_t(kMixRounds-1 downto 0);-- := (others => kU64Zeros); TODO: verify not initializing is beneficial

begin
  
  ----------------------------------------------------------------------------------------
    -- Nonce Generator & Message Feed
  ----------------------------------------------------------------------------------------
  -- Option A: Have 12x ~48-bit counters hooked up to each corresponding 'X' or 'Y' input.
  -- 38 bits allow counting for 10 min @ 400 MHz. 10 additional bits allow having 1024 cores.

  -- Option B: Have 96x ~48-bit registers shifting constantly (3,800 FF).
  --           Or do with BRAM FIFOs.

  -- Generated from the Sigma message schedule, the following table identifies which clock
  -- cycles of the pipeline have the nonce as an input (4). Differentiating between X or Y
  -- is useful because the 'Y' input is used 2 cycles later in the MixG function, thus 
  -- subtracting 2 from the counter removes the need for buffering the corresponding nonce.

    --  X   Y   X   Y   X   Y   X   Y
    -- 00  01  02  03  (4) 05  06  07   Clk 0  <-
    -- 08  09  10  11  12  13  14  15   Clk 4
    -- 14  10  (4) 08  09  15  13  06   Clk 8  <- 
    -- 01  12  00  02  11  07  05  03   Clk 12
    -- 11  08  12  00  05  02  15  13   Clk 16
    -- 10  14  03  06  07  01  09  (4)  Clk 20 <- 
    -- 07  09  03  01  13  12  11  14   Clk 24
    -- 02  06  05  10  (4) 00  15  08   Clk 28 <-
    -- 09  00  05  07  02  (4) 10  15   Clk 32 <- 
    -- 14  01  11  12  06  08  03  13   Clk 36
    -- 02  12  06  10  00  11  08  03   Clk 40
    -- (4) 13  07  05  15  14  01  09   Clk 44 <-
    -- 12  05  01  15  14  13  (4) 10   Clk 48 <-
    -- 00  07  06  03  09  02  08  11   Clk 52
    -- 13  11  07  14  12  01  03  09   Clk 56
    -- 05  00  15  (4) 08  06  02  10   Clk 60 <-
    -- 06  15  14  09  11  03  00  08   Clk 64
    -- 12  02  13  07  01  (4) 10  05   Clk 68 <-
    -- 10  02  08  (4) 07  06  01  05   Clk 72 <-
    -- 15  11  09  14  03  12  13  00   Clk 76
    -- 00  01  02  03  (4) 05  06  07   Clk 80 <-
    -- 08  09  10  11  12  13  14  15   Clk 84
    -- 14  10  (4) 08  09  15  13  06   Clk 88 <-
    -- 01  12  00  02  11  07  05  03   Clk 92

  -- Block data is only 80 bytes long (10x 64-bit words)
  Msg(9 downto 0)  <= BlockHeader;
  Msg(15 downto 10) <= (others => (others =>'0'));

  RNG: process(Clk)
  begin
    if rising_edge(Clk) then
      if Enable = '0' then
        -- Initial offsets
        Nonce(0)  <= kNonceSeed;
        Nonce(1)  <= kNonceSeed - 8;
        Nonce(2)  <= kNonceSeed - 20 - 2; -- Y 
        Nonce(3)  <= kNonceSeed - 28; 
        Nonce(4)  <= kNonceSeed - 32 - 2; -- Y
        Nonce(5)  <= kNonceSeed - 44; 
        Nonce(6)  <= kNonceSeed - 48;
        Nonce(7)  <= kNonceSeed - 60 - 2; -- Y
        Nonce(8)  <= kNonceSeed - 68 - 2; -- Y
        Nonce(9)  <= kNonceSeed - 72 - 2; -- Y 
        Nonce(10) <= kNonceSeed - 80; 
        Nonce(11) <= kNonceSeed - 88; 
      else
        for i in 0 to 11 loop
          Nonce(i) <= Nonce(i) + 1;
        end loop;
      end if;
    end if;
  end process;


  -------------------------------------------------------------------------------------------
  -- Mixer instatiation
  -------------------------------------------------------------------------------------------
  -- These series of for-generate loops wire all the stages of the pipeline statically. 

  -- Initialize the mix vector
  A1_in(0)(0) <= kHin(0);                                  -- V0
  A1_in(0)(1) <= kHin(1);                                  -- V1
  A1_in(0)(2) <= kHin(2);                                  -- V2
  A1_in(0)(3) <= kHin(3);                                  -- V3
  B1_in(0)(0) <= kHin(4);                                  -- V4
  B1_in(0)(1) <= kHin(5);                                  -- V5
  B1_in(0)(2) <= kHin(6);                                  -- V6
  B1_in(0)(3) <= kHin(7);                                  -- V7
  C1_in(0)(0) <= kIV(0);                                   -- V8
  C1_in(0)(1) <= kIV(1);                                   -- V9
  C1_in(0)(2) <= kIV(2);                                   -- V10
  C1_in(0)(3) <= kIV(3);                                   -- V11
  D1_in(0)(0) <= kIV(4) xor (x"00000000000000" & kMsgLen); -- V12
  D1_in(0)(1) <= kIV(5);                                   -- V13
  D1_in(0)(2) <= not kIV(6);                               -- V14 (last block, so invert)
  D1_in(0)(3) <= kIV(7);                                   -- V15

  RoundGen: for i in 0 to kMixRounds-1 generate 
    -- Mesage feed.
    MsgFeedGen: for j in 0 to 3 generate
      X1(i)(j) <= Msg(kSigma(i mod 10, 2*j))   when kSigma(i mod 10, 2*j)   /= 4 else x"0000" & Nonce(i);
      Y1(i)(j) <= Msg(kSigma(i mod 10, 2*j+1)) when kSigma(i mod 10, 2*j+1) /= 4 else x"0000" & Nonce(i); 
      X2(i)(j) <= Msg(kSigma(i mod 10, 2*j+8)) when kSigma(i mod 10, 2*j+8) /= 4 else x"0000" & Nonce(i);
      Y2(i)(j) <= Msg(kSigma(i mod 10, 2*j+9)) when kSigma(i mod 10, 2*j+9) /= 4 else x"0000" & Nonce(i);
    end generate;

    Mixer1: entity work.QuadG
    port map(
      Clk   => Clk,
      A_in  => A1_in(i),
      B_in  => B1_in(i),
      C_in  => C1_in(i),
      D_in  => D1_in(i),
      X     => X1(i),
      Y     => Y1(i),
      A_out => A1_out(i),
      B_out => B1_out(i),
      C_out => C1_out(i),
      D_out => D1_out(i)
    );

    A2_in(i) <= A1_out(i);
    B2_in(i) <= B1_out(i)(0) & B1_out(i)(3 downto 1);          -- ror 1
    C2_in(i) <= C1_out(i)(1 downto 0) & C1_out(i)(3 downto 2); -- ror 2
    D2_in(i) <= D1_out(i)(2 downto 0) & D1_out(i)(3);          -- ror 3

    Mixer2: entity work.QuadG
    port map(
      Clk   => Clk,
      A_in  => A2_in(i),
      B_in  => B2_in(i),
      C_in  => C2_in(i),
      D_in  => D2_in(i),
      X     => X2(i),
      Y     => Y2(i),
      A_out => A2_out(i),
      B_out => B2_out(i),
      C_out => C2_out(i),
      D_out => D2_out(i)
    );

    AllButLastRound: if i /= kMixRounds-1 generate
      A1_in(i+1) <= A2_out(i);
      B1_in(i+1) <= B2_out(i)(2 downto 0) & B2_out(i)(3);          -- rol 1
      C1_in(i+1) <= C2_out(i)(1 downto 0) & C2_out(i)(3 downto 2); -- rol 2
      D1_in(i+1) <= D2_out(i)(0) & D2_out(i)(3 downto 1);          -- rol 3
    end generate;

  end generate RoundGen;
  
  -- Only Hout(0) from the 12th Round is needed because it represents the most significant word 
  -- of the hash. Hash(0) = H0 xor V0 xor V8 where V0 is A2_out(last)(0), V8 is C2_out(last)(2). 
  -- But because of the pipeline, these two are delayed 1 or 2 clock cycles depending on the MixG
  -- implementation. To do a  coherent operation, A2_out (which comes out first) will be delayed 
  -- N cycles. Currently using 4-step MixG, hence the 1 cycle delay:

  DelayV0: process(Clk)
  begin
    if rising_edge(Clk) then
      A2_out_dly <= A2_out(kMixRounds-1)(0);
    end if;
  end process;
  
  Hash0 <= kHin(0) xor A2_out_dly xor C2_out(kMixRounds-1)(2);
  -- Sia represents the hash in big endian, so reverse the bytes
  Hash0_be <= Hash0(7 downto 0) & Hash0(15 downto 8) & Hash0(23 downto 16) & Hash0(31 downto 24) & 
              Hash0(39 downto 32) & Hash0(47 downto 40) & Hash0(55 downto 48) & Hash0(63 downto 56);

  ----------------------------------------------------------
  -- Target Comparison
  ----------------------------------------------------------
  Target <= BlockHeader(4); -- Word 4 contains the target

  Verify: process(Clk)
  begin
    if rising_edge(Clk) then
      if Hash0_be < Target then -- [!] Could report false positives while pipe isn't fully initialized
        Success <='1';
        NonceOut <= x"0000" & (Nonce(0) - (kPipeLength + 1)); -- Corresponding nonce
      else
        Success <='0';
        NonceOut <= (others => '0');
      end if;
    end if;
  end process;


end rtl;