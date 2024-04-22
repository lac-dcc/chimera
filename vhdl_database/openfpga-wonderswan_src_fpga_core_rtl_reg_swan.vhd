library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;

package pReg_swan is

   --   (                                               adr    upper    lower    size   default   accesstype)                                     
   constant REG_DISP_CTRL           : regmap_type := (16#00#,   7,      0,        1,        0,   readwrite);
   constant REG_BACK_COLOR          : regmap_type := (16#01#,   7,      0,        1,        0,   readwrite);
   constant REG_LINE_CUR            : regmap_type := (16#02#,   7,      0,        1,        0,   readonly );
   constant REG_LINE_CMP            : regmap_type := (16#03#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_BASE            : regmap_type := (16#04#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_FIRST           : regmap_type := (16#05#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_COUNT           : regmap_type := (16#06#,   7,      0,        1,        0,   readwrite);
   constant REG_MAP_BASE            : regmap_type := (16#07#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_WIN_X0         : regmap_type := (16#08#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_WIN_Y0         : regmap_type := (16#09#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_WIN_X1         : regmap_type := (16#0A#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_WIN_Y1         : regmap_type := (16#0B#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_WIN_X0          : regmap_type := (16#0C#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_WIN_Y0          : regmap_type := (16#0D#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_WIN_X1          : regmap_type := (16#0E#,   7,      0,        1,        0,   readwrite);
   constant REG_SPR_WIN_Y1          : regmap_type := (16#0F#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR1_X              : regmap_type := (16#10#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR1_Y              : regmap_type := (16#11#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_X              : regmap_type := (16#12#,   7,      0,        1,        0,   readwrite);
   constant REG_SCR2_Y              : regmap_type := (16#13#,   7,      0,        1,        0,   readwrite);
   constant REG_LCD_CTRL            : regmap_type := (16#14#,   7,      0,        1,        0,   readwrite);
   constant REG_LCD_ICON            : regmap_type := (16#15#,   7,      0,        1,        0,   readwrite);
   constant REG_LCD_VTOTAL          : regmap_type := (16#16#,   7,      0,        1,      158,   readwrite);
   constant REG_LCD_VSYNC           : regmap_type := (16#17#,   7,      0,        1,      155,   readwrite);
   
   constant REG_PalettePool         : regmap_type := (16#1C#,   7,      0,        4,        0,   readwrite);
   constant REG_Palette             : regmap_type := (16#20#,   7,      0,       32,        0,   readwrite);
   
   constant REG_DMA_SRC_L           : regmap_type := (16#40#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_SRC_M           : regmap_type := (16#41#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_SRC_H           : regmap_type := (16#42#,   3,      0,        1,        0,   readwrite);
   constant REG_DMA_DST_L           : regmap_type := (16#44#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_DST_H           : regmap_type := (16#45#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_LEN_L           : regmap_type := (16#46#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_LEN_H           : regmap_type := (16#47#,   7,      0,        1,        0,   readwrite);
   constant REG_DMA_CTRL            : regmap_type := (16#48#,   7,      0,        1,        0,   readwrite);
   
   constant REG_SDMA_SRC_L          : regmap_type := (16#4A#,   7,      0,        1,        0,   readwrite);
   constant REG_SDMA_SRC_M          : regmap_type := (16#4B#,   7,      0,        1,        0,   readwrite);
   constant REG_SDMA_SRC_H          : regmap_type := (16#4C#,   3,      0,        1,        0,   readwrite);
   constant REG_SDMA_LEN_L          : regmap_type := (16#4E#,   7,      0,        1,        0,   readwrite);
   constant REG_SDMA_LEN_M          : regmap_type := (16#4F#,   7,      0,        1,        0,   readwrite);
   constant REG_SDMA_LEN_H          : regmap_type := (16#50#,   3,      0,        1,        0,   readwrite);
   constant REG_SDMA_CTRL           : regmap_type := (16#52#,   7,      0,        1,        0,   readwrite);
   
   constant REG_DISP_MODE           : regmap_type := (16#60#,   7,      0,        1,        0,   readwrite);
   
   constant REG_SND_HYPER_CTRL      : regmap_type := (16#6A#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_HYPER_CHAN_CTRL : regmap_type := (16#6B#,   6,      0,        1,        0,   readwrite);
   
   constant REG_SND_CH1_PITCH_L     : regmap_type := (16#80#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH1_PITCH_H     : regmap_type := (16#81#,   2,      0,        1,        0,   readwrite);
   constant REG_SND_CH2_PITCH_L     : regmap_type := (16#82#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH2_PITCH_H     : regmap_type := (16#83#,   2,      0,        1,        0,   readwrite);
   constant REG_SND_CH3_PITCH_L     : regmap_type := (16#84#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH3_PITCH_H     : regmap_type := (16#85#,   2,      0,        1,        0,   readwrite);
   constant REG_SND_CH4_PITCH_L     : regmap_type := (16#86#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH4_PITCH_H     : regmap_type := (16#87#,   2,      0,        1,        0,   readwrite);
   constant REG_SND_CH1_Vol         : regmap_type := (16#88#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH2_Vol         : regmap_type := (16#89#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH3_Vol         : regmap_type := (16#8A#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CH4_Vol         : regmap_type := (16#8B#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_SWEEP_VALUE     : regmap_type := (16#8C#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_SWEEP_TIME      : regmap_type := (16#8D#,   4,      0,        1,        0,   readwrite);
   constant REG_SND_NOISE		      : regmap_type := (16#8E#,   4,      0,        1,        0,   readwrite);
   constant REG_SND_WAVE_BASE       : regmap_type := (16#8F#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_CTRL		      : regmap_type := (16#90#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_OUTPUT		      : regmap_type := (16#91#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_RANDOM_H        : regmap_type := (16#92#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_RANDOM_L        : regmap_type := (16#93#,   6,      0,        1,        0,   readwrite);
   constant REG_SND_VOICE_CTRL      : regmap_type := (16#94#,   3,      0,        1,        0,   readwrite);
   constant REG_SND_HYPERVOICE      : regmap_type := (16#95#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9697_H          : regmap_type := (16#96#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9697_L          : regmap_type := (16#97#,   1,      0,        1,        0,   readwrite);
   constant REG_SND_9899_H          : regmap_type := (16#98#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9899_L          : regmap_type := (16#99#,   1,      0,        1,        0,   readwrite);
   constant REG_SND_9A              : regmap_type := (16#9A#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9B              : regmap_type := (16#9B#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9C              : regmap_type := (16#9C#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9D              : regmap_type := (16#9D#,   7,      0,        1,        0,   readwrite);
   constant REG_SND_9E              : regmap_type := (16#9E#,   1,      0,        1,        0,   readwrite);

   constant REG_HW_FLAGS            : regmap_type := (16#A0#,   7,      0,        1,        0,   readwrite);
   
   constant REG_TMR_CTRL            : regmap_type := (16#A2#,   3,      0,        1,        0,   readwrite);
   constant REG_HTMR_FREQ_H         : regmap_type := (16#A4#,   7,      0,        1,        0,   readwrite);
   constant REG_HTMR_FREQ_L         : regmap_type := (16#A5#,   7,      0,        1,        0,   readwrite);
   constant REG_VTMR_FREQ_H         : regmap_type := (16#A6#,   7,      0,        1,        0,   readwrite);
   constant REG_VTMR_FREQ_L         : regmap_type := (16#A7#,   7,      0,        1,        0,   readwrite);
   constant REG_HTMR_CTR_H          : regmap_type := (16#A8#,   7,      0,        1,        0,   readonly );
   constant REG_HTMR_CTR_L          : regmap_type := (16#A9#,   7,      0,        1,        0,   readonly );
   constant REG_VTMR_CTR_H          : regmap_type := (16#AA#,   7,      0,        1,        0,   readonly );
   constant REG_VTMR_CTR_L          : regmap_type := (16#AB#,   7,      0,        1,        0,   readonly );
   
   constant REG_INT_BASE            : regmap_type := (16#B0#,   7,      0,        1,        0,   readwrite);
   
   constant REG_SER_DATA            : regmap_type := (16#B1#,   7,      0,        1,        0,   readwrite);

   constant REG_INT_ENABLE          : regmap_type := (16#B2#,   7,      0,        1,        0,   readwrite);
   
   constant REG_SER_STATUS          : regmap_type := (16#B3#,   7,      0,        1,        0,   readwrite);
   
   constant REG_INT_STATUS          : regmap_type := (16#B4#,   7,      0,        1,        0,   readwrite);
   
   constant REG_KEYPAD              : regmap_type := (16#B5#,   7,      0,        1,        0,   readwrite);
   
   constant REG_INT_ACK             : regmap_type := (16#B6#,   7,      0,        1,        0,   writeonly);
   
   constant REG_EeIntData_H         : regmap_type := (16#BA#,   7,      0,        1,        0,   readwrite);
   constant REG_EeIntData_L         : regmap_type := (16#BB#,   7,      0,        1,        0,   readwrite);
   constant REG_EeIntAddr_H         : regmap_type := (16#BC#,   7,      0,        1,        0,   readwrite);
   constant REG_EeIntAddr_L         : regmap_type := (16#BD#,   7,      0,        1,        0,   readwrite);
   constant REG_EeIntCmd            : regmap_type := (16#BE#,   7,      0,        1,        0,   readwrite);
   
   constant REG_BANK_ROM2           : regmap_type := (16#C0#,   7,      0,        1,   16#FF#,   readwrite);
   constant REG_BANK_SRAM           : regmap_type := (16#C1#,   7,      0,        1,   16#FF#,   readwrite);
   constant REG_BANK_ROM0           : regmap_type := (16#C2#,   7,      0,        1,   16#FF#,   readwrite);
   constant REG_BANK_ROM1           : regmap_type := (16#C3#,   7,      0,        1,   16#FF#,   readwrite);

   constant REG_EeExtData_H         : regmap_type := (16#C4#,   7,      0,        1,        0,   readwrite);
   constant REG_EeExtData_L         : regmap_type := (16#C5#,   7,      0,        1,        0,   readwrite);
   constant REG_EeExtAddr_H         : regmap_type := (16#C6#,   7,      0,        1,        0,   readwrite);
   constant REG_EeExtAddr_L         : regmap_type := (16#C7#,   7,      0,        1,        0,   readwrite);
   constant REG_EeExtCmd            : regmap_type := (16#C8#,   7,      0,        1,        0,   readwrite);
   
   constant REG_RTC_COMMAND         : regmap_type := (16#CA#,   7,      0,        1,        0,   readwrite);
   constant REG_RTC_WRITE           : regmap_type := (16#CB#,   7,      0,        1,        0,   readwrite);
   
   
end package;
