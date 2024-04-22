----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This file contains type definitions for MMIO registers.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package mmio_types is
  subtype T_MMIO_REG_WORD is std_logic_vector(31 downto 0);

  --------------------------------------------------------------------------------------------------
  -- Read-only registers.
  --------------------------------------------------------------------------------------------------
  type T_MMIO_REGS_RO is record
    -- MC1 internal registers.
    CLKCNTLO : T_MMIO_REG_WORD;    -- CPU clock cycle count - lo bits (free running counter).
    CLKCNTHI : T_MMIO_REG_WORD;    -- CPU clock cycle count - hi bits (free running counter).
    CPUCLK : T_MMIO_REG_WORD;      -- CPU clock frequency in Hz.
    VRAMSIZE : T_MMIO_REG_WORD;    -- VRAM size in bytes.
    XRAMSIZE : T_MMIO_REG_WORD;    -- Extended RAM size in bytes.
    VIDWIDTH : T_MMIO_REG_WORD;    -- Native video resoltuion, width.
    VIDHEIGHT : T_MMIO_REG_WORD;   -- Native video resoltuion, height.
    VIDFPS : T_MMIO_REG_WORD;      -- Video refresh rate in 65536 * frames per s.
    VIDFRAMENO : T_MMIO_REG_WORD;  -- Video frame number (free running counter).
    VIDY : T_MMIO_REG_WORD;        -- Video raster Y position.

    -- External registers.
    -- TODO(m): microSD inputs, GPIO inputs.
    SWITCHES : T_MMIO_REG_WORD;    -- Switches (one bit per switch, active high).
    BUTTONS : T_MMIO_REG_WORD;     -- Buttons (one bit per button, active high).
    KEYPTR : T_MMIO_REG_WORD;      -- Keyboard event buffer pointer.
    MOUSEPOS : T_MMIO_REG_WORD;    -- Mouse position (x & y coord in upper & lower 16 bits)
    MOUSEBTNS : T_MMIO_REG_WORD;   -- Mouse buttons (left, middle, right in bits 0, 1, 2)
    SDIN : T_MMIO_REG_WORD;        -- SD card input:
                                   --   0: DAT0/MISO
                                   --   1: DAT1
                                   --   2: DAT2
                                   --   3: DAT3/SS*
                                   --   4: CMD/MOSI
  end record T_MMIO_REGS_RO;

  --------------------------------------------------------------------------------------------------
  -- Write-only registers.
  --------------------------------------------------------------------------------------------------
  type T_MMIO_REGS_WO is record
    -- MC1 internal registers.
    -- TODO(m): Add something here?

    -- External registers.
    -- TODO(m): microSD outputs, GPIO outputs.
    SEGDISP0 : T_MMIO_REG_WORD;    -- Segmented display 0 (one bit per segment, active high).
    SEGDISP1 : T_MMIO_REG_WORD;    -- Segmented display 1 (one bit per segment, active high).
    SEGDISP2 : T_MMIO_REG_WORD;    -- Segmented display 2 (one bit per segment, active high).
    SEGDISP3 : T_MMIO_REG_WORD;    -- Segmented display 3 (one bit per segment, active high).
    SEGDISP4 : T_MMIO_REG_WORD;    -- Segmented display 4 (one bit per segment, active high).
    SEGDISP5 : T_MMIO_REG_WORD;    -- Segmented display 5 (one bit per segment, active high).
    SEGDISP6 : T_MMIO_REG_WORD;    -- Segmented display 6 (one bit per segment, active high).
    SEGDISP7 : T_MMIO_REG_WORD;    -- Segmented display 7 (one bit per segment, active high).
    LEDS : T_MMIO_REG_WORD;        -- LED:s (one bit per LED, active high).
    SDOUT : T_MMIO_REG_WORD;       -- SD card output:
                                   --   0: DAT0/MISO
                                   --   1: DAT1
                                   --   2: DAT2
                                   --   3: DAT3/SS*
                                   --   4: CMD/MOSI
                                   --   5: CLK/SCK   (always unmasked)
    SDWE : T_MMIO_REG_WORD;        -- SD card write enable bit mask (bits 0-4).

  end record T_MMIO_REGS_WO;
end package;
