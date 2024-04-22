library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;   

use work.pRegisterBus.all;
use work.pReg_swan.all;
use work.pBus_savestates.all;
use work.pReg_savestates.all; 

entity gpu is
   generic 
   (
      is_simu : std_logic := '0'
   );
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
      isColor        : in  std_logic;
      
      IRQ_LineComp   : out std_logic;
      IRQ_VBlankTmr  : out std_logic;
      IRQ_VBlank     : out std_logic;
      IRQ_HBlankTmr  : out std_logic;
      
      vertical       : out std_logic := '0';
                     
      RegBus_Din     : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr     : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren    : in  std_logic;
      RegBus_rst     : in  std_logic;
      RegBus_Dout    : out std_logic_vector(BUS_buswidth-1 downto 0);   

      RAM_addr       : out std_logic_vector(15 downto 0) := (others => '0');
      RAM_dataread   : in  std_logic_vector(15 downto 0);       
      
      Color_addr     : out std_logic_vector(7 downto 0) := (others => '0');
      Color_dataread : in  std_logic_vector(15 downto 0);    
      
      pixel_out_addr : out integer range 0 to 32255;     
      pixel_out_data : out std_logic_vector(11 downto 0);
      pixel_out_we   : out std_logic := '0';                   

      -- sound RAM port
      SOUND_addr     : in  std_logic_vector(15 downto 0) := (others => '0');
      SOUND_dataread : out std_logic_vector(15 downto 0);       
      SOUND_valid    : out std_logic;      
      
      -- savestates        
      SSBUS_Din      : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBUS_Adr      : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBUS_wren     : in  std_logic;
      SSBUS_rst      : in  std_logic;
      SSBUS_Dout     : out std_logic_vector(SSBUS_buswidth-1 downto 0);
      
      -- debug
      export_vtime   : out std_logic_vector(7 downto 0)
   );
end entity;

