library IEEE;
use IEEE.std_logic_1164.all;

package scramble_pack is

    constant I_HWSEL_SCRAMBLE : integer := 0; -- this MUST be set true for scramble, the_end, amidar
    constant I_HWSEL_FROGGER  : integer := 1; -- this MUST be set true for frogger
    constant I_HWSEL_SCOBRA   : integer := 2; -- SuperCobra, TazzMania
    constant I_HWSEL_CALIPSO  : integer := 3; -- Calipso
    constant I_HWSEL_DARKPLNT : integer := 4; -- Dark Planet
    constant I_HWSEL_STRATGYX : integer := 5; -- Strategy X
    constant I_HWSEL_ANTEATER : integer := 6; -- Ant Eater (SCOBRA with obj_ram address line obfuscation)
    constant I_HWSEL_LOSTTOMB : integer := 7; -- Lost Tomb (SCOBRA with obj_ram address line obfuscation)
    constant I_HWSEL_MINEFLD  : integer := 8; -- Minefield (SCOBRA with obj_ram address line obfuscation)
    constant I_HWSEL_RESCUE   : integer := 9; -- Rescue    (SCOBRA with obj_ram address line obfuscation)
    constant I_HWSEL_MARS     : integer := 10; -- Mars
    constant I_HWSEL_TURTLES  : integer := 11; -- Turtles
    constant I_HWSEL_MIMONKEY : integer := 12; -- Mighty Monkey (use mimonscr bootleg ROMs to avoid writing the ROM decryptor)
    constant I_HWSEL_MRKOUGAR : integer := 13; -- Mr Kougar, Troopy
end;
