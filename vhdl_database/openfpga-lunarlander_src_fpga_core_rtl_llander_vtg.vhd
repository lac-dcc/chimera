--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
-- This code is not part of the original game, and is somewhat experimental !
-- It produces a 1024 x 768 (overscanned to 788) raster display from the vector
-- DAC connections on the original hw. An external ZBT/NBL (depending on
-- supplier) SRAM with at least 19 address bits, and running at PCLK is required.
--
-- A read/modify/write cycle drawing a 3x3 pixel patch for each vector point is
-- used giving a high quality display.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;


entity ASTEROIDS_VTG is
  port (
    RESET            : in    std_logic;
    PCLK             : in    std_logic;

    X_VECTOR         : in    std_logic_vector(9 downto 0);
    Y_VECTOR         : in    std_logic_vector(9 downto 0);
    Z_VECTOR         : in    std_logic_vector(3 downto 0);
    BEAM_ON          : in    std_logic;
    BEAM_ENA         : in    std_logic;

    VIDEO_R_OUT      : out   std_logic_vector(3 downto 0);
    VIDEO_G_OUT      : out   std_logic_vector(3 downto 0);
    VIDEO_B_OUT      : out   std_logic_vector(3 downto 0);
    HSYNC_OUT        : out   std_logic;
    VSYNC_OUT        : out   std_logic;

    RAM_ADDR         : out   std_logic_vector(18 downto 0);
    RAM_WE_L         : out   std_logic;
    RAM_ADV_L        : out   std_logic;
    RAM_OE_L         : out   std_logic;
    RAM_DOUT_OE_L    : out   std_logic;
    RAM_DOUT         : out   std_logic_vector(31 downto 0);
    RAM_DIN          : in    std_logic_vector(31 downto 0)
    --
    );
end;

