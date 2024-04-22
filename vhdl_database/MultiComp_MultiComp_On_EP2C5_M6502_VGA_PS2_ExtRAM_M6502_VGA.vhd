-- Grant Searle's Multicomp as described here:
-- http://searle.x10host.com/Multicomp/index.html
-- 
-- http://land-boards.com/blwiki/index.php?title=EP2C5-DB
--
-- 6502 CPU
--		25 MHz for ROM and peripherals
--		16.7 Mhz for Exterbal SRAM
--	56 KB SRAM
--	Microsoft BASIC in ROM
--		56,831 bytes free
-- ANSI Video Display Unit
--		80x25 character display
--		2/2/2 - R/G/B output
-- PS/2 Keyboard
--		F1 key switches between VDU and Serial port
--			Default is VDU
--		F2 key switches baud rate between 300 and 115,200
--			Default is 115,200 baud
--
-- Memory Map
--		x0000-xDFFF - 56KB SRAM
--		xE000-xFFFF - 8KB BASIC in ROM
--	I/O
--		XFFD0-FFD1 VDU
--		XFFD2-FFD3 ACIA
--
--	T65 (6502) CPU drives address and write data on CPU Clock high 
--	T65 CPU data reads when clock rises from low to high
--	Clock can be optimized for one clock high and two clock low for slower interfaces like external SRAM--

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
		o_n_rts		: out std_logic;
		
		videoR0		: out std_logic;
		videoR1		: out std_logic;
		videoG0		: out std_logic;
		videoG1		: out std_logic;
		videoB0		: out std_logic;
		videoB1		: out std_logic;
		o_vid_hSync	: out std_logic;
		o_vid_vSync	: out std_logic;
		
		io_ps2Clk	: inout std_logic;
		io_ps2Data	: inout std_logic;
		
		Pin25					: out std_logic;
		Pin31					: out std_logic;
		Pin41					: out std_logic;
		Pin40					: out std_logic;
		Pin43					: out std_logic;
		Pin42					: out std_logic;
		Pin45					: out std_logic;
		Pin44					: out std_logic;
		
		o_J8IO8				: out std_logic_vector(7 downto 0);
		
		-- 128KB SRAM (56KB used)
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		o_extSRamAddress	: out std_logic_vector(16 downto 0);
		io_n_extSRamWE		: out std_logic := '1';
		io_n_extSRamCS		: out std_logic := '1';
		io_n_extSRamOE		: out std_logic := '1'
	);
end M6502_VGA;

architecture struct of M6502_VGA is

	signal w_R1W0				: std_logic;
	signal w_resetLow			: std_logic;
	signal w_cpuAddress		: std_logic_vector(15 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);
	
	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal w_aciaDataOut		: std_logic_vector(7 downto 0);
	signal w_ramDataOut		: std_logic_vector(7 downto 0);
	
--	signal w_n_memWR			: std_logic;
	
	signal w_n_basRomCS		: std_logic :='1';
	signal w_n_VDUCS			: std_logic :='1';
	signal w_n_ramCS			: std_logic :='1';
	signal w_n_aciaCS			: std_logic :='1';
--	signal w_n_LatCS			: std_logic :='1';
--	signal w_n_LatCS_Read 	: std_logic :='1';
	
	signal w_serialClkCount	: std_logic_vector(15 downto 0);
	signal w_serClkCt_d 		: std_logic_vector(15 downto 0);
	signal w_serClkEn		: std_logic;

	signal w_cpuClkCt			: std_logic_vector(3 downto 0); 
	signal w_cpuClk			: std_logic;

	signal w_latBits			: std_logic_vector(7 downto 0);
	signal w_fKey1				: std_logic;
	signal w_fKey2				: std_logic;
	signal w_funKeys			: std_logic_vector(12 downto 0);

begin
	-- ____________________________________________________________________________________
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk		=> w_cpuClk,
		i_PinIn	=> i_n_reset,
		o_PinOut	=> w_resetLow
	);
	
	-- Test Points
	o_J8IO8(0) <= w_cpuClk;
	o_J8IO8(1) <= w_cpuAddress(0);
	o_J8IO8(2) <= w_R1W0;
	o_J8IO8(3) <= w_n_VDUCS;
	o_J8IO8(4) <= not ((not w_n_ramCS) and w_R1W0);										-- io_n_extSRamOE
	o_J8IO8(5) <= not ((not w_n_ramCS) and (not w_cpuClk) and (not w_R1W0));	-- io_n_extSRamWE
	o_J8IO8(6) <= '0';
	o_J8IO8(7) <= '0';

	o_extSRamAddress	<= '0'&w_cpuAddress(15 downto 0);
	io_extSRamData		<= w_cpuDataOut when ((w_R1W0='0') and (w_n_ramCS = '0')) else
							  (others => 'Z');
	io_n_extSRamWE		<= not((not w_n_ramCS) and (not w_cpuClk) and (not w_R1W0));
