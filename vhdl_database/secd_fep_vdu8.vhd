library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
library unisim;
use unisim.all;
--
--
-- Video Display terminal
-- John Kent
-- 3th September 2004 
-- Assumes a pixel clock input of 50 MHz
-- Generates a 12.5MHz CPU Clock output
--
-- Display Format is: 
-- 80 characters across	by 25 characters down.
-- 8 horizonal pixels / character
-- 16 vertical scan lines / character (2 scan lines/row)
--
entity vdu is
  port(
    -- control register interface
    vdu_clk      : in  std_logic;	-- 25 Mhz pixel clock
    vdu_rst      : in  std_logic;
    vdu_cs       : in  std_logic;
    vdu_rw       : in  std_logic;
    vdu_addr     : in  std_logic_vector(2 downto 0);
    vdu_data_in  : in  std_logic_vector(7 downto 0);
    vdu_data_out : out std_logic_vector(7 downto 0);

    -- vga port connections
    vga_red_o    : out std_logic;
    vga_green_o  : out std_logic;
    vga_blue_o   : out std_logic;
    vga_hsync_o  : out std_logic;
    vga_vsync_o  : out std_logic
    );
end vdu;

architecture arch of vdu is

  constant HI:	std_logic := '1';
  constant LO:	std_logic := '0';

  --
  -- Synchronisation constants
  --
  constant HOR_DISP_END : integer := 639; -- Last horizontal pixel displayed
  constant HOR_SYNC_BEG : integer := 679; -- Start of horizontal synch pulse
  constant HOR_SYNC_END : integer := 775; -- End of Horizontal Synch pulse
  constant HOR_SCAN_END : integer := 799; -- Last pixel in scan line
  constant HOR_DISP_CHR : integer := 80;  -- Number of characters displayed per row

  constant VER_DISP_END : integer := 399; -- last row displayed
  constant VER_SYNC_BEG : integer := 413; -- start of vertical synch pulse
  constant VER_SYNC_END : integer := 415; -- end of vertical synch pulse
  constant VER_SCAN_END : integer := 450; -- Last scan row in the frame
  constant VER_DISP_CHR : integer := 25;  -- Number of character rows displayed

  signal horiz_sync    : std_logic := '0';
  signal vert_sync     : std_logic := '0';
  signal cursor_on_v   : std_logic := '0';
  signal cursor_on_h   : std_logic := '0';
  signal video_on_v    : std_logic := '0';
  signal video_on_h    : std_logic := '0';
  signal h_count       : std_logic_vector(9 downto 0) := (others => '0');
  signal v_count       : std_logic_vector(8 downto 0) := (others => '0');	-- 0 to VER_SCAN_END
  signal blink_count   : std_logic_vector(22 downto 0) := (others => '0');
  --
  -- Character generator ROM	
  --
  signal char_cs       : std_logic;
  signal char_rw       : std_logic;
  signal char_addr     : std_logic_vector(10 downto 0);
  signal char_data_in  : std_logic_vector(7 downto 0);
  signal char_data_out : std_logic_vector(7 downto 0);

  --
  -- Control Registers
  --
  signal reg_character : std_logic_vector(7 downto 0);
  signal reg_colour    : std_logic_vector(7 downto 0);
  signal reg_hcursor   : std_logic_vector(6 downto 0); -- 80 columns
  signal reg_vcursor   : std_logic_vector(4 downto 0); -- 25 rows
  signal reg_voffset   : std_logic_vector(4 downto 0); -- 25 rows
  --
  -- Video Shift register
  --
  signal vga_shift     : std_logic_vector(7 downto 0);
  signal vga_fg_colour : std_logic_vector(2 downto 0);
  signal vga_bg_colour : std_logic_vector(2 downto 0);
  signal cursor_on     : std_logic;
  signal cursor_on1    : std_logic;
  signal video_on      : std_logic;
  signal video_on1     : std_logic;
  signal video_on2     : std_logic;
  --
  -- vga character ram access bus
  --
  signal col_addr      : std_logic_vector(6 downto 0);	-- 0 to 79
  signal row_addr      : std_logic_vector(5 downto 0);	-- 0 to 49 (25 * 2 -1)
  signal col1_addr     : std_logic_vector(6 downto 0);	-- 0 to 79
  signal row1_addr     : std_logic_vector(5 downto 0);	-- 0 to 49 (25 * 2 - 1)
  signal hor_addr      : std_logic_vector(6 downto 0);	-- 0 to 79
  signal ver_addr      : std_logic_vector(6 downto 0);	-- 0 to 124
  signal vga0_cs       : std_logic;
  signal vga0_rw       : std_logic;
  signal vga1_cs       : std_logic;
  signal vga1_rw       : std_logic;
  signal vga2_cs       : std_logic;
  signal vga2_rw       : std_logic;
  signal vga_cs        : std_logic;
  signal vga_rw        : std_logic;
  signal vga_addr      : std_logic_vector(10 downto 0); -- 2K byte character buffer
  signal vga_data_out  : std_logic_vector(7 downto 0);
  signal attr_data_out : std_logic_vector(7 downto 0);
  --
  -- Character write handshake signals
  --
  signal req_write : std_logic; -- request character write
  signal ack_write : std_logic;

  --
  -- Slice character gen
  --
