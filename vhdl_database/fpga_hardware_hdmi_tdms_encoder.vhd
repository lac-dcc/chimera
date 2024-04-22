library ieee;
library unisim;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;
use work.defines.all;
use work.hdmi_definitions.all;

entity tdms_encoder is

    port
        ( clock_pixel         : in std_logic
        ; clock_5bit          : in std_logic
        ; clock_bit           : in std_logic
        ; strobe_serdes       : in std_logic
        ; blank               : in std_logic
        ; control_bits        : in std_logic_vector(1 downto 0)
        ; data                : in std_logic_vector(7 downto 0)
        ; tdms_signal         : out ds_pair
        );

end tdms_encoder;

architecture Behavioral of tdms_encoder is

    signal encoded_color   : tm_data_t;
    signal encoded_control : tm_data_t;
    signal data_to_send    : tm_data_t;
    
    signal double_rate_data : std_logic_vector(4 downto 0);

    signal serial_data : std_logic;

    signal cascade_data : std_logic_vector();

begin

    encoded_color   <= tm_encode_color(data);
    encoded_control <= tm_encode_control(control_bits);

    with blank
    select data_to_send
        <= encoded_color   when '1'
         , encoded_control when '0'
         ;

    gearbox_10to5:
        entity work.gearbox_10to5
            port map
                ( clock  => clock_5bit
                , input  => data_to_send
                , output => double_rate_data
                );

oserdes2_master :
    oserdes2
        generic map
            ( data_rate_oq   => "SDR",          -- output data rate ("sdr" or "ddr")
            , data_rate_ot   => "SDR",          -- 3-state data rate ("sdr" or "ddr")
            , data_width     => 5,              -- parallel data width (2-8)
            , output_mode    => "SINGLE_ENDED", -- "single_ended" or "differential" 
            , serdes_mode    => "MASTER",       -- "none", "master" or "slave" 
            , train_pattern  => 0               -- training pattern (0-15)
            )
        port map
            ( oq        => ser_output, -- 1-bit output: data output to pad or iodelay2
            ,shiftout1 => cascade1,  -- 1-bit output: cascade data output
            ,shiftout2 => cascade2,  -- 1-bit output: cascade 3-state output
            ,shiftout3 => open,     -- 1-bit output: cascade differential data output
            ,shiftout4 => open,     -- 1-bit output: cascade differential 3-state output
            ,shiftin1  => '1',      -- 1-bit input: cascade data input
            ,shiftin2  => '1',      -- 1-bit input: cascade 3-state input
            ,shiftin3  => cascade3, -- 1-bit input: cascade differential data input
            ,shiftin4  => cascade4, -- 1-bit input: cascade differential 3-state input
            ,tq        => open,     -- 1-bit output: 3-state output to pad or iodelay2

            ,clkdiv    => clkdiv,   -- 1-bit input: logic domain clock input
            -- d1 - d4: 1-bit (each) input: parallel data inputs
            ,d1        => ser_data(4),
            ,d2        => '0',
            ,d3        => '0',
            ,d4        => '0',
            ,ioce      => strobe,   -- 1-bit input: data strobe input
            ,oce       => '1',      -- 1-bit input: clock enable input
            ,rst       => '0',      -- 1-bit input: asynchrnous reset input
            -- t1 - t4: 1-bit (each) input: 3-state control inputs
            ,t1       => '0',
            ,t2       => '0',
            ,t3       => '0',
            ,t4       => '0',
            ,tce      => '1',       -- 1-bit input: 3-state clock enable input
            ,train    => '0'        -- 1-bit input: training pattern enable input
            );

oserdes2_slave : oserdes2
   generic map (
      bypass_gclk_ff => false,       -- bypass clkdiv syncronization registers (true/false)
      data_rate_oq => "sdr",         -- output data rate ("sdr" or "ddr")
      data_rate_ot => "sdr",         -- 3-state data rate ("sdr" or "ddr")
      data_width => 5,               -- parallel data width (2-8)
      output_mode => "single_ended", -- "single_ended" or "differential" 
      serdes_mode => "slave",       -- "none", "master" or "slave" 
      train_pattern => 0             -- training pattern (0-15)
   ) port map (
      oq        => open,            -- 1-bit output: data output to pad or iodelay2
      shiftout1 => open,     -- 1-bit output: cascade data output
      shiftout2 => open,     -- 1-bit output: cascade 3-state output
      shiftout3 => cascade3, -- 1-bit output: cascade differential data output
      shiftout4 => cascade4, -- 1-bit output: cascade differential 3-state output
      shiftin1  => cascade1, -- 1-bit input: cascade data input
      shiftin2  => cascade2, -- 1-bit input: cascade 3-state input
      shiftin3  => '1',      -- 1-bit input: cascade differential data input
      shiftin4  => '1',      -- 1-bit input: cascade differential 3-state input
      tq        => open,      -- 1-bit output: 3-state output to pad or iodelay2
      clk0      => clk0,      -- 1-bit input: i/o clock input
      clk1      => clk1,      -- 1-bit input: secondary i/o clock input
      clkdiv    => clkdiv,    -- 1-bit input: logic domain clock input
      -- d1 - d4: 1-bit (each) input: parallel data inputs
      d1        => ser_data(0),
      d2        => ser_data(1),
      d3        => ser_data(2),
      d4        => ser_data(3),
      ioce      => strobe,     -- 1-bit input: data strobe input
      oce       => '1',        -- 1-bit input: clock enable input
      rst       => '0',        -- 1-bit input: asynchrnous reset input
      -- t1 - t4: 1-bit (each) input: 3-state control inputs
      t1        => '0',
      t2        => '0',
      t3        => '0',
      t4        => '0',
      tce       => '1',             -- 1-bit input: 3-state clock enable input
      train     => '0'             -- 1-bit input: training pattern enable input
   );

    differential_buffer:
        obufds
            port map
                ( i  => serial_data
                , o  => tdms_signal.p
                , ob => tdms_signal.n
                );

end Behavioral;