architecture arch of gpu is

   -- register
   signal DISP_CTRL   : std_logic_vector(REG_DISP_CTRL  .upper downto REG_DISP_CTRL  .lower);
   signal BACK_COLOR  : std_logic_vector(REG_BACK_COLOR .upper downto REG_BACK_COLOR .lower);
   signal LINE_CUR    : std_logic_vector(REG_LINE_CUR   .upper downto REG_LINE_CUR   .lower) := (others => '0');
   signal LINE_CMP    : std_logic_vector(REG_LINE_CMP   .upper downto REG_LINE_CMP   .lower);
   signal SPR_BASE    : std_logic_vector(REG_SPR_BASE   .upper downto REG_SPR_BASE   .lower);
   signal SPR_FIRST   : std_logic_vector(REG_SPR_FIRST  .upper downto REG_SPR_FIRST  .lower);
   signal SPR_COUNT   : std_logic_vector(REG_SPR_COUNT  .upper downto REG_SPR_COUNT  .lower);
   signal MAP_BASE    : std_logic_vector(REG_MAP_BASE   .upper downto REG_MAP_BASE   .lower);
   signal SCR2_WIN_X0 : std_logic_vector(REG_SCR2_WIN_X0.upper downto REG_SCR2_WIN_X0.lower);
   signal SCR2_WIN_Y0 : std_logic_vector(REG_SCR2_WIN_Y0.upper downto REG_SCR2_WIN_Y0.lower);
   signal SCR2_WIN_X1 : std_logic_vector(REG_SCR2_WIN_X1.upper downto REG_SCR2_WIN_X1.lower);
   signal SCR2_WIN_Y1 : std_logic_vector(REG_SCR2_WIN_Y1.upper downto REG_SCR2_WIN_Y1.lower);
   signal SPR_WIN_X0  : std_logic_vector(REG_SPR_WIN_X0 .upper downto REG_SPR_WIN_X0 .lower);
   signal SPR_WIN_Y0  : std_logic_vector(REG_SPR_WIN_Y0 .upper downto REG_SPR_WIN_Y0 .lower);
   signal SPR_WIN_X1  : std_logic_vector(REG_SPR_WIN_X1 .upper downto REG_SPR_WIN_X1 .lower);
   signal SPR_WIN_Y1  : std_logic_vector(REG_SPR_WIN_Y1 .upper downto REG_SPR_WIN_Y1 .lower);
   signal SCR1_X      : std_logic_vector(REG_SCR1_X     .upper downto REG_SCR1_X     .lower);
   signal SCR1_Y      : std_logic_vector(REG_SCR1_Y     .upper downto REG_SCR1_Y     .lower);
   signal SCR2_X      : std_logic_vector(REG_SCR2_X     .upper downto REG_SCR2_X     .lower);
   signal SCR2_Y      : std_logic_vector(REG_SCR2_Y     .upper downto REG_SCR2_Y     .lower);
   signal LCD_CTRL    : std_logic_vector(REG_LCD_CTRL   .upper downto REG_LCD_CTRL   .lower);
   signal LCD_ICON    : std_logic_vector(REG_LCD_ICON   .upper downto REG_LCD_ICON   .lower);
   signal LCD_VTOTAL  : std_logic_vector(REG_LCD_VTOTAL .upper downto REG_LCD_VTOTAL .lower);
   signal LCD_VSYNC   : std_logic_vector(REG_LCD_VSYNC  .upper downto REG_LCD_VSYNC  .lower);
   
   signal LCD_ICON_written : std_logic;
   
   signal DISP_MODE   : std_logic_vector(REG_DISP_MODE  .upper downto REG_DISP_MODE  .lower);
   
   type tPalettePool is array(0 to 3) of std_logic_vector(7 downto 0);
   signal PalettePool : tPalettePool;
   
   type tPalette is array(0 to 31) of std_logic_vector(7 downto 0);
   signal Palette : tPalette;

   signal TMR_CTRL    : std_logic_vector(REG_TMR_CTRL   .upper downto REG_TMR_CTRL  .lower);
   signal HTMR_FREQ   : std_logic_vector(15 downto 0);
   signal VTMR_FREQ   : std_logic_vector(15 downto 0);
   signal HTMR_CTR    : std_logic_vector(15 downto 0);
   signal VTMR_CTR    : std_logic_vector(15 downto 0);
   
   signal TMR_CTRL_written    : std_logic;
   signal HTMR_FREQ_H_written : std_logic;
   signal HTMR_FREQ_L_written : std_logic;
   signal VTMR_FREQ_H_written : std_logic;
   signal VTMR_FREQ_L_written : std_logic;
   

   type t_reg_wired_or is array(0 to 69) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;

   -- timing
   signal xCount              : unsigned(7 downto 0) := (others => '0');
   signal startLine           : std_logic;
   signal newLine             : std_logic;
   signal lineY               : std_logic_vector(7 downto 0) := (others => '0');
   signal lineYNext           : std_logic_vector(7 downto 0) := (others => '0');
         
   -- latched regs      
   signal displayControl      : std_logic_vector(7 downto 0) := (others => '0');
	signal backColor           : std_logic_vector(7 downto 0) := (others => '0');
	signal screenMapBase       : std_logic_vector(7 downto 0) := (others => '0');
	signal scrollX1	         : std_logic_vector(7 downto 0) := (others => '0');
	signal scrollY1	         : std_logic_vector(7 downto 0) := (others => '0');
	signal scrollX2	         : std_logic_vector(7 downto 0) := (others => '0');
	signal scrollY2	         : std_logic_vector(7 downto 0) := (others => '0');
	signal scr2WinX0           : std_logic_vector(7 downto 0) := (others => '0');
	signal scr2WinY0           : std_logic_vector(7 downto 0) := (others => '0');
	signal scr2WinX1           : std_logic_vector(7 downto 0) := (others => '0');
	signal scr2WinY1           : std_logic_vector(7 downto 0) := (others => '0');
	signal spr2WinX0           : std_logic_vector(7 downto 0) := (others => '0');
	signal spr2WinY0           : std_logic_vector(7 downto 0) := (others => '0');
	signal spr2WinX1           : std_logic_vector(7 downto 0) := (others => '0');
	signal spr2WinY1           : std_logic_vector(7 downto 0) := (others => '0');
   
   -- memory muxing
   signal memoryArbiter       : unsigned(2 downto 0) := (others => '0');
   
   -- sprite DMA
   signal spriteDMAon         : std_logic := '0';
   signal spriteDMACnt        : integer range 0 to 127;
   signal spriteDMAAddr       : std_logic_vector(15 downto 0) := (others => '0');
   signal spriteDMAData       : std_logic_vector(15 downto 0) := (others => '0');
   signal spriteDMAWait       : integer range 0 to 2;
   
   signal spriteCount         : integer range 0 to 128;
   type tspriteRAM is array(0 to 127) of std_logic_vector(31 downto 0);
   signal spriteRAM : tspriteRAM;
   
   -- sprite line fetching
   type tSpriteLineState is
   (
      IDLE,
      FETCHSPRITE,
      CHECKACTIVE,
      FETCHCOLOR0,
      FETCHCOLOR1
   );
   signal spriteLineState     : tSpriteLineState := IDLE;
   
   signal spriteLineCounter   : integer range 0 to 127;
   signal spritesOnLine       : integer range 0 to 31;
   signal spriteLineData      : std_logic_vector(31 downto 0);
   signal spriteColorData     : std_logic_vector(31 downto 0);
   
   signal spritesClearNext    : std_logic := '0';
   signal spritesLoadNext     : std_logic := '0';
   signal spritesLoadIndex    : integer range 0 to 31;
   signal spritesLoadData     : std_logic_vector(31 downto 0);
   
   -- PPU modules
   signal depth2              : std_logic;
   signal isGray              : std_logic;
   
   signal RAM_Address_BG0     : std_logic_vector(15 downto 0);
   signal RAM_Address_BG1     : std_logic_vector(15 downto 0);
   signal RAM_Address_SPR     : std_logic_vector(15 downto 0) := (others => '0');
   signal RAM_Data_BG0        : std_logic_vector(15 downto 0);
   signal RAM_Data_BG1        : std_logic_vector(15 downto 0);
   signal RAM_valid_BG0       : std_logic;
   signal RAM_valid_BG1       : std_logic;
   signal RAM_valid_SPR       : std_logic;
   
   
   signal tileActive_BG0      : std_logic;
   signal tileActive_BG1      : std_logic;
   signal tileActive_SPR      : std_logic;
   signal tileActive_SPR2     : std_logic;
   signal tilePrio_SPR        : std_logic;
   signal tilePalette_BG0     : std_logic_vector(3 downto 0);
   signal tilePalette_BG1     : std_logic_vector(3 downto 0);
   signal tilePalette_SPR     : std_logic_vector(3 downto 0);
   signal tilePalette_SPR2    : std_logic_vector(3 downto 0);
   signal tileColor_BG0       : std_logic_vector(3 downto 0);   
   signal tileColor_BG1       : std_logic_vector(3 downto 0);   
   signal tileColor_SPR       : std_logic_vector(3 downto 0);   
   signal tileColor_SPR2      : std_logic_vector(3 downto 0);   
   
   -- Color Mixing
   signal paletteColor        : std_logic_vector(2 downto 0) := (others => '0');
   signal poolColor           : std_logic_vector(3 downto 0);
   signal colorall            : std_logic_vector(11 downto 0);
   
   -- savestates
   signal SS_GPU              : std_logic_vector(REG_SAVESTATE_GPU  .upper downto REG_SAVESTATE_GPU  .lower);
   signal SS_GPU_BACK         : std_logic_vector(REG_SAVESTATE_GPU  .upper downto REG_SAVESTATE_GPU  .lower);
   
   signal SS_TIMER            : std_logic_vector(REG_SAVESTATE_TIMER.upper downto REG_SAVESTATE_TIMER.lower);
   signal SS_TIMER_BACK       : std_logic_vector(REG_SAVESTATE_TIMER.upper downto REG_SAVESTATE_TIMER.lower);

   signal SS_MIXED            : std_logic_vector(REG_SAVESTATE_MIXED.upper downto REG_SAVESTATE_MIXED.lower);
   signal SS_MIXED_BACk       : std_logic_vector(REG_SAVESTATE_MIXED.upper downto REG_SAVESTATE_MIXED.lower);

   type t_ss_wired_or is array(0 to 2) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;   

