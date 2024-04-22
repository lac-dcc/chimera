-- #############################################################################
-- ################################## TODO #####################################
-- #############################################################################

-- #############################################################################
-- #############################################################################
-- #############################################################################

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity huc6270 is
	port (
		CLK 		: in std_logic;
		RESET_N		: in std_logic;

		-- CPU Interface
		A			: in std_logic_vector(1 downto 0);
		CE_N		: in std_logic;
		WR_N		: in std_logic;
		RD_N		: in std_logic;		
		DI			: in std_logic_vector(7 downto 0);
		DO 			: out std_logic_vector(7 downto 0);
		BUSY_N		: out std_logic;
		IRQ_N		: out std_logic;

		BG_RAM_A	: out std_logic_vector(15 downto 0);		
		BG_RAM_DO	: in std_logic_vector(15 downto 0);
		BG_RAM_REQ	: out std_logic;
		BG_RAM_ACK	: in std_logic;
		
		SP_RAM_A	: out std_logic_vector(15 downto 0);
		SP_RAM_DO	: in std_logic_vector(15 downto 0);
		SP_RAM_REQ	: out std_logic;
		SP_RAM_ACK	: in std_logic;

		CPU_RAM_REQ	: out std_logic;
		CPU_RAM_A	: out std_logic_vector(15 downto 0);
		CPU_RAM_DO	: in std_logic_vector(15 downto 0); -- Output from RAM
		CPU_RAM_DI	: out std_logic_vector(15 downto 0);
		CPU_RAM_WE	: out std_logic;
		CPU_RAM_ACK	: in std_logic;

		DMA_RAM_REQ	: out std_logic;
		DMA_RAM_A	: out std_logic_vector(15 downto 0);
		DMA_RAM_DO	: in std_logic_vector(15 downto 0); -- Output from RAM
		DMA_RAM_DI	: out std_logic_vector(15 downto 0);
		DMA_RAM_WE	: out std_logic;
		DMA_RAM_ACK	: in std_logic;

		DMAS_RAM_REQ	: out std_logic;
		DMAS_RAM_A		: out std_logic_vector(15 downto 0);
		DMAS_RAM_DO		: in std_logic_vector(15 downto 0); -- Output from RAM
		DMAS_RAM_ACK	: in std_logic;
		
		-- VCE Interface
		COLNO		: out std_logic_vector(8 downto 0);
		CLKEN		: in std_logic;
		HS_N		: in std_logic;
		VS_N		: in std_logic

	);
end huc6270;

architecture rtl of huc6270 is

--------------------------------------------------------------------------------
-- Registers
--------------------------------------------------------------------------------
signal MAWR		: std_logic_vector(15 downto 0);
signal MARR		: std_logic_vector(15 downto 0);

signal VRR		: std_logic_vector(15 downto 0); -- VRAM Read Buffer
signal VWR		: std_logic_vector(15 downto 0); -- VRAM Write Latch

signal CR		: std_logic_vector(15 downto 0);
signal RCR		: std_logic_vector(15 downto 0);
signal BXR		: std_logic_vector(15 downto 0);
signal BYR		: std_logic_vector(15 downto 0);
signal MWR		: std_logic_vector(15 downto 0);

signal HPR		: std_logic_vector(15 downto 0);
signal HDR		: std_logic_vector(15 downto 0);
signal VSR		: std_logic_vector(15 downto 0);
signal VDR		: std_logic_vector(15 downto 0);
signal VDE		: std_logic_vector(15 downto 0);

signal DCR		: std_logic_vector(15 downto 0);

signal SOUR		: std_logic_vector(15 downto 0);
signal DESR		: std_logic_vector(15 downto 0);
signal LENR		: std_logic_vector(15 downto 0);

signal SATB		: std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- Video counting and internal synchronization
--------------------------------------------------------------------------------
-- Registers
signal HDS : std_logic_vector(6 downto 0);
signal HSW : std_logic_vector(4 downto 0);
signal HDE : std_logic_vector(6 downto 0);
signal HDW : std_logic_vector(6 downto 0);

signal VDS : std_logic_vector(7 downto 0);
signal VSW : std_logic_vector(4 downto 0);
signal VDW : std_logic_vector(8 downto 0);
signal VCR : std_logic_vector(7 downto 0);

-- Interrupts
signal IRQ_RCR_SET	: std_logic;
signal IRQ_VBL_SET	: std_logic;


-- Intermediate signals
signal X		: std_logic_vector(9 downto 0);
signal Y		: std_logic_vector(8 downto 0);
signal HS_N_PREV	: std_logic;
signal VS_N_PREV	: std_logic;
signal Y_UPDATE		: std_logic;

signal X_BG_START	: std_logic_vector(9 downto 0);
signal X_REN_START	: std_logic_vector(9 downto 0);
signal X_BG_END		: std_logic_vector(9 downto 0);
signal X_REN_END	: std_logic_vector(9 downto 0);
signal Y_BGREN_START	: std_logic_vector(8 downto 0);
signal Y_BGREN_END	: std_logic_vector(8 downto 0);
signal Y_DISP_START	: std_logic_vector(8 downto 0);
signal Y_DISP_END	: std_logic_vector(8 downto 0);

-- signal X_SP_START	: std_logic_vector(9 downto 0);
-- signal X_SP_END		: std_logic_vector(9 downto 0);
signal Y_SP_START	: std_logic_vector(8 downto 0);
signal Y_SP_END		: std_logic_vector(8 downto 0);

signal BG_ACTIVE	: std_logic;
signal SP1_ACTIVE	: std_logic;
signal SP2_ACTIVE	: std_logic;
signal REN_ACTIVE	: std_logic;
signal DMA_ACTIVE	: std_logic;
signal DMAS_ACTIVE	: std_logic;
signal DMAS_DY		: std_logic_vector(3 downto 0);
signal RCNT			: std_logic_vector(8 downto 0);
signal DBG_VBL		: std_logic;

signal SP_ON		: std_logic;
signal BG_ON		: std_logic;
signal BURST		: std_logic;

--------------------------------------------------------------------------------
-- Background engine
--------------------------------------------------------------------------------
-- Pseudo-registers
signal BG_VS		: std_logic;
signal BG_HS		: std_logic_vector(1 downto 0);
signal BG_DW		: std_logic_vector(1 downto 0);
signal BG_CM		: std_logic;

-- Intermediate signals - Part 1
signal BG_Y			: std_logic_vector(8 downto 0);
signal BG_TX		: std_logic_vector(6 downto 0);
signal TX			: std_logic_vector(6 downto 0);
signal TX_MAX		: std_logic_vector(6 downto 0);
signal BG_PX		: std_logic_vector(9 downto 0);
signal BG_PAL		: std_logic_vector(3 downto 0);
signal BG_P01		: std_logic_vector(15 downto 0);
signal BG_P23		: std_logic_vector(15 downto 0);

signal YOFS			: std_logic_vector(8 downto 0);
signal YOFS_RELOAD	: std_logic;
signal YOFS_REL_REQ	: std_logic;
signal YOFS_REL_ACK	: std_logic;

-- State machine - Part 1
type bg1_t is ( BG1_INI, BG1_INI_W,
				BG1_CPU, BG1_CPU_W, 
				BG1_BAT, BG1_BAT_W,
				BG1_NOP, BG1_NOP_W,
				BG1_CG0, BG1_CG0_W,
				BG1_CG1, BG1_CG1_W,
				BG1_END );
signal BG1			: bg1_t;		
signal BG_CYC		: std_logic_vector(2 downto 0);
signal BG_BUSY		: std_logic;
signal BG_BUSY2		: std_logic;

-- Intermediate signals - Part 2
signal BG2_REQ		: std_logic;
signal BG2_INI_REQ	: std_logic;

signal BG2_MEM_A	: std_logic_vector(9 downto 0);
signal BG2_MEM_WE	: std_logic;
signal BG2_MEM_DI	: std_logic_vector(7 downto 0);
signal BG2_PAL		: std_logic_vector(3 downto 0);
signal BG2_P0		: std_logic_vector(7 downto 0);
signal BG2_P1		: std_logic_vector(7 downto 0);
signal BG2_P2		: std_logic_vector(7 downto 0);
signal BG2_P3		: std_logic_vector(7 downto 0);
signal TPX			: std_logic_vector(2 downto 0);

-- State machine - Part 2
type bg2_t is ( BG2_INI, BG2_WRITE, BG2_LOOP );
signal BG2			: bg2_t;		

-- Background engine - RAM access signals
signal BG_RAM_A_FF		: std_logic_vector(15 downto 0);
signal BG_RAM_REQ_FF	: std_logic := '0';


--------------------------------------------------------------------------------
-- Sprite engine
--------------------------------------------------------------------------------
-- Pseudo-registers
signal SP_DW	: std_logic_vector(1 downto 0);

-- Interrupts
signal IRQ_COL_SET	: std_logic;
signal IRQ_COL_TRIG	: std_logic;
signal IRQ_OVF_SET	: std_logic;

-- Intermediate signals - Part 1
signal SP_NB	: std_logic_vector(4 downto 0);
signal SP_CUR_Y	: std_logic_vector(9 downto 0);
signal SP_Y		: std_logic_vector(9 downto 0);
signal SP_X		: std_logic_vector(9 downto 0);
signal SP_CG	: std_logic;
signal SP_NAME	: std_logic_vector(9 downto 0);
signal SP_VF	: std_logic;
signal SP_CGY	: std_logic_vector(1 downto 0);
signal SP_HF	: std_logic;
signal SP_CGX	: std_logic;
signal SP_PRI	: std_logic;
signal SP_PAL	: std_logic_vector(3 downto 0);

