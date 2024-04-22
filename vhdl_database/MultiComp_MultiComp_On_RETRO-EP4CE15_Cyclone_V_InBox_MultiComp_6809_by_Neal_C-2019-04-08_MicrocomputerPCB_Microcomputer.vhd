-- ---------------------------------------------------------------------------------------
-- 6809 Multicomp Top Level Features
--	Targetted to Multicomp in a Box
--		http://land-boards.com/blwiki/index.php?title=Multicomp_in_a_Box
--	Running on QMTECH FPGA card
--		5CEFA2F23 FPGA
--		http://land-boards.com/blwiki/index.php?title=QM_Tech_Cyclone_V_FPGA_Board
-- 6809 CPU
-- 12.5/25 MHz - slower speed for external SRAM accesses
-- 1 MB SRAM with MMU
--		On RETRO-EP4CE15 Baseboard
--		http://land-boards.com/blwiki/index.php?title=RETRO-EP4CE15
-- Forth (CamelForth), FLEX, CUBIX, NITROS9, FUZIX on SD Card
--	VDU
--		VGA, 2:2:2 R:G:B
--		PS/2 keyboard
--	USB-Serial
--		ACIA UART interface
--		FT230XS USB-Serial interface
-- 	Switch J3-1 on the bottom of the box selects Serial or VDU as default
--	External SD Card accessible through front panel
--	Reset switch on Front Panel
--
-- Neal Crook's modifications to Grant's original design
-- In summary:
-- * Deploy 6809 modified to use async active-low reset, posedge clock
-- * Clock 6809 from master (50MHz) clock and control execution rate by
--   asserting hold
-- * Speed up clock cycle when no external access (vma=0)
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
--   * Can address upto 1024KByte
--   * Can page any 8Kbyte SRAM region into any 8KByte region of processor
--     address space
--   * Can write-protect any region
--   * Can enable/disable ROM in the top 8Kbyte region
--   * Includes a 50Hz timer interrupt with efficient register interface
--   * Includes a nmi generator for code single-step
--   For detailed description and programming details, refer to the
--   detailed comments in the header of mem_mapper2.vhd)
-- * i_SerSel (PIN_B22) is input, switches I/O assignment: J3:1-2
--   OFF: PS2/VGA is UART0 at address $FFD0-$FFD1, SERIALA is UART1 at $FFD2-$FFD3
--   ON : PS2/VGA is UART0 at address $FFD2-$FFD3, SERIALA is UART1 at $FFD0-$FFD1
--
-- Note on confusing name: In the directory ROMS/6809 there is a file
-- named 6809M.HEX and a file named CAMELFORTH_2KRAM.hex. The first contains
-- the 8K ROM image with absolute addresses in the HEX address field records
-- (suitable for use with the emulator), the second contains the 8K ROM image
-- with relative addresses in the HEX address fields (suitable for use in the
-- FPGA build flow). The "2KRAM" in the name indicates that the image was
-- build to work with 2K of RAM. Actually, the design has a full 64K of RAM
-- available. Just don't worry about it. I chose a lousy name.