--	io_n_extSRamOE		<= not((not w_n_ramCS) and (not w_cpuClk) and      w_R1W0);
	io_n_extSRamOE		<= not((not w_n_ramCS) and                         w_R1W0);
	io_n_extSRamCS		<= not((not w_n_ramCS) and (not w_cpuClk));
	
	-- Chip Selects
	w_n_ramCS 		<= '0' when   w_cpuAddress(15) = '0' 								else					-- x0000-x7FFF (32KB)
							'0' when   w_cpuAddress(15 downto 14) = "10"			   	else					-- x8000-xBFFF (16KB)
							'0' when   w_cpuAddress(15 downto 13) = "110"				else					-- xC000-xDFFF (8KB)
							'1';
	w_n_basRomCS 	<= '0' when   w_cpuAddress(15 downto 13) = "111" else '1'; 							-- xE000-xFFFF (8KB)
	w_n_VDUCS 		<= '0' when	((w_cpuAddress(15 downto 1) = x"FFD"&"000" and w_fKey1 = '0') 		-- XFFD0-FFD1 VDU
							or		    (w_cpuAddress(15 downto 1) = x"FFD"&"001" and w_fKey1 = '1')) 
							else '1';
	w_n_aciaCS 	<= '0' when    ((w_cpuAddress(15 downto 1) = X"FFD"&"001" and w_fKey1 = '0') 		-- XFFD2-FFD3 ACIA
							or        (w_cpuAddress(15 downto 1) = X"FFD"&"000" and w_fKey1 = '1'))
							else '1';
--	w_n_LatCS 		<= '0' when   w_cpuAddress = X"FFD4"  								-- XFFD4 (65492 dec)
--							else '1';
--	w_n_LatCS_Read 	<= w_n_memWR or w_n_LatCS;
--	w_n_memWR 			<= not(w_cpuClk) nand (not w_R1W0);
	
	w_cpuDataIn <=
		w_VDUDataOut	when w_n_VDUCS 	= '0'	else
		w_aciaDataOut	when w_n_aciaCS 	= '0'	else
		io_extSRamData	when w_n_ramCS 	= '0'	else
		w_basRomData	when w_n_basRomCS	= '0' else		-- HAS TO BE AFTER ANY I/O READS
		x"FF";
		
	CPU : entity work.T65
	port map(
		Enable			=> '1',
		Mode				=> "00",
		Res_n				=> w_resetLow,
		clk				=> w_cpuClk,
		Rdy				=> '1',
		Abort_n			=> '1',
		IRQ_n				=> '1',
		NMI_n				=> '1',
		SO_n				=> '1',
		R_w_n				=> w_R1W0,
		A(15 downto 0)	=> w_cpuAddress,
		DI 				=> w_cpuDataIn,
		DO 				=> w_cpuDataOut);
		
	ROM : entity work.M6502_BASIC_ROM -- 8KB
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		q			=> w_basRomData
	);

	UART : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_RD		=> w_n_aciaCS or w_cpuClk or (not w_R1W0),
--			n_RD		=> w_n_aciaCS or (not w_R1W0),
			n_WR		=> w_n_aciaCS or w_cpuClk or w_R1W0,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_aciaDataOut,
			rxClkEn	=> w_serClkEn,
			txClkEn	=> w_serClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_rts		=> o_n_rts,
			n_dcd		=> '0'
		);
	
	VDU : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET => 0
	)
		port map (
		n_reset	=> w_resetLow,
		clk 		=> i_clk_50,

		-- CPU
		n_WR => w_n_VDUCS or w_cpuClk or w_R1W0,
--		n_RD => w_n_VDUCS or w_cpuClk or (not w_R1W0),
		n_RD => w_n_VDUCS or (not w_R1W0),
--		n_int => n_int1,
		regSel => w_cpuAddress(0),
		dataIn => w_cpuDataOut,
		dataOut => w_VDUDataOut,
		
		-- RGB video signals
		hSync => o_vid_hSync,
		vSync => o_vid_vSync,
		videoR1 => videoR1,
		videoR0 => videoR0,
		videoG1 => videoG1,
		videoG0 => videoG0,
		videoB1 => videoB1,
		videoB0 => videoB0,

		-- PS/2 Kyboard
		ps2Clk => io_ps2Clk,
		ps2Data => io_ps2Data,
		FNkeys => w_funKeys
	);

	FNKey1Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(1),
			clock => i_clk_50,
			n_res => w_resetLow,
			latchFNKey => w_fKey1
		);	

	FNKey2Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(2),
			clock => i_clk_50,
			n_res => w_resetLow,
			latchFNKey => w_fKey2
		);
		
--	SoundLatch : entity work.OutLatch
--		port map (
--			dataIn8 => w_cpuDataOut,
--			clock => i_clk_50,
--			load => w_cpuClk or w_R1W0 or w_n_LatCS,
--			clear => w_resetLow,
--			latchOut => w_latBits
--			);

-- CPU Clock
	process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then
			if w_n_basRomCS = '0' then -- 1 clock high, 1 clock low
				if w_cpuClkCt < 1 then
					w_cpuClkCt <= w_cpuClkCt + 1;
				else
					w_cpuClkCt <= (others=>'0');
				end if;
				if w_cpuClkCt < 1 then
					w_cpuClk <= '0';
				else
					w_cpuClk <= '1';
				end if; 
			else		-- 1 clock high, 2 clocks low
				if w_cpuClkCt < 2 then
					w_cpuClkCt <= w_cpuClkCt + 1;
				else
					w_cpuClkCt <= (others=>'0');
				end if;
				if w_cpuClkCt < 2 then
					w_cpuClk <= '0';
				else
					w_cpuClk <= '1';
				end if; 
			end if; 
		end if; 
    end process;

	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_clk_50,
		o_serialEn	=> w_serClkEn
	);

	 
end;
