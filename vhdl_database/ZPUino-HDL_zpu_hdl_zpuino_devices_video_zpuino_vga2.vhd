--
--  VGA interface for ZPUINO (and others)
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity zpuino_vga2 is
  port (
    wb_clk_i: in std_logic;
    wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    wb_intb_o:out std_logic;

    -- Memory interface (wishbone master)  addresses (0-75300)
    mi_wb_dat_i: in std_logic_vector(31 downto 0);
    mi_wb_dat_o: out std_logic_vector(31 downto 0);
    mi_wb_adr_o: out std_logic_vector(maxIObit downto minIObit);
    mi_wb_sel_o: out std_logic_vector(3 downto 0);
    mi_wb_cti_o: out std_logic_vector(2 downto 0);
    mi_wb_we_o:  out std_logic;
    mi_wb_cyc_o: out std_logic;
    mi_wb_stb_o: out std_logic;
    mi_wb_ack_i: in std_logic;

    -- VGA interface
    vgaclk:     in std_logic;

    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
    vga_r:      out std_logic_vector(3 downto 0);
    vga_g:      out std_logic_vector(3 downto 0);
    vga_b:      out std_logic_vector(3 downto 0)
  );
end entity zpuino_vga2;

architecture behave of zpuino_vga2 is

  component cachefill is
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- This is a wishbone master interface

    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_adr_o: out std_logic_vector(31 downto 0);
    wb_sel_o: out std_logic_vector(3 downto 0);
    wb_cti_o: out std_logic_vector(2 downto 0);
    wb_we_o:  out std_logic;
    wb_cyc_o: out std_logic;
    wb_stb_o: out std_logic;
    wb_ack_i: in std_logic;

    read: out std_logic_vector(15 downto 0);
    readclk: in std_logic;
    read_enable: in std_logic;
    empty: out std_logic;
    clear: in std_logic
  );

  end component cachefill;


  --                  Clock     Hor                 Vert
  --                            Disp FP  Sync BP    Disp FP Sync BP
  -- 800x600, 72Hz    50.000    800  56  120  64    600  37  6   23

  constant VGA_H_BORDER: integer := 0;

  constant VGA_H_SYNC: integer := 96;
  constant VGA_H_FRONTPORCH: integer := 16+VGA_H_BORDER;
  --constant VGA_H_FRONTPORCH: integer := 1;
  constant VGA_H_DISPLAY: integer := 640 - (2*VGA_H_BORDER);
  constant VGA_H_BACKPORCH: integer := 48+VGA_H_BORDER;
  --constant VGA_H_BACKPORCH: integer := 1;


  constant VGA_V_BORDER: integer := 40;
  constant VGA_V_FRONTPORCH: integer := 10+VGA_V_BORDER;
  --constant VGA_V_FRONTPORCH: integer := 1;
  constant VGA_V_SYNC: integer := 2;
  constant VGA_V_DISPLAY: integer := 480 - (2*VGA_V_BORDER);
  constant VGA_V_BACKPORCH: integer := 33+VGA_V_BORDER;
  --constant VGA_V_BACKPORCH: integer := 1;


  constant VGA_HCOUNT: integer :=
    VGA_H_SYNC + VGA_H_FRONTPORCH + VGA_H_DISPLAY + VGA_H_BACKPORCH;

  constant VGA_VCOUNT: integer :=
    VGA_V_SYNC + VGA_V_FRONTPORCH + VGA_V_DISPLAY + VGA_V_BACKPORCH;

  constant v_polarity: std_logic := '1';
  constant h_polarity: std_logic := '1';

  -- Pixel counters

  signal hcount_q: integer range 0 to VGA_HCOUNT;
  signal vcount_q: integer range 0 to VGA_VCOUNT;


  signal h_sync_tick: std_logic;

  signal vgarst: std_logic := '0';

  signal rstq1: std_logic:='1';
  signal rstq2: std_logic;

  signal vga_ram_address: unsigned(14 downto 0);
  signal vga_ram_data: std_logic_vector(15 downto 0);
  signal v_display: std_logic;
  signal v_display_q: std_logic;

  signal v_border: std_logic;

  signal ram_read: std_logic_vector(7 downto 0);
  signal ram_we: std_logic;
  signal vga_v_offset: unsigned(14 downto 0);
  signal hoff: unsigned(2 downto 0); -- will count from 0 to 4
  signal voff: unsigned(2 downto 0); -- will count from 0 to 4
  signal hdisp: unsigned(13 downto 2);
  signal read_ended: std_logic;
  signal cache_address: std_logic_vector(31 downto 0);
  signal cache_clear : std_logic := '0';
begin

  wb_inta_o <= '0';
  wb_intb_o <= '0';

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        read_ended<='0';
      else
        read_ended<=wb_stb_i and wb_cyc_i and not wb_we_i;
      end if;
    end if;
  end process;

  wb_ack_o <= wb_stb_i and wb_cyc_i;-- and (read_ended or wb_we_i);

  -- Read muxer
  process(wb_adr_i,ram_read)
  begin
    wb_dat_o <= (others => '0');
    --wb_dat_o(7 downto 0) <= ram_read;
  end process;

  --process(wb_we_i,wb_cyc_i,wb_stb_i,wb_adr_i)
  --begin
  --  ram_we <= wb_we_i and wb_cyc_i and wb_stb_i;
  --end process;
    
  -- VGA reset generator.
  process(vgaclk, wb_rst_i)
  begin
    if wb_rst_i='1' then
      rstq1 <= '1';
      rstq2 <= '1';
    elsif rising_edge(vgaclk) then
      rstq1 <= rstq2;
      rstq2 <= '0';
    end if;
  end process;
  vgarst <= rstq1;

  -- Compute the VGA RAM offset we need to use to fetch the character.

