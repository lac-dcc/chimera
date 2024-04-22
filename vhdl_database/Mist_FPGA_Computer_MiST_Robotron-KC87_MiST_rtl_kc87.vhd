-- Copyright (c) 2015, $ME
-- All rights reserved.
--
-- Redistribution and use in source and synthezised forms, with or without modification, are permitted 
-- provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
--    and the following disclaimer.
--
-- 2. Redistributions in synthezised form must reproduce the above copyright notice, this list of conditions
--    and the following disclaimer in the documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR 
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- KC87 Toplevel
--

library IEEE;
use IEEE.std_logic_1164.all;

entity kc87 is
    port(
        vgaclock    : in std_logic;--40
        clk    	  : in std_logic;--50
		  ResetKey    : in  std_logic;
        VGA_R       : out std_logic_vector(3 downto 0);
        VGA_G       : out std_logic_vector(3 downto 0);
        VGA_B       : out std_logic_vector(3 downto 0);
        VGA_HS      : out std_logic;
        VGA_VS      : out std_logic;    
        PS2_CLK     : inout std_logic;
        PS2_DAT     : inout std_logic;   
        UART_TXD    : out std_logic;
        UART_RXD    : in std_logic;
        
--      Reset_n     : in std_logic;
--      clk         : in std_logic;
--      nmi_n           : in std_logic;

        SD_DAT      : in std_logic;
        SD_DAT3     : out std_logic;
        SD_CMD      : out std_logic;
        SD_CLK      : out std_logic
    );
end kc87;

architecture struct of kc87 is
    signal int_n        : std_logic;
    signal busrq_n      : std_logic;

    signal m1_n         : std_logic;
    signal mreq_n       : std_logic;
    signal iorq_n       : std_logic;
    signal rd_n         : std_logic;
    signal wr_n         : std_logic;

    signal halt_n       : std_logic;
    signal wait_n       : std_logic;
    signal busak_n      : std_logic;
    
    signal cpu_addr     : std_logic_vector(15 downto 0);
    signal cpu_do       : std_logic_vector(7 downto 0);
    signal cpu_di       : std_logic_vector(7 downto 0);
    signal bootRom_d    : std_logic_vector(7 downto 0);
    signal monitorRom_d : std_logic_vector(7 downto 0);
    signal osRom_d      : std_logic_vector(7 downto 0);
	 signal ram_di       : std_logic_vector(7 downto 0);
    signal ram_do       : std_logic_vector(7 downto 0);
    signal vram_d       : std_logic_vector(7 downto 0);
    signal cram_d       : std_logic_vector(7 downto 0);
    signal uart_d       : std_logic_vector(7 downto 0);
    signal sdcard_d     : std_logic_vector(7 downto 0);

    signal ctc_d        : std_logic_vector(7 downto 0); 
    signal pio1_d       : std_logic_vector(7 downto 0);
    signal pio2_d       : std_logic_vector(7 downto 0);
    
    signal sysctl_d     : std_logic_vector(7 downto 0);
    
--    signal mirrorOS    : std_logic;
    
    signal ram_cs_n     : std_logic;
    signal vram_cs_n    : std_logic;
    signal cram_cs_n    : std_logic;
    signal ctc_cs_n     : std_logic;
    signal uart_cs_n    : std_logic;
--    signal monRom_cs_n  : std_logic;
--    signal osRom_cs_n   : std_logic;
    signal bootRom_cs_n : std_logic;
    signal sysctl_cs_n  : std_logic;
    signal sdcard_cs_n  : std_logic;
    
--    signal vgaclock     : std_logic;
    signal vgaramaddr   : std_logic_vector(9 downto 0);
    signal vgacoldata   : std_logic_vector(7 downto 0);
    signal vgachardata  : std_logic_vector(7 downto 0);
    
    signal reset_n      : std_logic;
    signal resetInt      : std_logic;