--   component char_rom
--   port (
--      addr   : in   std_logic_vector(9 downto 0);
--      data   : out  std_logic_vector(7 downto 0)
--   );
--   end component;

  --
  -- block Ram Character gen
  --
  component char_rom
    port (
      clk   : in  std_logic;
      rst   : in  std_logic;
      cs    : in  std_logic;
      rw    : in  std_logic;
      addr  : in  std_logic_vector (10 downto 0);
      wdata : in  std_logic_vector (7 downto 0);
      rdata : out std_logic_vector (7 downto 0)
      );
  end component;

  component ram_2k
    port (
      clk   : in  std_logic;
      rst   : in  std_logic;
      cs    : in  std_logic;
      rw    : in  std_logic;
      addr  : in  std_logic_vector (10 downto 0);
      wdata : in  std_logic_vector (7 downto 0);
      rdata : out std_logic_vector (7 downto 0)
      );
  end component;

  component BUFG 
    port (
      i: in std_logic;
      o: out std_logic
      );
  end component;

begin

--
-- instantiate Character generator ROM
--

--vdu_char_rom : char_rom
--   port map(
--      addr   => char_addr,
--      data   => char_data_out
--   );

  vdu_char_rom: char_rom port map(
    clk   => vdu_clk,
    rst   => vdu_rst,
    cs    => char_cs,
    rw    => char_rw,
    addr  => char_addr,
    wdata => char_data_in,
    rdata => char_data_out
    );

--
-- Character buffer RAM
--
  char_buff_ram: ram_2k port map(
    clk   => vdu_clk,
    rst   => vdu_rst,
    cs    => vga_cs,
    rw    => vga_rw,
    addr  => vga_addr,
    wdata => reg_character,
    rdata => vga_data_out
    );

--
-- Attribute buffer RAM
--
  attr_buff_ram: ram_2k port map(
    clk   => vdu_clk,
    rst   => vdu_rst,
    cs    => vga_cs,
    rw    => vga_rw,
    addr  => vga_addr,
    wdata => reg_colour,
    rdata => attr_data_out
    );

--
-- CPU Write interface
--
  vga_cpu_write : process( vdu_clk, vdu_rst, vdu_cs, vdu_rw, vdu_addr, vdu_data_in,
                           reg_character, reg_colour, reg_hcursor, reg_vcursor,
                           req_write, ack_write )
  begin
    if vdu_rst = '1'  then
      reg_character <= "00000000";
      reg_colour    <= "00000111";
      reg_hcursor   <= "0000000";
      reg_vcursor   <= "00000";
      reg_voffset   <= "00000";
      req_write     <= '0';
    elsif vdu_clk'event and vdu_clk='0' then
      if (vdu_cs = '1') and (vdu_rw = '0') then
        case vdu_addr is
          when "000" =>
            reg_character <= vdu_data_in;
            req_write     <= '1';
          when "001" =>
            reg_colour    <= vdu_data_in;
          when "010" =>
            reg_hcursor   <= vdu_data_in(6 downto 0);
          when "011" =>
            reg_vcursor   <= vdu_data_in(4 downto 0);
          when others =>
            reg_voffset   <= vdu_data_in(4 downto 0);
        end case;
      else
        if (req_write = '1') and (ack_write = '1') then
          req_write <= '0';
        else
          req_write <= req_write;
        end if;

      end if;
    end if;
  end process;
--
-- CPU Read interface
--
  vga_cpu_read : process( vdu_addr, vdu_cs,
                          reg_character, reg_colour,
                          reg_hcursor, reg_vcursor, reg_voffset )
  begin
    case vdu_addr is
      when "000" =>
        vdu_data_out <= reg_character;
      when "001" =>
        vdu_data_out <= reg_colour;
      when "010" =>
        vdu_data_out <= "0" & reg_hcursor;
      when "011" =>
        vdu_data_out <= "000" & reg_vcursor;
      when others =>
        vdu_data_out <= "000" & reg_voffset;
    end case;
  end process;