architecture RTL of ASTEROIDS_VTG is
  -- types & constants
  subtype  Bus12    is std_logic_vector (11 downto 0);
  type  array_4x8   is array (3 downto 0) of std_logic_vector(7 downto 0);

  -- runs at 71 Hz refresh rate with an 80MHz pixel clock
  -- uses a standard 1024 x 768 VESA screen overscanned to 788 active lines

  --constant V_FRONT_PORCH_START : Bus12 := x"300"; -- line 768
  --constant V_SYNC_START        : Bus12 := x"310"; -- line 784
  --constant V_BACK_PORCH_START  : Bus12 := x"313"; -- line 787
  --constant LINE_PER_FRAME      : Bus12 := x"337"; -- 823 lines
  constant V_FRONT_PORCH_START : Bus12 := x"314"; -- line 788
  constant V_SYNC_START        : Bus12 := x"320"; -- line 784
  constant V_BACK_PORCH_START  : Bus12 := x"323"; -- line 787
  constant LINE_PER_FRAME      : Bus12 := x"337"; -- 823 lines

  constant H_FRONT_PORCH_START : Bus12 := x"400"; -- pixel 1024
  constant H_SYNC_START        : Bus12 := x"408"; -- pixel 1032
  constant H_BACK_PORCH_START  : Bus12 := x"480"; -- pixel 1152
  constant PIXEL_PER_LINE      : Bus12 := x"550"; -- 1360 pixels

  signal lcount               : std_logic_vector(9 downto 0);
  signal pcount               : std_logic_vector(10 downto 0);
  signal pcount_00            : boolean;
  signal pcount_01            : boolean;
  signal pcount_10            : boolean;
  signal pcount_11            : boolean;

  signal hterm                : boolean;
  signal vterm                : boolean;
  signal v_sync               : std_logic;
  signal h_sync               : std_logic;
  signal v_blank              : std_logic;
  signal h_blank              : std_logic;
  signal raster_active        : std_logic;

  signal raster_do_load       : std_logic;
  signal vector_do_load       : std_logic;
  -- delays
  signal raster_do_load_t     : std_logic_vector(4 downto 0);
  signal vector_do_load_t     : std_logic_vector(4 downto 0);
  signal v_sync_t             : std_logic_vector(6 downto 0);
  signal h_sync_t             : std_logic_vector(6 downto 0);
  signal raster_active_t      : std_logic_vector(6 downto 0);
  --
  signal display_data         : std_logic_vector(31 downto 0);
  signal video_r              : std_logic_vector(3 downto 0);
  signal video_g              : std_logic_vector(3 downto 0);
  signal video_b              : std_logic_vector(3 downto 0);

  -- process
  signal vector_y_addr        : std_logic_vector(9 downto 0);
  signal vector_x_addr        : std_logic_vector(9 downto 0);
  signal vector_col           : std_logic_vector(3 downto 0);
  signal c_vector_y_addr      : std_logic_vector(9 downto 0);
  signal c_vector_x_addr      : std_logic_vector(9 downto 0);
  signal c_vector_result      : std_logic_vector(7 downto 0);
  signal c_vector_col         : std_logic_vector(7 downto 0);
  signal vector_active        : std_logic;
  signal write_mask           : std_logic_vector(1 downto 0);
  signal write_col            : std_logic_vector(7 downto 0);

  signal vector_process       : std_logic_vector(31 downto 0);
  signal vector_out           : std_logic_vector(31 downto 0);
  signal raster_process       : std_logic_vector(31 downto 0);
  signal raster_out           : std_logic_vector(31 downto 0);

  signal beam_ena_t           : std_logic_vector(2 downto 0);
  signal beam_load            : std_logic;
  signal vector_pending       : std_logic;
  signal vector_state         : std_logic_vector(3 downto 0);
  signal vector_x_offset      : std_logic_vector(9 downto 0);
  signal vector_y_offset      : std_logic_vector(9 downto 0);
  signal vector_col_offset    : std_logic_vector(1 downto 0);
  signal vector_col_result    : std_logic_vector(7 downto 0);

  -- ram control
  signal raster_read          : std_logic;
  signal vector_read          : std_logic;
  signal raster_write         : std_logic;
  signal vector_write         : std_logic;
  signal dummy_read           : std_logic;
  signal did_raster_read      : std_logic;
  signal did_vector_read      : std_logic;
  signal did_raster_read_t1   : std_logic;
  signal did_vector_read_t1   : std_logic;
  signal ram_do_read          : std_logic;
  signal ram_do_read_t1       : std_logic;
  signal ram_do_write         : std_logic;
  signal ram_do_write_t1      : std_logic;

  signal old_raster_addr      : std_logic_vector(18 downto 0);
  signal old_raster_addr_t1   : std_logic_vector(18 downto 0);
  signal old_vector_addr      : std_logic_vector(18 downto 0);
  signal old_vector_addr_t1   : std_logic_vector(18 downto 0);
  signal old_vector_mask      : std_logic_vector(1 downto 0);
  signal old_vector_mask_t1   : std_logic_vector(1 downto 0);
  signal old_vector_col       : std_logic_vector(7 downto 0);
  signal old_vector_col_t1    : std_logic_vector(7 downto 0);