--    signal clk          : std_logic;
    signal nmi_n        : std_logic;
    
    signal pio1_cs_n    : std_logic;
    signal pio2_cs_n    : std_logic;
    
    signal pio1_aIn     : std_logic_vector(7 downto 0);
    signal pio1_aOut    : std_logic_vector(7 downto 0);
    signal pio1_aRdy    : std_logic;
    signal pio1_aStb    : std_logic;
        
    signal pio1_bIn     : std_logic_vector(7 downto 0);
    signal pio1_bOut    : std_logic_vector(7 downto 0);
    signal pio1_bRdy    : std_logic;
    signal pio1_bStb    : std_logic;
    
    signal pio2_aIn     : std_logic_vector(7 downto 0);
    signal pio2_aOut    : std_logic_vector(7 downto 0);
    signal pio2_aRdy    : std_logic;
    signal pio2_aStb    : std_logic;
        
    signal pio2_bIn     : std_logic_vector(7 downto 0);
    signal pio2_bOut    : std_logic_vector(7 downto 0);
    signal pio2_bRdy    : std_logic;
    signal pio2_bStb    : std_logic;
    
    signal iei          : std_logic_vector(2 downto 0);
    signal ieo          : std_logic_vector(2 downto 0);
    signal int          : std_logic_vector(2 downto 0) := (others => '1');
    
    signal intAckCTC    : std_logic;
    signal intAckPio1   : std_logic;
    signal intAckPio2   : std_logic;
        
    signal ctcTcTo      : std_logic_vector(3 downto 0);
    signal ctcClkTrg    : std_logic_vector(3 downto 0);
    
    signal ledbuff      : std_logic_vector(7 downto 0);
    signal leddelay     : integer range 0 to 400000;
    
    signal kmatrixXout  : std_logic_vector(7 downto 0);
    signal kmatrixXin   : std_logic_vector(7 downto 0);
    signal kmatrixYout  : std_logic_vector(7 downto 0);
    signal kmatrixYin   : std_logic_vector(7 downto 0);
    
    signal clkDiv       : integer range 0 to 50000000 := 0;
    signal clkEn        : std_logic := '0';
    signal clkSlowdown  : std_logic := '0';
    
    signal ioSel        : boolean;
    signal memSel       : boolean;
    
    signal kcSysClk     : std_logic;

    signal ledDisplay   : std_logic_vector(15 downto 0);
    signal intAddr      : std_logic_vector(15 downto 0);
    signal testAddr1    : std_logic_vector(15 downto 0);
    signal testAddr2    : std_logic_vector(15 downto 0);
    signal testAddr3    : std_logic_vector(15 downto 0);
    
    signal intAckPeriph : std_logic_vector(7 downto 0);
    signal intPeriph    : std_logic_vector(7 downto 0);
    
    signal RETI_n       : std_logic;
    signal IntE         : std_logic;
    signal lastIntE     : std_logic;
--    signal lastM1Addr   : std_logic_vector(15 downto 0);

    signal int_SD_DAT3 : std_logic;
    signal int_SD_CLK  : std_logic;
    signal int_SD_CMD  : std_logic; 
begin

    
    SD_DAT3 <= int_SD_DAT3;
    SD_CLK  <= int_SD_CLK;
    SD_CMD  <= int_SD_CMD; 
    
    wait_n <= '1';
    busrq_n <= '1';
    nmi_n <= '1';

 
    -- interrupt-vektoren und letzten angesprungenen interrupt merken
    process
    begin
        wait until rising_edge(clk);
        if m1_n='0' and rd_n = '0' and ram_cs_n = '0' then
            lastIntE <= intE;
--            lastM1Addr <= cpu_addr;
            if (lastIntE='1' and intE='0') then
                intAddr <= cpu_addr;
            end if;
        end if;
        
        ledbuff <= intPeriph or ledbuff;
        
        if (leddelay=400000) then
            ledbuff <= "00000000";
            leddelay <= 0;
        else
            leddelay <= leddelay + 1;
        end if;
    end process;
    
    -- reset-logik
    process (reset_n, clk, ResetKey)
    begin
        if reset_n = '0' or ResetKey='0' then
            resetInt <= '0';
--            mirrorOS <= '1';
        elsif rising_edge(clk) then
            resetInt <= '1';
            if cpu_addr(15) = '1' then