--
-- Video memory access
--
  vga_addr_proc : process(	vdu_clk, vdu_rst,
                                reg_hcursor, reg_vcursor, reg_voffset,
                                h_count, v_count,
                                col_addr, row_addr,
                                col1_addr, row1_addr,
                                hor_addr, ver_addr,
                                vga0_cs, vga0_rw,
                                vga1_cs, vga1_rw,
                                vga2_cs, vga2_rw,
                                vga_cs, vga_rw,
                                req_write )
  begin

    if vdu_rst = '1' then
      vga0_cs  <= '0';
      vga0_rw  <= '1';
      row_addr <= "000000";
      col_addr <= "0000000";
      --
      vga1_cs  <= '0';
      vga1_rw  <= '1';
      row1_addr <= "000000";
      col1_addr <= "0000000";
      --
      vga2_cs  <= '0';
      vga2_rw  <= '1';
      ver_addr <= "0000000";
      hor_addr <= "0000000";
      --
      vga_cs   <= '0';
      vga_rw   <= '1';
      vga_addr <= "00000000000";
    elsif vdu_clk'event and vdu_clk='0' then
      --
      -- on h_count = 0 initiate character write.
      -- all other cycles are reads.
      --
      case h_count(2 downto 0) is
        when "000" => -- pipeline character write
          vga0_cs  <= req_write;
          vga0_rw  <= '0';
          col_addr  <= reg_hcursor(6 downto 0);
          row_addr  <= ("0" & reg_vcursor(4 downto 0)) + ("0" & reg_voffset(4 downto 0));
        when others => -- other 6 cycles free
          vga0_cs  <= '1';
          vga0_rw  <= '1';
          col_addr  <= h_count(9 downto 3);
          row_addr  <= ("0" & v_count(8 downto 4)) + ("0" & reg_voffset(4 downto 0));
      end case;
      --
      -- on vdu_clk + 1 round off row address
      --
      vga1_cs   <= vga0_cs;
      vga1_rw   <= vga0_rw;
      if row_addr < VER_DISP_CHR then
        row1_addr <= row_addr;
      else
        row1_addr <= row_addr - VER_DISP_CHR;
      end if;
      col1_addr <= col_addr;
      --
      -- on vdu_clk + 2 calculate vertical address
      --
      vga2_cs <= vga1_cs;
      vga2_rw <= vga1_rw;
      ver_addr <= ("00" & row1_addr(4 downto 0)) + (row1_addr(4 downto 0) & "00" );
      hor_addr <= col1_addr;
      --
      -- on vdu_clk + 3 calculate memory address
      --
      vga_cs <= vga2_cs;
      vga_rw <= vga2_rw;
      vga_addr <= ("0000" & hor_addr) + (ver_addr & "0000");
    end if;
  end process;
--
-- Video shift register
--
  vga_shift_proc : process( vdu_clk, vdu_rst,
                            char_data_out, attr_data_out, 
                            video_on, video_on1, video_on2,
                            cursor_on, cursor_on1,
                            vga_fg_colour, vga_bg_colour, 
                            vga_shift, blink_count,
                            reg_hcursor, reg_vcursor, 
                            reg_character, reg_colour,
                            h_count, v_count,
                            req_write, ack_write )
  begin
    if vdu_rst = '1' then
      ack_write     <= '0';
      video_on2     <= '0';
      video_on      <= '0';
      cursor_on     <= '0';
      vga_bg_colour <= "000";
      vga_fg_colour <= "111";
      vga_shift     <= "00000000";
      vga_red_o     <= '0';
      vga_green_o   <= '0';
      vga_blue_o    <= '0';
      -- Put all video signals through DFFs to elminate any delays that cause a blurry image
    elsif vdu_clk'event and vdu_clk='0' then
      -- Character Data valid on 1 count
      if h_count(2 downto 0) = "000" then
        if (req_write = '1') and (ack_write = '0') then
          ack_write <= '1';
        elsif (req_write ='0') and (ack_write = '1') then
          ack_write <= '0';
        else
          ack_write <= ack_write;
        end if;
        video_on2     <= video_on1;
        video_on      <= video_on2;
        cursor_on     <= (cursor_on1 or attr_data_out(3)) and blink_count(22);
        vga_fg_colour <= attr_data_out(2 downto 0);
        vga_bg_colour <= attr_data_out(6 downto 4);
        if attr_data_out(7) = '0' then
          vga_shift   <= char_data_out;
        else
          case v_count(3 downto 2) is
            when "00" =>
              vga_shift(7 downto 4) <= vga_data_out(0) & vga_data_out(0) & vga_data_out(0) & vga_data_out(0);
              vga_shift(3 downto 0) <= vga_data_out(1) & vga_data_out(1) & vga_data_out(1) & vga_data_out(1);
            when "01" =>
              vga_shift(7 downto 4) <= vga_data_out(2) & vga_data_out(2) & vga_data_out(2) & vga_data_out(2);
              vga_shift(3 downto 0) <= vga_data_out(3) & vga_data_out(3) & vga_data_out(3) & vga_data_out(3);
            when "10" =>
              vga_shift(7 downto 4) <= vga_data_out(4) & vga_data_out(4) & vga_data_out(4) & vga_data_out(4);
              vga_shift(3 downto 0) <= vga_data_out(5) & vga_data_out(5) & vga_data_out(5) & vga_data_out(5);
            when others =>
              vga_shift(7 downto 4) <= vga_data_out(6) & vga_data_out(6) & vga_data_out(6) & vga_data_out(6);
              vga_shift(3 downto 0) <= vga_data_out(7) & vga_data_out(7) & vga_data_out(7) & vga_data_out(7);
          end case;
        end if;
      else
        video_on2     <= video_on2;
        video_on      <= video_on;
        cursor_on     <= cursor_on;
        vga_fg_colour <= vga_fg_colour;
        vga_bg_colour <= vga_bg_colour;
        vga_shift     <= vga_shift(6 downto 0) & '0';
      end if;

      --
      -- Colour mask is
      --  7  6  5  4  3  2  1  0
      --  X BG BB BR  X FG FB FR
      --
      if vga_shift(7) = (not cursor_on) then
        vga_red_o    <= video_on and vga_fg_colour(0);
        vga_green_o  <= video_on and vga_fg_colour(1);
        vga_blue_o   <= video_on and vga_fg_colour(2);
      else
        vga_red_o    <= video_on and vga_bg_colour(0);
        vga_green_o  <= video_on and vga_bg_colour(1);
        vga_blue_o   <= video_on and vga_bg_colour(2);
      end if;
    end if;
  end process;


