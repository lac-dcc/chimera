----------------------------------------------------------------------------------
-- user_io (vhdl version) for the Z1013 mist project
-- 
-- Copyright (c) 2017, 2018 by Bert Lange
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

--
-- simulated functions:
-- 0x01 buttons & switches
-- 0x02 joystick 0
-- 0x03 joystick 1
-- 0x05 ps/2 keyboard
-- 0x14 read config string
-- 0x15 write status (core reset)
-- 0x1e 32 bit status
--
--
-- not simulated (=untestet) functions (not needed by my core...):
--
-- 0x04 PS/2 mouse
-- 0x17 SD sector read
-- 0x18 SD sector write
-- 0x19 SD config
-- 0x1a analog joystick
-- 0x1b serial to arm
--
-- others function codes are not implemented (yet), e.g.:
-- 0x06 OSD keys
-- 0x1c set sd status
-- 0x1d sd info
-- 0x1f keyboard LEDs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity user_io is
    generic
    (
        strlen              : integer := 0
    );                       
    port                    
    (                       
        -- config string
        conf_str            : in  std_logic_vector(( 8 * STRLEN) - 1 downto 0);
        -- external interface
        SPI_CLK             : in  std_logic;
        SPI_SS_IO           : in  std_logic;
        SPI_MISO            : out std_logic;
        SPI_MOSI            : in  std_logic;
        -- internal interfaces
        joystick_0          : out std_logic_vector( 7 downto 0);
        joystick_1          : out std_logic_vector( 7 downto 0);
        joystick_analog_0   : out std_logic_vector( 15 downto 0);
        joystick_analog_1   : out std_logic_vector( 15 downto 0);
        buttons             : out std_logic_vector( 1 downto 0);
        switches            : out std_logic_vector( 1 downto 0);
        --
        status              : out std_logic_vector( 31 downto 0);
        -- connection to sd card emulation
        sd_lba              : in  std_logic_vector( 31 downto 0);
        sd_rd               : in  std_logic;
        sd_wr               : in  std_logic;
        sd_ack              : out std_logic;
        sd_conf             : in  std_logic;
        sd_sdhc             : in  std_logic;
        sd_dout             : out std_logic_vector( 7 downto 0); -- valid on rising edge of sd_dout_strobe
        sd_dout_strobe      : out std_logic;
        sd_din              : in  std_logic_vector( 7 downto 0);
        sd_din_strobe       : out std_logic;
        -- ps2 keyboard emulation
        ps2_clk             : in  std_logic; -- 12-16khz provided by core
        ps2_kbd_clk         : out std_logic;
        ps2_kbd_data        : out std_logic;
        ps2_mouse_clk       : out std_logic;
        ps2_mouse_data      : out std_logic;
        -- serial com port 
        serial_data         : in  std_logic_vector( 7 downto 0);
        serial_strobe       : in  std_logic;
        --
        -- FPGA clk domain
        clk                 : in  std_logic;
        -- ps2 keyboard scancodes
        scancode            : out std_logic_vector( 7 downto 0);
        scancode_en         : out std_logic
    );
end entity user_io;


