library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity HUC6270 is
	port( 
		CLK		: in std_logic;
		RST_N		: in std_logic;
		CLR_MEM	: in std_logic;
		  
		CPU_CE	: in std_logic;
		A			: in std_logic_vector(1 downto 0);
		DI			: in std_logic_vector(7 downto 0);
		DO			: out std_logic_vector(7 downto 0);
		CS_N		: in std_logic; 
		WR_N  	: in std_logic;
		RD_N  	: in std_logic;
		BUSY_N	: out std_logic;
		IRQ_N		: out std_logic;
		
		DCK_CE	: in std_logic;
		DCC		: in std_logic_vector(1 downto 0);
		HS_F		: in std_logic;
		HS_R		: in std_logic;
		VS_F		: in std_logic;
		VS_R		: in std_logic;
		VD			: out std_logic_vector(8 downto 0);
		BORDER	: out std_logic;
		GRID		: out std_logic_vector(1 downto 0);
		SP64		: in std_logic := '0';

		RAM_A		: out std_logic_vector(15 downto 0);
		RAM_DI	: in std_logic_vector(15 downto 0);
		RAM_DO	: out std_logic_vector(15 downto 0);
		RAM_WE	: out std_logic;
		
		BG_EN		: in std_logic;
		SPR_EN	: in std_logic;
		
		IW_DBG 				: out std_logic_vector(1 downto 0);
		VM_DBG 				: out std_logic_vector(1 downto 0);
		CM_DBG 				: out std_logic;
		SCREEN_DBG 			: out std_logic_vector(2 downto 0);
		SOUR_DBG 			: out std_logic_vector(15 downto 0);
		DESR_DBG 			: out std_logic_vector(15 downto 0);
		LENR_DBG 			: out std_logic_vector(15 downto 0);
		SPR_X_DBG    		: out std_logic_vector(9 downto 0);
		SPR_Y_DBG    		: out std_logic_vector(9 downto 0);
		SPR_PC_DBG			: out std_logic_vector(9 downto 0);
		SPR_CG_DBG     	: out std_logic;
		SPR_PAL_DBG			: out std_logic_vector(3 downto 0);
		SPR_PRIO_DBG		: out std_logic; 
		SPR_CGX_DBG			: out std_logic; 
		SPR_CGY_DBG     	: out std_logic_vector(1 downto 0);
		SPR_HF_DBG     	: out std_logic;
		SPR_VF_DBG     	: out std_logic;
		HDS_END_POS_DBG 	: out unsigned(6 downto 0);
		HDISP_END_POS_DBG : out unsigned(6 downto 0);
		HSW_DBG				: out std_logic_vector(4 downto 0);
		HDS_DBG				: out std_logic_vector(6 downto 0);
		HDE_DBG 				: out std_logic_vector(6 downto 0);
		VDS_END_POS_DBG 	: out unsigned(9 downto 0);
		VDISP_END_POS_DBG : out unsigned(9 downto 0);
		VDE_END_POS_DBG 	: out unsigned(9 downto 0)
	);
end HUC6270;

