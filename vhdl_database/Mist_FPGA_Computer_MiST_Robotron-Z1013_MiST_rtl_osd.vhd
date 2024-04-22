----------------------------------------------------------------------------------
-- A simple OSD implementation. Can be hooked up between a cores
-- VGA output and the physical VGA pins
--
-- Copyright (c) 2017 by Bert Lange
-- https://github.com/boert/Z1013-mist
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity osd is
    generic
    (
        OSD_X_OFFSET        : natural   := 0;
        OSD_Y_OFFSET        : natural   := 0;
        OSD_COLOR           : natural   := 0
    );
    port
    (
        -- OSDs pixel clock, should be synchronous to cores pixel clock to
        -- avoid jitter.
        pclk                : in  std_logic;
        --
        -- SPI interface
        sck                 : in  std_logic;
        ss                  : in  std_logic;
        sdi                 : in  std_logic;
        --
        -- VGA signals coming from core
        red_in              : in  std_logic_vector( 5 downto 0);
        green_in            : in  std_logic_vector( 5 downto 0);
        blue_in             : in  std_logic_vector( 5 downto 0);
        hs_in               : in  std_logic;
        vs_in               : in  std_logic;
        --
        -- VGA signals going to video connector
        red_out             : out std_logic_vector( 5 downto 0);
        green_out           : out std_logic_vector( 5 downto 0);
        blue_out            : out std_logic_vector( 5 downto 0);
        hs_out              : out std_logic;
        vs_out              : out std_logic
    );
end entity osd;


architecture rtl of osd is

    constant OSD_WIDTH      : natural := 256; -- 10 bit
    constant OSD_HEIGHT     : natural := 128; -- 10 bit

    -- this core supports only the display related OSD commands
    -- of the minimig
    signal  sbuf            : std_logic_vector( 7 downto 0);
    signal  cmd             : std_logic_vector( 7 downto 0);
    signal  cnt             : unsigned(  4 downto 0);
    signal  bcnt            : unsigned( 10 downto 0);
    signal  osd_enable      : std_logic:= '1';
    type    osd_buffer_t is array( 0 to 2047) of std_logic_vector( 7 downto 0);
    signal  osd_buffer      : osd_buffer_t; -- the OSD buffer itself

    --
    -- horizontal counter
    signal  h_cnt           : unsigned( 9 downto 0) := ( others => '0');
    signal  hsD             : std_logic;
    signal  hsD2            : std_logic;
    signal  hs_low          : unsigned( 9 downto 0) := ( others => '0');
    signal  hs_high         : unsigned( 9 downto 0) := ( others => '0');
    signal  hs_pol          : std_logic;
    signal  h_dsp_width     : unsigned( 9 downto 0);
    signal  h_dsp_ctr       : unsigned( 9 downto 0);
    --
    -- vertical counter
    signal  v_cnt           : unsigned( 9 downto 0) := ( others => '0');
    signal  vsD             : std_logic;
    signal  vsD2            : std_logic;
    signal  vs_low          : unsigned( 9 downto 0) := ( others => '0');
    signal  vs_high         : unsigned( 9 downto 0) := ( others => '0');
    signal  vs_pol          : std_logic;
    signal  v_dsp_width     : unsigned( 9 downto 0);
    signal  v_dsp_ctr       : unsigned( 9 downto 0);
    --                      
    -- OSD area             
    signal  h_osd_start     : unsigned( 9 downto 0);
    signal  h_osd_end       : unsigned( 9 downto 0);
    signal  v_osd_start     : unsigned( 9 downto 0);
    signal  v_osd_end       : unsigned( 9 downto 0);
    --
    signal  h_osd_active    : std_logic;
    signal  v_osd_active    : std_logic;
    --
    signal  osd_de          : std_logic;
    signal  osd_hcnt        : unsigned( 7 downto 0) := ( others => '0');
    signal  osd_vcnt        : unsigned( 6 downto 0) := ( others => '0');
    signal  osd_byte        : std_logic_vector( 7 downto 0);
    signal  osd_pixel       : std_logic;
    signal  osd_color_reg   : unsigned( 2 downto 0);


