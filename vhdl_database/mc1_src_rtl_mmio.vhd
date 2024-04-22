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
-- Memory mapped registers.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mmio_types.all;
use work.vid_types.all;

entity mmio is
  generic(
    CPU_CLK_HZ : positive;
    VRAM_SIZE : natural;
    XRAM_SIZE : natural;
    VID_FPS : positive;
    VIDEO_CONFIG : T_VIDEO_CONFIG
  );
  port(
    i_rst : in std_logic;

    -- Wishbone memory interface (b4 pipelined slave).
    -- See: https://cdn.opencores.org/downloads/wbspec_b4.pdf
    i_wb_clk : in std_logic;
    i_wb_cyc : in std_logic;
    i_wb_stb : in std_logic;
    i_wb_adr : in std_logic_vector(29 downto 0);
    i_wb_dat : in std_logic_vector(31 downto 0);
    i_wb_we : in std_logic;
    i_wb_sel : in std_logic_vector(32/8-1 downto 0);
    o_wb_dat : out std_logic_vector(31 downto 0);
    o_wb_ack : out std_logic;
    o_wb_stall : out std_logic;
    o_wb_err : out std_logic;

    -- Some intput registers are collected externally.
    i_raster_y : in std_logic_vector(15 downto 0);
    i_switches : in std_logic_vector(31 downto 0);
    i_buttons : in std_logic_vector(31 downto 0);
    i_kb_scancode : in std_logic_vector(8 downto 0);
    i_kb_press : in std_logic;
    i_kb_stb : in std_logic;
    i_mousepos : in std_logic_vector(31 downto 0);
    i_mousebtns : in std_logic_vector(31 downto 0);
    i_sdin : in std_logic_vector(31 downto 0);

    -- All output registers are exported externally.
    o_regs_w: out T_MMIO_REGS_WO
  );
end mmio;

