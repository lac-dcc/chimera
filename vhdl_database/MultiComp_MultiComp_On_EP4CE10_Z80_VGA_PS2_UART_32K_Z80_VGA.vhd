-- Grant Searle's Multicomp as described here:
-- http://searle.x10host.com/Multicomp/index.html
-- 
-- http://land-boards.com/blwiki/index.php?title=A-C4E10_Cyclone_IV_FPGA_EP4CE10E22C8N_Development_Board
-- 
-- z80 CPU
--	25 MHz
--	32 KB SRAM
--	Microsoft Z80 NASCOM BASIC in ROM
--		32,435 bytes free
--	USB-Serial Interface
--		CH340G chip
--		Requires RTS/CTS rework for hardware handshake
-- ANSI Video Display Unit
--		32KB SRAM does not allow extended characters
--		80x25 character display
--		1/1/1 - R/G/B output
-- PS/2 Keyboard
--		F1 key switches between VDU and Serial port
--			Default is VDU
--		F2 key switches baud rate between 300 and 115,200
--			Default is 115,200 baud
--	(10) LEDs
--	(3) Pushbutton Switches
--	(8) DIP Switch
--	BUZZER
--
-- Memory Map
--		x0000-x1FFF - 8KB BASIC in ROM
--		X2000-x9FFF - 32KB SRAM
--	I/O Map
--		x80-x81 (128-129 dec) - VDU or ACIA
--		x82-x83 (13- ACIA or VDU
--		x84 - (Read) Pushbuttons (d0-d2)
--		x84 - (Write) Buzzer Tone
--		x85 - DIP Switch
--		$88 (136 dec) - Seven Segment LEDs - upper 2 digits
--		$89 (137 dec) - Seven Segment LEDs - upper middle 2 digits
--		$8a (138 dec) - Seven Segment LEDs - lower middle 2 digits
--		$8b (139 dec) - Seven Segment LEDs - lower 2 digits

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Z80_VGA is
	port (
		i_n_reset	: in std_logic;
		i_clk_50		: in std_logic;
		-- Serial port
		i_rxd			: in std_logic;
		o_txd			: out std_logic;
		i_n_cts		: in std_logic;
		o_n_rts		: out std_logic;
		-- Video
		o_vid_red	: out std_logic;
		o_vid_grn	: out std_logic;
		o_vid_blu	: out std_logic;
		o_vid_hSync	: out std_logic;
		o_vid_vSync	: out std_logic;
		-- Pushbutton switches
		i_switch		: in std_logic_vector(2 downto 0);
		i_DipSw		: in std_logic_vector(7 downto 0);
		-- LEDs
		O_LED1		: out std_logic;
		O_LED2		: out std_logic;
		O_LED3		: out std_logic;
		O_LED4		: out std_logic;
		-- 7 Seg
		o_Anode_Act	: out std_logic_vector(7 downto 0);
		o_LED7Seg	: out std_logic_vector(7 downto 0);
		-- o_BUZZER
		o_BUZZER		: out std_logic;
		-- PS/2 keyboard
		i_ps2Clk		: inout std_logic;
		i_ps2Data	: inout std_logic
	);
end Z80_VGA;

architecture struct of Z80_VGA is

	signal w_n_WR			: std_logic;
	signal w_n_RD			: std_logic;
	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	
	signal w_counterOut	: std_logic_vector(27 downto 0);
	signal w_buzz			: std_logic;

	signal w_basRomData	: std_logic_vector(7 downto 0);
	signal w_VDUDataOut	: std_logic_vector(7 downto 0);
	signal w_ACIADatOut	: std_logic_vector(7 downto 0);
	signal w_ramDataOut	: std_logic_vector(7 downto 0);
	
	signal w_L7SegUU		: std_logic_vector(7 downto 0);
	signal w_L7SegUM		: std_logic_vector(7 downto 0);
	signal w_L7SegLM		: std_logic_vector(7 downto 0);
	signal w_L7SegLL		: std_logic_vector(7 downto 0);
	
	signal w_n_memWR		: std_logic;
	signal w_n_memRD 		: std_logic :='1';
	
	signal w_n_basRomCS	: std_logic :='1';
	signal w_n_VDUCS		: std_logic :='1';
	signal w_n_ACIACS		: std_logic :='1';
	signal w_n_intRamCS	: std_logic :='1';
	signal w_n_PBSw_CS	: std_logic :='1';
	signal w_n_DIPSw_CS	: std_logic :='1';
	signal w_n_Lat_CS		: std_logic :='1';
	signal w_n_7SegUU_CS	: std_logic :='1';
	signal w_n_7SegUM_CS	: std_logic :='1';
	signal w_n_7SegLM_CS	: std_logic :='1';
	signal w_n_7SegLL_CS	: std_logic :='1';
	
	signal w_n_ioWR		: std_logic :='1';
	signal w_n_ioRD 		: std_logic :='1';

	signal w_n_MREQ		: std_logic :='1';
	signal w_n_IORQ		: std_logic :='1';	

	signal w_n_VDUInt		: std_logic :='1';	
	signal w_n_ACIAint		: std_logic :='1';	
	
	signal w_serialCount	: std_logic_vector(15 downto 0);
	signal w_serClkCt_d	: std_logic_vector(15 downto 0);
	signal w_serialClkEn	: std_logic;

	signal w_cpuClkCount	: std_logic_vector(5 downto 0); 
	signal w_cpuClock		: std_logic;
	signal w_serialClock	: std_logic;
	
	signal w_n_LatchCS	: std_logic :='1';
	signal w_latchedBits	: std_logic_vector(7 downto 0);
	signal W_DIPSwDatOut	: std_logic_vector(7 downto 0);

	signal w_txdBuff		: std_logic;
	signal w_funKeys			: std_logic_vector(12 downto 0);
	signal w_fKey1			: std_logic :='0';
	signal w_fKey2			: std_logic :='0';
	
	signal w_Video_Red0	: std_logic :='0';
	signal w_Video_Red1	: std_logic :='0';
	signal w_Video_Grn0	: std_logic :='0';
	signal w_Video_Grn1	: std_logic :='0';
	signal w_Video_Blu0	: std_logic :='0';
	signal w_Video_Blu1	: std_logic :='0';

	signal w_n_RomAct		: std_logic := '0';

begin

	o_vid_red <= w_Video_Red0 or w_Video_Red1;
	o_vid_grn <= w_Video_Grn0 or w_Video_Grn1;
	o_vid_blu <= w_Video_Blu0 or w_Video_Blu1;
	
	O_LED1 	<= w_latchedBits(0);
	O_LED2 	<= w_fKey1;
	O_LED3 	<= not w_txdBuff;
	O_LED4 	<= not i_rxd;
	o_txd 	<= w_txdBuff;
	
	-- MEMORY READ/WRITE LOGIC GOES HERE
	w_n_ioWR <= w_n_WR or w_n_IORQ;
	w_n_memWR <= w_n_WR or w_n_MREQ;
	w_n_ioRD <= w_n_RD or w_n_IORQ;
	w_n_memRD <= w_n_RD or w_n_MREQ;
	
	-- Chip Selects
	w_n_basRomCS	<= '0' when   w_cpuAddress(15 downto 13) = "000" else '1';	--8K from $0000-1FFF
	w_n_intRamCS	<= '0' when ((w_cpuAddress(15 downto 13) = "001") or 			-- x2000-x3FFF (8KB)
										 (w_cpuAddress(15 downto 14) = "01")  or			-- x4000-x7FFF (16KB)
										 (w_cpuAddress(15 downto 13) = "100"))	 			-- x8000-x9FFF (8KB)
										else '1';
										
	-- I/O accesses are via INP/OUT in Z80 NASCOM BASIC
	-- The address decoders get swapped when the F1 key is pressed
	w_n_VDUCS	<= '0' when 
		((w_fKey1 = '0' and w_cpuAddress(7 downto 1) = x"8"&"000" and (w_n_ioWR='0' or w_n_ioRD = '0')) or	-- 2 Bytes $80-$81
		 (w_fKey1 = '1' and w_cpuAddress(7 downto 1) = x"8"&"001" and (w_n_ioWR='0' or w_n_ioRD = '0')))	-- 2 Bytes $82-$83
		else '1';
	w_n_ACIACS	<= '0' when   
		((w_fKey1 = '0' and w_cpuAddress(7 downto 1) = x"8"&"001" and (w_n_ioWR='0' or w_n_ioRD = '0'))	or	-- 2 Bytes $82-$83
		 (w_fKey1 = '1' and w_cpuAddress(7 downto 1) = x"8"&"000" and (w_n_ioWR='0' or w_n_ioRD = '0')))	-- 2 Bytes $80-$81
		else '1';
	w_n_PBSw_CS		<= '0' when (w_cpuAddress(7 downto 0) = x"84" and (w_n_ioRD = '0')) else '1';  -- $84 (132 dec)
	w_n_Lat_CS		<= '0' when (w_cpuAddress(7 downto 0) = x"84" and (w_n_ioWR = '0')) else '1';  -- $84 (132 dec)
	w_n_DIPSw_CS	<= '0' when (w_cpuAddress(7 downto 0) = x"85" and (w_n_ioRD = '0')) else '1';  -- $85 (133 dec)
	w_n_7SegUU_CS	<= '0' when (w_cpuAddress(7 downto 0) = x"88" and (w_n_ioWR = '0')) else '1';  -- $88 (136 dec)
	w_n_7SegUM_CS	<= '0' when (w_cpuAddress(7 downto 0) = x"89" and (w_n_ioWR = '0')) else '1';  -- $89 (137 dec)
	w_n_7SegLM_CS	<= '0' when (w_cpuAddress(7 downto 0) = x"8a" and (w_n_ioWR = '0')) else '1';  -- $8a (138 dec)
	w_n_7SegLL_CS	<= '0' when (w_cpuAddress(7 downto 0) = x"8b" and (w_n_ioWR = '0')) else '1';  -- $8b (139 dec)
	
	w_cpuDataIn <=
		w_VDUDataOut 		when w_n_VDUCS 	= '0' else	-- VDU
		w_ACIADatOut 		when w_n_ACIACS	= '0' else	-- ACIA
		"00000"&i_switch	when w_n_PBSw_CS	= '0' else	-- Pushbuttons
		i_DipSw				when w_n_DIPSw_CS = '0' else	-- DIP Switch
		w_basRomData		when w_n_basRomCS = '0' else	-- BASIC
		w_ramDataOut 		when w_n_intRamCS = '0' else	-- SRAM
		x"FF";
		
-- ____________________________________________________________________________________
-- CPU CHOICE GOES HERE
	cpu1 : entity work.t80s
	generic map(mode => 1, t2write => 1, iowait => 0)
	port map(
		reset_n	=> i_n_reset,
		clk_n		=> w_cpuClock,
		wait_n	=> '1',
		int_n		=> '1',
		nmi_n		=> '1',
		busrq_n	=> '1',
		mreq_n	=> w_n_MREQ,
		iorq_n	=> w_n_IORQ,
		rd_n		=> w_n_RD,
		wr_n		=> w_n_WR,
		a			=> w_cpuAddress,
		di			=> w_cpuDataIn,
		do			=> w_cpuDataOut
	);

	rom : entity work.Z80_BASIC_ROM -- 8KB
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		q			=> w_basRomData
	);

	u3: entity work.InternalRam32K 
	port map
	(
		address	=> w_cpuAddress(14 downto 0),
		clock		=> i_clk_50,
		data		=> w_cpuDataOut,
		wren		=> not(w_n_memWR or w_n_intRamCS),
		q			=> w_ramDataOut
	);

	io1 : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET => 0
	)
		port map (
		n_reset	=> i_n_reset,
		clk		=> i_clk_50,

		-- RGB video signals
		hSync		=> o_vid_hSync,
		vSync 	=> o_vid_vSync,
		videoR0	=> w_Video_Red0,		-- Most significant bits (different from Grant's)
		videoR1	=> w_Video_Red1,
		videoG0	=> w_Video_Grn0,
		videoG1	=> w_Video_Grn1,
		videoB0	=> w_Video_Blu0,
		videoB1	=> w_Video_Blu1,

		n_WR		=> w_n_VDUCS or w_n_ioWR,
		n_RD		=> w_n_VDUCS or w_n_ioRD,
		n_int		=> w_n_VDUInt,
		regSel	=> w_cpuAddress(0),
		dataIn	=> w_cpuDataOut,
		dataOut	=> w_VDUDataOut,
		ps2Clk	=> i_ps2Clk,
		ps2Data	=> i_ps2Data,
		FNkeys	=> w_funKeys			-- Brought out to use as port select/baud rate selects
	);

	UART : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_WR		=> w_n_ACIACS or w_n_ioWR,
			n_RD		=> w_n_ACIACS or w_n_ioRD,
			n_int		=> w_n_ACIAint,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_ACIADatOut,
			rxClkEn	=> w_serialClkEn,		-- Improved UART clocking by Neal Crook
			txClkEn	=> w_serialClkEn,
			rxd		=> i_rxd,
			txd		=> w_txdBuff,
			n_cts		=> i_n_cts,
			n_rts		=> o_n_rts,
			n_dcd		=> '0'
		);
	
	FNKey1Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey			=> w_funKeys(1),
			clock			=> i_clk_50,
			n_res			=> i_n_reset,
			latchFNKey	=> w_fKey1
		);	

	FNKey2Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey			=> w_funKeys(2),
			clock			=> i_clk_50,
			n_res			=> i_n_reset,
			latchFNKey	=> w_fKey2
		);	
		
	io3: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_Lat_CS or w_n_ioWR,
			clear		=> i_n_reset,
			latchOut => w_latchedBits
			);
	
	io7SEGUU: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7SegUU_CS or w_n_ioWR,
			clear		=> i_n_reset,
			latchOut => w_L7SegUU
			);
	
	io7SEGUM: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7SegUm_CS or w_n_ioWR,
			clear		=> i_n_reset,
			latchOut => w_L7SegUM
			);
	
	io7SEGLM: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7Seglm_CS or w_n_ioWR,
			clear		=> i_n_reset,
			latchOut => w_L7SegLM
			);
	
	io7SEGLL: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7Segll_CS or w_n_ioWR,
			clear		=> i_n_reset,
			latchOut => w_L7SegLL
			);
	
	Seg78D : entity work.Loadable_7S8D_LED
		Port map (
			i_clock_50Mhz			=> i_clk_50,
			i_reset					=> not i_n_reset,
			i_displayed_number 	=> w_L7SegUU & w_L7SegUM & w_L7SegLM & w_L7SegLL,
			o_Anode_Activate 		=> o_Anode_Act,
			o_LED7Seg_out 			=> o_LED7Seg
			);
	
	myCounter : entity work.counter
	port map(
		clock	=> i_clk_50,
		clear => '0',
		count => '1',
		Q		=> w_counterOut
		);