architecture rtl of user_io is

    -- this variant of user_io is for 8 bit cores (type == a4) only
    constant core_type  : std_logic_vector( 7 downto 0) := x"a4";

    type slv_vector_t is array( natural range <>) of std_logic_vector( 7 downto 0);
    
    signal status_reg           : std_logic_vector( 31 downto 0);

    signal sbuf                 : std_logic_vector( 6 downto 0);
    signal cmd                  : std_logic_vector( 7 downto 0);
    signal bit_cnt              : natural range 0 to 7 := 7;
    signal byte_cnt             : unsigned( 7 downto 0);
    signal joystick0            : std_logic_vector( 5 downto 0);
    signal joystick1            : std_logic_vector( 5 downto 0);
    signal but_sw               : std_logic_vector( 3 downto 0);
    signal stick_idx            : unsigned( 2 downto 0);
    --                          
    signal sd_cmd               : std_logic_vector( 7 downto 0);
    signal spi_sck_D            : std_logic_vector( 7 downto 0);
    signal spi_sck              : std_logic;

    -- 16 byte fifo to store serial bytes
    constant SERIAL_OUT_FIFO_BITS : natural := 6;
    signal serial_out_fifo      : slv_vector_t( (2**SERIAL_OUT_FIFO_BITS)-1 downto 0);
    signal serial_out_wptr      : unsigned( SERIAL_OUT_FIFO_BITS-1 downto 0) := ( others => '0');
    signal serial_out_rptr      : unsigned( SERIAL_OUT_FIFO_BITS-1 downto 0) := ( others => '0');
    signal serial_out_data_available    : std_logic;

    signal serial_out_byte      : std_logic_vector( 7 downto 0);
    signal serial_out_status    : std_logic_vector( 7 downto 0);

    -- 8 byte fifos to store ps2 bytes
    constant PS2_FIFO_BITS      : natural := 3;

    -- keyboard
    signal ps2_kbd_fifo         : slv_vector_t( (2**PS2_FIFO_BITS)-1 downto 0);
    signal ps2_kbd_wptr         : unsigned( PS2_FIFO_BITS-1 downto 0) := ( others => '0');
    signal ps2_kbd_rptr         : unsigned( PS2_FIFO_BITS-1 downto 0) := ( others => '0');

    -- ps2 transmitter state machine
    signal ps2_kbd_tx_state     : unsigned( 3 downto 0) := ( others => '0');
    signal ps2_kbd_tx_byte      : std_logic_vector( 7 downto 0);
    signal ps2_kbd_parity       : std_logic;
    signal ps2_kbd_r_inc        : std_logic;


    -- mouse
    signal ps2_mouse_fifo       : slv_vector_t( (2**PS2_FIFO_BITS)-1 downto 0);
    signal ps2_mouse_wptr       : unsigned( PS2_FIFO_BITS-1 downto 0) := ( others => '0');
    signal ps2_mouse_rptr       : unsigned( PS2_FIFO_BITS-1 downto 0) := ( others => '0');

    -- ps2 transmitter state machine
    signal ps2_mouse_tx_state   : unsigned( 3 downto 0) := ( others => '0');
    signal ps2_mouse_tx_byte    : std_logic_vector( 7 downto 0);
    signal ps2_mouse_parity     : std_logic;
    signal ps2_mouse_r_inc      : std_logic;


    -- scancode synchronizer
    signal scancode_toggle      : std_logic := '0';
    signal scancode_toggle_1    : std_logic := '0';