--                mirrorOS <= '0';
            end if;
        end if;
    end process;
    
    memSel   <= mreq_n = '0';
    
    -- diverse cs signale
--    monRom_cs_n <= '0' when (cpu_addr(15 downto 10) = "100000") and memSel else '1';
--    ram_cs_n   <= cpu_addr(15) or mreq_n;
    ram_cs_n   <= mreq_n;
    cram_cs_n  <= '0' when (cpu_addr(15 downto 10) = "111010") and memSel else '1';
    vram_cs_n  <= '0' when (cpu_addr(15 downto 10) = "111011") and memSel else '1';
--    osRom_cs_n <= '0' when (cpu_addr(15 downto 12) = "1111" and memSel) else '1';
    bootRom_cs_n <= '0' when (sysctl_d(0)='0' and cpu_addr(15 downto 14)="00" and memSel) else '1';
    
    ioSel    <= iorq_n = '0' and m1_n='1';

    intAckCTC  <= '0' when intAckPeriph(3 downto 0)="0000" else '1';
    intAckPio1 <= '0' when intAckPeriph(5 downto 4)="00" else '1';
    intAckPio2 <= '0' when intAckPeriph(7 downto 6)="00" else '1';
    
    uart_cs_n   <= '0' when cpu_addr(7 downto 1) = "0000000" and ioSel else '1';
    sysctl_cs_n <= '0' when cpu_addr(7 downto 0) = "00000010" and ioSel else '1';
    ctc_cs_n    <= '0' when cpu_addr(7 downto 3) = "10000"  and ioSel else '1';
    pio1_cs_n   <= '0' when cpu_addr(7 downto 3) = "10001"  and ioSel else '1';
    pio2_cs_n   <= '0' when cpu_addr(7 downto 3) = "10010"  and ioSel else '1';
    sdcard_cs_n <= '0' when cpu_addr(7 downto 2) = "000001" and ioSel else '1';
    
    -- cpu data-in multiplexer
    cpu_di <=
--        "00000000"  when mirrorOS='1' else
--        osRom_d    when osRom_cs_n='0' else
--        monitorRom_d when monRom_cs_n = '0' else
        ctc_d       when (ctc_cs_n = '0'  or intAckCTC='1') else
        pio1_d      when (pio1_cs_n = '0' or intAckPio1='1') else
        pio2_d      when (pio2_cs_n = '0' or intAckPio2='1') else
        uart_d      when uart_cs_n='0' else
        sdcard_d    when sdcard_cs_n='0' else
        bootRom_d   when bootRom_cs_n='0' else
        sysctl_d    when (sysctl_cs_n = '0') else
        cram_d      when cram_cs_n = '0' else
        vram_d      when vram_cs_n = '0' else
--        osRom_d;
        ram_do;
    
--    process 
--    begin
--        wait until rising_edge(clk);
--        
--        clkSlowdown <= SW(0);
--        clkEn <= '0';
--        if (clkDiv=1 or clkSlowdown='1') then
--            clkDiv <= 0;
--             clkEn <= KEY(1);
--        else
--            clkDiv <= clkDiv + 1;
--        end if;
--    end process;
    
    -- teh cpu
    cpu : entity work.T80se
        generic map(Mode => 0, T2Write => 1, IOWait => 0)
        port map(
            RESET_n => resetInt,
            CLK_n   => clk,
            CLKEN   => kcSysClk or sysctl_d(1),
            WAIT_n  => wait_n,
            INT_n   => int_n,
            NMI_n   => nmi_n,
            BUSRQ_n => busrq_n,
            M1_n    => m1_n,
            MREQ_n  => mreq_n,
            IORQ_n  => iorq_n,
            RD_n    => rd_n,
            WR_n    => wr_n,
            RFSH_n  => open,
            HALT_n  => halt_n,
            BUSAK_n => busak_n,
            A       => cpu_addr,
            DI      => cpu_di,
            DO      => cpu_do,
            RETI_n  => RETI_n,
            IntE    => IntE
        );
 --!!! Check active Lows   
    -- interupt controller
    intController : entity work.intController
    port map (
        clk         => clk,
        res       => resetInt,--N
        int       => int_n,--N
        intPeriph   => intPeriph,
        intAck      => intAckPeriph,
        cpuDIn      => cpu_di,
        m1        => m1_n,--N
        iorq      => iorq_n,--N
        rd        => rd_n,--N
        RETI_n      => RETI_n
    );
    
    -- ctc
    ctc : entity work.ctc