-- Sprite pre-buffers
type sp_prebuf_entry_t is
	record
		-- Information that will be copied as is in the Sprite buffers
		ZERO	: std_logic;
		PRI		: std_logic;
		PAL		: std_logic_vector(3 downto 0);
		HF		: std_logic;
		X		: std_logic_vector(9 downto 0);		
		-- Information required to fill the P0-P3 buffers
		CG		: std_logic;
		ADDR	: std_logic_vector(15 downto 0);
	end record;
type sp_prebuf_t is array(0 to 15) of sp_prebuf_entry_t;
signal SP_PREBUF	: sp_prebuf_t;

-- Sprite engine - SAT access signals
signal SP_SAT_A		: std_logic_vector(7 downto 0);
signal SP_SAT_DO	: std_logic_vector(15 downto 0);

-- State machine - Part 1
type sp1_t is ( SP1_INI, 
				SP1_RD0, SP1_RD1, SP1_RD2, SP1_RD3, SP1_TST,
				SP1_LEFT, SP1_RIGHT,
				SP1_LOOP, SP1_END );
signal SP1			: sp1_t;
signal SP1_CNT	: std_logic_vector(1 downto 0);



-- Intermediate signals - Part 2
signal SP_CUR	: std_logic_vector(3 downto 0);

-- Sprite buffers
type sp_buf_entry_t is
	record
		ZERO	: std_logic;
		PRI		: std_logic;
		PAL		: std_logic_vector(3 downto 0);
		HF		: std_logic;
		X		: std_logic_vector(9 downto 0);
		
		P0		: std_logic_vector(15 downto 0);
		P1		: std_logic_vector(15 downto 0);
		P2		: std_logic_vector(15 downto 0);
		P3		: std_logic_vector(15 downto 0);
	end record;
type sp_buf_t is array(0 to 15) of sp_buf_entry_t;
signal SP_BUF	: sp_buf_t;

-- Sprite engine - RAM access signals
signal SP_RAM_A_FF		: std_logic_vector(15 downto 0);
signal SP_RAM_REQ_FF	: std_logic := '0';

-- State machine - Part 2
type sp2_t is ( SP2_INI, SP2_INI_W,
				SP2_RD0, SP2_RD0_W,
				SP2_RD1, SP2_RD1_W,
				SP2_RD2, SP2_RD2_W,
				SP2_RD3, SP2_RD3_W,
				SP2_END );
signal SP2	: sp2_t;
signal SP_BUSY		: std_logic;
signal SP_CYC		: std_logic_vector(1 downto 0);

--------------------------------------------------------------------------------
-- Line rendering
--------------------------------------------------------------------------------
-- Intermediate signals
signal REN_MEM_A	: std_logic_vector(9 downto 0);
signal REN_MEM_WE	: std_logic;
signal REN_MEM_DO	: std_logic_vector(7 downto 0);

signal REN_BG_COL	: std_logic_vector(7 downto 0);
signal REN_SP_OPQ	: std_logic_vector(15 downto 0); -- Sprite pixel on/off
type ren_sp_col_t is array(15 downto 0) of std_logic_vector(8 downto 0); -- PRI & PAL & COL
signal REN_SP_COLTAB	: ren_sp_col_t;
signal REN_SP_COL	: std_logic_vector(7 downto 0);
signal REN_SP_PRI	: std_logic;

-- State machine
type ren_t is ( REN_INI, REN_BGR, REN_BGW, REN_CLK );
signal REN			: ren_t;		

-- Output buffers
signal COLNO_FF		: std_logic_vector(8 downto 0);

--------------------------------------------------------------------------------
-- CPU Interface
--------------------------------------------------------------------------------
signal PREV_A			: std_logic_vector(1 downto 0);

signal CPU_SOUR_SET_REQ	: std_logic;
signal CPU_SOUR_SET_VAL	: std_logic_vector(15 downto 0);

signal CPU_DESR_SET_REQ	: std_logic;
signal CPU_DESR_SET_VAL	: std_logic_vector(15 downto 0);

signal CPU_LENR_SET_REQ	: std_logic;
signal CPU_LENR_SET_VAL	: std_logic_vector(15 downto 0);

signal CPU_IRQ_CLR		: std_logic;
signal CPU_DMAS_REQ		: std_logic;
signal CPU_DMA_REQ		: std_logic;

signal RD_BUF		: std_logic_vector(15 downto 0);
signal WR_BUF		: std_logic_vector(15 downto 0);
signal REG_SEL		: std_logic_vector(4 downto 0);

-- Interrupts
signal IRQ_COL		: std_logic;
signal IRQ_OVF		: std_logic;
signal IRQ_RCR		: std_logic;
signal IRQ_DMAS		: std_logic;
signal IRQ_DMA		: std_logic;
signal IRQ_VBL		: std_logic;

signal BUSY			: std_logic;

-- RAM access signals
signal CPU_RAM_REQ_FF		: std_logic := '0';
signal CPU_RAM_A_FF		: std_logic_vector(15 downto 0);
signal CPU_RAM_DI_FF		: std_logic_vector(15 downto 0);
signal CPU_RAM_WE_FF		: std_logic := '0';

-- Output buffers
signal DO_FF		: std_logic_vector(7 downto 0);
signal BUSY_N_FF	: std_logic;
signal IRQ_N_FF		: std_logic;

-- State machine
type cpu_t is ( CPU_IDLE,
				CPU_RAM_RD, CPU_RAM_PRE_RD,
				CPU_RAM_WR_INC, CPU_RAM_PRE_WR_INC,
				CPU_WAIT );
signal CPU			: cpu_t;

--------------------------------------------------------------------------------
-- VRAM-VRAM DMA
--------------------------------------------------------------------------------
signal DMA_REQ			: std_logic;

signal DMA_DMA_CLR		: std_logic;
signal IRQ_DMA_SET		: std_logic;

signal DMA_BUSY			: std_logic;

signal DMA_RAM_REQ_FF		: std_logic := '0';
signal DMA_RAM_A_FF		: std_logic_vector(15 downto 0);
signal DMA_RAM_DI_FF		: std_logic_vector(15 downto 0);
signal DMA_RAM_WE_FF		: std_logic := '0';

signal DMA_SOUR_SET_REQ	: std_logic;
signal DMA_DESR_SET_REQ	: std_logic;
signal DMA_LENR_SET_REQ	: std_logic;

-- State machine
type dma_t is (	DMA_IDLE,
				DMA_READ, DMA_READ1, DMA_READ2,
				DMA_WRITE, DMA_WRITE1, DMA_WRITE2,
				DMA_LOOP, DMA_LOOP2 );
signal DMA	: dma_t;

--------------------------------------------------------------------------------
-- VRAM-SAT DMA
--------------------------------------------------------------------------------
signal DMAS_REQ			: std_logic;

signal DMAS_DMAS_CLR	: std_logic;
signal IRQ_DMAS_SET		: std_logic;

signal DMAS_BUSY		: std_logic;

signal DMAS_RAM_REQ_FF		: std_logic := '0';
signal DMAS_RAM_A_FF		: std_logic_vector(15 downto 0);

signal DMAS_SAT_A		: std_logic_vector(7 downto 0);
signal DMAS_SAT_DI		: std_logic_vector(15 downto 0);
signal DMAS_SAT_WE		: std_logic := '0';

-- State machine
type dmas_t is (	DMAS_IDLE,
					DMAS_READ, DMAS_READ1, DMAS_READ2,
					DMAS_WRITE,
					DMAS_END );
signal DMAS	: dmas_t;


constant speedUpSp	: boolean := true;
constant speedUpBg	: boolean := true;

begin

--------------------------------------------------------------------------------
-- Background line buffer
--------------------------------------------------------------------------------
bg_buf : entity work.linebuf port map(
	clock		=> CLK,
	
	address_a	=> BG2_MEM_A,
	data_a		=> BG2_MEM_DI,
	wren_a		=> BG2_MEM_WE,
	q_a			=> open,
	
	address_b	=> REN_MEM_A,
	data_b		=> "00000000",
	wren_b		=> REN_MEM_WE,
	q_b			=> REN_MEM_DO
);

--------------------------------------------------------------------------------
-- SAT
--------------------------------------------------------------------------------
sat : entity work.satram port map(
	clock		=> CLK,
	
	data		=> DMAS_SAT_DI,
	wraddress	=> DMAS_SAT_A,
	wren		=> DMAS_SAT_WE,
	
	rdaddress	=> SP_SAT_A,
	q			=> SP_SAT_DO
);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Video counting and internal synchronization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
process( CLK )

variable V_HDS : std_logic_vector(6 downto 0);
variable V_HSW : std_logic_vector(4 downto 0);
variable V_HDE : std_logic_vector(6 downto 0);
variable V_HDW : std_logic_vector(6 downto 0);

variable V_VDS : std_logic_vector(7 downto 0);
variable V_VSW : std_logic_vector(4 downto 0);
variable V_VDW : std_logic_vector(8 downto 0);
variable V_VCR : std_logic_vector(7 downto 0);

