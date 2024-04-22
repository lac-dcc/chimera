-- Testbench for the top level wrapper with UART interface

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
library work;
  use work.PkgBlake2b.all;
  use work.PkgTestVectors.all;

entity SiaMinerUart_tb is end SiaMinerUart_tb;

architecture test of SiaMinerUart_tb is

  signal aReset, Clk, Run : std_logic;
  signal aRx, tx : std_logic := '1';
  signal nonce : unsigned(63 downto 0) := (others => '0');
  --signal HashOut: U64Array_t(7 downto 0);

  constant kClockPeriod: time := 25 ns; -- 40 MHz
  constant kBitPeriod : time := 8.68 us; -- 1 bit period @ 115200

  procedure WaitClk(N : positive := 1) is
  begin
   for i in 1 to N loop
      wait until rising_edge(Clk);
    end loop;
  end procedure WaitClk;

begin

  Clk <= not Clk after kClockPeriod/2  when aReset = '0' else '0';

  DUT: entity work.SiaMinerUart
    port map (
      aReset  => aReset,  
      Clk     => Clk,
      Run     => Run,     
      aRx     => aRx,    
      tx     => tx);    

  Main: process

    procedure TxUartByte(byte : unsigned(7 downto 0)) is
    begin
      aRx <= '0'; -- Start bit
      wait for kBitPeriod; 
      for i in 0 to byte'high loop
        aRx <= byte(i);
        wait for kBitPeriod; 
      end loop;
      aRx <= '1'; -- Stop bit
      wait for kBitPeriod; 
    end procedure TxUartByte;
  
  begin

    Run <= '0';
    aReset <= '1', '0' after 100 ns; WaitClk;

    -- Send the test message LSB first (10x 64-bit words)
    for word in 0 to 9 loop
      for byte in 0 to 7 loop
        TxUartByte(kTestHeader(word)(8*(byte+1)-1 downto 8*byte));
        wait for kBitPeriod;
      end loop;
    end loop;

    WaitClk(10); --arbitrary
    Run <= '1';
    -- Miner should be working right now. Wait for the nonce to reply with 8 bytes

    for byte in 0 to 7 loop
      wait until tx = '0'; -- Start bit
      wait for 1.5*kBitPeriod; -- Middle of first bit
      for bit in 0 to 7 loop
        nonce <= tx & nonce(63 downto 1); -- LSB first
        wait for kBitPeriod;
      end loop;
    end loop;

    -- Verify
    assert nonce = kTestNonce 
      report "Expected nonce does not match response" severity error; -- See way to force the initial nonce, check endianness

    report "Success!";

    WaitClk;
    aReset <= '1';
    wait;
  end process;

end test;
