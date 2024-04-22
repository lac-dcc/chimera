-- This file is copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/
-- and to the "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle"
-- on the internet to see if I have moved to another web hosting service.
--
-- Grant Searle
-- eMail address available on my main web page link above.
--
-- Microcomputer 3*TTY + 1*VGA

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
   port(
--      n_reset         : in std_logic;
--      Next 4 lines from CycloneIVB-Project borrowed...
        n_extReset  : in std_logic;
        n_key1      : in std_logic;
        n_key2      : in std_logic;
        leds        : out std_logic_vector(7 downto 0);

        clk25           : in std_logic;
--        clk             : in std_logic;                       -- "clk" kommt vom PLL als Signal

        sramData        : inout std_logic_vector(7 downto 0);
        sramAddress     : out std_logic_vector(18 downto 0);
        n_sRamWE        : out std_logic;
        n_sRamOE        : out std_logic;
        n_sRam1CS       : out std_logic;
        n_sRam2CS       : out std_logic;

-- ACIA0
        rxd1            : in std_logic;
        txd1            : out std_logic;
        rts1            : out std_logic;
        cts1            : in std_logic;

-- ACIA1
        rxd2            : in std_logic;
        txd2            : out std_logic;
        rts2            : out std_logic;
        cts2            : in std_logic;

-- ACIA2
        rxd3            : in std_logic;
        txd3            : out std_logic;
        rts3            : out std_logic;
        cts3            : in std_logic;

-- ACIA3
        rxd4            : in std_logic;
        txd4            : out std_logic;
        rts4            : out std_logic;
        cts4            : in std_logic;

-- Monochrome (RCA) video signals (when using TV timings only)
-- videoSync       : out std_logic;
-- video           : out std_logic;

        videoR0         : out std_logic;
        videoG0         : out std_logic;
        videoB0         : out std_logic;
        videoR1         : out std_logic;
        videoG1         : out std_logic;
        videoB1         : out std_logic;
        hSync           : out std_logic;
        vSync           : out std_logic;

        ps2Clk          : inout std_logic;
        ps2Data         : inout std_logic;

        sdCS            : out std_logic;
        sdMOSI          : out std_logic;
        sdMISO          : in std_logic;
        sdSCLK          : out std_logic
--      driveLED        : out std_logic := '1'
    );
end Microcomputer;

architecture struct of Microcomputer is

        signal clk                      : std_logic;
        signal cpuClock                 : std_logic;
        signal n_reset                  : std_logic :='1';        -- addition for n_extReset from CyclonIVb board
        signal n_WR                     : std_logic;
        signal n_RD                     : std_logic;
        signal cpuAddress               : std_logic_vector(15 downto 0);
        signal cpuDataOut               : std_logic_vector(7 downto 0);
        signal cpuDataIn                : std_logic_vector(7 downto 0);

        signal n_memWR                  : std_logic := '1';
        signal n_memRD                  : std_logic := '1';

        signal n_ledsel                 : std_logic :='1';  -- select signal for led register
        signal ledreg                   : std_logic_vector(7 downto 0) := "00000000";
        signal n_cpuidsel               : std_logic :='1';  -- select signal for CPUid register

        signal n_ioWR                   : std_logic := '1';
        signal n_ioRD                   : std_logic := '1';

        signal n_MREQ                   : std_logic := '1';
        signal n_IORQ                   : std_logic := '1';

        signal n_M1                     : std_logic := '1';

        signal monRomData               : std_logic_vector(7 downto 0);
        signal n_monRomCS               : std_logic := '1';
        signal n_RomActive              : std_logic := '0';

        signal physicaladdr             : std_logic_vector(19 downto 0);
        signal n_externalRam1CS         : std_logic := '1';
        signal n_externalRam2CS         : std_logic := '1';
        signal n_mmuCS                  : std_logic := '1';

        signal intClkCount              : std_logic_vector(19 downto 0);
        signal n_int50                  : std_logic;

-- ACIA0:
        signal interface1DataOut        : std_logic_vector(7 downto 0);
        signal n_int1                   : std_logic := '1';
        signal n_interface1CS           : std_logic := '1';
        signal n_brg1                   : std_logic := '1';
        signal sClk1                    : std_logic;