begin
	if rising_edge(CLK) then
		IRQ_RCR_SET <= '0';
		IRQ_VBL_SET <= '0';
		YOFS_REL_ACK <= '0';
	
		if RESET_N = '0' then
			X <= (others => '0');
			Y <= (others => '1'); -- /!\
			
			HS_N_PREV <= '1';
			VS_N_PREV <= '0';
			Y_UPDATE <= '0';

			BG_ACTIVE <= '0';
			SP1_ACTIVE <= '0';
			SP2_ACTIVE <= '0';
			REN_ACTIVE <= '0';
			DMA_ACTIVE <= '0';
			DMAS_ACTIVE <= '0';
			
			X_BG_START <= (others => '1');
			X_REN_START <= (others => '1');
			-- X_BG_END <= (others => '1');
			X_REN_END <= (others => '1');
			
			Y_BGREN_START <= (others => '1');
			Y_BGREN_END <= (others => '1');
			
			Y_DISP_END <= (others => '1');
			Y_DISP_START <= (others => '1');
			
			-- X_SP_START <= (others => '1');
			-- X_SP_END <= (others => '1');
			Y_SP_START <= (others => '1');
			Y_SP_END <= (others => '1');

			DMAS_DY <= (others => '0');
			RCNT <= (others => '1');
			
			SP_ON <= '0';
			BG_ON <= '0';
			BURST <= '1';
			
			YOFS <= (others => '0');
		else
			if CLKEN = '1' then
				HS_N_PREV <= HS_N;
				X <= X + 1;
				
				Y_UPDATE <= '0';
				
				if HS_N_PREV = '1' and HS_N = '0' then
					X <= (others => '0');
					
					V_HDS := HPR(14 downto 8);
					V_HSW := HPR(4 downto 0);
					V_HDE := HDR(14 downto 8);
					V_HDW := HDR(6 downto 0);
		
					HDS <= V_HDS;
					HSW <= V_HSW;
					HDE <= V_HDE;
					HDW <= V_HDW;
		
					X_REN_START <= ("00" & V_HSW & "000") 
						+ ( V_HDS & "000" ) 
						+ ( "0000011" & "000" ); -- (HSW+1+HDS+1)<<3

					X_REN_END <= ("00" & V_HSW & "000") 
						+ ( V_HDS & "000" ) 
						+ ( V_HDW & "000" )
						+ ( "0000011" & "111" ); -- (HSW+1+HDS+1+HDW+1)<<3
				
					X_BG_START <= ("00" & V_HSW & "000") 
						+ ( V_HDS & "000" ) 
						+ ( "0000000" & "000" ); -- (HSW+1+HDS+1 -1 - 1)<<3
									
					-- X_BG_END <= ("00" & V_HSW & "000") 
						-- + ( V_HDS & "000" ) 
						-- + ( V_HDW & "000" )
						-- + ( "0000010" & "000" ); -- (HSW+1+HDS+1+HDW+1 -1+1 - 1)<<3
						
					-- if X < X_BG_END then 
					if X < X_REN_END then 
						-- Force Y update even if Hxx register settings
						-- prevent to reach the end of the active display
						-- BG_ACTIVE <= '0';
						Y_UPDATE <= '1';
						-- REN_ACTIVE <= '0';
						-- SP1_ACTIVE <= '0';
					end if;
				end if;
				
				if X = X_BG_START and Y >= Y_BGREN_START and Y < Y_BGREN_END and BG_ON = '1' then
					BG_ACTIVE <= '1';
					YOFS_REL_ACK <= '1';
					if Y = Y_BGREN_START or YOFS_RELOAD = '1' then
						YOFS <= BYR(8 downto 0) + 1;
					else
						YOFS <= YOFS + 1;
					end if;
				end if;
				if X = X_REN_START and Y >= Y_BGREN_START and Y < Y_BGREN_END then
					REN_ACTIVE <= '1';
				end if;
				if X = X_REN_START and Y >= Y_SP_START and Y < Y_SP_END and SP_ON = '1' then
					SP1_ACTIVE <= '1';
				end if;
				
				if X = X_BG_START then
					SP2_ACTIVE <= '0';
				end if;
				-- if X = X_BG_END then
					-- BG_ACTIVE <= '0';
					-- Y_UPDATE <= '1';
				-- end if;
				if X = X_REN_END then
					-- BG_ACTIVE <= '0';
					Y_UPDATE <= '1';
					-- REN_ACTIVE <= '0';
					-- SP1_ACTIVE <= '0';
				end if;
				
				if Y_UPDATE = '1' then
					BG_ACTIVE <= '0';
					REN_ACTIVE <= '0';
					SP1_ACTIVE <= '0';

					VS_N_PREV <= VS_N;
					
					Y <= Y + 1;
					
					SP_ON <= CR(6);
					BG_ON <= CR(7);
					
					if VS_N_PREV = '0' and VS_N = '1' then
						Y <= (others => '0');
						
						V_VDS := VSR(15 downto 8);
						V_VSW := VSR(4 downto 0);
						V_VDW := VDR(8 downto 0);
						V_VCR := VDE(7 downto 0);
						
						VDS <= V_VDS;
						VSW <= V_VSW;
						VDW <= V_VDW;
						VCR <= V_VCR;

						Y_DISP_START <= ("0" & V_VDS);
						
						Y_BGREN_START <= ("0" & V_VDS)
							+ ( "000000010" );
						
						Y_BGREN_END <= ("0" & V_VDS)
							+ V_VDW
							+ ( "000000011" );							
							
						Y_SP_START <= ("0" & V_VDS)
							+ ( "000000001" );
						
						Y_SP_END <= ("0" & V_VDS)
							+ V_VDW
							+ ( "000000010" );
			
						Y_DISP_END <= ("0" & V_VDS)
							+ V_VDW
							+ ("0" & V_VCR)
							+ ( "000000011" );

						-- Is it needed ?
						if CR(7 downto 6) = "00" then
							BURST <= '1';
						else
							BURST <= '0';
						end if;
			
					end if;

					-- Burst Mode
					if Y = Y_DISP_START then
						if CR(7 downto 6) = "00" then
							BURST <= '1';
						else
							BURST <= '0';
						end if;
					end if;
					
					if Y = Y_DISP_END then
						-- Frame counter reset
						Y <= (others => '0');
					end if;
					
					if Y = Y_BGREN_END or Y = 262 then
						-- VBlank Interrupt
						if CR(3) = '1' then
							IRQ_VBL_SET <= '1';
						end if;
						DBG_VBL <= '1';
						DMAS_DY <= x"4";
					else
						DBG_VBL <= '0';
					end if;
					
					-- VRAM-SAT DMA
					if DMAS_DY /= x"0" then
						DMAS_DY <= DMAS_DY - 1;
					end if;
					if DMAS_DY >= 1 and DMAS_DY < 3 then
						DMAS_ACTIVE <= '1';
					else
						DMAS_ACTIVE <= '0';
					end if;
					
					-- Raster counter
					RCNT <= RCNT + 1;
					--if Y = Y_DISP_START then
					if Y = Y_DISP_START - 1 then
						RCNT <= "0" & x"40";
					end if;
					-- Raster compare interrupt
					if ("0" & RCNT) = RCR(9 downto 0) and CR(2) = '1' then
						IRQ_RCR_SET <= '1';
					end if;
					
					if Y >= Y_SP_START and Y < Y_SP_END and SP_ON = '1' then
						SP2_ACTIVE <= '1';
					end if;
					
					if Y >= Y_BGREN_END or Y < Y_SP_START or BURST = '1' then
						DMA_ACTIVE <= '1';
					else
						DMA_ACTIVE <= '0';
					end if;
					
				end if;
			end if; -- CLKEN
		end if;
	end if;
end process;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Background engine
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BG_VS <= MWR(6);
BG_HS <= MWR(5 downto 4);
BG_DW <= MWR(1 downto 0);
-- BG_DW <= "11";
BG_CM <= MWR(7);
-- BG_CM <= '1';

--------------------------------------------------------------------------------
-- Background engine - Part 1
--------------------------------------------------------------------------------
process( CLK )

variable V_BG_Y	: std_logic_vector(8 downto 0);
variable V_BG_X_TX : std_logic_vector(6 downto 0);

