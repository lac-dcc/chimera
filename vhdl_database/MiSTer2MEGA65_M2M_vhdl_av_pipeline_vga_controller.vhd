--------------------------------------------------------------------------------
--
--   FileName:         vga_controller.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--   Version 1.1 03/07/2018 Scott Larson
--     Corrected two minor "off-by-one" errors
--   Version 1.2 May 16, 2021 Michael Jørgensen
--     Clean-up, adjusted to fit gbc4mega65 and MiSTer2MEGA coding style
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity vga_controller is
   port (
      h_pulse   : in  integer;    -- horizontal sync pulse width in pixels
      h_bp      : in  integer;    -- horizontal back porch width in pixels
      h_pixels  : in  integer;    -- horizontal display width in pixels
      h_fp      : in  integer;    -- horizontal front porch width in pixels
      h_pol     : in  std_logic;  -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      v_pulse   : in  integer;    -- vertical sync pulse width in rows
      v_bp      : in  integer;    -- vertical back porch width in rows
      v_pixels  : in  integer;    -- vertical display width in rows
      v_fp      : in  integer;    -- vertical front porch width in rows
      v_pol     : in  std_logic;  -- vertical sync pulse polarity (1 = positive, 0 = negative)
      clk_i     : in  std_logic;  -- pixel clock at frequency of vga mode being used
      ce_i      : in  std_logic;  -- Clock enable
      reset_n   : in  std_logic;  -- active low sycnchronous reset
      h_sync    : out std_logic;  -- horiztonal sync pulse
      v_sync    : out std_logic;  -- vertical sync pulse
      h_blank   : out std_logic;  -- horiztonal blanking
      v_blank   : out std_logic;  -- vertical blanking
      column    : out integer;    -- horizontal pixel coordinate
      row       : out integer;    -- vertical pixel coordinate
      n_blank   : out std_logic;  -- direct blacking output to dac
      n_sync    : out std_logic   -- sync-on-green output to dac
   );
end vga_controller;

architecture synthesis of vga_controller is
   signal h_period     : natural range 0 to 2047;  -- total number of pixel clocks in a row
   signal v_period     : natural range 0 to 2047;  -- total number of rows in column
   signal h_sync_first : natural range 0 to 2047;
   signal h_sync_last  : natural range 0 to 2047;
   signal v_sync_first : natural range 0 to 2047;
   signal v_sync_last  : natural range 0 to 2047;
begin
   h_period     <= h_pulse + h_bp + h_pixels + h_fp;  -- total number of pixel clocks in a row
   v_period     <= v_pulse + v_bp + v_pixels + v_fp;  -- total number of rows in column
   h_sync_first <= h_pixels + h_fp;
   h_sync_last  <= h_pixels + h_fp + h_pulse - 1;
   v_sync_first <= v_pixels + v_fp;
   v_sync_last  <= v_pixels + v_fp + v_pulse - 1;

   n_blank <= '1';  -- no direct blanking
   n_sync  <= '0';  -- no sync on green

   process (clk_i)
      variable h_count : natural range 0 to 2047 := 0;  -- horizontal counter (counts the columns)
      variable v_count : natural range 0 to 2047 := 0;  -- vertical counter (counts the rows)
   begin

      if rising_edge(clk_i) then

         if ce_i = '1' then
            -- counters
            if h_count < h_period - 1 then     -- horizontal counter (pixels)
               h_count := h_count + 1;
            else
               h_count := 0;
               if v_count < v_period - 1 then  -- veritcal counter (rows)
                  v_count := v_count + 1;
               else
                  v_count := 0;
               end if;
            end if;

            -- horizontal sync signal
            if h_count >= h_sync_first and h_count <= h_sync_last then
               h_sync <= h_pol;           -- assert horizontal sync pulse
            else
               h_sync <= not h_pol;       -- deassert horizontal sync pulse
            end if;

            -- vertical sync signal
            if v_count >= v_sync_first and v_count <= v_sync_last then
               v_sync <= v_pol;           -- assert vertical sync pulse
            else
               v_sync <= not v_pol;       -- deassert vertical sync pulse
            end if;

            -- set pixel coordinates
            if h_count < h_pixels then    -- horizontal display time
               column <= h_count;         -- set horizontal pixel coordinate
            end if;
            if v_count < v_pixels then    -- vertical display time
               row <= v_count;            -- set vertical pixel coordinate
            end if;

            -- set horizontal blanking
            if h_count < h_pixels then    -- display time
               h_blank <= '0';            -- enable display
            else                          -- blanking time
               h_blank <= '1';            -- disable display
            end if;

            -- set vertical blanking
            if v_count < v_pixels then    -- display time
               v_blank <= '0';            -- enable display
            else                          -- blanking time
               v_blank <= '1';            -- disable display
            end if;
         end if;

         if reset_n = '0' then      -- reset asserted
            h_count := 0;           -- reset horizontal counter
            v_count := 0;           -- reset vertical counter
            h_sync   <= not h_pol;  -- deassert horizontal sync
            v_sync   <= not v_pol;  -- deassert vertical sync
            h_blank <= '1';         -- disable display
            v_blank <= '1';         -- disable display
            column   <= 0;          -- reset column pixel coordinate
            row      <= 0;          -- reset row pixel coordinate
         end if;
      end if;
   end process;

end architecture synthesis;

