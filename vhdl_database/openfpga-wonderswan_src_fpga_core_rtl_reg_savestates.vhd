library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pBus_savestates.all;

package pReg_savestates is

   --   (                                                   adr   upper    lower    size   default)  

   -- cpu
   constant REG_SAVESTATE_CPU1        : savestate_type := (  0,   63,      0,        1, x"0000000000000000"); -- DX_CX_AX_IP
   constant REG_SAVESTATE_CPU2        : savestate_type := (  1,   63,      0,        1, x"0000000020000000"); -- SI_BP_SP_BX
   constant REG_SAVESTATE_CPU3        : savestate_type := (  2,   63,      0,        1, x"0000FFFF00000000"); -- SS_CS_ES_DI
   constant REG_SAVESTATE_CPU4        : savestate_type := (  3,   31,      0,        1, x"00000000F0020000"); -- F_DS
   
   constant REG_SAVESTATE_IRQ         : savestate_type := (  5,    7,      0,        1, x"0000000000000000");
   
   constant REG_SAVESTATE_GPU         : savestate_type := (  7,   15,      0,        1, x"0000000000009EFF");
   
   constant REG_SAVESTATE_DMA         : savestate_type := ( 11,   59,      0,        1, x"0000000000000000");
   
   constant REG_SAVESTATE_SOUND3      : savestate_type := ( 15,   10,      0,        1, x"0000000000000000");
   constant REG_SAVESTATE_SOUND4      : savestate_type := ( 16,   19,      0,        1, x"0000000000000000");
   constant REG_SAVESTATE_SOUNDDMA    : savestate_type := ( 17,   59,      0,        1, x"0000000000000000");
   
   constant REG_SAVESTATE_EEPROMINT   : savestate_type := ( 19,   16,      0,        1, x"0000000000000000");
   constant REG_SAVESTATE_EEPROMEXT   : savestate_type := ( 21,   16,      0,        1, x"0000000000000000");
   
   constant REG_SAVESTATE_MIXED       : savestate_type := ( 23,    0,      0,        1, x"0000000000000000");
   
   constant REG_SAVESTATE_TIMER       : savestate_type := ( 27,   35,      0,        1, x"0000000000000000");
   

                                        
   
end package;
