-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
--	 ____  _           ____  _                 _     _ _                          
--	|  _ \(_) ___ ___ | __ )| | __ _ _______  | |   (_) |__  _ __ __ _ _ __ _   _ 
--	| |_) | |/ __/ _ \|  _ \| |/ _` |_  / _ \ | |   | | '_ \| '__/ _` | '__| | | |
--	|  __/| | (_| (_) | |_) | | (_| |/ /  __/ | |___| | |_) | | | (_| | |  | |_| |
--	|_|   |_|\___\___/|____/|_|\__,_/___\___| |_____|_|_.__/|_|  \__,_|_|   \__, |
--	                                                                        |___/ 
-- =============================================================================
-- Authors:					Patrick Lehmann
--
-- Module:					Wrapper module for up to 8 PicoBlaze ROM pages. All ROMs are
--									reprogrammable via JTAG_Loader
--
-- Description:
-- ------------------------------------
--		TODO
-- 
-- 
-- License:
-- -----------------------------------------------------------------------------
-- Copyright 2007-2015 Patrick Lehmann - Dresden, Germany
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--		http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library	IEEE;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.NUMERIC_STD.all;
  
library PoC;
use			PoC.config.all;
use			PoC.utils.all;
use			PoC.vectors.all;
use			PoC.strings.all;
use			PoC.components.all;
use			PoC.ocram.all;

library L_PicoBlaze;
use			L_PicoBlaze.pb.all;
use			L_PicoBlaze.pb_comp.all;


entity pb_InstructionROM_Device is
	generic (
		PAGES								: POSITIVE							:= 1;
		SOURCE_DIRECTORY		: STRING								:= "";
		DEVICE_INSTANCE			: T_PB_DEVICE_INSTANCE;
		ENABLE_JTAG_LOADER	: BOOLEAN								:= FALSE
	);
	port (
		Clock								: in	STD_LOGIC;
		Fetch								: in	STD_LOGIC;
		InstructionPointer	: in	T_PB_ADDRESS;
		Instruction					: out T_PB_INSTRUCTION;
		Reboot							: out STD_LOGIC;
		
		-- PicoBlaze interface
		Address							: in	T_SLV_8;
		WriteStrobe					: in	STD_LOGIC;
		WriteStrobe_K				: in	STD_LOGIC;
		ReadStrobe					: in	STD_LOGIC;
		DataIn							: in	T_SLV_8;
		DataOut							: out	T_SLV_8;
		
		Interrupt						: out	STD_LOGIC;
		Interrupt_Ack				: in	STD_LOGIC;
		Message							: out T_SLV_8;
		
		PageNumber					: out	STD_LOGIC_VECTOR(2 downto 0)
	);
end;


architecture rtl of pb_InstructionROM_Device is
	type T_PB_INSTRUCTION_VECTOR	is array (NATURAL range <>) of T_PB_INSTRUCTION;

	function reverse(vec : T_PB_INSTRUCTION_VECTOR) return T_PB_INSTRUCTION_VECTOR is
		variable res : T_PB_INSTRUCTION_VECTOR(vec'range);
	begin
		for i in vec'low to vec'high loop
			res(vec'low + (vec'high - i)) := vec(i);
		end loop;
		return	res;
	end function;

	constant ENABLE_LOADER				: BOOLEAN		:= ite((VENDOR = VENDOR_XILINX), ENABLE_JTAG_LOADER, FALSE);
	constant FILENAME_PATTERN			: STRING		:= ite((VENDOR = VENDOR_ALTERA), "main_Page#.mif", "main_Page#.hex");
	
	constant REG_RW_PAGE_NUMBER		: STD_LOGIC_VECTOR(0 downto 0)			:= "0";

	signal AdrDec_we							: STD_LOGIC;
	signal AdrDec_re							: STD_LOGIC;
	signal AdrDec_WriteAddress		: T_SLV_8;
	signal AdrDec_ReadAddress			: T_SLV_8;
	signal AdrDec_Data						: T_SLV_8;

	signal Reg_PageNumber					: T_SLV_8																		:= (others => '0');
	signal Reg_PageNumber_us			: UNSIGNED(log2ceilnz(PAGES) - 1 downto 0)	:= (others => '0');
	
	signal Page_Instructions			: T_PB_INSTRUCTION_VECTOR(PAGES - 1 downto 0);
	signal Pages_DataOut					: T_PB_INSTRUCTION_VECTOR(PAGES - 1 downto 0);
	
	signal JTAGLoader_Clock				: STD_LOGIC;
	signal JTAGLoader_Enable			: STD_LOGIC_VECTOR(PAGES - 1 downto 0);
	signal JTAGLoader_Address			: T_PB_ADDRESS;
	signal JTAGLoader_WriteEnable	: STD_LOGIC;
	signal JTAGLoader_DataOut			: T_PB_INSTRUCTION;
	signal JTAGLoader_PB_Reset		: STD_LOGIC_VECTOR(PAGES - 1 downto 0);
	
	signal Page_n_rst							: STD_LOGIC;
	signal Page_0_rst							: STD_LOGIC;
	signal Page_n_rst_d						: STD_LOGIC		:= '0';
	signal Page_0_rst_d						: STD_LOGIC		:= '0';
	signal Page_n_rst_re					: STD_LOGIC;
	signal Page_0_rst_fe					: STD_LOGIC;
	signal Reset_r								: STD_LOGIC		:= '0';

begin
	assert (PAGES <= 8) report "This ROM and JTAGLoader6 support 8 pages maximum." severity FAILURE;

	AdrDec : entity L_PicoBlaze.PicoBlaze_AddressDecoder
		generic map (
			DEVICE_NAME				=> str_trim(DEVICE_INSTANCE.DeviceShort),
			BUS_NAME					=> str_trim(DEVICE_INSTANCE.BusShort),
			READ_MAPPINGS			=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_READ),
			WRITE_MAPPINGS		=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_WRITE),
			WRITEK_MAPPINGS		=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_WRITEK)
		)
		port map (
			Clock							=> Clock,
			Reset							=> Reset_r,

			-- PicoBlaze interface
			In_WriteStrobe		=> WriteStrobe,
			In_WriteStrobe_K	=> WriteStrobe_K,
			In_ReadStrobe			=> ReadStrobe,
			In_Address				=> Address,
			In_Data						=> DataIn,
			Out_WriteStrobe		=> AdrDec_we,
			Out_ReadStrobe		=> AdrDec_re,
			Out_WriteAddress	=> AdrDec_WriteAddress,
			Out_ReadAddress		=> AdrDec_ReadAddress,
			Out_Data					=> AdrDec_Data
		);

	-- Registers
	process(Clock)
	begin
		if rising_edge(Clock) then
			if (Reset_r = '1') then
				Reg_PageNumber		<= (others => '0');
			elsif (AdrDec_we = '1') then
				case AdrDec_WriteAddress(0 downto 0) is
					when REG_RW_PAGE_NUMBER =>	Reg_PageNumber		<= AdrDec_Data;
					when others =>							null;
				end case;
			end if;
		end if;
	end process;

	process(AdrDec_re, AdrDec_ReadAddress, Reg_PageNumber)
	begin
		case AdrDec_ReadAddress(0 downto 0) IS
			when REG_RW_PAGE_NUMBER =>		DataOut		<= Reg_PageNumber;
			when others =>								DataOut		<= Reg_PageNumber;
		end case;
	end process;
	
	Interrupt		<= '0';
	Message			<= x"00";
	
	-- 
	PageNumber				<= Reg_PageNumber(PageNumber'range);
	Reg_PageNumber_us	<= unsigned(Reg_PageNumber(Reg_PageNumber_us'range));

	Instruction		<= Page_Instructions(to_index(Reg_PageNumber_us, Page_Instructions'length));
	
	-- Reset control: keep PB in reset while programming, release after last ROM is written => reboot
	Page_n_rst		<= JTAGLoader_PB_Reset(PAGES - 1);
	Page_0_rst		<= JTAGLoader_PB_Reset(0);
	Page_n_rst_d	<= Page_n_rst	when rising_edge(Clock);
	Page_0_rst_d	<= Page_0_rst	when rising_edge(Clock);
	Page_n_rst_re	<= not Page_n_rst_d and Page_n_rst;
	Page_0_rst_fe	<= Page_0_rst_d and not Page_0_rst;
	
	Reset_r				<= ffrs(q => Reset_r, set => Page_n_rst_re, rst => Page_0_rst_fe) when rising_edge(Clock);
	Reboot				<= Reset_r;

	genTemplate : if (str_length(SOURCE_DIRECTORY) = 0) generate
		genPage0 : if (TRUE) generate
			constant PAGE_NUMBER		: NATURAL := 0;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page0
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage1 : if (PAGES > 1) generate
			constant PAGE_NUMBER		: NATURAL := 1;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page1
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage2 : if (PAGES > 2) generate
			constant PAGE_NUMBER		: NATURAL := 2;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page2
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage3 : if (PAGES > 3) generate
			constant PAGE_NUMBER		: NATURAL := 3;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page3
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage4 : if (PAGES > 4) generate
			constant PAGE_NUMBER		: NATURAL := 4;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page4
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage5 : if (PAGES > 5) generate
			constant PAGE_NUMBER		: NATURAL := 5;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page5
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage6 : if (PAGES > 6) generate
			constant PAGE_NUMBER		: NATURAL := 6;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page6
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
		
		genPage7 : if (PAGES > 7) generate
			constant PAGE_NUMBER		: NATURAL := 7;
			constant PAGE_INDEX			: NATURAL	:= imin(PAGES - 1, PAGE_NUMBER);
		begin
			page : main_Page7
				port map (
					Clock										=> Clock,
					Fetch										=> Fetch,
					Address									=> InstructionPointer,
					Instruction							=> Page_Instructions(PAGE_INDEX),
					
					JTAGLoader_Clock				=> JTAGLoader_Clock,
					JTAGLoader_Enable				=> JTAGLoader_Enable(PAGE_INDEX),
					JTAGLoader_Address			=> JTAGLoader_Address,
					JTAGLoader_WriteEnable	=> JTAGLoader_WriteEnable,
					JTAGLoader_DataOut			=> Pages_DataOut(PAGE_INDEX),
					JTAGLoader_DataIn				=> JTAGLoader_DataOut
				);
		end generate;
	end generate;
	genLoadFile : if (str_length(SOURCE_DIRECTORY) /= 0) generate
		genPages : for i in 0 to PAGES - 1  generate
			constant FILENAME			: STRING		:= SOURCE_DIRECTORY & str_replace(FILENAME_PATTERN, "#", INTEGER'image(i));
			
			signal Port1_Address	: UNSIGNED(InstructionPointer'range);
			signal Port2_Address	: UNSIGNED(JTAGLoader_Address'range);
			
		begin
			assert PB_VERBOSE report "Loading ROM file: '" & FILENAME & "'" severity NOTE;

			genOCROM : if (ENABLE_LOADER = FALSE) generate
				Port1_Address		<= unsigned(InstructionPointer);
			
				genericMemory : ocrom_sp
					generic map (
						A_BITS		=> 12,
						D_BITS		=> 18,
						FILENAME	=> FILENAME
					)
					port map (
						clk		=> Clock,
						ce		=> Fetch,
						a			=> Port1_Address,
						q			=> Page_Instructions(i)
					);
			end generate;
			genOCRAM : if (ENABLE_LOADER = TRUE) generate
				Port1_Address		<= unsigned(InstructionPointer);
				Port2_Address		<= unsigned(JTAGLoader_Address);
			
				genericMemory : ocram_tdp
					generic map (
						A_BITS		=> 12,
						D_BITS		=> 18,
						FILENAME	=> FILENAME
					)
					port map (
						clk1	=> Clock,
						ce1		=> Fetch,
						we1		=> '0',
						a1		=> Port1_Address,
						d1		=> (others => '0'),
						q1		=> Page_Instructions(i),
						
						clk2	=> JTAGLoader_Clock,
						ce2		=> JTAGLoader_Enable(i),
						we2		=> JTAGLoader_WriteEnable,
						a2		=> Port2_Address,
						d2		=> JTAGLoader_DataOut,
						q2		=> Pages_DataOut(i)
					);
			end generate;
		end generate;
	end generate;
	
	genNoJTAGLoader : if (ENABLE_LOADER = FALSE) generate
		JTAGLoader_Clock				<= '0';
		JTAGLoader_Enable				<= (others => '0');
		JTAGLoader_Address			<= (others => '0');
		JTAGLoader_WriteEnable	<= '0';
		JTAGLoader_DataOut			<= (others => '0');
	end generate;
	genJTAGLoader : if (ENABLE_LOADER = TRUE) generate
		signal WorkAround_Enable			: STD_LOGIC_VECTOR(PAGES - 1 downto 0);
		signal WorkAround_DataIn			: T_PB_INSTRUCTION_VECTOR(PAGES - 1 downto 0);
	begin
		JTAGLoader : JTAGLoader6
			generic map (
				C_NUM_PICOBLAZE		=> PAGES,
				C_ADDR_WIDTH			=> (others => T_PB_ADDRESS'length)
			)
			port map (
				jtag_clk				=> JTAGLoader_Clock,
				jtag_en					=> WorkAround_Enable,
				jtag_din				=> JTAGLoader_DataOut,
				jtag_addr				=> JTAGLoader_Address,
				jtag_we					=> JTAGLoader_WriteEnable,
				jtag_dout_0			=> WorkAround_DataIn(imin(PAGES - 1, 0)),
				jtag_dout_1			=> WorkAround_DataIn(imin(PAGES - 1, 1)),
				jtag_dout_2			=> WorkAround_DataIn(imin(PAGES - 1, 2)),
				jtag_dout_3			=> WorkAround_DataIn(imin(PAGES - 1, 3)),
				jtag_dout_4			=> WorkAround_DataIn(imin(PAGES - 1, 4)),
				jtag_dout_5			=> WorkAround_DataIn(imin(PAGES - 1, 5)),
				jtag_dout_6			=> WorkAround_DataIn(imin(PAGES - 1, 6)),
				jtag_dout_7			=> WorkAround_DataIn(imin(PAGES - 1, 7)),
				picoblaze_reset	=> JTAGLoader_PB_Reset
			);
		
		-- work around for a bug in JTAGLoader.exe
		WorkAround_DataIn		<= reverse(Pages_DataOut);
		JTAGLoader_Enable		<= reverse(WorkAround_Enable);
	end generate;
end;
