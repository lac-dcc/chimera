-- Grant Searle's Multicomp as described here:
-- http://searle.x10host.com/Multicomp/index.html
-- 
-- http://land-boards.com/blwiki/index.php?title=A-C4E6_Cyclone_IV_FPGA_EP4CE6E22C8N_Development_Board
--
-- 6502 CPU
--	25 MHz
--	32 KB SRAM
--	Microsoft BASIC in ROM
--		32,255 bytes free
--	USB-Serial Interface
--		CH340G chip
--		Requires RTS/CTS rework for hardware handshake
-- ANSI Video Display Unit
--		Limited to 128 characters
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
--	Buzzer
--
-- Memory Map
--		x0000-x7FFF - 32KB SRAM
--		xE000-xFFFF - 8KB BASIC in ROM
--	I/O
--		XFFD0-FFD1 VDU
--		XFFD2-FFD3 ACIA
--		XFFD4 BUZZER TONE (65492 dec)
--		xFFD5 Seven Segment Upper 2 digits (65493 dec)
--		xFFD6 Seven Segment Upper Middle 2 digits (65494 dec)
--		xFFD7 Seven Segment Lower Middle 2 digits (65495 dec)
--		xFFD8 Seven Segment Lower 2 digits (65496 dec)
--		xFFD9 DIP Switches (65497 dec)
--		xFFDA Ring LEDs (65498 dec)


library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity M6502_VGA is
	port(
		i_n_reset	: in std_logic;
		i_clk_50		: in std_logic;
		
		i_rxd			: in std_logic;
		o_txd			: out std_logic;
		i_n_cts		: in std_logic;
		o_n_rts		: out std_logic;
		
		o_vid_red	: out std_logic;
		o_vid_grn	: out std_logic;
		o_vid_blu	: out std_logic;
		o_vid_hSync	: out std_logic;
		o_vid_vSync	: out std_logic;
		
		i_switch		: in std_logic_vector(2 downto 0);
		i_DipSw		: in std_logic_vector(7 downto 0);

		o_LED			: out std_logic_vector(9 downto 0);
		-- 7 Seg
		o_Anode_Act	: out std_logic_vector(7 downto 0);
		o_LED7Seg	: out std_logic_vector(7 downto 0);

		o_BUZZER		: out std_logic;

		io_ps2Clk	: inout std_logic;
		io_ps2Data	: inout std_logic
	);
end M6502_VGA;

architecture struct of M6502_VGA is

	signal w_n_WR				: std_logic;
	signal w_n_RD				: std_logic;
	signal w_cpuAddress		: std_logic_vector(15 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);
	
	signal w_counterOut		: std_logic_vector(27 downto 0);

	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal w_aciaDataOut		: std_logic_vector(7 downto 0);
	signal w_ramDataOut		: std_logic_vector(7 downto 0);
	signal w_LED				: std_logic_vector(7 downto 0);
	
	signal w_n_memWR			: std_logic;
	
	signal w_n_basRomCS		: std_logic :='1';
	signal w_n_VDUCS			: std_logic :='1';
	signal w_n_ramCS			: std_logic :='1';
	signal w_n_aciaCS			: std_logic :='1';
	signal w_n_LatCS			: std_logic :='1';
	signal w_n_LatCS_Read 	: std_logic :='1';
	signal w_n_DIPSw_CS		: std_logic :='1';
	signal w_n_7SegUU_CS		: std_logic :='1';
	signal w_n_7SegUM_CS		: std_logic :='1';
	signal w_n_7SegLM_CS		: std_logic :='1';
	signal w_n_7SegLL_CS		: std_logic :='1';
	signal w_n_LEDs_CS		: std_logic :='1';

	signal w_L7SegUU			: std_logic_vector(7 downto 0);
	signal w_L7SegUM			: std_logic_vector(7 downto 0);
	signal w_L7SegLM			: std_logic_vector(7 downto 0);
	signal w_L7SegLL			: std_logic_vector(7 downto 0);
	
	signal w_serialClkCount	: std_logic_vector(15 downto 0);
	signal w_serClkCt_d 		: std_logic_vector(15 downto 0);
	signal w_w_serClkEn		: std_logic;

	signal w_cpuClkCt			: std_logic_vector(5 downto 0); 
	signal w_cpuClk			: std_logic;
	
	signal w_latBits			: std_logic_vector(7 downto 0);
	signal w_swRd			 	: std_logic_vector(7 downto 0);
	signal w_fKey1				: std_logic;
	signal w_fKey2				: std_logic;
	signal w_funKeys			: std_logic_vector(12 downto 0);

	signal w_videoVec			: std_logic_vector(5 downto 0);