-- PS/2-Tastatur
        signal interface2DataOut        : std_logic_vector(7 downto 0);
        signal n_interface2CS           : std_logic := '1';

-- ACIA2:
        signal interface3DataOut        : std_logic_vector(7 downto 0);
        signal n_int3                   : std_logic := '1';
        signal n_interface3CS           : std_logic := '1';
        signal n_brg3                   : std_logic := '1';
        signal sClk3                    : std_logic;

-- ACIA3:
        signal interface4DataOut        : std_logic_vector(7 downto 0);
        signal n_int4                   : std_logic := '1';
        signal n_interface4CS           : std_logic := '1';
        signal n_brg4                   : std_logic := '1';
        signal sClk4                    : std_logic;

-- ACIA1:
        signal interface5DataOut        : std_logic_vector(7 downto 0);
        signal n_int2                   : std_logic := '1';
        signal n_interface5CS           : std_logic := '1';
        signal n_brg2                   : std_logic := '1';
        signal sClk2                    : std_logic;

        signal sdCardDataOut            : std_logic_vector(7 downto 0);
        signal n_sdCardCS               : std_logic := '1';

-- Graphic-RAM:
        signal interface6DataOut        : std_logic_vector(7 downto 0);
        signal n_int6                   : std_logic := '1';
        signal n_interface6CS           : std_logic := '1';



begin
--Shared Reset
    n_reset <= (n_extReset and n_key1);

-- CPM
-- Disable ROM if "OUT 38". Re-enable when (asynchronous) reset pressed or if "OUT 39".
        process (n_ioWR, n_reset) begin
            if (n_reset = '0') then
                n_RomActive <= '0';
            elsif (rising_edge(n_ioWR)) then
                if cpuAddress(7 downto 0) = "00111000" then     -- $38
                   n_RomActive <= '1';
                elsif cpuAddress(7 downto 0) = "00111001" then  -- $39
                   n_RomActive <= '0';
                end if;
            end if;
        end process;

-- ____________________________________________________________________________________
-- CPU CHOICE GOES HERE
        cpu1 : entity work.t80s
        generic map(
                mode    => 1,
                t2write => 1,
                iowait  => 0
        )
        port map(
                reset_n => n_reset,
                clk_n   => cpuClock,
                wait_n  => '1',
                int_n   => n_int50,
                nmi_n   => '1',
                busrq_n => '1',
                mreq_n  => n_MREQ,
                iorq_n  => n_IORQ,
                rd_n    => n_RD,
                wr_n    => n_WR,
                m1_n    => n_M1,
                a       => cpuAddress,
                di      => cpuDataIn,
                do      => cpuDataOut
        );
-- ____________________________________________________________________________________
-- ROM GOES HERE
        rom1 : entity work.Z80_CMON_ROM -- 2KB CP/M monitor
        port map(
                address => cpuAddress(10 downto 0),
                clock   => clk,
                q       => monRomData
        );
-- ____________________________________________________________________________________
-- RAM GOES HERE
        MemoryManagement : entity work.MMU4
        port map(
                clk             => cpuClock,                    -- clock based on divided cpu clock
                n_wr            => n_mmuCS or n_ioWR,           -- group of 8 ports to write data to the MMU
                n_rd            => n_mmuCS or n_ioRD,           -- future use, for reading data back from the MMU
                mmu_reset       => n_reset,                     -- and pin73RCreset, -- pushbutton reset low or RC startup low
                dataIn          => cpuDataOut,                  -- data lines to send commands to the MMU
                cpuAddress      => cpuAddress,                  -- cpu Adress lines to the MMU
                mmuAddressOut   => physicaladdr                 -- modified address lines from the MMU
        );

        sramData    <= cpuDataOut when n_memWR= '0' else (others => 'Z');
        sramAddress <= physicaladdr(18 downto 0);

        n_sRamWE    <= n_memWR;
        n_sRamOE    <= n_memRD;
        n_sRam1CS   <= n_externalRam1CS;
        n_sRam2CS   <= n_externalRam2CS;

-- ____________________________________________________________________________________
-- INPUT/OUTPUT DEVICES GO HERE

