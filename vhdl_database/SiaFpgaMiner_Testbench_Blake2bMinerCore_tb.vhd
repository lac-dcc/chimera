-- Testbench for Blake2bMinerCore.vhd

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
library work;
  use work.PkgBlake2b.all;
  use work.PkgTestVectors.all;
library vunit_lib;
  context vunit_lib.vunit_context;

entity SiaMinerPiped_tb is
  generic (runner_cfg : string);
end SiaMinerPiped_tb;

architecture test of SiaMinerPiped_tb is

  signal Clk     : std_logic;
  signal StopSim : std_logic;
  signal Enable  : std_logic;
  signal Success : std_logic;
  signal NonceOut : unsigned(63 downto 0);
  signal ClkCount : unsigned(31 downto 0) := (others => '0');

  procedure WaitClk(N : positive := 1) is
  begin
   for i in 1 to N loop
      wait until rising_edge(Clk);
    end loop;
  end procedure WaitClk;

begin

  Clk <= not Clk after 5 ns when StopSim = '0' else '0'; --100 MHz clock

  DUT: entity work.Blake2bMinerCore
  generic map(
    kNonceSeed => kTestNonce(47 downto 0)) -- Start at the known Nonce to cause Success assertion.
  port map(
    Clk         => Clk,
    Enable      => Enable,
    BlockHeader => kTestHeader(9 downto 0),
    NonceOut    => NonceOut,
    Success     => Success
  );

  Main: process
  begin
    test_runner_setup(runner, runner_cfg);
    StopSim <= '0';

    -- Disable the nonce generation (loads nonce seeds)
    Enable <= '0';
    WaitClk;
    Enable <= '1';

    wait until Success = '1' or ClkCount > 97;
    assert NonceOut = kTestNonce report "Reported Nonce doesn't match expected" severity error;

    report "Success!";
    StopSim <= '1';
    test_runner_cleanup(runner); -- Simulation ends here
    wait;
  end process;

  -- Counting cycles in a signal for easy debug
  ClkCounter: process(Clk)
  begin
    if rising_edge(Clk) and Enable = '1' then
      ClkCount <= ClkCount + 1;
    end if;
  end process;

end test;