begin
  -- basic raster gen
  p_cnt_compare_comb : process(pcount,lcount)
  begin
    hterm <= (pcount = (PIXEL_PER_LINE(10 downto 0) - "1"));
    vterm <= (lcount = (LINE_PER_FRAME( 9 downto 0) - "1"));
  end process;

  p_display_cnt : process(PCLK, RESET)
  begin
    if (RESET = '1') then
      pcount <= (others => '0');
      lcount <= (others => '0');
    elsif rising_edge(PCLK) then
      if hterm then
        pcount <= (others => '0');
      else
        pcount <= pcount + "1";
      end if;

      if hterm then
        if vterm then
          lcount <= (others => '0');
        else
          lcount <= lcount + "1";
        end if;
      end if;

    end if;
  end process;

  p_vsync : process(PCLK, RESET)
    variable vcnt_eq_front_porch_start : boolean;
    variable vcnt_eq_sync_start        : boolean;
    variable vcnt_eq_back_porch_start  : boolean;
  begin
    if (RESET = '1') then
      v_sync <= '1';
      v_blank <= '0';
    elsif rising_edge(PCLK) then

      vcnt_eq_front_porch_start := (lcount = (V_FRONT_PORCH_START(9 downto 0) - "1"));
      vcnt_eq_sync_start        := (lcount = (       V_SYNC_START(9 downto 0) - "1"));
      vcnt_eq_back_porch_start  := (lcount = ( V_BACK_PORCH_START(9 downto 0) - "1"));

      if vcnt_eq_sync_start and hterm then
        v_sync <= '0';
      elsif vcnt_eq_back_porch_start and hterm then
        v_sync <= '1';
      end if;

      if vcnt_eq_front_porch_start and hterm then
        v_blank <= '1';
      elsif vterm and hterm then
        v_blank <= '0';
      end if;

    end if;
  end process;

  p_hsync : process(PCLK, RESET)
    variable hcnt_eq_front_porch_start     : boolean;
    variable hcnt_eq_sync_start            : boolean;
    variable hcnt_eq_back_porch_start      : boolean;
  begin
    if (RESET = '1') then
      h_sync <= '1';
      h_blank <= '1'; -- 0
    elsif rising_edge(PCLK) then
      hcnt_eq_front_porch_start     := (pcount = ( H_FRONT_PORCH_START(10 downto 0) - "1"));
      hcnt_eq_sync_start            := (pcount = (        H_SYNC_START(10 downto 0) - "1"));
      hcnt_eq_back_porch_start      := (pcount = (  H_BACK_PORCH_START(10 downto 0) - "1"));

      if hcnt_eq_sync_start then
        h_sync <= '0';
      elsif hcnt_eq_back_porch_start then
        h_sync <= '1';
      end if;

      if hcnt_eq_front_porch_start then
        h_blank <= '1';
      elsif hterm then
        h_blank <= '0';
      end if;

    end if;
  end process;

  p_active_video : process(h_blank, v_blank)
  begin
    raster_active <= not(h_blank or v_blank);
  end process;

  p_pcount_decode : process
  begin
    wait until rising_edge(PCLK);
    pcount_00 <= false;
    pcount_01 <= false;
    pcount_10 <= false;
    pcount_11 <= false;
    -- 1 early
    case pcount(1 downto 0) is
      when "11" => pcount_00 <= true;
      when "00" => pcount_01 <= true;
      when "01" => pcount_10 <= true;
      when "10" => pcount_11 <= true;
      when others => null;
    end case;
  end process;
  --
  -- process input beam position
  --
  p_vector_addr : process
    variable y_vector_offset : std_logic_vector(10 downto 0);
    variable y_vector_clamped : std_logic_vector(9 downto 0);
    variable y_err : boolean;
  begin
    wait until rising_edge(PCLK);
    -- look for rising edge of ena
    -- vg unit has output registers, so it is safe
    beam_ena_t(2 downto 0) <= beam_ena_t(1 downto 0) & BEAM_ENA;
    beam_load <= beam_ena_t(1) and not beam_ena_t(2);

    -- VG produces 1024 by 1024 but only 1024 x 768 is actually used (4 x 3 aspect ratio)
    -- and it is upside down
    --y_vector_offset := ('0' & (not Y_VECTOR(9 downto 0))) - "00010000000";

    -- mod to y size of 788 lines to get the score back in
    y_vector_offset := ('0' & (not Y_VECTOR(9 downto 0))) - "00001110001"; -- 128 - 15

    if (y_vector_offset(10) = '1') then
      y_vector_clamped := (others => '0'); -- underflow
      y_err := true;
    else
      y_vector_clamped := y_vector_offset(9 downto 0);
      y_err := false;
    end if;

    -- clk change
    if (beam_load = '1') then
      -- base vector address
      vector_y_addr <=  y_vector_clamped;
      vector_x_addr <=  X_VECTOR;
      if y_err then
        vector_col    <=  "0000";
      else
        vector_col    <=  Z_VECTOR;
      end if;
    end if;

    if (BEAM_ON = '1') and (beam_load = '1') then
      vector_pending <= '1';
    elsif pcount_10 then
      vector_pending <= '0';
    end if;

    if pcount_10 then
      if (vector_pending = '1') then -- start
        vector_active <= '1';
        vector_state <= "0000";
      elsif (vector_active = '1') then
        vector_state <= vector_state + "1";
        if (vector_state = "1000") then
          vector_active <= '0';
        end if;
      end if;
    end if;
  end process;

  p_vector_offsets : process(vector_state)
  begin
    -- because the cycle is read1 ----- read2 write1 etc we must be careful to
    -- avoid reading a ram address before we have written back a previous result
    -- 121
    -- 242
    -- 121
    vector_x_offset <= (others => '0');
    vector_y_offset <= (others => '0');
    case vector_state is

      when "0000" => vector_x_offset <= "1111111111"; vector_y_offset <= "1111111111";
      when "0001" => vector_x_offset <= "1111111111"; vector_y_offset <= "0000000000";
      when "0010" => vector_x_offset <= "1111111111"; vector_y_offset <= "0000000001";
      when "0011" => vector_x_offset <= "0000000000"; vector_y_offset <= "1111111111";
      when "0100" => vector_x_offset <= "0000000000"; vector_y_offset <= "0000000000";
      when "0101" => vector_x_offset <= "0000000000"; vector_y_offset <= "0000000001";
      when "0110" => vector_x_offset <= "0000000001"; vector_y_offset <= "1111111111";
      when "0111" => vector_x_offset <= "0000000001"; vector_y_offset <= "0000000000";
      when "1000" => vector_x_offset <= "0000000001"; vector_y_offset <= "0000000001";
      when others => null;
    end case;

    vector_col_offset <= "00";
    case vector_state is
      when "0000" => vector_col_offset <= "10";
      when "0001" => vector_col_offset <= "01";
      when "0010" => vector_col_offset <= "10";
      when "0011" => vector_col_offset <= "01";
      when "0100" => vector_col_offset <= "00";
      when "0101" => vector_col_offset <= "01";
      when "0110" => vector_col_offset <= "10";
      when "0111" => vector_col_offset <= "01";
      when "1000" => vector_col_offset <= "10";
      when others => null;
    end case;
  end process;

  p_vector_col_shift : process(vector_col_offset, vector_col)
  begin
    vector_col_result <= vector_col & "0000";
    case vector_col_offset is
      when "01" => vector_col_result <= '0' & vector_col & "000";
      when "10" => vector_col_result <= "00" & vector_col & "00";
      when others => null;
    end case;
  end process;

  p_latch_vector_addr : process
    variable temp_x : std_logic_vector(10 downto 0);
    variable temp_y : std_logic_vector(10 downto 0);
  begin
    wait until rising_edge(PCLK);
    temp_x := ('0' & vector_x_addr) + (vector_x_offset(9) & vector_x_offset);
    temp_y := ('0' & vector_y_addr) + (vector_y_offset(9) & vector_y_offset);
    -- 11 -ve overflow
    -- 00 ok
    -- 01 ok
    -- 10 +ve overflow
    if (temp_x(10) = '0') then
      c_vector_x_addr <= temp_x(9 downto 0);
    else
      for i in 0 to 9 loop
        c_vector_x_addr(i) <= not temp_x(10);
      end loop;
    end if;

    if (temp_y(10) = '0') then
      c_vector_y_addr <= temp_y(9 downto 0);
    else
      for i in 0 to 9 loop
        c_vector_y_addr(i) <= not temp_y(10);
      end loop;
    end if;

    if (temp_x(10) = '0') and (temp_y(10) = '0') then
      c_vector_col    <= vector_col_result;
    else
      c_vector_col    <= "00000000";
    end if;
  end process;
  --
  -- ram control
  --
  p_ram_arb : process(pcount_00, pcount_01, pcount_10, pcount_11,
                      raster_active, did_raster_read_t1, vector_active, did_vector_read_t1)
  begin
    raster_read <= '0';
    raster_write <= '0';
    vector_read <= '0';
    vector_write <= '0';

    if pcount_00 then
      if (raster_active = '1') then
        raster_read <= '1';
      end if;
    end if;

    if pcount_01 then
      if (did_raster_read_t1 = '1') then
         raster_write <= '1';
      end if;
    end if;

    if pcount_10 then
      if (vector_active = '1') then
        vector_read <= '1';
      end if;
    end if;

    if pcount_11 then
      if (did_vector_read_t1 = '1') then
        vector_write <= '1';
      end if;
    end if;
  end process;

  p_dummy_read : process(ram_do_write, vector_read, raster_read)
  begin
    -- stop burst write, should have wired up some more pins !!
    dummy_read <= '0';
    if (ram_do_write = '1') and (vector_read = '0') and (raster_read = '0') then
      dummy_read <= '1';
    end if;
  end process;

  p_ram_addr : process
  -- first pixel of active screen is lcount 0, pcount 0
    variable raster_addr : std_logic_vector(18 downto 0);
    variable vector_addr : std_logic_vector(18 downto 0);
  begin
    wait until rising_edge(PCLK);
    -- RASTER
    raster_do_load <= raster_read;
    if pcount_00 then
      did_raster_read <= raster_read;
    end if;
    did_raster_read_t1 <= did_raster_read;

    raster_addr := '0' & lcount(9 downto 0) & pcount(9 downto 2);
    if pcount_00 then
      old_raster_addr <= raster_addr;
    end if;
    old_raster_addr_t1 <= old_raster_addr;

    -- VECTOR
    vector_do_load <= vector_read;
    if pcount_10 then
      did_vector_read <= vector_read;
    end if;
    did_vector_read_t1 <= did_vector_read;

    vector_addr := '0' & c_vector_y_addr(9 downto 0) & c_vector_x_addr(9 downto 2);
    if pcount_10 then
      old_vector_addr <= vector_addr;
      old_vector_mask <= c_vector_x_addr(1 downto 0);
      old_vector_col  <= c_vector_col;
    end if;
    old_vector_addr_t1 <= old_vector_addr;
    old_vector_mask_t1 <= old_vector_mask;
    old_vector_col_t1  <= old_vector_col;

    -- ADDR MUX
    RAM_ADDR <= (others => '0');
    case pcount(1 downto 0) is -- mux

      when "00" => RAM_ADDR <= raster_addr;
      when "01" => RAM_ADDR <= old_raster_addr_t1;

      when "10" => RAM_ADDR <= vector_addr;
      when "11" => RAM_ADDR <= old_vector_addr_t1; write_mask <= old_vector_mask_t1(1 downto 0);
                                                   write_col  <= old_vector_col_t1;

      when others => null;
    end case;
  end process;

  p_ram_dout : process(raster_out, vector_out, pcount_00)
  begin
    if pcount_00 then
      ram_dout <= raster_out;
    else
      ram_dout <= vector_out;
    end if;
  end process;

  p_ram_control : process(PCLK, RESET)
    variable read, write : std_ulogic;
  begin
    if (RESET = '1') then
      RAM_WE_L <= '1';
      RAM_OE_L <= '1';
      RAM_DOUT_OE_L <= '1'; -- fpga oe
      RAM_ADV_L <= '1';

      ram_do_read <= '0';
      ram_do_read_t1 <= '0';
      ram_do_write <= '0';
      ram_do_write_t1 <= '0';
    elsif rising_edge(PCLK) then
      -- extra registers at top level
      read := raster_read or vector_read;
      write := raster_write or vector_write;
      -- delays
      ram_do_read <= read;
      ram_do_read_t1 <= ram_do_read;
      ram_do_write <= write;
      ram_do_write_t1 <= ram_do_write;

      RAM_WE_L <= not write;
      RAM_ADV_L <= not (read or write or dummy_read);
      RAM_OE_L <= not ram_do_read_t1; -- needs to be 2 clocks late
      RAM_DOUT_OE_L <= not ram_do_write_t1; -- fpga oe
    end if;
  end process;

  p_ram_delay : process
  begin
    wait until rising_edge(PCLK);
    -- simple delay to match ram read delay
    raster_do_load_t(4 downto 0) <= raster_do_load_t(3 downto 0) & raster_do_load;
    vector_do_load_t(4 downto 0) <= vector_do_load_t(3 downto 0) & vector_do_load;
    v_sync_t(6 downto 0) <= v_sync_t(5 downto 0) & v_sync;
    h_sync_t(6 downto 0) <= h_sync_t(5 downto 0) & h_sync;
    raster_active_t(6 downto 0) <= raster_active_t(5 downto 0) & raster_active;
  end process;

  p_shifter : process
  begin
    wait until rising_edge(PCLK);
    -- msb is left most pixel
    -- makes the simulation easier to understand
    if (raster_do_load_t(3) = '1') then
      display_data <= RAM_DIN;
    else
      display_data <= (display_data(23 downto 0) & x"00");
    end if;
  end process;

  p_raster_data : process
    variable pixel : std_logic_vector(7 downto 0);
    variable sub : std_logic_vector(8 downto 0);
    variable op : std_logic_vector(7 downto 0);
  begin
    wait until rising_edge(PCLK);
    if (raster_do_load_t(3) = '1') then
      raster_process <= RAM_DIN;
    end if;
    for i in 0 to 3 loop
      pixel := raster_process((i * 8)+7 downto (i * 8));
      --sub := ('0' & pixel) - "001000000";
      --if (sub(8) = '1') then -- gone negative
        --op := "00000000";
      --else
        --op := sub(7 downto 0);
      --end if;
      op := ('0' & pixel(7 downto 1)); -- model exp decay, bit too flickery however
      raster_out((i * 8)+7 downto (i * 8)) <= op;
    end loop;
  end process;

  p_vector_data : process
    variable pixel : array_4x8;
    variable op : array_4x8;
    variable ignore_write : boolean;
  begin
    wait until rising_edge(PCLK);
    if (vector_do_load_t(3) = '1') then
      vector_process <= RAM_DIN;
    end if;

    -- duplicate test to get timing closure
    for i in 0 to 3 loop
      pixel(i) := vector_process((i * 8)+7 downto (i*8));

      if (write_col(7 downto 4) <= pixel(i)(7 downto 4)) then -- leave pixel alone
        op(i) := pixel(i);
      else -- write pixel
        op(i) := write_col;
      end if;
    end loop;

    -- write it back
    if (vector_do_load_t(4) = '1') then
      vector_out <= vector_process;
      -- write mask 0 is for pixel 31..24, mask 3 for pixel 7..0
      case write_mask is
        when "00" => vector_out(31 downto 24) <= op(3);
        when "01" => vector_out(23 downto 16) <= op(2);
        when "10" => vector_out(15 downto  8) <= op(1);
        when "11" => vector_out( 7 downto  0) <= op(0);
        when others => null;
      end case;
    end if;
  end process;

  p_output_map : process(display_data)
  begin
    -- top 4 bits only for now, will remap to give full colour display later
    video_r <= display_data(31 downto 28);
    video_g <= display_data(31 downto 28);
    video_b <= display_data(31 downto 28);
  end process;

  p_video_out : process
  begin
    wait until rising_edge(PCLK);
    if (raster_active_t(5) = '1') then
      VIDEO_R_OUT <= video_r;
      VIDEO_G_OUT <= video_g;
      VIDEO_B_OUT <= video_b;
    else -- blank
      VIDEO_R_OUT <= "0000";
      VIDEO_G_OUT <= "0000";
      VIDEO_B_OUT <= "0000";
    end if;

    VSYNC_OUT <= v_sync_t(5);
    HSYNC_OUT <= h_sync_t(5);
  end process;

  -- job done !
end architecture RTL;
