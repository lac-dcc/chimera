library ieee;
library unisim;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;
use work.defines.all;
use work.hdmi_definitions.all;

entity hdmi_output is

    port
        ( clock_pixel         : in      std_logic
        ; clock_5bit          : in      std_logic
        ; clock_bit           : in      std_logic
        ; strobe_serdes       : in      std_logic
        ; control             : in      video_control_t
        ; pixel_data          : in      video_pixel_t
        ; hdmi_connector      : out     hdmi_connector_t
        );

end hdmi_output;

architecture Behavioral of hdmi_output is

    signal beam_control_bits : std_logic_vector(1 downto 0);

begin

    beam_control_bits <= (control.hsync & control.vsync);

    tdms_channel0_blue:
        entity work.tdms_encoder
            port map
                ( clock_pixel   => clock_pixel
                , clock_5bit    => clock_5bit
                , clock_bit     => clock_bit
                , strobe_serdes => strobe_serdes
                , blank         => control.blank
                , control_bits  => beam_control_bits
                , data          => pixel_data.blue
                , tdms_signal   => hdmi_connector.channel0
                );

    tdms_channel1_red:
        entity work.tdms_encoder
            port map
                ( clock_pixel   => clock_pixel
                , clock_5bit    => clock_5bit
                , clock_bit     => clock_bit
                , strobe_serdes => strobe_serdes
                , blank         => control.blank
                , control_bits  => "00"
                , data          => pixel_data.red
                , tdms_signal   => hdmi_connector.channel1
                );

    tdms_channel2_green:
        entity work.tdms_encoder
            port map
                ( clock_pixel   => clock_pixel
                , clock_5bit    => clock_5bit
                , clock_bit     => clock_bit
                , strobe_serdes => strobe_serdes
                , blank         => control.blank
                , control_bits  => "00"
                , data          => pixel_data.green
                , tdms_signal   => hdmi_connector.channel2
                );

    tdms_clock:
        obufds
            port map
                ( i  => clock_pixel
                , o  => hdmi_connector.clock.p
                , ob => hdmi_connector.clock.n
                );

end Behavioral;