architecture rtl of mmio is
  constant C_REG_ADR_BITS : integer := 6;
  subtype T_REG_ADR is unsigned(C_REG_ADR_BITS-1 downto 0);

  function reg_adr(x : integer) return T_REG_ADR is
  begin
    return to_unsigned(x, T_REG_ADR'length);
  end function;

  -- Register addresses.
  constant C_ADR_CLKCNTLO   : T_REG_ADR := reg_adr(0);
  constant C_ADR_CLKCNTHI   : T_REG_ADR := reg_adr(1);
  constant C_ADR_CPUCLK     : T_REG_ADR := reg_adr(2);
  constant C_ADR_VRAMSIZE   : T_REG_ADR := reg_adr(3);
  constant C_ADR_XRAMSIZE   : T_REG_ADR := reg_adr(4);
  constant C_ADR_VIDWIDTH   : T_REG_ADR := reg_adr(5);
  constant C_ADR_VIDHEIGHT  : T_REG_ADR := reg_adr(6);
  constant C_ADR_VIDFPS     : T_REG_ADR := reg_adr(7);
  constant C_ADR_VIDFRAMENO : T_REG_ADR := reg_adr(8);
  constant C_ADR_VIDY       : T_REG_ADR := reg_adr(9);
  constant C_ADR_SWITCHES   : T_REG_ADR := reg_adr(10);
  constant C_ADR_BUTTONS    : T_REG_ADR := reg_adr(11);
  constant C_ADR_KEYPTR     : T_REG_ADR := reg_adr(12);
  constant C_ADR_MOUSEPOS   : T_REG_ADR := reg_adr(13);
  constant C_ADR_MOUSEBTNS  : T_REG_ADR := reg_adr(14);
  constant C_ADR_SDIN       : T_REG_ADR := reg_adr(15);

  constant C_ADR_SEGDISP0   : T_REG_ADR := reg_adr(16);
  constant C_ADR_SEGDISP1   : T_REG_ADR := reg_adr(17);
  constant C_ADR_SEGDISP2   : T_REG_ADR := reg_adr(18);
  constant C_ADR_SEGDISP3   : T_REG_ADR := reg_adr(19);
  constant C_ADR_SEGDISP4   : T_REG_ADR := reg_adr(20);
  constant C_ADR_SEGDISP5   : T_REG_ADR := reg_adr(21);
  constant C_ADR_SEGDISP6   : T_REG_ADR := reg_adr(22);
  constant C_ADR_SEGDISP7   : T_REG_ADR := reg_adr(23);
  constant C_ADR_LEDS       : T_REG_ADR := reg_adr(24);
  constant C_ADR_SDOUT      : T_REG_ADR := reg_adr(25);
  constant C_ADR_SDWE       : T_REG_ADR := reg_adr(26);

  constant C_ADR_KEYBUF     : T_REG_ADR := reg_adr(32);

  -- Keyboard events are stored in a circular buffer.
  constant C_LOG2_KEY_BUF_SIZE : integer := 4;
  constant C_KEY_BUF_SIZE : integer := 2**C_LOG2_KEY_BUF_SIZE;
  subtype T_KEY_EVENT is std_logic_vector(9 downto 0);
  type T_KEY_BUF is array (0 to C_KEY_BUF_SIZE-1) of T_KEY_EVENT;
  subtype T_KEY_BUF_ADR is integer range 0 to C_KEY_BUF_SIZE-1;

  -- Clock and counter signals.
  signal s_vidy_msb : std_logic;
  signal s_prev_vidy_msb : std_logic;
  signal s_inc_vidframeno : std_logic;
  signal s_next_vidframeno : unsigned(31 downto 0);

  -- Wishbone signals.
  signal s_reg_adr : T_REG_ADR;
  signal s_request : std_logic;
  signal s_we : std_logic;

  -- Registers.
  signal s_regs_r : T_MMIO_REGS_RO;
  signal s_regs_w : T_MMIO_REGS_WO;

  -- Keyboard input circular buffer.
  signal s_key_buf : T_KEY_BUF;
  signal s_key_buf_clear_adr : T_KEY_BUF_ADR;
  signal s_key_buf_clear_done : std_logic;

  function sign_ext_raster(x : std_logic_vector) return std_logic_vector is
    variable v_ext : std_logic_vector(31 downto 0);
  begin
    for k in 0 to x'left loop
      v_ext(k) := x(k);
    end loop;
    for k in x'length to 31 loop
      v_ext(k) := x(x'left);
    end loop;
    return v_ext;
  end function;

  function reg_adr_to_key_buf_adr(x : T_REG_ADR) return T_KEY_BUF_ADR is
  begin
    -- NOTE: This is a simplification that works since C_ADR_KEYBUF is
    -- a power of two that is larger than C_KEY_BUF_SIZE.
    return to_integer(x(C_LOG2_KEY_BUF_SIZE-1 downto 0));
  end function;
begin
  --------------------------------------------------------------------------------------------------
  -- Read-only registers.
  --------------------------------------------------------------------------------------------------

  -- Static read-only registers.
  s_regs_r.CPUCLK <= std_logic_vector(to_unsigned(CPU_CLK_HZ, 32));
  s_regs_r.VRAMSIZE <= std_logic_vector(to_unsigned(VRAM_SIZE, 32));
  s_regs_r.XRAMSIZE <= std_logic_vector(to_unsigned(XRAM_SIZE, 32));
  s_regs_r.VIDWIDTH <= std_logic_vector(to_unsigned(VIDEO_CONFIG.width, 32));
  s_regs_r.VIDHEIGHT <= std_logic_vector(to_unsigned(VIDEO_CONFIG.height, 32));
  s_regs_r.VIDFPS <= std_logic_vector(to_unsigned(VID_FPS, 32));

  -- Increment the frame count for each new frame.
  s_vidy_msb <= s_regs_r.VIDY(31);
  s_inc_vidframeno <= '1' when s_prev_vidy_msb = '0' and s_vidy_msb = '1' else '0';
  s_next_vidframeno <= unsigned(s_regs_r.VIDFRAMENO) + (to_unsigned(0, 31) & s_inc_vidframeno);

  -- Dynamic read-only registers.
  process(i_rst, i_wb_clk)
    variable v_clkcnt : std_logic_vector(63 downto 0);
    variable v_clkcnt_plus_1 : unsigned(63 downto 0);
  begin
    if i_rst = '1' then
      s_regs_r.CLKCNTLO <= (others => '0');
      s_regs_r.CLKCNTHI <= (others => '0');
      s_regs_r.VIDFRAMENO <= (others => '0');
      s_prev_vidy_msb <= '0';
    elsif rising_edge(i_wb_clk) then
      -- Update the 64-bit clock counter.
      v_clkcnt := s_regs_r.CLKCNTHI & s_regs_r.CLKCNTLO;
      v_clkcnt_plus_1 := unsigned(v_clkcnt) + 1;
      s_regs_r.CLKCNTLO <= std_logic_vector(v_clkcnt_plus_1(31 downto 0));
      s_regs_r.CLKCNTHI <= std_logic_vector(v_clkcnt_plus_1(63 downto 32));

      -- Increment the frame count for each new frame.
      s_regs_r.VIDFRAMENO <= std_logic_vector(s_next_vidframeno);

      -- Remember last MSB from the raster Y coordinate (used for detecting end-of-frame).
      s_prev_vidy_msb <= s_vidy_msb;
    end if;
  end process;

  -- Dynamic read-only registers from external sources.
  s_regs_r.VIDY <= sign_ext_raster(i_raster_y);
  s_regs_r.SWITCHES <= i_switches;
  s_regs_r.BUTTONS <= i_buttons;
  s_regs_r.MOUSEPOS <= i_mousepos;
  s_regs_r.MOUSEBTNS <= i_mousebtns;
  s_regs_r.SDIN <= i_sdin;

  -- Key event circular buffer.
  process(i_rst, i_wb_clk)
    variable v_new_keyptr : unsigned(31 downto 0);
    variable v_write_addr : integer range 0 to C_KEY_BUF_SIZE-1;
    variable v_key_event : T_KEY_EVENT;
  begin
    if i_rst = '1' then
      -- Reset buffer pointer.
      s_regs_r.KEYPTR <= (others => '0');

      -- Initialize key event buffer reset sequence.
      s_key_buf_clear_adr <= 0;
      s_key_buf_clear_done <= '0';
    elsif rising_edge(i_wb_clk) then
      if s_key_buf_clear_done = '0' then
        -- Clear one entry in the key event buffer.
        s_key_buf(s_key_buf_clear_adr) <= (others => '0');

        -- Reset sequence done?
        if s_key_buf_clear_adr = C_KEY_BUF_SIZE-1 then
          s_key_buf_clear_done <= '1';
        end if;
        s_key_buf_clear_adr <= s_key_buf_clear_adr + 1;
      elsif i_kb_stb = '1' then
        -- Calculate the new key buffer pointer.
        v_new_keyptr := unsigned(s_regs_r.KEYPTR) + 1;

        -- Write the new keycode to the key event buffer.
        v_key_event := i_kb_press & i_kb_scancode;
        v_write_addr := to_integer(v_new_keyptr(C_LOG2_KEY_BUF_SIZE-1 downto 0));
        s_key_buf(v_write_addr) <= v_key_event;

        -- Update the key buffer pointer.
        s_regs_r.KEYPTR <= std_logic_vector(v_new_keyptr);
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------------------------
  -- Wishbone interface.
  --------------------------------------------------------------------------------------------------

  s_reg_adr <= unsigned(i_wb_adr(C_REG_ADR_BITS-1 downto 0));
  s_request <= i_wb_cyc and i_wb_stb;
  s_we <= s_request and i_wb_we;

  o_wb_err <= '0';
  o_wb_stall <= '0';

  process(i_rst, i_wb_clk)
    variable v_key_event : T_KEY_EVENT;
  begin
    if i_rst = '1' then
      -- Clear all output registers.
      s_regs_w.SEGDISP0 <= (others => '0');
      s_regs_w.SEGDISP1 <= (others => '0');
      s_regs_w.SEGDISP2 <= (others => '0');
      s_regs_w.SEGDISP3 <= (others => '0');
      s_regs_w.SEGDISP4 <= (others => '0');
      s_regs_w.SEGDISP5 <= (others => '0');
      s_regs_w.SEGDISP6 <= (others => '0');
      s_regs_w.SEGDISP7 <= (others => '0');
      s_regs_w.LEDS <= (others => '0');
      s_regs_w.SDOUT <= (others => '0');
      s_regs_w.SDWE <= (others => '0');
    elsif rising_edge(i_wb_clk) then
      -- All registers are readable.
      if s_reg_adr = C_ADR_CLKCNTLO then
        o_wb_dat <= s_regs_r.CLKCNTLO;
      elsif s_reg_adr = C_ADR_CLKCNTHI then
        o_wb_dat <= s_regs_r.CLKCNTHI;
      elsif s_reg_adr = C_ADR_CPUCLK then
        o_wb_dat <= s_regs_r.CPUCLK;
      elsif s_reg_adr = C_ADR_VRAMSIZE then
        o_wb_dat <= s_regs_r.VRAMSIZE;
      elsif s_reg_adr = C_ADR_XRAMSIZE then
        o_wb_dat <= s_regs_r.XRAMSIZE;
      elsif s_reg_adr = C_ADR_VIDWIDTH then
        o_wb_dat <= s_regs_r.VIDWIDTH;
      elsif s_reg_adr = C_ADR_VIDHEIGHT then
        o_wb_dat <= s_regs_r.VIDHEIGHT;
      elsif s_reg_adr = C_ADR_VIDFPS then
        o_wb_dat <= s_regs_r.VIDFPS;
      elsif s_reg_adr = C_ADR_VIDFRAMENO then
        o_wb_dat <= s_regs_r.VIDFRAMENO;
      elsif s_reg_adr = C_ADR_VIDY then
        o_wb_dat <= s_regs_r.VIDY;
      elsif s_reg_adr = C_ADR_SWITCHES then
        o_wb_dat <= s_regs_r.SWITCHES;
      elsif s_reg_adr = C_ADR_BUTTONS then
        o_wb_dat <= s_regs_r.BUTTONS;
      elsif s_reg_adr = C_ADR_KEYPTR then
        o_wb_dat <= s_regs_r.KEYPTR;
      elsif s_reg_adr = C_ADR_MOUSEPOS then
        o_wb_dat <= s_regs_r.MOUSEPOS;
      elsif s_reg_adr = C_ADR_MOUSEBTNS then
        o_wb_dat <= s_regs_r.MOUSEBTNS;
      elsif s_reg_adr = C_ADR_SDIN then
        o_wb_dat <= s_regs_r.SDIN;
      elsif s_reg_adr = C_ADR_SEGDISP0 then
        o_wb_dat <= s_regs_w.SEGDISP0;
      elsif s_reg_adr = C_ADR_SEGDISP1 then
        o_wb_dat <= s_regs_w.SEGDISP1;
      elsif s_reg_adr = C_ADR_SEGDISP2 then
        o_wb_dat <= s_regs_w.SEGDISP2;
      elsif s_reg_adr = C_ADR_SEGDISP3 then
        o_wb_dat <= s_regs_w.SEGDISP3;
      elsif s_reg_adr = C_ADR_SEGDISP4 then
        o_wb_dat <= s_regs_w.SEGDISP4;
      elsif s_reg_adr = C_ADR_SEGDISP5 then
        o_wb_dat <= s_regs_w.SEGDISP5;
      elsif s_reg_adr = C_ADR_SEGDISP6 then
        o_wb_dat <= s_regs_w.SEGDISP6;
      elsif s_reg_adr = C_ADR_SEGDISP7 then
        o_wb_dat <= s_regs_w.SEGDISP7;
      elsif s_reg_adr = C_ADR_LEDS then
        o_wb_dat <= s_regs_w.LEDS;
      elsif s_reg_adr = C_ADR_SDOUT then
        o_wb_dat <= s_regs_w.SDOUT;
      elsif s_reg_adr = C_ADR_SDWE then
        o_wb_dat <= s_regs_w.SDWE;
      elsif s_reg_adr >= C_ADR_KEYBUF then
        v_key_event := s_key_buf(reg_adr_to_key_buf_adr(s_reg_adr));
        o_wb_dat <= v_key_event(9) & "0000000000000000000000" & v_key_event(8 downto 0);
      else
        o_wb_dat <= (others => '0');
      end if;

      -- Only output registers can be written to.
      if s_we = '1' then
        if s_reg_adr = C_ADR_SEGDISP0 then
          s_regs_w.SEGDISP0 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP1 then
          s_regs_w.SEGDISP1 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP2 then
          s_regs_w.SEGDISP2 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP3 then
          s_regs_w.SEGDISP3 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP4 then
          s_regs_w.SEGDISP4 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP5 then
          s_regs_w.SEGDISP5 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP6 then
          s_regs_w.SEGDISP6 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SEGDISP7 then
          s_regs_w.SEGDISP7 <= i_wb_dat;
        elsif s_reg_adr = C_ADR_LEDS then
          s_regs_w.LEDS <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SDOUT then
          s_regs_w.SDOUT <= i_wb_dat;
        elsif s_reg_adr = C_ADR_SDWE then
          s_regs_w.SDWE <= i_wb_dat;
        end if;
      end if;

      -- Instant ack!
      o_wb_ack <= s_request;
    end if;
  end process;


  --------------------------------------------------------------------------------------------------
  -- Output the state of the written registers.
  --------------------------------------------------------------------------------------------------

  o_regs_w <= s_regs_w;
end rtl;