begin
	if rising_edge(CLK) then
	
		BG2_INI_REQ <= '0';
		BG2_REQ <= '0';

		if RESET_N = '0' then
			BG1 <= BG1_INI;
			
			BG_RAM_REQ_FF <= '0';
			
			BG_BUSY <= '0';			
			BG_BUSY2 <= '0';			
		else			
			case BG1 is
			when BG1_INI =>
				BG_BUSY <= '0';
				BG_BUSY2 <= '0';			
				
				if BG_ACTIVE = '1' then
					BG_BUSY <= '1';
					BG_BUSY2 <= '1';
					
					-- V_BG_Y := Y - Y_BGREN_START + BYR(8 downto 0);
					V_BG_Y := YOFS;
					if BG_VS = '0' then
						BG_Y <= "0" & V_BG_Y(7 downto 0);
					else
						BG_Y <= V_BG_Y;
					end if;
					BG_TX <= BXR(9 downto 3);
				
					BG_PX <= X_REN_START - ("0000000" & BXR(2 downto 0));
					
					TX <= (others => '0');
					if BXR(2 downto 0) = "000" then
						TX_MAX <= HDW;
					else
						TX_MAX <= HDW + 1;
					end if;
				
					BG2_INI_REQ <= '1';
				
					BG_CYC <= "000";
					BG1 <= BG1_INI_W;
				end if;
			
			when BG1_INI_W =>
				if speedUpBg or CLKEN = '1' then
					case BG_DW is
					when "00" =>
						BG1 <= BG1_CPU;
					when others =>
						BG1 <= BG1_BAT;
					end case;
				end if;
			
			when BG1_CPU =>
				-- Allow one pending CPU VRAM request to be handled
				BG_BUSY <= '0';
				BG_BUSY2 <= '0';
				BG1 <= BG1_CPU_W;
			
			when BG1_CPU_W =>
				BG_BUSY <= '1';
				
				if speedUpBg or CLKEN = '1' then
					BG_CYC <= BG_CYC + 1;
					case BG_DW is
					when "00" =>
						BG_BUSY2 <= '1';
						case BG_CYC(2 downto 1) is
						when "00" => BG1 <= BG1_BAT; 
						when "01" => BG1 <= BG1_NOP;
						when "10" => BG1 <= BG1_CG0;
						when "11" => BG1 <= BG1_CG1;
						when others => null;
						end case;
					when others =>
						if BG_CYC = "011" then
							BG_BUSY2 <= '1';
							BG1 <= BG1_CG0;
						end if;
					end case;
				end if;
						
			when BG1_BAT =>				
				BG_P01 <= x"0000";
				BG_P23 <= x"0000";
				
				V_BG_X_TX := BG_TX + TX;
				case BG_HS is
				when "00" =>
					BG_RAM_A_FF <= "00000" & BG_Y(8 downto 3) & V_BG_X_TX(4 downto 0);
				when "01" =>
					BG_RAM_A_FF <= "0000" & BG_Y(8 downto 3) & V_BG_X_TX(5 downto 0);
				when others =>
					BG_RAM_A_FF <= "000" & BG_Y(8 downto 3) & V_BG_X_TX(6 downto 0);
				end case;
				
				BG_RAM_REQ_FF <= not BG_RAM_REQ_FF;
				BG1 <= BG1_BAT_W;
				
			when BG1_BAT_W =>
				if (speedUpBg or CLKEN = '1') and BG_RAM_REQ_FF = BG_RAM_ACK then
					
					BG_PAL <= BG_RAM_DO(15 downto 12);
					BG_RAM_A_FF <= BG_RAM_DO(11 downto 0) & "0" & BG_Y(2 downto 0);
				
					BG_CYC <= BG_CYC + 1;
					case BG_DW is
					when "00" => BG1 <= BG1_CPU;
					when "11" => 
						if BG_CYC = "011" then
							BG1 <= BG1_CG1; -- CG0/CG1
						end if;
					when others =>
						if BG_CYC = "001" then
							BG1 <= BG1_CPU;
						end if;
					end case;
				end if;

			when BG1_NOP =>
				BG1 <= BG1_NOP_W;
			
			when BG1_NOP_W =>
				if speedUpBg or CLKEN = '1' then
					BG_CYC <= BG_CYC + 1;
					BG1 <= BG1_CPU;
				end if;
				
			when BG1_CG0 =>
				BG_RAM_REQ_FF <= not BG_RAM_REQ_FF;
				BG1 <= BG1_CG0_W;
			
			when BG1_CG0_W =>
				if (speedUpBg or CLKEN = '1') and BG_RAM_REQ_FF = BG_RAM_ACK then
					BG_P01 <= BG_RAM_DO;
					
					BG_CYC <= BG_CYC + 1;
					case BG_DW is
					when "00" => BG1 <= BG1_CPU;
					when "11" => BG1 <= BG1_CG1; -- Just in case
					when others =>
						if BG_CYC = "101" then
							BG1 <= BG1_CG1;
						end if;
					end case;
				end if;
			
			when BG1_CG1 =>
				BG_RAM_REQ_FF <= not BG_RAM_REQ_FF;
				if BG_DW = "11" and BG_CM = '0' then
					BG_RAM_A_FF(3) <= '0';
				else
					BG_RAM_A_FF(3) <= '1';
				end if;
				BG1 <= BG1_CG1_W;

			when BG1_CG1_W =>				
				if (speedUpBg or CLKEN = '1') and BG_RAM_REQ_FF = BG_RAM_ACK then					
					if BG_DW = "11" and BG_CM = '0' then
						BG_P01 <= BG_RAM_DO;
					else
						BG_P23 <= BG_RAM_DO;
					end if;
										
					BG_CYC <= BG_CYC + 1;
					case BG_DW is
					when "00" =>
						TX <= TX + 1;
						BG2_REQ <= '1';
						if TX = TX_MAX then
							BG1 <= BG1_END;
						else
							BG1 <= BG1_CPU;
						end if;
					when others =>
						if BG_CYC = "111" then
							TX <= TX + 1;
							BG2_REQ <= '1';
							if TX = TX_MAX then
								BG1 <= BG1_END;
							else
								BG1 <= BG1_BAT;
							end if;
						end if;
					end case;
				end if;
				
			when BG1_END =>
				BG_BUSY <= '0';
				BG_BUSY2 <= '0';
				if BG_ACTIVE = '0' then
					BG1 <= BG1_INI;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
-- Background engine - Part 2
--------------------------------------------------------------------------------
process( CLK )
begin
	if rising_edge(CLK) then
		if RESET_N = '0' then
			BG2_MEM_WE <= '0';
		
			BG2 <= BG2_INI;
		else
			case BG2 is
			when BG2_INI =>
				BG2_MEM_WE <= '0';
				
				if BG2_INI_REQ = '1' then
					BG2_MEM_A <= BG_PX;
				end if;
				if BG2_REQ = '1' then
					TPX <= "111";
					
					BG2_PAL <= BG_PAL;
					BG2_P1 <= BG_P01(15 downto 8);
					BG2_P0 <= BG_P01(7 downto 0);
					BG2_P3 <= BG_P23(15 downto 8);
					BG2_P2 <= BG_P23(7 downto 0);
					
					BG2 <= BG2_WRITE;
				end if;
			
			when BG2_WRITE =>
				BG2_MEM_DI <= BG2_PAL 
					& BG2_P3(conv_integer(TPX)) 
					& BG2_P2(conv_integer(TPX)) 
					& BG2_P1(conv_integer(TPX)) 
					& BG2_P0(conv_integer(TPX));
				if (BG2_MEM_A >= X_REN_START) and (BG2_MEM_A <= X_REN_END) then
					BG2_MEM_WE <= '1';
				end if;
				BG2 <= BG2_LOOP;
								
			when BG2_LOOP =>
				BG2_MEM_WE <= '0';
				TPX <= TPX - 1;
				BG2_MEM_A <= BG2_MEM_A + 1;
				if TPX = "000" then
					BG2 <= BG2_INI;
				else
					BG2 <= BG2_WRITE;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Sprite engine
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SP_DW <= MWR(3 downto 2);

