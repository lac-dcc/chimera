-- MAX7219 module driver. Based on a code published as
-- "Driver for MAX7219 with 8 digit 7-segment display" by sjm 15 May 2017
--
-- Modified by dmhl, august 2020 (https://github.com/dmhl)
--
-- Features:
-- * asynchronous reset
-- * support multiple connected MAX7219 modules [generic section]
-- * adjust brightness of the display of each module separately [generic section]

library ieee;
use ieee.std_logic_1164.all;
use work.MAX7219_Pack.all;
use ieee.numeric_std.all;

entity MAX7219 is
    generic (
        devices   : positive;                -- Number of cascade connected modules
        intensity : MAX7219ConfigIntensity_t -- Displays intensity configuration array
    );
    port (
        clk         : in std_logic;
        reset_n     : in std_logic;
        data_vector : in std_logic_vector((Devices * 8 * MAX7219BitsPerDigit) - 1 downto 0);
        clk_out     : out std_logic;
        data_out    : out std_logic;
        load_out    : out std_logic
    );
end entity;

architecture rtl of MAX7219 is

    constant ActiveDigits   : integer := Devices * 8;
    constant DataBits       : integer := ActiveDigits * MAX7219BitsPerDigit;
    constant CommandRegSize : integer := Devices * MAX7219CommandRegSize;

    type DigitData_t is array (0 to ActiveDigits - 1) of std_logic_vector(3 downto 0);

    type OperationState_t is (reset,
        init_on, init_mode, init_intensity, init_scan,
        latch_data, send_digits
    );
    signal state : OperationState_t := reset;

    type DriverState_t is (idle, start, clk_data, clk_high, clk_low, finished);
    signal driver_state : DriverState_t                                   := idle;

    signal command_reg  : std_logic_vector((CommandRegSize - 1) downto 0) := (others => '0');

begin
    process (clk, reset_n)
        variable counter     : integer              := 0;
        variable digits      : DigitData_t          := (others => x"0");
        variable digit_index : integer range 0 to 7 := 7;

    begin
        if reset_n = '0' then
            driver_state <= idle;
            state        <= reset;
            load_out     <= '0';
            counter     := 0;
            digit_index := 7;
            for i in Devices downto 1 loop
                command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <= x"0c00";
            end loop;
        elsif rising_edge(clk) then
            case state is
                when reset =>
                    if (driver_state = idle) then
                        -- Shutdown Register (0x0C): Shutdown Mode (0x00)
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <= x"0c00";
                        end loop;
                        driver_state <= start;
                        state        <= init_on;
                    end if;
                when init_on =>
                    if (driver_state = idle) then
                        -- Shutdown Register (0x0C): Normal Operation (0x01)
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <= x"0c01";
                        end loop;
                        driver_state <= start;
                        state        <= init_mode;
                    end if;
                when init_mode =>
                    if (driver_state = idle) then
                        -- Decode-Mode Register (0x09): No decode for digits 7-0 (0x00)
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <= x"0900";
                        end loop;
                        driver_state <= start;
                        state        <= init_intensity;
                    end if;
                when init_intensity =>
                    if (driver_state = idle) then
                        -- Intensity Register (0x0A)
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <=
                            x"0A0" & std_logic_vector(to_unsigned(intensity(i - 1), 4));
                        end loop;
                        driver_state <= start;
                        state        <= init_scan;
                    end if;
                when init_scan =>
                    if (driver_state = idle) then
                        -- Scan-Limit Register(0x0B): Display digits 0 1 2 3 4 5 6 7 (0x07)
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <= x"0B07";
                        end loop;
                        driver_state <= start;
                        state        <= latch_data;
                    end if;
                when latch_data =>
                    for i in ActiveDigits downto 1 loop
                        digits(i - 1) := data_vector(4 * i - 1 downto 4 * i - 4);
                    end loop;

                    digit_index := 7;
                    state <= send_digits;
                when send_digits =>
                    if (driver_state = idle) then
                        for i in Devices downto 1 loop
                            command_reg(MAX7219CommandRegSize * i - 1 downto MAX7219CommandRegSize * (i - 1)) <=
                            x"0" & std_logic_vector(to_unsigned(digit_index + 1, 4)) & hex2segment(digits(8 * i - (8 - digit_index)));
                        end loop;
                        driver_state <= start;
                        if digit_index = 0 then
                            state <= latch_data;
                        else
                            digit_index := digit_index - 1;
                            state <= send_digits;
                        end if;
                    end if;
                when others => null;
            end case;

            case driver_state is
                when idle =>
                    load_out <= '1';
                    clk_out  <= '0';
                when start =>
                    load_out <= '0';
                    counter := CommandRegSize;
                    driver_state <= clk_data;
                when clk_data =>
                    counter := counter - 1;
                    data_out     <= command_reg(counter);
                    driver_state <= clk_high;
                when clk_high =>
                    clk_out      <= '1';
                    driver_state <= clk_low;
                when clk_low =>
                    clk_out <= '0';
                    if (counter = 0) then
                        load_out     <= '1';
                        driver_state <= finished;
                    else
                        driver_state <= clk_data;
                    end if;
                when finished =>
                    driver_state <= idle;
                when others => null;
            end case;
        end if;
    end process;
end architecture;