--	w_buzz <= w_latchedBits(4) and w_counterOut(16);
	o_BUZZER <= not (
		(w_latchedBits(4) and w_counterOut(13)) or 
		(w_latchedBits(5) and w_counterOut(14)) or 
		(w_latchedBits(6) and w_counterOut(15)) or 
		(w_latchedBits(7) and w_counterOut(16)));

-- SUB-CIRCUIT CLOCK SIGNALS 
	process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then

			if w_cpuClkCount < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				w_cpuClkCount <= w_cpuClkCount + 1;
			else
				w_cpuClkCount <= (others=>'0');
			end if;
			if w_cpuClkCount < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				w_cpuClock <= '0';
			else
				w_cpuClock <= '1';
			end if; 
		end if; 
    end process;

	-- ____________________________________________________________________________________
	-- Baud Rate Clock Signals
	-- Serial clock DDS
	-- 50MHz master input clock:
	-- f = (increment x 50,000,000) / 65,536 = 16X baud rate
	-- Baud Increment
	-- 115200 2416
	-- 38400 805
	-- 19200 403
	-- 9600 201
	-- 4800 101                 
	-- 2400 50

	baud_div: process (w_serClkCt_d, w_serialCount)
		begin
			if w_fKey2 = '0' then
				w_serClkCt_d <= w_serialCount + 2416;	-- 115,200 baud
			else
				w_serClkCt_d <= w_serialCount + 6;		-- 300 baud
				end if;
		end process;

	--Single clock wide baud rate enable
	baud_i_clk_50: process(i_clk_50)
		begin
			if rising_edge(i_clk_50) then
					w_serialCount <= w_serClkCt_d;
				if w_serialCount(15) = '0' and w_serClkCt_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
       end if;
    end process;
	 
end;