-- LED Register
        process(clk,n_reset)
        begin
           if rising_edge(clk) then

              if (n_reset = '0') then
                 ledreg <= "00000000";

              elsif (n_ledsel = '0') then
                    ledreg <= cpuDataOut;
                    else NULL;
              end if;
           end if;
        end process;
        leds <= ledreg; -- connect the LED register to the led pins



        io1 : entity work.bufferedUART                  -- IO1:RS232 = ACIA0
        port map(
                clk      => clk,
                n_wr     => n_interface1CS or n_ioWR,
                n_rd     => n_interface1CS or n_ioRD,
                n_int    => n_int1,
                regSel   => cpuAddress(0),
                dataIn   => cpuDataOut,
                dataOut  => interface1DataOut,
                rxClock  => sClk1,
                txClock  => sClk1,
                rxd      => rxd1,
                txd      => txd1,
                n_cts    => cts1,
                n_dcd    => '0',
                n_rts    => rts1
        );

        brg1 : entity work.brg
        port map(
                clk      => clk,
                n_reset  => n_reset,
                baud_clk => sClk1,
                n_wr     => n_ioWR,
                n_rd     => n_ioRD,
                n_cs     => n_brg1,
                dataIn   => cpuDataOut
        );

  io2 : entity work.SBCTextDisplayRGB           --     PS/2-Tastatur + Terminal
--
  generic map(
        EXTENDED_CHARSET => 1
--
----    VGA Values
--      DISPLAY_TOP_SCANLINE => 35,
--      VERT_SCANLINES => 448,
--      V_SYNC_ACTIVE => '1'

----    RCA values
--      CLOCKS_PER_PIXEL => 3,
--      CLOCKS_PER_SCANLINE => 3200,
--      DISPLAY_TOP_SCANLINE => 65,
--      VERT_SCANLINES => 312,
--      VERT_PIXEL_SCANLINES => 1,
--      VSYNC_SCANLINES => 4,
--      HSYNC_CLOCKS => 235,
--      DISPLAY_LEFT_CLOCK => 850
  )