-- Some parts are copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/
-- and to the "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Grant Searle
-- eMail address available on my main web page link above.
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle Multicomp"
-- on the internet to see if I have moved to another web hosting service.
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		-- Clock and reset line
		i_clk				: in std_logic;		-- 50MHz Clock is on FPGA card
		i_n_reset		: in std_logic;		-- Reser is pushbutton on Front Panel

		-- MMU Active LED on FPGA card
		o_n_MMU_ACT_LED	: out std_logic := '1';

		-- Serial select switch has an internal pull-up so this defaults to 1. Gets pulled to GND by switch.
		-- This swaps the address decodes so that the Serial A port is decoded at $FFD0 and the VDU at $FFD2.
		-- J3-1 switch on bottom of the Multicomp in a Box
		i_SerSel			: in std_logic;

		-- 1MB External SRAM
		sramData			: inout std_logic_vector(7 downto 0);
		sramAddress		: out std_logic_vector(19 downto 0); -- 19:0 -> 1MByte
		n_sRamWE			: out std_logic;
		n_sRamCS			: out std_logic;
		n_sRamOE			: out std_logic;

		-- Serial port
		i_rxd1				: in std_logic;
		o_txd1				: out std_logic;
		o_rts1				: out std_logic;
		i_cts1				: in std_logic;

		-- VGA Video
		o_videoR0			: out std_logic;
		o_videoR1			: out std_logic;
		o_videoG0			: out std_logic;
		o_videoG1			: out std_logic;
		o_videoB0			: out std_logic;
		o_videoB1			: out std_logic;
		o_hSync				: out std_logic;
		o_vSync				: out std_logic;

		-- PS/2 Keyboard
		io_ps2Clk			: inout std_logic;
		io_ps2Data			: inout std_logic;

		-- 3 GPIO
		-- assigned to bit 0..2 of gpio0.
		-- Intended for connection to DS1302 RTC as follows:
		-- bit 2: CE
		-- bit 1: SCLK
		-- bit 0: I/O (Data)
		io_gpio0				: inout std_logic_vector(2 downto 0);
		-- 8 GPIO
		io_gpio2				: inout std_logic_vector(7 downto 0);
		-- 8 GPIO
		io_gpio3				: inout std_logic_vector(7 downto 0);

		-- External SD card has activity LED
		o_sdCS				: out std_logic;
		o_sdMOSI			: out std_logic;
		i_sdMISO			: in std_logic;
		o_sdSCLK			: out std_logic;
		
		-- External SDRAM not used but pulled to inactive levels
		n_sdRamCas		: out std_logic := '1';		-- CAS
		n_sdRamRas		: out std_logic := '1';		-- RAS
		n_sdRamWe		: out std_logic := '1';		-- SDWE
		n_sdRamCe		: out std_logic := '1';		-- SD_NCS0
		sdRamClk			: out std_logic := '1';		-- SDCLK0
		sdRamClkEn		: out std_logic := '1';		-- SDCKE0
		sdRamAddr		: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData		: in std_logic_vector(15 downto 0)
		);
end Microcomputer;

architecture struct of Microcomputer is

	 signal w_n_reset			: std_logic;
    signal w_n_WR				: std_logic;
    signal w_n_RD				: std_logic;
    signal w_n_cpuWr			: std_logic;
    signal w_hold				: std_logic;
    signal w_vma				: std_logic;
    signal w_state			: std_logic_vector(2 downto 0);
    signal w_cpuAddress		: std_logic_vector(15 downto 0);
    signal w_cpuDataOut		: std_logic_vector(7 downto 0);
    signal w_cpuDataIn		: std_logic_vector(7 downto 0);
    signal w_sramAddress_i	: std_logic_vector(19 downto 0);
    signal w_n_sRamCS_i		: std_logic;

    signal w_RomData			: std_logic_vector(7 downto 0);
    signal w_if1DataOut		: std_logic_vector(7 downto 0);
    signal w_if2DataOut		: std_logic_vector(7 downto 0);
    signal w_gpioDataOut	: std_logic_vector(7 downto 0);
    signal w_sdCardDataOut	: std_logic_vector(7 downto 0);
    signal w_mmDataOut		: std_logic_vector(7 downto 0);

    signal w_irq				: std_logic;
    signal w_nmi				: std_logic;
    signal w_n_int1			: std_logic :='1';
    signal w_n_int2			: std_logic :='1';
    signal w_n_int3			: std_logic :='1';
    signal w_n_tint			: std_logic;

    signal w_n_ROMCS			: std_logic :='1';
    signal w_n_if1CS			: std_logic :='1';
    signal w_n_if2CS			: std_logic :='1';
    signal w_n_sdC_MMU_CS	: std_logic :='1';
    signal w_n_gpioCS		: std_logic :='1';

    signal w_serClkEn		: std_logic;

    signal w_n_WR_uart		: std_logic := '1';
    signal w_n_RD_uart		: std_logic := '1';

    signal w_n_WR_sd			: std_logic := '1';
    signal w_n_RD_sd			: std_logic := '1';

    signal w_n_WR_gpio		: std_logic := '1';

    signal w_n_WR_vdu		: std_logic := '1';
    signal w_n_RD_vdu		: std_logic := '1';

    signal w_romInhib		: std_logic := '0';
    signal w_ramWrInhib		: std_logic := '0';

    signal w_gpio_dat0_i		: std_logic_vector(2 downto 0);
    signal w_gpio_dat0_o		: std_logic_vector(2 downto 0);
    signal w_n_gpio_dat0_oe	: std_logic_vector(2 downto 0);

    signal w_gpio_dat2_i		: std_logic_vector(7 downto 0);
    signal w_gpio_dat2_o		: std_logic_vector(7 downto 0);
    signal w_n_gpio_dat2_oe	: std_logic_vector(7 downto 0);

    signal w_gpio_dat3_i		: std_logic_vector(7 downto 0);
    signal w_gpio_dat3_o		: std_logic_vector(7 downto 0);
    signal w_n_gpio_dat3_oe	: std_logic_vector(7 downto 0);
	 