architecture rtl of HUC6270 is

	--registers
	type reg_t is array (0 to 31) of std_logic_vector(15 downto 0);
	signal REGS				: reg_t;
	signal AR				: std_logic_vector(4 downto 0);
	signal VRR				: std_logic_vector(15 downto 0);
	alias MAWR				: std_logic_vector(15 downto 0) is REGS(0);
	alias MARR				: std_logic_vector(15 downto 0) is REGS(1);
	alias VWR				: std_logic_vector(15 downto 0) is REGS(2);
	alias RCR				: std_logic_vector(9 downto 0) is REGS(6)(9 downto 0);
	alias BXR				: std_logic_vector(9 downto 0) is REGS(7)(9 downto 0);
	alias BYR				: std_logic_vector(8 downto 0) is REGS(8)(8 downto 0);
	alias HSR_HSW			: std_logic_vector(4 downto 0) is REGS(10)(4 downto 0);
	alias HSR_HDS			: std_logic_vector(6 downto 0) is REGS(10)(14 downto 8);
	alias HDR_HDW			: std_logic_vector(6 downto 0) is REGS(11)(6 downto 0);
	alias HDR_HDE			: std_logic_vector(6 downto 0) is REGS(11)(14 downto 8);
	alias VPR_VSW			: std_logic_vector(4 downto 0) is REGS(12)(4 downto 0);
	alias VPR_VDS			: std_logic_vector(7 downto 0) is REGS(12)(15 downto 8);
	alias VDR_VDW			: std_logic_vector(8 downto 0) is REGS(13)(8 downto 0);
	alias VCR_VCR			: std_logic_vector(7 downto 0) is REGS(14)(7 downto 0);
	alias DCR_DSC			: std_logic is REGS(15)(0);
	alias DCR_DVC			: std_logic is REGS(15)(1);
	alias DCR_SID			: std_logic is REGS(15)(2);
	alias DCR_DID			: std_logic is REGS(15)(3);
	alias DCR_DSR			: std_logic is REGS(15)(4);
	alias SOUR				: std_logic_vector(15 downto 0) is REGS(16);
	alias DESR				: std_logic_vector(15 downto 0) is REGS(17);
	alias LENR				: std_logic_vector(15 downto 0) is REGS(18);
	alias DVSSR				: std_logic_vector(15 downto 0) is REGS(19);
	
	alias CR_IE_CC			: std_logic is REGS(5)(0);
	alias CR_IE_OC			: std_logic is REGS(5)(1);
	alias CR_IE_RC			: std_logic is REGS(5)(2);
	alias CR_IE_VC			: std_logic is REGS(5)(3);
	alias CR_SB				: std_logic is REGS(5)(6);
	alias CR_BB				: std_logic is REGS(5)(7);
	alias CR_IW				: std_logic_vector(1 downto 0) is REGS(5)(12 downto 11);
	alias MWR_VM			: std_logic_vector(1 downto 0) is REGS(9)(1 downto 0);
	alias MWR_SM			: std_logic_vector(1 downto 0) is REGS(9)(3 downto 2);
	alias MWR_SCREEN		: std_logic_vector(2 downto 0) is REGS(9)(6 downto 4);
	alias MWR_CM			: std_logic is REGS(9)(7);
	
	--internal registers
	signal VM				: std_logic_vector(1 downto 0);
	signal SM				: std_logic_vector(1 downto 0);
	signal SCREEN			: std_logic_vector(2 downto 0);
	signal CM				: std_logic;
	signal BB				: std_logic;
	signal SB				: std_logic;
	
	--I/O 
	signal IRQ_DMA			: std_logic;
	signal IRQ_COL			: std_logic;
	signal IRQ_OVF			: std_logic;
	signal IRQ_RCR			: std_logic;
	signal IRQ_DMAS		: std_logic;
	signal IRQ_VBL			: std_logic;
	signal IO_BYRL_SET	: std_logic;
	signal IO_BYRH_SET	: std_logic;
	signal CPU_BUSY		: std_logic;
	signal CPU_BUSY_CLEAR: std_logic;
	signal CPURD_PEND 	: std_logic;
	signal CPUWR_PEND		: std_logic;
	signal CPURD_PEND2 	: std_logic;
	signal CPUWR_PEND2	: std_logic;
	signal CPURD_EXEC		: std_logic;
	signal CPUWR_EXEC		: std_logic;
	signal CPU_VRAM_ADDR	: std_logic_vector(15 downto 0);
	signal CPU_VRAM_DATA	: std_logic_vector(15 downto 0);
	signal DMA_PEND		: std_logic;
	signal DMA_WR			: std_logic;
	signal DMA_BUF			: std_logic_vector(15 downto 0);
	signal DMA_EXEC		: std_logic;
	signal DMAS_PEND		: std_logic;
	signal DMAS_EXEC		: std_logic;
	signal DMAS_SAT_ADDR	: std_logic_vector(7 downto 0);
	signal DMAS_VRAM_ADDR: std_logic_vector(15 downto 0);
	signal DMAS_SAT_WE	: std_logic;
	signal BYRL_SET		: std_logic;
	signal BYRH_SET		: std_logic;
	signal VDISP_OLD		: std_logic;
	signal RD_N_OLD		: std_logic;
	signal SR_LATCH		: std_logic_vector(6 downto 0);
	
	--H/V counters
	signal DOT_CNT			: unsigned(2 downto 0);
	signal TILE_CNT		: unsigned(6 downto 0);
	signal DISP_CNT		: unsigned(9 downto 0);
	signal DISP_CNT_INC 	: std_logic;
	signal DOTS_REMAIN	: unsigned(2 downto 0);
	signal RC_CNT			: unsigned(9 downto 0);
	signal BURST			: std_logic;
	signal HSW_END_POS 	: unsigned(6 downto 0);
	signal HDS_END_POS 	: unsigned(6 downto 0);
	signal HDISP_END_POS : unsigned(6 downto 0);
	signal VDS_END_POS 	: unsigned(9 downto 0);
	signal VDISP_END_POS : unsigned(9 downto 0);
	signal VDE_END_POS 	: unsigned(9 downto 0);
	signal VSW_END_POS 	: unsigned(9 downto 0);
	signal HSW				: std_logic_vector(4 downto 0);
	signal HDS				: std_logic_vector(6 downto 0);
	signal HDW				: std_logic_vector(6 downto 0);
	signal HDE				: std_logic_vector(6 downto 0);
	signal VSW				: std_logic_vector(4 downto 0);
	signal VDS				: std_logic_vector(7 downto 0);
	signal VDW				: std_logic_vector(8 downto 0);
	signal VDE				: std_logic_vector(7 downto 0);
	signal HDISP			: std_logic;
	signal VDISP			: std_logic;
	
	--rendering
	type slot_t is ( CPU, BAT, CG0, CG1, SG0, SG1, SG2, SG3, NOP );
	signal SLOT				: slot_t;
	signal DISP 			: std_logic_vector(7 downto 0);
	signal BORD 			: std_logic_vector(7 downto 0);
	signal GRID_BG 		: std_logic_vector(7 downto 0);
	signal GRID_SP 		: std_logic_vector(7 downto 0);
	signal BG_X				: unsigned(9 downto 0);
	signal OFS_X			: unsigned(9 downto 0);
	signal OFS_Y			: unsigned(8 downto 0);
	signal BG_OUT_X		: unsigned(9 downto 0);
	signal BG_FETCH		: std_logic;
	signal BG_OUT 			: std_logic;
	signal BG_BAT_CC 		: std_logic_vector(11 downto 0);
	signal BG_BAT_COL 	: std_logic_vector(3 downto 0);
	signal BG_CH0 			: std_logic_vector(7 downto 0);
	signal BG_CH1 			: std_logic_vector(7 downto 0);
	signal BG_SR0 			: std_logic_vector(15 downto 0);
	signal BG_SR1 			: std_logic_vector(15 downto 0);
	signal BG_SR2 			: std_logic_vector(15 downto 0);
	signal BG_SR3 			: std_logic_vector(15 downto 0);
	type ShiftRegColor_t is array (0 to 1) of std_logic_vector(3 downto 0);
	signal BG_SRC 			: ShiftRegColor_t;
	type BGColorArray_t is array (0 to 7) of std_logic_vector(7 downto 0);
	signal BG_COLOR 		: BGColorArray_t;
	signal BG_RAM_ADDR	: std_logic_vector(15 downto 0);
	
	signal SPR_FETCH		: std_logic;
	signal SPR_FETCH_EN	: std_logic;
	signal SPR_CH0 		: std_logic_vector(15 downto 0);
	signal SPR_CH1 		: std_logic_vector(15 downto 0);
	signal SPR_CH2 		: std_logic_vector(15 downto 0);
	signal SPR_CH3 		: std_logic_vector(15 downto 0);
	signal SPR_RAM_ADDR	: std_logic_vector(15 downto 0);
	
	type Sprite_r is record
		X    		: std_logic_vector(9 downto 0);
		Y    		: std_logic_vector(9 downto 0);
		PC			: std_logic_vector(9 downto 0);
		CG     	: std_logic;
		PAL		: std_logic_vector(3 downto 0);
		PRIO		: std_logic; 
		CGX		: std_logic; 
		CGY     	: std_logic_vector(1 downto 0);
		HF     	: std_logic;
		VF     	: std_logic;
		SPR0    	: std_logic;
		TOP    	: std_logic;
		BOTTOM   : std_logic;
	end record;
	type SpriteCache_t is array (0 to 63) of Sprite_r;
	signal SPR_CACHE		: SpriteCache_t;
	signal SPR				: Sprite_r;
	signal SPR_EVAL 		: std_logic;
	signal SPR_EVAL_X		: unsigned(7 downto 0);
	signal SPR_EVAL_DONE : std_logic;
	signal SPR_EVAL_FULL : std_logic;
	signal SPR_EVAL_CNT	: unsigned(6 downto 0);
	signal SPR_FIND		: std_logic; 
	signal SPR_Y			: std_logic_vector(9 downto 0);
	signal SPR_X			: std_logic_vector(9 downto 0);
	signal SPR_PC			: std_logic_vector(9 downto 0);
	signal SPR_CG    		: std_logic;
	signal SPR_FETCH_CNT	: unsigned(6 downto 0);
	signal SPR_FETCH_DONE: std_logic; 
	signal SPR_FETCH_W   : std_logic;
	signal SPR_OUT_X		: unsigned(9 downto 0);

	signal SPR_CE			: std_logic;
	signal SPR_MAX			: integer range 0 to 63;
	signal FETCH_DOT		: unsigned(2 downto 0);
	signal FETCH_CE		: std_logic;
	signal FDOT_CNT		: unsigned(2 downto 0);

	signal SPR_TILE_X    : unsigned(9 downto 0);
	signal SPR_TILE_P0	: std_logic_vector(15 downto 0);
	signal SPR_TILE_P1	: std_logic_vector(15 downto 0);
	signal SPR_TILE_P2	: std_logic_vector(15 downto 0);
	signal SPR_TILE_P3	: std_logic_vector(15 downto 0);
	signal SPR_TILE_HF 	: std_logic;
	signal SPR_TILE_PAL	: std_logic_vector(3 downto 0); 
	signal SPR_TILE_PRIO : std_logic;
	signal SPR_TILE_SPR0 : std_logic;
	signal SPR_TILE_LEFT : std_logic;
	signal SPR_TILE_RIGTH: std_logic;
	signal SPR_TILE_TOP 	: std_logic;
	signal SPR_TILE_BOTTOM: std_logic;
	signal SPR_TILE_SAVE : std_logic;
	signal SPR_TILE_PIX_SET  : std_logic_vector(559 downto 0);
	signal SPR_TILE_SPR0_SET : std_logic_vector(559 downto 0);
	signal SPR_TILE_FRAME    : std_logic_vector(559 downto 0);
	type bufArray_t is array (0 to 1) of std_logic_vector(8 downto 0);
	signal SPR_LINE_ADDR	: bufArray_t; 
	signal SPR_LINE_D		: bufArray_t; 
	signal SPR_LINE_Q		: bufArray_t; 
	signal SPR_LINE_WE 	: std_logic_vector(1 downto 0);
	signal SPR_LINE_CLR 	: std_logic;
	type SPColorArray_t is array (0 to 7) of std_logic_vector(8 downto 0);
	signal SPR_COLOR		: SPColorArray_t; 

	signal SAT_ADDR		: std_logic_vector(7 downto 0);
	signal SAT_Q			: std_logic_vector(15 downto 0);
	signal CLR_A			: unsigned(7 downto 0);
	signal CLR_WE			: std_logic;