begin 

   export_vtime <= LINE_CUR;

   iDISP_CTRL   : entity work.eReg generic map ( REG_DISP_CTRL   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0 ), DISP_CTRL  , DISP_CTRL  );  
   iBACK_COLOR  : entity work.eReg generic map ( REG_BACK_COLOR  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1 ), BACK_COLOR , BACK_COLOR );  
   iLINE_CUR    : entity work.eReg generic map ( REG_LINE_CUR    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2 ), LINE_CUR   );  
   iLINE_CMP    : entity work.eReg generic map ( REG_LINE_CMP    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(3 ), LINE_CMP   , LINE_CMP   );  
   iSPR_BASE    : entity work.eReg generic map ( REG_SPR_BASE    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(4 ), SPR_BASE   , SPR_BASE   );  
   iSPR_FIRST   : entity work.eReg generic map ( REG_SPR_FIRST   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(5 ), SPR_FIRST  , SPR_FIRST  );  
   iSPR_COUNT   : entity work.eReg generic map ( REG_SPR_COUNT   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(6 ), SPR_COUNT  , SPR_COUNT  );  
   iMAP_BASE    : entity work.eReg generic map ( REG_MAP_BASE    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(7 ), MAP_BASE   , MAP_BASE   );  
   iSCR2_WIN_X0 : entity work.eReg generic map ( REG_SCR2_WIN_X0 ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(8 ), SCR2_WIN_X0, SCR2_WIN_X0);  
   iSCR2_WIN_Y0 : entity work.eReg generic map ( REG_SCR2_WIN_Y0 ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(9 ), SCR2_WIN_Y0, SCR2_WIN_Y0);  
   iSCR2_WIN_X1 : entity work.eReg generic map ( REG_SCR2_WIN_X1 ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(10), SCR2_WIN_X1, SCR2_WIN_X1);  
   iSCR2_WIN_Y1 : entity work.eReg generic map ( REG_SCR2_WIN_Y1 ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(11), SCR2_WIN_Y1, SCR2_WIN_Y1);  
   iSPR_WIN_X0  : entity work.eReg generic map ( REG_SPR_WIN_X0  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(12), SPR_WIN_X0 , SPR_WIN_X0 );  
   iSPR_WIN_Y0  : entity work.eReg generic map ( REG_SPR_WIN_Y0  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(13), SPR_WIN_Y0 , SPR_WIN_Y0 );  
   iSPR_WIN_X1  : entity work.eReg generic map ( REG_SPR_WIN_X1  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(14), SPR_WIN_X1 , SPR_WIN_X1 );  
   iSPR_WIN_Y1  : entity work.eReg generic map ( REG_SPR_WIN_Y1  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(15), SPR_WIN_Y1 , SPR_WIN_Y1 );  
   iSCR1_X      : entity work.eReg generic map ( REG_SCR1_X      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(16), SCR1_X     , SCR1_X     );  
   iSCR1_Y      : entity work.eReg generic map ( REG_SCR1_Y      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(17), SCR1_Y     , SCR1_Y     );  
   iSCR2_X      : entity work.eReg generic map ( REG_SCR2_X      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(18), SCR2_X     , SCR2_X     );  
   iSCR2_Y      : entity work.eReg generic map ( REG_SCR2_Y      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(19), SCR2_Y     , SCR2_Y     );  
   iLCD_CTRL    : entity work.eReg generic map ( REG_LCD_CTRL    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(20), LCD_CTRL   , LCD_CTRL   );  
   iLCD_ICON    : entity work.eReg generic map ( REG_LCD_ICON    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(21), LCD_ICON   , LCD_ICON   , LCD_ICON_written);  
   iLCD_VTOTAL  : entity work.eReg generic map ( REG_LCD_VTOTAL  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(22), LCD_VTOTAL , LCD_VTOTAL );  
   iLCD_VSYNC   : entity work.eReg generic map ( REG_LCD_VSYNC   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(23), LCD_VSYNC  , LCD_VSYNC  );
   
   iDISP_MODE   : entity work.eReg generic map ( REG_DISP_MODE   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(24), DISP_MODE and x"EB", DISP_MODE);  
   
   gREG_PalettePool : for i in 0 to 3 generate 
   begin
      iREG_PalettePool : entity work.eReg generic map ( REG_PalettePool, i ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(25 + i), PalettePool(i), PalettePool(i));  
   end generate;
   
   gREG_Palette : for i in 0 to 31 generate 
   begin
      iREG_Palette : entity work.eReg generic map ( REG_Palette, i ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(29 + i), '0' & Palette(i)(6 downto 4) & '0' & Palette(i)(2 downto 0), Palette(i));  
   end generate;
   
   iTMR_CTRL    : entity work.eReg generic map ( REG_TMR_CTRL     ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(61), TMR_CTRL              , open                  , TMR_CTRL_written   ); 
   iHTMR_FREQ_H : entity work.eReg generic map ( REG_HTMR_FREQ_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(62), HTMR_FREQ( 7 downto 0), HTMR_FREQ( 7 downto 0), HTMR_FREQ_L_written); 
   iHTMR_FREQ_L : entity work.eReg generic map ( REG_HTMR_FREQ_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(63), HTMR_FREQ(15 downto 8), HTMR_FREQ(15 downto 8), HTMR_FREQ_H_written); 
   iVTMR_FREQ_H : entity work.eReg generic map ( REG_VTMR_FREQ_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(64), VTMR_FREQ( 7 downto 0), VTMR_FREQ( 7 downto 0), VTMR_FREQ_L_written); 
   iVTMR_FREQ_L : entity work.eReg generic map ( REG_VTMR_FREQ_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(65), VTMR_FREQ(15 downto 8), VTMR_FREQ(15 downto 8), VTMR_FREQ_H_written); 
   iHTMR_CTR_H  : entity work.eReg generic map ( REG_HTMR_CTR_H   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(66), HTMR_CTR( 7 downto 0)); 
   iHTMR_CTR_L  : entity work.eReg generic map ( REG_HTMR_CTR_L   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(67), HTMR_CTR(15 downto 8)); 
   iVTMR_CTR_H  : entity work.eReg generic map ( REG_VTMR_CTR_H   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(68), VTMR_CTR( 7 downto 0)); 
   iVTMR_CTR_L  : entity work.eReg generic map ( REG_VTMR_CTR_L   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(69), VTMR_CTR(15 downto 8)); 
   
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   IRQ_VBlankTmr <= '1' when (xCount = 255 and unsigned(LINE_CUR) = 143 and TMR_CTRL(2) = '1' and unsigned(VTMR_CTR) = 1) else '0';
   
   IRQ_LineComp  <= '1' when (xCount = 255 and ((unsigned(LINE_CUR) + 1 = unsigned(LINE_CMP)) or (unsigned(LINE_CUR) = 158 and unsigned(LINE_CMP) = 0))) else '0'; 
   
   IRQ_VBlank    <= '1' when (xCount = 255 and unsigned(LINE_CUR) = 143) else '0'; 
   
   IRQ_HBlankTmr <= '1' when (xCount = 255 and TMR_CTRL(0) = '1' and unsigned(HTMR_CTR) = 1) else '0';
   
   -- savestates
   iSS_GPU   : entity work.eReg_SS generic map ( REG_SAVESTATE_GPU   ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(0), SS_GPU_BACK  , SS_GPU  );
   iSS_TIMER : entity work.eReg_SS generic map ( REG_SAVESTATE_TIMER ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(1), SS_TIMER_BACK, SS_TIMER);
   iSS_MIXED : entity work.eReg_SS generic map ( REG_SAVESTATE_MIXED ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(2), SS_MIXED_BACK, SS_MIXED);
   
   process (ss_wired_or)
      variable wired_or : std_logic_vector(63 downto 0);
   begin
      wired_or := ss_wired_or(0);
      for i in 1 to (ss_wired_or'length - 1) loop
         wired_or := wired_or or ss_wired_or(i);
      end loop;
      SSBUS_Dout <= wired_or;
   end process;
   
   SS_GPU_BACK( 7 downto 0) <= std_logic_vector(xCount);
   SS_GPU_BACK(15 downto 8) <= LINE_CUR; 
   
   SS_TIMER_BACK(15 downto  0) <= HTMR_CTR; 
   SS_TIMER_BACK(31 downto 16) <= VTMR_CTR; 
   SS_TIMER_BACK(35 downto 32) <= TMR_CTRL; 
   
   SS_MIXED_BACK(0) <= vertical;
   
   -- timing
   process (clk)
   begin
      if rising_edge(clk) then
      
         if (reset = '1') then
         
            xCount   <= unsigned(SS_GPU(7 downto  0)); -- x"F7";
            LINE_CUR <=          SS_GPU(15 downto 8); -- x"9E";
            
            HTMR_CTR <= SS_TIMER(15 downto  0); -- 0
            VTMR_CTR <= SS_TIMER(31 downto 16); -- 0
            TMR_CTRL <= SS_TIMER(35 downto 32); -- 0
            
         elsif (ce = '1') then
         
            if (TMR_CTRL_written = '1') then
               TMR_CTRL <= RegBus_Din(3 downto 0);
               if (RegBus_Din(0) = '1') then HTMR_CTR <= HTMR_FREQ; end if;
               if (RegBus_Din(2) = '1') then VTMR_CTR <= VTMR_FREQ; end if;
            end if;
            
            if (HTMR_FREQ_H_written = '1' or HTMR_FREQ_L_written = '1') then
               TMR_CTRL(1 downto 0) <= "11";
               if (HTMR_FREQ_L_written = '1') then HTMR_CTR <= HTMR_FREQ(15 downto 8) & RegBus_Din; end if;
               if (HTMR_FREQ_H_written = '1') then HTMR_CTR <= RegBus_Din & HTMR_FREQ( 7 downto 0); end if;
            end if;
            
            if (VTMR_FREQ_H_written = '1' or VTMR_FREQ_L_written = '1') then
               TMR_CTRL(3 downto 2) <= "11";
               if (VTMR_FREQ_L_written = '1') then VTMR_CTR <= VTMR_FREQ(15 downto 8) & RegBus_Din; end if;
               if (VTMR_FREQ_H_written = '1') then VTMR_CTR <= RegBus_Din & VTMR_FREQ( 7 downto 0); end if;
            end if;
            
            xCount <= xCount + 1;
            -- next line
            if (xCount = 255) then
            
               -- latch registers and increase line
               displayControl <= DISP_CTRL;
               backColor      <= BACK_COLOR;
               screenMapBase  <= MAP_BASE;
               scrollX1	      <= SCR1_X;
               scrollY1	      <= SCR1_Y;
               scrollX2	      <= SCR2_X;
               scrollY2	      <= SCR2_Y;
               scr2WinX0      <= SCR2_WIN_X0;
               scr2WinY0      <= SCR2_WIN_Y0;
               scr2WinX1      <= SCR2_WIN_X1;
               scr2WinY1      <= SCR2_WIN_Y1;	
               spr2WinX0      <= SPR_WIN_X0;
               spr2WinY0      <= SPR_WIN_Y0;
               spr2WinX1      <= SPR_WIN_X1;
               spr2WinY1      <= SPR_WIN_Y1;
            
               if (unsigned(LINE_CUR) = 157) then
                  lineYNext <= (others => '0');
               elsif (lineYNext = LCD_VTOTAL) then
                  lineYNext <= (others => '0');
               else
                  lineYNext <= std_logic_vector(unsigned(lineYNext) + 1);
               end if;
               lineY <= lineYNext;
            
               if (unsigned(LINE_CUR) < 158) then
                  LINE_CUR <= std_logic_vector(unsigned(LINE_CUR) + 1);
               else 
                  LINE_CUR <= (others => '0');
               end if;

               -- vblank timer
               if (unsigned(LINE_CUR) = 143) then
               
                  if (TMR_CTRL(2) = '1' and unsigned(VTMR_CTR) > 0) then
                  
                     VTMR_CTR <= std_logic_vector(unsigned(VTMR_CTR) - 1);
                     
                     if (unsigned(VTMR_CTR) = 1) then
                     
                        if (TMR_CTRL(3) = '1') then
                           VTMR_CTR    <= VTMR_FREQ;
                        else
                           TMR_CTRL(2) <= '0';
                        end if;
                     
                     end if;
                     
                  end if;
                  
               end if;
         
               -- hblank timer
               if (TMR_CTRL(0) = '1' and unsigned(HTMR_CTR) > 0) then
               
                  HTMR_CTR <= std_logic_vector(unsigned(HTMR_CTR) - 1);
                  
                  if (unsigned(HTMR_CTR) = 1) then
                  
                     if (TMR_CTRL(1) = '1') then
                        HTMR_CTR    <= HTMR_FREQ;
                     else
                        TMR_CTRL(0) <= '0';
                     end if;
                  
                  end if;
                  
               end if;
         
            end if;
            
            
         end if;
      end if;
   end process;
   
   startLine   <= '1' when (xCount = 0 and unsigned(LINE_CUR) < 144) else '0';
   newLine     <= '1' when (xCount = 0) else '0';
   
   depth2      <= '1' when DISP_MODE(7 downto 6) /= "11" else '0';
   isGray      <= '1' when DISP_MODE(7 downto 6) = "00" else '0';
   
   -- orientation
   process (clk)
   begin
      if rising_edge(clk) then
         if (reset = '1') then
            vertical <= SS_MIXED(0);
         else
            if (LCD_ICON_written = '1') then
               if (LCD_ICON(1) = '1') then vertical <= '1'; end if;
               if (LCD_ICON(2) = '1') then vertical <= '0'; end if;
            end if;
         end if;
      end if;
   end process;   
   
   -- memory access
   process (clk)
   begin
      if rising_edge(clk) then
      
         memoryArbiter <= memoryArbiter + 1;
        
         case (to_integer(memoryArbiter)) is
            when 0 => RAM_addr <= RAM_Address_BG0;
            when 1 => RAM_addr <= spriteDMAAddr;
            when 2 => RAM_addr <= RAM_Address_SPR;
            when 3 => RAM_addr <= SOUND_addr;
            when 4 => RAM_addr <= RAM_Address_BG1;
            when 5 => RAM_addr <= spriteDMAAddr;
            when 6 => RAM_addr <= RAM_Address_SPR;
            when 7 => RAM_addr <= SOUND_addr;
            when others => null;
         end case;
         
         RAM_valid_BG0 <= '0';
         RAM_valid_BG1 <= '0';
         SOUND_valid   <= '0';
         
         case (to_integer(memoryArbiter)) is
            when 2 => RAM_Data_BG0 <= RAM_dataread; RAM_valid_BG0 <= '1';
            when 3 => null; -- sprite DMA
            when 4 => null; -- sprite Color
            when 5 => SOUND_dataread <= RAM_dataread; SOUND_valid <= '1';
            when 6 => RAM_Data_BG1 <= RAM_dataread; RAM_valid_BG1 <= '1';
            when 7 => null; -- sprite DMA
            when 0 => null; -- sprite Color
            when 1 => SOUND_dataread <= RAM_dataread; SOUND_valid <= '1';
            when others => null;
         end case;
      
      end if;
   end process;
   
   RAM_valid_SPR <= '1' when (to_integer(memoryArbiter) = 4 or to_integer(memoryArbiter) = 0) else '0';
   
   -- sprite DMA + loading
   process (clk)
      variable tileY8 : unsigned(7 downto 0);
      variable tileY3 : unsigned(2 downto 0);
   begin
      if rising_edge(clk) then
      
         -- DMA
         if (newLine = '1' and unsigned(LINE_CUR) = 142) then
            spriteDMAon   <= '1';
            spriteDMAWait <= 2;
            spriteDMACnt  <= 0;
            
            if (unsigned(SPR_COUNT) > 128) then
               spriteCount  <= 128;
            else
               spriteCount  <= to_integer(unsigned(SPR_COUNT));
            end if;
                        
            if (DISP_MODE(7 downto 6) /= "11") then
               spriteDMAAddr <= "00" & SPR_BASE(4 downto 0) & SPR_FIRST(6 downto 0) & "00";
            else
               spriteDMAAddr <=  '0' & SPR_BASE(5 downto 0) & SPR_FIRST(6 downto 0) & "00";
            end if;
         end if;
         
         if (spriteDMAWait > 0) then
            spriteDMAWait <= spriteDMAWait - 1;
         elsif (spriteDMAon = '1' and (to_integer(memoryArbiter) = 3 or to_integer(memoryArbiter) = 7)) then
            spriteDMAAddr <= std_logic_vector(unsigned(spriteDMAAddr) + 2);
            if (spriteDMAAddr(1) = '1') then
               spriteRAM(spriteDMACnt) <= RAM_dataread & spriteDMAData;
               if (spriteDMACnt + 1 < spriteCount) then
                  spriteDMACnt <= spriteDMACnt + 1;
               else
                  spriteDMAon   <= '0';
               end if;
            else
               spriteDMAData <= RAM_dataread;
            end if;
         end if;
         
         -- line loading
         spritesClearNext  <= '0';
         spritesLoadNext   <= '0';

         case (spriteLineState) is
         
            when IDLE =>
               if (xCount = 32 and (unsigned(LINE_CUR) < 143 or unsigned(LINE_CUR) = 158)) then
                  spriteLineCounter <= 0;
                  spritesOnLine     <= 0;
                  spritesClearNext  <= '1';
                  if (spriteCount > 0) then
                     spriteLineState   <= FETCHSPRITE;
                  end if;
               end if;
               
            when FETCHSPRITE =>
               spriteLineState <= CHECKACTIVE;
               spriteLineData  <= spriteRAM(spriteLineCounter);
               
            when CHECKACTIVE =>
               if ((unsigned(lineYNext) - unsigned(spriteLineData(23 downto 16))) < 8) then
                  if (RAM_valid_SPR = '1') then -- syncing
                  
                     tileY8 := unsigned(lineYNext) - unsigned(spriteLineData(23 downto 16));
                     if (spriteLineData(15) = '1') then
                        tileY3  := to_unsigned(7, 3) - unsigned(tileY8(2 downto 0));
                     else
                        tileY3  := tileY8(2 downto 0); 
                     end if;
                     if (depth2 = '1' and DISP_MODE(5) = '0') then RAM_Address_SPR <= std_logic_vector(to_unsigned(16#2000#, 16) + unsigned(spriteLineData(8 downto 0) & std_logic_vector(tileY3) & '0'));       end if;
                     if (depth2 = '0' and DISP_MODE(5) = '0') then RAM_Address_SPR <= std_logic_vector(to_unsigned(16#4000#, 16) + unsigned(spriteLineData(8 downto 0) & std_logic_vector(tileY3) & '0' & '0')); end if; 
                     if (depth2 = '1' and DISP_MODE(5) = '1') then RAM_Address_SPR <= std_logic_vector(to_unsigned(16#2000#, 16) + unsigned(spriteLineData(8 downto 0) & std_logic_vector(tileY3) & '0'));       end if;
                     if (depth2 = '0' and DISP_MODE(5) = '1') then RAM_Address_SPR <= std_logic_vector(to_unsigned(16#4000#, 16) + unsigned(spriteLineData(8 downto 0) & std_logic_vector(tileY3) & '0' & '0')); end if; 
                     spriteLineState <= FETCHCOLOR0;
                  end if;
               else
                  if (spriteLineCounter + 1 < spriteCount) then
                     spriteLineState   <= FETCHSPRITE;
                     spriteLineCounter <= spriteLineCounter + 1;
                  else
                     spriteLineState <= IDLE;
                  end if;
               end if;
               
            when FETCHCOLOR0 =>
               if (RAM_valid_SPR = '1') then 
                  RAM_Address_SPR(1)           <= '1';
                  spriteColorData(15 downto 0) <= RAM_dataread;              
                  spriteLineState              <= FETCHCOLOR1;
               end if;
               
            when FETCHCOLOR1 =>
               if (RAM_valid_SPR = '1') then 
                  spriteColorData(31 downto 16) <= RAM_dataread; 
                  spritesLoadNext               <= '1';
                  spritesLoadIndex              <= spritesOnLine;
                  spritesLoadData               <= spriteLineData;
                  if (spriteLineCounter + 1 < spriteCount) then
                     spriteLineState   <= FETCHSPRITE;
                     spriteLineCounter <= spriteLineCounter + 1;
                  else
                     spriteLineState <= IDLE;
                  end if;
                  if (spritesOnLine < 31) then
                     spritesOnLine <= spritesOnLine + 1;
                  else
                     spriteLineState <= IDLE;
                  end if;
               end if;
               
         end case;
         
      
      end if;
   end process;
   
   
   igpu_bg0 : entity work.gpu_bg
   port map
   (
      clk            => clk,           
      ce             => ce,     
      isColor        => isColor,      
                        
      startLine      => startLine,     
      lineY          => lineY,     
                        
      enable         => displayControl(0),
      depth2         => depth2,        
      packed         => DISP_MODE(5),        
      tilemapSize    => DISP_MODE(7),            
      screenbase     => screenMapBase(3 downto 0),    
      scrollX        => scrollX1,       
      scrollY        => scrollY1,       
           
      RAM_Address    => RAM_Address_BG0,
      RAM_Data       => RAM_Data_BG0,           
      RAM_valid      => RAM_valid_BG0,  

      tileActive     => tileActive_BG0,
      tilePalette    => tilePalette_BG0,      
      tileColor      => tileColor_BG0      
   );
   
   igpu_bg1 : entity work.gpu_bg
   port map
   (
      clk            => clk,           
      ce             => ce,    
      isColor        => isColor,      
                        
      startLine      => startLine,     
      lineY          => lineY,
                        
      enable         => displayControl(1),
      depth2         => depth2,   
      packed         => DISP_MODE(5),       
      tilemapSize    => DISP_MODE(7),            
      screenbase     => screenMapBase(7 downto 4),    
      scrollX        => scrollX2,       
      scrollY        => scrollY2,    

      useWindow      => displayControl(5),
      WindowOutside  => displayControl(4),
      WinX0          => scr2WinX0,
      WinY0          => scr2WinY0,
      WinX1          => scr2WinX1,
      WinY1          => scr2WinY1, 
      
      RAM_Address    => RAM_Address_BG1,
      RAM_Data       => RAM_Data_BG1,           
      RAM_valid      => RAM_valid_BG1,                       
   
      tileActive     => tileActive_BG1,
      tilePalette    => tilePalette_BG1,      
      tileColor      => tileColor_BG1      
   );
   
   isprites : entity work.sprites
   port map
   (
      clk            => clk,      
      ce             => ce,       
                        
      startLine      => startLine,
      lineY          => lineY,
                
      enable         => displayControl(2),
      depth2         => depth2, 
      packed         => DISP_MODE(5), 

      useWindow      => displayControl(3),
      WinX0          => spr2WinX0,
      WinY0          => spr2WinY0,
      WinX1          => spr2WinX1,
      WinY1          => spr2WinY1,       

      clearNext      => spritesClearNext,
      loadNext       => spritesLoadNext,
      loadIndex      => spritesLoadIndex,
      loadData       => spritesLoadData, 
      loadColor      => spriteColorData, 
           
      tileActive     => tileActive_SPR,
      tilePrio       => tilePrio_SPR,
      tilePalette    => tilePalette_SPR, 
      tileColor      => tileColor_SPR,
      
      tileActive2    => tileActive_SPR2,
      tilePalette2   => tilePalette_SPR2, 
      tileColor2     => tileColor_SPR2 
   );
   
   
   -- data merge
   process (clk)
      variable output_bg0  : std_logic;
      variable output_bg1  : std_logic;
      variable output_spr  : std_logic;
      variable output_spr2 : std_logic;
   begin
      if rising_edge(clk) then
      
         pixel_out_we <= '0';
         if (pixel_out_we = '1' and pixel_out_addr < 32255) then
            pixel_out_addr <= pixel_out_addr + 1;
         end if;
      
         if (ce = '1') then
            
            if (startLine = '1' and unsigned(lineY) < 144) then
               pixel_out_addr <= to_integer(unsigned(lineY)) * 224;
            end if;
            
            if (unsigned(xCount) >= 20 and unsigned(xCount) < 244 and unsigned(lineY) < 144) then
               pixel_out_we   <= '1';
            end if;
            
            output_bg0  := '0';           
            output_bg1  := '0';
            output_spr  := '0';
            output_spr2 := '0';

            if (tileActive_BG0  = '1' and (tileColor_BG0  /= x"0" or (depth2 = '1' and tilePalette_BG0(2)  = '0'))) then output_bg0  := '1'; end if;
            if (tileActive_BG1  = '1' and (tileColor_BG1  /= x"0" or (depth2 = '1' and tilePalette_BG1(2)  = '0'))) then output_bg1  := '1'; end if;
            if (tileActive_SPR  = '1' and (tileColor_SPR  /= x"0" or (depth2 = '1' and tilePalette_SPR(2)  = '0'))) then output_spr  := '1'; end if;
            if (tileActive_SPR2 = '1' and (tileColor_SPR2 /= x"0" or (depth2 = '1' and tilePalette_SPR2(2) = '0'))) then output_spr2 := '1'; end if;
            
            if (isGray = '1') then
            
               if (output_spr = '1' and (tilePrio_SPR = '1' or output_bg1 = '0')) then
                  case (tileColor_SPR(1 downto 0)) is
                     when "00" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR)) * 2 + 0)(2 downto 0);
                     when "01" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR)) * 2 + 0)(6 downto 4);
                     when "10" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR)) * 2 + 1)(2 downto 0);
                     when "11" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR)) * 2 + 1)(6 downto 4);
                     when others => null;
                  end case;
               elsif (output_spr2 = '1') then
                  case (tileColor_SPR2(1 downto 0)) is
                     when "00" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR2)) * 2 + 0)(2 downto 0);
                     when "01" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR2)) * 2 + 0)(6 downto 4);
                     when "10" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR2)) * 2 + 1)(2 downto 0);
                     when "11" => paletteColor <= Palette(to_integer(unsigned(tilePalette_SPR2)) * 2 + 1)(6 downto 4);
                     when others => null;
                  end case;
               elsif (output_bg1 = '1') then
                  case (tileColor_BG1(1 downto 0)) is
                     when "00" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG1)) * 2 + 0)(2 downto 0);
                     when "01" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG1)) * 2 + 0)(6 downto 4);
                     when "10" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG1)) * 2 + 1)(2 downto 0);
                     when "11" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG1)) * 2 + 1)(6 downto 4);
                     when others => null;
                  end case;
               elsif (output_bg0 = '1') then
                  case (tileColor_BG0(1 downto 0)) is
                     when "00" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG0)) * 2 + 0)(2 downto 0);
                     when "01" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG0)) * 2 + 0)(6 downto 4);
                     when "10" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG0)) * 2 + 1)(2 downto 0);
                     when "11" => paletteColor <= Palette(to_integer(unsigned(tilePalette_BG0)) * 2 + 1)(6 downto 4);
                     when others => null;
                  end case;
               else
                  paletteColor <= backColor(2 downto 0);
               end if;

               if (paletteColor(0) = '1') then
                  poolColor <= std_logic_vector(x"F" - unsigned(PalettePool(to_integer(unsigned(paletteColor(2 downto 1))))(7 downto 4)));
               else
                  poolColor <= std_logic_vector(x"F" - unsigned(PalettePool(to_integer(unsigned(paletteColor(2 downto 1))))(3 downto 0)));
               end if;
               
               pixel_out_data <= poolColor & poolColor & poolColor;
                  
            else
            
               if (output_spr = '1' and (tilePrio_SPR = '1' or output_bg1 = '0')) then
                  Color_addr <= tilePalette_SPR & tileColor_SPR;
               elsif (output_bg1 = '1') then
                  Color_addr <=  tilePalette_BG1 & tileColor_BG1;
               elsif (output_bg0 = '1') then
                  Color_addr <=  tilePalette_BG0 & tileColor_BG0;
               else
                  Color_addr <= backColor;
               end if;
               
               colorall <= Color_dataread(11 downto 0);
               
               pixel_out_data <= colorall;
            
            end if;

            
              
            
         end if;
      
      end if;
   end process;
   

end architecture;





