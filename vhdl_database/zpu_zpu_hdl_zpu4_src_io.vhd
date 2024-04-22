library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.txt_util.all;


entity zpu_io is
    generic (
        log_file : string := "log.txt"
        );
    port(
        clk         : in  std_logic;
        areset      : in  std_logic;
        busy        : out std_logic;
        writeEnable : in  std_logic;
        readEnable  : in  std_logic;
        write       : in  std_logic_vector(wordSize-1 downto 0);
        read        : out std_logic_vector(wordSize-1 downto 0);
        addr        : in  std_logic_vector(maxAddrBit downto minAddrBit)
        );
end entity zpu_io;


architecture behave of zpu_io is

    signal   timer_read  : std_logic_vector(7 downto 0);
    signal   timer_we    : std_logic;
    --
    signal   serving     : std_logic;
    --
    file l_file          : text open write_mode is log_file;
    constant lowAddrBits : std_logic_vector(minAddrBit-1 downto 0) := (others => '0');
    constant tx_full     : std_logic                               := '0';
    constant rx_empty    : std_logic                               := '1';

begin

    
    timerinst : timer
        port map (
            clk    => clk,
            areset => areset,
            we     => timer_we,
            din    => write(7 downto 0),
            adr    => addr(4 downto 2),
            dout   => timer_read
            );

    busy     <= writeEnable or readEnable;
    timer_we <= writeEnable and addr(12);

    process(areset, clk)
        variable taddr    : std_logic_vector(maxAddrBit downto 0);
        -- pragma translate_off
        variable line_out : line := new string'("");
        variable char     : character;
        -- pragma translate_on
    begin
        taddr                               := (others => '0');
        taddr(maxAddrBit downto minAddrBit) := addr;

        if (areset = '1') then
        elsif (clk'event and clk = '1') then
            if writeEnable = '1' then
                -- external interface (fixed address)
                --<JK> extend compare to avoid waring messages
                if ("1" & addr & lowAddrBits) = x"80a000c" then
                    -- Write to UART
                    report "Write to UART[0]" & " :0x" & hstr(write);
                    -- pragma translate_off
                    char := character'val(to_integer(unsigned(write)));
                    if char = lf then
                        std.textio.writeline(l_file, line_out);
                    else
                        std.textio.write(line_out, char);
                    end if;
                    -- pragma translate_on

                elsif addr(12) = '1' then
                    report "Write to TIMER" & " :0x" & hstr(write);

                else
                    
                    report "Illegal IO write @" & "0x" & hstr(taddr) severity warning;
                end if;
                
            end if;
            read <= (others => '0');
            if (readEnable = '1') then
                --<JK> extend compare to avoid waring messages
                if ("1" & addr & lowAddrBits) = x"80a000c" then
                    report "Read UART[0]";
                    read(8) <= not tx_full;            -- output fifo not full
                    read(9) <= not rx_empty;           -- receiver not empty
                elsif ("1" & addr & lowAddrBits) = x"80a0010" then
                    report "Read UART[1]";
                    read(8)          <= not rx_empty;  -- receiver not empty
                    read(7 downto 0) <= (others => '0');
                elsif addr(12) = '1' then
                    report "Read TIMER";
                    read(7 downto 0) <= timer_read;
                elsif addr(11) = '1' then
                    report "Read ZPU Freq";
                    read(7 downto 0) <= ZPU_Frequency;
                else
                    report "Illegal IO read @" & "0x" & hstr(taddr) severity warning;
                end if;
            end if;
        end if;
    end process;

end architecture behave;

