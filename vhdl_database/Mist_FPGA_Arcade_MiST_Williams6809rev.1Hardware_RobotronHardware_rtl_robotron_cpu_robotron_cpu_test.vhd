-----------------------------------------------------------------------
--
-- Copyright 2012 ShareBrained Technology, Inc.
--
-- This file is part of robotron-fpga.
--
-- robotron-fpga is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- robotron-fpga is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General
-- Public License along with robotron-fpga. If not, see
-- <http://www.gnu.org/licenses/>.
--
-----------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
 
entity robotron_cpu_test is
end robotron_cpu_test;
 
architecture behavior of robotron_cpu_test is
 
    component robotron_cpu
        port(
            CLK             : in    std_logic;

            -- MC6809E interface
            A               : in    std_logic_vector(15 downto 0);
            D               : inout std_logic_vector(7 downto 0);
            RESET_N         : out   std_logic;
            NMI_N           : out   std_logic;
            FIRQ_N          : out   std_logic;
            IRQ_N           : out   std_logic;
            LIC             : in    std_logic;
            AVMA            : in    std_logic;
            R_W_N           : in    std_logic;
            TSC             : out   std_logic;
            HALT_N          : out   std_logic;
            BA              : in    std_logic;
            BS              : in    std_logic;
            BUSY            : in    std_logic;
            E               : out   std_logic;
            Q               : out   std_logic;
         
            -- RAM and flash memories
            MemOE           : out   std_logic;
            MemWR           : out   std_logic;

            RamAdv          : out   std_logic;
            RamCS           : out   std_logic;
            RamClk          : out   std_logic;
            RamCRE          : out   std_logic;
            RamLB           : out   std_logic;
            RamUB           : out   std_logic;
            RamWait         : in    std_logic;

            FlashRp         : out   std_logic;
            FlashCS         : out   std_logic;
            FlashStSts      : in    std_logic;

            MemAdr          : out   std_logic_vector(23 downto 1);
            MemDB           : inout std_logic_vector(15 downto 0);

            -- 7-segment display
            SEG             : out   std_logic_vector(6 downto 0);
            DP              : out   std_logic;
            AN              : out   std_logic_vector(3 downto 0);

            -- LEDs
            LED             : out   std_logic_vector(7 downto 0);

            -- Switches
            SW              : in    std_logic_vector(7 downto 0);

            -- Buttons
            BTN             : in    std_logic_vector(3 downto 0);

            -- VGA
            vgaRed          : out   std_logic_vector(2 downto 0);
            vgaGreen        : out   std_logic_vector(2 downto 0);
            vgaBlue         : out   std_logic_vector(1 downto 0);
            Hsync           : out   std_logic;
            Vsync           : out   std_logic
        );
    end component;

    constant CLK_frequency  : real := 48.0e6;
    constant CLK_period     : time := 1 sec / CLK_frequency;
    
    signal CLK          : std_logic := '0';
    
    signal A            : std_logic_vector(15 downto 0) := (others => '0');
    signal D            : std_logic_vector(7 downto 0);
    signal RESET_N      : std_logic := '1';
    signal NMI_N        : std_logic := '1';
    signal FIRQ_N       : std_logic := '1';
    signal IRQ_N        : std_logic := '1';
    signal LIC          : std_logic := '0';
    signal AVMA         : std_logic := '0';
    signal R_W_N        : std_logic := '0';
    signal TSC          : std_logic := '0';
    signal HALT_N       : std_logic := '1';
    signal BA           : std_logic := '0';
    signal BS           : std_logic := '0';
    signal BUSY         : std_logic := '0';
    signal E            : std_logic := '0';
    signal Q            : std_logic := '0';

    signal MemOE        : std_logic;
    signal MemWR        : std_logic;

    signal RamAdv       : std_logic;
    signal RamCS        : std_logic;
    signal RamClk       : std_logic;
    signal RamCRE       : std_logic;
    signal RamLB        : std_logic;
    signal RamUB        : std_logic;
    signal RamWait      : std_logic;

    signal FlashRp      : std_logic;
    signal FlashCS      : std_logic;
    signal FlashStSts   : std_logic;
    
    signal MemAdr       : std_logic_vector(23 downto 1);
    signal MemDB        : std_logic_vector(15 downto 0);

    signal SEG          : std_logic_vector(6 downto 0);
    signal DP           : std_logic;
    signal AN           : std_logic_vector(3 downto 0);
    
    signal LED          : std_logic_vector(7 downto 0);
    
    signal SW           : std_logic_vector(7 downto 0) := (others => '0');
    
    signal BTN          : std_logic_vector(3 downto 0) := (others => '0');

    signal vgaRed       : std_logic_vector(2 downto 0);
    signal vgaGreen     : std_logic_vector(2 downto 0);
    signal vgaBlue      : std_logic_vector(1 downto 0);
    signal Hsync        : std_logic;
    signal Vsync        : std_logic;
    
    -------------------------------------------------------------------
    
    signal bus_address  : std_logic_vector(15 downto 0) := (others => '1');
    signal bus_read     : std_logic := '1';
    signal bus_data     : std_logic_vector(7 downto 0) := (others => 'Z');
    signal bus_available: std_logic := 'Z';
    signal bus_status   : std_logic := 'Z';
    