begin

	-- Cleanup the reset switch
	-- Also, makes clean reset at power on
	debounceReset : entity work.Debouncer
	port map (
		i_clk		 	=> i_clk,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_n_reset
	);
	
-- ____________________________________________________________________________________
-- CPU CHOICE GOES HERE
    cpu1 : entity work.cpu09p
    port map(
            clk => i_clk,
            rst_n => w_n_reset,
            rw => w_n_cpuWr,
            vma => w_vma,
            addr => w_cpuAddress,
            data_in => w_cpuDataIn,
            data_out => w_cpuDataOut,
            halt => '0',
            hold => w_hold,
            irq => w_irq,
            firq => '0',
            nmi => w_nmi);

    w_irq <= not(w_n_tint and w_n_int1 and w_n_int2);

-- ____________________________________________________________________________________
-- ROM GOES HERE
    rom1 : entity work.M6809_CAMELFORTH_ROM -- 8KB FORTH ROM
    port map(
            address => w_cpuAddress(12 downto 0),
            clock => i_clk,
            q => w_RomData);

-- ____________________________________________________________________________________
-- External RAM GOES HERE

--	External RAM address width
    sramAddress(19 downto 0) <= w_sramAddress_i(19 downto 0);	-- Uses 1mB
    n_sRamCS  <= w_n_sRamCS_i;

-- External RAM - high-order address lines come from the mem_mapper
    w_sramAddress_i(12 downto 0) <= w_cpuAddress(12 downto 0);
    sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
	 
