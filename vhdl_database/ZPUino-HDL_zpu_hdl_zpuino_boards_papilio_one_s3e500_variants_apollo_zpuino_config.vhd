--
--  Configuration file for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

package zpuino_config is

  -- General ZPUino configuration

  type zpu_core_type is (
    small,
    large
  );

  -- ZPUino large is buggy, don't use it.

  constant zpuinocore: zpu_core_type := small;


  -- Set iobusyinput to 'true' to allow registered input to IO core. This also allows for IO
  -- to become busy without needing to register its inputs. However, an extra clock-cycle is
  -- required to access IO if this is used.

  constant zpuino_iobusyinput: boolean := true;

  -- For SPI blocking operation, you need to define also iobusyinput
  constant zpuino_spiblocking: boolean := true;

  -- Number of GPIO to map (number of FPGA pins)
  constant zpuino_gpio_count: integer := 49;

  -- Peripheral Pin Select
  constant zpuino_pps_enabled: boolean := true;

  -- Internal SPI ADC
  constant zpuino_adc_enabled: boolean := false;

  constant zpuino_number_io_select_bits: integer := 4;

  -- Set this to the max. number of output pps on the system
  constant PPSCOUNT_OUT: integer := 8;
  -- Set this to the max. number of input pps on the system
  constant PPSCOUNT_IN: integer := 2;

end package zpuino_config;