--------------------------------------------------------------------------------
-- Sprite engine - Part 1
--------------------------------------------------------------------------------
process( CLK )
variable V_SP_H		: std_logic_vector(8 downto 0);
variable V_SP_NAME	: std_logic_vector(9 downto 0);
variable V_Y_OFS 	: std_logic_vector(9 downto 0);
begin
	if rising_edge(CLK) then
		
		IRQ_OVF_SET <= '0';
		
		if RESET_N = '0' then
			SP1 <= SP1_INI;			
			SP_NB <= "00000";
		else
			case SP1 is
			when SP1_INI =>
				if SP1_ACTIVE = '1' then
					SP_NB <= "00000";					
					SP_CUR_Y <= ("0" & Y) - ("0" & Y_SP_START) + 64;
					SP_SAT_A <= "000000" & "11";
					
					SP1_CNT <= "00";
					SP1 <= SP1_RD0;
				end if;
			
			when SP1_RD0 =>
				SP_SAT_A(1 downto 0) <= "00";
				SP1_CNT <= SP1_CNT + 1;
				if SP1_CNT = "11" then
					SP1_CNT <= "00";
					SP_Y <= SP_SAT_DO(9 downto 0);
					SP1 <= SP1_RD3;
				end if;
				
			when SP1_RD3 =>
				SP_SAT_A(1 downto 0) <= "11";
				SP1_CNT <= SP1_CNT + 1;
				if SP1_CNT = "11" then
					SP1_CNT <= "00";
					SP_VF <= SP_SAT_DO(15);
					SP_CGY <= SP_SAT_DO(13 downto 12);
					SP_HF <= SP_SAT_DO(11);
					SP_CGX <= SP_SAT_DO(8);
					SP_PRI <= SP_SAT_DO(7);
					SP_PAL <= SP_SAT_DO(3 downto 0);
					SP1 <= SP1_TST;
				end if;
			
			when SP1_TST =>
				case SP_CGY is
				when "00" =>
					V_SP_H := "000010000";
				when "01" =>
					V_SP_H := "000100000";
				when others =>
					V_SP_H := "001000000";
				end case;

				if ( SP_CUR_Y >= SP_Y) and ( SP_CUR_Y < SP_Y + V_SP_H) then
					if SP_NB = "10000" then 
						SP_NB <= "11111"; -- Overflow
						if CR(1) = '1' then
							IRQ_OVF_SET <= '1';
						end if;
						SP1 <= SP1_END;
					else
						SP1 <= SP1_RD1;
					end if;
				else
					SP1 <= SP1_LOOP;
				end if;
			
			when SP1_RD1 =>
				SP_SAT_A(1 downto 0) <= "01";
				SP1_CNT <= SP1_CNT + 1;
				if SP1_CNT = "11" then
					SP1_CNT <= "00";
					SP_X <= SP_SAT_DO(9 downto 0);
					SP1 <= SP1_RD2;
				end if;
				
			when SP1_RD2 =>
				SP_SAT_A(1 downto 0) <= "10";
				SP1_CNT <= SP1_CNT + 1;
				if SP1_CNT = "11" then
					SP1_CNT <= "00";
					SP_NAME <= SP_SAT_DO(10 downto 1);
					SP_CG <= SP_SAT_DO(0);
					SP1 <= SP1_LEFT;
				end if;
			
			when SP1_LEFT =>
				case SP_CGY is
				when "00" => 
					V_SP_H := "000010000";
				when "01" => 
					V_SP_H := "000100000";
				when others => 
					V_SP_H := "001000000";
				end case;
					
				if SP_VF = '1' then
					V_Y_OFS := V_SP_H + SP_Y - SP_CUR_Y - 1;
				else
					V_Y_OFS := SP_CUR_Y - SP_Y;
				end if;

				V_SP_NAME(9 downto 3) := SP_NAME(9 downto 3);
				
				case SP_CGY is
				when "00" => 				
					V_SP_NAME(2 downto 1) := SP_NAME(2 downto 1);
				when "01" =>
					V_SP_NAME(2) := SP_NAME(2);
					V_SP_NAME(1) := V_Y_OFS(4);
				when others =>
					V_SP_NAME(2 downto 1) := V_Y_OFS(5 downto 4);
				end case;
				
				if SP_CGX = '1' then
					V_SP_NAME(0) := SP_HF;
				else
					V_SP_NAME(0) := SP_NAME(0);
				end if;

				if SP_NB = "00000" then
					SP_PREBUF(conv_integer(SP_NB(3 downto 0))).ZERO <= '1';
				else
					SP_PREBUF(conv_integer(SP_NB(3 downto 0))).ZERO <= '0';
				end if;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).PRI <= SP_PRI;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).PAL <= SP_PAL;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).X <= SP_X + X_REN_START - 32;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).HF <= SP_HF;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).ADDR <= V_SP_NAME & "00" & V_Y_OFS(3 downto 0);
				
				if SP_CGX = '1' then
					if SP_NB = "01111" then
						SP_NB <= "11111"; -- Overflow
						if CR(1) = '1' then
							IRQ_OVF_SET <= '1';
						end if;						
						SP1 <= SP1_END;
					else
						SP_NB <= SP_NB + 1;
						SP1 <= SP1_RIGHT;
					end if;
				else
					SP_NB <= SP_NB + 1;
					SP1 <= SP1_LOOP;
				end if;
			
			when SP1_RIGHT =>
				case SP_CGY is
				when "00" => 
					V_SP_H := "000010000";
				when "01" => 
					V_SP_H := "000100000";
				when others => 
					V_SP_H := "001000000";
				end case;
									
				if SP_VF = '1' then
					V_Y_OFS := V_SP_H + SP_Y - SP_CUR_Y - 1;
				else
					V_Y_OFS := SP_CUR_Y - SP_Y;
				end if;

				V_SP_NAME(9 downto 3) := SP_NAME(9 downto 3);
				case SP_CGY is
				when "00" => 				
					V_SP_NAME(2 downto 1) := SP_NAME(2 downto 1);
				when "01" =>
					V_SP_NAME(2) := SP_NAME(2);
					V_SP_NAME(1) := V_Y_OFS(4);
				when others =>
					V_SP_NAME(2 downto 1) := V_Y_OFS(5 downto 4);
				end case;
				V_SP_NAME(0) := not SP_HF;

				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).ZERO <= '0';
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).PRI <= SP_PRI;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).PAL <= SP_PAL;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).X <= SP_X + X_REN_START - 32 + 16;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).HF <= SP_HF;
				SP_PREBUF(conv_integer(SP_NB(3 downto 0))).ADDR <= V_SP_NAME & "00" & V_Y_OFS(3 downto 0);

				SP_NB <= SP_NB + 1;
				SP1 <= SP1_LOOP;
			
			when SP1_LOOP =>
				SP_SAT_A(7 downto 2) <= SP_SAT_A(7 downto 2) + 1;
				if SP_SAT_A(7 downto 2) = "111111" then
					SP1 <= SP1_END;
				else
					SP1 <= SP1_RD0;
				end if;
			
			when SP1_END =>
				if SP1_ACTIVE = '0' then
					SP1 <= SP1_INI;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