--        generic map(
--            sysclk => 125000
--        )
        port map (
            clk     => clk,
            res_n   => resetInt,
            en      => ctc_cs_n,
            
            dIn     => cpu_do,
            dOut    => ctc_d,
            
            cs      => cpu_addr(1 downto 0),
            m1_n    => m1_n,
            iorq_n  => iorq_n,
            rd_n    => rd_n,
            
            int     => intPeriph(3 downto 0),
            intAck  => intAckPeriph(3 downto 0),
            clk_trg => ctcClkTrg,
            zc_to   => ctcTcTo,
            kcSysClk => kcSysClk
        );
    
    -- ctc-aus und eingÃ¤nge verdrahten
    ctcClkTrg(2 downto 0) <= (others => '0');
    ctcClkTrg(3) <= ctcTcTo(2);
    
    -- System PIO
    pio1 : entity work.pio
        port map (
            clk   => clk,
            res_n => resetInt,
            en    => '1',
            dIn   => cpu_do,
            dOut  => pio1_d,
            baSel => cpu_addr(0),
            cdSel => cpu_addr(1),
            cs_n  => pio1_cs_n,
            m1_n  => m1_n,
            iorq_n => iorq_n,
            rd_n  => rd_n,
            intAck => intAckPeriph(5 downto 4),
            int   => intPeriph(5 downto 4),
            aIn   => pio1_aIn,
            aOut  => pio1_aOut,
            aRdy  => pio1_aRdy,
            aStb  => pio1_aStb,
            bIn   => pio1_bIn,
            bOut  => pio1_bOut,
            bRdy  => pio1_bRdy,
            bStb  => '1'
        );
        
    pio1_aStb <= '1';
    
    pio1_aIn <= (others => '1');
    pio1_bIn <= (others => '1');
    
    -- Keyboard PIO
    pio2 : entity work.pio
        port map (
            clk   => clk,
            res_n => resetInt,
            en    => '1',
            dIn   => cpu_do,
            dOut  => pio2_d,
            baSel => cpu_addr(0),
            cdSel => cpu_addr(1),
            cs_n  => pio2_cs_n,
            m1_n  => m1_n,
            iorq_n => iorq_n,
            rd_n  => rd_n,
            intAck => intAckPeriph(7 downto 6),
            int   => intPeriph(7 downto 6),
            aIn   => kmatrixXout,
            aOut  => kmatrixXin,
            aRdy  => pio2_aRdy,
            aStb  => '1',
            bIn   => kmatrixYout,
            bOut  => kmatrixYin,
            bRdy  => pio2_bRdy,
            bStb  => '1'
        );

    -- Syscontrol port:
    -- 0: 0 Bootrom einblenden
    -- 0: 1 Bootrom aus
    -- 1: 0 Turbo aus
    -- 1: 1 Turbo an
    -- 2: 0 Schreibschutz Ram ab 8000 aus
    -- 2: 1 Schreibschutz Ram ab 8000 an
    syscontrol : entity work.pport
        port map (
            clk   => clk,
            
            ce_n  => sysctl_cs_n, 
            wr_n  => wr_n,
            res_n => resetInt,
            
            dIn   => cpu_do,
            
            pOut  => sysctl_d
        );
		  
	 ram : entity work.mram		
        port map (
				clock   => clk,
				address   => cpu_addr(14 downto 0),
				data   => cpu_do,
				wren   => not (wr_n or ram_cs_n or (sysctl_d(2) and cpu_addr(15)) or (sysctl_d(2) and cpu_addr(15))),
				rden   => not(rd_n and ram_cs_n),
				q   => ram_do
				);
				
		  
		  
    -- sram signale
--    ram_d <= SRAM_DQ(7 downto 0);
            