--
-- Sync generator & timing process
-- Generate Horizontal and Vertical Timing Signals for Video Signal
--
  vga_sync: process( vdu_clk, vdu_rst,
                     h_count, v_count,
                     horiz_sync, vert_sync,
                     video_on_h, video_on_v,
                     cursor_on_h, cursor_on_v,
                     blink_count )
  begin
    if vdu_clk'event and vdu_clk='0' then
--
-- H_count counts pixels (640 + extra time for sync signals)
-- 
--  Horiz_sync  -----------------------------__________--------
--  H_count       0                640      659       755    799
--
      if h_count = HOR_SCAN_END then
        h_count <= "0000000000";
      else
        h_count <= h_count + 1;
      end if;
--
-- Generate Horizontal Sync Signal using H_count
--
      if h_count = HOR_SYNC_BEG then 
        horiz_sync <= '0';
      elsif h_count = HOR_SYNC_END then
        horiz_sync <= '1';
      else
        horiz_sync <= horiz_sync;
      end if;
--
-- V_count counts rows of pixels 
-- 400 lines + extra time for sync signals
-- 25 rows * 16 scan lines
--  
--  Vert_sync      ---------------------------------_______------------
--  V_count         0                       400    413     414        444
--
      if (v_count = VER_SCAN_END) and (h_count = HOR_SCAN_END) THEN
        v_count <= "000000000";
      elsif h_count = HOR_SYNC_END then
        v_count <= v_count + 1;
      end if;
--
-- Generate Vertical Sync Signal using V_count
--
      if v_count = VER_SYNC_BEG then
        vert_sync <= '0';
      elsif v_count = VER_SYNC_END then
        vert_sync <= '1';
      else
        vert_sync <= vert_sync;
      end if;

-- Generate Video on Screen Signals for Pixel Data
      if h_count = HOR_SCAN_END then
        video_on_h <= '1';
      elsif h_count = HOR_DISP_END then
        video_on_h <= '0';
      else
        video_on_h <= video_on_h;
      end if;

      if v_count = VER_SCAN_END then
        video_on_v <= '1';
      elsif v_count = VER_DISP_END then
        video_on_v <= '0';
      else
        video_on_v <= video_on_v;
      end if;


      if (h_count(9 downto 3) = reg_hcursor(6 downto 0)) then
        cursor_on_h <= '1';
      else
        cursor_on_h <= '0';
      end if;

      if (v_count(8 downto 4) = reg_vcursor(4 downto 0)) then
        cursor_on_v <= '1';
      else
        cursor_on_v <= '0';
      end if;

      -- cursor_on is only active when on selected character
      blink_count <= blink_count + 1;
    end if;

    -- video_on is high only when RGB data is displayed
    vga_hsync_o <= horiz_sync;
    vga_vsync_o <= vert_sync;
    video_on1 <= video_on_H and video_on_V;
    cursor_on1 <= cursor_on_h and cursor_on_v;

  end process;

--
-- Here to look up character ROM
-- This will take one clock cycle
-- and should be performed on h_count = "111"
--
  vdu_char_lookup : process( v_count, vga_data_out )
  begin
    char_cs <= '1';
    char_rw <= '1';
    char_addr(3 downto 0) <= v_count(3 downto 0);
    char_addr(10 downto 4) <= vga_data_out(6 downto 0);
    char_data_in <= "00000000";
  end process;
end arch;