-- Sprite engine - Part 2
--------------------------------------------------------------------------------
process( CLK )
variable V_ADDR		: std_logic_vector(15 downto 0);
begin
	if rising_edge(CLK) then
		if RESET_N = '0' then
			SP2 <= SP2_INI;
			
			SP_BUSY <= '0';
			SP_RAM_REQ_FF <= '0';
		else
			case SP2 is
			when SP2_INI =>
				SP_BUSY <= '0';
				if SP2_ACTIVE = '1' then
					SP_BUSY <= '1';
					SP_CYC <= "00";
					
					for I in 0 to 15 loop
						SP_BUF(I).X <= "1111111100"; -- Set off-screen
					end loop;
					SP_CUR <= "0000";
			
					SP2 <= SP2_INI_W;
				end if;

			when SP2_INI_W =>
				if speedUpSp or CLKEN = '1' then
					if SP_NB /= "00000" then
						SP2 <= SP2_RD0;
					else
						SP2 <= SP2_END;
					end if;
				end if;
				
			when SP2_RD0 =>
				V_ADDR := SP_PREBUF(conv_integer(SP_CUR)).ADDR;
			
				SP_CYC <= "00";
				
				SP_BUF(conv_integer(SP_CUR)).ZERO <= SP_PREBUF(conv_integer(SP_CUR)).ZERO;
				SP_BUF(conv_integer(SP_CUR)).PRI <= SP_PREBUF(conv_integer(SP_CUR)).PRI;
				SP_BUF(conv_integer(SP_CUR)).PAL <= SP_PREBUF(conv_integer(SP_CUR)).PAL;
				SP_BUF(conv_integer(SP_CUR)).HF <= SP_PREBUF(conv_integer(SP_CUR)).HF;
				-- X will be set at the end
				
				SP_BUF(conv_integer(SP_CUR)).P0 <= (others => '0');
				SP_BUF(conv_integer(SP_CUR)).P1 <= (others => '0');
				SP_BUF(conv_integer(SP_CUR)).P2 <= (others => '0');
				SP_BUF(conv_integer(SP_CUR)).P3 <= (others => '0');
				
				if SP_DW(1) = '1' and SP_PREBUF(conv_integer(SP_CUR)).CG = '1' then
					SP_RAM_A_FF <= V_ADDR(15 downto 6) & "10" & V_ADDR(3 downto 0);
				else
					SP_RAM_A_FF <= V_ADDR;
				end if;
				if SP2_ACTIVE = '1' then
					SP_RAM_REQ_FF <= not SP_RAM_REQ_FF;
					SP2 <= SP2_RD0_W;
				else
					SP2 <= SP2_END;
				end if;
			
			when SP2_RD0_W =>
				if (speedUpSp or CLKEN = '1') and SP_RAM_REQ_FF = SP_RAM_ACK then
					if SP2_ACTIVE = '0' then
						SP2 <= SP2_END;					
					else
						SP_CYC <= SP_CYC + 1;
						case SP_DW is
						when "00" =>
							SP_BUF(conv_integer(SP_CUR)).P0 <= SP_RAM_DO;
							SP2 <= SP2_RD1;
						when "01" =>
							if SP_CYC = "01" then
								SP_BUF(conv_integer(SP_CUR)).P0 <= SP_RAM_DO;
								SP2 <= SP2_RD1;
							end if;
						when others =>
							if SP_CYC = "11" then
								if SP_PREBUF(conv_integer(SP_CUR)).CG = '1' then
									SP_BUF(conv_integer(SP_CUR)).P2 <= SP_RAM_DO;
								else
									SP_BUF(conv_integer(SP_CUR)).P0 <= SP_RAM_DO;
								end if;
								SP2 <= SP2_RD3; -- /!\
							end if;
						end case;
					end if;
				end if;
			
			when SP2_RD1 =>
				V_ADDR := SP_PREBUF(conv_integer(SP_CUR)).ADDR;
			
				SP_CYC <= "00";
			
				SP_RAM_A_FF <= V_ADDR(15 downto 6) & "01" & V_ADDR(3 downto 0);
				if SP2_ACTIVE = '1' then
					SP_RAM_REQ_FF <= not SP_RAM_REQ_FF;
					SP2 <= SP2_RD1_W;
				else
					SP2 <= SP2_END;
				end if;
				
			when SP2_RD1_W =>
				if (speedUpSp or CLKEN = '1') and SP_RAM_REQ_FF = SP_RAM_ACK then
					if SP2_ACTIVE = '0' then
						SP2 <= SP2_END;					
					else
						SP_CYC <= SP_CYC + 1;
						case SP_DW is
						when "00" =>
							SP_BUF(conv_integer(SP_CUR)).P1 <= SP_RAM_DO;
							SP2 <= SP2_RD2;
						when others =>
							if SP_CYC = "01" then
								SP_BUF(conv_integer(SP_CUR)).P1 <= SP_RAM_DO;
								SP2 <= SP2_RD2;
							end if;
						end case;
					end if;
				end if;
			
			when SP2_RD2 =>
				V_ADDR := SP_PREBUF(conv_integer(SP_CUR)).ADDR;
			
				SP_CYC <= "00";
			
				SP_RAM_A_FF <= V_ADDR(15 downto 6) & "10" & V_ADDR(3 downto 0);
				if SP2_ACTIVE = '1' then
					SP_RAM_REQ_FF <= not SP_RAM_REQ_FF;
					SP2 <= SP2_RD2_W;
				else
					SP2 <= SP2_END;
				end if;
				
			when SP2_RD2_W =>
				if (speedUpSp or CLKEN = '1') and SP_RAM_REQ_FF = SP_RAM_ACK then
					if SP2_ACTIVE = '0' then
						SP2 <= SP2_END;					
					else
						SP_CYC <= SP_CYC + 1;
						case SP_DW is
						when "00" =>
							SP_BUF(conv_integer(SP_CUR)).P2 <= SP_RAM_DO;
							SP2 <= SP2_RD3;
						when others =>
							if SP_CYC = "01" then
								SP_BUF(conv_integer(SP_CUR)).P2 <= SP_RAM_DO;
								SP2 <= SP2_RD3;
							end if;
						end case;
					end if;
				end if;
			
			when SP2_RD3 =>
				V_ADDR := SP_PREBUF(conv_integer(SP_CUR)).ADDR;
				
				SP_CYC <= "00";

				if SP_DW(1) = '1' and SP_PREBUF(conv_integer(SP_CUR)).CG = '0' then
					SP_RAM_A_FF <= V_ADDR(15 downto 6) & "01" & V_ADDR(3 downto 0);
				else
					SP_RAM_A_FF <= V_ADDR(15 downto 6) & "11" & V_ADDR(3 downto 0);
				end if;
				if SP2_ACTIVE = '1' then
					SP_RAM_REQ_FF <= not SP_RAM_REQ_FF;
					SP2 <= SP2_RD3_W;
				else
					SP2 <= SP2_END;
				end if;
				
			when SP2_RD3_W =>
				if (speedUpSp or CLKEN = '1') and SP_RAM_REQ_FF = SP_RAM_ACK then
					if SP2_ACTIVE = '0' then
						SP2 <= SP2_END;					
					else
						SP_CYC <= SP_CYC + 1;
						case SP_DW is
						when "00" =>
							SP_BUF(conv_integer(SP_CUR)).P3 <= SP_RAM_DO;
							SP_BUF(conv_integer(SP_CUR)).X <= SP_PREBUF(conv_integer(SP_CUR)).X;
							if (SP_CUR = "1111") or ("0" & SP_CUR = SP_NB-1) then
								SP2 <= SP2_END;
							else
								SP_CUR <= SP_CUR + 1;
								SP2 <= SP2_RD0;
							end if;
							
						when "01" =>
							if SP_CYC = "01" then
								SP_BUF(conv_integer(SP_CUR)).P3 <= SP_RAM_DO;
								SP_BUF(conv_integer(SP_CUR)).X <= SP_PREBUF(conv_integer(SP_CUR)).X;
								if (SP_CUR = "1111") or ("0" & SP_CUR = SP_NB-1) then
									SP2 <= SP2_END;
								else
									SP_CUR <= SP_CUR + 1;
									SP2 <= SP2_RD0;
								end if;
							end if;
						when others =>
							if SP_CYC = "11" then
								if SP_PREBUF(conv_integer(SP_CUR)).CG = '0' then
									SP_BUF(conv_integer(SP_CUR)).P1 <= SP_RAM_DO;
								else
									SP_BUF(conv_integer(SP_CUR)).P3 <= SP_RAM_DO;
								end if;
								SP_BUF(conv_integer(SP_CUR)).X <= SP_PREBUF(conv_integer(SP_CUR)).X;
								if (SP_CUR = "1111") or ("0" & SP_CUR = SP_NB-1) then
									SP2 <= SP2_END;
								else
									SP_CUR <= SP_CUR + 1;
									SP2 <= SP2_RD0;
								end if;
							end if;							
						end case;
					end if;
				end if;
			
			when SP2_END =>
				SP_BUSY <= '0';
				
				if SP2_ACTIVE = '0' then
					SP2 <= SP2_INI;
				end if;
				
			when others =>
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Line rendering
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- REN_MEM_A <= X;
process( CLK )
variable V_X	: std_logic_vector(9 downto 0);
begin
	if rising_edge(CLK) then
		IRQ_COL_SET <= '0';
	
		if RESET_N = '0' then
			REN_MEM_WE <= '0';
		
			IRQ_COL_TRIG <= '0';
		
			COLNO_FF <= "1" & "00000000";			
			REN <= REN_BGR;
		else
			case REN is
			when REN_INI =>
				if REN_ACTIVE = '0' then
					IRQ_COL_TRIG <= '0';
					-- Overscan
					COLNO_FF <= "1" & "00000000";
					-- COLNO_FF <= "0" & "00000000";
				else
					REN <= REN_BGW;
					REN_MEM_A <= X;
					REN_MEM_WE <= '0';
				end if;

			when REN_BGW =>
				for I in 0 to 15 loop
					if (X >= SP_BUF(I).X) and (X < SP_BUF(I).X + 16) and SP_ON = '1' then
						if SP_BUF(I).HF = '0' then
							V_X := "0000001111" - (X - SP_BUF(I).X);
						else
							V_X := X - SP_BUF(I).X;
						end if;
						
						REN_SP_COLTAB(I) <= SP_BUF(I).PRI & SP_BUF(I).PAL 
							& SP_BUF(I).P3(conv_integer(V_X(3 downto 0)))
							& SP_BUF(I).P2(conv_integer(V_X(3 downto 0)))
							& SP_BUF(I).P1(conv_integer(V_X(3 downto 0)))
							& SP_BUF(I).P0(conv_integer(V_X(3 downto 0)));
						
						if SP_BUF(I).P3(conv_integer(V_X(3 downto 0))) = '0'
						and SP_BUF(I).P2(conv_integer(V_X(3 downto 0))) = '0'
						and SP_BUF(I).P1(conv_integer(V_X(3 downto 0))) = '0'
						and SP_BUF(I).P0(conv_integer(V_X(3 downto 0))) = '0'
						then
							REN_SP_OPQ(I) <= '0';
						else
							REN_SP_OPQ(I) <= '1';
						end if;
					else
						REN_SP_OPQ(I) <= '0';
					end if;
				end loop;
				REN <= REN_BGR;
			
			when REN_BGR =>
				if REN_SP_OPQ(0) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(0)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(0)(8);
				elsif REN_SP_OPQ(1) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(1)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(1)(8);
				elsif REN_SP_OPQ(2) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(2)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(2)(8);
				elsif REN_SP_OPQ(3) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(3)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(3)(8);
				elsif REN_SP_OPQ(4) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(4)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(4)(8);
				elsif REN_SP_OPQ(5) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(5)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(5)(8);
				elsif REN_SP_OPQ(6) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(6)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(6)(8);
				elsif REN_SP_OPQ(7) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(7)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(7)(8);
				elsif REN_SP_OPQ(8) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(8)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(8)(8);
				elsif REN_SP_OPQ(9) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(9)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(9)(8);
				elsif REN_SP_OPQ(10) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(10)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(10)(8);
				elsif REN_SP_OPQ(11) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(11)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(11)(8);
				elsif REN_SP_OPQ(12) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(12)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(12)(8);
				elsif REN_SP_OPQ(13) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(13)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(13)(8);
				elsif REN_SP_OPQ(14) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(14)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(14)(8);
				elsif REN_SP_OPQ(15) = '1' then
					REN_SP_COL <= REN_SP_COLTAB(15)(7 downto 0);
					REN_SP_PRI <= REN_SP_COLTAB(15)(8);				
				else
					REN_SP_COL <= x"00";
					REN_SP_PRI <= '0';
				end if;
				
				-- Collision
				if REN_SP_OPQ(0) = '1' 
				and REN_SP_OPQ(14 downto 0) /= "000000000000000" 
				and SP_BUF(0).ZERO = '1'
				and IRQ_COL_TRIG = '0'
				then
					IRQ_COL_TRIG <= '1';
					if CR(0) = '1' then
						IRQ_COL_SET <= '1';
					end if;
				end if;
				
				-- REN_BG_COL <= REN_MEM_DO;
				REN <= REN_CLK;
			
			when REN_CLK =>
				if REN_SP_PRI = '1' then
					COLNO_FF <= "1" & REN_SP_COL;
				-- elsif REN_BG_COL(3 downto 0) /= "0000" then
				--	COLNO_FF <= "0" & REN_BG_COL;
				elsif REN_MEM_DO(3 downto 0) /= "0000" and BG_ON = '1' then
					COLNO_FF <= "0" & REN_MEM_DO;
				elsif REN_SP_COL(3 downto 0) /= "0000" then
					COLNO_FF <= "1" & REN_SP_COL;
				else
					COLNO_FF <= "0" & "00000000";
				end if;
				
				-- REN_MEM_WE <= '1';
				if CLKEN = '1' then
					REN <= REN_INI;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- VRAM-VRAM DMA
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