begin

    -- ---------------------------------------------------------------------------------
    -- spi client
    -- ---------------------------------------------------------------------------------

    -- the OSD has its own SPI interface to the io controller
    process( sck, ss)
    begin

        if ss = '1' then
            cnt     <= ( others => '0');
            bcnt    <= ( others => '0');
        elsif rising_edge( sck) then
            sbuf    <= sbuf( 6 downto 0) & sdi;

            -- 0:7 is command, rest payload
            if cnt < 15 then
                cnt <= cnt + 1;
            else
                cnt <= to_unsigned( 8, cnt'length);
            end if;

            if cnt = 7 then
                cmd <= sbuf( 6 downto 0) & sdi;

                -- lower three command bits are line address
                bcnt <= unsigned( std_logic_vector( sbuf( 1 downto 0) & sdi)) & x"00";

                -- command 0x40: OSDCMDENABLE, OSDCMDDISABLE
                if sbuf( 6 downto 3) = "0100" then
                    osd_enable <= sdi;
                end if;
            end if;

            -- command 0x20: OSDCMDWRITE
            if( cmd( 7 downto 3) = "00100") and ( cnt = 15) then
                osd_buffer( to_integer( bcnt)) <= sbuf( 6 downto 0) & sdi;
                bcnt <= bcnt + 1;
            end if;
        end if;
    end process;



    -- ---------------------------------------------------------------------------------
    -- video timing and sync polarity anaylsis
    -- ---------------------------------------------------------------------------------

    hs_pol      <= '1'    when hs_high < hs_low else '0';
    h_dsp_width <= hs_low when hs_pol = '1'     else hs_high;
    h_dsp_ctr   <= '0' & h_dsp_width( 9 downto 1);

    process
    begin
        wait until rising_edge( pclk);
	
        -- bring hsync into local clock domain
        hsD     <= hs_in;
        hsD2    <= hsD;
	
        -- falling edge of hs_in
        if hsD = '0' and hsD2 = '1' then	
            h_cnt   <= ( others => '0');
            hs_high <= h_cnt;

        -- rising edge of hs_in
        elsif hsD = '1' and hsD2 = '0' then	
            h_cnt   <= ( others => '0');
            hs_low  <= h_cnt;

        else
            h_cnt   <= h_cnt + 1;
        end if;
    end process;


    vs_pol      <= '1'    when vs_high < vs_low else '0';
    v_dsp_width <= vs_low when vs_pol = '1'     else vs_high;
    v_dsp_ctr   <= '0' & v_dsp_width( 9 downto 1);

    process
    begin
        wait until rising_edge( hs_in); -- derived clocks -> bad design style
	
        -- bring vsync into local clock domain
        vsD     <= vs_in;
        vsD2    <= vsD;
	
        -- falling edge of vs_in
        if vsD = '0' and vsD2 = '1' then	
            v_cnt   <= ( others => '0');
            vs_high <= v_cnt;
            
        -- rising edge of vs_in
        elsif vsD = '1' and vsD2 = '0' then	
            v_cnt   <= ( others => '0');
            vs_low  <= v_cnt;

        else
            v_cnt   <= v_cnt + 1;
        end if;
    end process;

    -- area in which OSD is being displayed
    h_osd_start <= h_dsp_ctr + OSD_X_OFFSET - (OSD_WIDTH / 2);
    h_osd_end   <= h_dsp_ctr + OSD_X_OFFSET + (OSD_WIDTH / 2) - 1;
    v_osd_start <= v_dsp_ctr + OSD_Y_OFFSET - (OSD_HEIGHT / 2);
    v_osd_end   <= v_dsp_ctr + OSD_Y_OFFSET + (OSD_HEIGHT / 2) - 1;

    process
    begin
        wait until rising_edge( pclk);
        if hs_in /= hs_pol then
            if h_cnt = h_osd_start then h_osd_active <= '1'; end if;
            if h_cnt = h_osd_end   then h_osd_active <= '0'; end if;
        end if;
        if vs_in /= vs_pol then
            if v_cnt = v_osd_start then v_osd_active <= '1'; end if;
            if v_cnt = v_osd_end   then v_osd_active <= '0'; end if;
        end if;
    end process;

    osd_de      <= osd_enable and h_osd_active and v_osd_active;
    osd_hcnt    <= resize( h_cnt - h_osd_start + 1, 8);  -- one pixel offset for osd_byte register
    osd_vcnt    <= resize( v_cnt - v_osd_start, 7);
    osd_pixel   <= osd_byte( to_integer( osd_vcnt( 3 downto 1)));

    osd_byte    <= osd_buffer( to_integer( osd_vcnt( 6 downto 4) & osd_hcnt)) when rising_edge( pclk);

    osd_color_reg   <= to_unsigned( OSD_COLOR, osd_color_reg'length);

    red_out     <= red_in   when osd_de = '0' else osd_pixel & osd_pixel & osd_color_reg(2) & red_in( 5 downto 3);
    green_out   <= green_in when osd_de = '0' else osd_pixel & osd_pixel & osd_color_reg(1) & green_in( 5 downto 3);
    blue_out    <= blue_in  when osd_de = '0' else osd_pixel & osd_pixel & osd_color_reg(0) & blue_in( 5 downto 3);

    hs_out      <= hs_in;
    vs_out      <= vs_in;

end architecture rtl;
