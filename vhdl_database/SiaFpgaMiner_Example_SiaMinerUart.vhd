-- Copyright (c) 2017, Pedro Rivera, all rights reserved.
--
-- === SiaMinerUart.vhd ===
--
-- A top-level FPGA file to instantiate a parametrized number of Blake2bMinerCores,
-- interface them with a UART engine, and generate clocks.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgBlake2b.all;
  use work.PkgTestVectors.all;

entity SiaMinerUart is
  port(
    aReset : in std_logic;
    ClkIn    : in std_logic;
    aRun    : in std_logic;
    aRx : in std_logic;
    Tx : out std_logic;
    -- For bidir buffers
    TxDir : out std_logic;
    RxDir : out std_logic;
    RunDir : out std_logic;
    ResetDir : out std_logic;
    BufEn_n : out std_logic
  );
end SiaMinerUart;

architecture rtl of SiaMinerUart is

  constant kNumOfCores : integer := 1;
  
  function OrU64Array(U64Array : U64Array_t) return unsigned is
    variable vector : unsigned(63 downto 0); 
  begin
    vector := (others => '0');
    for i in U64Array'range loop
      vector := vector or U64Array(i);
    end loop;
    return vector;
  end OrU64Array;
  
  signal Clk, Run, aRun_ms : std_logic;
  signal NewWork, Success : boolean;
  signal BlockHeader : U64Array_t(9 downto 0);
  signal WorkData : std_logic_vector(10*64-1 downto 0);
  signal NonceOut : unsigned(63 downto 0) := (others => '0');
  signal NonceOutArray : U64Array_t(kNumOfCores-1 downto 0) := (others => kU64Zeros);
  signal SuccessArray : std_logic_vector(kNumOfCores-1 downto 0) := (others => '0'); 

begin

  -- Hard-wire the direction of the externally buffered IO
  TxDir <= '1';
  RxDir <= '0';
  RunDir <= '0';
  ResetDir <= '0';
  BufEn_n <= '0';

  -- DS asynchronous inputs
  DS: process(aReset, Clk)
  begin
    if aReset = '1' then
      Run     <= '0';
      aRun_ms <= '0';
    elsif rising_edge(Clk) then
      aRun_ms <= aRun;
      Run <= aRun_ms;
    end if;
  end process;
  
  --------------------------------------------------------------------
  -- Mining cores instantiation
  -------------------------------------------------------------------- 
  -- A variable number of cores is instantiated in a loop. To guarantee they
  -- all hash in a unique search space, their nonce seeds are separated by
  -- 2^40, which is enough to count more than 10 minutes @ 400 MHz. With a
  -- 48-bit nonce, this allows up to 256 cores without collision.
  
  -- Note: Instead of starting at zero, the TestNonce is added to make the
  -- design easy to test without having to make changes.
   
  CoreGen: for i in 0 to kNumOfCores-1 generate 
    MinerCore: entity work.Blake2bMinerCore
    generic map(
      -- VHDL max integer size is 32 bits, so instead of 2^40 we do 2^20 and append 20 zeroes.
      kNonceSeed => (to_unsigned(i*(2**20), 28) & x"00000") + kTestNonce(47 downto 0))
    port map(
      Clk         => Clk,
      Enable      => Run,
      BlockHeader => BlockHeader,
      NonceOut    => NonceOutArray(i),
      Success     => SuccessArray(i)
    );
  end generate CoreGen;

  -- OR all NonceOut vectors together. It can be done because they are zero
  -- when success is false and two or more succeding at the same time is
  -- extremely unlikely.
  NonceOut <= OrU64Array(NonceOutArray);
  Success <= unsigned(SuccessArray) > 0; -- True if any of the elements assert

  --------------------------------------------------------------------
  -- Host Interface
  --------------------------------------------------------------------
  -- In the future there would ideally be an AXI interface to the 
  -- mining cores. At this moment, for simplicity, a homebrew UART 
  -- will be used.

  UartInterface: entity work.UartGetWork 
  generic map(
    kBitTimeInClks => 1736) -- 115200 baud rate with 200MHz Clk
  port map(
    aReset   => aReset,
    Clk      => Clk,
    aRx      => aRx,
    tx       => Tx,
    newWork  => NewWork,
    workData => WorkData,
    success  => Success,
    nonce    => NonceOut,
    lastByte => open
  );

  -- Register the work data when NewWork asserts to pass it to the cores
  RegWork: process(aReset, Clk)
  begin
    if aReset = '1' then
      BlockHeader <= (others => kU64Zeros);
    elsif rising_edge(Clk) then
      if NewWork then
        for i in 0 to 9 loop
          -- Assuming WorkData is formatted as MSB:BlkHd(9)...LSB:BlkHd(0)
          BlockHeader(i) <= unsigned(WorkData((64*(i+1))-1 downto 64*i));
        end loop;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- Clocking
  --------------------------------------------------------------------

  Clocking: entity work.Clocking_K7
  port map ( 
    aReset    => aReset,
    ClkIn     => ClkIn,
    MiningClk => Clk,
    UartClk   => open,
    Locked    => open         
  );

  -- MinerClk <= Clk;
  -- UartClk  <= Clk;

end rtl;