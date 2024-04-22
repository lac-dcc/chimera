library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;
use work.helpers.all;

package hdmi_definitions is

    subtype color_data_t is std_logic_vector(7 downto 0);
    subtype control_data_t is std_logic_vector(1 downto 0);
    subtype tm_data_t is std_logic_vector(9 downto 0);
    type lut_tm is array (natural range <>) of tm_data_t;

    type ds_pair is record
        p : std_logic;
        n : std_logic;
    end record;

    type hdmi_connector_t is record
        clock    : ds_pair;
        channel0 : ds_pair;
        channel1 : ds_pair;
        channel2 : ds_pair;
    end record;

    type video_mode_sync_spec_t is record
        start  : natural;
        stop   : natural;
        active : std_logic;
    end record;

    type video_mode_dimension_t is record
        total      : natural;
        resolution : natural;
        sync       : video_mode_sync_spec_t;
    end record;

    type video_mode_t is record
        h : video_mode_dimension_t;
        v : video_mode_dimension_t;
    end record;

    type video_control_t is record
        blank : std_logic;
        vsync : std_logic;
        hsync : std_logic;
    end record;

    type video_pixel_t is record
        red   : std_logic_vector(7 downto 0);
        green : std_logic_vector(7 downto 0);
        blue  : std_logic_vector(7 downto 0);
    end record;

    -- These timings where gathered from CEA-861-D.
    constant video_640x480_60Hz : video_mode_t :=
        ( h => (total => 800, resolution => 640, sync => (start => 656, stop => 752, active => '0'))
        , v => (total => 490, resolution => 480, sync => (start => 490, stop => 492, active => '0'))
        );

    function to_video_pixel(d: word_t) return video_pixel_t;
    function lookup(lut: lut_tm; key: std_logic_vector) return std_logic_vector;
    function tm_encode_color(color_data: color_data_t) return tm_data_t;
    function tm_encode_control(control_data: control_data_t) return tm_data_t;
    
end hdmi_definitions;

package body hdmi_definitions is

    constant tm_2_to_8_lut : lut_tm :=
        ( "1101010100"
        , "0010101011"
        , "0101010100"
        , "1010101011"
        );


    constant tm_4_to_8_lut : lut_tm :=
        ( "1010011100"
        , "1001100011"
        , "1011100100"
        , "1011100010"
        , "0101110001"
        , "0100011110"
        , "0110001110"
        , "0100111100"
        , "1011001100"
        , "0100111001"
        , "0110011100"
        , "1011000110"
        , "1010001110"
        , "1001110001"
        , "0101100011"
        , "1011000011"
        );

    function to_video_pixel(d: word_t)
        return video_pixel_t
    is begin
        return ( red   => d(15 downto 11) & d(15) & d(15) & d(15)
               , green => d(10 downto 5) & d(10) & d(10)
               , blue  => d(4  downto 0) & d(4) & d(4) & d(4)
               );
    end;

    function lookup(lut: lut_tm; key: std_logic_vector)
        return std_logic_vector 
    is begin
        return lut(natural(to_integer(unsigned(key))));
    end;

    function tm_encode_color(color_data: color_data_t)
        return tm_data_t
    is begin
        return scanl1_xor(color_data) & "00";
    end;

    function tm_encode_control(control_data: control_data_t)
        return tm_data_t
    is begin
        return lookup(tm_2_to_8_lut, control_data);
    end;

end hdmi_definitions;