begin
	-- ____________________________________________________________________________________
	-- Card has 3 bits of RGB digital data
	o_vid_red <= w_videoVec(5) or w_videoVec(4);
	o_vid_grn <= w_videoVec(3) or w_videoVec(2);
	o_vid_blu <= w_videoVec(1) or w_videoVec(0);

	o_LED(9) <= not w_fKey1;
	o_LED(8) <= not w_fKey2;
	o_LED(7 downto 0) <= not w_LED;
	
	w_swRd(7 downto 0) <= "00000" & i_switch(2) & i_switch(1) & i_switch(0);
	
	-- Chip Selects
	w_n_ramCS 		<= '0' when  w_cpuAddress(15) = '0' else '1';										-- x0000-x3FFF (16KB)
	w_n_basRomCS 	<= '0' when  w_cpuAddress(15 downto 13) = "111" else '1'; 						-- xE000-xFFFF (8KB)
	w_n_VDUCS 		<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000" and w_fKey1 = '0') 	-- XFFD0-FFD1 VDU
							or		 (w_cpuAddress(15 downto 1) = x"FFD"&"001" and w_fKey1 = '1')) 
							else '1';
	w_n_aciaCS 	<= '0' when ((w_cpuAddress(15 downto 1) = X"FFD"&"001" and w_fKey1 = '0') 		-- XFFD2-FFD3 ACIA
							or     (w_cpuAddress(15 downto 1) = X"FFD"&"000" and w_fKey1 = '1'))
							else '1';
	w_n_LatCS 		<= '0' when   w_cpuAddress = X"FFD4"  										-- XFFD4 (65492 dec)
							else '1';
	w_n_LatCS_Read 	<= w_n_memWR or w_n_LatCS;
	w_n_memWR 			<= not(w_cpuClk) nand (not w_n_WR);
	w_n_7SegUU_CS	<= '0' when (w_cpuAddress = x"FFD5" and (w_n_WR = '0')) else '1'; -- xFFD5 (65493 dec)
	w_n_7SegUM_CS	<= '0' when (w_cpuAddress = x"FFD6" and (w_n_WR = '0')) else '1'; -- xFFD6 (65494 dec)
	w_n_7SegLM_CS	<= '0' when (w_cpuAddress = x"FFD7" and (w_n_WR = '0')) else '1'; -- xFFD7 (65495 dec)
	w_n_7SegLL_CS	<= '0' when (w_cpuAddress = x"FFD8" and (w_n_WR = '0')) else '1'; -- xFFD8 (65496 dec)
	w_n_DIPSw_CS	<= '0' when (w_cpuAddress = x"FFD9" and (w_n_WR = '1')) else '1'; -- xFFD9 (65497 dec)
	w_n_LEDs_CS		<= '0' when (w_cpuAddress = x"FFDA" and (w_n_WR = '0')) else '1'; -- xFFDA (65498 dec)
	
	w_cpuDataIn <=
		w_VDUDataOut	when w_n_VDUCS 		= '0'	else
		w_aciaDataOut	when w_n_aciaCS 		= '0'	else
		w_ramDataOut 	when w_n_ramCS 		= '0'	else
		w_swRd			when w_n_LatCS_Read	= '0'	else
		i_DipSw			when w_n_DIPSw_CS	= '0'	else
		w_basRomData	when w_n_basRomCS	= '0' else		-- HAS TO BE AFTER ANY I/O READS
		x"FF";
		
	CPU : entity work.T65
	port map(
		Enable			=> '1',
		Mode				=> "00",
		Res_n				=> i_n_reset,
		clk				=> w_cpuClk,
		Rdy				=> '1',
		Abort_n			=> '1',
		IRQ_n				=> '1',
		NMI_n				=> '1',
		SO_n				=> '1',
		R_w_n				=> w_n_WR,
		A(15 downto 0)	=> w_cpuAddress,
		DI 				=> w_cpuDataIn,
		DO 				=> w_cpuDataOut);
		
	ROM : entity work.M6502_BASIC_ROM -- 8KB
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		q			=> w_basRomData
	);

	SRAM : entity work.InternalRam32K 
	port map
	(
		address	=> w_cpuAddress(14 downto 0),
		clock		=> i_clk_50,
		data		=> w_cpuDataOut,
		wren		=> not(w_n_memWR or w_n_ramCS or w_cpuClk),
		q			=> w_ramDataOut
	);

	UART : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_WR		=> w_n_aciaCS or w_cpuClk or w_n_WR,
			n_RD		=> w_n_aciaCS or w_cpuClk or (not w_n_WR),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_aciaDataOut,
			rxClkEn	=> w_w_serClkEn,
			txClkEn	=> w_w_serClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_n_cts,
			n_rts		=> o_n_rts,
			n_dcd		=> '0'
		);
	
	VDU : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET => 0
	)
		port map (
		n_reset	=> i_n_reset,
		clk 		=> i_clk_50,

		-- RGB video signals
		hSync => o_vid_hSync,
		vSync => o_vid_vSync,
		videoR1 => w_videoVec(5),
		videoR0 => w_videoVec(4),
		videoG1 => w_videoVec(3),
		videoG0 => w_videoVec(2),
		videoB1 => w_videoVec(1),
		videoB0 => w_videoVec(0),

		n_WR => w_n_VDUCS or w_cpuClk or w_n_WR,
		n_RD => w_n_VDUCS or w_cpuClk or (not w_n_WR),
--		n_int => n_int1,
		regSel => w_cpuAddress(0),
		dataIn => w_cpuDataOut,
		dataOut => w_VDUDataOut,
		ps2Clk => io_ps2Clk,
		ps2Data => io_ps2Data,
		FNkeys => w_funKeys
	);

	FNKey1Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(1),
			clock => i_clk_50,
			n_res => i_n_reset,
			latchFNKey => w_fKey1
		);	

	FNKey2Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(2),
			clock => i_clk_50,
			n_res => i_n_reset,
			latchFNKey => w_fKey2
		);
		
	SoundLatch : entity work.OutLatch
		port map (
			dataIn => w_cpuDataOut,
			clock => i_clk_50,
			load => w_n_memWR or w_n_LatCS,
			clear => i_n_reset,
			latchOut => w_latBits
			);
	
	myCounter : entity work.counter
	port map(
		clock => i_clk_50,
		clear => '0',
		count => '1',
		Q => w_counterOut
		);

	o_BUZZER <= NOT (
		(w_latBits(4) and w_counterOut(13)) or 
		(w_latBits(5) and w_counterOut(14)) or 
		(w_latBits(6) and w_counterOut(15)) or 
		(w_latBits(7) and w_counterOut(16)));

	latchLEDs : entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_LEDs_CS,
			clear		=> i_n_reset,
			latchOut => w_LED
			);
	
	io7SEGUU: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7SegUU_CS,
			clear		=> i_n_reset,
			latchOut => w_L7SegUU
			);
	
	io7SEGUM: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7SegUm_CS,
			clear		=> i_n_reset,
			latchOut => w_L7SegUM
			);
	
	io7SEGLM: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7Seglm_CS,
			clear		=> i_n_reset,
			latchOut => w_L7SegLM
			);
	
	io7SEGLL: entity work.OutLatch
		port map (
			dataIn	=> w_cpuDataOut,
			clock		=> i_clk_50,
			load		=> w_n_7Segll_CS,
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
	
-- SUB-CIRCUIT CLOCK SIGNALS 
	process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then

			if w_cpuClkCt < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				w_cpuClkCt <= w_cpuClkCt + 1;
			else
				w_cpuClkCt <= (others=>'0');
			end if;
			if w_cpuClkCt < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				w_cpuClk <= '0';
			else
				w_cpuClk <= '1';
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

	baud_div: process (w_serClkCt_d, w_serialClkCount, w_fKey2)
		begin
			if w_fKey2 = '0' then
				w_serClkCt_d <= w_serialClkCount + 2416;	-- 115,200 baud
			else
				w_serClkCt_d <= w_serialClkCount + 6;		-- 300 baud
				end if;
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(i_clk_50)
		begin
			if rising_edge(i_clk_50) then
					w_serialClkCount <= w_serClkCt_d;
				if w_serialClkCount(15) = '0' and w_serClkCt_d(15) = '1' then
					w_w_serClkEn <= '1';
				else
					w_w_serClkEn <= '0';
				end if;
       end if;
    end process;
	 
end;
