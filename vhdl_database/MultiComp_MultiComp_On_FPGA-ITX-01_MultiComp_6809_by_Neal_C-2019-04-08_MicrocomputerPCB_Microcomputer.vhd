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
-- Neal Crook's modifications to Grant's original design
-- In summary:
-- * Deploy 6809 modified to use async active-low reset, posedge clock
-- * Clock 6809 from master (50MHz) clock and control execution rate by
--   asserting HOLD
-- * Speed up clock cycle when no external access (VMA=0)
-- * Generate external SRAM control signals synchronously rather than with
--   gated clock
-- * Deploy VDU design modified to fix scroll bug and changed to run only on
--   posedge clock (submitted to Grant but not yet published by him)
-- * Deploy SDcard design modified to run on posedge clock and to support
--   SDHC as wall as SDSC.
-- * Replace BASIC ROM with ROM for CamelForth
-- * Add 2nd serial port ($FFD4-$FFD5)
-- * Reset baud rate generator and generate enable rather than async
--   clock. Associated changes to UART. Change UART to use posedge of clk.
-- * Add GPIO unit
--   For detailed description and programming details, refer to the
--   detailed comments in the header of gpio.vhd)
-- * Add mk2 memory mapper unit that is a functional super-set of the COCO
--   design. Has the following capabilities:
--   * Can address upto 1024KByte (2 512KByte SRAM chips)
--   * Can page any 8Kbyte SRAM region into any 8KByte region of processor
--     address space
--   * Can write-protect any region
--   * Can enable/disable ROM in the top 8Kbyte region
--   * Includes a 50Hz timer interrupt with efficient register interface
--   * Includes a NMI generator for code single-step
--   For detailed description and programming details, refer to the
--   detailed comments in the header of mem_mapper2.vhd)
-- * PIN_E4 is output: SD DRIVE LED
-- * N/C is output LED (unused)
-- * N/C is output LED (unused.. echoes back the state of input
-- * vduffd0 (PIN_B22) is input, switches I/O assignment: J3:1-2
--   OFF: PS2/VGA is UART0 at address $FFD0-$FFD1, SERIALA is UART1 at $FFD2-$FFD3
--   ON : PS2/VGA is UART0 at address $FFD2-$FFD3, SERIALA is UART1 at $FFD0-$FFD1
--
-- I/O - ; most pins assigned for GPIO unit on J1 connector
-- Refer to Microcomputer.qsf for GPIO (and any other) pinout details.
-- VGA - connected and used as 1st (primary) I/O device: 80x25 colour video
-- MONO - connected.
-- SD1 - connected.
-- PROTO - not connected
-- TOUCH - not connected
-- KBD - connected
-- SERIAL A - connected and used as 2nd I/O device
-- SERIAL B - connected and used as 3rd I/O device
-- MEMORY 512K - connected. Accessible through memory paging unit.
--
-- Note on confusing name: In the directory ROMS/6809 there is a file
-- named 6809M.HEX and a file named CAMELFORTH_2KRAM.hex. The first contains
-- the 8K ROM image with absolute addresses in the HEX address field records
-- (suitable for use with the emulator), the second contains the 8K ROM image
-- with relative addresses in the HEX address fields (suitable for use in the
-- FPGA build flow). The "2KRAM" in the name indicates that the image was
-- build to work with 2K of RAM. Actually, the design has a full 64K of RAM
-- available. Just don't worry about it. I chose a lousy name.

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	-- need this set to 0 normally, so that there are enough resources for
	-- 80-column VDU. Set to 1 for minimal system, AND change the generics
	-- for the SBCTextDisplayRGB entity below.
	--    generic( constant INTERNAL_RAM : integer := 0
--             );
	port(
		n_reset			: in std_logic;
		clk				: in std_logic;

		-- LEDs on base FPGA board and duplicated on James Moxham's PCB.
		-- Set LOW to illuminate. 3rd LED is "driveLED" output.
--		n_LED7			: out std_logic := '1';
--		n_LED9			: out std_logic := '1';

		-- Internal pull-up so this defaults to 1. When pulled to gnd
		-- this swaps the address decodes so that the Serial A port is
		-- decoded at $FFD0 and the VDU at $FFD2.
		vduffd0			: in std_logic;

		sramData			: inout std_logic_vector(7 downto 0);
		sramAddress		: out std_logic_vector(19 downto 0); -- 19:0 -> 1MByte
		n_sRamWE			: out std_logic;
		n_sRamCS			: out std_logic;                     -- lower blocks
		n_sRamOE			: out std_logic;

		-- Not using the SD RAM but making sure that it's not active
		n_sdRamCas		: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas		: out std_logic := '1';		-- RAS
		n_sdRamWe		: out std_logic := '1';		-- SDWE
		n_sdRamCe		: out std_logic := '1';		-- SD_NCS0
		sdRamClk			: out std_logic := '1';		-- SDCLK0
		sdRamClkEn		: out std_logic := '1';		-- SDCKE0
		sdRamAddr		: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData		: in std_logic_vector(15 downto 0);

		rxd1				: in std_logic;
		txd1				: out std_logic;
		rts1				: out std_logic;
		cts1				: in std_logic;

		videoR0			: out std_logic;
		videoR1			: out std_logic;
		videoR2			: out std_logic;
		videoG0			: out std_logic;
		videoG1			: out std_logic;
		videoG2			: out std_logic;
		videoB0			: out std_logic;
		videoB1			: out std_logic;
		hSync				: out std_logic;
		vSync				: out std_logic;

		ps2Clk			: inout std_logic;
		ps2Data			: inout std_logic;

		-- 3 GPIO mapped to "group A" connector. Pin 1..3 of that connector
		-- assigned to bit 0..2 of gpio0.
		-- Intended for connection to DS1302 RTC as follows:
		-- bit 2: CE
		-- bit 1: SCLK
		-- bit 0: I/O (Data)
--		gpio0				: inout std_logic_vector(2 downto 0);
		-- 8 GPIO mapped to "group B" connector. Pin 1..8 of that connector
		-- assigned to bit 0..7 of gpio2.
--		gpio2				: inout std_logic_vector(7 downto 0);

		sdCS				: out std_logic;
		sdMOSI			: out std_logic;
		sdMISO			: in std_logic;
		sdSCLK			: out std_logic;
		-- despite its name this needs to be LOW to illuminate the LED.
		driveLED			: out std_logic :='1'
		);
end Microcomputer;

architecture struct of Microcomputer is

    signal n_WR                   : std_logic;
    signal n_RD                   : std_logic;
    signal n_cpuWr                : std_logic;
    signal hold                   : std_logic;
    signal vma                    : std_logic;
    signal state                  : std_logic_vector(2 downto 0);
    signal cpuAddress             : std_logic_vector(15 downto 0);
    signal cpuDataOut             : std_logic_vector(7 downto 0);
    signal cpuDataIn              : std_logic_vector(7 downto 0);
    signal sramAddress_i          : std_logic_vector(19 downto 0);
--    signal n_sRamCSHi_i           : std_logic;
    signal n_sRamCSLo_i           : std_logic;

    signal basRomData             : std_logic_vector(7 downto 0);
    -- internalRam declarations are only used when internal RAM is configured
    signal internalRam1DataOut    : std_logic_vector(7 downto 0);
    signal interface1DataOut      : std_logic_vector(7 downto 0);
    signal interface2DataOut      : std_logic_vector(7 downto 0);
    signal gpioDataOut            : std_logic_vector(7 downto 0);
    signal sdCardDataOut          : std_logic_vector(7 downto 0);
    signal mmDataOut              : std_logic_vector(7 downto 0);

    signal irq                    : std_logic;
    signal nmi                    : std_logic;
    signal n_int1                 : std_logic :='1';
    signal n_int2                 : std_logic :='1';
    signal n_int3                 : std_logic :='1';
    signal n_tint                 : std_logic;

    signal n_internalRam1CS       : std_logic :='1';
    signal n_basRomCS             : std_logic :='1';
    signal n_interface1CS         : std_logic :='1';
    signal n_interface2CS         : std_logic :='1';
    signal n_sdCardCS             : std_logic :='1';
    signal n_gpioCS               : std_logic :='1';

    signal serialClkCount         : std_logic_vector(15 downto 0) := x"0000";
    signal serialClkCount_d       : std_logic_vector(15 downto 0);
    signal serialClkEn            : std_logic;

    signal n_WR_uart              : std_logic := '1';
    signal n_RD_uart              : std_logic := '1';

    signal n_WR_sd                : std_logic := '1';
    signal n_RD_sd                : std_logic := '1';

    signal n_WR_gpio              : std_logic := '1';

    signal n_WR_vdu               : std_logic := '1';
    signal n_RD_vdu               : std_logic := '1';

    signal romInhib               : std_logic := '0';
    signal ramWrInhib             : std_logic := '0';

    signal gpio_dat0_i            : std_logic_vector(2 downto 0);
    signal gpio_dat0_o            : std_logic_vector(2 downto 0);
    signal n_gpio_dat0_oe         : std_logic_vector(2 downto 0);

    signal gpio_dat2_i            : std_logic_vector(7 downto 0);
    signal gpio_dat2_o            : std_logic_vector(7 downto 0);
    signal n_gpio_dat2_oe         : std_logic_vector(7 downto 0);
	 
	 signal W_videoR0					 : std_logic;
	 signal W_videoR1					 : std_logic;

	 signal W_videoG0					 : std_logic;
	 signal W_videoG1					 : std_logic;

	 signal W_videoB0					 : std_logic;
	 signal W_videoB1					 : std_logic;

begin
-- test: echo jumper input to LED
    --n_LED9 <= vduffd0;

-- ____________________________________________________________________________________
-- CPU CHOICE GOES HERE

    irq <= not(n_tint and n_int1 and n_int2);

    cpu1 : entity work.cpu09p
    port map(
            clk => clk,
            rst_n => n_reset,
            rw => n_cpuWr,
            vma => vma,
            addr => cpuAddress,
            data_in => cpuDataIn,
            data_out => cpuDataOut,
            halt => '0',
            hold => hold,
            irq => irq,
            firq => '0',
            nmi => nmi);
-- ____________________________________________________________________________________
-- ROM GOES HERE
    rom1 : entity work.M6809_CAMELFORTH_ROM -- 8KB FORTH
    port map(
            address => cpuAddress(12 downto 0),
            clock => clk,
            q => basRomData);
-- ____________________________________________________________________________________
-- RAM GOES HERE

-- Assign to pins. Set the address width to match external RAM/pin assignments
--    sramAddress(19 downto 0) <= '0'&sramAddress_i(18 downto 0);	-- Uses 512KB
    sramAddress(19 downto 0) <= sramAddress_i(19 downto 0);	-- Uses 1mB
    n_sRamCS  <= n_sRamCSLo_i;

-- External RAM - high-order address lines come from the mem_mapper
    sramAddress_i(12 downto 0) <= cpuAddress(12 downto 0);
    sramData <= cpuDataOut when n_WR='0' else (others => 'Z');
	 
-- ____________________________________________________________________________________
-- INPUT/OUTPUT DEVICES GO HERE

    n_WR_vdu <= n_interface1CS or n_WR;
    n_RD_vdu <= n_interface1CS or n_RD;
	 
	 VideoR0 <= W_videoR0;
	 VideoR1 <= W_videoR0;
	 VideoR2 <= W_videoR1;

	 VideoG0 <= W_videoG0;
	 VideoG1 <= W_videoG0;
	 VideoG2 <= W_videoG1;

	 VideoB0 <= W_videoB0;
	 VideoB1 <= W_videoB1;

    io1 : entity work.SBCTextDisplayRGB

    generic map(
      -- Select one or other (NOT BOTH!) sets

      -- 80x25 uses all the internal RAM
      DISPLAY_TOP_SCANLINE => 35,
      VERT_SCANLINES => 448,
      V_SYNC_ACTIVE => '1'

      -- 40x25 leaves resource for internal 2k RAM

--      HORIZ_CHARS => 40,
--      CLOCKS_PER_PIXEL => 4
    )

    port map (
            n_reset => n_reset,
            clk => clk,

            -- RGB video signals
            hSync => hSync,
            vSync => vSync,
            videoR0 => W_videoR0,
            videoR1 => W_videoR1,
            videoG0 => W_videoG0,
            videoG1 => W_videoG1,
            videoB0 => W_videoB0,
            videoB1 => W_videoB1,

            -- Monochrome video signals (when using TV timings only)
--            sync => videoSync,
--            video => video,

            n_wr => n_WR_vdu,
            n_rd => n_RD_vdu,
            n_int => n_int1,
            regSel => cpuAddress(0),
            dataIn => cpuDataOut,
            dataOut => interface1DataOut,
            ps2Clk => ps2Clk,
            ps2Data => ps2Data
				);


    n_WR_uart <= n_interface2CS or n_WR;
    n_RD_uart <= n_interface2CS or n_RD;

	io2 : entity work.bufferedUART
		port map
		(
			clk => clk,
			n_wr => n_WR_uart,
			n_rd => n_RD_uart,
			n_int => n_int2,
			regSel => cpuAddress(0),
			dataIn => cpuDataOut,
			dataOut => interface2DataOut,
			rxClkEn => serialClkEn,
			txClkEn => serialClkEn,
			rxd => rxd1,
			txd => txd1,
			n_cts => cts1,
			n_dcd => '0',
			n_rts => rts1
		);

    n_WR_sd <= n_sdCardCS or n_WR;
    n_RD_sd <= n_sdCardCS or n_RD;

    sd1 : entity work.sd_controller
    generic map(
        CLKEDGE_DIVIDER => 25 -- edges at 50MHz/25 = 2MHz ie 1MHz sdSCLK
    )
    port map(
            sdCS => sdCS,
            sdMOSI => sdMOSI,
            sdMISO => sdMISO,
            sdSCLK => sdSCLK,
            n_wr => n_WR_sd,
            n_rd => n_RD_sd,
            n_reset => n_reset,
            dataIn => cpuDataOut,
            dataOut => sdCardDataOut,
            regAddr => cpuAddress(2 downto 0),
            driveLED => driveLED,
            clk => clk
    );

    mm1 : entity work.mem_mapper2
    port map(
            n_reset => n_reset,
            clk => clk,
            hold => hold,
            n_wr => n_WR_sd,

            dataIn => cpuDataOut,
            dataOut => mmDataOut,
            regAddr => cpuAddress(2 downto 0),

            cpuAddr => cpuAddress(15 downto 9),
            ramAddr => sramAddress_i(19 downto 13),
            ramWrInhib => ramWrInhib,
            romInhib => romInhib,

--            n_ramCSHi => n_sRamCSHi_i,
            n_ramCSLo => n_sRamCSLo_i,

            n_tint => n_tint,
            nmi => nmi --,
--            frt => n_LED7 -- debug
    );

    n_WR_gpio <= n_gpioCS or n_WR;

    gpio1 : entity work.gpio
    port map(
            n_reset => n_reset,
            clk => clk,
            hold => hold,
            n_wr => n_WR_gpio,

            dataIn => cpuDataOut,
            dataOut => gpioDataOut,
            regAddr => cpuAddress(0),

            dat0_i => gpio_dat0_i,
            dat0_o => gpio_dat0_o,
            n_dat0_oe => n_gpio_dat0_oe,

            dat2_i => gpio_dat2_i,
            dat2_o => gpio_dat2_o,
            n_dat2_oe => n_gpio_dat2_oe
    );

    -- pin control. There's probably an easier way of doing this??
--    gpio_dat0_i <= gpio0;
--    pad_ctl_gpio0: process(gpio_dat0_o, n_gpio_dat0_oe)
--    begin
--      for gpio_bit in 0 to 2 loop
--        if n_gpio_dat0_oe(gpio_bit) = '0' then
--          gpio0(gpio_bit) <= gpio_dat0_o(gpio_bit);
--        else
--          gpio0(gpio_bit) <= 'Z';
--        end if;
--      end loop;
--    end process;

--    gpio_dat2_i <= gpio2;
--    pad_ctl_gpio2: process(gpio_dat2_o, n_gpio_dat2_oe)
--    begin
--      for gpio_bit in 0 to 7 loop
--        if n_gpio_dat2_oe(gpio_bit) = '0' then
--          gpio2(gpio_bit) <= gpio_dat2_o(gpio_bit);
--        else
--          gpio2(gpio_bit) <= 'Z';
--        end if;
--      end loop;
--    end process;

-- ____________________________________________________________________________________
-- MEMORY READ/WRITE LOGIC GOES HERE

-- ____________________________________________________________________________________
-- CHIP SELECTS GO HERE
    n_basRomCS <= '0' when cpuAddress(15 downto 13) = "111" and romInhib='0' else '1'; --8K at top of memory

    -- vduffd0 swaps the assignment. Internal pullup means it is 1 by default
    n_interface1CS <= '0' when ((cpuAddress(15 downto 1) = "111111111101000" and vduffd0 = '1')  -- 2 bytes FFD0-FFD1
                              or(cpuAddress(15 downto 1) = "111111111101001" and vduffd0 = '0')) -- 2 bytes FFD2-FFD3
                      else '1';
    n_interface2CS <= '0' when ((cpuAddress(15 downto 1) = "111111111101000" and vduffd0 = '0')  -- 2 bytes FFD0-FFD1
                              or(cpuAddress(15 downto 1) = "111111111101001" and vduffd0 = '1')) -- 2 bytes FFD2-FFD3
                      else '1';

    n_gpioCS       <= '0' when cpuAddress(15 downto 1) = "111111111101011" else '1'; -- 2 bytes FFD6-FFD7
    n_sdCardCS     <= '0' when cpuAddress(15 downto 3) = "1111111111011"   else '1'; -- 8 bytes FFD8-FFDF
    n_internalRam1CS <= '0' when cpuAddress(15 downto 11) = "00000" else '1';
    -- experimented with allowing RAM to be written to "underneath" ROM but
    -- there is no advantage vs repaging the region, and it causes problems because
    -- it's necessary to avoid writing to the I/O space.

-- ____________________________________________________________________________________
-- BUS ISOLATION GOES HERE

	cpuDataIn <=
		interface1DataOut				when n_interface1CS = '0' else
		interface2DataOut				when n_interface2CS = '0' else
		gpioDataOut						when n_gpioCS = '0'       else
		sdCardDataOut or mmDataOut	when n_sdCardCS = '0' else
		basRomData						when n_basRomCS = '0' else
		internalRam1DataOut			when n_internalRam1CS= '0' else
		sramData;

		-- ____________________________________________________________________________________
-- SYSTEM CLOCKS GO HERE


    -- Serial clock DDS. With 50MHz master input clock:
    -- Baud   Increment
    -- 115200 2416
    -- 38400  805
    -- 19200  403
    -- 9600   201
    -- 4800   101
    -- 2400   50
    baud_div: process (serialClkCount_d, serialClkCount)
    begin
        serialClkCount_d <= serialClkCount + 2416;
    end process;

    baud_clk: process(clk)
    begin
        if rising_edge(clk) then
        end if;
    end process;

-- SUB-CIRCUIT CLOCK SIGNALS
    clk_gen: process (clk) begin
    if rising_edge(clk) then
        -- Enable for baud rate generator
        serialClkCount <= serialClkCount_d;
        if serialClkCount(15) = '0' and serialClkCount_d(15) = '1' then
            serialClkEn <= '1';
        else
            serialClkEn <= '0';
        end if;

        -- CPU clock control. The CPU input clock is 50MHz and the HOLD input acts
		  -- as a clock enable. When the CPU is executing internal cycles (indicated by
		  -- VMA=0), HOLD asserts on alternate cycles so that the effective clock rate
		  -- is 25MHz. When the CPU is performing memory accesses (VMA=1), HOLD asserts
		  -- for 4 cycles in 5 so that the effective clock rate is 10MHz. The slower
		  -- cycle time is calculated to meet the access time for the external RAM.
		  -- The n_WR, n_RD signals (and the SRAM WE/OE signals) are asserted for the
		  -- last 4 cycles of the 5-cycle access; these are not the critical path for
		  -- the access: the critical path is the addresss and chip select, which are
		  -- nominally valid for all 5 cycles.
		  -- The clock control is implemented by a counter, which tracks VMA. The
		  -- HOLD and n_WR, n_RD controls are a synchronous decode from the counter.
		  -- When VMA=0, state transitions 0,4,0,4,0,4...
		  -- When VMA=1, state transitions 0,1,2,3,4,0,1,2,3,4...
		  --
		  -- In both cases, HOLD is negated (clock runs) when state=4 and so the CPU
		  -- address (and VMA) transitions when state goes 4->0.
		  --
		  -- Speed-up options (if your RAM can take it)
		  -- - You can easily take 1 or 2 cycles out of this timing (eg to remove 1 cycle
		  --   change 3 to 2 and 4 to 3 in the logic below).
		  -- - Theoretically, since the 6809 timing-closes at 50MHz, you can eliminate
		  --   the wait state from the VMA=0 cycles. However, that would mean generating
		  --   HOLD combinatorially from VMA which might introduce a timing loop.

        -- state control - counter influenced by VMA
        if state = 0 and vma = '0' then
            state <= "100";
        else
            if state < 4 then
                state <= state + 1;
            else
                -- this gives the 4->0 transition and also provides
                -- synchronous reset.
                state <= (others=>'0');
            end if;
        end if;

        -- decode HOLD from state and VMA
        if state = 3 or (state = 0 and vma = '0') then
            hold <= '0'; -- run the clock
        else
            hold <= '1'; -- pause the clock
        end if;

        -- decode memory and RW control from state etc.
        if (state = 1 or state = 2 or state = 3) then
            if n_cpuWr = '0' then
                n_WR <= '0';
--                n_sRamWE <= (n_sRamCSHi_i and n_sRamCSLo_i) or ramWrInhib ; -- synchronous and glitch-free
                n_sRamWE <= (n_sRamCSLo_i) or ramWrInhib ; -- synchronous and glitch-free
            else
                n_RD <= '0';
--                n_sRamOE <= n_sRamCSHi_i and n_sRamCSLo_i; -- synchronous and glitch-free
                n_sRamOE <= n_sRamCSLo_i; -- synchronous and glitch-free
            end if;
        else
            n_WR <= '1';
            n_RD <= '1';
            n_sRamWE <= '1';
            n_sRamOE <= '1';
        end if;
    end if;
    end process;

end;