--
  port map (
        n_reset => n_reset,
        clk     => clk,
--
---- RGB video signals
        hSync   => hSync,
        vSync   => vSync,
        videoR0 => videoR0,
        videoR1 => videoR1,
        videoG0 => videoG0,
        videoG1 => videoG1,
        videoB0 => videoB0,
        videoB1 => videoB1,
--
---- Monochrome (RCA) video signals (when using TV timings only)
--      sync => videoSync,
--      video => video,

---- Common and PS/2-Keyboard
        n_wr    => n_interface2CS or n_ioWR,
        n_rd    => n_interface2CS or n_ioRD,
        n_int   => n_int2,
        regSel  => cpuAddress(0),
        dataIn  => cpuDataOut,
        dataOut => interface2DataOut,
        ps2Clk  => ps2Clk,
        ps2Data => ps2Data
  );


        io5 : entity work.bufferedUART                  -- (IO2): RS232 = ACIA1
        port map(
                clk      => clk,
                n_wr     => n_interface2CS or n_ioWR,
                n_rd     => n_interface2CS or n_ioRD,
                n_int    => n_int2,
                regSel   => cpuAddress(0),
                dataIn   => cpuDataOut,
                dataOut  => interface5DataOut,
                rxClock  => sClk2,
                txClock  => sClk2,
                rxd      => rxd2,
                txd      => txd2,
                n_cts    => cts2,
                n_dcd    => '0',
                n_rts    => rts2
        );


        brg2 : entity work.brg
        port map(
                clk      => clk,
                n_reset  => n_reset,
                baud_clk => sClk2,
                n_wr     => n_ioWR,
                n_rd     => n_ioRD,
                n_cs     => n_brg2,
                dataIn   => cpuDataOut
        );

        io3 : entity work.bufferedUART                  -- IO3: RS232 = ACIA2
        port map(
                clk     => clk,
                n_wr    => n_interface3CS or n_ioWR,
                n_rd    => n_interface3CS or n_ioRD,
                n_int   => n_int3,
                regSel  => cpuAddress(0),
                dataIn  => cpuDataOut,
                dataOut => interface3DataOut,
                rxClock => sClk3,
                txClock => sClk3,
                rxd     => rxd3,
                txd     => txd3,
                n_cts   => cts3,
                n_dcd   => '0',
                n_rts   => rts3
        );

        brg3 : entity work.brg
        port map(
                clk      => clk,
                n_reset  => n_reset,
                baud_clk => sClk3,
                n_wr     => n_ioWR,
                n_rd     => n_ioRD,
                n_cs     => n_brg3,
                dataIn   => cpuDataOut
        );

        io4 : entity work.bufferedUART                  -- IO4: ESP8266 Wifi = ACIA3
        port map(
                clk     => clk,
                n_wr    => n_interface4CS or n_ioWR,
                n_rd    => n_interface4CS or n_ioRD,
                n_int   => n_int4,
                regSel  => cpuAddress(0),
                dataIn  => cpuDataOut,
                dataOut => interface4DataOut,
                rxClock => sClk4,
                txClock => sClk4,
                rxd     => rxd4,
                txd     => txd4,
--              n_cts   => cts4,
                n_cts   => '0',         -- ESP8266 does not support RTS
                n_dcd   => '0',
                n_rts   => rts4         -- the RTS signal is used to reset ESP8266
        );

        brg4 : entity work.brg
        port map(
                clk      => clk,
                n_reset  => n_reset,
                baud_clk => sClk4,
                n_wr     => n_ioWR,
                n_rd     => n_ioRD,
                n_cs     => n_brg4,
                dataIn   => cpuDataOut
        );

        sd1 : entity work.sd_controller
        port map(
                sdCS    => sdCS,
                sdMOSI  => sdMOSI,
                sdMISO  => sdMISO,
                sdSCLK  => sdSCLK,
                n_wr    => n_sdCardCS or n_ioWR,
                n_rd    => n_sdCardCS or n_ioRD,
                n_reset => n_reset,
                dataIn  => cpuDataOut,
                dataOut => sdCardDataOut,
                regAddr => cpuAddress(2 downto 0),
--                driveLED => driveLED,
                clk     => clk          -- 50 MHz clock = 25 MHz SPI clock
        );
-- ____________________________________________________________________________________
-- MEMORY READ/WRITE LOGIC GOES HERE
        n_ioWR          <= n_WR or n_IORQ;
        n_memWR         <= n_WR or n_MREQ;
        n_ioRD          <= n_RD or n_IORQ;
        n_memRD         <= n_RD or n_MREQ;

-- ____________________________________________________________________________________
-- CHIP SELECTS GO HERE
        n_monRomCS        <= '0' when cpuAddress(15 downto 11) = "00000"  and  n_RomActive = '0' else '1';                 -- 2K low memory         := BOOT-Monitor

-- Baud-Rate select Reg. BRGx
        n_brg1            <= '0' when cpuAddress(7 downto 0) = "01111011" and (n_ioWR = '0' or n_ioRD = '0')  else '1';    -- 1 Byte    $7B         := IO1 PC-Terminal          ACIA0_B
        n_brg2            <= '0' when cpuAddress(7 downto 0) = "01111100" and (n_ioWR = '0' or n_ioRD = '0')  else '1';    -- 1 Byte    $7C         := IO5 freie RS232          ACIA1_B
        n_brg3            <= '0' when cpuAddress(7 downto 0) = "01111101" and (n_ioWR = '0' or n_ioRD = '0')  else '1';    -- 1 Byte    $7D         := IO3 freie RS232          ACIA2_B
        n_brg4            <= '0' when cpuAddress(7 downto 0) = "01111110" and (n_ioWR = '0' or n_ioRD = '0')  else '1';    -- 1 Byte    $7E         := IO4 ESP8266 Wifi         ACIA3_B

-- 8 LED-Register on FPGA-Board
        n_ledsel          <= '0' when cpuAddress(7 downto 0) = "01111111" and (n_ioWR = '0')                  else '1';    -- 1 Byte    $7F write   := LED Anzeige-Register (WR)
        n_cpuidsel        <= '0' when cpuAddress(7 downto 0) = "01111111" and (n_ioRD = '0')                  else '1';    -- 1 Byte    $7F read    :=     CPU-ID (RD)