-- ____________________________________________________________________________________
-- INPUT/OUTPUT DEVICES GO HERE

    w_n_WR_vdu <= w_n_if1CS or w_n_WR;
    w_n_RD_vdu <= w_n_if1CS or w_n_RD;

    io1 : entity work.SBCTextDisplayRGB
    generic map(
      -- 80x25 uses internal RAM
      DISPLAY_TOP_SCANLINE => 35,
      VERT_SCANLINES => 448,
      V_SYNC_ACTIVE => '1'
    )
    port map (
            n_reset => w_n_reset,
            clk => i_clk,

            -- RGB video signals
            hSync => o_hSync,
            vSync => o_vSync,
            videoR0 => o_videoR0,
            videoR1 => o_videoR1,
            videoG0 => o_videoG0,
            videoG1 => o_videoG1,
            videoB0 => o_videoB0,
            videoB1 => o_videoB1,

            n_WR => w_n_WR_vdu,
            n_RD => w_n_RD_vdu,
            n_int => w_n_int1,
            regSel => w_cpuAddress(0),
            dataIn => w_cpuDataOut,
            dataOut => w_if1DataOut,
            ps2Clk => io_ps2Clk,
            ps2Data => io_ps2Data
				);

    w_n_WR_uart <= w_n_if2CS or w_n_WR;
    w_n_RD_uart <= w_n_if2CS or w_n_RD;

	io2 : entity work.bufferedUART
		port map
		(
			clk => i_clk,
			n_WR => w_n_WR_uart,
			n_RD => w_n_RD_uart,
			n_int => w_n_int2,
			regSel => w_cpuAddress(0),
			dataIn => w_cpuDataOut,
			dataOut => w_if2DataOut,
			rxClkEn => w_serClkEn,
			txClkEn => w_serClkEn,
			rxd => i_rxd1,
			txd => o_txd1,
			n_cts => i_cts1,
			n_dcd => '0',
			n_rts => o_rts1
		);

    w_n_WR_sd <= w_n_sdC_MMU_CS or w_n_WR;
    w_n_RD_sd <= w_n_sdC_MMU_CS or w_n_RD;

    sd1 : entity work.sd_controller
    generic map(
        CLKEDGE_DIVIDER => 25 -- edges at 50MHz/25 = 2MHz ie 1MHz sdSCLK
    )
    port map(
            n_WR => w_n_WR_sd,
            n_RD => w_n_RD_sd,
            n_reset => w_n_reset,
            dataIn => w_cpuDataOut,
            dataOut => w_sdCardDataOut,
            regAddr => w_cpuAddress(2 downto 0),
            sdCS => o_sdCS,
            sdMOSI => o_sdMOSI,
            sdMISO => i_sdMISO,
            sdSCLK => o_sdSCLK,
            clk => i_clk
    );

    mm1 : entity work.mem_mapper2
    port map(
            n_reset => w_n_reset,
            clk => i_clk,
            hold => w_hold,
            n_WR => w_n_WR_sd,

            dataIn => w_cpuDataOut,
            dataOut => w_mmDataOut,
            regAddr => w_cpuAddress(2 downto 0),

            cpuAddr => w_cpuAddress(15 downto 9),
            ramAddr => w_sramAddress_i(19 downto 13),
            ramWrInhib => w_ramWrInhib,
            romInhib => w_romInhib,

            n_ramCSLo => w_n_sRamCS_i,

            n_tint => w_n_tint,
            nmi => w_nmi,
            frt => o_n_MMU_ACT_LED -- debug
    );

    w_n_WR_gpio <= w_n_gpioCS or w_n_WR;

    gpio1 : entity work.gpio16
    port map(
            n_reset => w_n_reset,
            clk => i_clk,
            hold => w_hold,
            n_WR => w_n_WR_gpio,

            dataIn => w_cpuDataOut,
            dataOut => w_gpioDataOut,
            regAddr => w_cpuAddress(0),

            dat0_i => w_gpio_dat0_i,
            dat0_o => w_gpio_dat0_o,
            n_dat0_oe => w_n_gpio_dat0_oe,

            dat2_i => w_gpio_dat2_i,
            dat2_o => w_gpio_dat2_o,
            n_dat2_oe => w_n_gpio_dat2_oe,

            dat3_i => w_gpio_dat3_i,
            dat3_o => w_gpio_dat3_o,
            n_dat3_oe => w_n_gpio_dat3_oe
		);

    -- pin control. There's probably an easier way of doing this??
    w_gpio_dat0_i <= io_gpio0;
    pad_ctl_gpio0: process(w_gpio_dat0_o, w_n_gpio_dat0_oe)
    begin
      for gpio_bit in 0 to 2 loop
        if w_n_gpio_dat0_oe(gpio_bit) = '0' then
          io_gpio0(gpio_bit) <= w_gpio_dat0_o(gpio_bit);
        else
          io_gpio0(gpio_bit) <= 'Z';
        end if;
      end loop;
    end process;

    w_gpio_dat2_i <= io_gpio2;
    pad_ctl_gpio2: process(w_gpio_dat2_o, w_n_gpio_dat2_oe)
    begin
      for gpio_bit in 0 to 7 loop
        if w_n_gpio_dat2_oe(gpio_bit) = '0' then
          io_gpio2(gpio_bit) <= w_gpio_dat2_o(gpio_bit);
        else
          io_gpio2(gpio_bit) <= 'Z';
        end if;
      end loop;
    end process;

    w_gpio_dat3_i <= io_gpio3;
    pad_ctl_gpio3: process(w_gpio_dat3_o, w_n_gpio_dat3_oe)
    begin
      for gpio_bitX in 0 to 7 loop
        if w_n_gpio_dat3_oe(gpio_bitX) = '0' then
          io_gpio3(gpio_bitX) <= w_gpio_dat3_o(gpio_bitX);
        else
          io_gpio3(gpio_bitX) <= 'Z';
        end if;
      end loop;
    end process;
	 
-- ____________________________________________________________________________________
-- CHIP SELECTS GO HERE
    w_n_ROMCS		<= '0' when w_cpuAddress(15 downto 13) = "111" and w_romInhib = '0' else '1'; --8K at top of memory

    -- i_SerSel swaps the address assignment. Internal pullup means it is 1 by default
    w_n_if1CS		<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000" and i_SerSel = '1')  -- 2 bytes FFD0-FFD1
                         or (w_cpuAddress(15 downto 1) = x"FFD"&"001" and i_SerSel = '0')) -- 2 bytes FFD2-FFD3
                      else '1';

    w_n_if2CS		<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000" and i_SerSel = '0')  -- 2 bytes FFD0-FFD1
                         or (w_cpuAddress(15 downto 1) = x"FFD"&"001" and i_SerSel = '1')) -- 2 bytes FFD2-FFD3
                      else '1';

    w_n_gpioCS	<= '0' when w_cpuAddress(15 downto 1) = x"FFD"&"011" else '1'; -- 2 bytes FFD6-FFD7
	 
	 -- w_n_sdC_MMU_CS is the select for both the SD Card and the MMU
	 -- The MMU software interface is through 2 write-only registers that occupy unused addresses in the SDCARD address space.
    w_n_sdC_MMU_CS <= '0' when w_cpuAddress(15 downto 3) = x"FFD"&"1"   else '1'; -- 8 bytes FFD8-FFDF