process( CLK )
begin
	if rising_edge(CLK) then
		DMA_SOUR_SET_REQ <= '0';
		DMA_DESR_SET_REQ <= '0';
		DMA_LENR_SET_REQ <= '0';
		
		DMA_DMA_CLR	<= '0';
		IRQ_DMA_SET	<= '0';

		if RESET_N = '0' then
			DMA_BUSY <= '0';

			DMA_RAM_REQ_FF <= '0';
			DMA_RAM_A_FF <= (others => '0');
			DMA_RAM_DI_FF <= (others => '0');
			DMA_RAM_WE_FF <= '0';

			DMA <= DMA_IDLE;
		else
			case DMA is
			when DMA_IDLE =>
				if DMA_ACTIVE = '1' and DMA_REQ = '1' then
					DMA_BUSY <= '1';
					DMA <= DMA_READ;
				else
					DMA_BUSY <= '0';
				end if;
			
			when DMA_READ =>
				DMA_RAM_REQ_FF <= not DMA_RAM_REQ_FF;
				DMA_RAM_A_FF <= SOUR;
				DMA_RAM_WE_FF <= '0';
				DMA <= DMA_READ1;
				
			when DMA_READ1 =>
				if CLKEN = '1' and DMA_RAM_REQ_FF = DMA_RAM_ACK then
					DMA <= DMA_READ2;
				end if;
			
			when DMA_READ2 =>
				DMA_RAM_DI_FF <= DMA_RAM_DO;
				DMA <= DMA_WRITE;
			
			when DMA_WRITE =>
				DMA_RAM_REQ_FF <= not DMA_RAM_REQ_FF;
				DMA_RAM_A_FF <= DESR;
				DMA_RAM_WE_FF <= '1';

			when DMA_WRITE1 =>
				if CLKEN = '1' and DMA_RAM_REQ_FF = DMA_RAM_ACK then
					DMA_RAM_WE_FF <= '0';
					DMA_SOUR_SET_REQ <= '1';
					DMA_DESR_SET_REQ <= '1';
					DMA_LENR_SET_REQ <= '1';
					DMA <= DMA_WRITE2;
				end if;
			
			when DMA_WRITE2 =>
				DMA <= DMA_LOOP;
				
			when DMA_LOOP =>
				DMA <= DMA_LOOP2;
				if LENR = x"FFFF" then
					DMA_DMA_CLR	<= '1';
					DMA_BUSY <= '0';
					if DCR(1) = '1' then 
						IRQ_DMA_SET	<= '1';
					end if;
				end if;
				
			when DMA_LOOP2 =>
				DMA <= DMA_IDLE;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- VRAM-SAT DMA
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

process( CLK )
begin
	if rising_edge(CLK) then
		DMAS_DMAS_CLR <= '0';
		IRQ_DMAS_SET <= '0';

		if RESET_N = '0' then
			DMAS_BUSY <= '0';
			DMAS_RAM_REQ_FF <= '0';
			DMAS_RAM_A_FF <= (others => '0');

			DMAS_SAT_A <= (others => '0');
			DMAS_SAT_DI <= (others => '0');
			DMAS_SAT_WE <= '0';
			
			DMAS <= DMAS_IDLE;
		else
			case DMAS is
			when DMAS_IDLE =>
				if DMAS_ACTIVE = '1'
				and (DMAS_REQ = '1' or DCR(4) = '1') -- Auto SATB DMA
				then
					DMAS_BUSY <= '1';
					DMAS_SAT_A <= x"00";
					DMAS_RAM_A_FF <= SATB;
					DMAS <= DMAS_READ;
				end if;
			
			when DMAS_READ =>
				DMAS_RAM_REQ_FF <= not DMAS_RAM_REQ_FF;
				DMAS <= DMAS_READ1;
				
			when DMAS_READ1 =>
				if CLKEN = '1' and DMAS_RAM_REQ_FF = DMAS_RAM_ACK then
					DMAS <= DMAS_READ2;
				end if;
			
			when DMAS_READ2 =>
				DMAS_SAT_DI <= DMAS_RAM_DO;
				DMAS_SAT_WE <= '1';
				DMAS <= DMAS_WRITE;
				
			when DMAS_WRITE =>
				DMAS_SAT_WE <= '0';
				if CLKEN = '1' then
					DMAS_SAT_A <= DMAS_SAT_A + 1;
					DMAS_RAM_A_FF <= DMAS_RAM_A_FF + 1;
					if DMAS_SAT_A = x"FF" then
						DMAS <= DMAS_END;
						DMAS_DMAS_CLR <= '1';
						DMAS_BUSY <= '0';
					else
						DMAS <= DMAS_READ;
					end if;
				end if;
			
			when DMAS_END =>
				if DMAS_ACTIVE = '0' then
					DMAS <= DMAS_IDLE;
					if DCR(0) = '1' then
						IRQ_DMAS_SET <= '1';
					end if;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- CPU Interface
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BUSY <= BG_BUSY2 or SP_BUSY or DMA_BUSY or DMAS_BUSY;
IRQ_N_FF <= not ( IRQ_COL or IRQ_OVF or IRQ_RCR or IRQ_DMAS or IRQ_DMA or IRQ_VBL);

process( CLK )
variable V_MARR		: std_logic_vector(15 downto 0);
begin
	if rising_edge(CLK) then

		CPU_IRQ_CLR <= '0';
		CPU_SOUR_SET_REQ <= '0';
		CPU_DESR_SET_REQ <= '0';
		CPU_LENR_SET_REQ <= '0';
		CPU_DMAS_REQ <= '0';
		CPU_DMA_REQ <= '0';
		YOFS_REL_REQ <= '0';
	
		if RESET_N = '0' then
			
			MAWR <= x"0000";
			MARR <= x"0000";
			
			VRR <= x"FFFF";
			VWR <= x"FFFF";
			
			RCR <= x"0000";
						
-- Values taken from The Kung Fu
-- CR <= x"00CC";
CR <= x"0000";
-- MWR <= x"0010";
MWR <= x"0000";
HPR <= x"0202";
HDR <= x"031F";
VSR <= x"0F02";
VDR <= x"00EF";
VDE <= x"0003";
BXR <= x"0000";
BYR <= x"0000";			
-- DCR <= x"0010";
DCR <= x"0000";
--SATB <= x"0800";
SATB <= x"0000";

