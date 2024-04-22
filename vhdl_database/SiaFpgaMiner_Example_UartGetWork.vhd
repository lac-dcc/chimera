-- Copyright (c) 2017, Pedro Rivera, all rights reserved.
--
-- === UartGetWork.vhd ===
--
-- A quick and dirty UART interface taylored for receiving a standard
-- 80-byte work header and responding an 8-byte message.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgBlake2b.all;

entity UartGetWork is
  generic(
    kBitTimeInClks : positive := 10416 -- Number of cycles equivalent to the UART bit time
  );
  port(
    aReset   : in std_logic;
    Clk      : in std_logic;
    aRx      : in std_logic;
    tx      : out std_logic;
    newWork  : out boolean;
    workData : out std_logic_vector(80*8-1 downto 0);
    success  : in boolean;
    nonce    : in unsigned(8*8-1 downto 0);
    lastByte : out std_logic_vector(7 downto 0)
  );
end UartGetWork;

architecture rtl of UartGetWork is
  
  constant kRxBytes : positive := 80;
  constant kTxBytes : positive := 8;

  type RxState_t is (Idle, ShiftByte);
  type TxState_t is (Idle, LoadByte, ShiftOut);
  signal rxState : RxState_t;
  signal txState : TxState_t;
  signal rx, rx_ms, rx_dly : std_logic;
  signal bitTime : boolean;
  signal restartBaud : boolean;
  signal rxBitCount, txBitCount : natural;
  signal rxByteCount, txByteCount : natural;
  signal workDataLcl : std_logic_vector(80*8-1 downto 0);
  signal byteOut : std_logic_vector(9 downto 0); -- 1 start, 8 data, 1 stop
  signal noncelcl : std_logic_vector(63 downto 0);
  signal clkCount : integer := 0;

begin
  
  DS: process(aReset, Clk)
  begin
    if aReset = '1' then
      rx_ms  <= '0';
      rx     <= '0';
      rx_dly <= '0';
    elsif rising_edge(Clk) then
      rx_ms  <= aRx;
      rx     <= rx_ms;
      rx_dly <= rx;
    end if;
  end process;

  ---------------------------------------------------------------
  -- Bit sampling signals
  ---------------------------------------------------------------
  BaudGen: process(aReset, Clk)
  begin 
    if aReset = '1'then
      bitTime <= false;
      clkCount <= 0;
    elsif rising_edge(Clk) then
      bitTime  <= false;
      clkCount <= clkCount + 1;
      -- If restart is asserted set the count to -HalfBit such that
      -- the first assertion of bitTime is 1.5 bit periods after. 
      -- The purpose is to skip sampling the UART start bit.
      if restartBaud then
        clkCount <= -1*(kBitTimeInClks/2);
      elsif clkCount = kBitTimeInClks then
        bitTime  <= true;
        clkCount <= 0;
      end if;
    end if;
  end process;

  ---------------------------------------------------------------
  -- Receiver logic
  ---------------------------------------------------------------
  Receiver: process(aReset, Clk)
  begin
    if aReset = '1' then
      newWork  <= false;
      restartBaud <= false;
      workDataLcl <= (others => '0');
      rxState <= Idle;
      rxBitCount  <= 0;
      rxByteCount <= 0;
    elsif rising_edge(Clk) then
      
      newWork <= false;

      case(rxState) is

        when Idle =>
          rxBitCount <= 0;
          -- Jump to the ShiftIn state when Rx presents a falling edge
          if rx = '0' and rx_dly = '1' then
            rxState <= ShiftByte;
            restartBaud <= true;
          end if;

        when ShiftByte => -- Assumes LSB/b first
          restartBaud <= false;
          
          if rxBitCount < 8 then
            if bitTime then
              workDataLcl <= rx & workDataLcl(workDataLcl'high downto 1);
              rxBitCount <= rxBitCount + 1;
            end if;
          -- If a byte has been completed
          else 
            if rxByteCount = kRxBytes-1  then
              newWork <= true;
              rxByteCount <= 0;
            else 
              rxByteCount <= rxByteCount + 1;
            end if;
            rxState <= Idle;
          end if;
      end case;
    end if;
  end process;
  lastByte <= workDataLcl(workDataLcl'high downto workDataLcl'high-7);
  workData <= workDataLcl;

  ---------------------------------------------------------------
  -- Transmitter logic
  ---------------------------------------------------------------
  Transmitter: process(aReset, Clk)
  begin
    if aReset = '1' then
      byteOut  <= (others => '1'); -- Keep line high
      nonceLcl <= (others => '0');
      txState  <= Idle;
      txByteCount <= 0;
      txBitCount  <= 0;
    elsif rising_edge(Clk) then
      
      case(txState) is
        
        when Idle =>
          -- Register the nonce if success is asserted
          if success then
            nonceLcl <= std_logic_vector(nonce);
            txByteCount <= 0; 
            txState <= LoadByte;
          end if;

        when LoadByte => -- Assumes LSB/b first
          -- Wait for the next bit time
          if bitTime then
            -- stop & byte & start -->
            byteOut <= '1' & nonceLcl(7 downto 0) & '0'; 
            nonceLcl <= x"00" & nonceLcl(nonceLcl'high downto 8); -- Shift right
            txByteCount <= txByteCount + 1;
            txBitCount  <= txBitCount + 1; -- Start bit is being output
            txState <= ShiftOut;
          end if;

        when ShiftOut =>
          if bitTime then
            byteOut <= '1' & byteOut(byteOut'high downto 1);
            txBitCount <= txBitCount + 1;
            -- If the byte is completed
            if txBitCount = byteOut'length then
              txBitCount <= 0;
              if txByteCount < kTxBytes then
                txState <= LoadByte;
              else 
                txState <= Idle;
              end if;
            end if;
          end if;

      end case;
    end if;
  end process;

  tx <= byteOut(0); -- ! Assumes lsb first

end rtl;