-- ____________________________________________________________________________________
-- BUS ISOLATION GOES HERE
	w_cpuDataIn <=
		w_if1DataOut					when w_n_if1CS			= '0'	else
		w_if2DataOut					when w_n_if2CS			= '0'	else
		w_gpioDataOut						when w_n_gpioCS			= '0'	else
		w_sdCardDataOut or w_mmDataOut	when w_n_sdC_MMU_CS	= '0'	else
		w_RomData						when w_n_ROMCS			= '0'	else
		sramData;

-- ____________________________________________________________________________________
-- Baud Rate Clock
-- Pass Baud Rate in BAUD_RATE generic as integer value
-- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_clk,
		o_serialEn	=> w_serClkEn
	);

-- ____________________________________________________________________________________
-- MEMORY READ/WRITE LOGIC GOES HERE
-- SUB-CIRCUIT CLOCK SIGNALS
    clk_gen: process (i_clk) begin
    if rising_edge(i_clk) then
	 
        -- CPU clock control. 
		  -- The CPU input clock is 50MHz and the w_hold input acts as a clock enable. 
		  -- When the CPU is executing internal cycles (indicated by w_vma=0), 
		  -- w_hold asserts on alternate cycles so that the effective clock rate is 25MHz. 
		  -- When the CPU is performing memory accesses (w_vma=1), w_hold asserts
		  -- for 4 cycles in 5 so that the effective clock rate is 10MHz. The slower
		  -- cycle time is calculated to meet the access time for the external RAM.
		  -- The w_n_WR, w_n_RD signals (and the SRAM WE/OE signals) are asserted for the
		  -- last 4 cycles of the 5-cycle access; these are not the critical path for
		  -- the access: the critical path is the addresss and chip select, which are
		  -- nominally valid for all 5 cycles.
		  -- The clock control is implemented by a counter, which tracks w_vma. The
		  -- w_hold and w_n_WR, w_n_RD controls are a synchronous decode from the counter.
		  -- When w_vma=0, w_state transitions 0,4,0,4,0,4...
		  -- When w_vma=1, w_state transitions 0,1,2,3,4,0,1,2,3,4...
		  --
		  -- In both cases, w_hold is negated (clock runs) when w_state=4 and so the CPU
		  -- address (and w_vma) transitions when w_state goes 4->0.
		  --
		  -- Speed-up options (if your RAM can take it)
		  -- - You can easily take 1 or 2 cycles out of this timing (eg to remove 1 cycle
		  --   change 3 to 2 and 4 to 3 in the logic below).
		  -- - Theoretically, since the 6809 timing-closes at 50MHz, you can eliminate
		  --   the wait w_state from the w_vma=0 cycles. However, that would mean generating
		  --   w_hold combinatorially from w_vma which might introduce a timing loop.

        -- w_state control - counter influenced by w_vma
        if w_state = 0 and w_vma = '0' then
            w_state <= "100";
        else
            if w_state < 4 then
                w_state <= w_state + 1;
            else
                -- this gives the 4->0 transition and also provides
                -- synchronous reset.
                w_state <= (others=>'0');
            end if;
        end if;

        -- decode w_hold from w_state and w_vma
        if w_state = 3 or (w_state = 0 and w_vma = '0') then
            w_hold <= '0'; -- run the clock
        else
            w_hold <= '1'; -- pause the clock
        end if;

        -- decode memory and RW control from w_state etc.
        if (w_state = 1 or w_state = 2 or w_state = 3) then
            if w_n_cpuWr = '0' then
                w_n_WR <= '0';
--                n_sRamWE <= (n_sRamCSHi_i and w_n_sRamCS_i) or w_ramWrInhib ; -- synchronous and glitch-free
                n_sRamWE <= (w_n_sRamCS_i) or w_ramWrInhib ; -- synchronous and glitch-free
            else
                w_n_RD <= '0';
--                n_sRamOE <= n_sRamCSHi_i and w_n_sRamCS_i; -- synchronous and glitch-free
                n_sRamOE <= w_n_sRamCS_i; -- synchronous and glitch-free
            end if;
        else
            w_n_WR <= '1';
            w_n_RD <= '1';
            n_sRamWE <= '1';
            n_sRamOE <= '1';
        end if;
    end if;
    end process;

end;
