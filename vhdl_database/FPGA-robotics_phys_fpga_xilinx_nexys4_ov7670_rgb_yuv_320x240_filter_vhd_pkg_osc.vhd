--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


library WORK;
use WORK.GRAL_PKG.ALL;
use WORK.VGA_PKG.ALL;



package OSC_PKG is

--  Paquete de constantes para el osciloscopio


  -- las capturas que se van a hacer, las anteriores se pierden
  constant c_numsamples  : natural := 2*640;
  -- Numero de bits necesarios para las direcciones de la memoria
  constant c_bt_ramdepth : natural := log2(c_numsamples)+1;
  constant c_bt_ramword  : natural := 15; -- 480/32 = 15

  constant c_trig_off : std_logic := '0';

  -- We have 480 visible lines
  -- divide it up to 15 signals to sample: 480/15 = 32
  -- So we have 32 pixels for each signal (5 bits)
  -- the first 16 pixels are for separation
  -- the second 16 pixels are for drawing the wave
  
  constant c_bt_inwaverow    : natural := 5;
  constant c_bt_extwaverow   : natural := 9-c_bt_inwaverow;

  constant c_push_button_inactive : std_logic := '0';
  constant c_on : std_logic := '1';
  
end OSC_PKG;