begin

	process(CLK, RST_N)
	begin
		if RST_N = '0' then
			DOT_CNT <= (others=>'0');
			TILE_CNT <= (others=>'0');
			DOTS_REMAIN <= (others=>'0');
			HDW <= (others=>'0');
			HDS <= (others=>'0');
			CM <= '0';
		elsif rising_edge(CLK) then

			FETCH_CE <= not FETCH_CE;
			if FETCH_CE = '1' then
				FETCH_DOT <= FETCH_DOT + 1;
			end if;

			if SPR_FETCH = '0' then
				FETCH_CE  <= '0';
				FETCH_DOT <= (others=>'0');
			end if;

			if DCK_CE = '1' then
				DOT_CNT <= DOT_CNT + 1;
				if DOT_CNT = 7 then
					TILE_CNT <= TILE_CNT + 1;
				end if; 
				if HS_F = '1' then
					DOT_CNT <= (others=>'0');
					TILE_CNT <= (others=>'0');
					
					DOTS_REMAIN <= DOT_CNT;

					case DCC is
						when "00" => HSW <= "00011";
						when "01" => HSW <= "00100";
						when others => HSW <= "00011";
					end case;

					HDS <= HSR_HDS;
					HDW <= HDR_HDW;
					HDE <= HDR_HDE;

					CM <= MWR_CM;
				end if; 
			end if; 
		end if;
	end process;
	
	FDOT_CNT <= DOT_CNT when SP64 = '0' else FETCH_DOT;
	SPR_CE   <= DCK_CE  when SP64 = '0' else FETCH_CE;
	SPR_MAX  <= 15      when SP64 = '0' else 63;

	HSW_END_POS <= "00"&unsigned(HSW);
	HDS_END_POS <= ("00"&unsigned(HSW)) + 1 + unsigned(HDS);
	HDISP_END_POS <= ("00"&unsigned(HSW)) + 1 + unsigned(HDS) + 1 + unsigned(HDW);
	
	VSW_END_POS <= ("00000"&unsigned(VSW));
	VDS_END_POS <= ("00000"&unsigned(VSW)) + 1 + ("00"&unsigned(VDS)) + 1;
	VDISP_END_POS <= ("00000"&unsigned(VSW)) + 1 + ("00"&unsigned(VDS)) + 2 + ("0"&unsigned(VDW));
	VDE_END_POS <= ("00000"&unsigned(VSW)) + 1 + ("00"&unsigned(VDS)) + 2 + ("0"&unsigned(VDW)) + 1 + ("00"&unsigned(VDE)) - 1;
	

	process(CLK, RST_N)
	begin
		if RST_N = '0' then
			DISP_CNT <= (others=>'0');
			DISP_CNT_INC <= '0';
			VDISP <= '0';
			BURST <= '1';
			BG_FETCH <= '0';
			BG_OUT <= '0';
			RC_CNT <= "00"&x"40";
			
			VSW <= (others=>'0');
			VDS <= (others=>'0');
			VDW <= (others=>'0');
			VDE <= (others=>'0');
			VM <= (others=>'0');
			SM <= (others=>'0');
			SCREEN <= (others=>'0');
			BB <= '0';
			SB <= '0';
		elsif rising_edge(CLK) then
			if DCK_CE = '1' then
				if VS_F = '1' then
					VDISP <= '0';
					DISP_CNT <= (others=>'0');
					VSW <= VPR_VSW;
					VDS <= VPR_VDS;
					VDW <= VDR_VDW;
					VDE <= VCR_VCR;
					VM <= MWR_VM;
					SM <= MWR_SM;
					SCREEN <= MWR_SCREEN;
				else
					if TILE_CNT = HSW_END_POS and DOT_CNT = 7 then
						DISP_CNT_INC <= '1';
					end if;
					if (TILE_CNT = HDISP_END_POS and DOT_CNT = 7 and DISP_CNT_INC = '1') or (HS_F = '1' and DISP_CNT_INC = '1') then
						DISP_CNT <= DISP_CNT + 1;
						DISP_CNT_INC <= '0';
						if DISP_CNT = VSW_END_POS then
							BURST <= not (CR_SB or CR_BB);
						end if;
						if DISP_CNT = VDS_END_POS then
							VDISP <= '1';
						end if;
						if DISP_CNT = VDISP_END_POS then
							VDISP <= '0';
						end if;
						if DISP_CNT = VDE_END_POS then
							DISP_CNT <= (others=>'0');
							VSW <= VPR_VSW;
							VDS <= VPR_VDS;
							VDW <= VDR_VDW;
							VDE <= VCR_VCR;
							VM <= MWR_VM;
							SM <= MWR_SM;
							SCREEN <= MWR_SCREEN;
						end if;
					end if;
				end if;

				
				if DOT_CNT = 7 then
					if TILE_CNT = HDS_END_POS - 2 and DISP_CNT > VDS_END_POS and DISP_CNT <= VDISP_END_POS then
						BG_FETCH <= '1';
					elsif TILE_CNT = HDISP_END_POS then
						BG_FETCH <= '0';
					end if;
					
					if TILE_CNT = HDS_END_POS and DISP_CNT > VDS_END_POS and DISP_CNT <= VDISP_END_POS then
						BG_OUT <= '1';
					elsif TILE_CNT = HDISP_END_POS then
						BG_OUT <= '0';
					end if;
	
					if TILE_CNT = HDISP_END_POS and DISP_CNT = VDS_END_POS - 1 then
						RC_CNT <= "00"&x"40";
					elsif TILE_CNT = HDISP_END_POS then
						RC_CNT <= RC_CNT + 1;
					end if; 
					
					if TILE_CNT = HDS_END_POS - 3 then
						BB <= CR_BB;
						SB <= CR_SB;
					end if;
				end if;
			end if; 
		end if;
	end process;
	
	process(DOT_CNT, FDOT_CNT, DOTS_REMAIN, TILE_CNT, BURST, DMAS_EXEC, DMA_EXEC, BG_FETCH, SPR_FETCH, SPR_FETCH_EN, VM, CM, SM, SPR, BB, SP64 )
	begin
		if TILE_CNT = 0 and DOT_CNT <= DOTS_REMAIN and SP64 = '0' then
			--first several cycles in HSYNC are empty, i.e. without access the memory, N=dots%8
			SLOT <= NOP;
		elsif DMAS_EXEC = '1' then
			case DOT_CNT(1 downto 0) is
				when "00" => SLOT <= NOP;
				when "01" => SLOT <= NOP;
				when "10" => SLOT <= NOP;
				when others => SLOT <= CPU;
			end case;
		elsif DMA_EXEC = '1' then
			case DOT_CNT(1 downto 0) is
				when "00" => SLOT <= CPU;
				when "01" => SLOT <= NOP;
				when "10" => SLOT <= CPU;
				when others => SLOT <= NOP;
			end case;
		elsif BG_FETCH = '1' then
			if BB = '0' then
				--| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
				--|  CPU  |  CPU  |  CPU  |  CPU  |
				case DOT_CNT(1 downto 0) is
					when "00" => SLOT <= CPU;
					when "01" => SLOT <= NOP;
					when "10" => SLOT <= CPU;
					when others => SLOT <= NOP;
				end case;
			else
			case VM is
				when "00" => 
					case DOT_CNT(2 downto 0) is
						when "000" => SLOT <= CPU;
						when "001" => SLOT <= BAT;
						when "010" => SLOT <= CPU;
						when "011" => SLOT <= NOP;
						when "100" => SLOT <= CPU;
						when "101" => SLOT <= CG0;
						when "110" => SLOT <= CPU;
						when others => SLOT <= CG1;
					end case;
				when "01" | "10" => 
					case DOT_CNT(2 downto 0) is
						when "000" => SLOT <= NOP;
						when "001" => SLOT <= BAT;
						when "010" => SLOT <= NOP;
						when "011" => SLOT <= CPU;
						when "100" => SLOT <= NOP;
						when "101" => SLOT <= CG0;
						when "110" => SLOT <= NOP;
						when others => SLOT <= CG1;
					end case;
				when others =>
					case DOT_CNT(2 downto 0) is
						when "000" => SLOT <= NOP;
						when "001" => SLOT <= NOP;
						when "010" => SLOT <= NOP;
						when "011" => SLOT <= BAT;
						when "100" => SLOT <= NOP;
						when "101" => SLOT <= NOP;
						when "110" => SLOT <= NOP;
						when others => 
							if CM = '0' then 
								SLOT <= CG0;
							else
								SLOT <= CG1;
							end if; 
					end case;
			end case;
			end if; 
		elsif SPR_FETCH = '1' then
			if SPR_FETCH_EN = '0' then
				--if there are no partially or fully sprites in the row for fetching, 
				--then the cycles are replaced by CPU slots
				--| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
				--|  CPU  |  CPU  |  CPU  |  CPU  |
				case DOT_CNT(1 downto 0) is
					when "00" => SLOT <= CPU;
					when "01" => SLOT <= NOP;
					when "10" => SLOT <= CPU;
					when others => SLOT <= NOP;
				end case;
			else
				case SM is
					when "00" => 
						--| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
						--|SG0|SG1|SG2|SG3|SG0|SG1|SG2|SG3|
						case FDOT_CNT(1 downto 0) is
							when "00" => SLOT <= SG0;
							when "01" => SLOT <= SG1;
							when "10" => SLOT <= SG2;
							when others => SLOT <= SG3;
						end case;
					when "01" => 
						--| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
						--|  SG0  |  SG1  |  SG0  |  SG1  |
						--| (SG2) | (SG3) | (SG2) | (SG3) |
						case FDOT_CNT(1 downto 0) is
							when "01" => 
								if SPR.CG = '0' then
									SLOT <= SG0;
								else
									SLOT <= SG2;
								end if; 
							when "11" => 
								if SPR.CG = '0' then
									SLOT <= SG1;
								else
									SLOT <= SG3;
								end if; 
							when others => 
								SLOT <= NOP;
						end case;
					when "10" => 
						--| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
						--|  SG0  |  SG1  |  SG2  |  SG3  |
						case FDOT_CNT(1 downto 0) is
							when "01" => 
								if FDOT_CNT(2) = '0' then
									SLOT <= SG0;
								else
									SLOT <= SG2;
								end if; 
							when "11" => 
								if FDOT_CNT(2) = '0' then
									SLOT <= SG1;
								else
									SLOT <= SG3;
								end if; 
							when others => 
								SLOT <= NOP;
						end case;
					when others =>
						case FDOT_CNT(1 downto 0) is
							when "11" => 
								case unsigned(TILE_CNT(0 downto 0)&FDOT_CNT(2 downto 2)) is
									when "00" => SLOT <= SG0;
									when "01" => SLOT <= SG1;
									when "10" => SLOT <= SG2;
									when others => SLOT <= SG3;
								end case;
							when others => 
								SLOT <= NOP;
						end case;
				end case;
			end if; 
		else
			case DOT_CNT(1 downto 0) is
				when "00" => SLOT <= CPU;
				when "01" => SLOT <= NOP;
				when "10" => SLOT <= CPU;
				when others => SLOT <= NOP;
			end case;
		end if; 
	end process;
	
	--BG
	process(CLK, RST_N, SLOT, BG_X, OFS_Y, OFS_X, SCREEN, BG_BAT_CC)
	variable BG_OFS_X : unsigned(9 downto 0);
	variable BG_OFS_Y : unsigned(8 downto 0);
	variable NEW_OFS_Y : unsigned(8 downto 0);
	begin
		BG_OFS_X := resize(BG_X + unsigned(OFS_X), BG_OFS_X'length);
		if SCREEN(2) = '0' then
			BG_OFS_Y := "0" & OFS_Y(7 downto 0);
		else
			BG_OFS_Y := OFS_Y;
		end if;
		
		case SLOT is
			when BAT =>
				case SCREEN(1 downto 0) is
					when "00" =>	BG_RAM_ADDR <= "00000" & std_logic_vector(BG_OFS_Y(8 downto 3)) & std_logic_vector(BG_OFS_X(7 downto 3));
					when "01" =>	BG_RAM_ADDR <= "0000" & std_logic_vector(BG_OFS_Y(8 downto 3)) & std_logic_vector(BG_OFS_X(8 downto 3));
					when others =>	BG_RAM_ADDR <= "000" & std_logic_vector(BG_OFS_Y(8 downto 3)) & std_logic_vector(BG_OFS_X(9 downto 3));
				end case;
			when CG0 =>
				BG_RAM_ADDR <= BG_BAT_CC & "0" & std_logic_vector(BG_OFS_Y(2 downto 0));
			when CG1 =>
				BG_RAM_ADDR <= BG_BAT_CC & "1" & std_logic_vector(BG_OFS_Y(2 downto 0));
			when others =>
				BG_RAM_ADDR <= (others=>'0');
		end case;
				
		if RST_N = '0' then
			BG_X <= (others=>'0');
			OFS_X <= (others=>'0');
			OFS_Y <= (others=>'0');
			BG_BAT_CC <= (others=>'0');
			BG_BAT_COL <= (others=>'0');
			BG_CH0 <= (others=>'0');
			BG_CH1 <= (others=>'0');
			BG_SR0 <= (others=>'0');
			BG_SR1 <= (others=>'0');
			BG_SR2 <= (others=>'0');
			BG_SR3 <= (others=>'0');
			BG_SRC <= (others=>(others=>'0'));
		elsif rising_edge(CLK) then
			if DCK_CE = '1' then
				case SLOT is
					when BAT =>
						BG_BAT_CC <= RAM_DI(11 downto 0);
						BG_BAT_COL <= RAM_DI(15 downto 12);
					when CG0 =>
						BG_CH0 <= RAM_DI(7 downto 0);
						BG_CH1 <= RAM_DI(15 downto 8);
					when CG1 =>
					when others => null;
				end case;
				
				if SLOT = CG1 then
					if VM = "11" and CM = '0' then
						BG_SR0 <= (others=>'0');
						BG_SR1 <= (others=>'0');
					else
						BG_SR0 <= BG_SR0(7 downto 0) & BG_CH0;
						BG_SR1 <= BG_SR1(7 downto 0) & BG_CH1;
					end if;
					if VM = "11" and CM = '1' then
						BG_SR2 <= (others=>'0');
						BG_SR3 <= (others=>'0');
					else
						BG_SR2 <= BG_SR2(7 downto 0) & RAM_DI(7 downto 0);
						BG_SR3 <= BG_SR3(7 downto 0) & RAM_DI(15 downto 8);
					end if; 
					BG_SRC(1) <= BG_SRC(0); 
					BG_SRC(0) <= BG_BAT_COL;
					
					BG_X <= BG_X + 8;
				end if; 
				
				if HS_R = '1' then
					BG_X <= (others=>'0');
				end if; 
				
				if TILE_CNT = HDS_END_POS - 3 and DOT_CNT = 7 and DISP_CNT = VDS_END_POS + 1 then
					OFS_Y <= unsigned(BYR);
				elsif TILE_CNT = HDS_END_POS - 3 and DOT_CNT = 7 then
					if BYRL_SET = '1' or BYRH_SET = '1' then
						NEW_OFS_Y := unsigned(BYR);
					else
						NEW_OFS_Y := OFS_Y;
					end if;
					OFS_Y <= NEW_OFS_Y + 1;
				end if; 
				
				if TILE_CNT = HDS_END_POS - 3 and DOT_CNT = 7 then
					OFS_X <= unsigned(BXR);
				end if; 
			end if; 
		end if;
	end process;
	
	--Sprites
	DMAS_SAT_WE <= DCK_CE when DMAS_EXEC = '1' and SLOT = CPU else '0'; 
	SAT_ADDR <= std_logic_vector(SPR_EVAL_X) when CLR_WE = '0' else std_logic_vector(CLR_A);
	
	SAT : entity work.dpram generic map (8,16)
	port map(
		clock		=> CLK,
		
		data_a	=> RAM_DI,
		address_a=> DMAS_SAT_ADDR,
		wren_a	=> DMAS_SAT_WE,
		
		address_b=> SAT_ADDR,
		data_b   => (others => '0'),
		wren_b   => CLR_WE,
		q_b		=> SAT_Q
	);

	CLR_A  <= CLR_A + 1 when rising_edge(CLK);
	CLR_WE <= CLR_MEM   when rising_edge(CLK);

	SPR <= SPR_CACHE(to_integer(SPR_FETCH_CNT(5 downto 0)));
	process(CLK, RST_N, SLOT, RC_CNT, SPR, SPR_FETCH_W)
	variable SPR_H : std_logic_vector(5 downto 0);
	variable SPR_OFS_Y : unsigned(5 downto 0);
	variable SPR_LINE : unsigned(5 downto 0);
	variable SPR_TILE_N : std_logic_vector(2 downto 0);
	begin
		SPR_OFS_Y := RC_CNT(5 downto 0) - unsigned(SPR.Y(5 downto 0)) - 1;
		SPR_LINE := SPR_OFS_Y xor (5 downto 0 => SPR.VF);
		if SPR.CGX = '0' then
			SPR_TILE_N(0) := SPR.PC(0);
		else
			SPR_TILE_N(0) := SPR_FETCH_W xor SPR.HF;
		end if;
		case SPR.CGY is
			when "00" =>   SPR_TILE_N(2 downto 1) := SPR.PC(2 downto 1);
			when "01" =>   SPR_TILE_N(2 downto 1) := SPR.PC(2)   & SPR_LINE(4);
			when others => SPR_TILE_N(2 downto 1) := SPR_LINE(5) & SPR_LINE(4);
		end case;
		
		case SLOT is
			when SG0 =>
				SPR_RAM_ADDR <= SPR.PC(9 downto 3) & SPR_TILE_N & "00" & std_logic_vector(SPR_LINE(3 downto 0));
			when SG1 =>
				SPR_RAM_ADDR <= SPR.PC(9 downto 3) & SPR_TILE_N & "01" & std_logic_vector(SPR_LINE(3 downto 0));
			when SG2 =>
				SPR_RAM_ADDR <= SPR.PC(9 downto 3) & SPR_TILE_N & "10" & std_logic_vector(SPR_LINE(3 downto 0));
			when SG3 =>
				SPR_RAM_ADDR <= SPR.PC(9 downto 3) & SPR_TILE_N & "11" & std_logic_vector(SPR_LINE(3 downto 0));
			when others =>
				SPR_RAM_ADDR <= (others=>'0');
		end case;
		
		if RST_N = '0' then
			SPR_EVAL <= '0';
			SPR_EVAL_X <= (others=>'0');
			SPR_EVAL_DONE <= '0';
			SPR_EVAL_FULL <= '0';
			SPR_EVAL_CNT <= (others=>'0');
			SPR_FIND <= '0';
			SPR_CACHE <= (others=>((others=>'0'),(others=>'0'),(others=>'0'),'0',"00",'0','0',"00",'0','0','0','0','0'));
			SPR_Y <= (others=>'0');
			SPR_X <= (others=>'0');
			SPR_PC <= (others=>'0');
			SPR_CG <= '0';
			SPR_FETCH <= '0';
			SPR_FETCH_EN <= '0';
			SPR_FETCH_W <= '0';
			SPR_FETCH_DONE <= '0';
			SPR_CH0 <= (others=>'0');
			SPR_CH1 <= (others=>'0');
			SPR_CH2 <= (others=>'0');
			--SPR_CH3 <= (others=>'0');
			SPR_TILE_X <= (others=>'0');
			SPR_TILE_P0 <= (others=>'0');
			SPR_TILE_P1 <= (others=>'0');
			SPR_TILE_P2 <= (others=>'0');
			SPR_TILE_P3 <= (others=>'0');
			SPR_TILE_HF <= '0';
			SPR_TILE_PAL <= (others=>'0');
			SPR_TILE_PRIO <= '0';
			SPR_TILE_SPR0 <= '0';
			SPR_TILE_SAVE <= '0';
			IRQ_OVF <= '0';
		elsif rising_edge(CLK) then
			SPR_TILE_SAVE <= '0';
			if DCK_CE = '1' then
				if TILE_CNT = HDS_END_POS - 2 and DOT_CNT = 7 and DISP_CNT >= VDS_END_POS and DISP_CNT < VDISP_END_POS then
					SPR_EVAL <= '1';
					SPR_EVAL_X <= (others=>'0');
					SPR_EVAL_CNT <= (others=>'0');
					SPR_EVAL_DONE <= '0';
					SPR_EVAL_FULL <= '0';
					SPR_FIND <= '0';
				elsif TILE_CNT = HDISP_END_POS and DOT_CNT = 7 then
					SPR_EVAL <= '0';
				end if;
				
				if TILE_CNT = HDISP_END_POS and DOT_CNT = 7 and DISP_CNT >= VDS_END_POS and DISP_CNT < VDISP_END_POS then
					SPR_FETCH <= '1';
					SPR_FETCH_EN <= CR_SB and SPR_FIND;
					SPR_FETCH_CNT <= (others=>'0');
					SPR_FETCH_W <= '0';
					SPR_FETCH_DONE <= '0';
				elsif TILE_CNT = HDS_END_POS - 2 and DOT_CNT = 7 and DISP_CNT > VDS_END_POS and DISP_CNT <= VDISP_END_POS then
					SPR_FETCH <= '0';
				end if;

				if SPR_EVAL = '1' then
					if SPR_EVAL_DONE = '0' then
						case SPR_EVAL_X(1 downto 0) is
							when "00" =>
								SPR_Y <= SAT_Q(9 downto 0);
							when "01" =>
								SPR_X <= SAT_Q(9 downto 0);
							when "10" =>
								SPR_CG <= SAT_Q(0);
								SPR_PC <= SAT_Q(10 downto 1);
							when others =>
								SPR_H := SAT_Q(13)&(SAT_Q(13) or SAT_Q(12))&"1111";
								if RC_CNT >= unsigned(SPR_Y) and RC_CNT <= unsigned(SPR_Y) + unsigned(SPR_H) then
									SPR_FIND <= '1';
									if SPR_EVAL_FULL = '0' then
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).X <= SPR_X;
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).Y <= SPR_Y;
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).PC <= SPR_PC;
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).CG <= SPR_CG;
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).PAL <= SAT_Q(3 downto 0);
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).PRIO <= SAT_Q(7);
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).CGX <= SAT_Q(8);
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).CGY <= SAT_Q(13 downto 12);
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).HF <= SAT_Q(11);
										SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).VF <= SAT_Q(15);
										if SPR_EVAL_X(7 downto 2) = "000000" then
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).SPR0 <= '1';
										else
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).SPR0 <= '0';
										end if;
										if RC_CNT = unsigned(SPR_Y) then
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).TOP <= '1';
										else
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).TOP <= '0';
										end if;
										if RC_CNT = unsigned(SPR_Y) + unsigned(SPR_H) then
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).BOTTOM <= '1';
										else
											SPR_CACHE(to_integer(SPR_EVAL_CNT(5 downto 0))).BOTTOM <= '0';
										end if;
										
										SPR_EVAL_CNT <= SPR_EVAL_CNT + 1;
										if SPR_EVAL_CNT = SPR_MAX then
											SPR_EVAL_FULL <= '1';
										end if;
									else
										if CR_IE_OC = '1' then
											IRQ_OVF <= '1';
										end if;
									end if; 
								end if; 
						end case;
						SPR_EVAL_X <= SPR_EVAL_X + 1;
						if SPR_EVAL_X = x"FF" then
							SPR_EVAL_DONE <= '1';
						end if; 
					end if; 
				end if; 
			end if;

			if SPR_CE = '1' then
				if SPR_FETCH = '1' then
					if SPR_FETCH_DONE = '0' and SPR_FIND = '1' then
						case SLOT is
							when SG0 =>
								SPR_CH0 <= RAM_DI;
							when SG1 =>
								SPR_CH1 <= RAM_DI;
							when SG2 =>
								SPR_CH2 <= RAM_DI;
							when SG3 =>
								--SPR_CH3 <= RAM_DI;
							when others => null;
						end case;
						
						if (SM = "01" and SPR.CG = '0' and SLOT = SG1) or SLOT = SG3 then
							SPR_FETCH_W <= '1';
							if SPR_FETCH_W = SPR.CGX then
								SPR_FETCH_W <= '0';
								if SPR_FETCH_CNT = SPR_EVAL_CNT - 1 then
									SPR_FETCH_DONE <= '1';
									SPR_FETCH_EN <= '0';
								else
									SPR_FETCH_CNT <= SPR_FETCH_CNT + 1;
								end if; 
							end if; 
							
							if SM = "01" and SPR.CG = '0' then
								SPR_TILE_P0 <= SPR_CH0;
								SPR_TILE_P1 <= RAM_DI;
								SPR_TILE_P2 <= (others=>'0');
								SPR_TILE_P3 <= (others=>'0');
							elsif SM = "01" and SPR.CG = '1' then
								SPR_TILE_P0 <= (others=>'0');
								SPR_TILE_P1 <= (others=>'0');
								SPR_TILE_P2 <= SPR_CH2;
								SPR_TILE_P3 <= RAM_DI;
							else
								SPR_TILE_P0 <= SPR_CH0;
								SPR_TILE_P1 <= SPR_CH1;
								SPR_TILE_P2 <= SPR_CH2;
								SPR_TILE_P3 <= RAM_DI;
							end if;
							SPR_TILE_X <= unsigned(SPR.X) - 32 + (SPR_FETCH_W&"0000");
							SPR_TILE_HF <= SPR.HF;
							SPR_TILE_PAL <= SPR.PAL;
							SPR_TILE_PRIO <= SPR.PRIO;
							SPR_TILE_SPR0 <= SPR.SPR0;
							SPR_TILE_SAVE <= '1';
							
							SPR_TILE_LEFT <= not SPR.CGX or not SPR_FETCH_W;
							SPR_TILE_RIGTH <= not SPR.CGX or SPR_FETCH_W;
							SPR_TILE_TOP <= SPR.TOP;
							SPR_TILE_BOTTOM <= SPR.BOTTOM;
						end if;
					end if;
				end if;
			end if; 
			
			if A = "00" and CS_N = '0' and RD_N = '0' and CPU_CE = '1' then
				IRQ_OVF <= '0';						
			end if; 
		end if;
	end process;
	
	process(CLK, RST_N)
	variable COLOR : std_logic_vector(3 downto 0);
	variable SPR_LINE_X : unsigned(9 downto 0);
	variable N : unsigned(3 downto 0);
	variable SPR_TILE_PIX : unsigned(3 downto 0);
	
	begin
		if RST_N = '0' then
			SPR_TILE_PIX := (others=>'0');
			SPR_LINE_WE <= (others=>'0');
			SPR_TILE_PIX_SET <= (others=>'0');
			SPR_TILE_SPR0_SET <= (others=>'0');
			SPR_OUT_X <= (others=>'0');
			SPR_LINE_CLR <= '0';
			IRQ_COL <= '0';
		elsif rising_edge(CLK) then
			SPR_LINE_WE <= (others=>'0');
			if SPR_TILE_SAVE = '1' or SPR_TILE_PIX /= 0 then
				for i in 0 to 1 loop
					N := SPR_TILE_PIX xor (3 downto 0 => not SPR_TILE_HF);
					COLOR := SPR_TILE_P3(to_integer(N)) & SPR_TILE_P2(to_integer(N)) & SPR_TILE_P1(to_integer(N)) & SPR_TILE_P0(to_integer(N));
					SPR_LINE_X := SPR_TILE_X + SPR_TILE_PIX;
					if SPR_LINE_X(9 downto 8) /= "11" and COLOR /= "0000" then
						if SPR_TILE_PIX_SET(to_integer(SPR_LINE_X)) = '0' then
							SPR_LINE_D(to_integer(SPR_LINE_X(0 downto 0))) <= SPR_TILE_PRIO & SPR_TILE_PAL & COLOR;
							SPR_LINE_ADDR(to_integer(SPR_LINE_X(0 downto 0))) <= std_logic_vector(SPR_LINE_X(9 downto 1));
							SPR_LINE_WE(to_integer(SPR_LINE_X(0 downto 0))) <= '1';
							SPR_TILE_PIX_SET(to_integer(SPR_LINE_X)) <= '1';
							SPR_TILE_SPR0_SET(to_integer(SPR_LINE_X)) <= SPR_TILE_SPR0;
						end if;
						if SPR_TILE_SPR0_SET(to_integer(SPR_LINE_X)) = '1' then
							if CR_IE_CC = '1' then
								IRQ_COL <= '1';
							end if;
						end if; 
					end if;

					if (SPR_TILE_PIX = 0 and SPR_TILE_LEFT = '1') or (SPR_TILE_PIX = 15 and SPR_TILE_RIGTH = '1') or 
						SPR_TILE_TOP = '1' or SPR_TILE_BOTTOM = '1' then
						SPR_TILE_FRAME(to_integer(SPR_LINE_X)) <= '1';
					end if; 

					SPR_TILE_PIX := SPR_TILE_PIX + 1;
				end loop;
			end if; 
			
			if DCK_CE = '1' then
				if TILE_CNT = HDS_END_POS and DOT_CNT = 7 then
					SPR_OUT_X <= (others=>'0');
					SPR_LINE_CLR <= '1';
				elsif TILE_CNT = HDISP_END_POS and DOT_CNT = 7 then
					SPR_LINE_CLR <= '0';
				end if;
				
				if SPR_LINE_CLR = '1' then
					SPR_TILE_PIX_SET(to_integer(SPR_OUT_X)) <= '0';
					SPR_TILE_SPR0_SET(to_integer(SPR_OUT_X)) <= '0';
					SPR_TILE_FRAME(to_integer(SPR_OUT_X)) <= '0';
					SPR_OUT_X <= SPR_OUT_X + 1;
				end if;
			end if;
			
			if A = "00" and CS_N = '0' and RD_N = '0' and CPU_CE = '1' then
				IRQ_COL <= '0';
			end if; 
		end if;
	end process;
	
	SPR_LINE_BUF0 : entity work.dpram generic map (9,9)
	port map(
		clock		=> CLK,

		address_a=> SPR_LINE_ADDR(0),
		data_a	=> SPR_LINE_D(0),
		wren_a	=> SPR_LINE_WE(0),

		address_b=> std_logic_vector(SPR_OUT_X(9 downto 1)),
		wren_b	=> SPR_LINE_CLR and DCK_CE and not SPR_OUT_X(0),
		q_b		=> SPR_LINE_Q(0)
	);
	
	SPR_LINE_BUF1 : entity work.dpram generic map (9,9)
	port map(
		clock		=> CLK,

		address_a=> SPR_LINE_ADDR(1),
		data_a	=> SPR_LINE_D(1),
		wren_a	=> SPR_LINE_WE(1),

		address_b=> std_logic_vector(SPR_OUT_X(9 downto 1)),
		wren_b	=> SPR_LINE_CLR and DCK_CE and SPR_OUT_X(0),
		q_b		=> SPR_LINE_Q(1)
	);

	process(CLK, RST_N)
	variable PX : unsigned(3 downto 0);
	variable GX,GY : unsigned(2 downto 0);
	begin
		if RST_N = '0' then
			BG_OUT_X <= (others=>'0');
			BG_COLOR <= (others=>(others=>'0'));
			SPR_COLOR <= (others=>(others=>'0'));
			DISP <= (others=>'0');
			BORD <= (others=>'1');
			GRID_BG <= (others=>'0');
			GRID_SP <= (others=>'0');
		elsif rising_edge(CLK) then
			if DCK_CE = '1' then
				BG_COLOR(7) <= (others=>'0');
				SPR_COLOR(7) <= (others=>'0');
				DISP(7) <= '0';
				BORD(7) <= '1';
				GRID_BG(7) <= '0';
				GRID_SP(7) <= '0';
				if HS_F = '1' then
					BG_OUT_X <= (others=>'0');
				elsif BG_OUT = '1' and VDISP = '1' then
					PX := not (("0"&BG_OUT_X(2 downto 0)) + ("0"&unsigned(OFS_X(2 downto 0))));
					BG_COLOR(7) <= BG_SRC(to_integer(PX(3 downto 3))) & 
										BG_SR3(to_integer(PX(3 downto 0))) & 
										BG_SR2(to_integer(PX(3 downto 0))) & 
										BG_SR1(to_integer(PX(3 downto 0))) & 
										BG_SR0(to_integer(PX(3 downto 0)));
					SPR_COLOR(7) <= SPR_LINE_Q(to_integer(SPR_OUT_X(0 downto 0)));
					DISP(7) <= not BURST;
					BORD(7) <= '0';
					
					GX := BG_OUT_X(2 downto 0) + unsigned(OFS_X(2 downto 0));
					GY := OFS_Y(2 downto 0);
					if GX = 7 or GY = 7 then
						GRID_BG(7) <= '1';
					end if; 
					
					if SPR_TILE_FRAME(to_integer(unsigned(BG_OUT_X))) = '1' then
						GRID_SP(7) <= '1';
					end if; 
					
					BG_OUT_X <= BG_OUT_X + 1;
				end if; 
				
				for i in 0 to 6 loop
					BG_COLOR(i) <= BG_COLOR(i+1);
					SPR_COLOR(i) <= SPR_COLOR(i+1);
					DISP(i) <= DISP(i+1);
					BORD(i) <= BORD(i+1);
					GRID_BG(i) <= GRID_BG(i+1);
					GRID_SP(i) <= GRID_SP(i+1);
				end loop;
			end if; 
		end if;
	end process;

	BORDER <= BORD(0);
	GRID <= GRID_SP(0)&GRID_BG(0);
	

	process(BG_OUT, DISP, BG_COLOR, SPR_COLOR, BB, SB, BG_EN, SPR_EN)
	begin
		if DISP(0) = '0' then
			VD <= "1"&x"00";
		elsif SPR_COLOR(0)(3 downto 0) /= "0000" and SPR_COLOR(0)(8) = '1' and SB = '1' and SPR_EN = '1' then
			VD <= "1" & SPR_COLOR(0)(7 downto 0);
		elsif BG_COLOR(0)(3 downto 0) /= "0000" and BB = '1' and BG_EN = '1' then
			VD <= "0" & BG_COLOR(0);
		elsif SPR_COLOR(0)(3 downto 0) /= "0000" and SPR_COLOR(0)(8) = '0' and SB = '1' and SPR_EN = '1' then
			VD <= "1" & SPR_COLOR(0)(7 downto 0);
		else
			VD <= "0"&x"00";
		end if; 
	end process;
		
	
	process(CLK, RST_N)
	begin
		if RST_N = '0' then
			AR <= (others=>'0');
			REGS <= (others=>(others=>'0'));
			
			CPURD_PEND <= '0';
			CPUWR_PEND <= '0';
			CPURD_PEND2 <= '0';
			CPUWR_PEND2 <= '0';
			DMA_PEND <= '0';
			DMAS_PEND <= '0';
			DMAS_SAT_ADDR <= (others=>'0');
			DMAS_VRAM_ADDR <= (others=>'0');
			CPU_BUSY <= '0';
			IRQ_DMA <= '0';
			IRQ_RCR <= '0';
			IRQ_DMAS <= '0';
			IRQ_VBL <= '0';
			IO_BYRL_SET <= '0';
			IO_BYRH_SET <= '0';
						
			CPURD_EXEC <= '0';
			CPUWR_EXEC <= '0';
			DMA_EXEC <= '0';
			DMAS_EXEC <= '0';
			DMA_WR <= '0';
			BYRL_SET <= '0';
			BYRH_SET <= '0';
			VDISP_OLD <= '0';
		elsif rising_edge(CLK) then
			if CS_N = '0' and WR_N = '0' and CPU_CE = '1' then
				case A is
					when "00" =>
						AR <= DI(4 downto 0);
						
					when "10" =>
						case AR is
							when "00000" =>
								REGS(0)(7 downto 0) <= DI;
							when "00001" =>
								if CPU_BUSY = '0' then
									REGS(1)(7 downto 0) <= DI;
								end if;
							when "00010" =>
								if CPU_BUSY = '0' then
									REGS(2)(7 downto 0) <= DI;
								end if;
							when "01000" =>
								IO_BYRL_SET <= '1';
							when others => null;
						end case;
						if AR >= "00011" then
							REGS(to_integer(unsigned(AR)))(7 downto 0) <= DI;
						end if;
						
					when "11" =>
						case AR is
							when "00000" =>
								REGS(0)(15 downto 8) <= DI;
							when "00001" =>
								if CPU_BUSY = '0' then
									REGS(1)(15 downto 8) <= DI;
									CPURD_PEND <= '1';
									CPU_BUSY <= '1';
								end if;
							when "00010" =>
								if CPU_BUSY = '0' then
									REGS(2)(15 downto 8) <= DI;
									CPUWR_PEND <= '1';
									CPU_BUSY <= '1';
								end if;
							when "01000" =>
								IO_BYRH_SET <= '1';
							when "10010" =>
								DMA_PEND <= '1';
							when "10011" =>
								DMAS_PEND <= '1';
							when others => null;
						end case;
						if AR >= "00011" then
							REGS(to_integer(unsigned(AR)))(15 downto 8) <= DI;
						end if;
						
					when others => null;
				end case;
			elsif CS_N = '0' and RD_N = '0' and CPU_CE = '1' then
				case A is
					when "00" =>
						if SR_LATCH(5) = '1' then
							IRQ_VBL <= '0';	
						end if;
						if SR_LATCH(4) = '1' then
							IRQ_DMA <= '0';
						end if;
						if SR_LATCH(3) = '1' then
							IRQ_DMAS <= '0';
						end if;
						if SR_LATCH(2) = '1' then
							IRQ_RCR <= '0';
						end if;
					when "10" =>
					when "11" =>
						if AR = "0" & x"2" then
							CPURD_PEND <= '1';
							CPU_BUSY <= '1';						
						end if;
					when others => null;
				end case;
			end if; 
			
			if DCK_CE = '1' then
				if DOT_CNT(0) = '1' then
					if CPUWR_PEND = '1' then
						CPUWR_PEND <= '0';
						CPUWR_PEND2 <= '1';
					elsif CPUWR_PEND2 = '1' then
						CPUWR_PEND2 <= '0';
						CPU_VRAM_ADDR <= MAWR;
						CPU_VRAM_DATA <= VWR;
						case CR_IW is
							when "00" => MAWR <= std_logic_vector(unsigned(MAWR) + 1);
							when "01" => MAWR <= std_logic_vector(unsigned(MAWR) + 32);
							when "10" => MAWR <= std_logic_vector(unsigned(MAWR) + 64);
							when others => MAWR <= std_logic_vector(unsigned(MAWR) + 128);
						end case;
						CPUWR_EXEC <= '1';
					end if; 
					
					if CPURD_PEND = '1' then
						CPURD_PEND <= '0';
						CPURD_PEND2 <= '1';
					elsif CPURD_PEND2 = '1' then
						CPURD_PEND2 <= '0';
						CPU_VRAM_ADDR <= MARR;
						case CR_IW is
							when "00" => MARR <= std_logic_vector(unsigned(MARR) + 1);
							when "01" => MARR <= std_logic_vector(unsigned(MARR) + 32);
							when "10" => MARR <= std_logic_vector(unsigned(MARR) + 64);
							when others => MARR <= std_logic_vector(unsigned(MARR) + 128);
						end case;
						CPURD_EXEC <= '1';
					end if; 
				end if; 
				
				if DMA_PEND = '1' and (BURST = '1' or VDISP = '0') then
					DMA_PEND <= '0';
					DMA_EXEC <= '1';
				elsif DMA_EXEC = '1' and BURST = '0' and VDISP = '1' then
					DMA_EXEC <= '0';
				end if; 
			
				if SLOT = CPU then
					if DMAS_EXEC = '1' then
						DMAS_SAT_ADDR <= std_logic_vector(unsigned(DMAS_SAT_ADDR) + 1);
						DMAS_VRAM_ADDR <= std_logic_vector(unsigned(DMAS_VRAM_ADDR) + 1);
						if DMAS_SAT_ADDR = x"FF" then
							DMAS_EXEC <= '0';
							if DCR_DSC = '1' then 
								IRQ_DMAS <= '1';
							end if;
						end if;
					elsif DMA_EXEC = '1' then
						if DMA_WR = '0' then
							DMA_BUF <= RAM_DI;
							DMA_WR <= '1';
						else
							if DCR_SID = '0' then
								SOUR <= std_logic_vector(unsigned(SOUR) + 1);
							else
								SOUR <= std_logic_vector(unsigned(SOUR) - 1);
							end if;
							if DCR_DID = '0' then
								DESR <= std_logic_vector(unsigned(DESR) + 1);
							else
								DESR <= std_logic_vector(unsigned(DESR) - 1);
							end if;
							LENR <= std_logic_vector(unsigned(LENR) - 1);
							if LENR = x"0000" then
								DMA_EXEC <= '0';
								if DCR_DVC = '1' then 
									IRQ_DMA <= '1';
								end if;
							end if;
							DMA_WR <= '0';
						end if;
					elsif CPUWR_EXEC = '1' then
						CPUWR_EXEC <= '0';
						CPU_BUSY_CLEAR <= '1';
					elsif CPURD_EXEC = '1' then
						CPURD_EXEC <= '0';
						VRR <= RAM_DI;
						CPU_BUSY_CLEAR <= '1';
					end if;
				end if;
				
				if CPU_BUSY_CLEAR = '1' then
					CPU_BUSY_CLEAR <= '0';
					CPU_BUSY <= '0';
				end if;
				
				if TILE_CNT = HDS_END_POS - 2 and DOT_CNT = 7 then
					VDISP_OLD <= VDISP;
					if VDISP = '0' and VDISP_OLD = '1' then
						if CR_IE_VC = '1' then
							IRQ_VBL <= '1';
						end if;
						if DCR_DSR = '1' or DMAS_PEND = '1' then
							DMAS_PEND <= '0';
							DMAS_VRAM_ADDR <= DVSSR;
							DMAS_SAT_ADDR <= (others=>'0');
							DMAS_EXEC <= '1';
						end if;
					end if;
				end if;
				
				if TILE_CNT = HDISP_END_POS and DOT_CNT = 1 and RC_CNT = unsigned(RCR) and CR_IE_RC = '1' then
					IRQ_RCR <= '1';
				end if;
				
				--sync BYRx latches to dot clock
				if IO_BYRL_SET = '1' then
					IO_BYRL_SET <= '0';
					BYRL_SET <= '1';
				end if;
				if IO_BYRH_SET = '1' then
					IO_BYRH_SET <= '0';
					BYRH_SET <= '1';
				end if;
				
				if TILE_CNT = HDS_END_POS - 3 and DOT_CNT = 7 then
					BYRL_SET <= '0';
					BYRH_SET <= '0';
				end if; 
			end if;
		end if;
	end process;
	
	process(CLK, RST_N)
	begin
		if RST_N = '0' then
			SR_LATCH <= (others=>'0');
			RD_N_OLD <= '1';
		elsif rising_edge(CLK) then
			RD_N_OLD <= RD_N;
			if RD_N = '0' and RD_N_OLD = '1' then
				SR_LATCH <= CPU_BUSY & IRQ_VBL & IRQ_DMA & IRQ_DMAS & IRQ_RCR & IRQ_OVF & IRQ_COL;
			end if;
		end if;
	end process;

	process(A, SR_LATCH, VRR)
	begin
		DO <= x"00";
		case A is
			when "00" =>
				DO <= "0" & SR_LATCH;
			when "10" =>
				DO <= VRR(7 downto 0);
			when "11" =>
				DO <= VRR(15 downto 8);
			when others => null;
		end case;
	end process;
	
	IRQ_N <= not (IRQ_COL or IRQ_OVF or IRQ_RCR or IRQ_DMAS or IRQ_DMA or IRQ_VBL);
	BUSY_N <= '0' when CPU_BUSY = '1' and CS_N = '0' and (RD_N = '0' or WR_N = '0') and A(1) = '1' and (AR = "00010" or AR = "00001" or AR = "00000") else '1';
	
		
	process(SLOT, BG_RAM_ADDR, SPR_RAM_ADDR, DCK_CE, DMAS_VRAM_ADDR, DMAS_EXEC, DMA_EXEC, DMA_WR, SOUR, DESR, DMA_BUF, CPUWR_EXEC, CPU_VRAM_ADDR, CPU_VRAM_DATA)
	begin
		RAM_DO <= x"0000";
		RAM_WE <= '0';
		case SLOT is
			when BAT | CG0 | CG1 =>
				RAM_A <= BG_RAM_ADDR;
			when SG0 | SG1 | SG2 | SG3 =>
				RAM_A <= SPR_RAM_ADDR;
			when CPU =>
				if DMAS_EXEC = '1' then
					RAM_A <= DMAS_VRAM_ADDR;
				elsif DMA_EXEC = '1' then
					if DMA_WR = '0' then
						RAM_A <= SOUR;
					else
						RAM_A <= DESR;
						RAM_DO <= DMA_BUF;
						RAM_WE <= DCK_CE;
					end if;
				elsif CPUWR_EXEC = '1' then
					RAM_A <= CPU_VRAM_ADDR;
					RAM_DO <= CPU_VRAM_DATA;
					RAM_WE <= DCK_CE;
				else
					RAM_A <= CPU_VRAM_ADDR;
				end if; 
			when others =>
				RAM_A <= x"0000";
		end case;
	end process;
	
	IW_DBG <= CR_IW;
	VM_DBG <= VM;
	CM_DBG <= CM;
	SCREEN_DBG <= SCREEN;
	SOUR_DBG <= SOUR;
	DESR_DBG <= DESR;
	LENR_DBG <= LENR;
	
	SPR_X_DBG <= SPR.X;
	SPR_Y_DBG <= SPR.Y;
	SPR_PC_DBG <= SPR.PC;
	SPR_CG_DBG <= SPR.CG;
	SPR_PAL_DBG <= SPR.PAL;
	SPR_PRIO_DBG <= SPR.PRIO;
	SPR_CGX_DBG <= SPR.CGX;
	SPR_CGY_DBG <= SPR.CGY;
	SPR_HF_DBG <= SPR.HF;
	SPR_VF_DBG <= SPR.VF;
	
	HDS_END_POS_DBG <= HDS_END_POS;
	HDISP_END_POS_DBG <= HDISP_END_POS;
	HSW_DBG <= HSW;
	HDS_DBG <= HDS;
	HDE_DBG <= HDE;
	
	VDS_END_POS_DBG <= VDS_END_POS;
	VDISP_END_POS_DBG <= VDISP_END_POS;
	VDE_END_POS_DBG <= VDE_END_POS;
	
end rtl;