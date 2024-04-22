--+-----------------------------------+-------------------------------------+--
--|                      ___   ___    | (c) 2013-2014 William R Sowerbutts  |--
--|   ___  ___   ___ ___( _ ) / _ \   | will@sowerbutts.com                 |--
--|  / __|/ _ \ / __|_  / _ \| | | |  |                                     |--
--|  \__ \ (_) | (__ / / (_) | |_| |  | A Z80 FPGA computer, just for fun   |--
--|  |___/\___/ \___/___\___/ \___/   |                                     |--
--|                                   |              http://sowerbutts.com/ |--
--+-----------------------------------+-------------------------------------+--
--| A rudimentary SPI master peripheral                                     |--
--+-------------------------------------------------------------------------+--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity spi_master is
    port ( clk              : in  std_logic;
           reset            : in  std_logic;
           cpu_address      : in  std_logic_vector(2 downto 0);
           cpu_wait         : out std_logic;
           data_in          : in  std_logic_vector(7 downto 0);
           data_out         : out std_logic_vector(7 downto 0);
           enable           : in  std_logic;
           req_read         : in  std_logic;
           req_write        : in  std_logic;
           slave_cs         : out std_logic;
           slave_clk        : out std_logic;
           slave_mosi       : out std_logic;
           slave_miso       : in  std_logic
    );
end spi_master;

-- registers:
-- base+0   -- chip select control; bit 0 is slave_cs
-- base+1   -- status register; bit 0 indicates "transmitter busy"
-- base+2   -- transmitter: write a byte here, starts SPI bus transaction
-- base+3   -- receiver: last byte received (updated on each transation)
-- base+4   -- clock divider: clk counts from 0 to whatever is in this register before proceeding
--
-- Note that if an SPI transfer is underway already the CPU will be
-- forced to wait until it completes before any register can be
-- read or written. This is very convenient as it means you can
-- just read or write bytes without checking the status register.

architecture Behavioral of spi_master is

    -- start up in idle state
    signal slave_cs_register  : std_logic := '1';
    signal slave_clk_register : std_logic := '1';		--MODE3
--    signal slave_clk_register : std_logic := '0';	--MODE0
    signal slave_mosi_register: std_logic := '0';
    signal data_out_sr        : std_logic_vector(7 downto 0) := (others => '0'); -- shifted left ie MSB <- LSB
--    signal data_out_sr        : std_logic_vector(7 downto 0) := x"55"; -- shifted left ie MSB <- LSB
    signal data_in_sr         : std_logic_vector(7 downto 0) := (others => '0'); -- shifted left ie MSB <- LSB
    signal busy_sr            : std_logic_vector(7 downto 0) := (others => '0'); -- shifted left ie MSB <- LSB
    signal clk_divide_target  : unsigned(7 downto 0) := (others => '0');
--    signal clk_divide_target  : unsigned(7 downto 0) := x"aa";
    signal clk_divide_value   : unsigned(7 downto 0) := (others => '0');
    signal cpu_was_idle       : std_logic := '1';

    -- cpu visible registers
    signal chip_select_out    : std_logic_vector(7 downto 0);
    signal status_data_out    : std_logic_vector(7 downto 0);

begin

    chip_select_out <= "0000000" & slave_cs_register;
    status_data_out <= "0000000" & busy_sr(7);
    cpu_wait <= busy_sr(7);

    with cpu_address select
        data_out <=
            chip_select_out                     when "000",
            status_data_out                     when "001",
            data_out_sr                         when "010",
            data_in_sr                          when "011",
            std_logic_vector(clk_divide_target) when "100",
            status_data_out                     when others;
--	data_out <= data_out_sr;

    slave_cs   <= slave_cs_register;
    slave_clk  <= slave_clk_register;
    slave_mosi <= slave_mosi_register;

    spimaster_proc: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                slave_cs_register <= '1';
                slave_clk_register <= '1';	--MODE3
--                slave_clk_register <= '0';	--MODE0
                slave_mosi_register <= '0';
                data_out_sr <= (others => '0');
--                data_out_sr <= x"aa";
                data_in_sr <= (others => '0');
                busy_sr <= (others => '0');
                clk_divide_target <= (others => '0');
                clk_divide_value <= (others => '0');
                cpu_was_idle <= '1';
            else
                -- divide down input clk to get 2 * spi clk
                clk_divide_value <= clk_divide_value + 1;
                if clk_divide_value = clk_divide_target then
                    clk_divide_value <= to_unsigned(0, 8);
                end if;

                if busy_sr(7) = '1' then
                    if clk_divide_value = clk_divide_target then
                        -- we're in the midst of a transaction! whoo!
                        if slave_clk_register = '1' then
                            -- clk is high; next cycle will be falling edge of clk
                            slave_clk_register <= '0';
                            slave_mosi_register <= data_out_sr(7);
                            -- shift data out
                            data_out_sr <= data_out_sr(6 downto 0) & '0';
                        else
                            -- clk is low; next cycle will be rising edge of clk
                            slave_clk_register <= '1';
                            -- shift busy
                            busy_sr <= busy_sr(6 downto 0) & '0';
                            -- latch data in
                            data_in_sr <= data_in_sr(6 downto 0) & slave_miso;
                        end if;
                    end if;
                end if;


                if enable = '1' and req_write = '1' then
                    if busy_sr(7) = '0' and cpu_was_idle = '1' then
                        cpu_was_idle <= '0';
                        case cpu_address is
                            when "000" => 
                                slave_cs_register <= data_in(0);
                            when "010" => 
                            -- only allow writes when transmitter is idle
                                data_out_sr <= data_in; 
                                busy_sr <= (others => '1');
                            when "100" =>
                                clk_divide_target <= unsigned(data_in);
                            when others => -- no change
                        end case;
                    else
                        cpu_was_idle <= cpu_was_idle;
                    end if;
                else
                    cpu_was_idle <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