-- -- Values taken from BALL.PCE
-- CR <= x"00C8";
-- MWR <= x"0010";
-- HPR <= x"0302";
-- HDR <= x"031F";
-- VSR <= x"1702";
-- VDR <= x"00DF";
-- VDE <= x"000C";
-- BXR <= x"0000";
-- BYR <= x"0000";
-- DCR <= x"0010";
-- SATB <= x"7F00";
			
			RD_BUF <= (others => '1');
			WR_BUF <= (others => '0');
			REG_SEL <= (others => '0');

			CPU_SOUR_SET_VAL <= (others => '0');
			CPU_DESR_SET_VAL <= (others => '0');
			CPU_LENR_SET_VAL <= (others => '0');
			
			CPU_RAM_REQ_FF <= '0';
			CPU_RAM_WE_FF <= '0';
			
			DO_FF <= x"FF";
			BUSY_N_FF <= '1';
			
			PREV_A <= (others => '0');
			CPU <= CPU_IDLE;
		else
			case CPU is
			when CPU_IDLE =>
				BUSY_N_FF <= '1';
				CPU_RAM_WE_FF <= '0';
			
				if CE_N = '0' and WR_N = '0' then
					-- CPU Write
					PREV_A <= A;
					CPU <= CPU_WAIT;
					case A is
					when "00" =>
						REG_SEL <= DI(4 downto 0);
						
					when "10" =>
						case REG_SEL is
						when "00000" =>
							MAWR(7 downto 0) <= DI;
						when "00001" =>
							MARR(7 downto 0) <= DI;
						when "00010" =>
							WR_BUF(7 downto 0) <= DI;
						when "00101" =>
							CR(7 downto 0) <= DI;
						when "00110" =>
							RCR(7 downto 0) <= DI;
						when "00111" =>
							BXR(7 downto 0) <= DI;
						when "01000" =>
							BYR(7 downto 0) <= DI;
							YOFS_REL_REQ <= '1';
						when "01001" =>
							MWR(7 downto 0) <= DI;
						when "01010" =>
							HPR(7 downto 0) <= DI;
						when "01011" =>
							HDR(7 downto 0) <= DI;
						when "01100" =>
							VSR(7 downto 0) <= DI;
						when "01101" =>
							VDR(7 downto 0) <= DI;
						when "01110" =>
							VDE(7 downto 0) <= DI;
						when "01111" =>
							DCR(7 downto 0) <= DI;
						when "10000" =>
							CPU_SOUR_SET_VAL <= SOUR(15 downto 8) & DI;
							CPU_SOUR_SET_REQ <= '1';
						when "10001" =>
							CPU_DESR_SET_VAL <= DESR(15 downto 8) & DI;
							CPU_DESR_SET_REQ <= '1';
						when "10010" =>
							CPU_LENR_SET_VAL <= LENR(15 downto 8) & DI;
							CPU_LENR_SET_REQ <= '1';
						when "10011" =>
							SATB(7 downto 0) <= DI;							
						when others => null;
						end case;
					
					when "11" =>
						case REG_SEL is
						when "00000" =>
							MAWR(15 downto 8) <= DI;
						when "00001" =>
							MARR(15 downto 8) <= DI;
							
							CPU_RAM_A_FF <= DI & MARR(7 downto 0);
							CPU_RAM_WE_FF <= '0';
							-- CPU_RAM_REQ_FF <= not CPU_RAM_REQ_FF;
							BUSY_N_FF <= '0';
							CPU <= CPU_RAM_PRE_RD;
						when "00010" =>
							WR_BUF(15 downto 8) <= DI;
							CPU_RAM_A_FF <= MAWR;
							CPU_RAM_WE_FF <= '1';
							CPU_RAM_DI_FF <= DI & WR_BUF(7 downto 0);
							-- CPU_RAM_REQ_FF <= not CPU_RAM_REQ_FF;
							BUSY_N_FF <= '0';
							CPU <= CPU_RAM_PRE_WR_INC;
						when "00101" =>
							CR(15 downto 8) <= DI;
						when "00110" =>
							RCR(15 downto 8) <= DI;
						when "00111" =>
							BXR(15 downto 8) <= DI;
						when "01000" =>
							BYR(15 downto 8) <= DI;
							YOFS_REL_REQ <= '1';
						when "01001" =>
							MWR(15 downto 8) <= DI;
						when "01010" =>
							HPR(15 downto 8) <= DI;
						when "01011" =>
							HDR(15 downto 8) <= DI;
						when "01100" =>
							VSR(15 downto 8) <= DI;
						when "01101" =>
							VDR(15 downto 8) <= DI;
						when "01110" =>
							VDE(15 downto 8) <= DI;
						when "01111" =>
							DCR(15 downto 8) <= DI;
						when "10000" =>
							CPU_SOUR_SET_VAL <= DI & SOUR(7 downto 0);
							CPU_SOUR_SET_REQ <= '1';
						when "10001" =>
							CPU_DESR_SET_VAL <= DI & DESR(7 downto 0);
							CPU_DESR_SET_REQ <= '1';
						when "10010" =>
							CPU_LENR_SET_VAL <= DI & LENR(7 downto 0);
							CPU_LENR_SET_REQ <= '1';
							CPU_DMA_REQ <= '1';
						when "10011" =>
							SATB(15 downto 8) <= DI;
							CPU_DMAS_REQ <= '1';
						when others => null;
						end case;
					
					when others => null;
					end case;
				elsif CE_N = '0' and RD_N = '0' then
					-- CPU Read
					PREV_A <= A;
					CPU <= CPU_WAIT;
					DO_FF <= x"FF";
					case A is
					when "00" =>
						DO_FF <= "0" 
							& BUSY 
							& IRQ_VBL
							& IRQ_DMA
							& IRQ_DMAS
							& IRQ_RCR
							& IRQ_OVF
							& IRQ_COL;
						CPU_IRQ_CLR <= '1';
					when "10" =>
						DO_FF <= RD_BUF(7 downto 0);
					when "11" =>
						DO_FF <= RD_BUF(15 downto 8);
						if REG_SEL = "0" & x"2" then
							case CR(12 downto 11) is
							when "00" => V_MARR := MARR + 1;
							when "01" => V_MARR := MARR + 32;
							when "10" => V_MARR := MARR + 64;
							when "11" => V_MARR := MARR + 128;
							when others => null;
							end case;
							MARR <= V_MARR;
							
							CPU_RAM_A_FF <= V_MARR;
							CPU_RAM_WE_FF <= '0';
							-- CPU_RAM_REQ_FF <= not CPU_RAM_REQ_FF;
							BUSY_N_FF <= '0';
							CPU <= CPU_RAM_PRE_RD;							
						end if;
					when others => null;
					end case;
				end if;
			
			when CPU_RAM_PRE_RD =>
				-- if SP_BUSY = '0' 
				-- and BG_BUSY = '0'
				-- and DMAS_BUSY = '0'
				-- and DMA_BUSY = '0'
				-- then
					CPU_RAM_REQ_FF <= not CPU_RAM_REQ_FF;
					CPU <= CPU_RAM_RD;
				-- end if;
			
			when CPU_RAM_RD =>
				if CPU_RAM_ACK = CPU_RAM_REQ_FF then
					RD_BUF <= CPU_RAM_DO;
					CPU <= CPU_WAIT;
				end if;
			
			when CPU_RAM_PRE_WR_INC =>
				if SP_BUSY = '0' 
				and BG_BUSY = '0'
				and DMAS_BUSY = '0'
				and DMA_BUSY = '0'
				then
					CPU_RAM_REQ_FF <= not CPU_RAM_REQ_FF;
					CPU <= CPU_RAM_WR_INC;
				end if;
			
			
			when CPU_RAM_WR_INC =>
				if CPU_RAM_ACK = CPU_RAM_REQ_FF then
					CPU_RAM_WE_FF <= '0';
					case CR(12 downto 11) is
					when "00" => MAWR <= MAWR + 1;
					when "01" => MAWR <= MAWR + 32;
					when "10" => MAWR <= MAWR + 64;
					when "11" => MAWR <= MAWR + 128;
					when others => null;
					end case;
					CPU <= CPU_WAIT;
				end if;
			
			when CPU_WAIT =>
				BUSY_N_FF <= '1';
				CPU_RAM_WE_FF <= '0';

				-- See the related comment in VCE's CPU interface
				CPU <= CPU_IDLE;
				if CE_N = '0' and (RD_N = '0' or WR_N = '0') and PREV_A = A then
					CPU <= CPU_WAIT;
				end if;
				
			when others => null;
			end case;
		end if;
	end if;
end process;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Dual-triggered latches
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Interrupts
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_RCR <= '0';
		elsif IRQ_RCR_SET = '1' then
			IRQ_RCR <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_RCR <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_VBL <= '0';
		elsif IRQ_VBL_SET = '1' then
			IRQ_VBL <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_VBL <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_COL <= '0';
		elsif IRQ_COL_SET = '1' then
			IRQ_COL <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_COL <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_OVF <= '0';
		elsif IRQ_OVF_SET = '1' then
			IRQ_OVF <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_OVF <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_DMA <= '0';
		elsif IRQ_DMA_SET = '1' then
			IRQ_DMA <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_DMA <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			IRQ_DMAS <= '0';
		elsif IRQ_DMAS_SET = '1' then
			IRQ_DMAS <= '1';
		elsif CPU_IRQ_CLR = '1' then
			IRQ_DMAS <= '0';
		end if;
	end if;
end process;

-- DMA/DMAS begin/end
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			DMA_REQ <= '0';
		elsif CPU_DMA_REQ = '1' then
			DMA_REQ <= '1';
		elsif DMA_DMA_CLR = '1' then
			DMA_REQ <= '0';
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			DMAS_REQ <= '0';
		elsif CPU_DMAS_REQ = '1' then
			DMAS_REQ <= '1';
		elsif DMAS_DMAS_CLR = '1' then
			DMAS_REQ <= '0';
		end if;
	end if;
end process;

-- VRAM-VRAM DMA registers
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			SOUR <= (others => '0');
		elsif CPU_SOUR_SET_REQ = '1' then
			SOUR <= CPU_SOUR_SET_VAL;
		elsif DMA_SOUR_SET_REQ = '1' then
			if DCR(2) = '1' then
				SOUR <= SOUR - 1;
			else
				SOUR <= SOUR + 1;
			end if;
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			DESR <= (others => '0');
		elsif CPU_DESR_SET_REQ = '1' then
			DESR <= CPU_DESR_SET_VAL;
		elsif DMA_DESR_SET_REQ = '1' then
			if DCR(3) = '1' then
				DESR <= DESR - 1;
			else
				DESR <= DESR + 1;
			end if;
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			LENR <= (others => '0');
		elsif CPU_LENR_SET_REQ = '1' then
			LENR <= CPU_LENR_SET_VAL;
		elsif DMA_LENR_SET_REQ = '1' then
			LENR <= LENR - 1;
		end if;
	end if;
end process;

-- YOFS Reload
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			YOFS_RELOAD <= '0';
		elsif YOFS_REL_REQ = '1' then
			YOFS_RELOAD <= '1';
		elsif YOFS_REL_ACK = '1' then
			YOFS_RELOAD <= '0';
		end if;
	end if;
end process;


-- Output buffers
BUSY_N <= BUSY_N_FF;
IRQ_N <= IRQ_N_FF;
COLNO <= COLNO_FF;
DO <= DO_FF;



BG_RAM_A	<= BG_RAM_A_FF;
BG_RAM_REQ	<= BG_RAM_REQ_FF;
		
SP_RAM_A	<= SP_RAM_A_FF;
SP_RAM_REQ	<= SP_RAM_REQ_FF;

CPU_RAM_REQ	<= CPU_RAM_REQ_FF;
CPU_RAM_A	<= CPU_RAM_A_FF;
CPU_RAM_DI	<= CPU_RAM_DI_FF;
CPU_RAM_WE	<= CPU_RAM_WE_FF;

DMA_RAM_REQ	<= DMA_RAM_REQ_FF;
DMA_RAM_A	<= DMA_RAM_A_FF;
DMA_RAM_DI	<= DMA_RAM_DI_FF;
DMA_RAM_WE	<= DMA_RAM_WE_FF;

DMAS_RAM_REQ	<= DMAS_RAM_REQ_FF;
DMAS_RAM_A		<= DMAS_RAM_A_FF;

end rtl;