--  vga_ram_address <= hdisp + vga_v_offset;

  mi_wb_adr_o<=cache_address(maxIObit-minIObit downto 0);


  filler: cachefill
  port map (
    wb_clk_i  => wb_clk_i,
	 	wb_rst_i  => wb_rst_i,

    -- This is a wishbone master interface

    wb_dat_o  => mi_wb_dat_o,
    wb_dat_i  => mi_wb_dat_i,
    wb_adr_o  => cache_address,
    wb_sel_o  => mi_wb_sel_o,
    wb_cti_o  => mi_wb_cti_o,
    wb_we_o   => mi_wb_we_o,
    wb_cyc_o  => mi_wb_cyc_o,
    wb_stb_o  => mi_wb_stb_o,
    wb_ack_i  => mi_wb_ack_i,

    read      => vga_ram_data,
    readclk   => vgaclk,
    read_enable => v_display,--v_display_div,
    empty   => open,
    clear   => cache_clear
  );

  -- Horizontal counter

  hcounter: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        hcount_q <= VGA_H_DISPLAY + VGA_H_BACKPORCH - 1;
      else
        if hcount_q = VGA_HCOUNT then
          hcount_q <= 0;
          hoff <= (others =>'0');
          hdisp <= (others => '0');
        else
          hcount_q <= hcount_q + 1;
          if hoff="100" then
            hoff <= (others => '0');
            hdisp <= hdisp + 1;
          else
            hoff <= hoff + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(hcount_q, vcount_q)
  begin
    if hcount_q < VGA_H_DISPLAY  and vcount_q < VGA_V_DISPLAY then
      v_display<='1';
    else
      v_display<='0';
    end if;
  end process;

  process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      v_display_q <= v_display;
    end if;
  end process;


--  process(vgaclk)
--  begin
--    if rising_edge(vgaclk) then
--      if ( ( hcount_q >= VGA_H_DISPLAY and hcount_q< VGA_H_DISPLAY + VGA_H_BORDER ) or
--           ( hcount_q >= VGA_H_DISPLAY+VGA_H_BACKPORCH+VGA_H_SYNC+VGA_H_FRONTPORCH
--             and hcount_q < VGA_H_DISPLAY+VGA_H_BACKPORCH+VGA_H_SYNC+VGA_H_FRONTPORCH-VGA_H_BORDER ) )
--
 --     and ( ( vcount_q >= VGA_V_DISPLAY and vcount_q< VGA_V_DISPLAY + VGA_V_BORDER ) or
  --         ( vcount_q >= VGA_V_DISPLAY+VGA_V_BACKPORCH+VGA_V_SYNC+VGA_V_FRONTPORCH
--           and vcount_q < VGA_V_DISPLAY+VGA_V_BACKPORCH+VGA_V_SYNC+VGA_V_FRONTPORCH-VGA_V_BORDER ) )
--      then
--        v_border<='1';
--      else
--        v_border<='0';
 --     end if;
--    end if;
--  end process;

  hsyncgen: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vga_hsync<=h_polarity;
      else
        h_sync_tick <= '0';
        if hcount_q = (VGA_H_DISPLAY + VGA_H_BACKPORCH) then
          h_sync_tick <= '1';
          vga_hsync <= not h_polarity;
        elsif hcount_q = (VGA_HCOUNT - VGA_H_FRONTPORCH) then
          vga_hsync <= h_polarity;
        end if;
      end if;
    end if;
  end process;

  vcounter: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vcount_q <= VGA_V_DISPLAY + VGA_V_BACKPORCH - 1;
        vga_v_offset <= (others => '0'); -- Reset VGA vertical offset
        voff<=(others => '0');
      else

       if vcount_q = VGA_VCOUNT then
          vcount_q <= 0;
          voff <= (others => '0');

          vga_v_offset <= (others => '0'); -- Reset VGA vertical offset
          report "V finished" severity note;
       else
          if h_sync_tick='1' then
            vcount_q <= vcount_q + 1;
            if voff="100" then
              voff <= (others => '0');
              vga_v_offset <= vga_v_offset + 160;
            else
              voff <= voff + 1;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

  -- Cache clear.

  vsyncgen: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vga_vsync<=v_polarity;
        cache_clear <= '1';
      else
        cache_clear <= '0';
        if vcount_q = (VGA_V_DISPLAY + VGA_V_BACKPORCH) then
          vga_vsync <= not v_polarity;
        elsif vcount_q = (VGA_VCOUNT - VGA_V_FRONTPORCH) then
          vga_vsync <= v_polarity;
          cache_clear <= '1';
        end if;
      end if;
    end if;
  end process;

  -- Synchronous output
  process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if v_display_q='0' then
          vga_b <= (others =>'0');
          vga_r <= (others =>'0');
          vga_g <= (others =>'0');
      else
          vga_r <= vga_ram_data(11 downto 8);
          vga_g <= vga_ram_data(7 downto 4);
          vga_b <= vga_ram_data(3 downto 0);
      end if;
    end if;
  end process;

end behave;
