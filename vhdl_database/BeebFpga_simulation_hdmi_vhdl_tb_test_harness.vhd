library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;          -- i/o for logic types

library std;
use std.textio.all;                     -- basic i/o

entity test_harness is
end test_harness;

architecture rtl of test_harness is

    signal clock_27        : std_logic := '0';
    signal hdmi_red        : std_logic_vector(7 downto 0) := x"00";
    signal hdmi_green      : std_logic_vector(7 downto 0) := x"00";
    signal hdmi_blue       : std_logic_vector(7 downto 0) := x"00";
    signal hdmi_hsync      : std_logic := '0';
    signal hdmi_vsync      : std_logic := '0';
    signal hdmi_blank      : std_logic := '0';
    signal hsync           : std_logic := '1';
    signal vsync           : std_logic := '1';
    signal hsync1          : std_logic := '1';
    signal vsync1          : std_logic := '1';
    signal hcnt            : std_logic_vector(9 downto 0) := "0000000000";
    signal vcnt            : std_logic_vector(9 downto 0) := "0000000000";

    signal tdms_r          : std_logic_vector(9 downto 0);
    signal tdms_g          : std_logic_vector(9 downto 0);
    signal tdms_b          : std_logic_vector(9 downto 0);

    signal tdms            : std_logic_vector(31 downto 0);
begin

    -- Clock process definitions
    process
    begin
        clock_27 <= '0';
        wait for 18.5185 ns;
        clock_27 <= '1';
        wait for 18.5185 ns;
    end process;

    -- logging process
    process (clock_27) is
        variable line_v   : line;
        file     out_file : text open write_mode is "out.txt";
    begin
        if rising_edge(clock_27) then
--            hwrite(line_v, tdms(7 downto 0) & tdms(15 downto 8) & tdms(23 downto 16) & tdms(31 downto 24));
            hwrite(line_v, tdms);
            writeline(out_file, line_v);
        end if;
    end process;

    -- Stimulus process
    process
    begin


        -- Modeline "720x576 @ 50hz"  27    720   732   796   864   576   581   586   625

        for f in 0 to 1 loop
            for v in 0 to 624 loop
                report "line " & integer'image(v);
                for h in 0 to 863 loop
                    wait until falling_edge(clock_27);
                    if h = 732 then
                        hsync <= '0';
                    end if;
                    if h = 796 then
                        hsync <= '1';
                        if v = 581 then
                            vsync <= '0';
                        end if;
                        if v = 586 then
                            vsync <= '1';
                        end if;
                    end if;
                end loop;
            end loop;
        end loop;

        -- end the simulation
        assert false
            report "simulation ended"
            severity failure;

    end process;

    process(clock_27)
    begin
        if rising_edge(clock_27) then
            hsync1 <= hsync;
            if hsync1 = '0' and hsync = '1' then
                hcnt <= (others => '0');
                vsync1 <= vsync;
                if vsync1 = '0' and vsync = '1' then
                    vcnt <= (others => '0');
                else
                    vcnt <= vcnt + 1;
                end if;
            else
                hcnt <= hcnt + 1;
            end if;
            if hcnt < 68 or hcnt >= 68 + 720 or vcnt < 39 or vcnt >= 39 + 576 then
                hdmi_blank <= '1';
                hdmi_red   <= x"00";
                hdmi_green <= x"00";
                hdmi_blue  <= x"00";
            else
                hdmi_blank <= '0';

                if hcnt = 68 or hcnt = 68 + 719 or vcnt = 39 or vcnt = 39 + 575 then
                    hdmi_red   <= x"00";
                    hdmi_green <= x"FF";
                    hdmi_blue  <= x"00";
                else
                    hdmi_red   <= x"80";
                    hdmi_green <= x"80";
                    hdmi_blue  <= x"80";
                end if;
            end if;
            if hcnt >= 732 + 68 then -- 800
                hdmi_hsync <= '0';
                if vcnt >= 581 + 39 then -- 620
                    hdmi_vsync <= '0';
                else
                    hdmi_vsync <= '1';
                end if;
            else
                hdmi_hsync <= '1';
            end if;
        end if;
    end process;

    inst_hdmi: entity work.hdmi
    generic map (
      FREQ => 27000000,  -- pixel clock frequency
      --FS   => 48000,   -- audio sample rate - should be 32000, 44100 or 48000
      --CTS  => 27000,   -- CTS = Freq(pixclk) * N / (128 * Fs)
      --N    => 6144     -- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300
      FS   => 32000,     -- audio sample rate - should be 32000, 44100 or 48000
      CTS  => 27000,     -- CTS = Freq(pixclk) * N / (128 * Fs)
      N    => 4096       -- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300
    )
    port map (
      -- clocks
      I_CLK_PIXEL      => clock_27,
      -- components
      I_R              => hdmi_red,
      I_G              => hdmi_green,
      I_B              => hdmi_blue,
      I_BLANK          => hdmi_blank,
      I_HSYNC          => hdmi_hsync,
      I_VSYNC          => hdmi_vsync,
      -- PCM audio
      I_AUDIO_ENABLE   => '0',
      I_AUDIO_PCM_L    => (others => '0'),
      I_AUDIO_PCM_R    => (others => '0'),
      -- TMDS parallel pixel synchronous outputs (serialize LSB first)
      O_RED            => tdms_r,
      O_GREEN          => tdms_g,
      O_BLUE           => tdms_b
      );

    tdms <= "00" & tdms_r & tdms_g & tdms_b;
end;