--    SRAM_ADDR(15 downto 0) <= cpu_addr(15 downto 0);
--    SRAM_CE_N <= '0';

--    SRAM_OE_N <= rd_n or ram_cs_n;
--    SRAM_WE_N <= wr_n or ram_cs_n or (sysctl_d(2) and cpu_addr(15)) or (sysctl_d(2) and cpu_addr(15)); -- wp fuer oberen ram wenn sysctl_d(2)

      
 --   process -- DQ einen halben takt verzÃ¶gern (ansonsten SRAM-Timingproblem wegen zu kurzem WR)
 --   begin
 --     wait until falling_edge(clk);
      
 --     if (wr_n='0' and ram_cs_n='0') then
 --       SRAM_DQ(7 downto 0)  <= cpu_do;
 --     else
 --       SRAM_DQ <= (others => 'Z');
--      end if;
--    end process;

    -- video blockram
    vram : entity work.dualsram
    generic map (
        AddrWidth => 10
    )
    port map (
        clk1  => clk,
        addr1 => cpu_addr(9 downto 0),
        din1  => cpu_do,
        dout1 => vram_d,
        ce1_n => vram_cs_n, 
        we1_n => wr_n,
         
        clk2  => vgaclock,
        addr2 => vgaramaddr,
        din2  => "00000000",
        dout2 => vgachardata,
        ce2_n => '0',
        we2_n => '1'
    );
    
    -- color-video blockram
    cram : entity work.dualsram
    generic map (
        AddrWidth => 10
    )
    port map (
        clk1  => clk,
        addr1 => cpu_addr(9 downto 0),
        din1  => cpu_do,
        dout1 => cram_d,
        ce1_n => cram_cs_n, 
        we1_n => wr_n,
         
        clk2  => vgaclock,
        addr2 => vgaramaddr,
        din2  => "00000000",
        dout2 => vgacoldata,
        ce2_n => '0',
        we2_n => '1'
    );
    
--    bootrom : entity work.bootrom
--            port map (
--                clk => clk,
--                addr => cpu_addr(13 downto 0),
--                data => bootRom_d
--    );
    
    -- startrom
    monitor : entity work.monitor
    port map (
        clk => clk,
        addr => cpu_addr(13 downto 0),
        data => bootRom_d
    );
    
    -- vga-comtroller
    video : entity work.video
    port map (
        clk    => vgaclock,
        red    => VGA_R,
        green  => VGA_G,
        blue   => VGA_B,
        hsync  => VGA_HS,
        vsync  => VGA_VS,
        
        ramAddr => vgaramaddr,
        colData => vgacoldata,
        charData => vgachardata,
        scanLine => '1'
    );
    
    -- ps/2 interface
    ps2kc : entity work.ps2kc
    port map (
        clk     => clk,
        res     => '1',--resetInt,
        ps2clk  => PS2_CLK,
        ps2data => PS2_DAT,
        data    => open,
        ps2code => open,
        ps2rcvd => open,
        matrixXout => kmatrixXout,
        matrixXin  => kmatrixXin,
        matrixYout => kmatrixYout,
        matrixYin  => kmatrixYin
    );
    
    -- uart
    uart : entity work.uart
--    generic map (
--        sysclk => 12500000
--    )
    port map (
        clk  => clk,
        
        cs_n => uart_cs_n,
        rd_n => rd_n,
        wr_n => wr_n,

        addr => cpu_addr(0 downto 0),
        
        dIn  => cpu_do,
        dOut => UART_D,

        txd  => UART_TXD,
        rxd  => UART_RXD
    );
    
    -- sdcard interface
 --   sdcard : entity work.spi
--   port map (
 --       clk  => clk,
        
--        cs_n => sdcard_cs_n,
--        wr_n => wr_n,
--        addr => cpu_addr(1 downto 0),
        
--        dIn  => cpu_do,
--        dOut => sdcard_d,
        
--        spi_cs   => int_SD_DAT3,
--        spi_clk  => int_SD_CLK,
--        spi_miso => SD_DAT,
--        spi_mosi => int_SD_CMD
--    );
    
end;