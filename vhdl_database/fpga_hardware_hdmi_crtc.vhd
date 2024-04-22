library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;
use work.defines.all;
use work.hdmi_definitions.all;

entity video_unit is
    port
        -- clock_sys should be at least 25MHz + some.
        ( clock_sys           : in      std_logic
        ; clock_25            : in      std_logic
        ; clock_125           : in      std_logic
        ; clock_125n          : in      std_logic
        ; reset               : in      std_logic

        ; front_buffer_select : in      std_logic         := '0'

        ; ram_request_accepted  : in      std_logic
        ; ram_0_bus_control     : out     sram_bus_control_t
        ; ram_0_bus_data        : in      sram_bus_data_t
        ; ram_1_bus_control     : out     sram_bus_control_t
        ; ram_1_bus_data        : in      sram_bus_data_t
        
        ; hdmi_connector      : out     hdmi_connector_t
        );

end video_unit;

architecture Behavioral of video_unit is
    alias video_mode : video_mode_t is video_640x480_60Hz;

    alias clock_pixel : std_logic is clock_25;

    constant video_size : natural := video_mode.h.resolution * video_mode.v.resolution;

    constant buffer_0_address_top : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := to_unsigned(0, DATA_ADDRESS_WIDTH - 1);
    constant buffer_1_address_top : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := to_unsigned(65536, DATA_ADDRESS_WIDTH - 1);
    constant buffer_0_address_end_top : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := to_unsigned(65536, DATA_ADDRESS_WIDTH - 1);
    constant buffer_1_address_end_top : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := to_unsigned(131072, DATA_ADDRESS_WIDTH - 1);


    signal buffer_start_address : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := buffer_0_address_top;
    signal buffer_end_address : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := buffer_0_address_end_top;
    signal ram_read_address_i : unsigned(DATA_ADDRESS_WIDTH - 2 downto 0) := buffer_0_address_top;

    signal fifo_full : std_logic;

    signal scanout_pixel : video_pixel_t;
    signal scanout_pixel_raw : word_t;

    signal blank_n : std_logic;
    

    signal fifo_din : std_logic_vector(WORD_WIDTH*2-1 downto 0);
    
    signal video_control : video_control_t;
    
    signal red_s   : std_logic;
    signal green_s : std_logic;
    signal blue_s  : std_logic;
    signal clock_s : std_logic;
begin
    
    with front_buffer_select
    select
        buffer_start_address
            <= buffer_0_address_top when '0'
             , buffer_1_address_top when others;

    with front_buffer_select
    select
        buffer_end_address
            <= buffer_0_address_end_top when '0'
             , buffer_1_address_end_top when others;

    ram_address_counter:
        process (clock_sys) begin
            if rising_edge(clock_sys) then
                if ram_read_address_i = buffer_end_address then
                    ram_read_address_i <= buffer_start_address;
                else
                    -- Pause counter while fifo is full.
                    if fifo_full = '0' then
                        ram_read_address_i <= ram_read_address_i + 1;
                    end if;
                end if;
            end if;
        end process;

    ram_0_bus_control.address <= std_logic_vector(ram_read_address_i);
    ram_1_bus_control.address <= std_logic_vector(ram_read_address_i);
    
    ram_0_bus_control.write_enable_n <= '1';
    ram_1_bus_control.write_enable_n <= '1';
    
    
    fifo_din <= ram_0_bus_data & ram_1_bus_data;

    -- The video-fifo is first-word-fall-trough. This means we don't need to delay the signals from
    -- the video-timing-generator.
    video_fifo:
        entity work.video_fifo
           port map
                ( rst    => reset
                , wr_clk => clock_sys
                , rd_clk => clock_pixel

                , full   => fifo_full
                , wr_en  => ram_request_accepted
                -- Not sure how the 32 to 16 conversion takes place. Maybe these should change places.
                , din    => fifo_din

                , rd_en  => blank_n
                , dout   => scanout_pixel_raw
                );

    scanout_pixel <= to_video_pixel(scanout_pixel_raw);
--    scanout_pixel.red <= X"FF";
--    scanout_pixel.green <= X"00";
--    scanout_pixel.blue <= X"00";


    blank_n <= not video_control.blank;

    timing_generator:
        entity work.video_timing_generator
            port map
                ( clock        => clock_pixel
                , reset        => reset
                , launch       => fifo_full
                , control      => video_control
                );

    Inst_dvid: entity work.dvid PORT MAP(
      clk       => clock_125,
      clk_n     => clock_125n, 
      clk_pixel => clock_pixel,
      red_p     => scanout_pixel.red,
      green_p   => scanout_pixel.green,
      blue_p    => scanout_pixel.blue,
      blank     => video_control.blank,
      hsync     => video_control.hsync,
      vsync     => video_control.vsync,
      -- outputs to TMDS drivers
      red_s     => red_s,
      green_s   => green_s,
      blue_s    => blue_s,
      clock_s   => clock_s
   );

    OBUFDS_blue  : OBUFDS port map ( O  => hdmi_connector.channel0.p, OB => hdmi_connector.channel0.n, I  => blue_s  );
    OBUFDS_red   : OBUFDS port map ( O  => hdmi_connector.channel1.p, OB => hdmi_connector.channel1.n, I  => red_s );
    OBUFDS_green : OBUFDS port map ( O  => hdmi_connector.channel2.p, OB => hdmi_connector.channel2.n, I  => green_s );
    OBUFDS_clock : OBUFDS port map ( O  => hdmi_connector.clock.p, OB => hdmi_connector.clock.n, I  => clock_s );

end Behavioral;
