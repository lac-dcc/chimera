library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity test_main is
end test_main;
 
architecture behavior of test_main is 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component mainmodule
--        generic(
--            tick_1M_div : integer
--        );
        port(
            clk_in : in std_logic;
            spi_ss_n : in std_logic;
            spi_sclk : in std_logic;
            spi_mosi : in std_logic;
            spi_miso : out std_logic;
            led_out : out std_logic;
            fifo_clk : in std_logic;
            fifo_empty : out std_logic;
            fifo_read_n : in std_logic;
            fifo_data : out std_logic_vector(15 downto 0);
            logic_data : in std_logic_vector(15 downto 0)
--            logic_data : in std_logic_vector(15 downto 2);
--            debug, debug2 : out std_logic
        );
    end component;

    --Inputs
    signal clk : std_logic := '0';
    signal spi_ss_n : std_logic := '1';
    signal spi_sclk : std_logic := '0';
    signal spi_mosi : std_logic := '0';
    signal fifo_read_n : std_logic := '1';
    signal logic_data : std_logic_vector(15 downto 0) := (others=>'0');

    --Outputs
    signal spi_miso : std_logic;
    signal led_out : std_logic;
    signal fifo_empty : std_logic;
    signal fifo_data : std_logic_vector(15 downto 0);

    -- internal signals

    -- Clock period definitions
    constant clk_period : time := 20.83 ns;
    constant sclk_period : time := 100 ns;
 
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: mainmodule
--        generic map(
--            tick_1M_div => 48
--        )
        port map(
            clk_in => clk,
            spi_ss_n => spi_ss_n,
            spi_sclk => spi_sclk,
            spi_mosi => spi_mosi,
            spi_miso => spi_miso,
            led_out => led_out,
            fifo_clk => clk,
            fifo_empty => fifo_empty,
            fifo_read_n => fifo_read_n,
            fifo_data => fifo_data,
            logic_data => logic_data(15 downto 2)
        );

    -- Clock process definitions
    clk_process: process
    begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
    end process;
 
    -- Stimulus process
    stim_proc: process
        -- send spi data
        procedure spi_start is
        begin
            wait for 2*sclk_period;
            spi_ss_n <= '0';
            wait for 2*sclk_period;
        end spi_start;
        
        procedure spi_stop is
        begin
            wait for 2*sclk_period;
            spi_ss_n <= '1';
            wait for 2*sclk_period;
        end spi_stop;
        
        procedure spi_send(data: in unsigned(7 downto 0)) is
        begin
            for i in 0 to 7 loop
                spi_mosi <= data(7-i);
                wait for sclk_period/2;
                spi_sclk <= '1';
                wait for sclk_period/2;
                spi_sclk <= '0';
            end loop;
        end spi_send;
        
    begin		
        -- wait for internal reset
        wait for clk_period*50;

        -- insert stimulus here 
        
--        -- read adress 0x00 (fpga bitstream version)
--        spi_start;
--        spi_send('1' & to_unsigned(0, 7));
--        spi_send(to_unsigned(0, 8));
--        spi_stop;
--
--        -- write adress 0x05, data 0x80 (set led pwm to 50%)
--        spi_start;
--        spi_send('0' & to_unsigned(5, 7));
--        spi_send(to_unsigned(128, 8));
--        spi_stop;
--
--        -- select channels
--        spi_start;
--        spi_send('0' & to_unsigned(2, 7));
--        spi_send(to_unsigned(255, 8));
--        spi_stop;
--        spi_start;
--        spi_send('0' & to_unsigned(3, 7));
--        spi_send(to_unsigned(255, 8));
--        spi_stop;
--
--        -- set base clock to 100MHz
--        spi_start;
--        spi_send('0' & to_unsigned(10, 7));
--        spi_send(to_unsigned(0, 8));
--        spi_stop;
--        
--        -- set sample rate to 5Mhz => n = 20-1
--        spi_start;
--        spi_send('0' & to_unsigned(4, 7));
--        spi_send(to_unsigned(20 - 1, 8));
--        spi_stop;
--
--        -- start sampling
--        spi_start;
--        spi_send('0' & to_unsigned(1, 7));
--        spi_send(to_unsigned(1, 8));
--        spi_stop;
--
--        -- read some values from fifo
        wait until fifo_empty = '0';
--        wait for 100 us;
--        wait for 50*clk_period;
--        wait until falling_edge(clk);
--        wait until rising_edge(clk);
--        for i in 1 to 1000 loop
--            fifo_read_n <= '0';
--            wait for clk_period;
--            fifo_read_n <= '1';
--            wait for clk_period;
--        end loop;

        wait;
    end process;

end;