-- Status/Receive/Send-Reg for UART0...3
        n_interface1CS    <= '0' when cpuAddress(7 downto 1) = "1000000" and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 2 Bytes   $80-$81     := IO1 PC-Terminal          ACIA0_C
        n_interface2CS    <= '0' when cpuAddress(7 downto 1) = "1000001" and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 2 Bytes   $82-$83     :=     PS/2-Tastatur + VGA-Terminal
        n_interface3CS    <= '0' when cpuAddress(7 downto 1) = "1000010" and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 2 Bytes   $84-$85     := IO3 freie RS232          ACIA2_C
        n_interface4CS    <= '0' when cpuAddress(7 downto 1) = "1000011" and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 2 Bytes   $86-$87     := IO4 ESP8266 Wifi         ACIA3_C
        n_interface5CS    <= '0' when cpuAddress(7 downto 1) = "1001000" and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 2 Bytes   $90-$91     := IO5 freie RS232          ACIA1_C

-- RD/WR for Data to/from Graphic-RAM
        n_interface6CS    <= '0' when cpuAddress(7 downto 2) = "100101"  and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 4 Bytes   $94-$97     := IO6 Block-Graphic RAM
                                                                                                                           --                   $94 := x-address
                                                                                                                           --                   $95 := y-address
                                                                                                                           --                   $96 := graphic-byte
                                                                                                                           --                   $97 := not used

-- SD-Card Interface
        n_sdCardCS        <= '0' when cpuAddress(7 downto 3) = "10001"   and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 8 Bytes   $88-$8F     := SD-Card
        n_mmuCS           <= '0' when cpuAddress(7 downto 3) = "11111"   and (n_ioWR  = '0' or n_ioRD = '0')  else '1';    -- 8 bytes   $F8-$FF     := MMU-CS

-- ext. RAM Interface
        n_externalRam1CS<= not(n_monRomCS and not physicaladdr(19));
        n_externalRam2CS<= not(n_monRomCS and physicaladdr(19));
-- ____________________________________________________________________________________
-- BUS ISOLATION GOES HERE
        cpuDataIn <=
             interface1DataOut when n_interface1CS   = '0' else -- CS for Write to PC-Terminal      (ACIA0_C)
             interface2DataOut when n_interface2CS   = '0' else -- CS for Write to PS/2-Tastatur + VGA-Terminal
             interface3DataOut when n_interface3CS   = '0' else -- CS for Write to IO3 freie RS232  (ACIA2_C)
             interface4DataOut when n_interface4CS   = '0' else -- CS for Write to IO4 ESP8266 Wifi (ACIA3_C)
             interface5DataOut when n_interface5CS   = '0' else -- CS for Write to IO5 freie RS232  (ACIA1_C)
             interface6DataOut when n_interface6CS   = '0' else -- CS for Write to Graphics RAM

             "01000010"        when n_cpuidsel       = '0' else

             sdCardDataOut     when n_sdCardCS       = '0' else
             monRomData        when n_monRomCS       = '0' else
             sramData          when n_externalRam1CS = '0' else
             sramData          when n_externalRam2CS = '0' else

             x"FF";
-- ____________________________________________________________________________________
-- SYSTEM CLOCKS GO HERE
        -- SUB-CIRCUIT CLOCK SIGNALS

      pll : entity work.PLLto50
      port map(
          inclk0  => clk25,
          c0      => clk                            --50 MHz
      );

      process (clk)
        begin
        if rising_edge(clk) then

           CPUClock <= not CPUClock;                 --50 MHz / 2 = 25Mhz CPU-Clock
           --generate the 20ms interrupt
           if intClkCount < 999999 then              -- 1,000,000 for 50 Hzfor CycloneII FPGA Board
              intClkCount <= intClkCount +1;
           else
              intClkCount <= (others=>'0');
              n_int50 <= '0';
           end if;
           if n_int50 = '0' then                           -- interrupt acknowledge
              if ( n_IORQ = '0' ) and ( n_M1 = '0' ) then
                  n_int50 <= '1';
              end if;
           end if;

        end if;
      end process;
end;