begin

    uut: robotron_cpu PORT MAP (
        CLK => CLK,
        A => A,
        D => D,
        RESET_N => RESET_N,
        NMI_N => NMI_N,
        FIRQ_N => FIRQ_N,
        IRQ_N => IRQ_N,
        LIC => LIC,
        AVMA => AVMA,
        R_W_N => R_W_N,
        TSC => TSC,
        HALT_N => HALT_N,
        BA => BA,
        BS => BS,
        BUSY => BUSY,
        E => E,
        Q => Q,
        MemOE => MemOE,
        MemWR => MemWR,
        RamAdv => RamAdv,
        RamCS => RamCS,
        RamClk => RamClk,
        RamCRE => RamCRE,
        RamLB => RamLB,
        RamUB => RamUB,
        RamWait => RamWait,
        FlashRp => FlashRp,
        FlashCS => FlashCS,
        FlashStSts => FlashStSts,
        MemAdr => MemAdr,
        MemDB => MemDB,
        SEG => SEG,
        DP => DP,
        AN => AN,
        LED => LED,
        SW => SW,
        BTN => BTN,
        vgaRed => vgaRed,
        vgaGreen => vgaGreen,
        vgaBlue => vgaBlue,
        Hsync => Hsync,
        Vsync => Vsync
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    bus_process: process
    begin
        wait until falling_edge(E);
        
        -- E=0 + 0 ns
        wait for 20 ns;
        R_W_N <= 'U';
        A <= (others => 'U');
        BA <= 'U';
        BS <= 'U';
        
        -- E=0 + 20 ns
        wait for 10 ns;
        D <= (others => 'Z');

        -- E=0 + 30 ns
        wait for 170 ns;

        if bus_available = '0' then
            R_W_N <= bus_read;
            A <= bus_address;
        else
            R_W_N <= 'Z';
            A <= (others => 'Z');
        end if;

        BA <= bus_available;
        BS <= bus_status;
        
        -- E=0 + 200 ns
        wait until rising_edge(Q);
        
        -- Q=1
        wait for 200 ns;
        
        -- Q=1 + 200 ns
        if bus_available = '0' then
            if bus_read = '0' then
                D <= bus_data;
            end if;
        end if;
    end process;
    
    stim_proc: process
    begin		
        BTN(0) <= '1';
        wait for 100 ns;
        BTN(0) <= '0';
        
        wait until rising_edge(RESET_N);
        
        wait until falling_edge(E);
        bus_available <= '0';
        bus_status <= '0';
        
        bus_address <= X"FFFE";
        bus_read <= '1';
        bus_data <= (others => 'Z');
        
        wait until falling_edge(E);
        bus_address <= X"9000";
        bus_read <= '1';
        bus_data <= (others => 'Z');
        
        wait until falling_edge(E);
        bus_address <= X"0000";
        bus_read <= '0';
        bus_data <= X"69";
        
        -- Turn on ROM PIA CA2
        wait until falling_edge(E);
        bus_address <= X"C80D";
        bus_read <= '0';
        bus_data <= X"3C";

        -- IDLE
        wait until falling_edge(E);
        bus_address <= (others => 'Z');
        bus_read <= '1';
        bus_data <= (others => 'Z');
        
        -- Turn off ROM PIA CA2
        wait until falling_edge(E);
        bus_address <= X"C80D";
        bus_read <= '0';
        bus_data <= X"34";

        -- Write BLT
        wait until falling_edge(E);
        bus_address <= X"CA02";
        bus_read <= '0';
        bus_data <= X"D0";

        wait until falling_edge(E);
        bus_address <= X"CA03";
        bus_read <= '0';
        bus_data <= X"00";

        wait until falling_edge(E);
        bus_address <= X"CA04";
        bus_read <= '0';
        bus_data <= X"33";

        wait until falling_edge(E);
        bus_address <= X"CA05";
        bus_read <= '0';
        bus_data <= X"44";

        wait until falling_edge(E);
        bus_address <= X"CA06";
        bus_read <= '0';
        bus_data <= X"00";

        wait until falling_edge(E);
        bus_address <= X"CA07";
        bus_read <= '0';
        bus_data <= X"00";

        wait until falling_edge(E);
        bus_address <= X"CA00";
        bus_read <= '0';
        bus_data <= X"01";

        -- IDLE
        wait until falling_edge(E);
        bus_address <= (others => 'Z');
        bus_read <= '1';
        bus_data <= (others => 'Z');

        -- HALT should assert from BLT.
        wait until falling_edge(E);
        wait until falling_edge(E);
        
        wait until falling_edge(E);
        -- Release bus to BLT.
        bus_status <= '1';
        bus_available <= '1';
        
        -- HALT should deassert from BLT.
        wait until falling_edge(E);
        wait until falling_edge(E);
        wait until falling_edge(E);

        wait;
    end process;

end;