begin

    status      <= status_reg;

    buttons     <= but_sw( 1 downto 0);
    switches    <= but_sw( 3 downto 2);
    sd_dout     <= sbuf & SPI_MOSI;

    -- command byte read by the io controller
    sd_cmd      <= x"5" & sd_conf & sd_sdhc & sd_wr & sd_rd;

    -- filter spi clock. the 8 bit gate delay is ~2.5ns in total
    -- funny construct
    spi_sck_D   <= spi_sck_D( 6 downto 0) & SPI_CLK;
    spi_sck     <= '1' when (( spi_sck = '1') and ( spi_sck_D /= x"00")) or
                            (( spi_sck = '0') and ( spi_sck_D  = x"ff"))
                   else '0';

    serial_out_data_available   <= '1' when serial_out_wptr /= serial_out_rptr else '0';
    serial_out_byte     <= serial_out_fifo( to_integer( serial_out_rptr));
    serial_out_status   <= "1000000" & serial_out_data_available;

    -- drive MISO only when transmitting core id
    process( spi_sck, SPI_SS_IO)
    begin
        if SPI_SS_IO = '1' then
            SPI_MISO    <= 'Z';
        elsif falling_edge( spi_sck) then
            -- first byte returned is always core type, further bytes are 
            -- command dependent
            if byte_cnt = 0 then
                SPI_MISO    <= core_type( bit_cnt);
            else
                -- default
                SPI_MISO    <= '0';

                case cmd is
                    -- reading serial fifo
                    when x"1b" =>
				        -- send alternating flag byte and data
                        if byte_cnt( 0) = '1' then
                            SPI_MISO <= serial_out_status( bit_cnt);
                        else
                            SPI_MISO <= serial_out_byte( bit_cnt);
                        end if;

                    -- reading config string
                    when x"14" =>
				        -- returning a byte from string
                        if byte_cnt < STRLEN + 1 then
                            SPI_MISO <= conf_str( bit_cnt + 8 * ( STRLEN - to_integer( byte_cnt)));
                        end if;

                    -- reading sd card status
                    when x"16" =>
                        if byte_cnt = 1 then
                            SPI_MISO <= sd_cmd( bit_cnt);
                        elsif byte_cnt >= 2 and byte_cnt < 6 then
                            SPI_MISO <= sd_lba(( 5 - to_integer( byte_cnt) * 8) - bit_cnt);
                        end if;
			
                    -- reading sd card write data
                    when x"18" =>
                        SPI_MISO <= sd_din( bit_cnt);

                    when others =>
                        SPI_MISO <= '0';

                end case;
            end if;
        end if;
    end process;

    ---------------- PS2 ---------------------
    ps2_kbd_clk <= '1' when ps2_clk = '1' or ( ps2_kbd_tx_state = 0)
                       else '0';

    -- ps2 transmitter
    -- Takes a byte from the FIFO and sends it in a ps2 compliant serial format.
    process
    begin
        wait until rising_edge( ps2_clk);
        ps2_kbd_r_inc   <= '0';

        if ps2_kbd_r_inc = '1' then
            ps2_kbd_rptr    <= ps2_kbd_rptr + 1;
        end if;

        -- transmitter is idle?
        if ps2_kbd_tx_state = 0 then
            -- data in fifo present?
            if ps2_kbd_wptr /= ps2_kbd_rptr then
                -- load tx register from fifo
                ps2_kbd_tx_byte <= ps2_kbd_fifo( to_integer( ps2_kbd_rptr));
                ps2_kbd_r_inc   <= '1';

                -- reset parity
                ps2_kbd_parity  <= '1';

                -- start transmitter
                ps2_kbd_tx_state <= "0001";

                -- put start bit on data line
                ps2_kbd_data     <= '0';
            end if;
        else
		    -- transmission of 8 data bits
            if ps2_kbd_tx_state >= 1 and ps2_kbd_tx_state < 9 then
                ps2_kbd_data    <= ps2_kbd_tx_byte( 0); -- data bits shift down
                ps2_kbd_tx_byte( 6 downto 0) <= ps2_kbd_tx_byte( 7 downto 1);
                if ps2_kbd_tx_byte( 0) = '1' then
                    ps2_kbd_parity  <= not ps2_kbd_parity;
                end if;
            end if;

            -- transmission of parity
            if ps2_kbd_tx_state = 9 then
                ps2_kbd_data    <= ps2_kbd_parity;
            end if;

            -- transmission of stop bit
            if ps2_kbd_tx_state = 10 then
                ps2_kbd_data    <= '1'; -- stop bit is 1
            end if;

            -- advance state machine
            if ps2_kbd_tx_state < 11 then
                ps2_kbd_tx_state    <= ps2_kbd_tx_state + 1;
            else
                ps2_kbd_tx_state    <= "0000";
            end if;
        end if;
    end process;

    ps2_mouse_clk <= '1' when ps2_clk = '1' or ( ps2_mouse_tx_state = 0)
                     else '0';

    -- ps2 transmitter
    -- Takes a byte from the FIFO and sends it in a ps2 compliant serial format.
    process
    begin
        wait until rising_edge( ps2_clk);
        ps2_mouse_r_inc             <= '0';

        if ps2_mouse_r_inc = '1' then
            ps2_mouse_rptr          <= ps2_mouse_rptr + 1;
        end if;

        -- transmitter is idle?
        if ps2_mouse_tx_state = 0 then
            -- data in fifo present?
            if ps2_mouse_wptr /= ps2_mouse_rptr then
                -- load tx register from fifo
                ps2_mouse_tx_byte   <= ps2_mouse_fifo( to_integer( ps2_mouse_rptr));
                ps2_mouse_r_inc     <= '1';

                -- reset parity
                ps2_mouse_parity    <= '1';

                -- start transmitter
                ps2_mouse_tx_state  <= "0001";

                -- put start bit on data line
                ps2_mouse_data      <= '0';
            end if;
        else
		    -- transmission of 8 data bits
            if ps2_mouse_tx_state >= 1 and ps2_mouse_tx_state < 9 then
                ps2_mouse_data      <= ps2_mouse_tx_byte( 0); -- data bits shift down
                ps2_mouse_tx_byte( 6 downto 0) <= ps2_mouse_tx_byte( 7 downto 1);
                if ps2_mouse_tx_byte( 0) = '1' then
                    ps2_mouse_parity    <= not ps2_mouse_parity;
                end if;
            end if;

            -- transmission of parity
            if ps2_mouse_tx_state = 9 then
                ps2_mouse_data      <= ps2_mouse_parity;
            end if;

            -- transmission of stop bit
            if ps2_mouse_tx_state = 10 then
                ps2_mouse_data      <= '1'; -- stop bit is 1
            end if;

            -- advance state machine
            if ps2_mouse_tx_state < 11 then
                ps2_mouse_tx_state  <= ps2_mouse_tx_state + 1;
            else
                ps2_mouse_tx_state  <= "0000";
            end if;
        end if;
    end process;



    -- fifo to receive serial data from core to be forwarded to io controller

    -- status[0] is reset signal from io controller and is thus used to flush
    -- the fifo
    process( serial_strobe, status_reg)
    begin
        if status_reg( 0) = '1' then
            serial_out_wptr <= ( others => '0');
        elsif rising_edge( serial_strobe) then
            serial_out_fifo( to_integer( serial_out_wptr)) <= serial_data;
            serial_out_wptr <= serial_out_wptr + 1;
        end if;
    end process;

    process( spi_sck, status_reg)
    begin
        if status_reg( 0) = '1' then
            serial_out_rptr <= ( others => '0');
        elsif falling_edge( spi_sck) then
            if( byte_cnt /= 0) and ( cmd = x"1b") then
                if( bit_cnt = 7) and ( byte_cnt(0) = '0') and ( serial_out_data_available = '1') then
                    serial_out_rptr <= serial_out_rptr + 1;
                end if;
            end if;
        end if;
    end process;


    -- SPI receiver
    process( spi_sck, SPI_SS_IO)
    begin
        if SPI_SS_IO = '1' then
            bit_cnt         <= 7;
            byte_cnt        <= ( others => '0');
            sd_ack          <= '0';
            sd_dout_strobe  <= '0';
            sd_din_strobe   <= '0';
        elsif rising_edge( spi_sck) then
            sd_dout_strobe  <= '0';
            sd_din_strobe   <= '0';

            if bit_cnt > 0 then
                sbuf( 6 downto 0) <= sbuf( 5 downto 0) & SPI_MOSI;
            end if;

            if bit_cnt > 0 then
                bit_cnt <= bit_cnt - 1;
            else
                bit_cnt <= 7;
            end if;

            if( bit_cnt = 0) and ( byte_cnt /= 255) then
                byte_cnt    <= byte_cnt + 1;
            end if;

            -- finished reading command byte
            if bit_cnt = 0 then
                if byte_cnt = 0 then
                    cmd <= sbuf & SPI_MOSI;
				
                    -- fetch first byte when sectore FPGA->IO command has been seen
                    if (sbuf & SPI_MOSI) = x"18" then
                        sd_din_strobe   <= '1';
                        sd_ack          <= '1';
                    end if;

                    if (sbuf & SPI_MOSI) = x"17" then
                        sd_ack          <= '1';
                    end if;
                else

                    case cmd is
				    
                        -- buttons and switches
                        when x"01" =>
                            but_sw      <= sbuf( 2 downto 0) & SPI_MOSI;

                        when x"02" =>
                            joystick_0  <= sbuf & SPI_MOSI;

                        when x"03" =>
                            joystick_1  <= sbuf & SPI_MOSI;

                        when x"04" =>
                            -- store incoming ps2 mouse bytes 
                            ps2_mouse_fifo( to_integer(ps2_mouse_wptr)) <= sbuf & SPI_MOSI; 
                            ps2_mouse_wptr <= ps2_mouse_wptr + 1;

                        when x"05" =>
                            -- store incoming ps2 keyboard bytes 
                            ps2_kbd_fifo( to_integer(ps2_kbd_wptr)) <= sbuf & SPI_MOSI; 
                            ps2_kbd_wptr <= ps2_kbd_wptr + 1;
                            -- 
                            scancode        <= sbuf & SPI_MOSI;
                            scancode_toggle <= not scancode_toggle;

                        when x"15" =>
                            status_reg( 7 downto 0) <= sbuf & SPI_MOSI;

				        -- send sector IO -> FPGA
                        when x"17" =>
                            -- flag that download begins
					        sd_dout_strobe <= '1';

				        -- send sector FPGA -> IO
                        when x"18" =>
                            sd_din_strobe <= '1';

				        -- send SD config IO -> FPGA
                        when x"19" =>
                            sd_dout_strobe <= '1';

                        -- joystick analog
                        when x"1a" =>
                            -- first byte is joystick index
                            if byte_cnt = 1 then
                                stick_idx   <= unsigned( sbuf( 1 downto 0) & SPI_MOSI);
                            elsif byte_cnt = 2 then
                                -- second is x axis
                                if stick_idx = 0 then
                                    joystick_analog_0( 15 downto 8) <= sbuf & SPI_MOSI;
                                elsif stick_idx = 1 then
                                    joystick_analog_1( 15 downto 8) <= sbuf & SPI_MOSI;
                                end if;
                            elsif byte_cnt = 3 then
                                -- third byte is y axis
                                if stick_idx = 0 then
                                    joystick_analog_0( 7 downto 0) <= sbuf & SPI_MOSI;
                                elsif stick_idx = 1 then
                                    joystick_analog_1( 7 downto 0) <= sbuf & SPI_MOSI;
                                end if;
                            end if;

                        -- status, 32 bits 
                        when x"1e" =>
                            case to_integer( byte_cnt) is
                                when 1 => status_reg(  7 downto  0) <= sbuf & SPI_MOSI; 
                                when 2 => status_reg( 15 downto  8) <= sbuf & SPI_MOSI;
                                when 3 => status_reg( 23 downto 16) <= sbuf & SPI_MOSI;
                                when 4 => status_reg( 31 downto 24) <= sbuf & SPI_MOSI;
                                when others => NULL;
                            end case;

                        when others =>
                            NULL;

                    end case;
                end if;
            end if;
        end if;
    end process;

    -- FPGA clk domain
    process
    begin
        wait until rising_edge( clk);

        -- synchronize scancode_en
        scancode_en <= '0';
        if scancode_toggle /= scancode_toggle_1 then
            scancode_en <= '1';
        end if;
        scancode_toggle_1 <= scancode_toggle;

    end process;

end architecture rtl;
