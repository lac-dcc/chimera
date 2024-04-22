----------------------------------------------------------------------------------
-- data_io (vhdl version) for the Z1013 mist project
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


entity data_io is
    port
    (
	    -- io controller spi interface
        sck         : in  std_logic;
        ss          : in  std_logic;
        sdi         : in  std_logic;
        --
        downloading : out std_logic;                        -- signal indicating an active download
        index       : out std_logic_vector( 4 downto 0);    -- menu index used to upload the file
	    -- external ram interface
        clk         : in  std_logic;
        wr          : out std_logic;
        addr        : out std_logic_vector( 24 downto 0);
        data        : out std_logic_vector( 7 downto 0)
    );
end entity data_io;


architecture rtl of data_io is

    ----------------------------------------------------------------------------------
    -- SPI slave
    ----------------------------------------------------------------------------------

    constant UIO_FILE_TX        : std_logic_vector( 7 downto 0) := x"53";
    constant UIO_FILE_TX_DAT    : std_logic_vector( 7 downto 0) := x"54";
    constant UIO_FILE_INDEX     : std_logic_vector( 7 downto 0) := x"55";

    -- this core supports only the display related OSD commands
    -- of the minimig
    signal sbuf             : std_logic_vector( 6 downto 0);
    signal cmd              : std_logic_vector( 7 downto 0);
    signal cnt              : unsigned( 4 downto 0);
    signal rclk             : std_logic;
    --
    signal downloading_reg  : std_logic := '0';
    signal addr_reg         : unsigned( 24 downto 0);
    --
    signal rclkD            : std_logic;
    signal rclkD2           : std_logic;

begin

    downloading <= downloading_reg;
    addr        <= std_logic_vector( addr_reg);

    -- data_io has its own SPI interface to the io controller
    process( sck, ss)
    begin
        if ss = '1' then
            cnt     <= ( others => '0');
        elsif rising_edge( sck) then
            rclk    <= '0';

            -- don't shift in last bit. It is evaluated directly
            -- when writing to ram
            if cnt /= 15 then
                sbuf    <= sbuf( 5 downto 0) & sdi;
            end if;


            -- increase target address after write
            if rclk = '1' then
                addr_reg    <= addr_reg + 1;
            end if;
		
            -- count 0-7 8-15 8-15 ...
            if cnt < 15 then
                cnt     <= cnt + 1;
            else
                cnt     <= to_unsigned( 8, cnt'length);
            end if;
		
            -- finished command byte
            if cnt = 7 then
                cmd     <= sbuf & sdi;
            end if;
                
            -- prepare/end transmission
            if( cmd = UIO_FILE_TX) and ( cnt = 15) then
                -- prepare
                if sdi = '1' then
                    addr_reg        <= ( others => '0');
                    downloading_reg <= '1';
                else
                    downloading_reg <= '0';
                end if;
            end if;

            -- command 0x54: UIO_FILE_TX
            if( cmd = UIO_FILE_TX_DAT) and ( cnt = 15) then
                data    <= sbuf & sdi;
                rclk    <= '1';
            end if;

            -- expose file (menu) index
            if( cmd = UIO_FILE_INDEX) and ( cnt = 15) then
                index   <= sbuf( 3 downto 0) & sdi;
            end if;

        end if;
    end process;


    process
    begin
        wait until rising_edge( clk);
	    -- bring rclk from spi clock domain into c64 clock domain
        rclkD   <= rclk;
        rclkD2  <= rclkD;
        wr      <= '0';

        if( rclkD = '1') and ( rclkD2 = '0') then
            wr  <= '1';
        end if;
    end process;

end architecture rtl;
